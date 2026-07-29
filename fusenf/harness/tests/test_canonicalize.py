"""§7 exit criteria for ``canonicalize.py`` (canonicalization.md).

All eight tests from the spec, plus parser/bucket unit tests.  Fixtures are
hand-built here so the suite has no data dependency beyond ``vocabulary.json``.

Run directly::

    /home/manhin/Dev/.venv-dev/bin/python fusenf/harness/tests/test_canonicalize.py

or under pytest.
"""

from __future__ import annotations

import itertools
import os
import sys
import unittest

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import canonicalize as C  # noqa: E402


# --------------------------------------------------------------------------
# fixtures
# --------------------------------------------------------------------------


def rec(statements, **kw):
    out = {
        "schema": "fusenf-parse/1",
        "id": kw.pop("id", "tierT-000001"),
        "run": kw.pop("run", 1),
        "sentences": kw.pop("sentences", ["--"]),
        "context": {"today": None, "domain": None, "prior": [], "notes": None},
        "statements": list(statements),
    }
    out.update(kw)
    return out


# schema.md §3 worked example
MARIA_DROVE = [
    '(: maria_drove (Member sk_drive_1 drive) (STV 1.0 0.99))',
    '(: drove_agent (Agent sk_drive_1 maria) (STV 1.0 0.99))',
    '(: maria_name (Name maria "Maria") (STV 1.0 0.99))',
    '(: drove_goal (Goal sk_drive_1 sk_store_1) (STV 1.0 0.99))',
    '(: drove_past (Past sk_drive_1) (STV 1.0 0.99))',
]

# same graph, skolem stems and indices changed (α-renaming)
MARIA_DROVE_ALPHA = [
    '(: maria_drove (Member sk_drive_7 drive) (STV 1.0 0.99))',
    '(: drove_agent (Agent sk_drive_7 maria) (STV 1.0 0.99))',
    '(: maria_name (Name maria "Maria") (STV 1.0 0.99))',
    '(: drove_goal (Goal sk_drive_7 sk_zzz_2) (STV 1.0 0.99))',
    '(: drove_past (Past sk_drive_7) (STV 1.0 0.99))',
]

# same graph, every proof name different
MARIA_DROVE_PROOFS = [
    '(: p1 (Member sk_drive_1 drive) (STV 1.0 0.99))',
    '(: p2 (Agent sk_drive_1 maria) (STV 1.0 0.99))',
    '(: p3 (Name maria "Maria") (STV 1.0 0.99))',
    '(: p4 (Goal sk_drive_1 sk_store_1) (STV 1.0 0.99))',
    '(: p5 (Past sk_drive_1) (STV 1.0 0.99))',
]

# "Two dogs barked." — two structurally identical witnesses (§4.3 symmetry)
TWO_DOGS = [
    '(: d1 (Member sk_dog_1 dog) (STV 1.0 0.99))',
    '(: d2 (Member sk_dog_2 dog) (STV 1.0 0.99))',
    '(: b1 (Member sk_bark_1 bark) (STV 1.0 0.99))',
    '(: b1_ag (Agent sk_bark_1 sk_dog_1) (STV 1.0 0.99))',
    '(: b1_past (Past sk_bark_1) (STV 1.0 0.99))',
    '(: b2 (Member sk_bark_2 bark) (STV 1.0 0.99))',
    '(: b2_ag (Agent sk_bark_2 sk_dog_2) (STV 1.0 0.99))',
    '(: b2_past (Past sk_bark_2) (STV 1.0 0.99))',
]

# the other possible emission order for the same two witnesses
TWO_DOGS_SWAPPED = [
    '(: d1 (Member sk_dog_2 dog) (STV 1.0 0.99))',
    '(: d2 (Member sk_dog_1 dog) (STV 1.0 0.99))',
    '(: b1 (Member sk_bark_2 bark) (STV 1.0 0.99))',
    '(: b1_ag (Agent sk_bark_2 sk_dog_2) (STV 1.0 0.99))',
    '(: b1_past (Past sk_bark_2) (STV 1.0 0.99))',
    '(: b2 (Member sk_bark_1 bark) (STV 1.0 0.99))',
    '(: b2_ag (Agent sk_bark_1 sk_dog_1) (STV 1.0 0.99))',
    '(: b2_past (Past sk_bark_1) (STV 1.0 0.99))',
]

# "Two dogs were chased." — the hard symmetry shape.  Here the atom that
# CORRELATES the two automorphic classes (Patient) sorts *after* both atoms
# that introduce their members (Member), so naming by first occurrence pairs
# them up inconsistently.  This is the case that needs §4.3 individualization;
# TWO_DOGS above does not, because (Agent e x) introduces both at once.
TWO_CHASED = [
    '(: d1 (Member sk_dog_1 dog) (STV 1.0 0.99))',
    '(: d2 (Member sk_dog_2 dog) (STV 1.0 0.99))',
    '(: c1 (Member sk_chase_1 chase) (STV 1.0 0.99))',
    '(: c2 (Member sk_chase_2 chase) (STV 1.0 0.99))',
    '(: c1_pat (Patient sk_chase_1 sk_dog_1) (STV 1.0 0.99))',
    '(: c2_pat (Patient sk_chase_2 sk_dog_2) (STV 1.0 0.99))',
]

TWO_CHASED_SWAPPED = [
    '(: d1 (Member sk_dog_2 dog) (STV 1.0 0.99))',
    '(: d2 (Member sk_dog_1 dog) (STV 1.0 0.99))',
    '(: c1 (Member sk_chase_2 chase) (STV 1.0 0.99))',
    '(: c2 (Member sk_chase_1 chase) (STV 1.0 0.99))',
    '(: c1_pat (Patient sk_chase_2 sk_dog_2) (STV 1.0 0.99))',
    '(: c2_pat (Patient sk_chase_1 sk_dog_1) (STV 1.0 0.99))',
]


def n_identical_witnesses(n):
    """n structurally identical barking dogs — drives the §4.3 K threshold."""
    out = []
    for i in range(1, n + 1):
        out.append('(: d%d (Member sk_dog_%d dog) (STV 1.0 0.99))' % (i, i))
        out.append('(: b%d (Member sk_bark_%d bark) (STV 1.0 0.99))' % (i, i))
        out.append('(: p%d (Patient sk_bark_%d sk_dog_%d) (STV 1.0 0.99))' % (i, i, i))
    return out


# "Maria pushed Tom." — base for the near-miss family
PUSH = [
    '(: e (Member sk_push_1 push) (STV 1.0 0.99))',
    '(: e_ag (Agent sk_push_1 maria) (STV 1.0 0.99))',
    '(: e_pat (Patient sk_push_1 tom) (STV 1.0 0.99))',
    '(: e_past (Past sk_push_1) (STV 1.0 0.99))',
    '(: n1 (Name maria "Maria") (STV 1.0 0.99))',
    '(: n2 (Name tom "Tom") (STV 1.0 0.99))',
]

# near-miss: participants swapped ("Tom pushed Maria")
PUSH_PARTICIPANT_SWAP = [
    '(: e (Member sk_push_1 push) (STV 1.0 0.99))',
    '(: e_ag (Agent sk_push_1 tom) (STV 1.0 0.99))',
    '(: e_pat (Patient sk_push_1 maria) (STV 1.0 0.99))',
    '(: e_past (Past sk_push_1) (STV 1.0 0.99))',
    '(: n1 (Name maria "Maria") (STV 1.0 0.99))',
    '(: n2 (Name tom "Tom") (STV 1.0 0.99))',
]

# On a two-role event, "swap the participants" and "swap the Agent/Patient
# labels" are the *same* graph — so the role-swap control needs a third role to
# be a distinct near-miss.  "Tom sent Grace a letter."
SEND = [
    '(: e (Member sk_send_1 send) (STV 1.0 0.99))',
    '(: e_ag (Agent sk_send_1 tom) (STV 1.0 0.99))',
    '(: e_rec (Recipient sk_send_1 grace) (STV 1.0 0.99))',
    '(: e_th (Theme sk_send_1 sk_letter_1) (STV 1.0 0.99))',
    '(: l (Member sk_letter_1 letter) (STV 1.0 0.99))',
    '(: e_past (Past sk_send_1) (STV 1.0 0.99))',
    '(: n1 (Name tom "Tom") (STV 1.0 0.99))',
    '(: n2 (Name grace "Grace") (STV 1.0 0.99))',
]

# near-miss: Recipient <-> Theme relabelled on the same participants
SEND_ROLE_SWAP = [
    '(: e (Member sk_send_1 send) (STV 1.0 0.99))',
    '(: e_ag (Agent sk_send_1 tom) (STV 1.0 0.99))',
    '(: e_rec (Theme sk_send_1 grace) (STV 1.0 0.99))',
    '(: e_th (Recipient sk_send_1 sk_letter_1) (STV 1.0 0.99))',
    '(: l (Member sk_letter_1 letter) (STV 1.0 0.99))',
    '(: e_past (Past sk_send_1) (STV 1.0 0.99))',
    '(: n1 (Name tom "Tom") (STV 1.0 0.99))',
    '(: n2 (Name grace "Grace") (STV 1.0 0.99))',
]

# near-miss: Agent <-> Recipient relabelled ("Grace sent Tom a letter" reading)
SEND_AGENT_RECIPIENT_SWAP = [
    '(: e (Member sk_send_1 send) (STV 1.0 0.99))',
    '(: e_ag (Recipient sk_send_1 tom) (STV 1.0 0.99))',
    '(: e_rec (Agent sk_send_1 grace) (STV 1.0 0.99))',
    '(: e_th (Theme sk_send_1 sk_letter_1) (STV 1.0 0.99))',
    '(: l (Member sk_letter_1 letter) (STV 1.0 0.99))',
    '(: e_past (Past sk_send_1) (STV 1.0 0.99))',
    '(: n1 (Name tom "Tom") (STV 1.0 0.99))',
    '(: n2 (Name grace "Grace") (STV 1.0 0.99))',
]

# near-miss: added negation (strength 1.0 -> 0.0 on the event)
PUSH_NEGATED = [
    '(: e (Member sk_push_1 push) (STV 0.0 0.99))',
    '(: e_ag (Agent sk_push_1 maria) (STV 1.0 0.99))',
    '(: e_pat (Patient sk_push_1 tom) (STV 1.0 0.99))',
    '(: e_past (Past sk_push_1) (STV 1.0 0.99))',
    '(: n1 (Name maria "Maria") (STV 1.0 0.99))',
    '(: n2 (Name tom "Tom") (STV 1.0 0.99))',
]

# near-miss: antonym swap
TALL = ['(: t (Member maria tall) (STV 1.0 0.99))',
        '(: n (Name maria "Maria") (STV 1.0 0.99))']
SHORT = ['(: t (Member maria short) (STV 1.0 0.99))',
         '(: n (Name maria "Maria") (STV 1.0 0.99))']

# surface-record-only difference: "all lions" vs "every lion"
LIONS_ALL = [
    '(: l (Inheritance lion fierce) (STV 1.0 0.9))',
    '(: lq (QuantifierPhrase lion fierce "all") (STV 1.0 0.99))',
]
LIONS_EVERY = [
    '(: l (Inheritance lion fierce) (STV 1.0 0.9))',
    '(: lq (QuantifierPhrase lion fierce "every") (STV 1.0 0.99))',
]

# surface-record-only difference: the recorded surface spelling of a name
NAME_A = ['(: m (Member maria pilot) (STV 1.0 0.99))',
          '(: n (Name maria "Maria") (STV 1.0 0.99))']
NAME_B = ['(: m (Member maria pilot) (STV 1.0 0.99))',
          '(: n (Name maria "Maria Elena") (STV 1.0 0.99))']

# empirical generic, for TV jitter
GULLS_09 = ['(: g (Inheritance gull loud) (STV 0.9 0.9))']
GULLS_088 = ['(: g (Inheritance gull loud) (STV 0.88 0.9))']
GULLS_00 = ['(: g (Inheritance gull loud) (STV 0.0 0.9))']

# structured terms + an opaque connective head
MEETING = [
    '(: e1 (Member sk_meet_1 meet) (STV 1.0 0.99))',
    '(: e1_ag (Agent sk_meet_1 maria) (STV 1.0 0.99))',
    '(: e1_t (Time sk_meet_1 (Year 2020)) (STV 1.0 0.99))',
    '(: e1_past (Past sk_meet_1) (STV 1.0 0.99))',
    '(: e2 (Member sk_rain_1 rain) (STV 1.0 0.99))',
    '(: e2_past (Past sk_rain_1) (STV 1.0 0.99))',
    '(: conn (Because sk_meet_1 sk_rain_1) (STV 1.0 0.99))',
]

# a rule: group + distribution rule with a skolem function (prompt [dist-grouped])
DOGS_GROUP = [
    '(: g (GroupOf sk_group_1 dog) (STV 1.0 0.99))',
    '(: gc (CardinalityPhrase sk_group_1 "several") (STV 1.0 0.99))',
    '(: eb (Member sk_bark_1 bark) (STV 1.0 0.99))',
    '(: eb_ag (Agent sk_bark_1 sk_group_1) (STV 1.0 0.99))',
    '(: eb_past (Past sk_bark_1) (STV 1.0 0.99))',
    '(: r (Implication (Premises (PartOf $x sk_group_1))'
    ' (Conclusions (Member (sk_bark $x) bark) (Agent (sk_bark $x) $x)'
    ' (Past (sk_bark $x)))) (STV 1.0 0.9))',
    '(: f1 (Member fido dog) (STV 1.0 0.99))',
    '(: f2 (PartOf fido sk_group_1) (STV 1.0 0.99))',
    '(: f3 (Name fido "Fido") (STV 1.0 0.99))',
]

# the same rule with different variable letters and a shuffled conclusion order
DOGS_GROUP_ALPHA = [
    '(: g (GroupOf sk_grp_9 dog) (STV 1.0 0.99))',
    '(: gc (CardinalityPhrase sk_grp_9 "several") (STV 1.0 0.99))',
    '(: eb (Member sk_bark_4 bark) (STV 1.0 0.99))',
    '(: eb_ag (Agent sk_bark_4 sk_grp_9) (STV 1.0 0.99))',
    '(: eb_past (Past sk_bark_4) (STV 1.0 0.99))',
    '(: r (Implication (Premises (PartOf $z sk_grp_9))'
    ' (Conclusions (Past (sk_bark $z)) (Agent (sk_bark $z) $z)'
    ' (Member (sk_bark $z) bark))) (STV 1.0 0.9))',
    '(: f1 (Member fido dog) (STV 1.0 0.99))',
    '(: f2 (PartOf fido sk_grp_9) (STV 1.0 0.99))',
    '(: f3 (Name fido "Fido") (STV 1.0 0.99))',
]

# A rule whose inequality guard puts a variable in HEAD position:
# (Compute == ($x $y) -> false).  Both occurrences of $x are the same variable.
RIVALS = [
    '(: finalists_rivals (Implication'
    ' (Premises (Member $x finalist) (Member $y finalist)'
    ' (Compute == ($x $y) -> false))'
    ' (Conclusions (Rival $x $y))) (STV 1.0 0.9))',
    '(: sym (Symmetric Rival) (STV 1.0 0.99))',
]

RIVALS_ALPHA = [
    '(: finalists_rivals (Implication'
    ' (Premises (Member $aaa finalist) (Member $bbb finalist)'
    ' (Compute == ($aaa $bbb) -> false))'
    ' (Conclusions (Rival $aaa $bbb))) (STV 1.0 0.9))',
    '(: sym (Symmetric Rival) (STV 1.0 0.99))',
]

ALL_FIXTURES = {
    "maria_drove": MARIA_DROVE,
    "two_dogs": TWO_DOGS,
    "two_chased": TWO_CHASED,
    "push": PUSH,
    "push_negated": PUSH_NEGATED,
    "send": SEND,
    "send_role_swap": SEND_ROLE_SWAP,
    "lions_all": LIONS_ALL,
    "meeting": MEETING,
    "dogs_group": DOGS_GROUP,
    "tall": TALL,
    "rivals": RIVALS,
}


def orderings(n):
    """A deterministic, order-sensitivity-focused set of permutations.

    No RNG: exhaustive for small n, otherwise identity + reversal + every
    rotation + every pairwise transposition + the two interleaves.  Pairwise
    transpositions are the probe that actually catches a stable-sort tie-break
    leaking input order into the output.
    """
    idx = list(range(n))
    if n <= 6:
        return [list(p) for p in itertools.permutations(idx)]
    out = [list(idx), list(reversed(idx))]
    for k in range(1, n):
        out.append(idx[k:] + idx[:k])
    for i in range(n):
        for j in range(i + 1, n):
            p = list(idx)
            p[i], p[j] = p[j], p[i]
            out.append(p)
    out.append(idx[0::2] + idx[1::2])
    out.append(idx[1::2] + idx[0::2])
    return out


def hashes(record, **kw):
    canon = C.canonicalize(record, **kw)
    return (canon["graph_id"], canon["shape_id"], canon["content_id"])


# --------------------------------------------------------------------------
# §7 tests
# --------------------------------------------------------------------------


class Test01OrderInvariance(unittest.TestCase):
    """§7.1 — shuffling `statements` leaves all three hashes unchanged."""

    def test_all_fixtures_under_all_orderings(self):
        for name, statements in sorted(ALL_FIXTURES.items()):
            base = hashes(rec(statements))
            base_lin = C.canonicalize(rec(statements))["linearization"]
            for perm in orderings(len(statements)):
                shuffled = [statements[i] for i in perm]
                canon = C.canonicalize(rec(shuffled))
                self.assertEqual(
                    (canon["graph_id"], canon["shape_id"], canon["content_id"]),
                    base,
                    "%s changed hash under ordering %s" % (name, perm),
                )
                self.assertEqual(canon["linearization"], base_lin, name)


class Test02AlphaInvariance(unittest.TestCase):
    """§7.2 — consistently renaming skolems leaves the hashes unchanged."""

    def test_skolem_index_and_stem(self):
        self.assertEqual(hashes(rec(MARIA_DROVE)), hashes(rec(MARIA_DROVE_ALPHA)))

    def test_stem_does_not_leak_into_identity(self):
        # §4.1: the sk_<verb>_<n> stem is parser-chosen and must not be seeded
        # into the labelling.  sk_store_1 -> sk_zzz_2 changes the stem's sort
        # position; the hash must not move.
        canon = C.canonicalize(rec(MARIA_DROVE))
        canon_alpha = C.canonicalize(rec(MARIA_DROVE_ALPHA))
        self.assertEqual(canon["linearization"], canon_alpha["linearization"])

    def test_rule_variables_and_skolem_functions(self):
        # rule-local variable namespace (§4.4) + skolem-function renaming (§4.2),
        # with the conclusion conjuncts emitted in a different order
        self.assertEqual(hashes(rec(DOGS_GROUP)), hashes(rec(DOGS_GROUP_ALPHA)))

    def test_variable_in_head_position(self):
        # (Compute == ($x $y) -> false) — a variable can head a term.  It must
        # be renamed there too, or the rule keeps its parser-chosen letters.
        self.assertEqual(hashes(rec(RIVALS)), hashes(rec(RIVALS_ALPHA)))
        canon = C.canonicalize(rec(RIVALS))
        rule = [a["term"] for a in canon["atoms"] if a["term"].startswith("(Implication")][0]
        self.assertNotIn("$x", rule)
        self.assertNotIn("$y", rule)
        self.assertIn("($v0 $v1)", rule)

    def test_renaming_map_is_reported(self):
        canon = C.canonicalize(rec(MARIA_DROVE))
        self.assertEqual(canon["renaming"]["sk_drive_1"], "e0")
        self.assertIn(canon["renaming"]["sk_store_1"], ("x0",))


class Test03ProofNameInvariance(unittest.TestCase):
    """§7.3 — renaming proof names leaves the hashes unchanged."""

    def test_proof_names_stripped_from_identity(self):
        self.assertEqual(hashes(rec(MARIA_DROVE)), hashes(rec(MARIA_DROVE_PROOFS)))

    def test_proof_names_retained_positionally(self):
        canon = C.canonicalize(rec(MARIA_DROVE))
        self.assertEqual(
            sorted(a["proof_name"] for a in canon["atoms"]),
            ["drove_agent", "drove_goal", "drove_past", "maria_drove", "maria_name"],
        )


class Test04TVJitter(unittest.TestCase):
    """§7.4 — `0.9 -> 0.88` leaves `graph_id` unchanged; `0.9 -> 0.0` changes it.

    NOTE — this is the one place where §4.6 and §7.4 pull against each other.
    §4.6 says bucketing is NOT implemented initially and `graph_id` uses exact
    truth values; §7.4 asserts jitter-invariance, which only bucketing can
    give.  Both halves are asserted below rather than weakening either: the
    spec's contract holds with bucketing on, and the shipped default (exact
    TVs) is pinned as its own assertion so the divergence is visible.
    """

    def test_jitter_invariance_with_bucketing_on(self):
        a = hashes(rec(GULLS_09), bucket_tv=True)
        b = hashes(rec(GULLS_088), bucket_tv=True)
        self.assertEqual(a[0], b[0], "0.9 -> 0.88 must not move graph_id")

    def test_polarity_flip_changes_graph_id_with_bucketing_on(self):
        a = hashes(rec(GULLS_09), bucket_tv=True)
        c = hashes(rec(GULLS_00), bucket_tv=True)
        self.assertNotEqual(a[0], c[0], "0.9 -> 0.0 must move graph_id")

    def test_default_uses_exact_truth_values(self):
        # §4.6 as shipped: bucketing is off, so jitter DOES move graph_id.
        self.assertFalse(C.BUCKET_TV_IN_HASHES)
        a = hashes(rec(GULLS_09))
        b = hashes(rec(GULLS_088))
        c = hashes(rec(GULLS_00))
        self.assertNotEqual(a[0], b[0])
        self.assertNotEqual(a[0], c[0])

    def test_shape_id_ignores_truth_values_entirely(self):
        self.assertEqual(hashes(rec(GULLS_09))[1], hashes(rec(GULLS_00))[1])

    def test_raw_stv_is_retained(self):
        canon = C.canonicalize(rec(GULLS_088), bucket_tv=True)
        self.assertEqual(canon["atoms"][0]["stv"], [0.88, 0.9])
        self.assertEqual(canon["atoms"][0]["bucket"], ["high", "emp"])


class Test05Symmetry(unittest.TestCase):
    """§7.5 — identical witnesses canonicalize deterministically and both
    emission orders agree."""

    def test_two_emission_orders_agree(self):
        a = C.canonicalize(rec(TWO_DOGS))
        b = C.canonicalize(rec(TWO_DOGS_SWAPPED))
        self.assertEqual(a["linearization"], b["linearization"])
        self.assertEqual(hashes(rec(TWO_DOGS)), hashes(rec(TWO_DOGS_SWAPPED)))

    def test_two_emission_orders_agree_when_the_link_atom_sorts_late(self):
        # The shape that forced §4.3: the correlating atom (Patient) sorts after
        # both introducing atoms (Member), so first-occurrence naming alone pairs
        # the automorphic classes inconsistently.
        a = C.canonicalize(rec(TWO_CHASED))
        b = C.canonicalize(rec(TWO_CHASED_SWAPPED))
        self.assertEqual(a["linearization"], b["linearization"])
        self.assertEqual(hashes(rec(TWO_CHASED)), hashes(rec(TWO_CHASED_SWAPPED)))

    def test_symmetric_fixtures_are_invariant_over_every_ordering(self):
        for name, statements in (("two_chased", TWO_CHASED), ("two_dogs", TWO_DOGS)):
            base = C.canonicalize(rec(statements))["graph_id"]
            for perm in orderings(len(statements)):
                got = C.canonicalize(rec([statements[i] for i in perm]))["graph_id"]
                self.assertEqual(got, base, "%s under %s" % (name, perm))

    def test_deterministic_across_repeated_runs(self):
        first = C.canonicalize(rec(TWO_DOGS))["graph_id"]
        for _ in range(5):
            self.assertEqual(C.canonicalize(rec(TWO_DOGS))["graph_id"], first)

    def test_both_witnesses_are_present_and_distinct(self):
        canon = C.canonicalize(rec(TWO_DOGS))
        terms = [a["term"] for a in canon["atoms"]]
        self.assertIn("(Agent e0 x0)", terms)
        self.assertIn("(Agent e1 x1)", terms)
        self.assertEqual(canon["stats"]["skolems"], 4)

    def test_symmetry_is_exact_within_K_and_reported(self):
        # §4.3: <= K members -> branch-and-keep-minimum, deterministic AND exact.
        for statements in (TWO_DOGS, TWO_CHASED):
            canon = C.canonicalize(rec(statements))
            self.assertTrue(canon["exact"])
            self.assertEqual(canon["stats"]["symmetric_classes"], 2)
            self.assertEqual(canon["stats"]["max_symmetric_class"], 2)
        clean = C.canonicalize(rec(MARIA_DROVE))
        self.assertTrue(clean["exact"])
        self.assertEqual(clean["stats"]["symmetric_classes"], 0)

    def test_beyond_K_falls_back_and_is_marked_inexact(self):
        # §4.3: > K members -> bounded heuristic, exact: false, excluded from
        # M1's identity numerator and reported separately.
        self.assertEqual(C.SYMMETRY_K, 6)
        within = C.canonicalize(rec(n_identical_witnesses(C.SYMMETRY_K)))
        self.assertTrue(within["exact"])
        beyond = C.canonicalize(rec(n_identical_witnesses(C.SYMMETRY_K + 1)))
        self.assertFalse(beyond["exact"])
        self.assertEqual(beyond["stats"]["max_symmetric_class"], C.SYMMETRY_K + 1)
        # still deterministic, just not certified
        self.assertEqual(
            beyond["graph_id"],
            C.canonicalize(rec(n_identical_witnesses(C.SYMMETRY_K + 1)))["graph_id"],
        )


class Test06Discrimination(unittest.TestCase):
    """§7.6 — near-miss pairs must hash differently under `graph_id`."""

    def _assert_differs(self, label, left, right):
        a = C.canonicalize(rec(left))
        b = C.canonicalize(rec(right))
        self.assertNotEqual(a["graph_id"], b["graph_id"], "over-merged: " + label)

    def test_participant_swap(self):
        self._assert_differs("participant swap", PUSH, PUSH_PARTICIPANT_SWAP)

    def test_role_swap(self):
        self._assert_differs("role swap Recipient<->Theme", SEND, SEND_ROLE_SWAP)
        self._assert_differs(
            "role swap Agent<->Recipient", SEND, SEND_AGENT_RECIPIENT_SWAP
        )

    def test_two_role_event_conflates_participant_and_role_swap_by_construction(self):
        # Not a canonicalizer property: on a single Agent/Patient pair, relabelling
        # the roles and swapping the participants denote the same graph, so they
        # MUST hash the same.  Pinned so the role-swap control is never quietly
        # weakened back into a duplicate of the participant-swap control.
        relabelled = [
            '(: e (Member sk_push_1 push) (STV 1.0 0.99))',
            '(: e_ag (Patient sk_push_1 maria) (STV 1.0 0.99))',
            '(: e_pat (Agent sk_push_1 tom) (STV 1.0 0.99))',
            '(: e_past (Past sk_push_1) (STV 1.0 0.99))',
            '(: n1 (Name maria "Maria") (STV 1.0 0.99))',
            '(: n2 (Name tom "Tom") (STV 1.0 0.99))',
        ]
        self.assertEqual(
            C.canonicalize(rec(relabelled))["graph_id"],
            C.canonicalize(rec(PUSH_PARTICIPANT_SWAP))["graph_id"],
        )

    def test_added_negation(self):
        self._assert_differs("added negation", PUSH, PUSH_NEGATED)

    def test_antonym(self):
        self._assert_differs("antonym", TALL, SHORT)

    def test_added_atom(self):
        self._assert_differs(
            "dropped atom", PUSH, [s for s in PUSH if "Past" not in s]
        )

    def test_negation_crosses_a_band_under_bucketing(self):
        # §4.6's claim: a negative control cannot be laundered into a paraphrase
        # by bucketing.
        a = C.canonicalize(rec(PUSH), bucket_tv=True)
        b = C.canonicalize(rec(PUSH_NEGATED), bucket_tv=True)
        self.assertNotEqual(a["graph_id"], b["graph_id"])

    def test_all_near_misses_are_pairwise_distinct(self):
        variants = [
            PUSH, PUSH_PARTICIPANT_SWAP, PUSH_NEGATED, TALL, SHORT,
            SEND, SEND_ROLE_SWAP, SEND_AGENT_RECIPIENT_SWAP,
        ]
        ids = [C.canonicalize(rec(v))["graph_id"] for v in variants]
        self.assertEqual(len(set(ids)), len(variants))

    def test_soft_jaccard_ranks_near_miss_below_identity(self):
        base = C.canonicalize(rec(PUSH))
        same = C.canonicalize(rec(MARIA_DROVE_PROOFS))
        swap = C.canonicalize(rec(PUSH_PARTICIPANT_SWAP))
        self.assertEqual(C.soft_jaccard(base, base), 1.0)
        self.assertLess(C.soft_jaccard(base, swap), 1.0)
        self.assertGreater(C.soft_jaccard(base, swap), C.soft_jaccard(base, same))


class Test07Idempotence(unittest.TestCase):
    """§7.7 — canonicalizing a canonical record is a fixed point."""

    def test_fixed_point_on_every_fixture(self):
        for name, statements in sorted(ALL_FIXTURES.items()):
            once = C.canonicalize(rec(statements))
            twice = C.canonicalize(once)
            self.assertEqual(once["linearization"], twice["linearization"], name)
            self.assertEqual(once["graph_id"], twice["graph_id"], name)
            self.assertEqual(once["shape_id"], twice["shape_id"], name)
            self.assertEqual(once["content_id"], twice["content_id"], name)
            self.assertEqual(
                [(a["term"], a["stv"]) for a in once["atoms"]],
                [(a["term"], a["stv"]) for a in twice["atoms"]],
                name,
            )
            self.assertEqual(once["stars"], twice["stars"], name)
            self.assertEqual(once["exact"], twice["exact"], name)

    def test_third_application_still_stable(self):
        once = C.canonicalize(rec(DOGS_GROUP))
        thrice = C.canonicalize(C.canonicalize(C.canonicalize(once)))
        self.assertEqual(once["graph_id"], thrice["graph_id"])

    def test_renaming_becomes_the_identity(self):
        once = C.canonicalize(rec(MARIA_DROVE))
        twice = C.canonicalize(once)
        self.assertTrue(all(k == v for k, v in twice["renaming"].items()))


class Test08ProjectionSanity(unittest.TestCase):
    """§7.8 — `content_id` equal while `graph_id` differs happens exactly on
    pairs differing only in surface-record atoms."""

    PAIRS = [
        # (label, left, right, differs_only_in_surface_record)
        ("quantifier word", LIONS_ALL, LIONS_EVERY, True),
        ("recorded name string", NAME_A, NAME_B, True),
        ("identical", PUSH, PUSH, False),
        ("participant swap", PUSH, PUSH_PARTICIPANT_SWAP, False),
        ("role swap", SEND, SEND_ROLE_SWAP, False),
        ("added negation", PUSH, PUSH_NEGATED, False),
        ("antonym", TALL, SHORT, False),
    ]

    def test_biconditional(self):
        for label, left, right, surface_only in self.PAIRS:
            a = C.canonicalize(rec(left))
            b = C.canonicalize(rec(right))
            content_equal = a["content_id"] == b["content_id"]
            graph_differs = a["graph_id"] != b["graph_id"]
            observed = content_equal and graph_differs
            self.assertEqual(
                observed,
                surface_only,
                "%s: content_eq=%s graph_diff=%s, expected surface-only=%s"
                % (label, content_equal, graph_differs, surface_only),
            )

    def test_identical_records_agree_on_all_three(self):
        a = C.canonicalize(rec(PUSH))
        b = C.canonicalize(rec(PUSH))
        self.assertEqual(a["graph_id"], b["graph_id"])
        self.assertEqual(a["content_id"], b["content_id"])
        self.assertEqual(a["shape_id"], b["shape_id"])

    def test_surface_record_atoms_are_retained_in_atoms(self):
        canon = C.canonicalize(rec(LIONS_ALL))
        self.assertIn(
            '(QuantifierPhrase lion fierce "all")', [a["term"] for a in canon["atoms"]]
        )


# --------------------------------------------------------------------------
# supporting unit tests
# --------------------------------------------------------------------------


class TestParseStatement(unittest.TestCase):
    def test_basic(self):
        got = C.parse_statement("(: maria_drove (Member sk_drive_1 drive) (STV 1.0 0.99))")
        self.assertEqual(got["proof_name"], "maria_drove")
        self.assertEqual(got["term"], ["Member", "sk_drive_1", "drive"])
        self.assertEqual(got["stv"], (1.0, 0.99))

    def test_string_literal_and_nesting(self):
        got = C.parse_statement('(: n (Name new_york "New York City") (STV 1.0 0.99))')
        self.assertEqual(got["term"], ["Name", "new_york", '"New York City"'])

    def test_structured_term(self):
        got = C.parse_statement("(: t (Time sk_e_1 (Year 2020)) (STV 1.0 0.99))")
        self.assertEqual(got["term"], ["Time", "sk_e_1", ["Year", "2020"]])
        self.assertEqual(C.linearize_term(got["term"]), "(Time sk_e_1 (Year 2020))")

    def test_rule(self):
        got = C.parse_statement(
            "(: r (Implication (Premises (Member $x fish))"
            " (Conclusions (Member (sk_swim $x) swim))) (STV 0.9 0.9))"
        )
        self.assertEqual(got["term"][0], "Implication")
        self.assertEqual(got["term"][2], ["Conclusions", ["Member", ["sk_swim", "$x"], "swim"]])

    def test_whitespace_and_newlines(self):
        got = C.parse_statement("(:  p\n   (Past   sk_e_1)\n  (STV 1.0 0.99) )")
        self.assertEqual(got["term"], ["Past", "sk_e_1"])

    def test_malformed(self):
        bad = [
            "",
            "not an s-expression",
            "(: p (Past sk_e_1) (STV 1.0 0.99)",  # unbalanced
            "(: p (Past sk_e_1) (STV 1.0 0.99)))",  # stray text
            "(: p (Past sk_e_1))",  # no STV
            "(: p (Past sk_e_1) (TV 1.0 0.99))",  # wrong TV head
            "(: p (Past sk_e_1) (STV 1.0))",  # STV arity
            "(: p (Past sk_e_1) (STV high 0.99))",  # non-numeric
            "(: p () (STV 1.0 0.99))",  # empty expression
            '(: p (Name maria "unterminated) (STV 1.0 0.99))',
            "(p (Past sk_e_1) (STV 1.0 0.99))",  # missing ':'
            "(: p sk_e_1 (STV 1.0 0.99))",  # content is not an s-expression
        ]
        for text in bad:
            with self.assertRaises(ValueError, msg=repr(text)):
                C.parse_statement(text)

    def test_non_string_input(self):
        with self.assertRaises(ValueError):
            C.parse_statement(None)


class TestBucketing(unittest.TestCase):
    """§4.6 — written and tested, unused by the hashes at the default flag."""

    ATTESTED = {
        (1.0, 0.99): ("full", "def"),
        (0.0, 0.99): ("zero", "def"),
        (0.9, 0.9): ("high", "emp"),
        (1.0, 0.9): ("full", "emp"),
        (0.3, 0.9): ("low", "emp"),
        (0.0, 0.9): ("zero", "emp"),
        (0.1, 0.9): ("low", "emp"),
    }

    def test_attested_distribution(self):
        for (s, c), expected in sorted(self.ATTESTED.items()):
            self.assertEqual(C.bucket_stv(s, c), expected, (s, c))

    def test_seven_attested_values_land_in_six_buckets(self):
        buckets = {C.bucket_stv(s, c) for s, c in self.ATTESTED}
        self.assertEqual(len(buckets), 6)

    def test_band_boundaries(self):
        self.assertEqual(C.bucket_stv(0.0, 0.0)[0], "zero")
        self.assertEqual(C.bucket_stv(0.099, 0.5)[0], "zero")
        self.assertEqual(C.bucket_stv(0.1, 0.5)[0], "low")
        self.assertEqual(C.bucket_stv(0.499, 0.5)[0], "low")
        self.assertEqual(C.bucket_stv(0.5, 0.5)[0], "mid")
        self.assertEqual(C.bucket_stv(0.7, 0.5)[0], "mid")  # deontic "should"
        self.assertEqual(C.bucket_stv(0.8, 0.5)[0], "high")
        self.assertEqual(C.bucket_stv(0.969, 0.5)[0], "high")
        self.assertEqual(C.bucket_stv(0.97, 0.5)[0], "full")
        self.assertEqual(C.bucket_stv(1.0, 0.0)[1], "weak")
        self.assertEqual(C.bucket_stv(1.0, 0.499)[1], "weak")
        self.assertEqual(C.bucket_stv(1.0, 0.5)[1], "emp")
        self.assertEqual(C.bucket_stv(1.0, 0.949)[1], "emp")
        self.assertEqual(C.bucket_stv(1.0, 0.95)[1], "def")
        self.assertEqual(C.bucket_stv(1.0, 1.0)[1], "def")

    def test_out_of_range(self):
        for bad in [(-0.1, 0.9), (1.1, 0.9), (0.9, -0.1), (0.9, 1.1)]:
            with self.assertRaises(ValueError):
                C.bucket_stv(*bad)

    def test_default_flag_is_off(self):
        self.assertFalse(C.BUCKET_TV_IN_HASHES)

    def test_bucketing_is_currently_a_no_op_on_attested_values(self):
        # §4.6's empirical claim: on clean parses, turning bucketing on changes
        # no hash, because every attested TV already sits alone in its band.
        for s, c in sorted(self.ATTESTED):
            statements = ['(: g (Inheritance gull loud) (STV %r %r))' % (s, c)]
            off = C.canonicalize(rec(statements), bucket_tv=False)
            on = C.canonicalize(rec(statements), bucket_tv=True)
            # different rendering, but the induced partition is identical:
            # two attested values collide under bucketing iff they collide exactly
            self.assertNotEqual(off["graph_id"], on["graph_id"])
        seen = {}
        for s, c in sorted(self.ATTESTED):
            statements = ['(: g (Inheritance gull loud) (STV %r %r))' % (s, c)]
            key = C.canonicalize(rec(statements), bucket_tv=True)["graph_id"]
            seen.setdefault(key, []).append((s, c))
        collisions = [v for v in seen.values() if len(v) > 1]
        # exactly one deliberate collision: striking 0.3 with "few" 0.1
        self.assertEqual(collisions, [[(0.1, 0.9), (0.3, 0.9)]])


class TestOpacityAndStars(unittest.TestCase):
    def test_opaque_roster_is_read_from_vocabulary(self):
        vocab = C.load_vocabulary()
        self.assertIn(("Because", 2), vocab["opaque"])
        self.assertIn(("Or", 2), vocab["opaque"])
        self.assertNotIn(("Member", 2), vocab["opaque"])
        self.assertNotIn(("Agent", 2), vocab["opaque"])

    def test_operator_identity_is_name_and_arity(self):
        # Yet is a genuine head collision: (Yet e) aspectual vs (Yet a b) adversative
        vocab = C.load_vocabulary()
        self.assertIn(("Yet", 1), vocab["known"])
        self.assertIn(("Yet", 2), vocab["known"])
        self.assertIn(("Yet", 1), vocab["opaque"])
        self.assertIn(("Yet", 2), vocab["opaque"])

    def test_opaque_atom_is_marked(self):
        canon = C.canonicalize(rec(MEETING))
        by_term = {a["term"]: a for a in canon["atoms"]}
        self.assertTrue(by_term["(Because e0 e1)"]["opaque"])
        self.assertFalse(by_term["(Agent e0 maria)"]["opaque"])

    def test_opaque_atom_is_one_node_for_stars(self):
        # (Directive (And (Member sk_e_1 go) ...)) — the sealed interior must not
        # contribute the inner skolem to a star.
        statements = [
            '(: d (Directive (And (Member sk_go_1 go) (Agent sk_go_1 you))) (STV 1.0 0.99))',
            '(: y (Name you "you") (STV 1.0 0.99))',
        ]
        canon = C.canonicalize(rec(statements))
        self.assertNotIn("x0", canon["stars"])
        self.assertNotIn("e0", canon["stars"])

    def test_structured_terms_are_not_independent_atoms(self):
        canon = C.canonicalize(rec(MEETING))
        self.assertEqual(canon["stats"]["atoms"], len(MEETING))
        self.assertIn("(Time e0 (Year 2020))", [a["term"] for a in canon["atoms"]])
        # 2020 is a number, not a star key; Year is a term constructor, not a symbol
        self.assertNotIn("2020", canon["stars"])
        self.assertNotIn("Year", canon["stars"])

    def test_event_and_entity_stars(self):
        canon = C.canonicalize(rec(MARIA_DROVE))
        self.assertEqual(canon["stars"]["e0"]["kind"], "event")
        self.assertEqual(canon["stars"]["e0"]["class"], "drive")
        self.assertEqual(canon["stars"]["maria"]["kind"], "entity")
        self.assertEqual(len(canon["stars"]["e0"]["atoms"]), 4)

    def test_rule_contributes_a_single_star(self):
        canon = C.canonicalize(rec(DOGS_GROUP))
        rules = [k for k in canon["stars"] if k.startswith("rule:")]
        self.assertEqual(len(rules), 1)
        self.assertEqual(canon["stars"][rules[0]]["kind"], "rule")


class TestDeterminism(unittest.TestCase):
    def test_no_process_salted_hash_in_output(self):
        # Re-running in a fresh interpreter must reproduce the same digest.
        import subprocess

        here = os.path.dirname(os.path.abspath(__file__))
        code = (
            "import sys; sys.path.insert(0, %r); import canonicalize as C;"
            "print(C.canonicalize({'statements': %r})['graph_id'])"
            % (os.path.dirname(here), MARIA_DROVE)
        )
        outs = set()
        for seed in ("0", "1", "12345"):
            env = dict(os.environ, PYTHONHASHSEED=seed)
            outs.add(
                subprocess.check_output(
                    [sys.executable, "-c", code], env=env
                ).decode().strip()
            )
        self.assertEqual(len(outs), 1)
        self.assertEqual(outs.pop(), C.canonicalize(rec(MARIA_DROVE))["graph_id"])

    def test_canonical_record_shape(self):
        canon = C.canonicalize(rec(MARIA_DROVE))
        for field in (
            "schema", "id", "run", "parse_input_sha256", "canon_version",
            "atoms", "linearization", "graph_id", "shape_id", "content_id",
            "renaming", "stars", "exact", "stats",
        ):
            self.assertIn(field, canon)
        self.assertEqual(canon["schema"], "fusenf-canon/2")
        self.assertTrue(canon["graph_id"].startswith("sha256:"))
        self.assertEqual(
            sorted(canon["stats"]),
            [
                "atoms", "bucketed_tv", "constants", "max_symmetric_class",
                "refine_rounds", "skolems", "symmetric_classes",
            ],
        )
        self.assertEqual(canon["stats"]["atoms"], 5)
        self.assertEqual(canon["stats"]["skolems"], 2)
        self.assertGreater(canon["stats"]["refine_rounds"], 0)
        self.assertEqual(canon["stats"]["symmetric_classes"], 0)
        self.assertTrue(canon["exact"])

    def test_refinement_reports_the_symmetry_it_had_to_search(self):
        canon = C.canonicalize(rec(TWO_DOGS))
        # two dog witnesses + two bark witnesses = two degenerate colour classes,
        # both resolved exactly by §4.3
        self.assertEqual(canon["stats"]["symmetric_classes"], 2)
        self.assertEqual(canon["stats"]["max_symmetric_class"], 2)
        self.assertTrue(canon["exact"])

    def test_linearization_is_sorted_and_newline_joined(self):
        canon = C.canonicalize(rec(MARIA_DROVE))
        lines = canon["linearization"].split("\n")
        self.assertEqual(lines, sorted(lines))
        self.assertEqual(len(lines), 5)

    def test_number_formatting_is_canonical(self):
        a = C.canonicalize(rec(['(: g (Inheritance gull loud) (STV 0.90 0.9))']))
        b = C.canonicalize(rec(['(: g (Inheritance gull loud) (STV .9 0.90))']))
        self.assertEqual(a["graph_id"], b["graph_id"])

    def test_and_conjunct_order_is_canonical(self):
        # Found in M1 v4: two faithful parses of "the pump did not restart after
        # the outage" differed ONLY in where (Past …) sat inside the And-bundle,
        # and scored as a genuine disagreement.  And-conjuncts are unordered.
        a = C.canonicalize(rec([
            '(: n (And (Member sk_r_1 restart) (Patient sk_r_1 sk_p_1)'
            ' (Past sk_r_1) (Before sk_o_1 sk_r_1)) (STV 0.0 0.9))']))
        b = C.canonicalize(rec([
            '(: n (And (Before sk_o_1 sk_r_1) (Past sk_r_1)'
            ' (Member sk_r_1 restart) (Patient sk_r_1 sk_p_1)) (STV 0.0 0.9))']))
        self.assertEqual(a["graph_id"], b["graph_id"])

    def test_opaque_disjunction_order_is_preserved(self):
        # The other half of the same decision: Or/Xor are matched verbatim by the
        # chainer, so their argument order stays load-bearing and must NOT be sorted.
        a = C.canonicalize(rec(['(: d (Or (Member sk_1 relay) (Member sk_2 wiring)) (STV 0.9 0.9))']))
        b = C.canonicalize(rec(['(: d (Or (Member sk_2 wiring) (Member sk_1 relay)) (STV 0.9 0.9))']))
        self.assertNotEqual(a["graph_id"], b["graph_id"])


class TestSoftJaccard(unittest.TestCase):
    """§6 — deterministic soft-Jaccard under best skolem alignment."""

    def test_identical_is_one(self):
        a = C.canonicalize(rec(PUSH))
        b = C.canonicalize(rec(PUSH))
        self.assertEqual(C.soft_jaccard(a, b), 1.0)

    def test_alpha_variant_is_one(self):
        a = C.canonicalize(rec(MARIA_DROVE))
        b = C.canonicalize(rec(MARIA_DROVE_ALPHA))
        self.assertEqual(C.soft_jaccard(a, b), 1.0)

    def test_bounds_and_symmetry(self):
        pairs = [
            (PUSH, PUSH_PARTICIPANT_SWAP),
            (PUSH, PUSH_NEGATED),
            (PUSH, MARIA_DROVE),
            (MEETING, DOGS_GROUP),
            (TALL, SHORT),
        ]
        for left, right in pairs:
            a = C.canonicalize(rec(left))
            b = C.canonicalize(rec(right))
            score = C.soft_jaccard(a, b)
            self.assertGreaterEqual(score, 0.0)
            self.assertLessEqual(score, 1.0)
            self.assertEqual(score, C.soft_jaccard(b, a), "asymmetric on %s" % (left,))

    def test_one_atom_difference_scores_high(self):
        a = C.canonicalize(rec(PUSH))
        b = C.canonicalize(rec([s for s in PUSH if "Past" not in s]))
        self.assertGreater(C.soft_jaccard(a, b), 0.7)

    def test_disjoint_scores_low(self):
        a = C.canonicalize(rec(TALL))
        b = C.canonicalize(rec(GULLS_09))
        self.assertEqual(C.soft_jaccard(a, b), 0.0)

    def test_skolem_alignment_beats_naive_string_overlap(self):
        # Same graph, but the skolem naming streams differ because one record
        # carries an extra entity that shifts the x-indices.  A correct
        # alignment still finds the shared core.
        left = [
            '(: e (Member sk_read_1 read) (STV 1.0 0.99))',
            '(: a (Agent sk_read_1 sk_person_1) (STV 1.0 0.99))',
            '(: t (Theme sk_read_1 sk_book_1) (STV 1.0 0.99))',
        ]
        right = [
            '(: e (Member sk_read_9 read) (STV 1.0 0.99))',
            '(: a (Agent sk_read_9 sk_zzz_3) (STV 1.0 0.99))',
            '(: t (Theme sk_read_9 sk_aaa_8) (STV 1.0 0.99))',
        ]
        a = C.canonicalize(rec(left))
        b = C.canonicalize(rec(right))
        self.assertEqual(C.soft_jaccard(a, b), 1.0)

    def test_repeatable(self):
        a = C.canonicalize(rec(MEETING))
        b = C.canonicalize(rec(DOGS_GROUP))
        scores = {C.soft_jaccard(a, b) for _ in range(5)}
        self.assertEqual(len(scores), 1)


if __name__ == "__main__":
    unittest.main(verbosity=2)
