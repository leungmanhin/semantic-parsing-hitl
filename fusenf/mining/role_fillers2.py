"""FUSE-NF §4.3.2 upgrade — role fillers on the valuation export (item E).

Consumes ``frequent_patterns2``'s ``valuations_slots.jsonl`` instead of
re-walking the canon files: the miner's enumeration IS the valuation set of
the 1-clause slot patterns, so this script is pure aggregation — and the
batch-1 **event-only restriction dissolves**: entity-conditioned slots
(``box.On``, ``cistern.Measure``) are first-class now, reported and compared
by the same machinery (entity signals are tagged; they feed consolidation
species, not role bridges).

Batch-1 semantics kept verbatim: slots are center-CLASS-conditioned (never
bare roles), filler distributions compared by cosine over raw counts,
signals for cross-event same-role (supports event-lemma equivalence) and
cross-role same-event (role wobble), plus the #23 Theme-vs-Patient audit.

NEW — owner decision D.3 (2026-08-21, error-vs-variance): a Theme/Patient
flip witness on an event class whose direct-object role ``prompt.txt``
DETERMINES (curated table ``prompt_determined_roles.json``, named verbs
only) is a PARSE ERROR — routed to ``flip_diagnostics.jsonl`` for the
diagnosis/re-parse path, never a bridge candidate; cross-role signals on
determined classes are quarantined the same way. Only prompt-UNDETERMINED
classes may propose Theme<->Patient bridges.

Deterministic; no clock, no randomness.

Usage:
  python role_fillers2.py [--slots-in out_e/valuations_slots.jsonl]
      [--min-n 3] [--cos 0.5] [--out-dir out_e] [--report ../eval/...]
"""

from __future__ import annotations

import argparse
import collections
import json
import math
import os


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def cosine(ca, cb):
    dot = sum(v * cb.get(k, 0) for k, v in ca.items())
    na = math.sqrt(sum(v * v for v in ca.values()))
    nb = math.sqrt(sum(v * v for v in cb.values()))
    return dot / (na * nb) if na and nb else 0.0


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    ap = argparse.ArgumentParser()
    ap.add_argument("--slots-in", default=os.path.join(here, "out_e", "valuations_slots.jsonl"))
    ap.add_argument("--min-n", type=int, default=3)
    ap.add_argument("--cos", type=float, default=0.5)
    ap.add_argument("--out-dir", default=os.path.join(here, "out_e"))
    ap.add_argument("--report", default=None)
    args = ap.parse_args()

    raw = json.load(open(os.path.join(here, os.pardir, "specs", "vocabulary.json"),
                         encoding="utf-8"))
    roles = {n for n, e in raw["operators"].items() if e.get("class") == "role"}
    doctrine = json.load(open(os.path.join(here, "prompt_determined_roles.json"),
                              encoding="utf-8"))
    determined = {}
    for role_name, verbs in (("Theme", doctrine["theme"]),
                             ("Patient", doctrine["patient"]),
                             ("Experiencer/Stimulus", doctrine["experiencer_stimulus"])):
        for v in verbs:
            determined[v] = role_name

    slots = collections.defaultdict(collections.Counter)   # (kind, class, head) -> fillers
    slot_docs = collections.Counter()
    for row in load(args.slots_in):
        key = (row["center_kind"], row["center_class"], row["head"])
        slots[key][row["filler"]] += row["n"]
        slot_docs[key] += row["docs"]   # per-filler doc counts; upper bound per slot

    os.makedirs(args.out_dir, exist_ok=True)
    ev_path = os.path.join(args.out_dir, "slots.jsonl")
    en_path = os.path.join(args.out_dir, "slots_entity.jsonl")
    n_ev = n_en = 0
    with open(ev_path, "w", encoding="utf-8") as fe, \
         open(en_path, "w", encoding="utf-8") as fn:
        for (kind, cls, head), ctr in sorted(slots.items()):
            row = {
                "slot": f"{cls}.{head}", "event_class": cls, "role": head,
                "center_kind": kind,
                "n": sum(ctr.values()), "distinct": len(ctr),
                "docs": slot_docs[(kind, cls, head)],
                "fillers": dict(sorted(ctr.items(), key=lambda kv: (-kv[1], kv[0]))[:12]),
            }
            if kind == "event" and head in roles:
                fe.write(json.dumps(row, ensure_ascii=False, sort_keys=True) + "\n")
                n_ev += 1
            else:
                fn.write(json.dumps(row, ensure_ascii=False, sort_keys=True) + "\n")
                n_en += 1

    # ---- slot-merge comparisons (per center kind) --------------------------
    def compare(kind_sel, role_filter):
        big = {k: v for k, v in slots.items()
               if k[0] == kind_sel and sum(v.values()) >= args.min_n
               and (not role_filter or k[2] in roles)}
        keys = sorted(big)
        same_role, same_center = [], []
        for i, ka in enumerate(keys):
            for kb in keys[i + 1:]:
                if ka[2] == kb[2] and ka[1] != kb[1]:
                    bucket = same_role
                elif ka[1] == kb[1] and ka[2] != kb[2]:
                    bucket = same_center
                else:
                    continue
                shared = set(big[ka]) & set(big[kb])
                cos = cosine(big[ka], big[kb])
                if cos >= args.cos and len(shared) >= 2:
                    bucket.append({
                        "slot_a": f"{ka[1]}.{ka[2]}", "slot_b": f"{kb[1]}.{kb[2]}",
                        "class_a": ka[1], "class_b": kb[1],
                        "role_a": ka[2], "role_b": kb[2],
                        "cosine": round(cos, 3), "shared_fillers": sorted(shared)[:8],
                        "n_a": sum(big[ka].values()), "n_b": sum(big[kb].values()),
                    })
        for bucket in (same_role, same_center):
            bucket.sort(key=lambda r: (-r["cosine"], r["slot_a"], r["slot_b"]))
        return same_role, same_center

    ev_same_role, ev_same_event = compare("event", True)
    en_same_role, en_same_center = compare("entity", False)

    # D.3 split on the cross-role bucket
    def d3_route(rows_):
        ok, diag = [], []
        for r in rows_:
            det = determined.get(r["class_a"])
            if det and {r["role_a"], r["role_b"]} & {"Theme", "Patient"}:
                r["determined_role"] = det
                diag.append(r)
            else:
                ok.append(r)
        return ok, diag

    ev_same_event, d3_signals_diag = d3_route(ev_same_event)

    sig_path = os.path.join(args.out_dir, "rolefiller2_signals.jsonl")
    with open(sig_path, "w", encoding="utf-8") as fh:
        for sub, kind, rows_ in (("cross-event", "event", ev_same_role),
                                 ("cross-role", "event", ev_same_event),
                                 ("cross-entity-class", "entity", en_same_role),
                                 ("cross-head", "entity", en_same_center)):
            for r in rows_:
                fh.write(json.dumps({
                    "candidate": {"slot_a": r["slot_a"], "slot_b": r["slot_b"],
                                  "subtype": sub, "center_kind": kind},
                    # cosine of filler-count vectors — a similarity, not a probability.
                    "confidence": r["cosine"], "kind": "slot-merge",
                    "support": min(r["n_a"], r["n_b"]),
                    "shared_fillers": r["shared_fillers"],
                    "method": "role-fillers2-4.3.2",
                }, ensure_ascii=False, sort_keys=True) + "\n")
    n_sig = len(ev_same_role) + len(ev_same_event) + len(en_same_role) + len(en_same_center)

    # ---- #23 audit + D.3 flip routing --------------------------------------
    theme = collections.Counter()
    patient = collections.Counter()
    ev_slots = {(c, h): v for (k, c, h), v in slots.items() if k == "event"}
    for (cls, head), ctr in ev_slots.items():
        if head == "Theme":
            theme.update(ctr)
        elif head == "Patient":
            patient.update(ctr)
    shared_global = set(theme) & set(patient)
    flips, flips_diag = [], []
    obj_classes = {cls for cls, head in ev_slots if head in ("Theme", "Patient")}
    for cls in sorted(obj_classes):
        nt = sum(ev_slots.get((cls, "Theme"), {}).values())
        np_ = sum(ev_slots.get((cls, "Patient"), {}).values())
        if nt and np_:
            both = set(ev_slots[(cls, "Theme")]) & set(ev_slots[(cls, "Patient")])
            row = {"event_class": cls, "theme_n": nt, "patient_n": np_,
                   "shared_fillers": sorted(both)}
            det = determined.get(cls)
            if det:
                row["determined_role"] = det
                row["route"] = "parse-error (D.3: prompt-determined class)"
                flips_diag.append(row)
            else:
                row["route"] = "bridge-eligible (prompt-undetermined)"
                flips.append(row)
    for bucket in (flips, flips_diag):
        bucket.sort(key=lambda r: (-min(r["theme_n"], r["patient_n"]), r["event_class"]))

    diag_path = os.path.join(args.out_dir, "flip_diagnostics.jsonl")
    with open(diag_path, "w", encoding="utf-8") as fh:
        for r in flips_diag:
            fh.write(json.dumps(dict(r, source="flip-witness"),
                                ensure_ascii=False, sort_keys=True) + "\n")
        for r in d3_signals_diag:
            fh.write(json.dumps(dict(r, source="cross-role-signal"),
                                ensure_ascii=False, sort_keys=True) + "\n")

    # ---- report ------------------------------------------------------------
    L = []
    L.append("# §4.3.2 role fillers 2 (valuation export) — item E\n")
    L.append(f"- input: {os.path.basename(args.slots_in)}; slots: {n_ev} event-role, "
             f"{n_en} entity/other (the batch-1 event-only restriction is gone)")
    L.append(f"- signals: {len(ev_same_role)} cross-event + {len(ev_same_event)} cross-role"
             f" (event) + {len(en_same_role)} cross-entity-class + {len(en_same_center)}"
             f" cross-head (entity); cosine>={args.cos}, >=2 shared fillers")
    L.append(f"- D.3 routing: {len(flips_diag)} flip witnesses + {len(d3_signals_diag)}"
             f" cross-role signals on prompt-DETERMINED classes -> flip_diagnostics.jsonl"
             f" (parse-error path, NOT bridge candidates)\n")

    def table(title, rows_, cols, n=15):
        L.append(f"## {title}\n")
        L.append("| " + " | ".join(cols) + " |\n|" + "---|" * len(cols))
        for r in rows_[:n]:
            L.append("| " + " | ".join(str(r.get(c.replace(" ", "_"), "")) for c in cols) + " |")
        L.append("")

    L.append("## Cross-event slot agreement (supports event-lemma equivalence)\n")
    L.append("| cosine | slot A | slot B | shared fillers |\n|---|---|---|---|")
    for r in ev_same_role[:20]:
        L.append(f"| {r['cosine']:.2f} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                 f"| {', '.join(r['shared_fillers'][:5])} |")
    L.append("\n## Cross-role agreement within one event class (bridge-eligible only)\n")
    L.append("| cosine | slot A | slot B | shared fillers |\n|---|---|---|---|")
    for r in ev_same_event[:15]:
        L.append(f"| {r['cosine']:.2f} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                 f"| {', '.join(r['shared_fillers'][:5])} |")
    L.append("\n## Entity-conditioned slots (NEW) — cross-head agreement\n")
    L.append("| cosine | slot A | slot B | shared fillers |\n|---|---|---|---|")
    for r in (en_same_center + en_same_role)[:15]:
        L.append(f"| {r['cosine']:.2f} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                 f"| {', '.join(r['shared_fillers'][:5])} |")
    L.append("\n## #23 audit — Theme vs Patient\n")
    L.append(f"- global filler vocabularies: Theme {len(theme)} distinct ({sum(theme.values())} uses), "
             f"Patient {len(patient)} distinct ({sum(patient.values())} uses); "
             f"**{len(shared_global)} filler classes under BOTH** "
             f"(global cosine {cosine(theme, patient):.3f})")
    L.append(f"- flip witnesses: **{len(flips)} bridge-eligible** (prompt-undetermined) + "
             f"**{len(flips_diag)} parse-error-routed** (D.3)\n")
    L.append("| route | event class | Theme n | Patient n | shared fillers |\n|---|---|---|---|---|")
    for r in flips_diag + flips:
        L.append(f"| {'ERROR' if 'determined_role' in r else 'eligible'} | {r['event_class']} "
                 f"| {r['theme_n']} | {r['patient_n']} | {', '.join(r['shared_fillers'][:5]) or '—'} |")

    text = "\n".join(L) + "\n"
    if args.report:
        open(args.report, "w", encoding="utf-8").write(text)
        print(f"-> {args.report}")
    print(f"-> {ev_path}  ({n_ev} event slots)  |  {en_path}  ({n_en} entity slots)")
    print(f"-> {sig_path}  ({n_sig} signals)  |  {diag_path}  "
          f"({len(flips_diag) + len(d3_signals_diag)} diagnostics)")
    print(f"slots {n_ev}+{n_en}  signals {n_sig}  flips eligible {len(flips)} "
          f"error-routed {len(flips_diag)}")


if __name__ == "__main__":
    main()
