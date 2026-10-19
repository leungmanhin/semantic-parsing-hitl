"""Rewrite every catalog example's ``emitted:`` / ``declarations:`` block from the emitter.

An example that carries an illustration shows what the program renders for its instances; the
emitter is the authority, so after any emitter or template change the blocks are regenerated here
rather than by hand. The rewrite is text-level: only the list items under the two keys change,
comments and the rest of the file stay as they are. ``Instance`` declarations are left out of the
illustration (the emitter adds them for every instance subtype).

    python -m tmpl.refresh_illustrations                  # the catalog directory
    python -m tmpl.refresh_illustrations --catalog-dir D  # another directory of templates
"""
from __future__ import annotations

import argparse
import glob
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.abspath(os.path.join(HERE, os.pardir)))

from tmpl import catalog as CAT, emit as E  # noqa: E402

_ATOM = re.compile(r"^\(:\s+\S+\s+(\(.*\))\s+\(STV")


def atoms(statements: list[str]) -> list[str]:
    return [_ATOM.match(s).group(1) for s in statements]


def quoted(atom: str) -> str:
    return '"' + atom.replace("\\", "\\\\").replace('"', '\\"') + '"'


def refresh_file(path: str, template: dict, catalog: dict) -> int:
    """Rewrite the blocks of one template file; returns the number of blocks changed."""
    lines = open(path, encoding="utf-8").read().split("\n")
    changed = 0
    for section in ("shown", "held_out"):
        for ex in template["examples"].get(section) or []:
            if not ex.get("emitted"):
                continue
            out = E.emit({"id": "illustration", "instances": ex["instances"],
                          "reference_time": ex.get("reference_time")}, catalog)
            blocks = {"emitted:": atoms(out["statements"]),
                      "declarations:": [d for d in out["declarations"] if " Instance)" not in d]}
            text_line = next(i for i, l in enumerate(lines) if l.strip().startswith(f'text: "{ex["text"]}"'))
            for key, items in blocks.items():
                ki = next(i for i in range(text_line, len(lines)) if lines[i].strip().startswith(key))
                indent = len(lines[ki]) - len(lines[ki].lstrip())
                j = ki + 1
                while j < len(lines) and lines[j].startswith(" " * (indent + 2) + "- "):
                    j += 1
                block = [" " * (indent + 2) + "- " + quoted(a) for a in items]
                if lines[ki + 1:j] != block:
                    lines[ki + 1:j] = block
                    changed += 1
    if changed:
        open(path, "w", encoding="utf-8").write("\n".join(lines))
    return changed


def refresh(directory: str = CAT.CATALOG_DIR) -> int:
    catalog = CAT.load(directory)
    changed = 0
    for path in sorted(glob.glob(os.path.join(directory, "*.yaml"))):
        tid = os.path.basename(path)[:-5]
        if tid.startswith("_"):
            continue
        changed += refresh_file(path, catalog[tid], catalog)
    return changed


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--catalog-dir", default=CAT.CATALOG_DIR)
    args = ap.parse_args(argv)
    n = refresh(args.catalog_dir)
    print(f"illustration blocks rewritten: {n}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
