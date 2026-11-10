"""THE ENGINE RUNNER: statements, background rules and candidate rules in a PeTTaChainer space, asked "does this
space derive that pattern?" (§5: evidence by execution; §5.4's pair classification; §5.2's contrast tests later).
Pure Python apart from the engine itself, so it runs in the chainer's own environment, with this repository's root
on the path::

    cd <the PeTTaChainer checkout> && PYTHONPATH=<this repo> .venv/bin/python -m fusenf.mine.chainer run \\
        JOBS.jsonl RESULTS.jsonl --background BACKGROUND.json [--workers 4] [--steps 400] [--memory-mb 3500]

A JOB is one JSON line ``{"id", "statements": [...], "extra": [rules], "queries": [{"id", "q"}], "steps"?}``: a
fresh space holds the background (a JSON list of statements, loaded once per job without the per-statement check:
it is the catalog's generated rules file), the job's statements and its extra rules (each checked; a refusal is
reported, never hidden), and every query is asked as written (``(: $prf <pattern> $tv)``). A RESULT is one JSON line
``{"id", "results": {query id: [proof lines]}, "refused": [...], "seconds"}``.

The run is RESUMABLE and a result is kept only for the job it was computed from: every result carries its job's
FINGERPRINT (``"job"``: the statements, the extra rules, the queries, the steps and the background, hashed), a job
whose stored result has the fingerprint it has now is not run again, and a stored result whose job has changed (or
gone) is dropped. So after a change upstream only the jobs that the change touches run again. The run SURVIVES a
crash: jobs go to worker processes in chunks, each worker with an address-space limit (``--memory-mb``, so a runaway
query fails in its own process); a worker that writes no result for ``--job-seconds`` is stopped and its job split
into one job per query, so a slow query costs only itself (``"ERROR timeout"``); a job that kills its worker twice
gets a result with ``"error"``. Progress goes to stdout.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
import tempfile
import time

from . import REPO

RULES_PATH = os.path.join(REPO, "templates", "generated", "seeded_rules.metta")
_TV = re.compile(r"\(STV ([0-9.e-]+) ([0-9.e-]+)\)\)$")
_ID = re.compile(r'^\{"id": "((?:[^"\\]|\\.)*)"')

try:
    from pettachainer import PeTTaChainer  # type: ignore
except Exception:  # not the chainer's environment
    PeTTaChainer = None


def available() -> bool:
    return PeTTaChainer is not None


def seeded_rules() -> list[str]:
    """The catalog's background rules, one s-expression each (comments dropped)."""
    out, depth, start = [], 0, None
    text = "\n".join(ln for ln in open(RULES_PATH, encoding="utf-8").read().splitlines() if not ln.strip().startswith(";"))
    for i, ch in enumerate(text):
        if ch == "(":
            if depth == 0:
                start = i
            depth += 1
        elif ch == ")":
            depth -= 1
            if depth == 0 and start is not None:
                out.append(text[start:i + 1])
                start = None
    return out


def tv(result) -> tuple[float, float] | None:
    m = _TV.search(result[0]) if result else None
    return (float(m.group(1)), float(m.group(2))) if m else None


class Engine:
    """One chainer space: the seeded rules (unless ``rules=False``), plus facts and candidate rules."""

    def __init__(self, facts: list[str] = (), extra: list[str] = (), rules: bool = True):
        if PeTTaChainer is None:
            raise RuntimeError("pettachainer is not importable here: run under the chainer's environment")
        self.h = PeTTaChainer()
        self.added = 0
        for a in (seeded_rules() if rules else []) + list(facts) + list(extra):
            self.h.add_atom(a)
            self.added += 1

    def query(self, pattern: str, steps: int = 400):
        """A proof query ``(: $prf <pattern> $tv)``; returns the chainer's answers (a list, possibly empty)."""
        return self.h.query(f"(: $prf {pattern} $tv)", steps=steps, timeout_sec=0)

    def derives(self, pattern: str, steps: int = 400) -> tuple[bool, tuple | None]:
        res = self.query(pattern, steps)
        return (bool(res), tv(res))


# ------------------------------------------------------------------------------------------------ batch jobs

def background_fingerprint(background: list[str]) -> str:
    return hashlib.md5(json.dumps(list(background), ensure_ascii=False).encode("utf-8")).hexdigest()[:16]


def fingerprint(job: dict, background: str, steps: int = 400) -> str:
    """What a job's result depends on, as one short string: its statements, its extra rules, its queries (ids and
    text), the steps, and the background's fingerprint."""
    body = [list(job.get("statements") or []), list(job.get("extra") or []),
            [[q["id"], q["q"]] for q in job.get("queries") or []], int(job.get("steps") or steps), background]
    return hashlib.md5(json.dumps(body, ensure_ascii=False).encode("utf-8")).hexdigest()[:16]


def run_job(job: dict, background: list[str], steps: int = 400, background_fp: str | None = None) -> dict:
    """One job in a fresh space (see the module doc)."""
    t0 = time.time()
    h = PeTTaChainer()
    refused = []
    if background:
        h.add_atoms_no_check(list(background))
    for st in list(job.get("statements") or []) + list(job.get("extra") or []):
        try:
            h.add_atom(st)
        except Exception as exc:                                  # an engine refusal is reported, never hidden
            refused.append({"statement": st, "error": str(exc).splitlines()[0][:200] if str(exc) else type(exc).__name__})
    n = int(job.get("steps") or steps)
    results = {}
    for q in job.get("queries") or []:
        try:
            results[q["id"]] = [str(x) for x in h.query(q["q"], steps=n, timeout_sec=0)]
        except Exception as exc:
            results[q["id"]] = [f"ERROR {str(exc).splitlines()[0][:200] if str(exc) else type(exc).__name__}"]
    fp = fingerprint(job, background_fingerprint(background) if background_fp is None else background_fp, steps)
    return {"id": job["id"], "job": fp, "results": results, "refused": refused, "seconds": round(time.time() - t0, 3)}


def _done_ids(path: str) -> set:
    out = set()
    if os.path.exists(path):
        with open(path, encoding="utf-8") as fh:
            for line in fh:
                try:
                    out.add(json.loads(line)["id"])
                except (ValueError, KeyError):
                    continue                                       # a line cut by a crash
    return out


def _worker(argv) -> int:
    """``worker JOBS IDS OUT BACKGROUND STEPS MEMORY_MB``: run the listed jobs, one result line each."""
    jobs_path, ids_path, out_path, bg_path, steps, mem = argv
    try:
        import resource
        limit = int(mem) * 1024 * 1024
        resource.setrlimit(resource.RLIMIT_AS, (limit, limit))
    except (ImportError, ValueError, OSError):
        pass
    want = [l.strip() for l in open(ids_path, encoding="utf-8") if l.strip()]
    wanted = set(want)
    jobs = {}
    with open(jobs_path, encoding="utf-8") as fh:
        for line in fh:
            m = _ID.match(line)                                   # a job line starts with its id: no need to parse the rest
            if m and json.loads(f'"{m.group(1)}"') in wanted:
                j = json.loads(line)
                jobs[j["id"]] = j
    background = json.load(open(bg_path, encoding="utf-8")) if bg_path != "-" else []
    bg_fp = background_fingerprint(background)
    with open(out_path, "a", encoding="utf-8") as out:
        for jid in want:
            res = run_job(jobs[jid], background, int(steps), bg_fp)
            out.write(json.dumps(res, ensure_ascii=False) + "\n")
            out.flush()
    return 0


def _parts(out_path: str) -> list[str]:
    work = os.path.dirname(os.path.abspath(out_path))
    base = os.path.basename(out_path) + ".part"
    return sorted(os.path.join(work, f) for f in os.listdir(work) if f.startswith(base) and not f.endswith(".log"))


def _job(path: str, jid: str) -> dict | None:
    with open(path, encoding="utf-8") as fh:
        for line in fh:
            m = _ID.match(line)
            if m and json.loads(f'"{m.group(1)}"') == jid:
                return json.loads(line)
    return None


def settle(jobs_path: str, out_path: str, background_path: str | None, steps: int = 400, dry: bool = False) -> tuple:
    """The jobs of a file against the results stored for them: ``(ids in order, fingerprint per id, the ids whose
    stored result was computed from the job as it stands now, how many stored results were stale)``. Unless ``dry``,
    the results file is left holding exactly the valid results — those in the part files of an interrupted run folded
    in, the stale ones dropped — and that run's leftovers are removed."""
    background = []
    if background_path and background_path != "-":
        with open(background_path, encoding="utf-8") as fh:
            background = json.load(fh)
    bg = background_fingerprint(background)
    ids, fp_of = [], {}
    with open(jobs_path, encoding="utf-8") as fh:
        for line in fh:
            if line.strip():
                j = json.loads(line)
                ids.append(j["id"])
                fp_of[j["id"]] = fingerprint(j, bg, steps)
    valid: dict[str, str] = {}
    stale: set = set()
    for path in ([out_path] if os.path.exists(out_path) else []) + _parts(out_path):
        with open(path, encoding="utf-8") as fh:
            for line in fh:
                try:
                    j = json.loads(line)
                    jid = j["id"]
                except (ValueError, KeyError, TypeError):
                    continue                                       # a line cut by a crash
                if jid in fp_of and j.get("job") == fp_of[jid]:
                    valid.setdefault(jid, line if line.endswith("\n") else line + "\n")
                elif "#" not in jid:                               # (a part of a split job is no job of the file)
                    stale.add(jid)
    stale -= set(valid)
    work = os.path.dirname(os.path.abspath(out_path))
    base = os.path.basename(out_path)
    leftovers = [os.path.join(work, f) for f in os.listdir(work) if f.startswith(base + ".part") or f == base + ".split.jobs"] \
        if os.path.isdir(work) else []
    if not dry and (stale or leftovers):
        tmp = out_path + ".tmp"
        with open(tmp, "w", encoding="utf-8") as out:
            for jid in ids:
                if jid in valid:
                    out.write(valid[jid])
        os.replace(tmp, out_path)
        for f in leftovers:
            os.unlink(f)
    return ids, fp_of, set(valid), len(stale)


def run(jobs_path: str, out_path: str, background_path: str | None, workers: int = 4, steps: int = 400, chunk: int = 25,
        job_seconds: int = 180, memory_mb: int = 3500, python: str | None = None) -> dict:
    """Run every job of a JSONL file whose stored result is missing or stale (see the module doc); returns the counts.

    A worker that writes no result for ``job_seconds`` is stopped: its job is split into one job per query (written
    beside the results, run like the others), so that one slow query costs only itself; a single-query job that
    stalls gets ``"ERROR timeout"`` for its query. A worker that dies twice on the same job gives that job an error."""
    ids, fp_of, done, stale = settle(jobs_path, out_path, background_path, steps)
    work = os.path.dirname(os.path.abspath(out_path))
    split_path = out_path + ".split.jobs"
    pending = [i for i in ids if i not in done]
    total, t0 = len(pending), time.time()
    print(f"{len(ids)} jobs, {len(done)} with a result{f' ({stale} stale results dropped)' if stale else ''}, "
          f"{total} to run on {workers} workers", flush=True)
    queue = [(jobs_path, pending[k:k + chunk]) for k in range(0, len(pending), chunk)]
    attempts: dict[str, int] = {}
    failed: list[dict] = []
    split_of: dict[str, list[str]] = {}
    running: list[dict] = []
    seq = 0
    py = python or sys.executable
    env = dict(os.environ)
    env["PYTHONPATH"] = REPO + (os.pathsep + env["PYTHONPATH"] if env.get("PYTHONPATH") else "")
    last_report = 0.0

    def finished() -> int:                                         # the jobs of the file that this run has completed
        got = {f["id"] for f in failed}
        for p in _parts(out_path):
            got |= _done_ids(p)
        return sum(1 for i in got if "#" not in i) + sum(1 for subs in split_of.values() if all(x in got for x in subs))

    while queue or running:
        while queue and len(running) < workers:
            jobs_file, ids_now = queue.pop(0)
            seq += 1
            fd, ids_file = tempfile.mkstemp(prefix="chainer-ids-", suffix=".txt", dir=work)
            with os.fdopen(fd, "w", encoding="utf-8") as fh:
                fh.write("\n".join(ids_now) + "\n")
            part = f"{out_path}.part{seq:05d}"
            log = open(f"{part}.log", "w", encoding="utf-8")          # a file, never a pipe: a chatty engine cannot block
            proc = subprocess.Popen([py, "-m", "fusenf.mine.chainer", "worker", jobs_file, ids_file, part, background_path or "-",
                                     str(steps), str(memory_mb)], env=env, stdout=subprocess.DEVNULL, stderr=log)
            now = time.time()
            running.append({"proc": proc, "ids": ids_now, "jobs": jobs_file, "file": ids_file, "part": part, "log": log,
                            "start": now, "last": now, "size": 0})
        time.sleep(0.5)
        for r in list(running):
            code = r["proc"].poll()
            size = os.path.getsize(r["part"]) if os.path.exists(r["part"]) else 0
            if size > r["size"]:
                r["size"], r["last"] = size, time.time()
            stalled = code is None and time.time() - r["last"] > job_seconds + (30 if r["size"] == 0 else 0)   # (+ the library load)
            if code is None and not stalled:
                continue
            if stalled:
                r["proc"].kill()
                r["proc"].wait()
            r["log"].close()
            with open(f"{r['part']}.log", encoding="utf-8", errors="replace") as fh:
                err = fh.read()[-4000:]
            os.unlink(f"{r['part']}.log")
            running.remove(r)
            os.unlink(r["file"])
            got = _done_ids(r["part"])
            left = [i for i in r["ids"] if i not in got]
            if not left:
                continue
            bad, rest = left[0], left[1:]                          # the job that was running when the worker stopped
            if stalled:
                job = _job(r["jobs"], bad) or {"id": bad, "queries": []}
                if r["jobs"] == jobs_path and len(job.get("queries") or []) > 1:
                    subs = []
                    with open(split_path, "a", encoding="utf-8") as fh:
                        for k, q in enumerate(job["queries"]):
                            sub = {"id": f"{bad}#{k}", "statements": job.get("statements") or [], "extra": job.get("extra") or [],
                                   "queries": [q], "steps": job.get("steps")}
                            fh.write(json.dumps(sub, ensure_ascii=False) + "\n")
                            subs.append(sub["id"])
                    split_of[bad] = subs
                    queue[:0] = [(split_path, subs[k:k + chunk]) for k in range(0, len(subs), chunk)]
                else:
                    failed.append({"id": bad, "results": {q["id"]: ["ERROR timeout"] for q in job.get("queries") or []}, "refused": [],
                                   "error": f"timeout after {job_seconds} s", "seconds": None})
            else:
                attempts[bad] = attempts.get(bad, 0) + 1
                if attempts[bad] < 2:
                    rest = left
                else:
                    why = (err.strip().splitlines() or [f"exit {code}"])[-1][:300]
                    failed.append({"id": bad, "results": {}, "refused": [], "error": why, "seconds": None})
            if rest:
                half = max(1, len(rest) // 2)
                queue[:0] = [(r["jobs"], rest[:half]), (r["jobs"], rest[half:])] if len(rest) > 1 else [(r["jobs"], rest)]
        if time.time() - last_report > 60 or (not queue and not running):
            last_report = time.time()
            n = finished()
            rate = n / max(1e-9, time.time() - t0)
            eta = (total - n) / rate if rate > 0 else float("inf")
            print(f"  {time.strftime('%H:%M:%S')} {n}/{total} done · {rate * 60:.0f} jobs/min · ETA {eta / 60:.0f} min"
                  f"{f' · {len(failed)} errors' if failed else ''}{f' · {len(split_of)} split' if split_of else ''}", flush=True)
    results: dict[str, dict] = {}
    for p in _parts(out_path):
        with open(p, encoding="utf-8") as fh:
            for line in fh:
                try:
                    j = json.loads(line)
                except ValueError:
                    continue
                results.setdefault(j["id"], j)
    for f in failed:
        results.setdefault(f["id"], f)
    with open(out_path, "a", encoding="utf-8") as out:                 # the parts merged, a split job put back together
        for jid in ids:
            if jid in done:
                continue
            if jid in split_of:
                parts_ = [results.get(x) or {"results": {}, "refused": []} for x in split_of[jid]]
                job = _job(jobs_path, jid) or {"queries": []}
                merged = {}
                for q, pr in zip(job["queries"], parts_):
                    merged[q["id"]] = (pr.get("results") or {}).get(q["id"], ["ERROR timeout"])
                j = {"id": jid, "results": merged, "refused": [x for pr in parts_ for x in pr.get("refused") or []][:20],
                     "seconds": sum(pr.get("seconds") or 0 for pr in parts_), "split": len(split_of[jid]),
                     "timeouts": sum(1 for v in merged.values() if v == ["ERROR timeout"])}
            elif jid in results:
                j = results[jid]
            else:
                continue
            j["job"] = fp_of[jid]
            out.write(json.dumps(j, ensure_ascii=False) + "\n")
    for p in _parts(out_path):
        os.unlink(p)
    if os.path.exists(split_path):
        os.unlink(split_path)
    return {"jobs": len(ids), "kept": len(done), "stale": stale, "ran": total,
            "errors": len([f for f in failed if "#" not in f["id"]]), "split": len(split_of),
            "query_timeouts": len([f for f in failed if "#" in f["id"]]), "minutes": round((time.time() - t0) / 60, 1)}


def main(argv=None) -> int:
    argv = list(sys.argv[1:] if argv is None else argv)
    if argv[:1] == ["worker"]:
        return _worker(argv[1:])
    if argv[:1] == ["pending"]:                                    # how many jobs would run (no engine, nothing changed)
        ap = argparse.ArgumentParser(prog="python -m fusenf.mine.chainer pending")
        ap.add_argument("jobs")
        ap.add_argument("out")
        ap.add_argument("--background", default=None)
        ap.add_argument("--steps", type=int, default=400)
        a = ap.parse_args(argv[1:])
        ids, _fp, done, stale = settle(a.jobs, a.out, a.background, a.steps, dry=True)
        print(json.dumps({"jobs": len(ids), "kept": len(done), "stale": stale, "to_run": len(ids) - len(done)}))
        return 0
    if argv[:1] == ["run"]:
        ap = argparse.ArgumentParser(prog="python -m fusenf.mine.chainer run")
        ap.add_argument("jobs")
        ap.add_argument("out")
        ap.add_argument("--background", default=None, help="a JSON list of statements loaded into every space")
        ap.add_argument("--workers", type=int, default=4)
        ap.add_argument("--steps", type=int, default=400)
        ap.add_argument("--chunk", type=int, default=25)
        ap.add_argument("--job-seconds", type=int, default=180, help="a worker silent this long is stopped (its job split)")
        ap.add_argument("--memory-mb", type=int, default=3500)
        a = ap.parse_args(argv[1:])
        if not available():
            print("the chainer is not importable here: run it with the engine's own Python", file=sys.stderr)
            return 2
        print(json.dumps(run(a.jobs, a.out, a.background, a.workers, a.steps, a.chunk, a.job_seconds, a.memory_mb)))
        return 0
    ap = argparse.ArgumentParser(description="query a space of facts (+ the seeded rules) on the chainer")
    ap.add_argument("--facts", required=True, help="a file with one statement per line, or a JSON list")
    ap.add_argument("--extra", default=None, help="a file with candidate rules, one per line")
    ap.add_argument("--query", action="append", required=True, help="a pattern (repeatable)")
    ap.add_argument("--steps", type=int, default=400)
    ap.add_argument("--no-rules", action="store_true")
    args = ap.parse_args(argv)
    if not available():
        print("the chainer is not importable here", file=sys.stderr)
        return 2
    facts = [l.strip() for l in open(args.facts, encoding="utf-8") if l.strip()]
    extra = [l.strip() for l in open(args.extra, encoding="utf-8") if l.strip()] if args.extra else []
    eng = Engine(facts, extra, rules=not args.no_rules)
    out = {}
    for q in args.query:
        ok, t = eng.derives(q, args.steps)
        out[q] = {"derived": ok, "tv": t}
    print(json.dumps(out))
    return 0


if __name__ == "__main__":
    sys.exit(main())
