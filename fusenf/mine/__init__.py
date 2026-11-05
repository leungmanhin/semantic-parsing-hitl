"""fusenf.mine — the five mining methods on the catalog-era parses (fusenf/README.md; the §5 decisions of the
Next-Steps walkthrough). The package reads the parsed records of ``datasets/sample/*.parsed.jsonl`` through the
emitter in ``templates/tmpl`` and never writes outside ``fusenf/runs``.

Modules: ``atoms`` (a parsed sentence as a graph of atoms with scopes, types and provenance), ``lift`` (symbols →
typed variables under the key dials), ``tables`` (family-level presence), ``candidates`` (the shared candidate
record), ``chainer`` (the engine runner); §5.1: ``patterns`` (the binding-aware miner: connected patterns with
shared typed variables, counted by family, in the lexicalized and the shape view), ``generalize`` (typed
anti-unification and its renaming / broken-link tests), ``subtree`` (the two together: candidate records and the
summary of a run). Run from the repo root: ``python -m fusenf.mine …``."""
from __future__ import annotations

import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, os.pardir, os.pardir))
TEMPLATES = os.path.join(REPO, "templates")
RUNS = os.path.join(REPO, "fusenf", "runs")
if TEMPLATES not in sys.path:
    sys.path.insert(0, TEMPLATES)
