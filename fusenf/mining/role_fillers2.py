"""FUSE-NF §4.3.2 — role-filler distributions on the valuation export (item E machinery, H run).

Consumes ``frequent_patterns2``'s ``valuations_slots.jsonl`` instead of re-walking the
canon files: the miner's enumeration IS the valuation set of the 1-clause slot
patterns, so this script is pure aggregation. Slots are center-CLASS-conditioned
(never bare roles); filler distributions are compared by cosine over raw counts
(batch-1 semantics, verbatim).

Slot buckets (H, 2026-09-03):

* **event-role slots** (``slots.jsonl``): event centers under the closed-class roles
  (vocabulary class ``role``) PLUS the open **preposition-named obliques** — heads the
  vocabulary does not list (``In``/``For``/``At``/``On``/``With``/…), which the prompt
  treats as PP-answer slots beside the named roles, so ``Location``-vs-``In`` wobble is
  the same phenomenon as role wobble. ``head_class`` = ``role`` | ``oblique`` per row.
* **other slots** (``slots_entity.jsonl`` — file name kept for downstream stability):
  entity centers under any head, and event centers under non-role heads (``Member``
  co-classes, temporal operators, ``Result``, the discourse connectives ``To`` /
  ``Because`` / ``But`` / ``Despite``, whose fillers are events).

Signals (``kind: slot-merge``, typed for the cross-method consensus): cross-event
same-role (supports event-lemma equivalence), cross-role same-event (role wobble ->
the ``role-canonicalization`` / ``role-interchange`` consolidation kinds), and the
entity-side analogues (tagged); plus the #23 Theme-vs-Patient audit.

**D.3** (owner 2026-08-21, error-vs-variance) is mechanized via the curated
``prompt_determined_roles.json`` (re-curated 2026-09-03 against the PINNED prompt; see
its ``_sources``): a Theme/Patient flip witness on a prompt-DETERMINED class is a PARSE
ERROR -> ``flip_diagnostics.jsonl`` (diagnosis / next-hash re-parse path, #51), never a
candidate; on a determined class the forbidden role ALONE is flagged (a Patient on a
Theme-verb, a Theme on a Patient-verb, Agent/Theme/Patient on an Experiencer/Stimulus
verb), and cross-role signals on determined classes are quarantined the same way. Verbs
named only since the pinned prompt carry ``determined_since`` so a diagnosis reads
"legislated after parse time". Only prompt-UNDETERMINED classes propose
role-canonicalization candidates (#50: a consolidation kind — the gauntlet judges it on
the role-bridge card and files it as ``prompt_side_evidence`` for the fix-pack channel).

**Weighting** (H refinement, 2026-09-03): raw-count cosine on natural text rewards
"both verbs take people as agents" (item-E signals on the designed Tier A corpus shared
specific fillers; the H substrate's top shared fillers are ``<untyped>`` / ``person`` /
``thing``). Default ``--weighting ppmi``: filler weights are role-conditional PPMI
(``max(0, log P(f|slot) / P(f|head))`` — the background is the same head across all
center classes, so a role's ordinary fillers weigh ~0), wildcard fillers (``<untyped>``,
``<num>``, ``<str>``, ``<term:*>``) weigh 0, and the >=2-shared-fillers test counts only
fillers informative (PPMI > 0) on both sides. ``--weighting raw`` is the batch-1
criterion verbatim; the report gives both counts.

**Construction-aware #23 audit** (H, 2026-09-03): the valuation export now carries
``filler_kind`` (the filler's star kind). An eventive complement ("started chanting" ->
``(Theme e_start e_chant)``) and an entity argument ("the concert started" ->
``Patient``) are two constructions the prompt keeps apart, not a wobble — so the
Theme-vs-Patient flip audit, its witnesses and the global vocabularies run over ENTITY
fillers only (``fillers_entity`` on slot rows); the eventive-complement family is
reported separately (aspectual / attitude verbs). Slot vectors for the similarity
comparisons keep every filler (batch-1 ``fillers`` format for align_pairs).

**Witnesses** (H task "witness examples on role cards"): flip rows carry
``witness_pairs`` — ``"A|B"`` doc ids, A under Theme and B under Patient, shared-filler
pairs first — in exactly the form the gauntlet's cards consume through
``provenance.examples``; slot rows carry ``filler_examples``; signals carry
``examples_a`` / ``examples_b``. Candidate-eligible flips are written to
``flip_eligible.jsonl`` (entity-filler counts + witness pairs) — the role-canonicalization
input for ``build_candidates`` (which no longer needs to recompute flips from slots).

Deterministic; no clock, no randomness.

Usage:
  python role_fillers2.py [--slots-in out_h/valuations_slots.jsonl] [--out-dir out_h]
      [--min-n 3] [--cos 0.5] [--report <out-dir>/rolefillers2_report.md]
"""

from __future__ import annotations

import argparse
import collections
import json
import math
import os

HERE = os.path.dirname(os.path.abspath(__file__))
ROLE_KEYS = (("theme", "Theme"), ("patient", "Patient"),
             ("experiencer_stimulus", "Experiencer/Stimulus"))
# roles an Experiencer/Stimulus verb must NOT carry (its subject/object are Exp/Stim)
EXPSTIM_FOREIGN = ("Agent", "Theme", "Patient")
WILDCARD = ("<untyped>", "<num>", "<str>")


def is_wild(filler):
    """a filler that says nothing about lexical content (name-only / literal / term node)"""
    return filler in WILDCARD or filler.startswith("<term:")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def cosine(ca, cb):
    dot = sum(v * cb.get(k, 0) for k, v in ca.items())
    na = math.sqrt(sum(v * v for v in ca.values()))
    nb = math.sqrt(sum(v * v for v in cb.values()))
    return dot / (na * nb) if na and nb else 0.0


def load_doctrine(path):
    """-> (table, {verb: (determined role, named_since hash)}); asserts the flat lists
    (the mechanism's interface) equal the union of ``_sources``."""
    table = json.load(open(path, encoding="utf-8"))
    determined, union = {}, {k: [] for k, _ in ROLE_KEYS}
    for src in table.get("_sources", []):
        since = src.get("named_since", "?")
        for key, role in ROLE_KEYS:
            for v in src.get(key, []):
                prev = determined.setdefault(v, (role, since))
                if prev[0] != role:
                    raise SystemExit(f"doctrine conflict: {v} is {prev[0]} and {role}")
                if v not in union[key]:
                    union[key].append(v)
    for key, role in ROLE_KEYS:
        if table.get("_sources") and union[key] != table.get(key, []):
            raise SystemExit(f"doctrine table drift: flat list {key!r} != union of _sources")
        for v in table.get(key, []):
            determined.setdefault(v, (role, table.get("_pinned_prompt", "table")))
    return table, determined


def uniq(seq):
    out = []
    for x in seq:
        if x not in out:
            out.append(x)
    return out


VAR_LETTER = {"event": "e", "entity": "x", "function": "f", "rule": "r"}


def mass(x):
    """fractional label mass -> int when integral, else 3 decimals (JSON-friendly)"""
    r = round(x, 3)
    return int(r) if abs(r - round(r)) < 1e-9 else r


def masses(ctr):
    return {k: mass(v) for k, v in ctr.items()}


def make_head_class(vocab_path):
    """-> head_class(kind, head): 'role' (vocabulary class role) | 'oblique' (a head the
    vocabulary does not list = the open preposition-named family) | None (other heads)"""
    ops = json.load(open(vocab_path, encoding="utf-8"))["operators"]
    roles = {n for n, e in ops.items() if e.get("class") == "role"}

    def head_class(kind, head):
        if kind != "event":
            return None
        if head in roles:
            return "role"
        if head not in ops:
            return "oblique"
        return None
    return head_class


def compare_slots(slots, kind_sel, role_filter, head_class, weighting, min_n, cos_thr, examples_for):
    """Slot-merge comparisons within one center kind:
    (same_role, same_center, cross_both, n_raw) — cross_both = different class AND
    different role (the paper's general slot merge; converses: buy.Agent ~ sell.Recipient).

    ``slots``: {(kind, class, head): Counter(unit -> mass)}; a unit is a filler label
    (exact mode) or a cluster id (embed mode); wildcard units weigh 0. Weighting
    ``ppmi`` = role-conditional PPMI (background = the same head over every class of
    the bucket) with the >=2-shared test over informative units; ``raw`` = batch-1
    counts verbatim. ``n_raw`` = the signal counts the raw criterion would give."""
    def in_bucket(k):
        return k[0] == kind_sel and (not role_filter or head_class(k[0], k[2]) is not None)

    big = {k: v for k, v in slots.items() if in_bucket(k) and sum(v.values()) >= min_n}
    bg = collections.defaultdict(collections.Counter)
    for k, v in slots.items():
        if in_bucket(k):
            bg[k[2]].update(v)
    bg_total = {h: sum(c.values()) for h, c in bg.items()}

    def vec(k):
        ctr = big[k]
        if weighting == "raw":
            return dict(ctr)
        n = sum(ctr.values())
        out = {}
        for f, c in ctr.items():
            if is_wild(f):
                continue
            w = math.log((c / n) / (bg[k[2]][f] / bg_total[k[2]]))
            if w > 0:
                out[f] = w
        return out

    vecs = {k: vec(k) for k in big}
    keys = sorted(big)
    same_role, same_center, cross_both = [], [], []
    n_raw = [0, 0, 0]
    for i, ka in enumerate(keys):
        for kb in keys[i + 1:]:
            if ka[2] == kb[2] and ka[1] != kb[1]:
                bucket, bi = same_role, 0
            elif ka[1] == kb[1] and ka[2] != kb[2]:
                bucket, bi = same_center, 1
            elif ka[1] != kb[1] and ka[2] != kb[2]:
                bucket, bi = cross_both, 2
            else:
                continue
            shared_raw = set(big[ka]) & set(big[kb])
            cos_raw = cosine(big[ka], big[kb])
            if cos_raw >= cos_thr and len(shared_raw) >= 2:
                n_raw[bi] += 1
            shared = set(vecs[ka]) & set(vecs[kb])   # informative on both sides
            cos = cosine(vecs[ka], vecs[kb])
            if cos >= cos_thr and len(shared) >= 2:
                bucket.append({
                    "slot_a": f"{ka[1]}.{ka[2]}", "slot_b": f"{kb[1]}.{kb[2]}",
                    "class_a": ka[1], "class_b": kb[1], "role_a": ka[2], "role_b": kb[2],
                    "cosine": round(cos, 3), "cosine_raw": round(cos_raw, 3),
                    "shared_fillers": sorted(shared)[:8],
                    "n_a": mass(sum(big[ka].values())), "n_b": mass(sum(big[kb].values())),
                    "examples_a": examples_for(ka, shared),
                    "examples_b": examples_for(kb, shared, avoid=examples_for(ka, shared)),
                })
    for bucket in (same_role, same_center, cross_both):
        bucket.sort(key=lambda r: (-r["cosine"], r["slot_a"], r["slot_b"]))
    return same_role, same_center, cross_both, n_raw


def render_slot(kind, cls, head, filler=None, fkind=None):
    """One slot (or one of its valuations) as a conjunctive query: center class clause +
    head clause (+ the filler's class clause). Filler variable letter = the filler's own
    kind; a constant / literal wildcard sits in the head clause itself."""
    cvar = "$e0" if kind == "event" else "$x0"
    clauses = [] if cls == "<unclassed>" else [f"(Member {cvar} {cls})"]
    if filler is None:
        clauses.append(f"({head} {cvar} $x1)")
    elif fkind in ("constant", "num", "str", "term"):
        clauses.append(f"({head} {cvar} {filler})")
    else:
        fvar = "$%s1" % VAR_LETTER.get(fkind, "s")
        clauses.append(f"({head} {cvar} {fvar})")
        if filler != "<untyped>":
            clauses.append(f"(Member {fvar} {filler})")
    clauses = uniq(clauses)
    return clauses[0] if len(clauses) == 1 else "(And " + " ".join(clauses) + ")"


def write_metta(path, args, slots_in, pinned, n_determined, val_rows, slots, slot_docs,
                slots_evt, head_class, signal_sections, flips, diagnostics):
    """Readable MeTTa RENDERING of the §4.3.2 results (owner 2026-09-03).

    Never loaded: a slot valuation is a conjunctive QUERY over variables, not an
    assertion. Sections: event-role slots, other slots (one valuation line per filler,
    sorted by n desc), slot-merge signals (comment + the two slot queries), the
    candidate-eligible #23 flips as PROVISIONAL role-canonicalization implications
    (minority -> majority role; the gauntlet decides), and the D.3 diagnostics as
    comments. The JSONL files are the record of truth."""
    n_ev = sum(1 for k in slots if head_class(k[0], k[2]) is not None)
    n_en = len(slots) - n_ev
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(";; FUSE-NF §4.3.2 role-filler distributions — readable MeTTa RENDERING (never loaded:\n"
                 ";; a slot valuation is a conjunctive query over variables, not an assertion).\n"
                 f";; {n_ev} event-role slots + {n_en} other slots from {slots_in} (the §4.3.1 valuation\n"
                 f";; export); weighting {args.weighting}, min_n {args.min_n}, cos {args.cos}; pinned prompt {pinned},\n"
                 f";; D.3 table {n_determined} verbs. A slot = center class × head, one line per filler:\n"
                 ";; $e0/$x0 = the event/entity center, $e1/$x1/$f1 = a skolem filler (its own kind picks the\n"
                 ";; letter), a bare symbol = a constant filler, <num>/<str>/<term:X> = literal wildcards as in\n"
                 ";; patterns2.metta. Sorted by slot n desc. slots*.jsonl / flip_eligible.jsonl are the record of truth.\n")

        def section(title, keys):
            fh.write(f"\n;; ==================== {title} ====================\n")
            for key in keys:
                kind, cls, head = key
                rows = sorted(val_rows[key], key=lambda r: (-r["w"], r["filler"], r["fkind"]))
                hc = head_class(kind, head)
                fh.write(f"\n;; ---- slot {cls}.{head}  [{kind} center; head {hc or 'other'}]  n {mass(sum(slots[key].values()))}"
                         f"  docs<= {slot_docs[key]}  distinct {len(slots[key])}"
                         f"  eventive {mass(sum(slots_evt.get(key, {}).values()))}\n")
                for r in rows:
                    wtxt = "" if mass(r["w"]) == r["n"] else f" (mass {mass(r['w'])})"
                    fh.write(f"{render_slot(kind, cls, head, r['filler'], r['fkind'])}"
                             f"    ;; n {r['n']}{wtxt} docs {r['docs']}  e.g. {' '.join(r['examples'][:2])}\n")

        order = sorted(slots, key=lambda k: (-sum(slots[k].values()), k[1], k[2]))
        section(f"event-role slots ({n_ev})", [k for k in order if head_class(k[0], k[2]) is not None])
        section(f"other slots ({n_en}): entity centers + event centers under non-role heads",
                [k for k in order if head_class(k[0], k[2]) is None])

        n_sig = sum(len(rows) for _, rows in signal_sections)
        fh.write(f"\n;; ==================== slot-merge signals ({n_sig}; {args.weighting} cosine >= {args.cos},"
                 f" >= 2 shared informative fillers, slot n >= {args.min_n}) ====================\n")
        for sub, rows in signal_sections:
            for r in rows:
                kind = "entity" if sub.startswith("cross-entity") else "event"
                fh.write(f"\n;; {sub}  {r['slot_a']} ~ {r['slot_b']}  cosine {r['cosine']:.2f} (raw {r['cosine_raw']:.2f})"
                         f"  support {min(r['n_a'], r['n_b'])}  shared: {' '.join(r['shared_fillers'][:6])}\n"
                         f";;   A e.g. {' '.join(r['examples_a'])}   B e.g. {' '.join(r['examples_b'])}\n")
                fh.write(render_slot(kind, r["class_a"], r["role_a"]) + "\n")
                fh.write(render_slot(kind, r["class_b"], r["role_b"]) + "\n")

        fh.write(f"\n;; ==================== #23 flip witnesses, candidate-eligible ({len(flips)}; prompt-undetermined"
                 " classes, ENTITY fillers) ====================\n"
                 ";; PROVISIONAL role-canonicalization candidates, minority -> majority role (tie -> Patient);\n"
                 ";; NOT rules: build_candidates carries them to the gauntlet (role-bridge card, same_relation\n"
                 ";; question, prompt_side_evidence filing). Witnesses: A under Theme | B under Patient.\n")
        for r in flips:
            loser, winner = (("Theme", "Patient") if r["patient_n"] >= r["theme_n"] else ("Patient", "Theme"))
            fh.write(f"\n;; {r['event_class']}  Theme {r['theme_n']} / Patient {r['patient_n']}"
                     f"  shared: {' '.join(r['shared_fillers'][:5]) or '—'}"
                     f"  witnesses: {' '.join(r['witness_pairs'])}\n")
            fh.write(f"(Implication (And (Member $e {r['event_class']}) ({loser} $e $x)) "
                     f"(And (Member $e {r['event_class']}) ({winner} $e $x)))\n")

        fh.write(f"\n;; ==================== D.3 diagnostics ({len(diagnostics)}; parse-error path, never candidates)"
                 " ====================\n")
        if not diagnostics:
            fh.write(";; none — every prompt-determined class present carries only its licensed roles\n")
        for r in diagnostics:
            fh.write(f";; {json.dumps(r, ensure_ascii=False, sort_keys=True)}\n")
    print(f"-> {path}  ({n_ev}+{n_en} slots, {n_sig} signals, {len(flips)} candidates rendered)")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--slots-in", default=os.path.join(HERE, "out_h", "valuations_slots.jsonl"))
    ap.add_argument("--min-n", type=int, default=3)
    ap.add_argument("--cos", type=float, default=0.5)
    ap.add_argument("--weighting", choices=("raw", "ppmi"), default="ppmi",
                    help="filler weighting for the slot comparisons (raw = batch-1 verbatim)")
    ap.add_argument("--out-dir", default=os.path.join(HERE, "out_h"))
    ap.add_argument("--doctrine", default=os.path.join(HERE, "prompt_determined_roles.json"))
    ap.add_argument("--vocab", default=os.path.join(HERE, os.pardir, "specs", "vocabulary.json"))
    ap.add_argument("--report", default=None, help="default <out-dir>/rolefillers2_report.md; '' disables")
    ap.add_argument("--metta-out", default=None,
                    help="readable MeTTa RENDERING of the results (never loaded); "
                         "default <out-dir>/rolefillers2.metta; '' disables")
    args = ap.parse_args()
    if args.report is None:
        args.report = os.path.join(args.out_dir, "rolefillers2_report.md")
    if args.metta_out is None:
        args.metta_out = os.path.join(args.out_dir, "rolefillers2.metta")

    table, determined = load_doctrine(args.doctrine)
    pinned = table.get("_pinned_prompt", "?")
    head_class = make_head_class(args.vocab)

    slots = collections.defaultdict(collections.Counter)   # (kind, class, head) -> fillers
    slots_ent = collections.defaultdict(collections.Counter)   # entity-kind fillers only
    slots_evt = collections.defaultdict(collections.Counter)   # event-kind fillers only
    slot_docs = collections.Counter()
    slot_examples = collections.defaultdict(lambda: collections.defaultdict(list))
    ent_examples = collections.defaultdict(lambda: collections.defaultdict(list))
    val_rows = collections.defaultdict(list)   # (kind, class, head) -> valuation rows
    # Distribution mass = ``w`` (multi-label fillers give 1/m to each label, so a slot's
    # total mass = its occurrence count); ``n`` = occurrences carrying the label.
    for row in load(args.slots_in):
        key = (row["center_kind"], row["center_class"], row["head"])
        fk = row.get("filler_kind", "?")
        w = row.get("w", row["n"])
        slots[key][row["filler"]] += w
        slot_docs[key] += row["docs"]   # per-filler doc counts; upper bound per slot
        ex = slot_examples[key][row["filler"]]
        ex[:] = sorted(set(ex) | set(row.get("examples", [])))
        val_rows[key].append({"filler": row["filler"], "fkind": fk, "n": row["n"], "w": w,
                              "docs": row["docs"], "examples": row.get("examples", [])})
        if fk in ("entity", "constant"):   # entity argument: skolem instance or named constant
            slots_ent[key][row["filler"]] += w
            ex = ent_examples[key][row["filler"]]
            ex[:] = sorted(set(ex) | set(row.get("examples", [])))
        elif fk == "event":
            slots_evt[key][row["filler"]] += w

    def examples_for(key, prefer=(), avoid=()):
        """<=2 witness doc ids for a slot, preferring the given (shared) fillers and
        docs not already cited for the other side."""
        exs = slot_examples[key]
        ids = [i for f in sorted(prefer) for i in exs.get(f, [])]
        ids += [i for f in sorted(exs) for i in exs[f]]
        ids = uniq(ids)
        return ([i for i in ids if i not in avoid] + [i for i in ids if i in avoid])[:2]

    os.makedirs(args.out_dir, exist_ok=True)
    ev_path = os.path.join(args.out_dir, "slots.jsonl")
    en_path = os.path.join(args.out_dir, "slots_entity.jsonl")
    n_ev = n_en = 0
    n_oblique = 0
    other_event_heads = collections.Counter()
    with open(ev_path, "w", encoding="utf-8") as fe, \
         open(en_path, "w", encoding="utf-8") as fn:
        for (kind, cls, head), ctr in sorted(slots.items()):
            top = masses(dict(sorted(ctr.items(), key=lambda kv: (-kv[1], kv[0]))[:12]))
            hc = head_class(kind, head)
            row = {
                "slot": f"{cls}.{head}", "event_class": cls, "role": head,
                "center_kind": kind, "head_class": hc,
                "n": mass(sum(ctr.values())), "distinct": len(ctr),
                "docs": slot_docs[(kind, cls, head)],
                "fillers": top,
                "fillers_entity": masses(dict(sorted(slots_ent.get((kind, cls, head), {}).items(),
                                                     key=lambda kv: (-kv[1], kv[0]))[:12])),
                "eventive_n": mass(sum(slots_evt.get((kind, cls, head), {}).values())),
                "filler_examples": {f: slot_examples[(kind, cls, head)][f][:3] for f in top},
            }
            if hc is not None:
                fe.write(json.dumps(row, ensure_ascii=False, sort_keys=True) + "\n")
                n_ev += 1
                n_oblique += hc == "oblique"
            else:
                fn.write(json.dumps(row, ensure_ascii=False, sort_keys=True) + "\n")
                n_en += 1
                if kind == "event":
                    other_event_heads[head] += 1

    # ---- slot-merge comparisons (per center kind): module-level compare_slots ----
    ev_same_role, ev_same_event, ev_cross_both, ev_raw = compare_slots(
        slots, "event", True, head_class, args.weighting, args.min_n, args.cos, examples_for)
    en_same_role, en_same_center, en_cross_both, en_raw = compare_slots(
        slots, "entity", False, head_class, args.weighting, args.min_n, args.cos, examples_for)

    # D.3 split on the cross-role bucket: a determined Theme/Patient class quarantines
    # Theme/Patient wobble; a determined Experiencer/Stimulus class quarantines any
    # wobble touching Agent/Theme/Patient/Experiencer/Stimulus.
    def d3_route(rows_):
        ok, diag = [], []
        for r in rows_:
            det = determined.get(r["class_a"])
            pair = {r["role_a"], r["role_b"]}
            hit = det and (pair & {"Theme", "Patient"} if det[0] != "Experiencer/Stimulus"
                           else pair & {"Agent", "Theme", "Patient", "Experiencer", "Stimulus"})
            if hit:
                r["determined_role"], r["determined_since"] = det
                diag.append(r)
            else:
                ok.append(r)
        return ok, diag

    ev_same_event, d3_signals_diag = d3_route(ev_same_event)

    sig_path = os.path.join(args.out_dir, "rolefiller2_signals.jsonl")
    with open(sig_path, "w", encoding="utf-8") as fh:
        for sub, kind, rows_ in (("cross-event", "event", ev_same_role),
                                 ("cross-role", "event", ev_same_event),
                                 ("cross-both", "event", ev_cross_both),
                                 ("cross-entity-class", "entity", en_same_role),
                                 ("cross-head", "entity", en_same_center),
                                 ("cross-entity-both", "entity", en_cross_both)):
            for r in rows_:
                fh.write(json.dumps({
                    "candidate": {"slot_a": r["slot_a"], "slot_b": r["slot_b"],
                                  "subtype": sub, "center_kind": kind},
                    # cosine of filler-count vectors — a similarity, not a probability.
                    "confidence": r["cosine"], "cosine_raw": r["cosine_raw"],
                    "weighting": args.weighting, "kind": "slot-merge",
                    "support": min(r["n_a"], r["n_b"]),
                    "shared_fillers": r["shared_fillers"],
                    "examples_a": r["examples_a"], "examples_b": r["examples_b"],
                    "method": "role-fillers2-4.3.2",
                }, ensure_ascii=False, sort_keys=True) + "\n")
    n_sig = (len(ev_same_role) + len(ev_same_event) + len(ev_cross_both)
             + len(en_same_role) + len(en_same_center) + len(en_cross_both))

    # ---- #23 audit + D.3 flip routing --------------------------------------
    theme = collections.Counter()
    patient = collections.Counter()
    ev_slots = {(c, h): v for (k, c, h), v in slots.items() if k == "event"}
    ev_ent = {(c, h): v for (k, c, h), v in slots_ent.items() if k == "event"}
    ev_evt = {(c, h): v for (k, c, h), v in slots_evt.items() if k == "event"}
    for (cls, head), ctr in ev_ent.items():
        if head == "Theme":
            theme.update(ctr)
        elif head == "Patient":
            patient.update(ctr)
    shared_global = set(theme) & set(patient)

    def witness_pairs(cls, role_a, role_b, both):
        """'A|B' doc-id pairs (A under role_a, B under role_b; entity fillers), distinct
        docs, shared-filler pairs first; the gauntlet card format."""
        ex_a = ent_examples[("event", cls, role_a)]
        ex_b = ent_examples[("event", cls, role_b)]
        pairs = []
        for f in sorted(both):
            for a in ex_a.get(f, []):
                for b in ex_b.get(f, []):
                    if a != b:
                        pairs.append(f"{a}|{b}")
        for a in sorted({i for v in ex_a.values() for i in v}):
            for b in sorted({i for v in ex_b.values() for i in v}):
                if a != b:
                    pairs.append(f"{a}|{b}")
        return uniq(pairs)[:3]

    def role_examples(cls, role, table_=None):
        src = (table_ or slot_examples)[("event", cls, role)]
        return sorted({i for v in src.values() for i in v})[:3]

    flips, flips_diag = [], []
    obj_classes = {cls for cls, head in ev_ent if head in ("Theme", "Patient")}
    for cls in sorted(obj_classes):
        nt = mass(sum(ev_ent.get((cls, "Theme"), {}).values()))
        np_ = mass(sum(ev_ent.get((cls, "Patient"), {}).values()))
        if nt and np_:
            both = set(ev_ent[(cls, "Theme")]) & set(ev_ent[(cls, "Patient")])
            row = {"event_class": cls, "theme_n": nt, "patient_n": np_,
                   "shared_fillers": sorted(both),
                   "witness_pairs": witness_pairs(cls, "Theme", "Patient", both),
                   "examples": {"Theme": role_examples(cls, "Theme", ent_examples),
                                "Patient": role_examples(cls, "Patient", ent_examples)},
                   "eventive": {"Theme": mass(sum(ev_evt.get((cls, "Theme"), {}).values())),
                                "Patient": mass(sum(ev_evt.get((cls, "Patient"), {}).values()))}}
            det = determined.get(cls)
            if det:
                row["determined_role"], row["determined_since"] = det
                row["route"] = "parse-error (D.3: prompt-determined class)"
                if det[1] == pinned:
                    row["note"] = ("named only since the pinned prompt — the substrate predates "
                                   "it; the wobble should vanish on next-hash re-parse (#51); "
                                   "still not a candidate")
                flips_diag.append(row)
            else:
                row["route"] = "candidate-eligible (prompt-undetermined)"
                flips.append(row)
    for bucket in (flips, flips_diag):
        bucket.sort(key=lambda r: (-min(r["theme_n"], r["patient_n"]), r["event_class"]))
    # classes with Theme AND Patient over ALL fillers but not over entity fillers =
    # construction-conditioned variance (eventive complement vs entity argument)
    construction_only = sorted(
        cls for cls in {c for c, h in ev_slots if h in ("Theme", "Patient")}
        if sum(ev_slots.get((cls, "Theme"), {}).values())
        and sum(ev_slots.get((cls, "Patient"), {}).values())
        and not (sum(ev_ent.get((cls, "Theme"), {}).values())
                 and sum(ev_ent.get((cls, "Patient"), {}).values())))
    eventive = sorted(((cls, h, mass(sum(v.values()))) for (cls, h), v in ev_evt.items()
                       if h in ("Theme", "Patient") and v), key=lambda t: (-t[2], t[0], t[1]))

    # D.3 determined-role audit (H): on a prompt-DETERMINED class the forbidden role
    # ALONE is the error — a Patient on a Theme-verb, a Theme on a Patient-verb, an
    # Agent/Theme/Patient on an Experiencer/Stimulus verb — whatever the filler kind
    # (kinds are recorded so a reader can judge an eventive complement). This subsumes
    # the flip-witness view above for determined classes (item E needed both roles).
    FORBIDDEN = {"Theme": ("Patient",), "Patient": ("Theme",),
                 "Experiencer/Stimulus": EXPSTIM_FOREIGN}
    kinds_of = collections.defaultdict(lambda: collections.defaultdict(collections.Counter))
    for row in load(args.slots_in):
        if row["center_kind"] == "event":
            kinds_of[(row["center_class"], row["head"])][row["filler"]][row.get("filler_kind", "?")] += row["n"]
    determined_diag = []
    for cls in sorted({c for c, _ in ev_slots}):
        det = determined.get(cls)
        if not det:
            continue
        for role in FORBIDDEN[det[0]]:
            ctr = ev_slots.get((cls, role))
            if not ctr:
                continue
            determined_diag.append({
                "event_class": cls, "determined_role": det[0], "determined_since": det[1],
                "forbidden_role": role, "n": mass(sum(ctr.values())),
                "fillers": {f: dict(kinds_of[(cls, role)][f]) for f in sorted(ctr)},
                "examples": role_examples(cls, role),
                "route": "parse-error (D.3: prompt-determined class)"})
    determined_diag.sort(key=lambda r: (-r["n"], r["event_class"], r["forbidden_role"]))

    diag_path = os.path.join(args.out_dir, "flip_diagnostics.jsonl")
    with open(diag_path, "w", encoding="utf-8") as fh:
        for r in flips_diag:
            fh.write(json.dumps(dict(r, source="flip-witness"),
                                ensure_ascii=False, sort_keys=True) + "\n")
        for r in determined_diag:
            fh.write(json.dumps(dict(r, source="determined-role-witness"),
                                ensure_ascii=False, sort_keys=True) + "\n")
        for r in d3_signals_diag:
            fh.write(json.dumps(dict(r, source="cross-role-signal"),
                                ensure_ascii=False, sort_keys=True) + "\n")
    n_diag = len(flips_diag) + len(determined_diag) + len(d3_signals_diag)

    # candidate-eligible flips -> the role-canonicalization input for build_candidates
    # (entity-filler counts, witness pairs in card form); one row per undetermined class
    elig_path = os.path.join(args.out_dir, "flip_eligible.jsonl")
    with open(elig_path, "w", encoding="utf-8") as fh:
        for r in flips:
            fh.write(json.dumps(dict(r, method="role-fillers2-4.3.2", kind="role-canonicalization"),
                                ensure_ascii=False, sort_keys=True) + "\n")

    # ---- MeTTa rendering (owner 2026-09-03; never loaded) --------------------
    if args.metta_out:
        write_metta(args.metta_out, args, os.path.basename(args.slots_in), pinned, len(determined),
                    val_rows, slots, slot_docs, slots_evt, head_class,
                    [("cross-event", ev_same_role), ("cross-role", ev_same_event), ("cross-both", ev_cross_both),
                     ("cross-entity-class", en_same_role), ("cross-head", en_same_center)],
                    flips, flips_diag + determined_diag + d3_signals_diag)

    # ---- report ------------------------------------------------------------
    n_since = collections.Counter(since for _, since in determined.values())
    L = []
    L.append("# §4.3.2 role fillers 2 (valuation export) — H, full canonical substrate\n")
    L.append(f"- input: {os.path.basename(args.slots_in)}; slots: {n_ev} event-role "
             f"({n_oblique} under open preposition-named oblique heads), {n_en} other "
             f"(entity centers + event centers under non-role heads: "
             f"{', '.join(f'{h} {c}' for h, c in other_event_heads.most_common(6))})")
    L.append(f"- signals ({args.weighting} weighting): {len(ev_same_role)} cross-event + "
             f"{len(ev_same_event)} cross-role + {len(ev_cross_both)} cross-both (event) + "
             f"{len(en_same_role)} cross-entity-class + {len(en_same_center)} cross-head + "
             f"{len(en_cross_both)} cross-entity-both (entity); cosine>={args.cos}, >=2 shared "
             f"informative fillers, slot n>={args.min_n}. The raw batch-1 criterion would give "
             f"{ev_raw[0]} + {ev_raw[1]} + {ev_raw[2]} (event) + {en_raw[0]} + {en_raw[1]} + {en_raw[2]} (entity)")
    L.append(f"- D.3 doctrine table: {len(determined)} prompt-named verbs "
             f"({', '.join(f'{c} since {s}' for s, c in sorted(n_since.items()))}), "
             f"pinned prompt {pinned}")
    n_det_present = sum(1 for c in {c for c, _ in ev_slots} if c in determined)
    L.append(f"- D.3 routing: {n_det_present} determined classes present in the substrate; "
             f"{len(determined_diag)} forbidden-role witnesses (any filler kind) + "
             f"{len(flips_diag)} entity flip witnesses + {len(d3_signals_diag)} cross-role signals on "
             f"prompt-DETERMINED classes -> flip_diagnostics.jsonl (parse-error path, NOT candidates)\n")

    L.append("## Cross-event slot agreement (supports event-lemma equivalence)\n")
    L.append("| cosine | slot A | slot B | shared fillers |\n|---|---|---|---|")
    for r in ev_same_role[:25]:
        L.append(f"| {r['cosine']:.2f} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                 f"| {', '.join(r['shared_fillers'][:5])} |")
    L.append("\n## Cross-role agreement within one event class (candidate-eligible only)\n")
    L.append("| cosine | slot A | slot B | shared fillers |\n|---|---|---|---|")
    for r in ev_same_event[:20]:
        L.append(f"| {r['cosine']:.2f} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                 f"| {', '.join(r['shared_fillers'][:5])} |")
    L.append("\n## Cross-both (different event class AND different role — the converse family)\n")
    L.append("| cosine | slot A | slot B | shared fillers |\n|---|---|---|---|")
    for r in ev_cross_both[:20]:
        L.append(f"| {r['cosine']:.2f} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                 f"| {', '.join(r['shared_fillers'][:5])} |")
    L.append("\n## Entity-conditioned slots — cross-head / cross-class agreement\n")
    L.append("| cosine | slot A | slot B | shared fillers |\n|---|---|---|---|")
    for r in (en_same_center + en_same_role)[:15]:
        L.append(f"| {r['cosine']:.2f} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                 f"| {', '.join(r['shared_fillers'][:5])} |")
    L.append("\n## #23 audit — Theme vs Patient (ENTITY fillers; construction-aware)\n")
    L.append(f"- global entity-filler vocabularies: Theme {len(theme)} distinct ({mass(sum(theme.values()))} uses), "
             f"Patient {len(patient)} distinct ({mass(sum(patient.values()))} uses); "
             f"**{len(shared_global)} filler classes under BOTH** "
             f"(global cosine {cosine(theme, patient):.3f})")
    L.append(f"- flip witnesses: **{len(flips)} candidate-eligible** (prompt-undetermined) + "
             f"**{len(flips_diag)} parse-error-routed** (D.3); "
             f"{sum(1 for r in flips if r['witness_pairs'])}/{len(flips)} eligible classes "
             f"have distinct-doc witness pairs")
    L.append(f"- construction-conditioned, NOT flips: {len(construction_only)} classes carry Theme and "
             f"Patient only across the eventive-complement / entity-argument split "
             f"({', '.join(construction_only[:12])}{', …' if len(construction_only) > 12 else ''})\n")
    L.append("| route | event class | Theme n | Patient n | shared fillers | witnesses | since |"
             "\n|---|---|---|---|---|---|---|")
    for r in flips_diag + flips:
        L.append(f"| {'ERROR' if 'determined_role' in r else 'eligible'} | {r['event_class']} "
                 f"| {r['theme_n']} | {r['patient_n']} | {', '.join(r['shared_fillers'][:5]) or '—'} "
                 f"| {len(r['witness_pairs'])} | {r.get('determined_since', '')} |")
    L.append("\n## Eventive complements under Theme / Patient (aspectual & attitude family; "
             "not audited as wobble)\n")
    L.append(f"- {sum(n for _, h, n in eventive if h == 'Theme')} Theme uses over "
             f"{sum(1 for _, h, _ in eventive if h == 'Theme')} classes; "
             f"{sum(n for _, h, n in eventive if h == 'Patient')} Patient uses over "
             f"{sum(1 for _, h, _ in eventive if h == 'Patient')} classes "
             f"(a Patient eventive complement is the rare side — worth a look)\n")
    L.append("| event class | role | eventive uses | fillers |\n|---|---|---|---|")
    for cls, h, n in eventive[:20]:
        ctr = ev_evt[(cls, h)]
        L.append(f"| {cls} | {h} | {n} | "
                 f"{', '.join(f for f, _ in sorted(ctr.items(), key=lambda kv: (-kv[1], kv[0]))[:6])} |")
    L.append("\n## D.3 — prompt-determined classes carrying a forbidden role\n")
    if determined_diag:
        L.append("| event class | determined | forbidden role | n | fillers (kind) | since |\n|---|---|---|---|---|---|")
        for r in determined_diag:
            fl = ", ".join(f"{f} ({'/'.join(sorted(k))})" for f, k in list(r["fillers"].items())[:6])
            L.append(f"| {r['event_class']} | {r['determined_role']} | {r['forbidden_role']} | "
                     f"{r['n']} | {fl} | {r['determined_since']} |")
    else:
        L.append(f"- none: every one of the {n_det_present} determined classes present carries only "
                 "its licensed roles (the item-E cancel / call_off flips were pre-B2 residuals; "
                 "this substrate is post-B2)")

    # FYI (report only, unrouted — judgment call): the FP4 intransitive-subject verbs'
    # Agent fillers in pre-pinned parses (self-powered mover = Agent is licensed)
    fp4 = sorted({v for src in table.get("_sources", []) if src.get("named_since") == pinned
                  for key, _ in ROLE_KEYS for v in src.get(key, [])})
    fyi = [(v, ev_slots[(v, "Agent")]) for v in fp4 if (v, "Agent") in ev_slots]
    if fyi:
        L.append(f"\n## FYI — intransitive-subject verbs named since {pinned}: Agent fillers "
                 "(pre-pinned parses; unrouted, a self-powered mover keeps Agent)\n")
        L.append("| event class | determined subject role | Agent fillers |\n|---|---|---|")
        for v, ctr in fyi:
            L.append(f"| {v} | {determined[v][0]} | "
                     f"{', '.join(f'{f} {mass(c)}' for f, c in sorted(ctr.items(), key=lambda kv: (-kv[1], kv[0])))} |")

    text = "\n".join(L) + "\n"
    if args.report:
        open(args.report, "w", encoding="utf-8").write(text)
        print(f"-> {args.report}")
    print(f"-> {ev_path}  ({n_ev} event slots, {n_oblique} oblique)  |  {en_path}  ({n_en} other slots)")
    print(f"-> {sig_path}  ({n_sig} signals)  |  {diag_path}  ({n_diag} diagnostics)  |  "
          f"{elig_path}  ({len(flips)} eligible flips)")
    print(f"slots {n_ev}+{n_en}  signals {n_sig}  flips eligible {len(flips)} "
          f"error-routed {len(flips_diag)}  determined-role witnesses {len(determined_diag)}  "
          f"construction-only {len(construction_only)}")


if __name__ == "__main__":
    main()
