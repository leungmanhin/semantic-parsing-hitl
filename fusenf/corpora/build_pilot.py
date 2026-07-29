"""Build the P1 micro-pilot corpus (M1 sample: 20 sentences, stratified by construct family).

These are hand-authored, NOT sampled from a natural corpus — the pilot's job is to exercise the
pipeline end to end and produce an M1 stability baseline, and for that, stratified coverage of the
construct families matters more than naturalness. Tier B (P2) sources real text (Tatoeba, Simple
English Wikipedia). Recorded honestly as source="pilot-stratified" so no later report can mistake
this for a natural-corpus result.

Sentences are deliberately distinct from both prompt.txt examples and the regression goldens, so a
parse reflects the instructions generalizing rather than recitation.
"""
import json, hashlib, pathlib

ITEMS = [
    ("categorical",      ["Sunniva is a hydrologist."]),
    ("event-transitive", ["The technician replaced the cracked bearing."]),
    ("event-ditrans",    ["Renata handed the surveyor a clipboard."]),
    ("tense-passive",    ["The east wing was repainted last spring."]),
    ("modality-epist",   ["The consignment might clear customs before Thursday."]),
    ("deontic",          ["Volunteers must sign the register on arrival."]),
    ("negation",         ["The pump did not restart after the outage."]),
    ("generic",          ["Barn owls hunt at night."]),
    ("quant-scope",      ["Every apprentice completed a safety module."]),
    ("cardinality",      ["Three of the seven presses were idle."]),
    ("comparative",      ["The replacement burner runs quieter than the original."]),
    ("measure",          ["The samples weighed 4.2 kilograms."]),
    ("time",             ["The lease expires on 30 September 2027."]),
    ("coordination",     ["Imani and Rurik jointly drafted the charter."]),
    ("disjunction",      ["The fault lies in the relay or the wiring."]),
    ("coreference",      ["Aunt Delphine restored an old clock.",
                          "She sold it the following year."]),
    ("connective",       ["The culvert flooded because the grate had clogged."]),
    ("focus",            ["Only the night shift reported the smell."]),
    ("attitude",         ["The registrar suspected the tally had been padded."]),
    ("possession-part",  ["Most of Farhan's tools were missing."]),
]

EMPTY_CONTEXT = {"today": None, "domain": None, "prior": [], "notes": None}


def input_sha256(item):
    payload = {"sentences": item["sentences"], "context": item["context"]}
    return hashlib.sha256(
        json.dumps(payload, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode()
    ).hexdigest()


def main():
    out = pathlib.Path("/home/manhin/Dev/semantic-parsing-hitl/fusenf/corpora/pilot.jsonl")
    records = []
    for n, (family, sentences) in enumerate(ITEMS, start=1):
        item = {
            "schema": "fusenf-corpus/1",
            "id": f"pilot-{n:06d}",
            "source": "pilot-stratified",
            "sentences": sentences,
            "context": dict(EMPTY_CONTEXT),
            "equiv_class": None,
            "labels": {"family": family},
        }
        item["input_sha256"] = input_sha256(item)
        records.append(item)
    with out.open("w", encoding="utf-8") as fh:
        for r in records:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")
    print(f"{len(records)} corpus items -> {out}")
    print("families:", ", ".join(sorted({r['labels']['family'] for r in records})))


if __name__ == "__main__":
    main()
