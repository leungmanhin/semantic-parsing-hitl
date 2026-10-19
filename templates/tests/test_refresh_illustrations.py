"""The illustration refresher: a doctored block is restored from the emitter; a second run changes nothing;
the real catalog's illustrations are already current.

Run from ``templates/``: ``python tests/test_refresh_illustrations.py``
"""
from __future__ import annotations

import os
import shutil
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import catalog as CAT, refresh_illustrations as R  # noqa: E402


class RefreshTests(unittest.TestCase):
    def test_real_catalog_is_current(self):
        with tempfile.TemporaryDirectory() as tmp:
            copy = os.path.join(tmp, "catalog")
            shutil.copytree(CAT.CATALOG_DIR, copy)
            self.assertEqual(R.refresh(copy), 0)

    def test_doctored_block_is_restored_and_the_rewrite_is_idempotent(self):
        with tempfile.TemporaryDirectory() as tmp:
            copy = os.path.join(tmp, "catalog")
            shutil.copytree(CAT.CATALOG_DIR, copy)
            path = os.path.join(copy, "activity.yaml")
            text = open(path, encoding="utf-8").read()
            before = text
            doctored = text.replace('        - "(Past sk_laugh_1)"\n', '        - "(Past sk_laugh_1)"\n        - "(Stale atom)"\n', 1)
            self.assertNotEqual(doctored, text)
            open(path, "w", encoding="utf-8").write(doctored)
            self.assertEqual(R.refresh(copy), 1)
            self.assertEqual(open(path, encoding="utf-8").read(), before)
            self.assertEqual(R.refresh(copy), 0)


if __name__ == "__main__":
    unittest.main()
