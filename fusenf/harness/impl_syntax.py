"""Rewrite (Implication (Premises ...) (Conclusions ...)) -> (Implication A C).

A singleton side becomes the bare expression; a multi-conjunct side becomes (And ...).
Operates on raw text so it can run over prompt.txt, goldens, .metta and .py files.
"""
import re, sys


def _split_top(s):
    """Split the inside of a form into top-level s-expressions."""
    out, depth, cur = [], 0, ''
    for ch in s:
        if ch == '(':
            depth += 1
        elif ch == ')':
            depth -= 1
        if depth == 0 and ch.isspace():
            if cur.strip():
                out.append(cur.strip())
            cur = ''
        else:
            cur += ch
    if cur.strip():
        out.append(cur.strip())
    return out


def _match(text, i):
    """Given text[i] == '(', return index just past the matching ')'."""
    depth = 0
    for j in range(i, len(text)):
        if text[j] == '(':
            depth += 1
        elif text[j] == ')':
            depth -= 1
            if depth == 0:
                return j + 1
    raise ValueError('unbalanced')


def _side(text, head):
    """If text is exactly (head ...), return its conjuncts, else None."""
    t = text.strip()
    m = re.match(r'\(\s*' + head + r'\b', t)
    if not m or _match(t, 0) != len(t):
        return None
    return _split_top(t[m.end():-1])


def convert(text):
    """Rewrite every (Implication (Premises..) (Conclusions..)) occurrence."""
    n = 0
    while True:
        m = re.search(r'\(\s*Implication\b', text)
        found = False
        for m in re.finditer(r'\(\s*Implication\b', text):
            start = m.start()
            try:
                end = _match(text, start)
            except ValueError:
                continue
            inner = text[m.end():end - 1]
            parts = _split_top(inner)
            if len(parts) != 2:
                continue
            prem = _side(parts[0], 'Premises')
            conc = _side(parts[1], 'Conclusions')
            if prem is None and conc is None:
                continue
            prem = prem if prem is not None else [parts[0]]
            conc = conc if conc is not None else [parts[1]]
            a = prem[0] if len(prem) == 1 else '(And ' + ' '.join(prem) + ')'
            c = conc[0] if len(conc) == 1 else '(And ' + ' '.join(conc) + ')'
            text = text[:start] + '(Implication ' + a + ' ' + c + ')' + text[end:]
            n += 1
            found = True
            break
        if not found:
            return text, n


if __name__ == '__main__':
    for p in sys.argv[1:]:
        src = open(p).read()
        out, n = convert(src)
        open(p, 'w').write(out)
        print(f"  {p}: {n} implication(s) rewritten")
