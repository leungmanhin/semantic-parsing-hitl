"""The catalog's version manifest: deterministic, sensitive to every part, written and checked,
and stamped through the suite runner."""
from __future__ import annotations

import json
import os
import shutil
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import manifest as MF  # noqa: E402


class ManifestTests(unittest.TestCase):
    def test_compute_is_deterministic_and_names_every_part(self):
        a, b = MF.compute(), MF.compute()
        self.assertEqual(a, b)
        self.assertEqual(a["schema"], MF.SCHEMA)
        self.assertRegex(a["id"], r"^[0-9a-f]{12}$")
        self.assertEqual(set(a["parts"]), {name for name, _ in MF.PARTS})
        self.assertTrue(all(len(v) == 64 for v in a["parts"].values()))
        self.assertGreater(a["counts"]["templates"], 50)
        self.assertGreater(a["counts"]["heads"], 100)
        self.assertEqual(a["prompt_body_sha256"], MF.prompt_body_sha(open(os.path.join(TEMPLATES, "generated", "PROMPT_CATALOG.txt"), encoding="utf-8").read()))

    def test_the_written_manifest_is_fresh_and_matches_the_prompt_header(self):
        written = MF.read()
        self.assertIsNotNone(written, "run python -m tmpl.manifest")
        self.assertEqual(written["id"], MF.current_id(), "generated/MANIFEST.json is stale: regenerate")
        header = open(os.path.join(TEMPLATES, "generated", "PROMPT_CATALOG.txt"), encoding="utf-8").readline()
        with open(os.path.join(TEMPLATES, "generated", "PROMPT_CATALOG.txt"), encoding="utf-8") as fh:
            for ln in fh:
                if ln.startswith("catalog sha256 "):
                    self.assertTrue(ln.split()[2].startswith(written["parts"]["catalog"][:16]))   # the same hash the prompt shows
                    break
            else:
                self.fail("no catalog hash line in the prompt")

    def test_changing_any_part_changes_the_id(self):
        root = tempfile.mkdtemp()
        try:
            for sub in ("catalog", "generated", "tmpl"):
                os.makedirs(os.path.join(root, sub))
            for name, globs in MF.PARTS:
                for g in globs:
                    rel = g.split(":", 1)[-1].replace("*.yaml", "a.yaml").replace("*.py", "a.py")
                    with open(os.path.join(root, rel), "w", encoding="utf-8") as fh:
                        fh.write(f"{name}\n")
            with open(os.path.join(root, "atom-type-substrates.json"), "w", encoding="utf-8") as fh:
                json.dump({"heads": {"Member": {}}}, fh)
            base = MF.compute(root)
            self.assertEqual(base["counts"], {"templates": 1, "heads": 1})
            for name, globs in MF.PARTS:
                rel = globs[0].split(":", 1)[-1].replace("*.yaml", "a.yaml").replace("*.py", "a.py")
                path = os.path.join(root, rel)
                if rel.endswith(".json"):
                    with open(path, "w", encoding="utf-8") as fh:
                        json.dump({"heads": {"Member": {}, "Agent": {}}}, fh)
                else:
                    with open(path, "a", encoding="utf-8") as fh:
                        fh.write("changed\n")
                changed = MF.compute(root)
                self.assertNotEqual(changed["id"], base["id"], name)
                self.assertNotEqual(changed["parts"][name], base["parts"][name], name)
                self.assertEqual({k: v for k, v in changed["parts"].items() if k != name},
                                 {k: v for k, v in base["parts"].items() if k != name}, name)   # only that part moved
                base = changed
            out = os.path.join(root, "generated", "MANIFEST.json")
            written = MF.write(out, root)
            self.assertEqual(MF.read(out), written)
        finally:
            shutil.rmtree(root, ignore_errors=True)

    def test_the_emitter_part_follows_the_emission_path(self):
        """The emitter part is validate.py and the package modules it imports, transitively: a runner
        or a new tool can change without versioning the records; a module on the path cannot."""
        root = tempfile.mkdtemp()
        pkg = os.path.join(root, "tmpl")
        os.makedirs(pkg)

        def put(name, text):
            with open(os.path.join(pkg, name), "w", encoding="utf-8") as fh:
                fh.write(text)

        try:
            put("__init__.py", '"""the package"""\n')
            put("validate.py", "from . import catalog as CAT, emit as E\n")
            put("emit.py", "from . import catalog as CAT\n\ndef f():\n    from .helper import h  # an import inside a function\n    return h\n")
            put("catalog.py", "import os\n")
            put("helper.py", "h = 1\n")
            put("suite.py", "from . import validate as V, emit as E\n")          # a runner: imports the path, is not on it
            put("tool.py", "from tmpl import catalog as CAT\n")                  # an analysis tool
            on_path = ["tmpl/__init__.py", "tmpl/catalog.py", "tmpl/emit.py", "tmpl/helper.py", "tmpl/validate.py"]
            self.assertEqual(MF.compute(root)["files"]["emitter"], on_path)
            base = MF.compute(root)["id"]
            put("suite.py", "from . import validate as V, emit as E\nprint('a logging change')\n")
            put("tool.py", "from tmpl import catalog as CAT\n# reworded\n")
            put("new_tool.py", "from . import emit as E\n")
            self.assertEqual(MF.compute(root)["id"], base, "a runner or tool edit must not version the records")
            put("helper.py", "h = 2\n")
            self.assertNotEqual(MF.compute(root)["id"], base, "a module on the emission path is hashed")
            put("catalog.py", "import os\nfrom tmpl.extra import x\n")                # a new module joins the path
            put("extra.py", "x = 1\n")
            self.assertIn("tmpl/extra.py", MF.compute(root)["files"]["emitter"])
            os.remove(os.path.join(pkg, "validate.py"))                                # no entry: the whole package
            self.assertEqual(len(MF.compute(root)["files"]["emitter"]), len([n for n in os.listdir(pkg) if n.endswith(".py")]))
        finally:
            shutil.rmtree(root, ignore_errors=True)

    def test_the_real_emitter_part_is_the_emission_path(self):
        part = {os.path.basename(p) for p in MF.compute()["files"]["emitter"]}
        self.assertTrue({"validate.py", "emit.py", "catalog.py", "typecheck.py"} <= part, part)
        self.assertFalse(part & {"suite.py", "coverage.py", "render_prompt.py", "refresh_illustrations.py",
                                 "gen_substrate.py", "rules.py", "frequency.py", "manifest.py"}, part)


if __name__ == "__main__":
    unittest.main(verbosity=1)
