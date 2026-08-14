"""FUSE-NF §4.3.2 — role-filler distribution clustering (wave 1).

Collects, for every **event-conditioned slot key** ``<event-class>.<Role>``
(``buy.Agent`` — never bare ``Agent``, so generic slots don't pool fillers
across unrelated event types), the distribution of its fillers, then:

* proposes **slot-merge** signals where two slots' filler distributions agree
  (same Role across different event classes — supports event-lemma
  equivalence; same event class across different Roles — a within-class
  role wobble), and
* runs the **#23 audit**: do ``Theme`` and ``Patient`` filler distributions
  actually separate, globally and per event class? An event class attested
  with BOTH roles for its direct object is a flip witness — the corpus-wide
  version of what M1 keeps showing pairwise.

Filler representation is the satellite's **class** (from the canonicalizer's
star decomposition) when the filler is a skolem, the constant itself when it
is a constant, ``<num>``/``<str>``/``<term>`` otherwise. Distribution
similarity is cosine over raw filler counts — the no-embedding baseline the
plan allows ("co-occurrence vectors … no cloud dependency"); an embedding
upgrade generalizes fillers, it does not change this scaffold. Deterministic;
mixed canon versions refused; rule (Implication) atoms skipped — their
fillers are variables.

Usage:
  python role_fillers.py ../canonical/*.canon.jsonl [--min-n 3] [--cos 0.5]
      [--out-dir out] [--report ../eval/rolefillers_wave1.md]
"""

from __future__ import annotations

import argparse
import collections
import json
import math
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir, "harness"))
import canonicalize as C  # noqa: E402

RE_SKOLEM = re.compile(r"\A[exf]\d+\Z")
RE_NUM = re.compile(r"\A[+-]?\d+(?:\.\d+)?\Z")


def load(path):
    return [json.loads(l) for l in open(path, encoding="utf-8") if l.strip()]


def cosine(ca, cb):
    dot = sum(v * cb.get(k, 0) for k, v in ca.items())
    na = math.sqrt(sum(v * v for v in ca.values()))
    nb = math.sqrt(sum(v * v for v in cb.values()))
    return dot / (na * nb) if na and nb else 0.0


def filler_token(arg, star_class):
    if isinstance(arg, list):
        return "<term:%s>" % arg[0]
    if RE_SKOLEM.match(arg):
        return star_class.get(arg) or "<untyped>"
    if arg.startswith('"'):
        return "<str>"
    if RE_NUM.match(arg):
        return "<num>"
    return arg


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("canonical", nargs="+")
    ap.add_argument("--min-n", type=int, default=3, help="min fillers per slot to compare")
    ap.add_argument("--cos", type=float, default=0.5, help="cosine threshold for slot-merge signals")
    ap.add_argument("--out-dir", default=os.path.join(os.path.dirname(os.path.abspath(__file__)), "out"))
    ap.add_argument("--report", default=None)
    args = ap.parse_args()

    raw = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                      os.pardir, "specs", "vocabulary.json"), encoding="utf-8"))
    roles = {n for n, e in raw["operators"].items() if e.get("class") == "role"}

    records, seen, versions = [], set(), set()
    for path in args.canonical:
        for r in load(path):
            versions.add(r.get("schema"))
            if r["id"] in seen:
                continue
            seen.add(r["id"])
            records.append(r)
    if len(versions) > 1:
        raise SystemExit(f"REFUSED: mixed canon versions {sorted(versions)}")

    slots = collections.defaultdict(collections.Counter)   # (event_class, role) -> Counter(filler)
    slot_ids = collections.defaultdict(set)
    for rec in records:
        star_class = {s: st.get("class") for s, st in rec["stars"].items()}
        parsed = [C.parse_term(a["term"]) for a in rec["atoms"]]
        for sym, star in sorted(rec["stars"].items()):
            if star["kind"] != "event" or not RE_SKOLEM.match(sym):
                continue
            ev_class = star.get("class") or "<unclassed>"
            for i in star["atoms"]:
                t = parsed[i]
                if t[0] in roles and len(t) == 3 and t[1] == sym:
                    tok = filler_token(t[2], star_class)
                    slots[(ev_class, t[0])][tok] += 1
                    slot_ids[(ev_class, t[0])].add(rec["id"])

    os.makedirs(args.out_dir, exist_ok=True)
    slot_rows = []
    for (ev, role), ctr in sorted(slots.items()):
        slot_rows.append({
            "slot": f"{ev}.{role}", "event_class": ev, "role": role,
            "n": sum(ctr.values()), "distinct": len(ctr), "docs": len(slot_ids[(ev, role)]),
            "fillers": dict(sorted(ctr.items(), key=lambda kv: (-kv[1], kv[0]))[:12]),
        })
    with open(os.path.join(args.out_dir, "slots.jsonl"), "w", encoding="utf-8") as fh:
        for r in slot_rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")

    # ---- slot-merge comparisons ------------------------------------------
    big = {k: v for k, v in slots.items() if sum(v.values()) >= args.min_n}
    keys = sorted(big)
    same_role, same_event = [], []
    for i, ka in enumerate(keys):
        for kb in keys[i + 1:]:
            if ka[1] == kb[1] and ka[0] != kb[0]:
                bucket = same_role
            elif ka[0] == kb[0] and ka[1] != kb[1]:
                bucket = same_event
            else:
                continue
            shared = set(big[ka]) & set(big[kb])
            cos = cosine(big[ka], big[kb])
            if cos >= args.cos and len(shared) >= 2:
                bucket.append({
                    "slot_a": f"{ka[0]}.{ka[1]}", "slot_b": f"{kb[0]}.{kb[1]}",
                    "cosine": round(cos, 3), "shared_fillers": sorted(shared)[:8],
                    "n_a": sum(big[ka].values()), "n_b": sum(big[kb].values()),
                })
    for bucket in (same_role, same_event):
        bucket.sort(key=lambda r: (-r["cosine"], r["slot_a"], r["slot_b"]))

    with open(os.path.join(args.out_dir, "rolefiller_signals.jsonl"), "w", encoding="utf-8") as fh:
        for sub, rows_ in (("cross-event", same_role), ("cross-role", same_event)):
            for r in rows_:
                fh.write(json.dumps({
                    "candidate": {"slot_a": r["slot_a"], "slot_b": r["slot_b"], "subtype": sub},
                    # cosine of filler-count vectors — a similarity, not a probability.
                    "confidence": r["cosine"], "kind": "slot-merge",
                    "support": min(r["n_a"], r["n_b"]),
                    "shared_fillers": r["shared_fillers"],
                    "method": "role-fillers-4.3.2",
                }, ensure_ascii=False, sort_keys=True) + "\n")

    # ---- #23 audit: Theme vs Patient --------------------------------------
    theme = collections.Counter()
    patient = collections.Counter()
    for (ev, role), ctr in slots.items():
        if role == "Theme":
            theme.update(ctr)
        elif role == "Patient":
            patient.update(ctr)
    shared_global = set(theme) & set(patient)
    flip = []
    for ev in sorted({ev for ev, role in slots if role in ("Theme", "Patient")}):
        nt = sum(slots.get((ev, "Theme"), {}).values())
        np_ = sum(slots.get((ev, "Patient"), {}).values())
        if nt and np_:
            both = set(slots[(ev, "Theme")]) & set(slots[(ev, "Patient")])
            flip.append({"event_class": ev, "theme_n": nt, "patient_n": np_,
                         "shared_fillers": sorted(both)})
    flip.sort(key=lambda r: (-min(r["theme_n"], r["patient_n"]), r["event_class"]))
    n_obj_classes = len({ev for ev, role in slots if role in ("Theme", "Patient")})

    L = []
    L.append("# §4.3.2 role-filler distributions — wave 1\n")
    L.append(f"- inputs: {len(records)} records (canon {sorted(versions)[0]}); "
             f"slots: {len(slots)} event-conditioned keys, {len(big)} with n>={args.min_n}")
    L.append(f"- slot-merge signals: {len(same_role)} cross-event (same role), "
             f"{len(same_event)} cross-role (same event class); cosine>={args.cos}, "
             f">=2 shared fillers\n")
    L.append("## Cross-event slot agreement (supports event-lemma equivalence)\n")
    L.append("| cosine | slot A | slot B | shared fillers |\n|---|---|---|---|")
    for r in same_role[:20]:
        L.append(f"| {r['cosine']:.2f} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                 f"| {', '.join(r['shared_fillers'][:5])} |")
    L.append("\n## Cross-role slot agreement within one event class\n")
    L.append("| cosine | slot A | slot B | shared fillers |\n|---|---|---|---|")
    for r in same_event[:15]:
        L.append(f"| {r['cosine']:.2f} | {r['slot_a']} ({r['n_a']}) | {r['slot_b']} ({r['n_b']}) "
                 f"| {', '.join(r['shared_fillers'][:5])} |")
    L.append("\n## #23 audit — Theme vs Patient\n")
    L.append(f"- global filler vocabularies: Theme {len(theme)} distinct ({sum(theme.values())} uses), "
             f"Patient {len(patient)} distinct ({sum(patient.values())} uses); "
             f"**{len(shared_global)} filler classes appear under BOTH** "
             f"(global cosine {cosine(theme, patient):.3f})")
    L.append(f"- event classes taking a direct object: {n_obj_classes}; "
             f"**flip witnesses (both roles attested): {len(flip)}**\n")
    L.append("| event class | Theme n | Patient n | fillers seen under both |\n|---|---|---|---|")
    for r in flip[:20]:
        L.append(f"| {r['event_class']} | {r['theme_n']} | {r['patient_n']} "
                 f"| {', '.join(r['shared_fillers'][:5]) or '—'} |")
    text = "\n".join(L) + "\n"
    if args.report:
        open(args.report, "w", encoding="utf-8").write(text)
        print(f"-> {args.report}")
    print(f"-> {os.path.join(args.out_dir, 'slots.jsonl')}  ({len(slot_rows)} slots)")
    print(f"-> {os.path.join(args.out_dir, 'rolefiller_signals.jsonl')}  "
          f"({len(same_role) + len(same_event)} signals)")
    print(f"slots {len(slots)}  cross-event {len(same_role)}  cross-role {len(same_event)}  "
          f"flip-witnesses {len(flip)}/{n_obj_classes}")


if __name__ == "__main__":
    main()
