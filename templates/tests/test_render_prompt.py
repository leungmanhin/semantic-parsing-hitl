"""Tests for the prompt renderer (tmpl/render_prompt.py): the instruction set is a deterministic
function of the catalog, shows only the ``shown`` examples with their emitted rendering, states
every template's boundary, and names another template in an abstain line only when that
template exists in the catalog.

Run from ``templates/``: ``python tests/test_render_prompt.py``
"""
from __future__ import annotations

import hashlib
import os
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
TEMPLATES = os.path.abspath(os.path.join(HERE, os.pardir))
sys.path.insert(0, TEMPLATES)

from tmpl import catalog as CAT, render_prompt as RP  # noqa: E402

CATALOG = CAT.load()
GENERAL = CAT.load_general()


class RenderTests(unittest.TestCase):
    def setUp(self):
        self.text = RP.generate(CATALOG, GENERAL)

    def test_deterministic(self):
        again = RP.generate(CATALOG, GENERAL)
        self.assertEqual(hashlib.sha256(self.text.encode()).hexdigest(),
                         hashlib.sha256(again.encode()).hexdigest())

    def test_every_template_has_a_section_with_boundary_and_slots(self):
        for tid, t in CATALOG.items():
            self.assertIn(f"### {tid} — ", self.text)
            if (t.get("trigger") or {}).get("boundary"):
                self.assertIn("Not this template:", self.text)
            for sname in (t.get("slots") or {}):
                self.assertIn(f"`{sname}`", self.text)

    def test_shown_examples_rendered_and_held_out_never(self):
        for tid, t in CATALOG.items():
            ex = t.get("examples") or {}
            for e in ex.get("shown") or []:
                self.assertIn(e["text"], self.text, (tid, e["text"]))
            for e in ex.get("held_out") or []:
                self.assertNotIn(e["text"], self.text, (tid, e["text"]))

    def test_shown_positive_examples_show_their_rendering(self):
        ex = CATALOG["transfer"]["examples"]["shown"][0]
        for atom in ex["emitted"]:
            self.assertIn(atom, self.text)

    def test_abstain_lines_name_only_existing_templates(self):
        for tid, t in CATALOG.items():
            for e in (t.get("examples") or {}).get("shown") or []:
                if e.get("category") != "abstain":
                    continue
                target = (e.get("expected") or {}).get("template")
                if target and target not in CATALOG:
                    self.assertNotIn(f"use `{target}`", self.text)
                if (e.get("expected") or {}).get("gap"):
                    self.assertIn(f'"code": "{e["expected"]["gap"]}"', self.text)

    def test_general_sections_present(self):
        for title in ("## Output", "## Identifiers and fillers", "## Lemmas and symbols",
                      "## Choosing a template", "## Unmapped spans", "## Templates"):
            self.assertIn(title, self.text)
        for code in (GENERAL.get("gap_codes") or {}):
            self.assertIn(f"- {code}:", self.text)


if __name__ == "__main__":
    unittest.main(verbosity=1)
