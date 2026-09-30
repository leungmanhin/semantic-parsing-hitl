"""Load the template registry (the single source for slot specs, parameters and prompt text)."""
from __future__ import annotations

import hashlib
import os

import yaml

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)                      # templates/
REPO = os.path.dirname(ROOT)                      # repository root
DEFAULT = os.path.join(ROOT, "registry", "starter26.yaml")


def load(path: str = DEFAULT) -> dict:
    with open(path, "rb") as fh:
        raw = fh.read()
    reg = yaml.safe_load(raw.decode("utf-8"))
    reg["_sha256"] = hashlib.sha256(raw).hexdigest()
    reg["_path"] = path
    return reg


def record_templates(reg: dict) -> dict:
    """Templates the parser writes records for (E04 / C03 are slot-level, not records)."""
    return {k: v for k, v in reg["templates"].items() if not v.get("no_record")}


def enum_values(reg: dict, spec: dict) -> list:
    if "values" in spec:
        return list(spec["values"])
    return list(reg["params"][spec["values_param"]])
