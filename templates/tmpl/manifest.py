"""The catalog's VERSION MANIFEST: the hashes of everything that determines what a parse means,
written beside the generated files and stamped into every suite record and summary.

A parse is paid and its instance records are the base; everything downstream (the atoms, the
views, the truth values) is re-emitted from the records under a catalog version. The manifest
names that version so that a record can be re-emitted, compared or excluded later:

* ``catalog`` — the template files (the same hash the prompt's header line shows);
* ``prompt`` — the rendered instruction set, and ``prompt_body_sha256`` without its header line
  (editing a held-out example changes the catalog hash but not what the parser saw);
* ``substrate`` and ``atom_types`` — the typed substrate and its generated declarations;
* ``rules`` and ``seeded_rules`` — the background rules and their lowered form;
* ``emitter`` — the code that turns a record into atoms: ``validate.py`` and every module of this
  package it imports, followed transitively (the list is ``files.emitter`` in the written
  manifest). The runners (``suite``, ``coverage``), the generators (their outputs are parts of
  their own) and the analysis tools are outside it, so editing them does not version the records.

The ``id`` is the first twelve hex digits of a hash over the parts: a short version name.  The
parser model is not part of it — a record names its model beside the manifest id, since one
catalog version is parsed by several models.

Run from ``templates/``::

    python -m tmpl.manifest            # write generated/MANIFEST.json and print the id
    python -m tmpl.manifest --check    # compare the written manifest with the current state
"""
from __future__ import annotations

import argparse
import ast
import glob
import hashlib
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
OUT = os.path.join(TEMPLATES, "generated", "MANIFEST.json")
SCHEMA = "catalog-manifest/1"

PARTS = [                                  # name, the files it covers: globs under templates/, or
    ("catalog", ["catalog/*.yaml"]),       # "imports:M" = module M with the package modules it imports
    ("prompt", ["generated/PROMPT_CATALOG.txt"]),
    ("substrate", ["atom-type-substrates.json"]),
    ("atom_types", ["generated/atom-types.metta"]),
    ("rules", ["rules.yaml"]),
    ("seeded_rules", ["generated/seeded_rules.metta", "generated/closure_rules.metta"]),
    ("emitter", ["imports:tmpl/validate.py"]),
]


def prompt_body_sha(text: str) -> str:
    """The prompt's hash without its header line, which carries the catalog hash."""
    body = "\n".join(ln for ln in text.splitlines() if not ln.startswith("catalog sha256 "))
    return hashlib.sha256(body.encode("utf-8")).hexdigest()


def _files(globs: list[str], root: str) -> list[str]:
    out: list[str] = []
    for g in globs:
        if g.startswith("imports:"):
            out.extend(_imports(os.path.join(root, g[len("imports:"):])))
        else:
            out.extend(sorted(glob.glob(os.path.join(root, g))))
    return out


def _imports(entry: str) -> list[str]:
    """``entry``, the package's ``__init__.py`` and every module of the package that ``entry``
    imports, followed transitively — ``from . import x``, ``from .x import y``, ``from pkg import x``,
    ``from pkg.x import y``, ``import pkg.x``, at any depth (an import inside a function counts).
    Without the entry module the whole package is covered, so nothing on the path goes unhashed."""
    pkg_dir = os.path.dirname(entry)
    pkg = os.path.basename(pkg_dir)
    if not os.path.exists(entry):
        return sorted(glob.glob(os.path.join(pkg_dir, "*.py")))
    seen: set[str] = set()
    todo = [entry]
    init = os.path.join(pkg_dir, "__init__.py")
    if os.path.exists(init):
        todo.append(init)
    while todo:
        path = todo.pop()
        if path in seen:
            continue
        seen.add(path)
        with open(path, encoding="utf-8") as fh:
            tree = ast.parse(fh.read(), filename=path)
        for node in ast.walk(tree):
            names: list[str] = []
            if isinstance(node, ast.ImportFrom):
                if node.level == 1:
                    names = [node.module.split(".")[0]] if node.module else [a.name for a in node.names]
                elif node.level == 0 and node.module == pkg:
                    names = [a.name for a in node.names]
                elif node.level == 0 and (node.module or "").startswith(pkg + "."):
                    names = [node.module.split(".")[1]]
            elif isinstance(node, ast.Import):
                names = [a.name.split(".")[1] for a in node.names if a.name.startswith(pkg + ".")]
            for name in names:
                module = os.path.join(pkg_dir, name + ".py")
                if os.path.exists(module) and module not in seen:
                    todo.append(module)
    return sorted(seen)


def _hash(paths: list[str]) -> str:
    """One hash over several files: each file's name and bytes in order (the prompt header's
    catalog hash is this function over the catalog directory)."""
    h = hashlib.sha256()
    for path in paths:
        with open(path, "rb") as fh:
            h.update(os.path.basename(path).encode() + b"\0" + fh.read() + b"\0")
    return h.hexdigest()


def compute(root: str = TEMPLATES) -> dict:
    """The manifest of the catalog under ``root``: its parts' hashes, their files and the id."""
    parts: dict[str, str] = {}
    files: dict[str, list[str]] = {}
    for name, globs in PARTS:
        paths = _files(globs, root)
        parts[name] = _hash(paths)
        files[name] = [os.path.relpath(p, root) for p in paths]
    prompt_path = os.path.join(root, "generated", "PROMPT_CATALOG.txt")
    body = None
    if os.path.exists(prompt_path):
        with open(prompt_path, encoding="utf-8") as fh:
            body = prompt_body_sha(fh.read())
    counts = {"templates": sum(1 for p in files["catalog"] if not os.path.basename(p).startswith("_"))}
    substrate = os.path.join(root, "atom-type-substrates.json")
    if os.path.exists(substrate):
        with open(substrate, encoding="utf-8") as fh:
            try:
                counts["heads"] = len(json.load(fh).get("heads", {}))
            except ValueError:
                pass                                   # the hash still covers the file; the count is a courtesy
    ident = hashlib.sha256(json.dumps(parts, sort_keys=True).encode("utf-8")).hexdigest()[:12]
    return {"schema": SCHEMA, "id": ident, "parts": parts, "prompt_body_sha256": body, "counts": counts, "files": files}


def write(path: str = OUT, root: str = TEMPLATES) -> dict:
    m = compute(root)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as fh:
        json.dump(m, fh, indent=2, ensure_ascii=False)
        fh.write("\n")
    return m


def read(path: str = OUT) -> dict | None:
    if not os.path.exists(path):
        return None
    with open(path, encoding="utf-8") as fh:
        return json.load(fh)


def current_id(root: str = TEMPLATES) -> str:
    return compute(root)["id"]


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description="write or check the catalog's version manifest")
    ap.add_argument("--out", default=OUT)
    ap.add_argument("--check", action="store_true", help="compare the written manifest with the current state; write nothing")
    args = ap.parse_args(argv)
    if args.check:
        written, now = read(args.out), compute()
        fresh = written is not None and written.get("id") == now["id"]
        stale = [] if fresh else [k for k, v in now["parts"].items() if (written or {}).get("parts", {}).get(k) != v]
        print(f"manifest {now['id']} · written {'fresh' if fresh else 'STALE: ' + ', '.join(stale) if written else 'MISSING'}")
        return 0 if fresh else 1
    m = write(args.out)
    print(f"wrote {os.path.relpath(args.out, TEMPLATES)} (manifest {m['id']}: {m['counts'].get('templates')} templates, {m['counts'].get('heads')} heads)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
