"""M5 question arm — QGEN collection + validation + QPARSE batch build (item F).

Mechanical, orchestrator-side: read every sampled record's `questions/<ID>.q.json`,
validate against the QGEN contract (two questions, kinds literal/paraphrastic, qids
well-formed, answer a verbatim case-insensitive substring of the sentence, paraphrastic
`reworded` present with a `question_word` that differs from the `sentence_word`), then
write `batches/question/qp-NN.txt` (5-question TSV batches: `<QID>\t<QUESTION>`) for the
QPARSE wave and record the inventory + flags in `questions/manifest.json`.

Flagged questions are ACCOUNTED and excluded from the QPARSE wave, never edited
(never-auto-repair-content applies to questions too).

Usage:  python m5q_collect.py
"""

from __future__ import annotations

import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
FUSENF = os.path.dirname(HERE)


def main():
    manifest_path = os.path.join(FUSENF, "questions", "manifest.json")
    manifest = json.load(open(manifest_path, encoding="utf-8"))
    corpus = {}
    for name in ("tierA.jsonl", "tierB.jsonl", "tierC.jsonl"):
        p = os.path.join(FUSENF, "corpora", name)
        if os.path.exists(p):
            for l in open(p, encoding="utf-8"):
                r = json.loads(l)
                corpus[r["id"]] = " ".join(r["sentences"])

    ok, flagged, missing = [], [], []
    for s in manifest["sample"]:
        cid = s["id"]
        path = os.path.join(FUSENF, "questions", "%s.q.json" % cid)
        if not os.path.exists(path):
            missing.append(cid)
            continue
        try:
            rec = json.load(open(path, encoding="utf-8"))
        except Exception as e:
            flagged.append({"id": cid, "flag": "unparseable-json: %s" % e})
            continue
        text = corpus.get(cid, "").lower()
        qs = rec.get("questions", [])
        kinds = [q.get("kind") for q in qs]
        if kinds != ["literal", "paraphrastic"]:
            flagged.append({"id": cid, "flag": "kinds=%s" % kinds})
            continue
        for q in qs:
            flags = []
            if q.get("qid") not in ("%s-q1" % cid, "%s-q2" % cid):
                flags.append("bad-qid")
            if not q.get("question", "").strip().endswith("?"):
                flags.append("not-a-question")
            ans = q.get("answer", "").strip().strip(".,;:!?").lower()
            if not ans or ans not in text:
                flags.append("answer-not-verbatim")
            if q["kind"] == "paraphrastic":
                rw = q.get("reworded") or {}
                sw = rw.get("sentence_word", "").strip().lower()
                qw = rw.get("question_word", "").strip().lower()
                if not sw or not qw or sw == qw:
                    flags.append("reworded-missing-or-identical")
                elif sw not in text:
                    flags.append("sentence-word-not-in-sentence")
                elif qw in text:
                    flags.append("question-word-still-in-sentence")
            if flags:
                flagged.append({"id": cid, "qid": q.get("qid"), "flag": ";".join(flags)})
            else:
                ok.append({"qid": q["qid"], "question": q["question"].strip()})

    bdir = os.path.join(FUSENF, "batches", "question")
    batches = []
    for i in range(0, len(ok), 5):
        name = "qp-%02d.txt" % (len(batches) + 1)
        with open(os.path.join(bdir, name), "w", encoding="utf-8") as fh:
            for q in ok[i:i + 5]:
                fh.write("%s\t%s\n" % (q["qid"], q["question"].replace("\t", " ")))
        batches.append(name)

    manifest["qgen_collected"] = {"ok": len(ok), "flagged": flagged, "missing": missing}
    manifest["qparse_batches"] = batches
    json.dump(manifest, open(manifest_path, "w", encoding="utf-8"), indent=1, sort_keys=True)
    print("ok %d  flagged %d  missing %d  qparse batches %d" % (
        len(ok), len(flagged), len(missing), len(batches)))
    for f in flagged:
        print("  FLAG", f)


if __name__ == "__main__":
    main()
