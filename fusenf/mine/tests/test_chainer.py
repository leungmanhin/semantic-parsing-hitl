"""The engine runner's bookkeeping, with no engine: a stored result is kept only for the job it was computed from.
Run from the repo root: ``python -m unittest discover -s fusenf/mine/tests``."""
from __future__ import annotations

import json
import os
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, os.pardir, os.pardir, os.pardir))
sys.path.insert(0, REPO)

from fusenf.mine import chainer as CH  # noqa: E402

BACKGROUND = ["(: bg_1 (Member tabby cat) (STV 1.0 0.99))"]
JOBS = [{"id": "j1", "statements": ["(: a (Member sk_a_1 cat) (STV 1.0 0.99))"], "queries": [{"id": "j1|0", "q": "(: $prf (Member sk_a_1 cat) $tv)"}]},
        {"id": "j2", "statements": ["(: b (Member sk_b_1 dog) (STV 1.0 0.99))"], "extra": ["(: r (Implication (Member $x dog) (Member $x animal)) (STV 1.0 0.9))"],
         "queries": [{"id": "j2|0", "q": "(: $prf (Member sk_b_1 animal) $tv)"}]},
        {"id": "j3", "statements": [], "queries": [{"id": "j3|0", "q": "(: $prf (Member tabby cat) $tv)"}]}]


def _write(path, rows):
    with open(path, "w", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r) + "\n")


def _ids(path):
    with open(path, encoding="utf-8") as fh:
        return [json.loads(l)["id"] for l in fh]


class SettleTests(unittest.TestCase):
    def setUp(self):
        self.dir = tempfile.TemporaryDirectory()
        d = self.dir.name
        self.jobs, self.out, self.bg = os.path.join(d, "jobs.jsonl"), os.path.join(d, "results.jsonl"), os.path.join(d, "bg.json")
        _write(self.jobs, JOBS)
        with open(self.bg, "w", encoding="utf-8") as fh:
            json.dump(BACKGROUND, fh)
        self.fp = {j["id"]: CH.fingerprint(j, CH.background_fingerprint(BACKGROUND), 400) for j in JOBS}

    def tearDown(self):
        self.dir.cleanup()

    def test_a_fingerprint_follows_everything_the_answer_depends_on(self):
        bg = CH.background_fingerprint(BACKGROUND)
        base = CH.fingerprint(JOBS[1], bg, 400)
        self.assertEqual(base, CH.fingerprint(json.loads(json.dumps(JOBS[1])), bg, 400))
        changed = [dict(JOBS[1], statements=[]), dict(JOBS[1], extra=[]), dict(JOBS[1], queries=[{"id": "j2|0", "q": "(: $prf (Member sk_b_1 dog) $tv)"}]),
                   dict(JOBS[1], queries=[{"id": "j2|1", "q": JOBS[1]["queries"][0]["q"]}])]
        for job in changed:
            self.assertNotEqual(base, CH.fingerprint(job, bg, 400))
        self.assertNotEqual(base, CH.fingerprint(JOBS[1], bg, 800))
        self.assertNotEqual(base, CH.fingerprint(JOBS[1], CH.background_fingerprint(BACKGROUND + ["(: bg_2 (Member rex dog) (STV 1.0 0.99))"]), 400))

    def test_only_a_result_computed_from_the_job_as_it_stands_is_kept(self):
        _write(self.out, [{"id": "j1", "job": self.fp["j1"], "results": {"j1|0": ["kept"]}},
                          {"id": "j2", "job": "computed-from-other-queries", "results": {"j2|0": ["stale"]}},
                          {"id": "j3", "results": {"j3|0": ["no fingerprint"]}},
                          {"id": "gone", "job": "x", "results": {}}])
        ids, fp_of, done, stale = CH.settle(self.jobs, self.out, self.bg, 400, dry=True)
        self.assertEqual((ids, fp_of, done, stale), (["j1", "j2", "j3"], self.fp, {"j1"}, 3))
        self.assertEqual(len(_ids(self.out)), 4)                                    # a dry look changes nothing
        CH.settle(self.jobs, self.out, self.bg, 400)
        self.assertEqual(_ids(self.out), ["j1"])

    def test_the_parts_of_an_interrupted_run_are_folded_in(self):
        _write(self.out, [{"id": "j1", "job": self.fp["j1"], "results": {}}])
        part = self.out + ".part00003"
        _write(part, [{"id": "j2", "job": self.fp["j2"], "results": {}}, {"id": "j3#0", "job": "a part of a split job", "results": {}}])
        open(part + ".log", "w").close()
        open(self.out + ".split.jobs", "w").close()
        ids, fp_of, done, stale = CH.settle(self.jobs, self.out, self.bg, 400)
        self.assertEqual((done, stale), ({"j1", "j2"}, 0))
        self.assertEqual(_ids(self.out), ["j1", "j2"])
        self.assertEqual(sorted(os.listdir(self.dir.name)), ["bg.json", "jobs.jsonl", "results.jsonl"])

    def test_a_changed_background_makes_every_result_stale(self):
        _write(self.out, [{"id": j["id"], "job": self.fp[j["id"]], "results": {}} for j in JOBS])
        self.assertEqual(CH.settle(self.jobs, self.out, self.bg, 400, dry=True)[2], {"j1", "j2", "j3"})
        with open(self.bg, "w", encoding="utf-8") as fh:
            json.dump(BACKGROUND + ["(: bg_2 (Member rex dog) (STV 1.0 0.99))"], fh)
        self.assertEqual(CH.settle(self.jobs, self.out, self.bg, 400, dry=True)[2:], (set(), 3))


if __name__ == "__main__":
    unittest.main()
