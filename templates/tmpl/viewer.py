"""A browser view of the parsed corpus sentences: each sentence with its dataset, family and role,
the model and prompt version that parsed it, and its parse as MeTTa statements (the emitter's
output for the stored reply), grouped by family, with the family's labelled pairs where the
dataset has them (SICK, MRPC). One self-contained HTML file, no server: open it in a browser.

    python -m tmpl.viewer                          # the default parsed files → datasets/sample/viewer.html
    python -m tmpl.viewer --parsed a.jsonl b.jsonl --out view.html
    python -m tmpl.viewer --show "diving into a pool"   # the matching sentences in the terminal

A reply is emitted with the CURRENT catalog: an older reply the emitter now refuses is shown as
refused, with the reason, never dropped. Each parsed file keeps one record per sentence (the
latest successful reply, as the coverage report reads it).
"""
from __future__ import annotations

import argparse
import collections
import glob
import json
import os
import sys

from . import catalog as CAT, coverage as C, emit as E

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, os.pardir, os.pardir))
SAMPLE_DIR = os.path.join(REPO, "datasets", "sample")
PREPARED = os.path.join(REPO, "datasets", "prepared")
DEFAULT_PARSED = [os.path.join(SAMPLE_DIR, "paraphrase.parsed.jsonl"), os.path.join(SAMPLE_DIR, "coverage-sample.parsed.jsonl")]
DEFAULT_OUT = os.path.join(SAMPLE_DIR, "viewer.html")


def _read(path: str) -> list[dict]:
    with open(path, encoding="utf-8") as fh:
        return [json.loads(line) for line in fh if line.strip()]


def emitted(rec: dict, catalog: dict) -> dict:
    """The record's parse: its statements, unmapped spans and issues — or why there are none."""
    reply = rec.get("reply") or {}
    resp = reply.get("response")
    out = {"statements": [], "unmapped": [], "issues": 0, "error": None}
    if reply.get("error") or not isinstance(resp, dict):
        out["error"] = f"no parse: {str(reply.get('error') or 'no response')[:200]}"
        return out
    out["unmapped"] = [{"span": u.get("span", ""), "code": u.get("code", "")} for u in resp.get("unmapped") or [] if isinstance(u, dict)]
    out["issues"] = len(resp.get("issues") or [])
    try:
        out["statements"] = E.emit({"id": rec["id"], "instances": [dict(i) for i in resp.get("instances") or []]}, catalog)["statements"]
    except Exception as exc:                       # an older reply today's emitter refuses: shown, never dropped
        out["error"] = f"emitter refused: {type(exc).__name__}: {str(exc)[:300]}"
    return out


def collect(paths: list[str], catalog: dict) -> list[dict]:
    rows, seen = [], set()
    for path in paths:
        for r in C.latest(_read(path)):
            if (r["id"], r.get("text")) in seen:
                continue
            seen.add((r["id"], r.get("text")))
            reply = r.get("reply") or {}
            rows.append({"id": r["id"], "dataset": r.get("dataset", ""), "split": r.get("split", ""), "doc": str(r.get("doc", "")),
                         "family": r.get("family") or f"{r.get('dataset', '')}:{r.get('doc', '')}", "role": r.get("role", ""),
                         "text": r.get("text", ""), "model": reply.get("model", ""), "manifest": reply.get("manifest_id", ""),
                         "source": os.path.basename(path), **emitted(r, catalog)})
    return rows


def pairs_for(rows: list[dict], prepared_dir: str = PREPARED) -> list[dict]:
    """The labelled pairs (SICK, MRPC) whose two sentences are both among the rows, by record id."""
    by_doc = {(r["dataset"], r["doc"]): r["id"] for r in rows}
    out = []
    for ds in ("sick", "mrpc"):
        path = os.path.join(prepared_dir, f"{ds}.pairs.jsonl")
        if not os.path.exists(path):
            continue
        for p in _read(path):
            a, b = by_doc.get((ds, str(p["a"]))), by_doc.get((ds, str(p["b"])))
            if a and b:
                label = p["label"] if ds == "sick" else ("equivalent" if p["label"] == 1 else "not equivalent")
                both = p.get("ab") == "A_entails_B" and p.get("ba") == "B_entails_A"
                out.append({"family": p["family"], "a": a, "b": b, "label": label,
                            "detail": "both ways" if both else f"{p.get('ab', '')} · {p.get('ba', '')}".strip(" ·")})
    return out


def show(rows: list[dict], query: str, limit: int = 10) -> str:
    q = query.lower()
    hits = [r for r in rows if q in r["text"].lower() or q == r["id"] or q == r["family"]][:limit]
    lines = []
    for r in hits:
        lines.append(f'\n"{r["text"]}"\n   {r["id"]} · {r["family"]} · {r["role"] or "-"} · {r["model"]} · manifest {r["manifest"]}')
        lines += [f"   {s}" for s in r["statements"]]
        lines += [f"   unmapped ({u['code']}): {u['span']}" for u in r["unmapped"]]
        if r["error"]:
            lines.append(f"   {r['error']}")
    return "\n".join(lines) if lines else f"no sentence matches {query!r}"


PAGE = """<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Parse viewer</title>
<style>
:root{--bg:#fbfaf7;--fg:#1f2328;--muted:#6a6f76;--card:#fff;--line:#e3e0d8;--accent:#2f5d8a;--warn:#9a5b00;--warnbg:#fff4e0;--err:#a3262a;--code:#f4f2ec}
@media (prefers-color-scheme:dark){:root{--bg:#16181c;--fg:#e6e6e3;--muted:#9aa0a6;--card:#1e2126;--line:#30343b;--accent:#8ab4e8;--warn:#f0b35a;--warnbg:#3a2c12;--err:#f08080;--code:#24282e}}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--fg);font:15px/1.45 system-ui,-apple-system,Segoe UI,sans-serif}
header{position:sticky;top:0;background:var(--bg);border-bottom:1px solid var(--line);padding:12px 16px;z-index:1}
h1{font-size:18px;margin:0 0 6px}.meta{color:var(--muted);font-size:13px}
.controls{display:flex;flex-wrap:wrap;gap:8px;margin-top:8px}.controls input[type=search]{flex:1 1 260px;padding:6px 8px;border:1px solid var(--line);border-radius:6px;background:var(--card);color:var(--fg)}
.controls select,.controls label{padding:6px 8px;border:1px solid var(--line);border-radius:6px;background:var(--card);color:var(--fg);font-size:14px}
main{max-width:1100px;margin:0 auto;padding:12px 16px 40px}
.family{border:1px solid var(--line);border-radius:8px;background:var(--card);margin:12px 0;padding:10px 12px}
.fhead{font-size:13px;color:var(--muted)}.fhead b{color:var(--fg)}
.pairs{margin:6px 0 4px;font-size:13px}.pairs div{padding:2px 0}.lab{display:inline-block;min-width:96px;font-weight:600}
.sent{border-top:1px solid var(--line);margin-top:8px;padding-top:8px}.text{font-size:16px}.small{font-size:12px;color:var(--muted)}
pre{background:var(--code);padding:8px;border-radius:6px;overflow-x:auto;font-size:12.5px;margin:6px 0 0;white-space:pre-wrap;word-break:break-word}
.chip{display:inline-block;background:var(--warnbg);color:var(--warn);border-radius:4px;padding:1px 6px;margin:4px 4px 0 0;font-size:12.5px}
.err{color:var(--err);font-size:13px;margin-top:4px}.more{display:block;margin:16px auto;padding:8px 16px;border:1px solid var(--line);border-radius:6px;background:var(--card);color:var(--fg);cursor:pointer}
a{color:var(--accent)}
</style></head><body>
<header><h1>Parse viewer</h1><div class="meta" id="meta"></div>
<div class="controls"><input type="search" id="q" placeholder="search a sentence, an id, a family or a statement…">
<select id="ds"></select><select id="role"></select><label><input type="checkbox" id="um"> with unmapped spans</label>
<label><input type="checkbox" id="er"> refused / no parse</label></div></header>
<main id="out"></main>
<script id="data" type="application/json">__DATA__</script>
<script>
const D = JSON.parse(document.getElementById('data').textContent);
const byId = new Map(D.rows.map(r => [r.id, r]));
const famPairs = new Map(); D.pairs.forEach(p => { if (!famPairs.has(p.family)) famPairs.set(p.family, []); famPairs.get(p.family).push(p); });
const fams = new Map(); D.rows.forEach(r => { if (!fams.has(r.family)) fams.set(r.family, []); fams.get(r.family).push(r); });
const el = (tag, cls, txt) => { const e = document.createElement(tag); if (cls) e.className = cls; if (txt != null) e.textContent = txt; return e; };
function opts(sel, values, label) { sel.innerHTML = ''; [['', label], ...values.map(v => [v, v])].forEach(([v, t]) => { const o = el('option', null, t); o.value = v; sel.appendChild(o); }); }
opts(document.getElementById('ds'), [...new Set(D.rows.map(r => r.dataset))].sort(), 'all datasets');
opts(document.getElementById('role'), [...new Set(D.rows.map(r => r.role).filter(Boolean))].sort(), 'all roles');
document.getElementById('meta').textContent = `${D.rows.length} sentences in ${fams.size} families · ${D.pairs.length} labelled pairs · sources: ${D.sources.join(', ')} · manifests: ${D.manifests.join(', ')}`;
let shown = 0, matched = [];
function sentence(r) {
  const s = el('div', 'sent'); s.id = r.id;
  s.appendChild(el('div', 'text', r.text));
  s.appendChild(el('div', 'small', `${r.id} · ${r.dataset}${r.split ? ' / ' + r.split : ''} · ${r.model || 'no model'} · manifest ${r.manifest || '-'} · ${r.source}`));
  r.unmapped.forEach(u => s.appendChild(el('span', 'chip', `unmapped ${u.code}: ${u.span}`)));
  if (r.error) s.appendChild(el('div', 'err', r.error));
  if (r.statements.length) s.appendChild(el('pre', null, r.statements.join('\\n')));
  return s;
}
function family(name, rows) {
  const f = el('div', 'family'), h = el('div', 'fhead');
  h.appendChild(el('b', null, name)); h.appendChild(document.createTextNode(` · ${rows[0].dataset} · ${rows[0].role || 'no role'} · ${rows.length} sentence${rows.length > 1 ? 's' : ''}`));
  f.appendChild(h);
  const ps = famPairs.get(name) || [];
  if (ps.length) {
    const box = el('div', 'pairs');
    ps.forEach(p => { const d = el('div'); d.appendChild(el('span', 'lab', p.label)); const a = byId.get(p.a), b = byId.get(p.b);
      d.appendChild(document.createTextNode(`${a.text}  ⟷  ${b.text}  (${p.detail})`)); box.appendChild(d); });
    f.appendChild(box);
  }
  rows.forEach(r => f.appendChild(sentence(r)));
  return f;
}
function apply() {
  const q = document.getElementById('q').value.trim().toLowerCase(), ds = document.getElementById('ds').value, role = document.getElementById('role').value;
  const um = document.getElementById('um').checked, er = document.getElementById('er').checked;
  const hit = r => (!ds || r.dataset === ds) && (!role || r.role === role) && (!um || r.unmapped.length) && (!er || r.error)
    && (!q || r.text.toLowerCase().includes(q) || r.id.toLowerCase() === q || r.family.toLowerCase() === q || r.statements.some(s => s.toLowerCase().includes(q)));
  matched = [...fams.entries()].filter(([, rows]) => rows.some(hit));
  shown = 0; document.getElementById('out').innerHTML = ''; more();
}
function more() {
  const out = document.getElementById('out'); const old = document.getElementById('more'); if (old) old.remove();
  matched.slice(shown, shown + 60).forEach(([name, rows]) => out.appendChild(family(name, rows))); shown += 60;
  if (!matched.length) out.appendChild(el('p', 'small', 'no family matches'));
  if (shown < matched.length) { const b = el('button', 'more', `show more (${matched.length - shown} families left)`); b.id = 'more'; b.onclick = more; out.appendChild(b); }
}
['q', 'ds', 'role', 'um', 'er'].forEach(i => document.getElementById(i).addEventListener('input', apply));
apply();
</script></body></html>
"""


def page(rows: list[dict], pairs: list[dict], sources: list[str]) -> str:
    data = {"rows": rows, "pairs": pairs, "sources": [os.path.basename(s) for s in sources],
            "manifests": sorted({r["manifest"] for r in rows if r["manifest"]})}
    blob = json.dumps(data, ensure_ascii=False).replace("</", "<\\/")      # nothing in the data can close the script tag
    return PAGE.replace("__DATA__", blob)


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description="a browser view of parsed sentences and their MeTTa statements")
    ap.add_argument("--parsed", nargs="*", default=None, help="parsed files (default: the paraphrase replies and the coverage sample)")
    ap.add_argument("--out", default=DEFAULT_OUT, help="the HTML file to write")
    ap.add_argument("--show", default=None, help="print the sentences matching this text (or an id / a family) instead")
    args = ap.parse_args(argv)
    paths = [p for pat in (args.parsed or DEFAULT_PARSED) for p in sorted(glob.glob(pat))]
    if not paths:
        print("no parsed files found", file=sys.stderr)
        return 2
    catalog = CAT.load()
    rows = collect(paths, catalog)
    if args.show is not None:
        print(show(rows, args.show))
        return 0
    pairs = pairs_for(rows)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write(page(rows, pairs, paths))
    refused = sum(1 for r in rows if r["error"])
    counts = collections.Counter(r["dataset"] for r in rows)
    print(f"wrote {os.path.relpath(args.out, REPO)}: {len(rows)} sentences ({', '.join(f'{k} {v}' for k, v in sorted(counts.items()))}), "
          f"{len(pairs)} labelled pairs, {refused} with no statements (refused or no parse)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
