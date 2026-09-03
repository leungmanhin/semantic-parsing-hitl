"""Mechanical English plural for canonical labels (H embedding texts, 2026-09-03).

Labels are lowercase lemmas, compounds joined by ``_``; the plural inflects the LAST
token (``family_physician`` -> "family physicians"). Irregular table + the standard
suffix rules; deterministic, no dependency. ``uncertain(word)`` flags endings the rules
guess at (-o, -f/-fe, Latin/Greek) for human review.
"""

IRREGULAR = {
    "person": "people", "people": "people", "child": "children", "man": "men", "woman": "women",
    "foot": "feet", "tooth": "teeth", "goose": "geese", "mouse": "mice", "louse": "lice",
    "ox": "oxen", "die": "dice", "penny": "pence",
    "fish": "fish", "sheep": "sheep", "deer": "deer", "moose": "moose", "swine": "swine",
    "series": "series", "species": "species", "aircraft": "aircraft", "spacecraft": "spacecraft",
    "cattle": "cattle", "police": "police", "staff": "staff", "media": "media", "data": "data",
    "offspring": "offspring", "means": "means", "news": "news", "headquarters": "headquarters",
    "criterion": "criteria", "phenomenon": "phenomena", "analysis": "analyses", "crisis": "crises",
    "thesis": "theses", "basis": "bases", "hypothesis": "hypotheses", "diagnosis": "diagnoses",
    "oasis": "oases", "axis": "axes", "life": "lives", "wife": "wives", "knife": "knives",
    "leaf": "leaves", "wolf": "wolves", "half": "halves", "calf": "calves", "loaf": "loaves",
    "thief": "thieves", "shelf": "shelves", "self": "selves", "elf": "elves", "scarf": "scarves",
    "cactus": "cacti", "fungus": "fungi", "nucleus": "nuclei", "radius": "radii", "alumnus": "alumni",
    "stimulus": "stimuli", "syllabus": "syllabi", "bacterium": "bacteria", "medium": "media",
    "curriculum": "curricula", "datum": "data", "appendix": "appendices", "matrix": "matrices",
    "vertex": "vertices", "index": "indices", "potato": "potatoes", "tomato": "tomatoes",
    "hero": "heroes", "echo": "echoes", "veto": "vetoes", "torpedo": "torpedoes", "embargo": "embargoes",
    "volcano": "volcanoes", "mosquito": "mosquitoes", "tornado": "tornadoes", "cargo": "cargoes",
    "quiz": "quizzes", "bus": "buses", "gas": "gases",
}
VOWELS = "aeiou"


def plural(word):
    """plural of one lowercase lemma token"""
    if word in IRREGULAR:
        return IRREGULAR[word]
    for suffix, form in IRREGULAR.items():   # compound tails: "grandchild", "policeman"
        if word.endswith(suffix) and len(word) > len(suffix) and suffix in ("child", "man", "woman", "foot", "tooth", "mouse", "goose", "life", "wife", "knife", "leaf", "wolf", "half", "self"):
            return word[: -len(suffix)] + form
    if word.endswith(("s", "x", "z", "ch", "sh")):
        return word + "es"
    if word.endswith("y") and len(word) > 1 and word[-2] not in VOWELS:
        return word[:-1] + "ies"
    return word + "s"


def plural_label(label):
    """plural of a canonical label: inflect the last ``_``-token, spaces for ``_``"""
    toks = label.split("_")
    toks[-1] = plural(toks[-1])
    return " ".join(toks)


def uncertain(word):
    """endings the rules only guess at (review list)"""
    if word in IRREGULAR:
        return False
    return word.endswith(("o", "f", "fe", "us", "is", "um", "a", "ex", "ix", "ese", "ss"))
