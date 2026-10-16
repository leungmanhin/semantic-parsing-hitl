"""Suite runner: the catalog's held-out suites against a blind LLM parser, and the catalog-wide
checks that keep the templates modular.

Run from ``templates/``::

    python -m tmpl.suite check                                    # catalog-wide checks, no LLM call
    python -m tmpl.suite collect --template transfer --runs 3 --provider google --model gemini-4-argon
    python -m tmpl.suite score --template transfer                # or --all; writes suite/out/

``check``.  Every example emits (the emitter refuses malformed instances); every abstain target
either exists in the catalog, in which case the target's own examples must claim the sentence
as a firing case and must not fire the abstaining template, or is reported as PENDING (a
worklist, not an error); a sentence that is a firing example of two templates with different
expected atoms is an OVERLAP; a held-out sentence that is also a shown sentence anywhere would
leak into the prompt; a gap-coded abstain whose sentence some template claims is stale; gap
codes must exist; example sentences never reuse a sentence of prompt.txt, the goldens or the
corpora.

``collect``.  Sends every held-out case of a template to the parser N times through
``semantic-parse.py`` (imported by path), one call per case and run, and stores each run record
under ``suite/raw/<template>/<key>.r<n>.json``.  Resumable: a stored record with a reply is not
requested again (``--force`` re-requests).  The item id the parser sees is a hash of the text;
it never sees the template, the category or the expected result.

``score``.  Reads the stored records, renders the parser's instances through the generic
emitter and compares the atoms with the expected instances' atoms LABEL-INDEPENDENTLY: equal
modulo a bijection on witness symbols (same stem), ``And`` / ``Or`` bundles as multisets.
Every (case, run) is classified by category: a firing case passes when the template fired,
the atoms match exactly and nothing was left unmapped; an abstain case passes when the
template did not fire and the parser did what the expected target says (fired the target when
it exists in the catalog, reported the gap code, or reported the span as unmapped when the
target is pending).  Per template and section: selection (fire-cases fired, abstain-cases
false fires), fill (exact matches among fires), stability (pairwise agreement across runs),
C9 type check of every emitted parse when the ``petta`` package is importable, token usage per
call, and the ``issues`` the parser reported.  Writes ``suite/out/<template>.scores.jsonl``,
``suite/out/summary.json`` and ``suite/out/REPORT.md``.

No LLM judges anything here: the expected instances are the authority, the comparison is code.
"""
from __future__ import annotations

import argparse
import collections
import contextlib
import glob
import hashlib
import importlib.util
import io
import itertools
import json
import os
import re
import sys
import tempfile
import time

from . import catalog as CAT, emit as E, typecheck as T

TEMPLATES = os.path.dirname(CAT.CATALOG_DIR)
REPO = os.path.dirname(TEMPLATES)
SUITE_DIR = os.path.join(TEMPLATES, "suite")
RAW_DIR = os.path.join(SUITE_DIR, "raw")
OUT_DIR = os.path.join(SUITE_DIR, "out")
PARSE_SCRIPT = os.path.join(REPO, "semantic-parse.py")
FRESHNESS_FILES = [os.path.join(REPO, "prompt.txt"), os.path.join(REPO, "regression", "regression_cases.md")]
CORPORA_GLOB = os.path.join(REPO, "fusenf", "corpora", "*.jsonl")

FIRING = ("positive", "contrast", "scoped", "optional")
CATEGORIES = FIRING + ("abstain",)
COMMUTATIVE = {"And", "Or"}
PASSING_ABSTAIN = {"target_fired", "gap_reported", "pending_unmapped"}
DEFAULT_TV = ["STV", "1.0", "0.99"]

_WITNESS = re.compile(r"^sk_[a-z0-9]+(?:_[a-z0-9]+)*_\d+$")


# --------------------------------------------------------------------------
# small helpers
# --------------------------------------------------------------------------


def norm(text) -> str:
    return " ".join(str(text).split())


def key_of(text) -> str:
    return hashlib.sha256(norm(text).encode("utf-8")).hexdigest()[:10]


def prompt_body_sha(text: str) -> str:
    """The prompt's hash without its header line, which carries the catalog hash: editing a
    held-out example changes the catalog hash but not the instructions the parser saw."""
    body = "\n".join(ln for ln in text.splitlines() if not ln.startswith("catalog sha256 "))
    return hashlib.sha256(body.encode("utf-8")).hexdigest()


def load_parse_script(path: str = PARSE_SCRIPT):
    spec = importlib.util.spec_from_file_location("semantic_parse", path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def cases_of(catalog: dict, tid: str, sections=("held_out",)) -> list[dict]:
    out = []
    for section in sections:
        for i, ex in enumerate((catalog[tid].get("examples") or {}).get(section) or []):
            out.append({"template": tid, "section": section, "index": i, "category": ex["category"],
                        "text": ex["text"], "note": ex.get("note"), "instances": ex.get("instances"),
                        "expected": ex.get("expected"), "key": key_of(ex["text"])})
    return out


def raw_path(raw_dir: str, tid: str, key: str, run: int) -> str:
    return os.path.join(raw_dir, tid, f"{key}.r{run}.json")


# --------------------------------------------------------------------------
# label-independent comparison of emissions
# --------------------------------------------------------------------------


def units_of(statements: list[str]) -> list:
    """``(: name atom tv)`` -> ``[atom, tv]`` (proof names dropped: they derive from labels)."""
    out = []
    for st in statements:
        expr = T.parse(st)
        if not (isinstance(expr, list) and len(expr) == 4 and expr[0] == ":"):
            raise ValueError(f"not a statement: {st}")
        out.append([expr[2], expr[3]])
    return out


def is_witness(tok) -> bool:
    return isinstance(tok, str) and _WITNESS.match(tok) is not None


def stem(sym: str) -> str:
    return sym.rsplit("_", 1)[0]


def _n_witnesses(expr) -> int:
    if isinstance(expr, list):
        return sum(_n_witnesses(x) for x in expr)
    return 1 if is_witness(expr) else 0


def unify(x, y, sub):
    """Structural equality modulo a bijection on witness symbols; ``sub`` = (forward, backward)."""
    if isinstance(x, list) or isinstance(y, list):
        if not (isinstance(x, list) and isinstance(y, list)) or len(x) != len(y):
            return None
        if x and isinstance(x[0], str) and x[0] in COMMUTATIVE and x[0] == y[0]:
            return match_multiset(x[1:], y[1:], sub)
        for a, b in zip(x, y):
            sub = unify(a, b, sub)
            if sub is None:
                return None
        return sub
    if is_witness(x) and is_witness(y):
        fwd, bwd = sub
        if x in fwd:
            return sub if fwd[x] == y else None
        if y in bwd or stem(x) != stem(y):
            return None
        return ({**fwd, x: y}, {**bwd, y: x})
    return sub if x == y else None


def match_multiset(xs: list, ys: list, sub):
    if len(xs) != len(ys):
        return None
    if not xs:
        return sub
    xs = sorted(xs, key=_n_witnesses)           # most constrained first
    x, rest = xs[0], xs[1:]
    for i, y in enumerate(ys):
        s2 = unify(x, y, sub)
        if s2 is not None:
            r = match_multiset(rest, ys[:i] + ys[i + 1:], s2)
            if r is not None:
                return r
    return None


def same(units_a: list, units_b: list) -> bool:
    """Two emissions state the same thing (label-independent, bundles unordered)."""
    return match_multiset(list(units_a), list(units_b), ({}, {})) is not None


def wild(expr):
    """Witness numbers blanked: ``sk_hand_1`` -> ``sk_hand_*``."""
    if isinstance(expr, list):
        return [wild(x) for x in expr]
    return stem(expr) + "_*" if is_witness(expr) else expr


def leaves(atom, path=()) -> list:
    """Flatten an atom into its proposition leaves, each under the path of heads above it:
    ``(Not (And (A …) (B …)))`` -> ``Not/And/(A …)``, ``Not/And/(B …)``."""
    if not isinstance(atom, list):
        return [(path, atom)]
    kids = [k for k in atom[1:] if isinstance(k, list)]
    out = []
    if len(kids) < len(atom) - 1 or not kids:
        out.append((path, [atom[0]] + [("_" if isinstance(k, list) else k) for k in atom[1:]]))
    head = atom[0] if isinstance(atom[0], str) else "?"
    for k in kids:
        out.extend(leaves(k, path + (head,)))
    return out


def leaf_strings(units: list) -> list[str]:
    out = []
    for atom, tv in units:
        tail = "" if tv == DEFAULT_TV else f" {T.render(tv)}"
        for path, leaf in leaves(wild(atom)):
            prefix = "/".join(path) + ("/" if path else "")
            out.append(prefix + T.render(leaf) + tail)
    return out


def diff(expected_units: list, parse_units: list, heads: dict | None = None) -> dict:
    ce = collections.Counter(leaf_strings(expected_units))
    cp = collections.Counter(leaf_strings(parse_units))
    only_expected = sorted((ce - cp).elements())
    only_parse = sorted((cp - ce).elements())
    kinds = set()
    for s in only_expected + only_parse:
        m = re.search(r"\(([^\s()]+)", s)
        if m and heads:
            kinds.add((heads.get(m.group(1)) or {}).get("kind", "?"))
    return {"only_expected": only_expected, "only_parse": only_parse, "kinds": sorted(kinds),
            "shape": ce == cp}


# --------------------------------------------------------------------------
# catalog-wide checks (no LLM)
# --------------------------------------------------------------------------


def _norm_sentence(s: str) -> str:
    return re.sub(r"[^a-z0-9]+", "", s.lower())


def _seen_sentences() -> set[str]:
    seen = set()
    for path in FRESHNESS_FILES:
        if not os.path.exists(path):
            continue
        with open(path, encoding="utf-8") as fh:
            for piece in re.split(r"(?<=[.!?])\s+|\n", fh.read()):
                piece = re.sub(r"^[\s>*\-`\[\]a-z0-9_-]*\]\s*", "", piece.strip())
                seen.add(_norm_sentence(piece))
    for path in sorted(glob.glob(CORPORA_GLOB)):
        with open(path, encoding="utf-8") as fh:
            for line in fh:
                if line.strip():
                    for s in json.loads(line).get("sentences") or []:
                        seen.add(_norm_sentence(s))
    seen.discard("")
    return seen


def catalog_checks(catalog: dict, general: dict | None = None, freshness: bool = True) -> dict:
    """The static checks; ``findings`` are defects, ``pending`` is the worklist of abstain
    targets no template covers yet, ``shared`` lists sentences two templates agree on."""
    general = general or CAT.load_general()
    gap_codes = set((general.get("gap_codes") or {}).keys())
    findings, pending, shared = [], collections.OrderedDict(), []
    claims: dict[str, list] = collections.OrderedDict()        # norm text -> [(tid, section, category, units, instances)]
    abstains: list = []
    shown_texts: dict[str, str] = {}
    n_examples = 0
    for tid in sorted(catalog):
        for case in cases_of(catalog, tid, ("shown", "held_out")):
            n_examples += 1
            text = norm(case["text"])
            if case["section"] == "shown":
                shown_texts.setdefault(text, tid)
            if case["category"] in FIRING:
                try:
                    out = E.emit({"id": "check", "instances": case["instances"]}, catalog)
                    units = units_of(out["statements"])
                except (E.EmitError, ValueError) as exc:
                    findings.append({"kind": "emit-error", "template": tid, "section": case["section"],
                                     "text": case["text"], "detail": str(exc.args[0] if exc.args else exc)})
                    continue
                claims.setdefault(text, []).append((tid, case["section"], case["category"], units, case["instances"]))
            else:
                abstains.append(case)
    for text, lst in claims.items():
        tids = sorted({c[0] for c in lst})
        if len(tids) < 2:
            continue
        for (ta, sa, _, ua, _), (tb, sb, _, ub, _) in itertools.combinations(lst, 2):
            if ta == tb:
                continue
            if same(ua, ub):
                shared.append({"text": text, "templates": [ta, tb]})
            else:
                findings.append({"kind": "overlap", "template": ta, "text": text,
                                 "detail": f"also a firing example of {tb} with different expected atoms"})
    for case in abstains:
        tid, text, exp = case["template"], norm(case["text"]), case["expected"] or {}
        target, gap = exp.get("template"), exp.get("gap")
        if target:
            if target == tid:
                findings.append({"kind": "self-target", "template": tid, "text": text, "detail": "abstain target is the template itself"})
            elif target not in catalog:
                pending.setdefault(target, []).append({"template": tid, "text": case["text"]})
            else:
                owned = [c for c in claims.get(text, []) if c[0] == target]
                if not owned:
                    findings.append({"kind": "unclaimed", "template": tid, "text": text,
                                     "detail": f"target {target} exists but none of its examples claims this sentence"})
                else:
                    for _, _, _, _, insts in owned:
                        if any(r.get("t") == tid for r in insts):
                            findings.append({"kind": "claim-conflict", "template": tid, "text": text,
                                             "detail": f"{target}'s claim of this sentence fires {tid}"})
        elif gap:
            if gap not in gap_codes:
                findings.append({"kind": "unknown-gap-code", "template": tid, "text": text, "detail": gap})
            claimed_by = sorted({c[0] for c in claims.get(text, [])})
            if claimed_by:
                findings.append({"kind": "stale-gap", "template": tid, "text": text,
                                 "detail": f"gap {gap} but the sentence is a firing example of {', '.join(claimed_by)}"})
        else:
            findings.append({"kind": "abstain-without-target", "template": tid, "text": text, "detail": "expected needs template or gap"})
    for tid in sorted(catalog):
        for case in cases_of(catalog, tid, ("held_out",)):
            text = norm(case["text"])
            if text in shown_texts:
                findings.append({"kind": "held-out-leak", "template": tid, "text": text,
                                 "detail": f"also a shown example of {shown_texts[text]} (rendered into the prompt)"})
    if freshness:
        seen = _seen_sentences()
        for tid in sorted(catalog):
            for case in cases_of(catalog, tid, ("shown", "held_out")):
                for s in re.split(r"(?<=[.!?])\s+", case["text"]):
                    if len(s.split()) >= 3 and _norm_sentence(s) in seen:
                        findings.append({"kind": "not-fresh", "template": tid, "section": case["section"],
                                         "text": s, "detail": "a sentence of prompt.txt, the goldens or a corpus"})
    return {"examples": n_examples, "findings": findings, "pending": pending, "shared": shared}


# --------------------------------------------------------------------------
# collect: the LLM calls
# --------------------------------------------------------------------------


def plan(catalog: dict, templates: list[str], sections: tuple, runs: int, raw_dir: str,
         force: bool = False, only: str | None = None) -> list[dict]:
    todo = []
    for tid in templates:
        for case in cases_of(catalog, tid, sections):
            if only and only.lower() not in case["text"].lower():
                continue
            for n in range(1, runs + 1):
                path = raw_path(raw_dir, tid, case["key"], n)
                if not force and os.path.exists(path):
                    with open(path, encoding="utf-8") as fh:
                        rec = json.load(fh)
                    if rec.get("response") is not None:
                        continue
                todo.append({"case": case, "run": n, "path": path})
    return todo


def collect(args, catalog: dict) -> int:
    sp = load_parse_script(args.parse_script)
    sections = {"held_out": ("held_out",), "shown": ("shown",), "both": ("shown", "held_out")}[args.section]
    templates = sorted(catalog) if args.all else args.template
    for tid in templates:
        if tid not in catalog:
            print(f"error: no template {tid}", file=sys.stderr)
            return 2
    todo = plan(catalog, templates, sections, args.runs, args.raw_dir, args.force, args.only)
    if args.limit:
        todo = todo[: args.limit]
    with open(args.prompt, encoding="utf-8") as fh:
        body_sha = prompt_body_sha(fh.read())
    n_cases = len({(t["case"]["template"], t["case"]["key"]) for t in todo})
    print(f"planned {len(todo)} calls ({n_cases} cases × up to {args.runs} runs; stored replies skipped)"
          f" · provider {args.provider} model {args.model or sp.PROVIDERS[args.provider].default_model}"
          f" effort {args.effort} temperature {'model default' if args.temperature is None else args.temperature}")
    if not todo:
        return 0
    if args.dry_run:
        first = todo[0]
        rec = sp.parse_sentence(first["case"]["text"], args, "s" + first["case"]["key"])
        print(json.dumps(rec["request"], indent=2, ensure_ascii=False))
        return 0
    failed = 0
    for i, job in enumerate(todo, 1):
        case, n, path = job["case"], job["run"], job["path"]
        item_id = "s" + case["key"]
        try:
            rec = sp.parse_sentence(case["text"], args, item_id)
        except sp.ProviderError as exc:
            rec = {"provider": args.provider, "model": args.model, "effort": args.effort,
                   "item": {"id": item_id, "text": case["text"]}, "response": None, "error": f"request failed: {exc}"}
            failed += 1
        rec["prompt_body_sha256"] = body_sha
        rec["run"] = n
        rec["case"] = {k: case[k] for k in ("template", "section", "index", "category", "text", "key")}
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, "w", encoding="utf-8") as fh:
            json.dump(rec, fh, indent=2, ensure_ascii=False)
        u = rec.get("usage") or {}
        status = "error" if rec.get("error") else "ok"
        print(f"[{i}/{len(todo)}] {case['template']} {case['category']:8s} r{n} {status:5s} "
              f"in={u.get('input')} out={u.get('output')} thinking={u.get('thinking')} · {case['text']}")
        if args.delay and i < len(todo):
            time.sleep(args.delay)
    print(f"done: {len(todo) - failed} replies stored, {failed} failed · {_show(args.raw_dir)}")
    return 1 if failed else 0


# --------------------------------------------------------------------------
# score: outcomes from the stored records
# --------------------------------------------------------------------------


def score_record(case: dict, rec: dict, catalog: dict, heads: dict, body_sha: str | None) -> dict:
    tid, category = case["template"], case["category"]
    row = {"template": tid, "section": case["section"], "category": category, "text": case["text"],
           "key": case["key"], "run": rec.get("run"), "status": "ok", "pass": False, "reasons": [],
           "model": rec.get("model"), "effort": rec.get("effort"),
           "stale_prompt": (body_sha is not None and rec.get("prompt_body_sha256") not in (None, body_sha)),
           "usage": {k: (rec.get("usage") or {}).get(k) for k in ("input", "output", "thinking", "total")}}
    resp = rec.get("response")
    if not isinstance(resp, dict):
        err = rec.get("error") or "no response"
        row["status"] = "no_json" if "not valid JSON" in err else "failed"
        row["reasons"].append(err)
        return row
    instances = [r for r in (resp.get("instances") or []) if isinstance(r, dict)]
    row["unmapped"] = resp.get("unmapped") or []
    row["issues"] = resp.get("issues") or []
    row["fired"] = dict(collections.Counter(str(r.get("t")) for r in instances))
    cleaned = [{k: v for k, v in r.items() if v is not None} for r in instances]
    row["null_slots"] = sum(len(r) - len(c) for r, c in zip(instances, cleaned))
    fired_t = tid in row["fired"]
    units = None
    try:
        out = E.emit({"id": "parse", "instances": cleaned, "unmapped": row["unmapped"]}, catalog)
        row["statements"], row["declarations"] = out["statements"], out["declarations"]
        units = units_of(out["statements"])
    except (E.EmitError, ValueError) as exc:
        row["status"] = "malformed"
        row["problems"] = list(exc.args[0]) if isinstance(exc.args[0], list) else [str(exc)]
        row["reasons"].append("the emitter refused the instances")
    if category in FIRING:
        expected = units_of(E.emit({"id": "expected", "instances": case["instances"]}, catalog)["statements"])
        row["fired_template"] = fired_t
        if not fired_t:
            row["reasons"].append(f"{tid} did not fire")
        if units is not None:
            row["exact"] = same(expected, units)
            if not row["exact"]:
                row["diff"] = diff(expected, units, heads)
                row["reasons"].append("witness identity differs" if row["diff"]["shape"] else "atoms differ")
        if row["unmapped"]:
            row["reasons"].append("unmapped spans in a covered sentence")
        row["pass"] = fired_t and bool(row.get("exact")) and not row["unmapped"] and row["status"] == "ok"
    else:
        exp = case["expected"] or {}
        target, gap = exp.get("template"), exp.get("gap")
        codes = [u.get("code") for u in row["unmapped"] if isinstance(u, dict)]
        if fired_t:
            outcome = "false_fire"
        elif target and target in catalog:
            outcome = "target_fired" if target in row["fired"] else "target_missed"
        elif gap:
            if gap in codes:
                outcome = "gap_reported"
                want = set(_norm_sentence(w) for w in str(exp.get("span") or "").split())
                spans = [set(_norm_sentence(w) for w in str(u.get("span") or "").split())
                         for u in row["unmapped"] if isinstance(u, dict) and u.get("code") == gap]
                row["span_match"] = any(bool(want) and (want <= got or got <= want) for got in spans)
            elif codes:
                outcome = "unmapped_other_code"
            else:
                outcome = "silent_drop"
        elif target:
            outcome = "pending_unmapped" if codes else "silent_drop"
        else:
            outcome = "no_target"
        row["outcome"], row["target"], row["gap"], row["codes"] = outcome, target, gap, codes
        row["pass"] = outcome in PASSING_ABSTAIN and row["status"] == "ok"
        if not row["pass"]:
            row["reasons"].append(outcome)
    return row


def _typecheck(rows: list[dict]) -> dict:
    """C9 over every emitted parse; {row index: findings} or None when petta is missing."""
    try:
        import petta  # noqa: F401
    except Exception:
        return None
    records = [{"id": str(i), "statements": r["statements"], "declarations": r["declarations"]}
               for i, r in enumerate(rows) if r.get("statements")]
    if not records:
        return {}
    with tempfile.NamedTemporaryFile("w", suffix=".jsonl", delete=False) as fh:
        for r in records:
            fh.write(json.dumps(r) + "\n")
        path = fh.name
    report = path + ".report.json"
    try:
        with contextlib.redirect_stdout(io.StringIO()):
            T.main([path, "--no-infer", "--report", report])
        with open(report, encoding="utf-8") as fh:
            rep = json.load(fh)
    finally:
        for p in (path, report):
            if os.path.exists(p):
                os.unlink(p)
    by = collections.defaultdict(list)
    for f in rep["findings"]:
        if f["kind"] in ("type", "type-conflict", "parse-error"):
            by[int(f["id"])].append(f)
    return by


def _show(path: str) -> str:
    rel = os.path.relpath(path)
    return path if rel.startswith("..") else rel


def _ratio(a, b):
    return round(a / b, 3) if b else None


def summarize(rows: list[dict]) -> dict:
    """Metrics for one template and section."""
    by_cat = collections.OrderedDict()
    for cat in CATEGORIES:
        sub = [r for r in rows if r["category"] == cat]
        if not sub:
            continue
        d = {"cases": len({r["key"] for r in sub}), "runs": len(sub), "pass": sum(r["pass"] for r in sub)}
        if cat in FIRING:
            d["fired"] = sum(bool(r.get("fired_template")) for r in sub)
            d["exact"] = sum(bool(r.get("exact")) for r in sub)
        else:
            d["false_fires"] = sum(r.get("outcome") == "false_fire" for r in sub)
            d["outcomes"] = dict(collections.Counter(r.get("outcome", r["status"]) for r in sub))
        by_cat[cat] = d
    fire_rows = [r for r in rows if r["category"] in FIRING]
    abst_rows = [r for r in rows if r["category"] == "abstain"]
    fired = [r for r in fire_rows if r.get("fired_template")]
    by_key = collections.defaultdict(list)
    for r in rows:
        by_key[r["key"]].append(r)
    pairs = agree = unanimous = multi = 0
    for key, runs in by_key.items():
        ok = [r for r in runs if r["status"] == "ok" and r.get("statements") is not None]
        if len(runs) < 2:
            continue
        multi += 1
        ps = list(itertools.combinations(runs, 2))
        pairs += len(ps)
        n_agree = 0
        for a, b in ps:
            if a in ok and b in ok and same(units_of(a["statements"]), units_of(b["statements"])):
                n_agree += 1
        agree += n_agree
        unanimous += n_agree == len(ps)
    usage = {k: sum((r["usage"].get(k) or 0) for r in rows) for k in ("input", "output", "thinking", "total")}
    issues = [{**i, "sentence": r["text"], "run": r["run"]} for r in rows for i in (r.get("issues") or []) if isinstance(i, dict)]
    return {
        "records": len(rows), "cases": len(by_key),
        "status": dict(collections.Counter(r["status"] for r in rows)),
        "stale_prompt": sum(bool(r.get("stale_prompt")) for r in rows),
        "by_category": by_cat,
        "pass": sum(r["pass"] for r in rows),
        "selection": {"fire_runs": len(fire_rows), "fired": len(fired),
                      "abstain_runs": len(abst_rows), "false_fires": sum(r.get("outcome") == "false_fire" for r in abst_rows)},
        "fill": {"fired": len(fired), "exact": sum(bool(r.get("exact")) for r in fired),
                 "rate": _ratio(sum(bool(r.get("exact")) for r in fired), len(fired))},
        "stability": {"cases": multi, "pairs": pairs, "pairwise_agreement": _ratio(agree, pairs),
                      "unanimous": unanimous},
        "typecheck": {"checked": sum(1 for r in rows if "typed" in r), "passed": sum(1 for r in rows if r.get("typed"))},
        "usage": {**usage, "calls": len(rows), "thinking_calls": sum(1 for r in rows if (r["usage"].get("thinking") or 0) > 0)},
        "issues": issues,
        "null_slots": sum(r.get("null_slots") or 0 for r in rows),
        "models": sorted({f"{r.get('model')} effort={r.get('effort')}" for r in rows if r.get("model")}),
    }


def score(args, catalog: dict) -> int:
    heads = T.load_substrate()["heads"]
    body_sha = None
    if os.path.exists(args.prompt):
        with open(args.prompt, encoding="utf-8") as fh:
            body_sha = prompt_body_sha(fh.read())
    if args.all:
        templates = sorted(t for t in catalog if os.path.isdir(os.path.join(args.raw_dir, t)))
    else:
        templates = args.template
    rows: list[dict] = []
    orphans = []
    for tid in templates:
        if tid not in catalog:
            print(f"error: no template {tid}", file=sys.stderr)
            return 2
        cases = {c["key"]: c for c in cases_of(catalog, tid, ("shown", "held_out"))}
        for path in sorted(glob.glob(os.path.join(args.raw_dir, tid, "*.r*.json"))):
            m = re.match(r"^([0-9a-f]+)\.r(\d+)\.json$", os.path.basename(path))
            if not m or m.group(1) not in cases:
                orphans.append(os.path.relpath(path))
                continue
            with open(path, encoding="utf-8") as fh:
                rec = json.load(fh)
            rec.setdefault("run", int(m.group(2)))
            rows.append(score_record(cases[m.group(1)], rec, catalog, heads, body_sha))
    typed = _typecheck(rows)
    if typed is not None:
        for i, r in enumerate(rows):
            if r.get("statements"):
                r["typed"] = not typed.get(i)
                if typed.get(i):
                    r["type_findings"] = typed[i]
                    r["reasons"].append("emitted atoms do not type (C9)")
                    r["pass"] = False
    checks = catalog_checks(catalog)
    summary = {"prompt": os.path.relpath(args.prompt, REPO), "prompt_body_sha256": body_sha,
               "typecheck": "ran" if typed is not None else "skipped (no petta package)",
               "checks": {"examples": checks["examples"], "findings": checks["findings"],
                          "pending": checks["pending"], "shared": checks["shared"]},
               "orphans": orphans, "templates": collections.OrderedDict()}
    os.makedirs(args.out_dir, exist_ok=True)
    for tid in templates:
        sub = [r for r in rows if r["template"] == tid]
        with open(os.path.join(args.out_dir, f"{tid}.scores.jsonl"), "w", encoding="utf-8") as fh:
            for r in sorted(sub, key=lambda r: (r["section"], r["key"], r["run"] or 0)):
                fh.write(json.dumps(r, ensure_ascii=False) + "\n")
        sections = collections.OrderedDict()
        for section in ("held_out", "shown"):
            srows = [r for r in sub if r["section"] == section]
            if srows:
                sections[section] = summarize(srows)
        summary["templates"][tid] = sections
    with open(os.path.join(args.out_dir, "summary.json"), "w", encoding="utf-8") as fh:
        json.dump(summary, fh, indent=2, ensure_ascii=False)
    report = render_report(summary, rows)
    with open(os.path.join(args.out_dir, "REPORT.md"), "w", encoding="utf-8") as fh:
        fh.write(report)
    n_fail = sum(1 for r in rows if not r["pass"])
    hard = [f for f in checks["findings"]]
    print(f"scored {len(rows)} records over {len(templates)} template(s): {len(rows) - n_fail} pass, {n_fail} fail"
          f" · catalog checks: {len(hard)} finding(s), {len(checks['pending'])} pending target(s)"
          f" · typecheck {summary['typecheck']} · report {_show(os.path.join(args.out_dir, 'REPORT.md'))}")
    return 1 if (n_fail or hard) else 0


# --------------------------------------------------------------------------
# the report
# --------------------------------------------------------------------------


def _checks_lines(checks: dict) -> list[str]:
    out = [f"{checks['examples']} examples checked; findings: {len(checks['findings'])}"]
    for f in checks["findings"]:
        out.append(f"- {f['kind']} · {f['template']} · \"{f['text']}\" — {f['detail']}")
    if checks["pending"]:
        out.append("")
        out.append("Pending abstain targets (templates to write; each line = the sentences waiting for it):")
        for target, lst in checks["pending"].items():
            out.append(f"- `{target}` ← " + "; ".join(f"{d['template']}: \"{d['text']}\"" for d in lst))
    if checks["shared"]:
        out.append("")
        out.append("Sentences two templates claim with the same expected atoms (composition, fine):")
        for s in checks["shared"]:
            out.append(f"- \"{s['text']}\" — {', '.join(s['templates'])}")
    return out


def render_report(summary: dict, rows: list[dict]) -> str:
    L: list[str] = []
    add = L.append
    add("# Suite report")
    add("")
    add(f"prompt `{summary['prompt']}` (body sha256 {(summary.get('prompt_body_sha256') or '')[:16]}) · "
        f"type check: {summary['typecheck']}")
    add("")
    add("## Catalog checks")
    add("")
    L.extend(_checks_lines(summary["checks"]))
    if summary.get("orphans"):
        add("")
        add("Stored records whose sentence is no longer in the catalog (ignored): " + ", ".join(summary["orphans"]))
    add("")
    for tid, sections in summary["templates"].items():
        for section, s in sections.items():
            add(f"## {tid} — {section}")
            add("")
            st = ", ".join(f"{k} {v}" for k, v in sorted(s["status"].items()))
            add(f"{s['cases']} cases, {s['records']} records ({st}; stale prompt {s['stale_prompt']}) · "
                f"{'; '.join(s['models']) or 'no model recorded'}")
            add("")
            add("| category | cases | runs | fired | exact | pass |")
            add("|---|---|---|---|---|---|")
            for cat, d in s["by_category"].items():
                if cat in FIRING:
                    add(f"| {cat} | {d['cases']} | {d['runs']} | {d['fired']} | {d['exact']} | {d['pass']} |")
                else:
                    add(f"| {cat} | {d['cases']} | {d['runs']} | {d['false_fires']} (false fires) | – | {d['pass']} |")
            add("")
            sel, fill, stab, tc, u = s["selection"], s["fill"], s["stability"], s["typecheck"], s["usage"]
            add(f"- selection: fire cases fired {sel['fired']}/{sel['fire_runs']} · abstain cases false fires "
                f"{sel['false_fires']}/{sel['abstain_runs']}")
            add(f"- fill: exact {fill['exact']}/{fill['fired']} among fires")
            add(f"- stability: pairwise agreement {stab['pairwise_agreement']} ({stab['cases']} cases, {stab['pairs']} pairs), "
                f"unanimous {stab['unanimous']}/{stab['cases']}")
            add(f"- type check: {tc['passed']}/{tc['checked']} emitted parses type")
            add(f"- usage: {u['calls']} calls · in {u['input']:,} · out {u['output']:,} · thinking {u['thinking']:,} "
                f"(calls with thought tokens: {u['thinking_calls']})" + (f" · null slots {s['null_slots']}" if s["null_slots"] else ""))
            if s["issues"]:
                add(f"- issues reported by the parser: {len(s['issues'])}")
                for i in s["issues"]:
                    add(f"  - {i.get('code')} · {i.get('where')} · r{i['run']} \"{i['sentence']}\": {i.get('text')}")
            else:
                add("- issues reported by the parser: none")
            add("")
            abst = [r for r in rows if r["template"] == tid and r["section"] == section and r["category"] == "abstain"]
            if abst:
                add("Abstain cases (what the parser did, per run):")
                by_key = collections.OrderedDict()
                for r in sorted(abst, key=lambda r: (r["key"], r["run"] or 0)):
                    by_key.setdefault(r["text"], []).append(r)
                for text, rs in by_key.items():
                    exp = rs[0].get("target") and f"target `{rs[0]['target']}`" or (rs[0].get("gap") and f"gap {rs[0]['gap']}") or "?"
                    what = []
                    for r in rs:
                        fired = ", ".join(f"{k}×{v}" for k, v in sorted((r.get("fired") or {}).items()))
                        codes = ", ".join(r.get("codes") or [])
                        what.append(f"r{r['run']} {r.get('outcome', r['status'])} [{fired or 'nothing fired'}"
                                    + (f"; unmapped {codes}" if codes else "") + "]")
                    add(f"- \"{text}\" ({exp}): " + " · ".join(what))
                add("")
            bad = [r for r in rows if r["template"] == tid and r["section"] == section and not r["pass"]]
            if bad:
                add("Mismatches:")
                for r in sorted(bad, key=lambda r: (r["category"], r["key"], r["run"] or 0)):
                    line = f"- {r['category']} · \"{r['text']}\" · r{r['run']}: " + "; ".join(r["reasons"])
                    d = r.get("diff")
                    if d:
                        if d["only_expected"]:
                            line += " · only expected: " + ", ".join(f"`{x}`" for x in d["only_expected"])
                        if d["only_parse"]:
                            line += " · only parse: " + ", ".join(f"`{x}`" for x in d["only_parse"])
                        if d["kinds"]:
                            line += f" · kinds: {', '.join(d['kinds'])}"
                    if r.get("problems"):
                        line += " · " + "; ".join(r["problems"][:3])
                    if r.get("type_findings"):
                        line += " · C9: " + "; ".join(f["statement"] for f in r["type_findings"][:2])
                    if r["category"] == "abstain" and r.get("fired"):
                        line += " · fired: " + ", ".join(f"{k}×{v}" for k, v in sorted(r["fired"].items()))
                    add(line)
                add("")
            else:
                add("Mismatches: none")
                add("")
    return "\n".join(L).rstrip("\n") + "\n"


# --------------------------------------------------------------------------
# cli
# --------------------------------------------------------------------------


def _add_common(ap):
    ap.add_argument("--template", action="append", default=[], help="template id (repeatable)")
    ap.add_argument("--all", action="store_true", help="every template (collect: in the catalog; score: with stored records)")
    ap.add_argument("--raw-dir", default=RAW_DIR, help="where run records are stored")


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0], formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    c = sub.add_parser("check", help="catalog-wide checks (no LLM call)")
    c.add_argument("--no-freshness", action="store_true", help="skip the sentence-freshness check against prompt.txt / goldens / corpora")
    k = sub.add_parser("collect", help="send the held-out cases to the parser and store the run records")
    _add_common(k)
    k.add_argument("--section", choices=("held_out", "shown", "both"), default="held_out",
                   help="which examples to send (shown = a teach-to-the-test smoke, not a regression)")
    k.add_argument("--runs", type=int, default=3)
    k.add_argument("--only", default=None, help="only cases whose text contains this (case-insensitive)")
    k.add_argument("--limit", type=int, default=None, help="at most this many calls")
    k.add_argument("--delay", type=float, default=0.0, help="seconds between calls")
    k.add_argument("--force", action="store_true", help="re-request cases that already have a stored reply")
    k.add_argument("--dry-run", action="store_true", help="show the plan and the first request; call nothing")
    k.add_argument("--parse-script", default=PARSE_SCRIPT)
    load_parse_script(PARSE_SCRIPT).add_provider_args(k)
    s = sub.add_parser("score", help="score the stored records and write the report")
    _add_common(s)
    s.add_argument("--out-dir", default=OUT_DIR)
    s.add_argument("--prompt", default=os.path.join(TEMPLATES, "generated", "PROMPT_CATALOG.txt"),
                   help="the current instruction set, to flag records collected under another one")
    args = ap.parse_args(argv)

    catalog = CAT.load()
    if args.cmd == "check":
        checks = catalog_checks(catalog, freshness=not args.no_freshness)
        print("\n".join(_checks_lines(checks)))
        return 1 if checks["findings"] else 0
    if not args.template and not args.all:
        print("error: give --template <id> (repeatable) or --all", file=sys.stderr)
        return 2
    if args.cmd == "collect":
        return collect(args, catalog)
    return score(args, catalog)


if __name__ == "__main__":
    sys.exit(main())
