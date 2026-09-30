"""Pilot tool: select the substrates, make batches, assemble raw output, score, report.

    cd templates && /home/manhin/Dev/.venv-dev/bin/python -m tmpl.pilot <command> ...

Deterministic throughout: no clock (dates are arguments), no randomness (sampling is by
sha256 order), no set iteration reaching an output. Pilot files never enter fusenf/raw or
fusenf/parses; `out/` files are regenerated, not appended to.

Arms:  t26 = blind parser + generated instruction set -> template records -> emitter -> atoms
       ctl = blind parser + prompt.txt -> atoms            (the current parser, the control)
"""
from __future__ import annotations

import argparse
import collections
import hashlib
import itertools
import json
import os
import re
import sys

from . import emitter as E, goldens as GO, records as R, registry as REG

sys.path.insert(0, os.path.join(REG.REPO, "fusenf", "harness"))
import canonicalize as C  # noqa: E402
import m1_stability as M1  # noqa: E402
import records as HR  # noqa: E402
import validator as V  # noqa: E402

PILOT = os.path.join(REG.ROOT, "pilot")
VOCAB = os.path.join(REG.REPO, "fusenf", "specs", "vocabulary.json")
PROMPT_T26 = os.path.join(REG.ROOT, "generated", "PROMPT_T26.txt")
PROMPT_CTL = os.path.join(REG.REPO, "prompt.txt")
SEEDED = os.path.join(REG.REPO, "seeded_rules.metta")
TIERA_M1 = os.path.join(REG.REPO, "fusenf", "corpora", "tierA_m1v7.jsonl")
ARMS = ("t26", "ctl")
RAW_EXT = {"t26": "json", "ctl": "txt"}
FULL_DIV, PART_DIV, PART_MIN = 6, 8, 3          # the pre-registered sampling rule
DEV_FULL, DEV_PART = 7, 3
BATCH = 5


def sha_file(path: str) -> str:
    with open(path, "rb") as fh:
        return hashlib.sha256(fh.read()).hexdigest()


def read_jsonl(path: str) -> list[dict]:
    with open(path, encoding="utf-8") as fh:
        return [json.loads(line) for line in fh if line.strip()]


def write_jsonl(path: str, rows) -> None:
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")


def write_json(path: str, obj) -> None:
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as fh:
        json.dump(obj, fh, ensure_ascii=False, indent=1, sort_keys=True)
        fh.write("\n")


def vocab_heads() -> frozenset:
    return frozenset(json.load(open(VOCAB, encoding="utf-8"))["operators"])


# ----------------------------------------------------------------------------- select
def _corpus_item(case: dict, cov: str, outside: list) -> dict:
    item = {"schema": "fusenf-corpus/1", "id": case["gid"],
            "source": "regression/regression_cases.md", "sentences": [case["text"]],
            "context": {"today": None, "domain": None, "prior": [], "notes": None},
            "equiv_class": None,
            "labels": {"family": case["section"], "tag": case["tag"], "coverage_pred": cov,
                       "outside_heads": outside}}
    item["input_sha256"] = HR.input_sha256(item)
    return item


def cmd_select(args) -> int:
    VH = vocab_heads()
    cases = GO.load()
    for i, c in enumerate(cases):
        c["gid"] = "gold-%06d" % (i + 1)                    # position in the golden file
    el = [c for c in cases if GO.eligible(c)]
    for c in el:
        c["cov"], c["outside"] = GO.coverage_class(c, VH)
    by = collections.OrderedDict()
    for c in el:
        by.setdefault(c["section"], {"full": [], "partial": []})[c["cov"]].append(c)
    sample = []
    for _sec, d in by.items():
        f = sorted(d["full"], key=lambda c: c["order_key"])
        p = sorted(d["partial"], key=lambda c: c["order_key"])
        kf = max(1, round(len(f) / FULL_DIV)) if f else 0
        kp = max(1, round(len(p) / PART_DIV)) if len(p) >= PART_MIN else 0
        sample += f[:kf] + p[:kp]
    taken = {c["gid"] for c in sample}
    rest = sorted((c for c in el if c["gid"] not in taken), key=lambda c: c["order_key"])
    dev = ([c for c in rest if c["cov"] == "full"][:DEV_FULL]
           + [c for c in rest if c["cov"] == "partial"][:DEV_PART])
    sets = {"gold": sorted(sample, key=lambda c: c["gid"]),
            "dev": sorted(dev, key=lambda c: c["gid"])}
    for name, cs in sets.items():
        write_jsonl(os.path.join(PILOT, "corpus", f"{name}.jsonl"),
                    [_corpus_item(c, c["cov"], c["outside"]) for c in cs])
        write_jsonl(os.path.join(PILOT, "corpus", f"{name}.expected.jsonl"),
                    [{"id": c["gid"], "tag": c["tag"], "statements": c["statements"]} for c in cs])
    tiera = read_jsonl(TIERA_M1)
    write_jsonl(os.path.join(PILOT, "corpus", "tiera.jsonl"), tiera)
    manifest = {
        "date": args.date,
        "rule": {"eligible": "statement cases; sections 'Context input' and 'Queries' excluded; "
                             "no query line; no Interpretation wrapper",
                 "stratum": "golden section x head-based coverage prediction",
                 "order": "sha256(tag) ascending within stratum",
                 "full_per_section": f"max(1, round(n_full / {FULL_DIV}))",
                 "partial_per_section": f"max(1, round(n_partial / {PART_DIV})) "
                                        f"when n_partial >= {PART_MIN}",
                 "dev": f"first {DEV_FULL} full + first {DEV_PART} partial of the remainder in "
                        "global sha256(tag) order; excluded from every later evaluation"},
        "counts": {"golden_cases": len(cases), "eligible": len(el),
                   "gold": len(sets["gold"]),
                   "gold_pred_full": sum(1 for c in sets["gold"] if c["cov"] == "full"),
                   "dev": len(sets["dev"]), "tiera": len(tiera),
                   "untouched_pool": len(el) - len(sets["gold"]) - len(sets["dev"])},
        "sha256": {"goldens": sha_file(GO.GOLDENS), "registry": REG.load()["_sha256"],
                   "prompt_t26": sha_file(PROMPT_T26), "prompt_ctl": sha_file(PROMPT_CTL),
                   "seeded": sha_file(SEEDED), "tiera_m1": sha_file(TIERA_M1),
                   "emitter": sha_file(os.path.join(REG.HERE, "emitter.py")),
                   "records": sha_file(os.path.join(REG.HERE, "records.py"))},
        "ids": {k: [c["gid"] for c in v] for k, v in sets.items()},
    }
    write_json(os.path.join(PILOT, "manifest.json"), manifest)
    print(json.dumps(manifest["counts"], indent=1))
    return 0


# ----------------------------------------------------------------------------- batches
def cmd_batches(args) -> int:
    items = read_jsonl(os.path.join(PILOT, "corpus", f"{args.set}.jsonl"))
    rows = sorted(((" ".join(i["sentences"]), i["id"]) for i in items),
                  key=lambda r: (-len(r[0]), r[1]))
    n = -(-len(rows) // BATCH)
    batches = [[] for _ in range(n)]
    for k, row in enumerate(rows):                      # snake order balances the lengths
        lap, pos = divmod(k, n)
        batches[pos if lap % 2 == 0 else n - 1 - pos].append(row)
    out_dir = os.path.join(PILOT, "batches", args.set)
    os.makedirs(out_dir, exist_ok=True)
    roster = {}
    for b, rows_b in enumerate(batches, 1):
        name = f"b-{b:02d}"
        with open(os.path.join(out_dir, name + ".txt"), "w", encoding="utf-8") as fh:
            for text, iid in sorted(rows_b, key=lambda r: r[1]):
                if "\t" in text or "\n" in text:
                    raise SystemExit(f"{iid}: TEXT holds a tab or newline")
                fh.write(f"{iid}\t{text}\n")
        roster[name] = sorted(r[1] for r in rows_b)
    write_json(os.path.join(out_dir, "roster.json"), roster)
    print(f"{args.set}: {len(rows)} items in {n} batches -> {out_dir}")
    return 0


# ----------------------------------------------------------------------------- assemble
_FENCE = re.compile(r"^\s*```[A-Za-z0-9_-]*\s*$")


def _load_record_file(path: str):
    """JSON only. Non-semantic wrappers (code fences) are removed; content is never repaired."""
    text = open(path, encoding="utf-8").read()
    lines = [l for l in text.split("\n") if not _FENCE.match(l)]
    stripped = len(lines) != len(text.split("\n"))
    try:
        return json.loads("\n".join(lines)), stripped, None
    except json.JSONDecodeError as exc:
        return None, stripped, f"{exc.msg} at line {exc.lineno}"


def cmd_assemble(args) -> int:
    arm, reg = args.arm, REG.load()
    corpus = read_jsonl(os.path.join(PILOT, "corpus", f"{args.set}.jsonl"))
    vocab = V.load_vocab(VOCAB)
    index = {c["id"]: c for c in corpus}
    prov = {"model": args.model, "harness": HR.HARNESS_VERSION, "date": args.date,
            "prompt_sha256": sha_file(PROMPT_T26 if arm == "t26" else PROMPT_CTL),
            "seeded_sha256": sha_file(SEEDED), "batch": f"pilot-{args.set}-{arm}"}
    raw_dir = os.path.join(PILOT, "raw", arm)
    parses, side, missing = [], [], []
    for item in corpus:
        for run in range(1, args.runs + 1):
            path = os.path.join(raw_dir, f"{item['id']}__run{run}.{RAW_EXT[arm]}")
            if not os.path.exists(path):
                missing.append(f"{item['id']}__run{run}")
                continue
            info = {"id": item["id"], "run": run, "arm": arm}
            if arm == "ctl":
                statements, strip_log = HR.extract_atoms(open(path, encoding="utf-8").read())
                info["strip_log"] = strip_log
            else:
                rec, stripped, err = _load_record_file(path)
                info["fence_stripped"] = stripped
                if err is not None:
                    info["r_findings"] = [{"code": "R1", "index": None, "detail": "not JSON: " + err}]
                    info["valid"] = False
                    side.append(info)
                    continue
                if isinstance(rec, dict) and rec.get("id") != item["id"]:
                    info["id_in_file"] = rec.get("id")
                    rec = dict(rec, id=item["id"]) if "id" in rec else rec
                res = R.validate(rec, reg)
                info["r_findings"], info["valid"] = res["findings"], res["ok"]
                info["records"] = rec
                if not res["ok"]:
                    side.append(info)
                    continue
                out = E.emit(rec, reg)
                statements = out["statements"]
                info.update({k: out[k] for k in ("detail", "fired", "derived", "losses", "unmapped")})
            record = HR.build_record(item, statements, run, prov)
            result = V.validate(record, vocab, index, include_c7=False)
            HR.attach_validation(record, V.validation_block(result))
            info["c_findings"] = [{"code": f["code"], "detail": f["detail"]}
                                  for f in result["findings"]]
            parses.append(record)
            side.append(info)
    base = os.path.join(PILOT, "out", f"{args.set}.{arm}")
    write_jsonl(base + ".parses.jsonl", parses)
    write_jsonl(base + ".side.jsonl", side)
    write_jsonl(base + ".canon.jsonl", [C.canonicalize(p, vocab=C.load_vocabulary()) for p in parses])
    print(f"{args.set}/{arm}: {len(parses)} parse records, {len(side) - len(parses)} invalid, "
          f"{len(missing)} missing")
    if missing:
        print("  missing:", ", ".join(missing[:12]) + (" …" if len(missing) > 12 else ""))
    return 0


# ----------------------------------------------------------------------------- score
_SK = re.compile(r"\b[ex][0-9]+\b")
_FN = re.compile(r"\(f[0-9]+\b")


def wild(atom: dict) -> str:
    term = _FN.sub("(FN", _SK.sub("SK", atom["term"]))
    return f"{term} (STV {atom['stv'][0]} {atom['stv'][1]})"


def compare(parse_canon: dict, gold_canon: dict) -> dict:
    wp = [(wild(a), a.get("proof_name")) for a in parse_canon["atoms"]]
    wg = collections.Counter(wild(a) for a in gold_canon["atoms"])
    left = collections.Counter(wg)
    only_parse = []
    for key, name in wp:
        if left[key] > 0:
            left[key] -= 1
        else:
            only_parse.append({"atom": key, "proof_name": name})
    only_gold = sorted(left.elements())
    n_p, n_g = len(wp), sum(wg.values())
    hit = n_p - len(only_parse)
    return {"exact": parse_canon["graph_id"] == gold_canon["graph_id"],
            "shape": parse_canon["shape_id"] == gold_canon["shape_id"],
            "precision": round(hit / n_p, 4) if n_p else None,
            "recall": round(hit / n_g, 4) if n_g else None,
            "soft_jaccard": round(C.soft_jaccard(parse_canon, gold_canon), 4),
            "only_parse": only_parse, "only_gold": only_gold,
            "n_parse": n_p, "n_gold": n_g}


def cmd_score(args) -> int:
    base = os.path.join(PILOT, "out", f"{args.set}.{args.arm}")
    canon = read_jsonl(base + ".canon.jsonl")
    side = {(s["id"], s["run"]): s for s in read_jsonl(base + ".side.jsonl")}
    exp_path = os.path.join(PILOT, "corpus", f"{args.set}.expected.jsonl")
    expected = {}
    if os.path.exists(exp_path):
        for e in read_jsonl(exp_path):
            expected[e["id"]] = C.canonicalize({"id": e["id"], "run": 0,
                                                "statements": e["statements"]})
    vocab = json.load(open(VOCAB, encoding="utf-8"))
    roles = {n for n, r in vocab["operators"].items() if r.get("class") == "role"}
    rows = []
    for c in canon:
        s = side.get((c["id"], c["run"]), {})
        row = {"id": c["id"], "run": c["run"], "arm": args.arm, "graph_id": c["graph_id"],
               "n_atoms": len(c["atoms"]),
               "unmapped": s.get("unmapped", []), "fired": s.get("fired", {}),
               "derived": s.get("derived", {}), "losses": s.get("losses", []),
               "c_findings": s.get("c_findings", [])}
        row["claims_full"] = (args.arm == "ctl") or not row["unmapped"]
        if c["id"] in expected:
            cmp_ = compare(c, expected[c["id"]])
            owners = {d["name"]: d["owner"] for d in s.get("detail", [])}
            for o in cmp_["only_parse"]:
                o["owner"] = owners.get(o["proof_name"])
            if not cmp_["exact"]:
                cmp_["bucket"] = M1.attribute(c, expected[c["id"]], roles)
            row["vs_gold"] = cmp_
        rows.append(row)
    write_jsonl(base + ".scores.jsonl", rows)
    print(f"{args.set}/{args.arm}: scored {len(rows)} parses"
          + (f", {sum(1 for r in rows if r.get('vs_gold', {}).get('exact'))} exact vs golden"
             if expected else ""))
    return 0


# ----------------------------------------------------------------------------- report
def _stability(canon: list[dict]) -> dict:
    by = collections.OrderedDict()
    for c in sorted(canon, key=lambda c: (c["id"], c["run"])):
        by.setdefault(c["id"], []).append(c)
    pairs = agree = unanimous = items = 0
    modal = 0.0
    for _cid, runs in by.items():
        if len(runs) < 2:
            continue
        items += 1
        ps = list(itertools.combinations(runs, 2))
        pairs += len(ps)
        agree += sum(1 for a, b in ps if a["graph_id"] == b["graph_id"])
        counts = collections.Counter(r["graph_id"] for r in runs)
        unanimous += 1 if len(counts) == 1 else 0
        modal += max(counts.values()) / len(runs)
    return {"items": items, "pairs": pairs,
            "pairwise_agreement": round(agree / pairs, 4) if pairs else None,
            "unanimity": round(unanimous / items, 4) if items else None,
            "modal_share": round(modal / items, 4) if items else None}


def _mean(xs):
    xs = [x for x in xs if x is not None]
    return round(sum(xs) / len(xs), 4) if xs else None


def summarize(set_name: str, arm: str) -> dict:
    base = os.path.join(PILOT, "out", f"{set_name}.{arm}")
    rows = read_jsonl(base + ".scores.jsonl")
    side = read_jsonl(base + ".side.jsonl")
    canon = read_jsonl(base + ".canon.jsonl")
    scored = [r for r in rows if "vs_gold" in r]
    full = [r for r in scored if r["claims_full"]]
    part = [r for r in scored if not r["claims_full"]]
    out = {"arm": arm, "set": set_name, "raw_files": len(side), "parse_records": len(rows),
           "invalid_records": sum(1 for s in side if s.get("valid") is False),
           "r_findings": collections.Counter(f["code"] for s in side
                                             for f in s.get("r_findings", [])),
           "c_findings": collections.Counter(f["code"] for r in rows for f in r["c_findings"]),
           "stability": _stability(canon)}
    if scored:
        out["fidelity"] = {
            "scored": len(scored),
            "claims_full": len(full),
            "exact_on_claims_full": sum(1 for r in full if r["vs_gold"]["exact"]),
            "exact_rate_on_claims_full": _mean([1.0 if r["vs_gold"]["exact"] else 0.0
                                                for r in full]),
            "exact_overall": sum(1 for r in scored if r["vs_gold"]["exact"]),
            "precision_mean": _mean([r["vs_gold"]["precision"] for r in scored]),
            "recall_mean": _mean([r["vs_gold"]["recall"] for r in scored]),
            "precision_mean_on_partial": _mean([r["vs_gold"]["precision"] for r in part]),
            "soft_jaccard_mean": _mean([r["vs_gold"]["soft_jaccard"] for r in scored]),
            "parses_with_extra_atoms": sum(1 for r in scored if r["vs_gold"]["only_parse"]),
            "silent_drops": sum(1 for r in full if r["vs_gold"]["only_gold"]),
            "buckets": collections.Counter(r["vs_gold"]["bucket"] for r in scored
                                           if not r["vs_gold"]["exact"]),
            "extra_atoms_by_owner": collections.Counter(
                o.get("owner") or "?" for r in scored for o in r["vs_gold"]["only_parse"]),
        }
    if arm == "t26":
        out["coverage"] = {
            "claims_full_share": _mean([1.0 if r["claims_full"] else 0.0 for r in rows]),
            "unmapped_codes": collections.Counter(u["code"] for r in rows for u in r["unmapped"]),
            "fired": sum((collections.Counter(r["fired"]) for r in rows), collections.Counter()),
            "derived": sum((collections.Counter(r["derived"]) for r in rows),
                           collections.Counter()),
            "losses": collections.Counter(l["code"] for r in rows for l in r["losses"]),
        }
    return out


def _fmt_counter(c) -> str:
    return ", ".join(f"{k} {v}" for k, v in sorted(c.items(), key=lambda kv: (-kv[1], str(kv[0])))) or "—"


def cmd_report(args) -> int:
    arms = [a for a in ARMS
            if os.path.exists(os.path.join(PILOT, "out", f"{args.set}.{a}.scores.jsonl"))]
    sums = {a: summarize(args.set, a) for a in arms}
    corpus = {c["id"]: c for c in read_jsonl(os.path.join(PILOT, "corpus", f"{args.set}.jsonl"))}
    exp_path = os.path.join(PILOT, "corpus", f"{args.set}.expected.jsonl")
    expected = {e["id"]: e for e in read_jsonl(exp_path)} if os.path.exists(exp_path) else {}
    L = [f"# Template pilot — set `{args.set}`", "",
         f"- items: {len(corpus)}; arms: {', '.join(arms)}",
         f"- registry sha256 `{REG.load()['_sha256'][:16]}` · generated prompt "
         f"`{sha_file(PROMPT_T26)[:16]}` · prompt.txt `{sha_file(PROMPT_CTL)[:16]}` · "
         f"emitter `{sha_file(os.path.join(REG.HERE, 'emitter.py'))[:16]}`", ""]
    L += ["## Summary", "", "| measure | " + " | ".join(arms) + " |", "|---|" + "---|" * len(arms)]

    def row(label, fn):
        L.append(f"| {label} | " + " | ".join(str(fn(sums[a])) for a in arms) + " |")

    row("raw files read", lambda s: s["raw_files"])
    row("parse records", lambda s: s["parse_records"])
    row("invalid records (R-checks)", lambda s: s["invalid_records"])
    row("R findings", lambda s: _fmt_counter(s["r_findings"]))
    row("C findings (validator, C7 off)", lambda s: _fmt_counter(s["c_findings"]))
    row("stability: items / pairs", lambda s: f"{s['stability']['items']} / {s['stability']['pairs']}")
    row("stability: pairwise agreement", lambda s: s["stability"]["pairwise_agreement"])
    row("stability: unanimity", lambda s: s["stability"]["unanimity"])
    if any("fidelity" in s for s in sums.values()):
        f = lambda key: (lambda s: s.get("fidelity", {}).get(key, "—"))
        row("fidelity: parses scored vs golden", f("scored"))
        row("fidelity: parses claiming full coverage", f("claims_full"))
        row("fidelity: exact on claiming-full", f("exact_on_claims_full"))
        row("fidelity: exact rate on claiming-full", f("exact_rate_on_claims_full"))
        row("fidelity: exact overall", f("exact_overall"))
        row("precision (emitted ⊆ golden), mean", f("precision_mean"))
        row("precision on partial-coverage parses", f("precision_mean_on_partial"))
        row("recall, mean", f("recall_mean"))
        row("soft Jaccard, mean", f("soft_jaccard_mean"))
        row("parses with atoms not in the golden", f("parses_with_extra_atoms"))
        row("silent drops (claims full, golden atoms missing)", f("silent_drops"))
        row("mismatch buckets", lambda s: _fmt_counter(s.get("fidelity", {}).get("buckets", {})))
        row("extra atoms by owning template",
            lambda s: _fmt_counter(s.get("fidelity", {}).get("extra_atoms_by_owner", {})))
    if "t26" in sums:
        cov = sums["t26"]["coverage"]
        L += ["", "## Coverage (template arm)", "",
              f"- share of parses claiming full coverage: {cov['claims_full_share']}",
              f"- unmapped codes: {_fmt_counter(cov['unmapped_codes'])}",
              f"- templates fired: {_fmt_counter(cov['fired'])}",
              f"- covered by composition or slot: {_fmt_counter(cov['derived'])}",
              f"- losses recorded by the emitter: {_fmt_counter(cov['losses'])}"]
    write_json(os.path.join(PILOT, "out", f"{args.set}.summary.json"), sums)

    P = [f"# Template pilot — side by side, set `{args.set}`", "",
         "One block per (item, arm, distinct parse) that does not match its golden exactly. "
         "Atoms are shown in wildcard form (witnesses as SK).", ""]
    for iid in sorted(corpus):
        blocks = []
        for a in arms:
            rows = [r for r in read_jsonl(os.path.join(PILOT, "out", f"{args.set}.{a}.scores.jsonl"))
                    if r["id"] == iid]
            seen = {}
            for r in rows:
                seen.setdefault(r["graph_id"], []).append(r)
            for gid, rs in seen.items():
                r = rs[0]
                vg = r.get("vs_gold")
                if vg is None or vg["exact"]:
                    continue
                b = [f"**{a}** runs {', '.join(str(x['run']) for x in rs)} · "
                     f"precision {vg['precision']} · recall {vg['recall']} · "
                     f"bucket `{vg.get('bucket')}`", ""]
                if vg["only_parse"]:
                    b += ["only in the parse:"] + [
                        f"    {o['atom']}" + (f"    ← {o['owner']}" if o.get("owner") else "")
                        for o in vg["only_parse"]] + [""]
                if vg["only_gold"]:
                    b += ["only in the golden:"] + [f"    {x}" for x in vg["only_gold"]] + [""]
                for u in r["unmapped"]:
                    b.append(f"unmapped [{u['code']}] “{u['span']}” — {u['construction']}")
                for l in r["losses"]:
                    b.append(f"loss [{l['code']}] {l['detail']}")
                blocks.append("\n".join(b).rstrip() + "\n")
        if blocks:
            tag = expected.get(iid, {}).get("tag", "")
            P += [f"## {iid} [{tag}]", "", "> " + " ".join(corpus[iid]["sentences"]), ""]
            P += ["golden:"] + [f"    {s}" for s in expected[iid]["statements"]] + [""] + blocks
    rep = os.path.join(PILOT, "out", f"{args.set}.REPORT.md")
    pairs = os.path.join(PILOT, "out", f"{args.set}.PAIRS.md")
    open(rep, "w", encoding="utf-8").write("\n".join(L) + "\n")
    open(pairs, "w", encoding="utf-8").write("\n".join(P) + "\n")
    print("\n".join(L))
    print(f"\nwritten: {rep}\n         {pairs}")
    return 0


def cmd_examples(args) -> int:
    """Render every registry example to a statements file (input of the engine-load check)."""
    reg = REG.load()
    rows = []
    for tid, t in reg["templates"].items():
        for k, ex in enumerate(t.get("examples", []), 1):
            out = E.emit(json.loads(ex["records_json"]), reg)
            rows.append({"id": f"example-{tid}", "run": k, "text": ex["text"],
                         "statements": out["statements"]})
    path = os.path.join(PILOT, "out", "registry_examples.statements.jsonl")
    write_jsonl(path, rows)
    print(f"{len(rows)} example renderings -> {path}")
    return 0


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(prog="tmpl.pilot")
    sub = ap.add_subparsers(dest="cmd", required=True)
    s = sub.add_parser("select"); s.add_argument("--date", required=True); s.set_defaults(fn=cmd_select)
    s = sub.add_parser("batches"); s.add_argument("--set", required=True); s.set_defaults(fn=cmd_batches)
    s = sub.add_parser("assemble")
    s.add_argument("--set", required=True); s.add_argument("--arm", required=True, choices=ARMS)
    s.add_argument("--runs", type=int, default=3); s.add_argument("--date", required=True)
    s.add_argument("--model", default="claude-sonnet-5"); s.set_defaults(fn=cmd_assemble)
    s = sub.add_parser("score")
    s.add_argument("--set", required=True); s.add_argument("--arm", required=True, choices=ARMS)
    s.set_defaults(fn=cmd_score)
    s = sub.add_parser("report"); s.add_argument("--set", required=True); s.set_defaults(fn=cmd_report)
    s = sub.add_parser("examples"); s.set_defaults(fn=cmd_examples)
    args = ap.parse_args(argv)
    return args.fn(args)


if __name__ == "__main__":
    sys.exit(main())
