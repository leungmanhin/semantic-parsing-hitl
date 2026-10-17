#!/usr/bin/env python3
"""Run the template suite runner from any directory: ``python suite.py check | collect | score …``.

Equivalent to ``python -m tmpl.suite …`` from ``templates/``; see templates/README.md.
"""
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "templates"))

from tmpl import suite  # noqa: E402

if __name__ == "__main__":
    sys.exit(suite.main())
