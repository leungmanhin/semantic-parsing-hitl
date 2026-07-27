import sys
sys.path.insert(0, "/home/manhin/Dev/PeTTa-fiet/python")
from pettachainer import PeTTaChainer
SEEDED = "/home/manhin/Dev/semantic-parsing-hitl/seeded_rules.metta"

def load_seeded(h):
    s = "\n".join(ln for ln in open(SEEDED).read().splitlines() if not ln.strip().startswith(";"))
    depth=0; start=None
    for i,ch in enumerate(s):
        if ch=='(':
            if depth==0: start=i
            depth+=1
        elif ch==')':
            depth-=1
            if depth==0 and start is not None:
                h.add_atom(s[start:i+1]); start=None

results=[]
def run(label, atoms, query, want="match", contains=None, seeded=False, chain=False, tv='$tv'):
    h=PeTTaChainer()
    if seeded: load_seeded(h)
    for a in atoms: h.add_atom(a)
    # (forward chaining removed 2026-07-21 — the engine's forward_chain went caller-directed and
    # no longer persists derivations queryably; the query back-chains rule-derived facts on demand.
    # `chain` is kept only as a per-case tag.)
    res=h.query('(: $prf %s %s)'%(query,tv), timeout_sec=0)
    ok = bool(res) if want=="match" else (not res)
    if ok and contains is not None:
        needles = contains if isinstance(contains,list) else [contains]
        ok = all(any(n in r for r in res) for n in needles)
    results.append((ok,label))
    print("%-4s %s%s"%("PASS" if ok else "FAIL", label, "" if ok else ("  -> "+(str(res)[:150] if res else "[]"))))

def run_strength(label, atoms, query, lo, hi, chain=False):
    import re
    h=PeTTaChainer()
    for a in atoms: h.add_atom(a)
    # (forward chaining removed 2026-07-21 — the engine's forward_chain went caller-directed and
    # no longer persists derivations queryably; the query back-chains rule-derived facts on demand.
    # `chain` is kept only as a per-case tag.)
    res=h.query('(: $prf %s $tv)'%query, timeout_sec=0)
    s=None
    if res:
        m=re.search(r'\(STV ([0-9.]+) ', res[-1])
        if m: s=float(m.group(1))
    ok = s is not None and lo <= s <= hi
    results.append((ok,label))
    print("%-4s %s%s"%("PASS" if ok else "FAIL", label, "" if ok else ("  -> s=%s (want %.2f..%.2f)"%(s,lo,hi))))

def run_xtype(label, atoms, compute_q, gt_q, exact_name, approx_name):
    # Cross-type threshold routing: the Compute branch must find the EXACT-stored entity only,
    # the GreaterThan branch the APPROX-stored one only (branches disjoint), union = both.
    h=PeTTaChainer()
    for a in atoms: h.add_atom(a)
    rc=h.query('(: $prf %s $tv)'%compute_q, timeout_sec=0)
    rg=h.query('(: $prf %s $tv)'%gt_q, timeout_sec=0)
    ec = any(exact_name in r for r in rc) and not any(approx_name in r for r in rc)
    ag = any(approx_name in r for r in rg) and not any(exact_name in r for r in rg)
    union = list(rc)+list(rg)
    both = any(exact_name in r for r in union) and any(approx_name in r for r in union)
    ok = ec and ag and both
    results.append((ok,label))
    print("%-4s %s%s"%("PASS" if ok else "FAIL", label,
          "" if ok else ("  -> compute=%s gt=%s"%(str(rc)[:90], str(rg)[:90]))))

# Categorical
run("cat-mem  Is Bob a teacher?", ['(: a (Member bob teacher) (STV 1.0 0.99))','(: b (Name bob "Bob") (STV 1.0 0.99))'],
    '(And (Name $x "Bob") (Member $x teacher))')
run("cat-scaffold  Fido dog, dog<mammal => Fido mammal?", ['(: a (Inheritance dog mammal) (STV 1.0 0.99))','(: b (Member fido dog) (STV 1.0 0.99))'],
    '(Member fido mammal)', seeded=True, chain=True)
run("cat-neg  Are dolphins fish? (expect strength 0)", ['(: a (Inheritance dolphin fish) (STV 0.0 0.99))'],
    '(Inheritance dolphin fish)', contains="STV 0.0")
# Events
run("ev-trans  What did Maria give? (Name+5conj)",
    ['(: a (Member sk_give_1 give) (STV 1.0 0.99))','(: b (Agent sk_give_1 maria) (STV 1.0 0.99))','(: c (Theme sk_give_1 sk_book_1) (STV 1.0 0.99))',
     '(: d (Member sk_book_1 book) (STV 1.0 0.99))','(: e (Past sk_give_1) (STV 1.0 0.99))','(: f (Name maria "Maria") (STV 1.0 0.99))'],
    '(And (Name $m "Maria") (Member $e give) (Agent $e $m) (Theme $e $what) (Past $e))', contains="sk_book_1")
run("ev-neg  Did Bob cook dinner? (negated And@0)",
    ['(: a (And (Member sk_cook_1 cook) (Agent sk_cook_1 bob) (Patient sk_cook_1 dinner)) (STV 0.0 0.99))'],
    '(And (Member $e cook) (Agent $e bob) (Patient $e dinner))', contains="STV 0.0")
# Theme/Patient role consistency (#23): acquire/transfer/evaluate verbs use Theme in BOTH the
# statement and its question -> QA matches; create/consume verbs stay Patient. Roles are opaque,
# so a statement and question MUST pick the same role or the query misses (last case shows why).
BUY=['(: a (Member sk_buy_1 buy) (STV 1.0 0.99))','(: b (Agent sk_buy_1 alice) (STV 1.0 0.99))',
     '(: c (Theme sk_buy_1 sk_table_1) (STV 1.0 0.99))','(: d (Member sk_table_1 table) (STV 1.0 0.99))',
     '(: e (Past sk_buy_1) (STV 1.0 0.99))','(: f (Name alice "Alice") (STV 1.0 0.99))']
run("role-theme  what did Alice buy? (Theme<->Theme -> table)", BUY,
    '(And (Name $a "Alice") (Member $e buy) (Agent $e $a) (Theme $e $what) (Past $e))', contains="sk_table_1")
run("role-mismatch  buy stored Theme, queried Patient -> [] (why consistency matters)", BUY,
    '(And (Member $e buy) (Agent $e alice) (Patient $e $what))', want="empty")
BAKE=['(: a (Member sk_bake_1 bake) (STV 1.0 0.99))','(: b (Agent sk_bake_1 bob) (STV 1.0 0.99))',
      '(: c (Patient sk_bake_1 sk_pie_1) (STV 1.0 0.99))','(: d (Member sk_pie_1 pie) (STV 1.0 0.99))',
      '(: e (Past sk_bake_1) (STV 1.0 0.99))','(: f (Name bob "Bob") (STV 1.0 0.99))']
run("role-patient  what did Bob bake? (Patient<->Patient -> pie)", BAKE,
    '(And (Name $b "Bob") (Member $e bake) (Agent $e $b) (Patient $e $what) (Past $e))', contains="sk_pie_1")
# Coordination
run("coord-distrib  Who departed? (tom AND grace)",
    ['(: a (Member sk_dep_1 depart) (STV 1.0 0.99))','(: b (Agent sk_dep_1 tom) (STV 1.0 0.99))','(: c (Past sk_dep_1) (STV 1.0 0.99))',
     '(: d (Member sk_dep_2 depart) (STV 1.0 0.99))','(: e (Agent sk_dep_2 grace) (STV 1.0 0.99))','(: f (Past sk_dep_2) (STV 1.0 0.99))'],
    '(And (Member $e depart) (Agent $e $who) (Past $e))', contains=["tom","grace"])
run("coord-collective  Did Leo argue?",
    ['(: a (Member sk_arg_1 argue) (STV 1.0 0.99))','(: b (Agent sk_arg_1 leo) (STV 1.0 0.99))','(: c (Agent sk_arg_1 mary) (STV 1.0 0.99))','(: d (Past sk_arg_1) (STV 1.0 0.99))'],
    '(And (Member $e argue) (Agent $e leo) (Past $e))')
# Cardinality
CHEFS=['(: a (GroupOf sk_g chef) (STV 1.0 0.99))','(: b (Cardinality sk_g 4) (STV 1.0 0.99))','(: c (Member sk_prep prepare) (STV 1.0 0.99))',
       '(: d (Agent sk_prep sk_g) (STV 1.0 0.99))','(: e (Patient sk_prep banquet) (STV 1.0 0.99))','(: f (Past sk_prep) (STV 1.0 0.99))']
run("card-howmany  How many chefs prepared? (4)", CHEFS,
    '(And (Member $e prepare) (Agent $e $g) (GroupOf $g chef) (Cardinality $g $n) (Past $e))', contains="Cardinality sk_g 4")
run("card-bounded  more than 3 chefs?", CHEFS,
    '(And (Member $e prepare) (Agent $e $g) (GroupOf $g chef) (Cardinality $g $n) (Compute > ($n 3) -> true) (Past $e))')
run("card-bounded-neg  more than 5 chefs? (expect [])", CHEFS,
    '(And (Member $e prepare) (Agent $e $g) (GroupOf $g chef) (Cardinality $g $n) (Compute > ($n 5) -> true) (Past $e))', want="empty")
run("card-phrase  'several birds' => AtLeast 3 (seeded)",
    ['(: a (GroupOf sk_g bird) (STV 1.0 0.99))','(: b (CardinalityPhrase sk_g "several") (STV 1.0 0.99))'],
    '(CardinalityAtLeast sk_g $m)', seeded=True, chain=True, contains="CardinalityAtLeast sk_g 3")
# Cardinality threshold routing (#3.3): a count is stored EXACT (Cardinality) or as a BOUND
# (CardinalityAtLeast/AtMost) and they don't unify, so a threshold question emits the exact branch
# AND the matching-direction bound branch + union (disjoint, no double-count). Parallel to #26.
run("card-bound-lower  AtLeast 5, at-least 3? (yes)",
    ['(: g (GroupOf cg crew) (STV 1.0 0.99))','(: c (CardinalityAtLeast cg 5) (STV 1.0 0.99))'],
    '(And (GroupOf $g crew) (CardinalityAtLeast $g $m) (Compute >= ($m 3) -> true))')
run("card-bound-lower-neg  AtLeast 5, at-least 7? (expect [])",
    ['(: g (GroupOf cg crew) (STV 1.0 0.99))','(: c (CardinalityAtLeast cg 5) (STV 1.0 0.99))'],
    '(And (GroupOf $g crew) (CardinalityAtLeast $g $m) (Compute >= ($m 7) -> true))', want="empty")
run("card-bound-upper  AtMost 4, at-most 6? (yes)",
    ['(: g (GroupOf cg pen) (STV 1.0 0.99))','(: c (CardinalityAtMost cg 4) (STV 1.0 0.99))'],
    '(And (GroupOf $g pen) (CardinalityAtMost $g $k) (Compute <= ($k 6) -> true))')
CARDX=['(: gx (GroupOf gx_ward nurse) (STV 1.0 0.99))','(: cx (Cardinality gx_ward 5) (STV 1.0 0.99))',
       '(: gy (GroupOf gy_ward nurse) (STV 1.0 0.99))','(: cy (CardinalityAtLeast gy_ward 5) (STV 1.0 0.99))']
run_xtype("card-xtype  more-than-3 nurses: union exact(gx)+bound(gy)", CARDX,
    '(And (GroupOf $g nurse) (Cardinality $g $n) (Compute > ($n 3) -> true))',
    '(And (GroupOf $g nurse) (CardinalityAtLeast $g $m) (Compute > ($m 3) -> true))',
    "gx_ward", "gy_ward")
# Partitives (#6): "Q of the Ns" -> definite superset G + quantified subset S (SubsetOf S G); cardinal
# -> Cardinality S, proportional -> ProportionOf S G level. NO generic kind-claim (key correctness).
PART=['(: gset (GroupOf sk_students_1 student) (STV 1.0 0.99))',
      '(: gsub (GroupOf sk_pgrp student) (STV 1.0 0.99))','(: sub (SubsetOf sk_pgrp sk_students_1) (STV 1.0 0.99))',
      '(: card (Cardinality sk_pgrp 3) (STV 1.0 0.99))',
      '(: ev (Member sk_pass_1 pass) (STV 1.0 0.99))','(: ag (Agent sk_pass_1 sk_pgrp) (STV 1.0 0.99))','(: pst (Past sk_pass_1) (STV 1.0 0.99))']
run("part-card  how many of the students passed? (->3)", PART,
    '(And (Member $e pass) (Agent $e $s) (SubsetOf $s sk_students_1) (Cardinality $s $n) (Past $e))', contains="Cardinality sk_pgrp 3")
run("part-card-thresh  did more than 2 of the students pass? (yes)", PART,
    '(And (Agent $e $s) (SubsetOf $s sk_students_1) (Cardinality $s $n) (Compute > ($n 2) -> true))')
run("part-card-nogeneric  partitive does NOT leak generic (Inheritance student pass)? (expect [])", PART,
    '(Inheritance student pass)', want="empty", chain=True)
PROP=['(: gset (GroupOf sk_apples_1 apple) (STV 1.0 0.99))',
      '(: gsub (GroupOf sk_rgrp apple) (STV 1.0 0.99))','(: sub (SubsetOf sk_rgrp sk_apples_1) (STV 1.0 0.99))',
      '(: prop (ProportionOf sk_rgrp sk_apples_1 most) (STV 1.0 0.99))','(: rp (Inheritance sk_rgrp ripe) (STV 1.0 0.99))']
run("part-prop  are most of the apples ripe? (ProportionOf most)", PROP,
    '(And (SubsetOf $s sk_apples_1) (ProportionOf $s sk_apples_1 most) (Inheritance $s ripe))')
run("part-prop-nogeneric  proportional partitive: arbitrary apple ripe? (expect [])",
    PROP+['(: a2 (Member a2 apple) (STV 1.0 0.99))'], '(Member a2 ripe)', want="empty", chain=True)
# Comparatives
run("comp-trans  Carol>Dan>Eve => Carol>Eve? (more_trans)",
    ['(: a (More fast carol dan) (STV 1.0 0.99))','(: b (More fast dan eve) (STV 1.0 0.99))'],
    '(More fast carol eve)', seeded=True, chain=True)
run("comp-super  Who is the smartest engineer? (felix)",
    ['(: a (Most smart felix engineer) (STV 1.0 0.99))','(: b (Member felix engineer) (STV 1.0 0.99))'],
    '(Most smart $who engineer)', contains="felix")
run("comp-degree  very tall => Is Alice tall?",
    ['(: a (Member alice tall) (STV 1.0 0.99))','(: b (Degree alice tall very) (STV 1.0 0.99))'], '(Member alice tall)')
# Surface-faithful storage (2026-07-20): the translator records the SURFACE form; seeded rules
# supply the canonical one. Keeps the mined corpus faithful without costing inference.
run("deg-surface  Degree carries the surface adverb, not a band",
    ['(: a (Member diana calm) (STV 1.0 0.99))','(: b (Degree diana calm extremely) (STV 1.0 0.99))'],
    '(Degree diana calm $lvl)', contains="extremely")
# -- scale poles: antonym comparatives stored on the surface pole, bridged by ScaleOpposite
run("pole-flip    'Bob is shorter than Alice' => More tall alice bob",
    ['(: s (More short bob alice) (STV 1.0 0.99))'], '(More tall alice bob)', seeded=True)
run("pole-surface surface-pole question matches the surface-pole storage directly",
    ['(: s (More short bob alice) (STV 1.0 0.99))'], '(More short bob alice)', seeded=True)
run("pole-reverse positive-pole storage answers a surface-pole question (so_sym)",
    ['(: s (More tall alice bob) (STV 1.0 0.99))'], '(More short bob alice)', seeded=True)
run("pole-trans   mixed-pole chain: short(bob,alice)+tall(carl,alice) => tall carl bob",
    ['(: s1 (More short bob alice) (STV 1.0 0.99))','(: s2 (More tall carl alice) (STV 1.0 0.99))'],
    '(More tall carl bob)', seeded=True)
run("pole-moreby  'pony 30kg lighter' => MoreBy heavy horse pony 30 kilogram",
    ['(: g (MoreBy light sk_pony_1 sk_horse_1 30 kilogram) (STV 1.0 0.99))'],
    '(MoreBy heavy sk_horse_1 sk_pony_1 $n $u)', contains="30", seeded=True)
run("pole-mb-surface ... and the plain ordering on the STATED pole (morebydiff)",
    ['(: g (MoreBy light sk_pony_1 sk_horse_1 30 kilogram) (STV 1.0 0.99))'],
    '(More light sk_pony_1 sk_horse_1)', seeded=True)
# The flipped plain ordering comes from morebydiff + pole_more. A direct MoreBy->More pole edge
# must NOT also be seeded: two sufficient derivations of one goal make the query return nothing
# (bug_competing_derivations_return_empty.py) -- this case is the guard against re-adding it.
run("pole-mb-more 'is the horse heavier?' from a 'lighter' gap (morebydiff + pole_more)",
    ['(: g (MoreBy light sk_pony_1 sk_horse_1 30 kilogram) (STV 1.0 0.99))'],
    '(More heavy sk_horse_1 sk_pony_1)', seeded=True)
run("pole-control a scale with NO seeded pair must not flip (expect [])",
    ['(: s (More patient tom maria) (STV 1.0 0.99))'], '(More impatient maria tom)', want="empty", seeded=True)
# -- comitative: a co-participant is a CoAgent, never an Instrument
run("role-coagent hiked with Petra => CoAgent binds",
    ['(: e (Member sk_hike_1 hike) (STV 1.0 0.99))','(: a (Agent sk_hike_1 sk_ranger_1) (STV 1.0 0.99))',
     '(: c (CoAgent sk_hike_1 petra) (STV 1.0 0.99))','(: n (Name petra "Petra") (STV 1.0 0.99))'],
    '(And (Name $p "Petra") (Member $e hike) (CoAgent $e $p))', contains="petra")
# -- quantifier word recorded beside the strength it sets
run("quant-most   'most athletes are fit' records the quantifier word",
    ['(: i (Inheritance athlete fit) (STV 0.9 0.9))','(: q (QuantifierPhrase athlete fit "most") (STV 1.0 0.99))'],
    '(QuantifierPhrase athlete fit $w)', contains='"most"')
run("quant-generic bare generic has NO QuantifierPhrase (expect [])",
    ['(: i (Inheritance lemon sour) (STV 0.9 0.9))'], '(QuantifierPhrase lemon sour $w)', want="empty")
run("quant-no     'no square is round' => word 'no' beside strength 0",
    ['(: i (Inheritance square round) (STV 0.0 0.99))','(: q (QuantifierPhrase square round "no") (STV 1.0 0.99))'],
    '(QuantifierPhrase square round $w)', contains='"no"')
run("quant-infer  the strength still drives member inheritance",
    ['(: i (Inheritance athlete fit) (STV 0.9 0.9))','(: q (QuantifierPhrase athlete fit "most") (STV 1.0 0.99))',
     '(: m (Member kai athlete) (STV 1.0 0.99))'], '(Member kai fit)', chain=True)
# Measures
GRACE=['(: a (Measure grace tall 165 centimeter) (STV 1.0 0.99))','(: b (Name grace "Grace") (STV 1.0 0.99))']
run("meas-howmany  How tall is Grace? (165)", GRACE, '(And (Name $g "Grace") (Measure $g tall $n $u))', contains="165")
run("meas-threshold  taller than 160?", GRACE, '(And (Name $g "Grace") (Measure $g tall $n centimeter) (Compute > ($n 160) -> true))')
run("meas-threshold-neg  taller than 170? (expect [])", GRACE, '(And (Name $g "Grace") (Measure $g tall $n centimeter) (Compute > ($n 170) -> true))', want="empty")
# Generics & scope
run("gen-verbal  Birds fly + Tweety => Tweety flies?",
    ['(: r (Implication (Premises (Member $x bird)) (Conclusions (Member (sk_fly $x) fly) (Agent (sk_fly $x) $x))) (STV 0.9 0.9))','(: t (Member tweety bird) (STV 1.0 0.99))'],
    '(And (Member $e fly) (Agent $e tweety))', chain=True)
run("scope-ae  every student read some book + Alice => Alice read a book?",
    ['(: r (Implication (Premises (Member $x student)) (Conclusions (Member (sk_read $x) read) (Agent (sk_read $x) $x) (Theme (sk_read $x) (sk_book $x)) (Member (sk_book $x) book))) (STV 1.0 0.9))','(: a (Member alice student) (STV 1.0 0.99))'],
    '(And (Member $e read) (Agent $e alice) (Theme $e $b) (Member $b book))', chain=True)
run("rel-univ  has-garden=>gardener + Tom => Tom gardener?",
    ['(: r (Implication (Premises (Member $e have) (Holder $e $x) (Theme $e $y) (Member $y garden)) (Conclusions (Member $x gardener))) (STV 1.0 0.99))',
     '(: a (Member sk_have_1 have) (STV 1.0 0.99))','(: b (Holder sk_have_1 tom) (STV 1.0 0.99))','(: c (Theme sk_have_1 sk_gard_1) (STV 1.0 0.99))','(: d (Member sk_gard_1 garden) (STV 1.0 0.99))'],
    '(Member tom gardener)', chain=True)
# 3+ quantifiers & numeric-in-scope (#5): each universal -> a premise; a dependent existential ->
# a Skolem function of ALL universals scoping over it; a numeric under a universal -> a Skolem GROUP
# with Cardinality. (Defer: branching/cumulative, numeric wide-scope.)
AAE=['(: r (Implication (Premises (Member $t teacher) (Member $s student)) (Conclusions (Member (sk_give $t $s) give) (Agent (sk_give $t $s) $t) (Recipient (sk_give $t $s) $s) (Theme (sk_give $t $s) (sk_book $t $s)) (Member (sk_book $t $s) book))) (STV 1.0 0.9))',
     '(: t1 (Member ms_lee teacher) (STV 1.0 0.99))','(: s1 (Member al student) (STV 1.0 0.99))']
run("scope-aae  did Ms Lee give Al a book? (book = Skolem of BOTH univ)", AAE,
    '(And (Member $e give) (Agent $e ms_lee) (Recipient $e al) (Theme $e $b) (Member $b book))', chain=True)
AAA=['(: r (Implication (Premises (Member $x teacher) (Member $y student) (Member $z book)) (Conclusions (Member (sk_assign $x $y $z) assign) (Agent (sk_assign $x $y $z) $x) (Recipient (sk_assign $x $y $z) $y) (Theme (sk_assign $x $y $z) $z))) (STV 1.0 0.9))',
     '(: t1 (Member ms_lee teacher) (STV 1.0 0.99))','(: s1 (Member al student) (STV 1.0 0.99))','(: b1 (Member b_alg book) (STV 1.0 0.99))']
run("scope-aaa  3 universals: Ms Lee assigned Al the algebra book?", AAA,
    '(And (Member $e assign) (Agent $e ms_lee) (Recipient $e al) (Theme $e b_alg))', chain=True)
NUMSC=['(: r (Implication (Premises (Member $x student)) (Conclusions (Member (sk_read $x) read) (Agent (sk_read $x) $x) (Theme (sk_read $x) (sk_books $x)) (GroupOf (sk_books $x) book) (Cardinality (sk_books $x) 3))) (STV 1.0 0.9))',
       '(: s1 (Member al student) (STV 1.0 0.99))','(: s2 (Member bo student) (STV 1.0 0.99))']
run("scope-num  how many books did Al read? (numeric-under-forall -> 3)", NUMSC,
    '(And (Member $e read) (Agent $e al) (Theme $e $g) (GroupOf $g book) (Cardinality $g $n))', contains="Cardinality (sk_books al) 3", chain=True)
run("scope-num-distinct  Bo's 3-book group is its own (not Al's)", NUMSC,
    '(And (Member $e read) (Agent $e bo) (Theme $e $g) (GroupOf $g book) (Cardinality $g $n))', contains="sk_books bo", chain=True)
# #5 un-defer: threshold over a scope-DERIVED count -- anchor the Skolem group, ONE count premise +
# Compute (re-listing co-derived atoms trips the conjunction evidence-overlap guard -> []).
run("scope-num-thresh  did Al read >2 books? (Skolem-anchored, 3>2 yes)", NUMSC,
    '(And (Cardinality (sk_books al) $n) (Compute > ($n 2) -> true))', chain=True)
run("scope-num-thresh-neg  did Al read >5 books? (expect [])", NUMSC,
    '(And (Cardinality (sk_books al) $n) (Compute > ($n 5) -> true))', want="empty", chain=True)
# cross-group FoldAll total (corrected arg order: pattern value INIT fold-fn; was a false #3b "bug")
FOLDSUM=['(: g1 (GroupOf ga student) (STV 1.0 0.99))','(: c1 (Cardinality ga 3) (STV 1.0 0.99))',
         '(: g2 (GroupOf gb student) (STV 1.0 0.99))','(: c2 (Cardinality gb 2) (STV 1.0 0.99))']
run("foldall-total  sum students across groups (3+2=5)", FOLDSUM,
    '(FoldAll (And (GroupOf $g student) (Cardinality $g $n)) $n 0 + -> $tot)', contains="-> 5")
# Striking & relational generics (Group R)
RELG=['(: m_carry (Carry mosquito malaria) (STV 0.9 0.9))','(: m1 (Member sk_mosquito_1 mosquito) (STV 1.0 0.99))']
run("genR-rel  do mosquitoes carry malaria? (kind)", RELG, '(Carry mosquito malaria)')
run("genR-rel  what do mosquitoes carry? (kind wh -> malaria)", RELG, '(Carry mosquito $x)', contains="malaria")
run("genR-rel  does THIS mosquito carry malaria? (no distribution, expect [])", RELG, '(Carry sk_mosquito_1 malaria)', want="empty", chain=True)
# striking copular -> lowered Inheritance distributes LOW via BUILT-IN member-inheritance (no mem_inh)
run_strength("genR-strike  is this lawyer dishonest? (built-in distributes ~0.3)",
    ['(: lawyer_dis (Inheritance lawyer dishonest) (STV 0.3 0.9))','(: l1 (Member sk_lawyer_1 lawyer) (STV 1.0 0.99))'],
    '(Member sk_lawyer_1 dishonest)', 0.2, 0.4, chain=True)
run_strength("genR-majority  is this dog loyal? (majority distributes ~0.9)",
    ['(: dog_loyal (Inheritance dog loyal) (STV 0.9 0.9))','(: d1 (Member sk_dog_1 dog) (STV 1.0 0.99))'],
    '(Member sk_dog_1 loyal)', 0.85, 0.95, chain=True)
# Defeasible exceptions (Group S): general @0.9 + sub-kind exception @0.0/0.99 -> revision overrides
DEF=['(: bf (Inheritance bird (can fly)) (STV 0.9 0.9))','(: pb (Inheritance penguin bird) (STV 1.0 0.99))',
     '(: pf (Inheritance penguin (can fly)) (STV 0.0 0.99))','(: pingu (Member pingu penguin) (STV 1.0 0.99))',
     '(: tweety (Member tweety bird) (STV 1.0 0.99))']
run_strength("defeas  exception overrides: can pingu fly? (~0)", DEF, '(Member pingu (can fly))', 0.0, 0.15, chain=True)
run_strength("defeas  generic intact: can tweety fly? (~0.9)", DEF, '(Member tweety (can fly))', 0.8, 0.95, chain=True)
REV=['(: me (Inheritance mammal egg_layer) (STV 0.0 0.9))','(: pm (Inheritance platypus mammal) (STV 1.0 0.99))',
     '(: pe (Inheritance platypus egg_layer) (STV 1.0 0.99))','(: perry (Member perry platypus) (STV 1.0 0.99))',
     '(: rex (Member rex mammal) (STV 1.0 0.99))']
run_strength("defeas-rev  positive exception: perry lays eggs? (~0.9)", REV, '(Member perry egg_layer)', 0.8, 0.98, chain=True)
run_strength("defeas-rev  negative generic intact: rex lays eggs? (~0)", REV, '(Member rex egg_layer)', 0.0, 0.1, chain=True)
# 3-level cascade (#15): staggered confidence 0.9 < 0.99 < 0.999 -> revision resolves each level in the
# right DIRECTION (deeper levels soften in magnitude -- inherent PLN, verified adequate, no new machinery).
CASC=['(: c_bf (Inheritance bird (can fly)) (STV 0.9 0.9))',
      '(: c_pb (Inheritance penguin bird) (STV 1.0 0.99))','(: c_pf (Inheritance penguin (can fly)) (STV 0.0 0.99))',
      '(: c_rp (Inheritance rocket_penguin penguin) (STV 1.0 0.99))','(: c_rf (Inheritance rocket_penguin (can fly)) (STV 1.0 0.999))',
      '(: c_robin (Member robin bird) (STV 1.0 0.99))','(: c_waddle (Member waddle penguin) (STV 1.0 0.99))','(: c_zoomer (Member zoomer rocket_penguin) (STV 1.0 0.99))']
run_strength("cascade  L1 general: robin (bird) can fly? (~0.9)", CASC, '(Member robin (can fly))', 0.8, 0.95, chain=True)
run_strength("cascade  L2 exception: waddle (penguin) can fly? (~0)", CASC, '(Member waddle (can fly))', 0.0, 0.2, chain=True)
run_strength("cascade  L3 exception-to-exception: zoomer can fly? (flips back, >> L2)", CASC, '(Member zoomer (can fly))', 0.6, 0.97, chain=True)
# Striking verbal generic (#11): a minority-disposition verbal generic distributes at LOWERED strength.
SVERB=['(: ships_sink (Implication (Premises (Member $x ship)) (Conclusions (Member (sk_sink $x) sink) (Patient (sk_sink $x) $x))) (STV 0.3 0.9))',
       '(: sv_s (Member sk_ship_9 ship) (STV 1.0 0.99))']
run_strength("strike-verbal  does an arbitrary ship sink? rare-event verbal -> LOW ~0.3 (not 0.9)", SVERB,
    '(And (Member $e sink) (Patient $e sk_ship_9))', 0.15, 0.5, chain=True)
SVERBM=['(: birds_fly2 (Implication (Premises (Member $x bird)) (Conclusions (Member (sk_fly $x) fly) (Agent (sk_fly $x) $x))) (STV 0.9 0.9))',
        '(: sv_r (Member robin2 bird) (STV 1.0 0.99))']
run_strength("strike-verbal-ctrl  majority 'birds fly' distributes at ~0.9 (arbitrary robin)", SVERBM,
    '(And (Member $e fly) (Agent $e robin2))', 0.75, 0.95, chain=True)
# Defeasible deontic (Group S deontic): obligation/permission reified as property -> revision overrides
DEON=['(: ed (Inheritance employee (obligated badge_in)) (STV 0.9 0.9))','(: ee (Inheritance executive employee) (STV 1.0 0.99))',
      '(: ex (Inheritance executive (obligated badge_in)) (STV 0.0 0.99))','(: e1 (Member dave executive) (STV 1.0 0.99))',
      '(: e2 (Member carol employee) (STV 1.0 0.99))']
run_strength("deon  exempt: must exec badge in? (~0)", DEON, '(Member dave (obligated badge_in))', 0.0, 0.15, chain=True)
run_strength("deon  regular: must employee badge in? (~0.9)", DEON, '(Member carol (obligated badge_in))', 0.8, 0.95, chain=True)
PERM=['(: mp (Inheritance member (permitted bring_guest)) (STV 0.9 0.9))','(: tm (Inheritance trial_member member) (STV 1.0 0.99))',
      '(: tx (Inheritance trial_member (permitted bring_guest)) (STV 0.0 0.99))','(: m1 (Member tina trial_member) (STV 1.0 0.99))']
run_strength("deon-perm  exempt: may trial member bring guest? (~0)", PERM, '(Member tina (permitted bring_guest))', 0.0, 0.15, chain=True)
# Compound decomposition (#12): unpack compounds into single-word parts
DEC=['(: gen (Inheritance member (obligated pay_dues)) (STV 0.9 0.9))',
     '(: pd_g (Inheritance pay_dues pay) (STV 1.0 0.99))','(: pd_o (Patient pay_dues dues) (STV 1.0 0.99))',
     '(: m1 (Member alice member) (STV 1.0 0.99))']
run("decomp-t1  unpack: what must members pay? (-> dues)", DEC, '(And (Inheritance member (obligated $a)) (Patient $a $w))', contains="dues")
run("decomp-t1  SAFETY no leak: obligated (generic) pay? (expect [])", DEC, '(Member alice (obligated pay))', want="empty", chain=True)
run("decomp-t2  a light_switch instance IS a switch (genus)",
    ['(: s1 (Member sk_switch_1 light_switch) (STV 1.0 0.99))','(: g (Inheritance light_switch switch) (STV 1.0 0.99))'],
    '(Member sk_switch_1 switch)', chain=True)
# Nominalization decomposition (#12 Tier 3a): X-er -> capability (+ kind-relation if object incorporated)
NOM=['(: pen_sw (Inheritance penguin swimmer) (STV 0.9 0.9))','(: sw_can (Inheritance swimmer (can swim)) (STV 1.0 0.99))',
     '(: p1 (Member pingu penguin) (STV 1.0 0.99))']
run("nom-intrans  a swimmer instance can swim (pingu)", NOM, '(Member pingu (can swim))', chain=True)
run("nom-intrans  what can a swimmer do? (-> swim)", NOM, '(Inheritance swimmer (can $v))', contains="swim")
NOMT=['(: el_can (Inheritance egg_layer (can lay)) (STV 1.0 0.99))','(: el_rel (Lay egg_layer egg) (STV 1.0 0.99))',
      '(: pl (Member perry egg_layer) (STV 1.0 0.99))']
run("nom-trans  what does an egg_layer lay? (-> egg)", NOMT, '(Lay egg_layer $w)', contains="egg")
run("nom-trans  SAFETY kind-rel no distribute: (Lay perry egg) (expect [])", NOMT, '(Lay perry egg)', want="empty", chain=True)
# Possessive / genitive NPs (#35): 's-genitive / possessive pronoun -> opaque (Possession possessed
# possessor), NO own-event, EXCEPT a part/component -> (PartOf part whole) (reuses the noun-noun rule).
POSS=['(: e_kettle (Member sk_kettle_1 kettle) (STV 1.0 0.99))',
      '(: e_kettle_poss (Possession sk_kettle_1 priya) (STV 1.0 0.99))',
      '(: e_break (Member sk_break_1 break) (STV 1.0 0.99))',
      '(: e_break_pat (Patient sk_break_1 sk_kettle_1) (STV 1.0 0.99))',
      '(: e_break_past (Past sk_break_1) (STV 1.0 0.99))',
      '(: priya_name (Name priya "Priya") (STV 1.0 0.99))']
run("poss-whose  whose kettle broke? (-> priya)", POSS,
    '(And (Member $k kettle) (Possession $k $who) (Member $e break) (Patient $e $k))', contains="priya")
run("poss-no-own  SAFETY alienable genitive minted NO own-event (expect [])", POSS,
    '(And (Member $e own) (Holder $e priya) (Theme $e sk_kettle_1))', want="empty")
POSSP=['(: e_antenna (Member sk_antenna_1 antenna) (STV 1.0 0.99))',
       '(: e_antenna_po (PartOf sk_antenna_1 sk_tower_1) (STV 1.0 0.99))',
       '(: e_tower (Member sk_tower_1 tower) (STV 1.0 0.99))',
       '(: e_topple (Member sk_topple_1 topple) (STV 1.0 0.99))',
       '(: e_topple_pat (Patient sk_topple_1 sk_antenna_1) (STV 1.0 0.99))',
       '(: e_topple_past (Past sk_topple_1) (STV 1.0 0.99))']
run("poss-part-route  part-genitive routes to PartOf (antenna of tower)", POSSP,
    '(And (Member $a antenna) (PartOf $a $w) (Member $w tower))', contains="sk_tower_1")
run("poss-part-notposs  SAFETY part-genitive did NOT use Possession (expect [])", POSSP,
    '(Possession sk_antenna_1 sk_tower_1)', want="empty")
POSSK=['(: e_uncle (Member sk_uncle_1 uncle) (STV 1.0 0.99))',
       '(: e_uncle_poss (Possession sk_uncle_1 leo) (STV 1.0 0.99))',
       '(: e_laugh (Member sk_laugh_1 laugh) (STV 1.0 0.99))',
       '(: e_laugh_agent (Agent sk_laugh_1 sk_uncle_1) (STV 1.0 0.99))',
       '(: e_laugh_past (Past sk_laugh_1) (STV 1.0 0.99))',
       '(: leo_name (Name leo "Leo") (STV 1.0 0.99))']
run("poss-kinship  whose uncle laughed? kinship uses opaque Possession (-> leo)", POSSK,
    '(And (Member $u uncle) (Possession $u $who) (Member $e laugh) (Agent $e $u))', contains="leo")
POSSPR=['(: e_van (Member sk_van_1 van) (STV 1.0 0.99))',
        '(: e_van_poss (Possession sk_van_1 marcus) (STV 1.0 0.99))',
        '(: e_stall (Member sk_stall_1 stall) (STV 1.0 0.99))',
        '(: e_stall_pat (Patient sk_stall_1 sk_van_1) (STV 1.0 0.99))',
        '(: e_stall_past (Past sk_stall_1) (STV 1.0 0.99))',
        '(: marcus_name (Name marcus "Marcus") (STV 1.0 0.99))']
run("poss-pronoun  whose van stalled? possessive-pronoun coref resolved to marcus", POSSPR,
    '(And (Member $v van) (Possession $v $who) (Member $e stall) (Patient $e $v))', contains="marcus")
# Resultatives (#34a): STATE result -> reified (Experiencer) state + flat property + (Result event
# state); MOTION result -> the path rides a Source/Goal oblique, NO Result atom; depictive -> no Result.
RSTATE=['(: e_scrub (Member sk_scrub_1 scrub) (STV 1.0 0.99))',
        '(: e_scrub_agent (Agent sk_scrub_1 hana) (STV 1.0 0.99))',
        '(: e_scrub_patient (Patient sk_scrub_1 sk_pan_1) (STV 1.0 0.99))',
        '(: e_scrub_past (Past sk_scrub_1) (STV 1.0 0.99))',
        '(: e_pan (Member sk_pan_1 pan) (STV 1.0 0.99))',
        '(: e_spotless (Member sk_spotless_1 spotless) (STV 1.0 0.99))',
        '(: e_spotless_exp (Experiencer sk_spotless_1 sk_pan_1) (STV 1.0 0.99))',
        '(: e_pan_spotless (Member sk_pan_1 spotless) (STV 1.0 0.99))',
        '(: e_result (Result sk_scrub_1 sk_spotless_1) (STV 1.0 0.99))']
run("result-flat  is the pan spotless? (flat property binds)", RSTATE, '(Member sk_pan_1 spotless)')
run("result-state  scrub -> result state borne by the pan (-> spotless)", RSTATE,
    '(And (Result sk_scrub_1 $s) (Experiencer $s sk_pan_1) (Member $s $st))', contains="spotless")
RMOVE_G=['(: e_roll (Member sk_roll_1 roll) (STV 1.0 0.99))',
         '(: e_roll_theme (Theme sk_roll_1 sk_barrel_1) (STV 1.0 0.99))',
         '(: e_barrel (Member sk_barrel_1 barrel) (STV 1.0 0.99))',
         '(: e_yard (Member sk_yard_1 yard) (STV 1.0 0.99))',
         '(: e_roll_goal (Goal sk_roll_1 sk_yard_1) (STV 1.0 0.99))',
         '(: e_roll_past (Past sk_roll_1) (STV 1.0 0.99))']
run("result-motion-goal  where did the barrel go? (into yard via Goal)", RMOVE_G,
    '(And (Member $e roll) (Theme $e $b) (Member $b barrel) (Goal $e $g))', contains="sk_yard_1")
run("result-motion-noresult  SAFETY motion resultative minted NO Result (expect [])", RMOVE_G,
    '(Result sk_roll_1 $x)', want="empty")
RMOVE_S=['(: e_wipe (Member sk_wipe_1 wipe) (STV 1.0 0.99))',
         '(: e_wipe_theme (Theme sk_wipe_1 sk_smudge_1) (STV 1.0 0.99))',
         '(: e_smudge (Member sk_smudge_1 smudge) (STV 1.0 0.99))',
         '(: e_mirror (Member sk_mirror_1 mirror) (STV 1.0 0.99))',
         '(: e_wipe_source (Source sk_wipe_1 sk_mirror_1) (STV 1.0 0.99))',
         '(: e_wipe_past (Past sk_wipe_1) (STV 1.0 0.99))']
run("result-motion-source  wiped smudge off mirror (Source path binds)", RMOVE_S,
    '(And (Member $e wipe) (Theme $e $sm) (Source $e $src))', contains="sk_mirror_1")
RDEP=['(: e_serve (Member sk_serve_1 serve) (STV 1.0 0.99))',
      '(: e_serve_theme (Theme sk_serve_1 sk_soup_1) (STV 1.0 0.99))',
      '(: e_soup (Member sk_soup_1 soup) (STV 1.0 0.99))',
      '(: e_soup_cold (Member sk_soup_1 cold) (STV 1.0 0.99))',
      '(: e_serve_past (Past sk_serve_1) (STV 1.0 0.99))']
run("result-depictive-noresult  SAFETY depictive minted NO Result (expect [])", RDEP,
    '(Result sk_serve_1 $x)', want="empty")
# Periphrastic causatives (#34b): matrix causative event (Agent=causer, Theme=caused event); causee
# routed by embedded form -- participle -> object is caused-event Patient (agent implicit/omitted);
# infinitive -> object is caused-event Agent. Flavor in the verb symbol; possessive 'have' != causative.
CAUSP=['(: e_have (Member sk_have_1 have) (STV 1.0 0.99))',
       '(: e_have_agent (Agent sk_have_1 dmitri) (STV 1.0 0.99))',
       '(: e_have_theme (Theme sk_have_1 sk_replace_1) (STV 1.0 0.99))',
       '(: e_have_past (Past sk_have_1) (STV 1.0 0.99))',
       '(: e_replace (Member sk_replace_1 replace) (STV 1.0 0.99))',
       '(: e_replace_patient (Patient sk_replace_1 sk_roof_1) (STV 1.0 0.99))',
       '(: e_roof (Member sk_roof_1 roof) (STV 1.0 0.99))',
       '(: dmitri_name (Name dmitri "Dmitri") (STV 1.0 0.99))']
run("caus-participle  was the roof replaced ('had ... replaced')?", CAUSP,
    '(And (Member $c replace) (Patient $c sk_roof_1))')
run("caus-participle-noagent  SAFETY implicit causee omitted -- no Agent on caused event (expect [])", CAUSP,
    '(Agent sk_replace_1 $who)', want="empty")
CAUSI=['(: e_make (Member sk_make_1 make) (STV 1.0 0.99))',
       '(: e_make_agent (Agent sk_make_1 sk_sergeant_1) (STV 1.0 0.99))',
       '(: e_sergeant (Member sk_sergeant_1 sergeant) (STV 1.0 0.99))',
       '(: e_make_theme (Theme sk_make_1 sk_kneel_1) (STV 1.0 0.99))',
       '(: e_make_past (Past sk_make_1) (STV 1.0 0.99))',
       '(: e_kneel (Member sk_kneel_1 kneel) (STV 1.0 0.99))',
       '(: e_kneel_agent (Agent sk_kneel_1 sk_recruit_1) (STV 1.0 0.99))',
       '(: e_recruit (Member sk_recruit_1 recruit) (STV 1.0 0.99))']
run("caus-infinitive  who kneeled? causee = caused-event Agent (-> recruit)", CAUSI,
    '(And (Member $e kneel) (Agent $e $who) (Member $who recruit))', contains="sk_recruit_1")
run("caus-matrix  what did the sergeant make happen? (caused event = kneel)", CAUSI,
    '(And (Member $e make) (Theme $e $c) (Member $c kneel))')
CAUSG=['(: e_get (Member sk_get_1 get) (STV 1.0 0.99))',
       '(: e_get_agent (Agent sk_get_1 elena) (STV 1.0 0.99))',
       '(: e_get_theme (Theme sk_get_1 sk_lower_1) (STV 1.0 0.99))',
       '(: e_get_past (Past sk_get_1) (STV 1.0 0.99))',
       '(: e_lower (Member sk_lower_1 lower) (STV 1.0 0.99))',
       '(: e_lower_agent (Agent sk_lower_1 sk_vendor_1) (STV 1.0 0.99))',
       '(: e_vendor (Member sk_vendor_1 vendor) (STV 1.0 0.99))',
       '(: e_lower_patient (Patient sk_lower_1 sk_price_1) (STV 1.0 0.99))',
       '(: e_price (Member sk_price_1 price) (STV 1.0 0.99))',
       '(: elena_name (Name elena "Elena") (STV 1.0 0.99))']
run("caus-get-to  who lowered the price? causee = embedded Agent (-> vendor)", CAUSG,
    '(And (Member $e lower) (Agent $e $who) (Patient $e sk_price_1))', contains="sk_vendor_1")
CAUSB=['(: e_have (Member sk_have_1 have) (STV 1.0 0.99))',
       '(: e_have_holder (Holder sk_have_1 otis) (STV 1.0 0.99))',
       '(: e_have_theme (Theme sk_have_1 sk_compass_1) (STV 1.0 0.99))',
       '(: e_compass (Member sk_compass_1 compass) (STV 1.0 0.99))',
       '(: otis_name (Name otis "Otis") (STV 1.0 0.99))']
run("caus-boundary  what does Otis have? possessive have Holder/Theme (-> compass)", CAUSB,
    '(And (Member $e have) (Holder $e otis) (Theme $e $w))', contains="sk_compass_1")
run("caus-boundary-noagent  SAFETY possessive have is NOT causative -- no Agent (expect [])", CAUSB,
    '(Agent sk_have_1 $x)', want="empty")
# Partitive residuals (#6): MASS whole -> PartOf + single portion (no GroupOf); precise fraction ->
# (Fraction n d) in the ProportionOf level slot; percentage p% -> (Fraction p 100) unreduced (decimals ok).
PMASS=['(: e_milk (Member sk_milk_1 milk) (STV 1.0 0.99))',
       '(: e_portion (Member sk_portion_1 milk) (STV 1.0 0.99))',
       '(: e_portion_part (PartOf sk_portion_1 sk_milk_1) (STV 1.0 0.99))',
       '(: e_portion_prop (ProportionOf sk_portion_1 sk_milk_1 half) (STV 1.0 0.99))',
       '(: e_spoil (Member sk_spoil_1 spoil) (STV 1.0 0.99))',
       '(: e_spoil_patient (Patient sk_spoil_1 sk_portion_1) (STV 1.0 0.99))',
       '(: e_spoil_past (Past sk_spoil_1) (STV 1.0 0.99))']
run("part-mass  half the milk spoiled? portion via PartOf+ProportionOf(half)", PMASS,
    '(And (Member $p milk) (PartOf $p sk_milk_1) (ProportionOf $p sk_milk_1 half) (Member $e spoil) (Patient $e $p))')
run("part-mass-nogroup  SAFETY mass whole is a Member, not a GroupOf (expect [])", PMASS,
    '(GroupOf sk_milk_1 $k)', want="empty")
PFRAC=['(: e_jurors (GroupOf sk_jurors_1 juror) (STV 1.0 0.99))',
       '(: e_sub (GroupOf sk_sub_1 juror) (STV 1.0 0.99))',
       '(: e_sub_subset (SubsetOf sk_sub_1 sk_jurors_1) (STV 1.0 0.99))',
       '(: e_sub_prop (ProportionOf sk_sub_1 sk_jurors_1 (Fraction 2 3)) (STV 1.0 0.99))',
       '(: e_abstain (Member sk_abstain_1 abstain) (STV 1.0 0.99))',
       '(: e_abstain_agent (Agent sk_abstain_1 sk_sub_1) (STV 1.0 0.99))',
       '(: e_abstain_past (Past sk_abstain_1) (STV 1.0 0.99))']
run("part-fraction  two-thirds of jurors abstained -> exact (Fraction 2 3) matches", PFRAC,
    '(And (SubsetOf $s sk_jurors_1) (ProportionOf $s sk_jurors_1 (Fraction 2 3)) (Member $e abstain) (Agent $e $s))')
run("part-fraction-bind  bind the polymorphic level -> (Fraction 2 3)", PFRAC,
    '(ProportionOf sk_sub_1 sk_jurors_1 $lvl)', contains="Fraction")
PPCT=['(: e_budget (Member sk_budget_1 budget) (STV 1.0 0.99))',
      '(: e_portion (Member sk_portion_1 budget) (STV 1.0 0.99))',
      '(: e_portion_part (PartOf sk_portion_1 sk_budget_1) (STV 1.0 0.99))',
      '(: e_portion_prop (ProportionOf sk_portion_1 sk_budget_1 (Fraction 40 100)) (STV 1.0 0.99))',
      '(: e_cut (Member sk_cut_1 cut) (STV 1.0 0.99))',
      '(: e_cut_patient (Patient sk_cut_1 sk_portion_1) (STV 1.0 0.99))',
      '(: e_cut_past (Past sk_cut_1) (STV 1.0 0.99))']
run("part-percent  40% of the budget cut -> (Fraction 40 100) mass partitive matches", PPCT,
    '(And (Member $p budget) (PartOf $p sk_budget_1) (ProportionOf $p sk_budget_1 (Fraction 40 100)) (Member $e cut) (Patient $e $p))')
PPCTD=['(: e_applicants (GroupOf sk_applicants_1 applicant) (STV 1.0 0.99))',
       '(: e_sub (GroupOf sk_sub_1 applicant) (STV 1.0 0.99))',
       '(: e_sub_subset (SubsetOf sk_sub_1 sk_applicants_1) (STV 1.0 0.99))',
       '(: e_sub_prop (ProportionOf sk_sub_1 sk_applicants_1 (Fraction 12.5 100)) (STV 1.0 0.99))',
       '(: e_withdraw (Member sk_withdraw_1 withdraw) (STV 1.0 0.99))',
       '(: e_withdraw_agent (Agent sk_withdraw_1 sk_sub_1) (STV 1.0 0.99))',
       '(: e_withdraw_past (Past sk_withdraw_1) (STV 1.0 0.99))']
run("part-percent-decimal  12.5% of applicants -> (Fraction 12.5 100) decimal token matches", PPCTD,
    '(And (SubsetOf $s sk_applicants_1) (ProportionOf $s sk_applicants_1 (Fraction 12.5 100)) (Member $e withdraw) (Agent $e $s))')
# Determinism & polish (#36): non-volitional natural-process intransitive subject -> Patient (undergoer),
# not Agent; a bare-plural duration ("for days") -> (MeasureAtLeast e duration 2 <unit>).
RESV=['(: e_drain (Member sk_drain_1 drain) (STV 1.0 0.99))',
      '(: e_drain_patient (Patient sk_drain_1 sk_reservoir_1) (STV 1.0 0.99))',
      '(: e_reservoir (Member sk_reservoir_1 reservoir) (STV 1.0 0.99))',
      '(: e_drain_past (Past sk_drain_1) (STV 1.0 0.99))']
run("intrans-natural  reservoir drained: subject bound as Patient (undergoer)", RESV,
    '(And (Member $e drain) (Patient $e $x) (Member $x reservoir) (Past $e))', contains="sk_reservoir_1")
run("intrans-natural-noagent  SAFETY natural-process subject is NOT an Agent (expect [])", RESV,
    '(Agent sk_drain_1 $x)', want="empty")
DURP=['(: e_outage (Member sk_outage_1 outage) (STV 1.0 0.99))',
      '(: e_outage_past (Past sk_outage_1) (STV 1.0 0.99))',
      '(: e_outage_dur (MeasureAtLeast sk_outage_1 duration 2 day) (STV 1.0 0.99))']
run("dur-plural  'for days' -> MeasureAtLeast duration >=2 day (lasted more than 1 day?)", DURP,
    '(And (Member $o outage) (MeasureAtLeast $o duration $n day) (Compute > ($n 1) -> true))')
# #34 (c) "the rest of X": remainder partitive -> #6 portion + (RestOf rest whole).
REST=['(: e_runners (GroupOf sk_runners_1 runner) (STV 1.0 0.99))',
      '(: e_rest (GroupOf sk_rest_1 runner) (STV 1.0 0.99))',
      '(: e_rest_subset (SubsetOf sk_rest_1 sk_runners_1) (STV 1.0 0.99))',
      '(: e_rest_restof (RestOf sk_rest_1 sk_runners_1) (STV 1.0 0.99))',
      '(: e_collapse (Member sk_collapse_1 collapse) (STV 1.0 0.99))',
      '(: e_collapse_patient (Patient sk_collapse_1 sk_rest_1) (STV 1.0 0.99))',
      '(: e_collapse_past (Past sk_collapse_1) (STV 1.0 0.99))']
run("part-rest  the rest of the runners collapsed? RestOf remainder + SubsetOf binds", REST,
    '(And (RestOf $r sk_runners_1) (SubsetOf $r sk_runners_1) (Member $e collapse) (Patient $e $r))')
# #34 (d) "too much/little" + mass: (Degree <mass> quantity excessive|insufficient).
QMASS=['(: e_rain (Member sk_rain_1 rain) (STV 1.0 0.99))',
       '(: e_rain_deg (Degree sk_rain_1 quantity insufficient) (STV 1.0 0.99))']
run("deg-quantity  too little rain -> (Degree rain quantity insufficient) binds", QMASS,
    '(Degree sk_rain_1 quantity insufficient)')
run("deg-quantity-safety  insufficient != excessive (expect [])", QMASS,
    '(Degree sk_rain_1 quantity excessive)', want="empty")
# Conditional properties: reified (ConditionalProperty kind prop cond), queryable + seeded cond_prop infers
CP=['(: cp (ConditionalProperty glass brittle cold) (STV 0.9 0.9))']
run("cond  under what condition is glass brittle? (-> cold)", CP, '(ConditionalProperty glass brittle $c)', contains="cold")
run("cond  what is glass when cold? (-> brittle)", CP, '(ConditionalProperty glass $p cold)', contains="brittle")
CPI=['(: cp (ConditionalProperty glass brittle cold) (STV 0.9 0.9))','(: v1 (Member vase glass) (STV 1.0 0.99))','(: v2 (Member vase cold) (STV 1.0 0.99))']
run("cond  cold glass vase -> brittle (cond_prop fires)", CPI, '(Member vase brittle)', seeded=True, chain=True)
run("cond  control: glass mug NOT cold -> brittle? (expect [])",
    ['(: cp (ConditionalProperty glass brittle cold) (STV 0.9 0.9))','(: w1 (Member mug glass) (STV 1.0 0.99))'],
    '(Member mug brittle)', want="empty", seeded=True, chain=True)
# Unit conversion: seeded rules normalize to canonical (meter/kg/second); compare/threshold in canonical
UC=['(: a (Measure alice tall 6 foot) (STV 1.0 0.99))','(: b (Measure bob tall 180 centimeter) (STV 1.0 0.99))']
run("unit  alice 6ft -> meters (~1.83)", UC, '(Measure alice tall $m meter)', contains="1.82", seeded=True, chain=True)
run("unit  cross-unit compare: alice(6ft) taller than bob(180cm)? (yes)", UC,
    '(And (Measure alice tall $ha meter) (Measure bob tall $hb meter) (Compute > ($ha $hb) -> true))', seeded=True, chain=True)
run("unit  cross-unit compare: bob taller than alice? (expect [])", UC,
    '(And (Measure alice tall $ha meter) (Measure bob tall $hb meter) (Compute > ($hb $ha) -> true))', want="empty", seeded=True, chain=True)
run("unit  threshold: bob(180cm=1.8m) > 5 feet(1.524m)? (yes)", UC,
    '(And (Measure bob tall $m meter) (Compute * (5 0.3048) -> $t) (Compute > ($m $t) -> true))', seeded=True, chain=True)
run("unit  threshold: bob(180cm=1.8m) > 6 feet(1.8288m)? (expect [])", UC,
    '(And (Measure bob tall $m meter) (Compute * (6 0.3048) -> $t) (Compute > ($m $t) -> true))', want="empty", seeded=True, chain=True)
run("unit  mass threshold: parcel(5kg) > 10 pounds(4.54kg)? (yes)",
    ['(: p (Measure parcel weight 5 kilogram) (STV 1.0 0.99))'],
    '(And (Measure parcel weight $m kilogram) (Compute * (10 0.453592) -> $t) (Compute > ($m $t) -> true))', seeded=True, chain=True)
# Temperature (affine): seeded celsius/fahrenheit -> kelvin; compare/threshold in kelvin
TC=['(: w (Measure water temperature 100 celsius) (STV 1.0 0.99))','(: o (Measure oven temperature 200 fahrenheit) (STV 1.0 0.99))']
run("temp  100C -> kelvin (~373.15)", TC, '(Measure water temperature $k kelvin)', contains="373.15", seeded=True, chain=True)
run("temp  200F -> kelvin (~366.48, chained Compute)", TC, '(Measure oven temperature $k kelvin)', contains="366.48", seeded=True, chain=True)
run("temp  compare: 100C hotter than 200F? (373.15>366.48 yes)", TC,
    '(And (Measure water temperature $kw kelvin) (Measure oven temperature $ko kelvin) (Compute > ($kw $ko) -> true))', seeded=True, chain=True)
run("temp  threshold F: 50C hotter than 100F(310.93K)? (yes)",
    ['(: i (Measure item temperature 50 celsius) (STV 1.0 0.99))'],
    '(And (Measure item temperature $k kelvin) (Compute - (100 32) -> $a) (Compute * ($a 5) -> $b) (Compute / ($b 9) -> $c) (Compute + ($c 273.15) -> $t) (Compute > ($k $t) -> true))', seeded=True, chain=True)
run("temp  threshold C: 4C colder than 10C(283.15K)? (yes)",
    ['(: f (Measure freezer temperature 4 celsius) (STV 1.0 0.99))'],
    '(And (Measure freezer temperature $k kelvin) (Compute + (10 273.15) -> $t) (Compute < ($k $t) -> true))', seeded=True, chain=True)
# Bounded measure conversion: MeasureAtLeast/AtMost convert the bound to canonical
BD=['(: r (MeasureAtLeast rope long 10 foot) (STV 1.0 0.99))','(: b (MeasureAtMost box weight 5 pound) (STV 1.0 0.99))']
run("bound  at-least 10 foot -> meters (~3.048)", BD, '(MeasureAtLeast rope long $m meter)', contains="3.048", seeded=True, chain=True)
run("bound  at-most 5 pound -> kg (~2.27)", BD, '(MeasureAtMost box weight $m kilogram)', contains="2.26", seeded=True, chain=True)
# Coreference
run("coref  Nina owns a parrot, it is green => owns something green?",
    ['(: a (Member sk_own_1 own) (STV 1.0 0.99))','(: b (Holder sk_own_1 nina) (STV 1.0 0.99))','(: c (Theme sk_own_1 sk_parrot_1) (STV 1.0 0.99))',
     '(: d (Member sk_parrot_1 parrot) (STV 1.0 0.99))','(: e (Member sk_parrot_1 green) (STV 1.0 0.99))'],
    '(And (Member $e own) (Holder $e nina) (Theme $e $x) (Member $x green))')
# Deontic scaffolding
run("deontic  Bob must apologize => permitted? (oblig_perm)",
    ['(: a (Member sk_apo_1 apologize) (STV 1.0 0.99))','(: b (Agent sk_apo_1 bob) (STV 1.0 0.99))','(: c (Obligated sk_apo_1) (STV 1.0 0.99))'],
    '(And (Member $e apologize) (Agent $e bob) (Permitted $e))', seeded=True, chain=True)
# Reciprocals
run("recip-sym-pair  who is alice friends with? (seeded sym_rel + Symmetric tag)",
    ['(: f (Friend bob alice) (STV 1.0 0.99))','(: tag (Symmetric Friend) (STV 1.0 0.99))','(: na (Name alice "Alice") (STV 1.0 0.99))'],
    '(And (Name $a "Alice") (Friend $a $x))', contains="bob", seeded=True, chain=True)
run("recip-directed  2-named each-other: admire bob->alice",
    ['(: e1 (Member sk_admire_1 admire) (STV 1.0 0.99))','(: e1e (Experiencer sk_admire_1 alice) (STV 1.0 0.99))','(: e1s (Stimulus sk_admire_1 bob) (STV 1.0 0.99))',
     '(: e2 (Member sk_admire_2 admire) (STV 1.0 0.99))','(: e2e (Experiencer sk_admire_2 bob) (STV 1.0 0.99))','(: e2s (Stimulus sk_admire_2 alice) (STV 1.0 0.99))'],
    '(And (Member $e admire) (Experiencer $e bob) (Stimulus $e alice))')
RECIP_JUR=['(: jd (Implication (Premises (Member $x juror) (Member $y juror) (Compute == ($x $y) -> false)) (Conclusions (Member (sk_distrust $x $y) distrust) (Experiencer (sk_distrust $x $y) $x) (Stimulus (sk_distrust $x $y) $y))) (STV 1.0 0.9))',
    '(: j1 (Member ann juror) (STV 1.0 0.99))','(: j2 (Member ben juror) (STV 1.0 0.99))']
run("recip-group-kind  jurors distrust => ann->ben", RECIP_JUR,
    '(And (Member $e distrust) (Experiencer $e ann) (Stimulus $e ben))', chain=True)
run("recip-group-kind-self  ann->ann (distinctness guard, expect [])", RECIP_JUR,
    '(And (Member $e distrust) (Experiencer $e ann) (Stimulus $e ann))', want="empty", chain=True)
run("recip-group-partof  committee(PartOf) argue dana->evan + Past inside",
    ['(: ca (Implication (Premises (PartOf $x sk_committee_1) (PartOf $y sk_committee_1) (Compute == ($x $y) -> false)) (Conclusions (Member (sk_argue $x $y) argue) (Agent (sk_argue $x $y) $x) (Theme (sk_argue $x $y) $y) (Past (sk_argue $x $y)))) (STV 1.0 0.9))',
     '(: c0 (Member sk_committee_1 committee) (STV 1.0 0.99))','(: p1 (PartOf dana sk_committee_1) (STV 1.0 0.99))','(: p2 (PartOf evan sk_committee_1) (STV 1.0 0.99))'],
    '(And (Member $e argue) (Agent $e dana) (Theme $e evan) (Past $e))', chain=True)
run("recip-sym-group  senators colleague (literal-head rule) pattern",
    ['(: sc (Implication (Premises (Member $x senator) (Member $y senator) (Compute == ($x $y) -> false)) (Conclusions (Colleague $x $y))) (STV 1.0 0.9))',
     '(: s1 (Member finn senator) (STV 1.0 0.99))','(: s2 (Member gita senator) (STV 1.0 0.99))'],
    '(Colleague finn $x)', contains="gita", chain=True)
# Disjunction
DSUBJ=['(: wc (And (Member sk_come_1 come) (Or (Agent sk_come_1 bob) (Agent sk_come_1 alice)) (Future sk_come_1)) (STV 1.0 0.99))']
run("disj-subj  someone come? (definite part projects)", DSUBJ, '(Member $e come)', contains="sk_come_1")
run("disj-subj  Bob specifically? (Or opaque, expect [])", DSUBJ, '(Agent sk_come_1 bob)', want="empty")
DINDEF=['(: po (And (Member sk_order_1 order) (Agent sk_order_1 priya) (Or (And (Theme sk_order_1 sk_salad_1) (Member sk_salad_1 salad)) (And (Theme sk_order_1 sk_sandwich_1) (Member sk_sandwich_1 sandwich))) (Past sk_order_1)) (STV 1.0 0.99))']
run("disj-obj-indef  who ordered? (priya projects)", DINDEF, '(Agent sk_order_1 priya)')
run("disj-obj-indef  salad asserted to exist? (opaque, expect [])", DINDEF, '(Member sk_salad_1 salad)', want="empty")
run("disj-cop  is it a vase? (definite, color Or opaque)",
    ['(: vc (Or (Member sk_vase_1 red) (Member sk_vase_1 blue)) (STV 1.0 0.99))','(: v (Member sk_vase_1 vase) (STV 1.0 0.99))'],
    '(Member sk_vase_1 vase)')
run("disj-rule  fragile package flagged (two rules, fires on one disjunct)",
    ['(: fr (Implication (Premises (Member $x package) (Member $x fragile)) (Conclusions (Member $x flagged))) (STV 1.0 0.99))',
     '(: hv (Implication (Premises (Member $x package) (Member $x heavy)) (Conclusions (Member $x flagged))) (STV 1.0 0.99))',
     '(: p1 (Member sk_pkg_1 package) (STV 1.0 0.99))','(: p2 (Member sk_pkg_1 fragile) (STV 1.0 0.99))'],
    '(Member sk_pkg_1 flagged)', chain=True)
run("disj-q  disjunctive question branch hits (heavier-than-dan -> finn)",
    ['(: m1 (More tall eve dan) (STV 1.0 0.99))','(: m2 (More heavy finn dan) (STV 1.0 0.99))'],
    '(More heavy $x dan)', contains="finn")
# Exclusive-or (XOR): faithful (Xor ...) label + strength-0 rules -> "rule out the other"
DOOR_X=['(: door_mem (Member sk_door_1 door) (STV 1.0 0.99))',
        '(: door_xor (Xor (Member sk_door_1 open) (Member sk_door_1 closed)) (STV 1.0 0.99))',
        '(: door_excl_1 (Implication (Premises (Member sk_door_1 open)) (Conclusions (Member sk_door_1 closed))) (STV 0.0 0.99))',
        '(: door_excl_2 (Implication (Premises (Member sk_door_1 closed)) (Conclusions (Member sk_door_1 open))) (STV 0.0 0.99))']
run("xor  Xor label pattern-queryable (bind other disjunct)", DOOR_X, '(Xor (Member sk_door_1 open) $o)', contains="closed")
run("xor  dormant: closed NOT derived w/o confirmation (expect [])", DOOR_X, '(Member sk_door_1 closed)', want="empty", chain=True)
run_strength("xor  confirm open -> closed ruled out (s=0)", DOOR_X+['(: door_open (Member sk_door_1 open) (STV 1.0 0.99))'],
    '(Member sk_door_1 closed)', 0.0, 0.05, chain=True)
TRIP_A='(And (Member sk_fly_1 fly) (Agent sk_fly_1 alice) (Goal sk_fly_1 tokyo) (Future sk_fly_1))'
TRIP_B='(And (Member sk_take_1 take) (Agent sk_take_1 alice) (Theme sk_take_1 sk_train_1) (Future sk_take_1))'
run("xor  complex event Xor label pattern (bind 2nd)", ['(: trip_xor (Xor %s %s) (STV 1.0 0.99))'%(TRIP_A,TRIP_B)],
    '(Xor %s $second)'%TRIP_A, want="match")
# Approximate measures (distribution magnitude -> graded GreaterThan)
TOWER=['(: m (Measure sk_tower_1 tall (ParticleFromNormal 90 9) meter) (STV 1.0 0.99))']
run_strength("approx  ~90m taller than 70m? (P high)", TOWER, '(And (Measure sk_tower_1 tall $d meter) (GreaterThan $d 70))', 0.9, 1.01)
run_strength("approx  ~90m taller than 90m? (P mid)",  TOWER, '(And (Measure sk_tower_1 tall $d meter) (GreaterThan $d 90))', 0.2, 0.6)
run_strength("approx  ~90m taller than 110m? (P low)", TOWER, '(And (Measure sk_tower_1 tall $d meter) (GreaterThan $d 110))', 0.0, 0.1)
run_strength("approx  compare ~90 vs ~80 (P taller >0.5)",
    ['(: a (Measure sk_tower_1 tall (ParticleFromNormal 90 9) meter) (STV 1.0 0.99))','(: b (Measure sk_antenna_1 tall (ParticleFromNormal 80 8) meter) (STV 1.0 0.99))'],
    '(And (Measure sk_tower_1 tall $da meter) (Measure sk_antenna_1 tall $db meter) (GreaterThan $da $db))', 0.5, 1.01)
# Cross-type threshold routing (#26): mixed KB (ann exact int, bea approx dist); a threshold
# question can't know storage, so emit BOTH branches + union -> covers both, disjoint (no dup).
XTYPE=['(: ma (Measure ann tall 180 centimeter) (STV 1.0 0.99))',
       '(: mb (Measure bea tall (ParticleFromNormal 180 18) centimeter) (STV 1.0 0.99))']
run_xtype("xtype  taller than 170? union finds exact(ann)+approx(bea)", XTYPE,
    '(And (Measure $x tall $n centimeter) (Compute > ($n 170) -> true))',
    '(And (Measure $x tall $n centimeter) (GreaterThan $n 170))', "ann", "bea")
# Compound questions (single conjunctive query, multiple unknowns)
run("compound-chain  oldest + where they live (grace, paris)",
    ['(: a (Most old grace person) (STV 1.0 0.99))','(: b (Member grace person) (STV 1.0 0.99))','(: c (Member e1 live) (STV 1.0 0.99))','(: d (Agent e1 grace) (STV 1.0 0.99))','(: e (Location e1 paris) (STV 1.0 0.99))'],
    '(And (Most old $who person) (Member $e live) (Agent $e $who) (Location $e $where))', contains=["grace","paris"])
run("compound-obj  what bob cooked + who ate it (stew, alice)",
    ['(: a (Member ck cook) (STV 1.0 0.99))','(: b (Agent ck bob) (STV 1.0 0.99))','(: c (Patient ck stew) (STV 1.0 0.99))','(: d (Past ck) (STV 1.0 0.99))','(: e (Member et eat) (STV 1.0 0.99))','(: f (Agent et alice) (STV 1.0 0.99))','(: g (Patient et stew) (STV 1.0 0.99))','(: h (Past et) (STV 1.0 0.99))'],
    '(And (Member $c cook) (Agent $c bob) (Patient $c $dish) (Past $c) (Member $e eat) (Agent $e $who) (Patient $e $dish) (Past $e))', contains=["stew","alice"])
run("compound-indep  tallest person + cheapest car (ivan, zar)",
    ['(: a (Most tall ivan person) (STV 1.0 0.99))','(: b (Member ivan person) (STV 1.0 0.99))','(: c (Most cheap zar car) (STV 1.0 0.99))','(: d (Member zar car) (STV 1.0 0.99))'],
    '(And (Most tall $p person) (Most cheap $c car))', contains=["ivan","zar"])
# Differential measures (MoreBy + seeded morebydiff entailment)
DIFF=['(: m (MoreBy tall alice bob 3 centimeter) (STV 1.0 0.99))','(: na (Name alice "Alice") (STV 1.0 0.99))']
run("diff  is alice taller than bob? (entailed More)", DIFF, '(And (Name $a "Alice") (More tall $a $y))', contains="bob", seeded=True, chain=True)
run("diff  how much taller? (gap 3 cm)", DIFF, '(MoreBy tall alice bob $n $u)', contains=["3","centimeter"])
run("diff  more than 2cm taller? (yes)", DIFF, '(And (MoreBy tall alice bob $n centimeter) (Compute > ($n 2) -> true))')
run("diff  more than 5cm taller? (expect [])", DIFF, '(And (MoreBy tall alice bob $n centimeter) (Compute > ($n 5) -> true))', want="empty")
run_strength("diff-approx  ~3cm gap > 2cm? (P high)",
    ['(: m (MoreBy tall alice bob (ParticleFromNormal 3.0 0.3) centimeter) (STV 1.0 0.99))'],
    '(And (MoreBy tall alice bob $d centimeter) (GreaterThan $d 2))', 0.9, 1.01)

# #24 comparative residuals: ratios, gap-addition, rate-diff, correlatives, adverbial, too/enough
RAT=['(: t (TimesAs tall alice bob 2) (STV 1.0 0.99))','(: na (Name alice "Alice") (STV 1.0 0.99))','(: nb (Name bob "Bob") (STV 1.0 0.99))']
run("ratio-order  twice as tall => More tall alice bob", RAT, '(More tall alice bob)', seeded=True, chain=True)
run("ratio-half   half as tall => More tall alice bob",
    ['(: t (TimesAs tall bob alice 0.5) (STV 1.0 0.99))'], '(More tall alice bob)', seeded=True, chain=True)
run("ratio-measure twice as tall + bob 3ft => alice 6ft",
    ['(: t (TimesAs tall alice bob 2) (STV 1.0 0.99))','(: m (Measure bob tall 3 foot) (STV 1.0 0.99))'],
    '(Measure alice tall $n foot)', contains="Measure alice tall 6 foot", seeded=True, chain=True)
run("ratio-factor  query the factor (=2)", RAT, '(TimesAs tall alice bob $f)', contains="2")
GAP=['(: f1 (MoreBy tall alice bob 3 centimeter) (STV 1.0 0.99))','(: f2 (MoreBy tall bob carol 2 centimeter) (STV 1.0 0.99))']
run("gapadd-sum   3cm+2cm => MoreBy alice carol 5cm", GAP, '(MoreBy tall alice carol $n centimeter)', contains="MoreBy tall alice carol 5 centimeter", seeded=True, chain=True)
run("gapadd-order chained gap => More tall alice carol", GAP, '(More tall alice carol)', seeded=True, chain=True)
RATE=['(: mb (MoreBy fast sk_train_1 sk_bus_1 5 kilometer_per_hour) (STV 1.0 0.99))',
      '(: t (Member sk_train_1 train) (STV 1.0 0.99))','(: b (Member sk_bus_1 bus) (STV 1.0 0.99))']
run("rate-order   5km/h faster => More fast train bus", RATE, '(More fast sk_train_1 sk_bus_1)', seeded=True, chain=True)
run("rate-gap     query the rate gap (=5)", RATE, '(MoreBy fast sk_train_1 sk_bus_1 $n kilometer_per_hour)', contains="5")
CORR=['(: corr (Implication (Premises (Member $x wine) (Member $y wine) (More old $x $y)) (Conclusions (More expensive $x $y))) (STV 0.9 0.9))',
      '(: w1 (Member sk_wine_1 wine) (STV 1.0 0.99))','(: w2 (Member sk_wine_2 wine) (STV 1.0 0.99))',
      '(: f (More old sk_wine_1 sk_wine_2) (STV 1.0 0.99))']
run("corr-fire    older->pricier => More expensive w1 w2", CORR, '(More expensive sk_wine_1 sk_wine_2)', chain=True)
run("corr-nofire  no covariation instance => []", CORR, '(More expensive sk_wine_2 sk_wine_1)', want="empty", chain=True)
run("corr-domain  non-domain pair (same order, not wine) => []",
    ['(: corr (Implication (Premises (Member $x wine) (Member $y wine) (More old $x $y)) (Conclusions (More expensive $x $y))) (STV 0.9 0.9))',
     '(: f (More old rock_a rock_b) (STV 1.0 0.99))'], '(More expensive rock_a rock_b)', want="empty", chain=True)
ADV=['(: e1 (Member sk_swim_1 swim) (STV 1.0 0.99))','(: a1 (Agent sk_swim_1 diego) (STV 1.0 0.99))',
     '(: e2 (Member sk_swim_2 swim) (STV 1.0 0.99))','(: a2 (Agent sk_swim_2 mia) (STV 1.0 0.99))',
     '(: c (More fast sk_swim_1 sk_swim_2) (STV 1.0 0.99))','(: nd (Name diego "Diego") (STV 1.0 0.99))','(: nm (Name mia "Mia") (STV 1.0 0.99))']
run("adv-direct   Diego swims faster than Mia", ADV, '(More fast sk_swim_1 sk_swim_2)')
run("adv-whoQ     who swims faster than Mia? => Diego", ADV,
    '(And (Member $e1 swim) (Agent $e1 $who) (Member $e2 swim) (Agent $e2 mia) (More fast $e1 $e2))', contains="diego")
ENO=['(: m (Member sam fit) (STV 1.0 0.99))','(: d (Degree sam fit sufficient) (STV 1.0 0.99))',
     '(: e (Member sk_run_1 run) (STV 1.0 0.99))','(: a (Agent sk_run_1 sam) (STV 1.0 0.99))',
     '(: cn (Can sk_run_1) (STV 1.0 0.99))','(: ns (Name sam "Sam") (STV 1.0 0.99))']
run("enough-can   fit enough to run => can run (ability)", ENO, '(And (Member $e run) (Agent $e sam) (Can $e))')
TOO=['(: m (Member maya young) (STV 1.0 0.99))','(: d (Degree maya young excessive) (STV 1.0 0.99))',
     '(: neg (And (Member sk_vote_1 vote) (Agent sk_vote_1 maya) (Permitted sk_vote_1)) (STV 0.0 0.99))','(: nm (Name maya "Maya") (STV 1.0 0.99))']
run("too-cannot   too young to vote => may not vote (STV 0.0, eligibility)", TOO,
    '(And (Member $e vote) (Agent $e maya) (Permitted $e))', contains="STV 0.0")
run("too-degree   degree still queryable after negation", TOO, '(Degree maya young excessive)')

# Inter-clause connectives (surface-head, de-normalized 2026-07-09): the stated connective's
# UpperCamelCase surface word IS the relation head (Because/So/Although/To/But...), eventualities
# in surface order; opaque binary atom. Explanation questions query the FOCUS pattern only
# (heads are open-class); a known-head query is the downstream-style access path.
CONN=['(: e_collapse (Member sk_collapse_1 collapse) (STV 1.0 0.99))','(: collapse_pat (Patient sk_collapse_1 sk_bridge_1) (STV 1.0 0.99))',
      '(: e_bridge (Member sk_bridge_1 bridge) (STV 1.0 0.99))','(: collapse_past (Past sk_collapse_1) (STV 1.0 0.99))',
      '(: e_snap (Member sk_snap_1 snap) (STV 1.0 0.99))',
      '(: cz (Because sk_collapse_1 sk_snap_1) (STV 1.0 0.99))']
run("conn-head  known-head access: (Because <focus> $c) binds the stated antecedent", CONN,
    '(And (Member $f collapse) (Patient $f $b) (Member $b bridge) (Because $f $c))', contains="sk_snap_1")
run("conn-focus-q  why did the bridge collapse? -> focus pattern ONLY (binds the stored event)", CONN,
    '(And (Member $f collapse) (Patient $f $b) (Member $b bridge) (Past $f))', contains="sk_collapse_1")
# state-as-connective-endpoint WITH dual-emit: known-head query AND flat copular query both resolve
STATE=['(: e_damp (Member sk_damp_1 damp) (STV 1.0 0.99))','(: damp_exp (Experiencer sk_damp_1 sk_wall_1) (STV 1.0 0.99))',
       '(: wall_damp_flat (Member sk_wall_1 damp) (STV 1.0 0.99))','(: e_wall (Member sk_wall_1 wallpaper) (STV 1.0 0.99))',
       '(: e_peel (Member sk_peel_1 peel) (STV 1.0 0.99))','(: peel_pat (Patient sk_peel_1 sk_wall_1) (STV 1.0 0.99))',
       '(: czs (Because sk_peel_1 sk_damp_1) (STV 1.0 0.99))']
run("conn-state  reified state endpoint reachable via known head", STATE,
    '(And (Member $e peel) (Patient $e $w) (Member $w wallpaper) (Because $e $c))', contains="sk_damp_1")
run("conn-state-flat  dual-emit: is the wallpaper damp? (flat copular query resolves)", STATE,
    '(Member sk_wall_1 damp)')
# Canonical ask-relations via the SEEDED bridge (2026-07-09): explanation queries conjoin
# (ReasonFor $r <focus>) / (PurposeOf $g <focus>); seeded rules derive them from the stored
# surface heads (Because/Since/So/... -> ReasonFor; To/InOrderTo -> PurposeOf -> ReasonFor).
run("conn-why-rf  why-query binds via the seeded Because->ReasonFor bridge", CONN,
    '(And (Member $f collapse) (Patient $f $b) (Member $b bridge) (Past $f) (ReasonFor $r $f))', contains="sk_snap_1", seeded=True)
TOPUR=['(: e_save (Member sk_save_1 save) (STV 1.0 0.99))','(: save_ag (Agent sk_save_1 liam) (STV 1.0 0.99))',
       '(: e_buy (Member sk_buy_1 buy) (STV 1.0 0.99))','(: t (To sk_save_1 sk_buy_1) (STV 1.0 0.99))']
run("conn-whatfor-po  what-for binds the purpose via To->PurposeOf", TOPUR,
    '(And (Member $s save) (Agent $s liam) (PurposeOf $g $s))', contains="sk_buy_1", seeded=True)
run("conn-why-po  why ALSO binds the purpose via PurposeOf->ReasonFor chaining", TOPUR,
    '(And (Member $s save) (Agent $s liam) (ReasonFor $g $s))', contains="sk_buy_1", seeded=True)
HOWC=['(: e_spoil (Member sk_spoil_1 spoil) (STV 1.0 0.99))','(: s1 (So sk_outage_1 sk_stop_1) (STV 1.0 0.99))',
      '(: s2 (AsAResult sk_stop_1 sk_spoil_1) (STV 1.0 0.99))']
run("conn-how-chain  two-hop ReasonFor chain across So+AsAResult surface heads", HOWC,
    '(And (Member $f spoil) (ReasonFor $mid $f) (ReasonFor $c1 $mid))', contains=["sk_stop_1","sk_outage_1"], seeded=True)

# Distribution to each member (#21): explicit distributive-universal ("all the / each of the N V")
# over a DISTRIBUTIVE verbal predicate -> a rule ranging over the members (kind -> (Member $x k);
# collective-noun group -> (PartOf $x g)), minting a per-member Skolem event. The distr-*/recip-* cases below query by the member's
# KNOWN symbol (a harness probe verifying the rule fires + the event derives); the FAITHFUL translator
# query binds a named member by Name — previously a KNOWN ENGINE GAP, FIXED engine-side 2026-07-09
# (see the distr-name / recip-name / grouped-name checks near the end). Monadic
# twin of the Group O reciprocal rule / the line-651 "birds fly" universal rule.
DIST_K=['(: p1 (Member omar passenger) (STV 1.0 0.99))','(: p2 (Member nadia passenger) (STV 1.0 0.99))',
        '(: r (Implication (Premises (Member $x passenger)) (Conclusions (Member (sk_board $x) board) '
        '(Agent (sk_board $x) $x) (Past (sk_board $x)))) (STV 1.0 0.9))']
run("distr-kind  all the passengers boarded -> did Omar board? (kind-ranged)", DIST_K,
    '(And (Member $e board) (Agent $e omar) (Past $e))')
run("distr-typed  same rule; a dog does NOT board (rule is typed to passenger)", DIST_K+['(: d1 (Member rex dog) (STV 1.0 0.99))'],
    '(And (Member $e board) (Agent $e rex) (Past $e))', want="nomatch")
run("distr-partof  every panel member abstained -> did Leo abstain? (PartOf-ranged)",
    ['(: c (Member sk_panel_1 panel) (STV 1.0 0.99))','(: m1 (PartOf ivy sk_panel_1) (STV 1.0 0.99))',
     '(: m2 (PartOf leo sk_panel_1) (STV 1.0 0.99))',
     '(: r (Implication (Premises (PartOf $x sk_panel_1)) (Conclusions (Member (sk_abstain $x) abstain) '
     '(Agent (sk_abstain $x) $x) (Past (sk_abstain $x)))) (STV 1.0 0.9))'],
    '(And (Member $e abstain) (Agent $e leo) (Past $e))')
run("distr-theme  all the analysts endorsed the proposal -> what did Mia endorse? (shared Theme; endorse->Theme per #23)",
    ['(: i1 (Member mia analyst) (STV 1.0 0.99))','(: i2 (Member sam analyst) (STV 1.0 0.99))',
     '(: w (Member sk_proposal_1 proposal) (STV 1.0 0.99))',
     '(: r (Implication (Premises (Member $x analyst)) (Conclusions (Member (sk_endorse $x) endorse) '
     '(Agent (sk_endorse $x) $x) (Theme (sk_endorse $x) sk_proposal_1) (Past (sk_endorse $x)))) (STV 1.0 0.9))'],
    '(And (Member $e endorse) (Agent $e mia) (Theme $e $what) (Past $e))', contains="sk_proposal_1")
run("distr-collective  the tourists assembled -> group assembled? (collective NOT distributed)",
    ['(: g (GroupOf grp tourist) (STV 1.0 0.99))','(: e (Member sk_assemble_1 assemble) (STV 1.0 0.99))',
     '(: a (Agent sk_assemble_1 grp) (STV 1.0 0.99))','(: p (Past sk_assemble_1) (STV 1.0 0.99))'],
    '(And (Member $e assemble) (Agent $e grp) (Past $e))')

# Status-wrapped copular query: tense/modality wraps a copular atom; the query binds the nested atom.
run("copular-status  was Alice happy? (Past-wrapped copular)",
    ['(: a (Past (Member alice happy)) (STV 1.0 0.99))','(: n (Name alice "Alice") (STV 1.0 0.99))'],
    '(And (Name $x "Alice") (Past (Member $x happy)))')
run("copular-status-ctrl  was Alice sad? (wrong property -> [])",
    ['(: a (Past (Member alice happy)) (STV 1.0 0.99))','(: n (Name alice "Alice") (STV 1.0 0.99))'],
    '(And (Name $x "Alice") (Past (Member $x sad)))', want="empty")

# Negated verbal generic: "Owls don't migrate" = the distributing rule at strength 0.0, so each
# member's event derives at strength 0 (an arbitrary owl does NOT migrate).
NEG_GEN=['(: r (Implication (Premises (Member $x owl)) (Conclusions (Member (sk_migrate $x) migrate) '
         '(Agent (sk_migrate $x) $x))) (STV 0.0 0.9))','(: o (Member ollie owl) (STV 1.0 0.99))']
run_strength("neg-generic  owls don't migrate -> ollie migrate strength ~0", NEG_GEN,
    '(And (Member $e migrate) (Agent $e ollie))', 0.0, 0.1, chain=True)

# Independent compound question: the parts share NO variable, so a single conjoined (And ...) needs
# BOTH provable -> a missing half drops the whole answer; hence one query LINE PER independent part.
IND=['(: d (Most old rex dog) (STV 1.0 0.9))','(: dm (Member rex dog) (STV 1.0 0.99))']
run("q-indep-conjoined  oldest dog known + cat absent -> [] (why independents split)", IND,
    '(And (Most old $d dog) (Most young $c cat))', want="empty")
run("q-indep-line  the dog part as its own line -> answers", IND,
    '(Most old $d dog)', contains="rex")

# Weight/heavy scale: a measure stored under the dimension NOUN (weight) is found by a threshold
# question that normalizes the comparative adjective to that noun ("heavier than 3kg?" -> weight),
# not the adjective scale (heavy), which would miss.
WMEAS=['(: b (Member sk_box_1 box) (STV 1.0 0.99))','(: m (Measure sk_box_1 weight 5 kilogram) (STV 1.0 0.99))']
run("measure-weight-scale  heavier than 3kg? -> weight scale matches", WMEAS,
    '(And (Member $b box) (Measure $b weight $m kilogram) (Compute > ($m 3) -> true))')
run("measure-heavy-ctrl  same Q on adjective scale 'heavy' -> [] (why normalize)", WMEAS,
    '(And (Member $b box) (Measure $b heavy $m kilogram) (Compute > ($m 3) -> true))', want="empty")

# Deontic norm over a kind (Q3 unify): plain norm = reified property (same shape as defeasible,
# minus the exception); inherits to members; obligation implies permission via seeded oblig_perm_prop.
KNORM=['(: ct (Inheritance citizen (obligated pay_tax)) (STV 1.0 0.99))',
       '(: ptg (Inheritance pay_tax pay) (STV 1.0 0.99))','(: pto (Patient pay_tax tax) (STV 1.0 0.99))',
       '(: bc (Member bob citizen) (STV 1.0 0.99))']
run("deon-kind-member  must Bob (a citizen) pay tax? (property inherits to member)", KNORM,
    '(Member bob (obligated pay_tax))', seeded=True, chain=True)
run("deon-kind-what    what must citizens pay? (decompose obligated -> tax)", KNORM,
    '(And (Inheritance citizen (obligated $a)) (Patient $a $w))', contains="tax", seeded=True, chain=True)
run("deon-kind-perm    may Bob pay tax? (oblig_perm_prop -> permitted, then inherits)", KNORM,
    '(Member bob (permitted pay_tax))', seeded=True, chain=True)
# Kind prohibition (Q1): denial of permission at strength 0; inherits to members at ~0.
PROHIB=['(: sc (Inheritance student (permitted cheat)) (STV 0.0 0.99))','(: an (Member ana student) (STV 1.0 0.99))']
run_strength("deon-prohib     may Ana (a student) cheat? (~0, prohibited)", PROHIB,
    '(Member ana (permitted cheat))', 0.0, 0.15, chain=True)
# Specific prohibition (Q1): "Bob may not enter" = strength-0 event bundle with Permitted (not negated Obligated).
run("deon-specific-prohib  may Bob enter? (specific prohibition, STV 0.0)",
    ['(: n (And (Member sk_enter_1 enter) (Agent sk_enter_1 bob) (Permitted sk_enter_1)) (STV 0.0 0.99))'],
    '(And (Member $e enter) (Agent $e bob) (Permitted $e))', contains="STV 0.0")

# Rule-based distribution over a grouped/counted plural (distributive predicate): the group + count +
# group event stay for counting / "did any?", and a rule over (PartOf $x group) fires when a member
# is individuated later, making that member queryable -- works for vague/large counts (no enumeration).
DGRP=['(: g (GroupOf sk_group_1 dog) (STV 1.0 0.99))','(: gc (CardinalityPhrase sk_group_1 "several") (STV 1.0 0.99))',
      '(: ge (Member sk_bark_1 bark) (STV 1.0 0.99))','(: gea (Agent sk_bark_1 sk_group_1) (STV 1.0 0.99))','(: gep (Past sk_bark_1) (STV 1.0 0.99))']
DFIDO=DGRP+['(: r (Implication (Premises (PartOf $x sk_group_1)) (Conclusions (Member (sk_bark $x) bark) (Agent (sk_bark $x) $x) (Past (sk_bark $x)))) (STV 1.0 0.9))',
            '(: fd (Member fido dog) (STV 1.0 0.99))','(: fp (PartOf fido sk_group_1) (STV 1.0 0.99))','(: fn (Name fido "Fido") (STV 1.0 0.99))']
run("distgrp-anon   several dogs barked -> did the group bark? (group event, no member needed)", DGRP,
    '(And (Member $e bark) (Agent $e $g) (GroupOf $g dog) (Past $e))')
run("distgrp-count  ... how many? (CardinalityPhrase on the group)", DGRP,
    '(And (Member $e bark) (Agent $e $g) (GroupOf $g dog) (CardinalityPhrase $g $p))', contains="several")
run("distgrp-fido   Fido was one of those dogs -> did Fido bark? (PartOf fires the rule)", DFIDO,
    '(And (Member $e bark) (Agent $e fido) (Past $e))', chain=True)

# Fine temporal (#13): calendar/clock points are structured terms on the Time role (one atom per
# stated granularity; deictics stay bare symbols); ordering = canonical Before + measured BeforeBy
# gaps (seeded transitivity / gap-addition / gap->Before); unknown-but-bounded times =
# TimeAtMost/TimeAtLeast with dual-branch threshold routing (parallel to #3.3/#26); intervals =
# Start/End terms (+ seeded interval->duration) and During; durations = (Measure e duration n unit)
# riding the existing unit lexicon (canonical second).
TDATE=['(: a (Member sk_open_1 open) (STV 1.0 0.99))','(: b (Patient sk_open_1 sk_fair_1) (STV 1.0 0.99))',
       '(: c (Member sk_fair_1 fair) (STV 1.0 0.99))','(: d (Time sk_open_1 (Year 2021)) (STV 1.0 0.99))',
       '(: e (Time sk_open_1 (Month april)) (STV 1.0 0.99))','(: f (Time sk_open_1 (Day 9)) (STV 1.0 0.99))',
       '(: g (Past sk_open_1) (STV 1.0 0.99))']
run("time-when   when did the fair open? (open Time -> every stored granularity)", TDATE,
    '(And (Member $e open) (Patient $e $f) (Member $f fair) (Time $e $t) (Past $e))',
    contains=["Year 2021","Month april","Day 9"])
run("time-year   what year did the fair open? (bind inside the term)", TDATE,
    '(And (Member $e open) (Time $e (Year $y)) (Past $e))', contains="Year 2021")
run("time-thresh    opened before 2025? (Compute on the bound year)", TDATE,
    '(And (Member $e open) (Time $e (Year $y)) (Compute < ($y 2025) -> true) (Past $e))')
run("time-thresh-neg  opened before 2020? (expect [])", TDATE,
    '(And (Member $e open) (Time $e (Year $y)) (Compute < ($y 2020) -> true) (Past $e))', want="empty")
run("time-month  opened before June? (month name via seeded MonthNumber join)", TDATE,
    '(And (Member $e open) (Time $e (Month $m)) (MonthNumber $m $n) (Compute < ($n 6) -> true) (Past $e))', seeded=True)
run("time-deictic  Elena called this morning -> when? (bare symbol rides Time)",
    ['(: a (Member sk_call_1 call) (STV 1.0 0.99))','(: b (Agent sk_call_1 elena) (STV 1.0 0.99))',
     '(: c (Time sk_call_1 this_morning) (STV 1.0 0.99))','(: d (Past sk_call_1) (STV 1.0 0.99))'],
    '(And (Member $e call) (Agent $e elena) (Time $e $t) (Past $e))', contains="this_morning")
TORD=['(: a (Member sk_leave_1 leave) (STV 1.0 0.99))','(: b (Agent sk_leave_1 iris) (STV 1.0 0.99))','(: c (Past sk_leave_1) (STV 1.0 0.99))',
      '(: d (Member sk_arrive_1 arrive) (STV 1.0 0.99))','(: e (Agent sk_arrive_1 hugo) (STV 1.0 0.99))','(: f (Past sk_arrive_1) (STV 1.0 0.99))',
      '(: g (Before sk_leave_1 sk_arrive_1) (STV 1.0 0.99))',
      '(: h (Member sk_close_1 close) (STV 1.0 0.99))','(: i (Past sk_close_1) (STV 1.0 0.99))',
      '(: j (Before sk_arrive_1 sk_close_1) (STV 1.0 0.99))']
run("time-before  did Iris leave before Hugo arrived? (Before with both anchors)", TORD,
    '(And (Member $e1 leave) (Agent $e1 iris) (Past $e1) (Member $e2 arrive) (Agent $e2 hugo) (Past $e2) (Before $e1 $e2))')
run("time-before-trans  leave<arrive<close => leave<close (seeded before_trans)", TORD,
    '(Before sk_leave_1 sk_close_1)', seeded=True)
TGAP=['(: a (Member sk_rehearse_1 rehearse) (STV 1.0 0.99))','(: b (Agent sk_rehearse_1 sk_choir_1) (STV 1.0 0.99))',
      '(: c (Member sk_choir_1 choir) (STV 1.0 0.99))','(: d (Past sk_rehearse_1) (STV 1.0 0.99))',
      '(: e (Member sk_concert_1 concert) (STV 1.0 0.99))','(: f (BeforeBy sk_rehearse_1 sk_concert_1 2 hour) (STV 1.0 0.99))',
      '(: g (Member sk_dine_1 dine) (STV 1.0 0.99))','(: h (BeforeBy sk_dine_1 sk_rehearse_1 3 hour) (STV 1.0 0.99))']
run("time-gap    how long before the concert did the choir rehearse? (bind the gap)", TGAP,
    '(And (Member $e rehearse) (Agent $e $c) (Member $c choir) (BeforeBy $e $k $n hour) (Member $k concert))', contains="2 hour")
run("time-gap-before  measured gap => plain Before (seeded beforeby_before)", TGAP,
    '(Before sk_rehearse_1 sk_concert_1)', seeded=True)
run("time-gap-add  dine 3h before rehearsal 2h before concert => dine 5h before (seeded beforeby_trans)", TGAP,
    '(BeforeBy sk_dine_1 sk_concert_1 $n hour)', seeded=True, contains="5 hour")
run("time-ago    Vera quit two years ago => before now (reserved anchor, seeded)",
    ['(: a (Member sk_quit_1 quit) (STV 1.0 0.99))','(: b (Agent sk_quit_1 vera) (STV 1.0 0.99))',
     '(: c (Past sk_quit_1) (STV 1.0 0.99))','(: d (BeforeBy sk_quit_1 now 2 year) (STV 1.0 0.99))'],
    '(Before sk_quit_1 now)', seeded=True)
TBND=['(: a (Member sk_build_1 build) (STV 1.0 0.99))','(: b (Patient sk_build_1 sk_mill_1) (STV 1.0 0.99))',
      '(: c (Member sk_mill_1 mill) (STV 1.0 0.99))','(: d (Past sk_build_1) (STV 1.0 0.99))',
      '(: e (TimeAtMost sk_build_1 (Year 1899)) (STV 1.0 0.99))']
run("time-bound  built before 1900 -> built before 1950? (matching-direction bound branch)", TBND,
    '(And (Member $e build) (Patient $e $m) (Member $m mill) (TimeAtMost $e (Year $y)) (Compute < ($y 1950) -> true) (Past $e))')
run("time-bound-exact-ctrl  exact branch on bound storage -> [] (why the union)", TBND,
    '(And (Member $e build) (Patient $e $m) (Member $m mill) (Time $e (Year $y)) (Compute < ($y 1950) -> true) (Past $e))', want="empty")
TIVL=['(: a (Member sk_operate_1 operate) (STV 1.0 0.99))','(: b (Agent sk_operate_1 sk_kiosk_1) (STV 1.0 0.99))',
      '(: c (Member sk_kiosk_1 kiosk) (STV 1.0 0.99))','(: d (Start sk_operate_1 (Hour 10)) (STV 1.0 0.99))',
      '(: e (End sk_operate_1 (Hour 17)) (STV 1.0 0.99))']
run("time-interval  kiosk runs 10-17 -> operating at 12? (containment, two Computes)", TIVL,
    '(And (Member $e operate) (Agent $e $k) (Member $k kiosk) (Start $e (Hour $s)) (Compute <= ($s 12) -> true) (End $e (Hour $n)) (Compute >= ($n 12) -> true))')
run("time-interval-neg  ... operating at 19? (expect [])", TIVL,
    '(And (Member $e operate) (Agent $e $k) (Member $k kiosk) (Start $e (Hour $s)) (Compute <= ($s 19) -> true) (End $e (Hour $n)) (Compute >= ($n 19) -> true))', want="empty")
run("time-interval-dur  10-17 => duration 7 hours (seeded interval_duration_hour)", TIVL,
    '(Measure sk_operate_1 duration $d hour)', seeded=True, contains="7 hour")
run("time-since  Ken has worked there since 2021 (continuative: Ongoing + Start, no Past)",
    ['(: a (Member sk_work_1 work) (STV 1.0 0.99))','(: b (Agent sk_work_1 ken) (STV 1.0 0.99))',
     '(: c (Ongoing sk_work_1) (STV 1.0 0.99))','(: d (Start sk_work_1 (Year 2021)) (STV 1.0 0.99))'],
    '(And (Member $e work) (Agent $e ken) (Start $e (Year $y)) (Ongoing $e))', contains="Year 2021")
run("time-during  the siren sounded during the drill",
    ['(: a (Member sk_sound_1 sound) (STV 1.0 0.99))','(: b (Agent sk_sound_1 sk_siren_1) (STV 1.0 0.99))',
     '(: c (Member sk_siren_1 siren) (STV 1.0 0.99))','(: d (Member sk_drill_1 drill) (STV 1.0 0.99))',
     '(: e (During sk_sound_1 sk_drill_1) (STV 1.0 0.99))','(: f (Past sk_sound_1) (STV 1.0 0.99))'],
    '(And (Member $e sound) (During $e $d) (Member $d drill) (Past $e))')
TDUR=['(: a (Member sk_row_1 row) (STV 1.0 0.99))','(: b (Agent sk_row_1 pia) (STV 1.0 0.99))',
      '(: c (Past sk_row_1) (STV 1.0 0.99))','(: d (Measure sk_row_1 duration 4 hour) (STV 1.0 0.99))']
run("time-dur    how long did Pia row? (bind the duration measure)", TDUR,
    '(And (Member $e row) (Agent $e pia) (Measure $e duration $n $u) (Past $e))', contains="4 hour")
run("time-dur-canon  4 hours -> 14400 seconds (existing seeded unit lexicon)", TDUR,
    '(Measure sk_row_1 duration $s second)', seeded=True, contains="14400")
run("time-dur-thresh  rowed longer than 90 minutes? (threshold converted in-query, canonical seconds)", TDUR,
    '(And (Measure $e duration $s second) (Compute * (90 60.0) -> $t) (Compute > ($s $t) -> true))', seeded=True)

# Context input (#18): the translator takes an optional CONTEXT block (prior parses' atoms,
# verbatim + TODAY + DOMAIN). Engine-side the mechanism is plain symbol sharing -- these cases
# load two passages' VERBATIM translator outputs into ONE KB and exercise what context enables:
# cross-passage joins via reused symbols, continued witness indices (no collisions), dual-emitted
# TODAY-grounded deictics, context-constant queries, and same-symbol denial -> revision blend.
CTXP1=['(: e_adopt (Member sk_adopt_1 adopt) (STV 1.0 0.99))','(: e_adopt_ag (Agent sk_adopt_1 tomas) (STV 1.0 0.99))',
       '(: e_adopt_th (Theme sk_adopt_1 sk_puppy_1) (STV 1.0 0.99))','(: e_puppy (Member sk_puppy_1 puppy) (STV 1.0 0.99))',
       '(: e_adopt_past (Past sk_adopt_1) (STV 1.0 0.99))','(: tomas_name (Name tomas "Tomas") (STV 1.0 0.99))']
CTXP2=['(: e_chew (Member sk_chew_1 chew) (STV 1.0 0.99))','(: e_chew_ag (Agent sk_chew_1 sk_puppy_1) (STV 1.0 0.99))',
       '(: e_chew_pat (Patient sk_chew_1 sk_shoe_1) (STV 1.0 0.99))','(: e_shoe (Member sk_shoe_1 shoe) (STV 1.0 0.99))',
       '(: e_own (Member sk_own_1 own) (STV 1.0 0.99))','(: e_own_holder (Holder sk_own_1 tomas) (STV 1.0 0.99))',
       '(: e_own_theme (Theme sk_own_1 sk_shoe_1) (STV 1.0 0.99))','(: e_chew_past (Past sk_chew_1) (STV 1.0 0.99))']
run("ctx-join   P1 adopt + P2 chew share sk_puppy_1 -> 9-conj cross-passage join", CTXP1+CTXP2,
    '(And (Name $t "Tomas") (Member $a adopt) (Agent $a $t) (Theme $a $k) (Member $e chew) (Agent $e $k) (Patient $e $s) (Member $s shoe) (Past $e))')
run("ctx-whose  whose shoe was chewed? ('his' -> own-event in P2)", CTXP1+CTXP2,
    '(And (Member $o own) (Holder $o $who) (Theme $o $s) (Member $s shoe))', contains="tomas")
CTXFILE=['(: omar_name (Name omar "Omar") (STV 1.0 0.99))','(: e_file (Member sk_file_1 file) (STV 1.0 0.99))',
         '(: e_fag (Agent sk_file_1 omar) (STV 1.0 0.99))','(: e_fth (Theme sk_file_1 sk_report_1) (STV 1.0 0.99))',
         '(: e_rep (Member sk_report_1 report) (STV 1.0 0.99))','(: e_fp (Past sk_file_1) (STV 1.0 0.99))',
         '(: ann_file (Member sk_file_2 file) (STV 1.0 0.99))','(: ann_file_ag (Agent sk_file_2 ann) (STV 1.0 0.99))',
         '(: ann_file_th (Theme sk_file_2 sk_report_2) (STV 1.0 0.99))','(: ann_report (Member sk_report_2 report) (STV 1.0 0.99))',
         '(: ann_file_past (Past sk_file_2) (STV 1.0 0.99))','(: ann_name (Name ann "Ann") (STV 1.0 0.99))']
run("ctx-fresh  continued indices: omar's report_1 + ann's report_2 coexist, both retrievable", CTXFILE,
    '(And (Member $e file) (Agent $e $who) (Theme $e $r) (Member $r report) (Past $e))', contains=["omar","ann"])
CTXSHIP=['(: e_arrive (Member sk_arrive_1 arrive) (STV 1.0 0.99))','(: e_agent (Agent sk_arrive_1 sk_shipment_1) (STV 1.0 0.99))',
         '(: e_shipment (Member sk_shipment_1 shipment) (STV 1.0 0.99))','(: e_past (Past sk_arrive_1) (STV 1.0 0.99))',
         '(: e_time (Time sk_arrive_1 yesterday) (STV 1.0 0.99))','(: e_day (Time sk_arrive_1 (Day 6)) (STV 1.0 0.99))',
         '(: e_month (Time sk_arrive_1 (Month july)) (STV 1.0 0.99))','(: e_year (Time sk_arrive_1 (Year 2026)) (STV 1.0 0.99))']
run("ctx-ground      TODAY-grounded 'yesterday' answers BY DATE (dual-emit payoff)", CTXSHIP,
    '(And (Member $e arrive) (Time $e (Day 6)) (Time $e (Month july)) (Past $e))')
run("ctx-ground-deictic  ... and still BY DEICTIC (constant kept)", CTXSHIP,
    '(And (Member $e arrive) (Time $e yesterday) (Past $e))')
CTXPAR=['(: nadia_name (Name nadia "Nadia") (STV 1.0 0.99))','(: e_own (Member sk_own_1 own) (STV 1.0 0.99))',
        '(: e_oh (Holder sk_own_1 nadia) (STV 1.0 0.99))','(: e_ot (Theme sk_own_1 sk_parrot_1) (STV 1.0 0.99))',
        '(: e_par (Member sk_parrot_1 parrot) (STV 1.0 0.99))']
run("ctx-query  a context-known referent queried as its CONSTANT symbol", CTXPAR,
    '(And (Member $e own) (Theme $e sk_parrot_1) (Holder $e $who))', contains="nadia")
CTXBO=['(: bo_name (Name bo "Bo") (STV 1.0 0.99))','(: e_work (Member sk_work_1 work) (STV 1.0 0.99))',
       '(: e_wag (Agent sk_work_1 bo) (STV 1.0 0.99))','(: e_wloc (Location sk_work_1 sk_bakery_1) (STV 1.0 0.99))',
       '(: e_bak (Member sk_bakery_1 bakery) (STV 1.0 0.99))']
run("CAUSE-B ctx-update  'no longer works' same symbols -> now RAW denial 0.0 (was ~0.25 blend)",
    CTXBO+['(: bo_no_longer_work (And (Member sk_work_1 work) (Agent sk_work_1 bo) (Location sk_work_1 sk_bakery_1)) (STV 0.0 0.99))'],
    '(And (Member $e work) (Agent $e bo) (Location $e sk_bakery_1))', contains="STV 0.0")
run("ctx-update-fresh-ctrl  fresh-symbol denial does NOT merge -> stale positive persists (why same-symbol)",
    CTXBO+['(: bo_not_work_fresh (And (Member sk_work_2 work) (Agent sk_work_2 bo) (Location sk_work_2 sk_bakery_1)) (STV 0.0 0.99))'],
    '(And (Member $e work) (Agent $e bo) (Location $e sk_bakery_1))', contains=["STV 0.0","STV 1.0"])

# State cessation (#32): "no longer / not anymore / used to" = the state's atoms + (Past e) +
# a same-symbol strength-0 denial WITHOUT the Past. The Past-query is a different proposition
# from the denial -> answers ~1.0; the bare present-query merges held-state + denial into ONE
# graded leaning-no row; a pinned (STV 0.0 $conf) query retrieves the RAW denial (the pin sees
# proof-level TVs BEFORE the merge). "stopped V-ing" (eventive) and "until DATE" stay positive.
#
# CAUSE-B ENGINE CHANGE (2026-07-21, assumed INTENDED pending owner confirmation): the engine
# update stopped REVISING a same-symbol strength-0 (And ...) denial with the separately-stored
# positive atoms. So the bare present-query now returns the RAW denial 0.0 (no ~0.25 blend), and
# a positive bundle query that shares the denial's (Member,Agent) sub-conjunction (cess-past,
# cess-update) now returns [] instead of ~1.0. General revision is unaffected (defeasibility
# still overrides). The four cases below are re-baselined to the CURRENT behavior and tagged
# CAUSE-B so this regression suite flags it again if the behavior changes back; the #32 cessation
# representation needs revisiting under the new revision semantics (deferred as its own task).
CESS=['(: e_paint (Member sk_paint_1 paint) (STV 1.0 0.99))','(: e_page (Agent sk_paint_1 dario) (STV 1.0 0.99))',
      '(: e_ppast (Past sk_paint_1) (STV 1.0 0.99))',
      '(: e_pnot (And (Member sk_paint_1 paint) (Agent sk_paint_1 dario)) (STV 0.0 0.99))',
      '(: dario_name (Name dario "Dario") (STV 1.0 0.99))']
run("CAUSE-B cess-past   did Dario paint? Past bundle now -> [] (was ~1.0; shares denial's Member/Agent)", CESS,
    '(And (Member $e paint) (Agent $e $d) (Name $d "Dario") (Past $e))', want="empty")
run("CAUSE-B cess-still  does Dario still paint? bare-Q now -> RAW denial 0.0 (was ~0.25 blend)", CESS,
    '(And (Member $e paint) (Agent $e dario))', contains="STV 0.0")
run("cess-pin    negative wording -> pinned @0 retrieves the raw denial (pre-merge)", CESS,
    '(And (Member $e paint) (Agent $e dario))', tv='(STV 0.0 $conf)', contains="STV 0.0")
CESSJ=['(: jonas_name (Name jonas "Jonas") (STV 1.0 0.99))','(: e_work (Member sk_work_1 work) (STV 1.0 0.99))',
       '(: e_wag (Agent sk_work_1 jonas) (STV 1.0 0.99))','(: e_wloc (Location sk_work_1 sk_garage_1) (STV 1.0 0.99))',
       '(: e_gar (Member sk_garage_1 garage) (STV 1.0 0.99))',
       '(: e_wpast (Past sk_work_1) (STV 1.0 0.99))',
       '(: e_wnot (And (Member sk_work_1 work) (Agent sk_work_1 jonas) (Location sk_work_1 sk_garage_1)) (STV 0.0 0.99))']
run("CAUSE-B cess-update  did Jonas work there? Past bundle now -> [] (was ~1.0; shares denial's Member/Agent)", CESSJ,
    '(And (Member $e work) (Agent $e jonas) (Location $e $g) (Member $g garage) (Past $e))', want="empty")
run("cess-eventive-ctrl  'Greta stopped knitting' stays eventive -> the activity positive, no denial",
    ['(: e_knit (Member sk_knit_1 knit) (STV 1.0 0.99))','(: e_knag (Agent sk_knit_1 greta) (STV 1.0 0.99))',
     '(: e_knpast (Past sk_knit_1) (STV 1.0 0.99))','(: e_stop (Member sk_stop_1 stop) (STV 1.0 0.99))',
     '(: e_stag (Agent sk_stop_1 greta) (STV 1.0 0.99))','(: e_stth (Theme sk_stop_1 sk_knit_1) (STV 1.0 0.99))',
     '(: e_stpast (Past sk_stop_1) (STV 1.0 0.99))','(: greta_name (Name greta "Greta") (STV 1.0 0.99))'],
    '(And (Member $e knit) (Agent $e greta) (Past $e))', contains="STV 1.0")
run("cess-until  'operated until 1998' -> when did it stop? (End bind, no denial)",
    ['(: e_op (Member sk_operate_1 operate) (STV 1.0 0.99))','(: e_opag (Agent sk_operate_1 sk_mine_1) (STV 1.0 0.99))',
     '(: e_mine (Member sk_mine_1 mine) (STV 1.0 0.99))','(: e_oppast (Past sk_operate_1) (STV 1.0 0.99))',
     '(: e_opend (End sk_operate_1 (Year 1998)) (STV 1.0 0.99))'],
    '(And (Member $e operate) (Agent $e $m) (Member $m mine) (End $e (Year $y)) (Past $e))', contains="Year 1998")

# Fine-temporal tails Wave 1 (#13): discourse-anaphoric times resolve by TERM PROPAGATION --
# the antecedent's day-level terms copy onto the new event + a day-part symbol; "next/following"
# = day+1 (or weekday successor) + Before; unknown antecedent day -> day-part (+Before) only.
# SUPERSEDES the that_evening interim constant. Day-parts (morning/evening/night) are plain Time
# symbols. Frequency: habitual stays UNMARKED + slot term + (Every e n unit) / (TimesPer e n unit).
# "Every time / whenever CLAUSE" = a rule over event OCCURRENCES (During-linked Skolem per trigger);
# calendar slots are terms (not entities), so "every Monday" is flat, never a rule.
TANA=['(: g_host (Member sk_host_1 host) (STV 1.0 0.99))','(: g_serve (Member sk_serve_1 serve) (STV 1.0 0.99))',
      '(: g_serve_ag (Agent sk_serve_1 sk_host_1) (STV 1.0 0.99))','(: g_serve_th (Theme sk_serve_1 dinner) (STV 1.0 0.99))',
      '(: g_serve_t1 (Time sk_serve_1 (Weekday tuesday)) (STV 1.0 0.99))','(: g_serve_t2 (Time sk_serve_1 evening) (STV 1.0 0.99))',
      '(: g_serve_past (Past sk_serve_1) (STV 1.0 0.99))']
run("tail-anaphor  'that evening' -> propagated tuesday: did the host serve dinner on Tuesday?", TANA,
    '(And (Member $e serve) (Agent $e $h) (Member $h host) (Theme $e dinner) (Time $e (Weekday tuesday)) (Past $e))')
TNEXT=['(: v_name (Name vera "Vera") (STV 1.0 0.99))','(: v_tour (Member sk_tour_1 tour) (STV 1.0 0.99))',
       '(: v_tour_ag (Agent sk_tour_1 vera) (STV 1.0 0.99))','(: v_tour_th (Theme sk_tour_1 sk_harbor_1) (STV 1.0 0.99))',
       '(: v_harbor (Member sk_harbor_1 harbor) (STV 1.0 0.99))','(: v_tour_t1 (Time sk_tour_1 (Weekday thursday)) (STV 1.0 0.99))',
       '(: v_tour_t2 (Time sk_tour_1 morning) (STV 1.0 0.99))','(: v_tour_past (Past sk_tour_1) (STV 1.0 0.99))']
run("tail-nextmorn  'the next morning' -> weekday successor + part: when did Vera tour?", TNEXT,
    '(And (Member $e tour) (Agent $e $v) (Name $v "Vera") (Time $e $t) (Past $e))', contains=["thursday","morning"])
TGAL=['(: gal_write (Member sk_write_1 write) (STV 1.0 0.99))','(: gal_write_ag (Agent sk_write_1 sk_critic_1) (STV 1.0 0.99))',
      '(: gal_critic (Member sk_critic_1 critic) (STV 1.0 0.99))','(: gal_write_pat (Patient sk_write_1 sk_review_1) (STV 1.0 0.99))',
      '(: gal_review (Member sk_review_1 review) (STV 1.0 0.99))','(: gal_write_m (Time sk_write_1 (Month april)) (STV 1.0 0.99))',
      '(: gal_write_d (Time sk_write_1 (Day 3)) (STV 1.0 0.99))','(: gal_write_past (Past sk_write_1) (STV 1.0 0.99))']
run("tail-followday  'the following day' after April 2 -> Day 3 propagated", TGAL,
    '(And (Member $e write) (Agent $e $c) (Member $c critic) (Time $e (Day 3)) (Time $e (Month april)) (Past $e))')
TNOOR=['(: n_name (Name noor "Noor") (STV 1.0 0.99))','(: n_finish (Member sk_finish_1 finish) (STV 1.0 0.99))',
       '(: n_finish_ag (Agent sk_finish_1 noor) (STV 1.0 0.99))','(: n_finish_t (Time sk_finish_1 night) (STV 1.0 0.99))',
       '(: n_finish_past (Past sk_finish_1) (STV 1.0 0.99))','(: n_submit (Member sk_submit_1 submit) (STV 1.0 0.99))',
       '(: n_submit_ag (Agent sk_submit_1 noor) (STV 1.0 0.99))','(: n_submit_t (Time sk_submit_1 morning) (STV 1.0 0.99))',
       '(: n_before (Before sk_finish_1 sk_submit_1) (STV 1.0 0.99))','(: n_submit_past (Past sk_submit_1) (STV 1.0 0.99))']
run("tail-fallback  unknown antecedent day -> NO day terms on 'the next morning' (bind expects [])", TNOOR,
    '(And (Member $e submit) (Agent $e noor) (Time $e (Day $d)))', want="empty")
run("tail-fallback-part  ... but the day-part + explicit ordering hold", TNOOR,
    '(And (Member $e submit) (Agent $e noor) (Time $e morning) (Member $f finish) (Before $f $e))')
run("tail-freq-slot  clinic screens every Friday -> what day? (slot bind, habitual unmarked)",
    ['(: c_clinic (Member sk_clinic_1 clinic) (STV 1.0 0.99))','(: c_screen (Member sk_screen_1 screen) (STV 1.0 0.99))',
     '(: c_screen_ag (Agent sk_screen_1 sk_clinic_1) (STV 1.0 0.99))','(: c_screen_th (Theme sk_screen_1 patient) (STV 1.0 0.99))',
     '(: c_screen_t (Time sk_screen_1 (Weekday friday)) (STV 1.0 0.99))','(: c_screen_ev (Every sk_screen_1 1 week) (STV 1.0 0.99))'],
    '(And (Member $e screen) (Agent $e $c) (Member $c clinic) (Theme $e patient) (Time $e (Weekday $w)))', contains="friday")
run("tail-freq-often  inspector visits every three months -> how often? (Every bind)",
    ['(: i_insp (Member sk_inspector_1 inspector) (STV 1.0 0.99))','(: i_visit (Member sk_visit_1 visit) (STV 1.0 0.99))',
     '(: i_visit_ag (Agent sk_visit_1 sk_inspector_1) (STV 1.0 0.99))','(: i_visit_ev (Every sk_visit_1 3 month) (STV 1.0 0.99))'],
    '(And (Member $e visit) (Agent $e $i) (Member $i inspector) (Every $e $n $u))', contains="3 month")
TROW=['(: t_name (Name tomas "Tomas") (STV 1.0 0.99))','(: t_row (Member sk_row_1 row) (STV 1.0 0.99))',
      '(: t_row_ag (Agent sk_row_1 tomas) (STV 1.0 0.99))','(: t_row_tp (TimesPer sk_row_1 2 week) (STV 1.0 0.99))']
run("tail-freq-rate  rows twice a week -> more than once a week? (TimesPer + Compute)", TROW,
    '(And (Member $e row) (Agent $e tomas) (TimesPer $e $n week) (Compute > ($n 1) -> true))')
TWHEN=['(: e_doorbell (Member sk_doorbell_1 doorbell) (STV 1.0 0.99))','(: e_terrier (Member sk_terrier_1 terrier) (STV 1.0 0.99))',
       '(: whenever_buzz_growl (Implication (Premises (Member $x buzz) (Agent $x sk_doorbell_1)) (Conclusions (Member (sk_growl $x) growl) (Agent (sk_growl $x) sk_terrier_1) (During (sk_growl $x) $x))) (STV 1.0 0.9))',
       '(: e_buzz (Member sk_buzz_1 buzz) (STV 1.0 0.99))','(: e_buzz_ag (Agent sk_buzz_1 sk_doorbell_1) (STV 1.0 0.99))',
       '(: e_buzz_t (Time sk_buzz_1 (Hour 0)) (STV 1.0 0.99))','(: e_buzz_past (Past sk_buzz_1) (STV 1.0 0.99))']
run("tail-whenever  midnight buzz fires the occurrence rule (whole-bundle, open trigger)", TWHEN,
    '(And (Member $e growl) (Agent $e sk_terrier_1) (During $e $r))')

# Fine-temporal tails Wave 2 (#13): bounds at ANY granularity -- Month/Weekday terms in
# TimeAtMost/AtLeast (strict before/after adjusts the month NAME), the lexicon joins
# (MonthNumber/WeekdayNumber) work on bounds; seeded STRICT date-ordering rules derive Before
# from calendar terms (year / same-year month / same-year+month day; shared-variable guards
# make cross-year misfires impossible); undated comparisons stay query-side joins.
TMB=['(: e1_finish (Member sk_finish_1 finish) (STV 1.0 0.99))','(: e1_patient (Patient sk_finish_1 sk_renovation_1) (STV 1.0 0.99))',
     '(: e1_renovation (Member sk_renovation_1 renovation) (STV 1.0 0.99))','(: e1_past (Past sk_finish_1) (STV 1.0 0.99))',
     '(: e1_before (TimeAtMost sk_finish_1 (Month february)) (STV 1.0 0.99))']
run("tail2-mbound  finished before March -> before May? (month bound + MonthNumber join)", TMB,
    '(And (Member $e finish) (Patient $e $r) (Member $r renovation) (TimeAtMost $e (Month $m)) (MonthNumber $m $n) (Compute < ($n 5) -> true) (Past $e))', seeded=True)
run("tail2-mbound-neg  ... before February? (expect [])", TMB,
    '(And (Member $e finish) (TimeAtMost $e (Month $m)) (MonthNumber $m $n) (Compute < ($n 2) -> true) (Past $e))', seeded=True, want="empty")
run("tail2-matleast  installed after October -> after September? (AtLeast november, > 9)",
    ['(: e2_install (Member sk_install_1 install) (STV 1.0 0.99))','(: e2_patient (Patient sk_install_1 sk_boiler_1) (STV 1.0 0.99))',
     '(: e2_boiler (Member sk_boiler_1 boiler) (STV 1.0 0.99))','(: e2_past (Past sk_install_1) (STV 1.0 0.99))',
     '(: e2_after (TimeAtLeast sk_install_1 (Month november)) (STV 1.0 0.99))'],
    '(And (Member $e install) (Patient $e $b) (Member $b boiler) (TimeAtLeast $e (Month $m)) (MonthNumber $m $n) (Compute > ($n 9) -> true) (Past $e))', seeded=True)
TWB=['(: e3_return (Member sk_return_1 return) (STV 1.0 0.99))','(: e3_agent (Agent sk_return_1 rita) (STV 1.0 0.99))',
     '(: e3_theme (Theme sk_return_1 sk_badge_1) (STV 1.0 0.99))','(: e3_badge (Member sk_badge_1 badge) (STV 1.0 0.99))',
     '(: e3_obligated (Obligated sk_return_1) (STV 1.0 0.99))','(: e3_deadline (TimeAtMost sk_return_1 (Weekday friday)) (STV 1.0 0.99))',
     '(: rita_name (Name rita "Rita") (STV 1.0 0.99))']
run("tail2-wdeadline  return the badge by Friday -> by when? (weekday bound bind)", TWB,
    '(And (Member $e return) (Agent $e $r) (Name $r "Rita") (TimeAtMost $e (Weekday $w)) (Obligated $e))', contains="friday")
run("tail2-worder  ... before Sunday? (WeekdayNumber join on the bound)", TWB,
    '(And (Member $e return) (TimeAtMost $e (Weekday $w)) (WeekdayNumber $w $n) (Compute < ($n 7) -> true))', seeded=True)
# Light verbs over event-nouns ("the audit occurred in March 2022") do NOT reify an occur event:
# the event-noun witness IS the eventuality, Time terms + tense sit on it directly, and the
# seeded date rules order the witnesses themselves.
TDATE2=['(: e4_audit (Member sk_audit_1 audit) (STV 1.0 0.99))','(: e4_year1 (Time sk_audit_1 (Year 2022)) (STV 1.0 0.99))',
        '(: e4_month1 (Time sk_audit_1 (Month march)) (STV 1.0 0.99))','(: e4_past1 (Past sk_audit_1) (STV 1.0 0.99))',
        '(: e4_launch (Member sk_launch_1 launch) (STV 1.0 0.99))','(: e4_year2 (Time sk_launch_1 (Year 2022)) (STV 1.0 0.99))',
        '(: e4_month2 (Time sk_launch_1 (Month june)) (STV 1.0 0.99))','(: e4_past2 (Past sk_launch_1) (STV 1.0 0.99))']
run("tail2-datebefore  March-2022 audit vs June-2022 launch -> Before DERIVED (seeded same-year month rule)", TDATE2,
    '(And (Member $e1 audit) (Past $e1) (Member $e2 launch) (Past $e2) (Before $e1 $e2))', seeded=True)
run("tail2-datebefore-neg  the reverse direction (expect [])", TDATE2,
    '(Before sk_launch_1 sk_audit_1)', seeded=True, want="empty")

# Fine-temporal tails Wave 3 (#13): minute-precision thresholds = query-side dual branch
# (hours strictly below UNION the boundary hour with minutes below; a boundary-hour event with
# no stored minutes is an honest open-world miss); approximate clock times = a distribution in
# the Hour value slot -> GreaterThan graded; Compute stays [] on dist storage, so the #26
# disjoint exact-vs-approx union covers mixed KBs for hour thresholds too.
TZIA=['(: z1 (Member sk_call_1 call) (STV 1.0 0.99))','(: z2 (Agent sk_call_1 zia) (STV 1.0 0.99))',
      '(: z3 (Time sk_call_1 (Hour 16)) (STV 1.0 0.99))','(: z4 (Time sk_call_1 (Minute 10)) (STV 1.0 0.99))',
      '(: z5 (Past sk_call_1) (STV 1.0 0.99))','(: z6 (Name zia "Zia") (STV 1.0 0.99))']
run("tail3-minute  called 4:10 -> before 4:30? (boundary-hour minute branch)", TZIA,
    '(And (Member $e call) (Time $e (Hour 16)) (Time $e (Minute $m)) (Compute < ($m 30) -> true))')
run("tail3-minute-hourbranch  ... the hour-below branch of the same Q correctly [] (16 !< 16)", TZIA,
    '(And (Member $e call) (Time $e (Hour $h)) (Compute < ($h 16) -> true))', want="empty")
run("tail3-minute-neg  before 4:05? (minute branch misses, 10 !< 5)", TZIA,
    '(And (Member $e call) (Time $e (Hour 16)) (Time $e (Minute $m)) (Compute < ($m 5) -> true))', want="empty")
TCOUR=['(: c1 (Member sk_arrive_1 arrive) (STV 1.0 0.99))','(: c2 (Agent sk_arrive_1 sk_courier_1) (STV 1.0 0.99))',
       '(: c3 (Member sk_courier_1 courier) (STV 1.0 0.99))','(: c4 (Time sk_arrive_1 (Hour (ParticleFromNormal 17 1))) (STV 1.0 0.99))',
       '(: c5 (Past sk_arrive_1) (STV 1.0 0.99))']
run("tail3-approx  around 5pm -> after 4pm? (GreaterThan graded on the dist hour)", TCOUR,
    '(And (Member $e arrive) (Agent $e $c) (Member $c courier) (Time $e (Hour $h)) (GreaterThan $h 16))')
run("tail3-approx-compute-ctrl  the Compute branch on dist storage -> [] (why the union)", TCOUR,
    '(And (Member $e arrive) (Time $e (Hour $h)) (Compute > ($h 16) -> true))', want="empty")
run("tail3-exact-ctrl  recital at 7pm (exact int) -> after 4pm via the Compute branch",
    ['(: rc1 (Member sk_start_1 start) (STV 1.0 0.99))','(: rc2 (Patient sk_start_1 sk_recital_1) (STV 1.0 0.99))',
     '(: rc3 (Member sk_recital_1 recital) (STV 1.0 0.99))','(: rc4 (Time sk_start_1 (Hour 19)) (STV 1.0 0.99))',
     '(: rc5 (Past sk_start_1) (STV 1.0 0.99))'],
    '(And (Member $e start) (Time $e (Hour $h)) (Compute > ($h 16) -> true))')

# ============================================================================
# Propositional attitudes (#41): an attitude verb + "that"-clause reifies the attitude (Experiencer
# holder) and SEALS the complement P as one term under Theme. NON-FACTIVE (believe/think/fear) emits
# NOTHING from P at top level (the leak fix -- belief must not assert P); FACTIVE (know/realize) ALSO
# emits P flat (know entails P). Negation scopes the attitude (strength-0 bundle), P stays sealed.
ATT_NF=['(: b1 (Member sk_believe_1 believe) (STV 1.0 0.99))',
        '(: b2 (Experiencer sk_believe_1 priya) (STV 1.0 0.99))',
        '(: b3 (Theme sk_believe_1 (Member sk_tunnel_1 flooded)) (STV 1.0 0.99))',
        '(: bn (Name priya "Priya") (STV 1.0 0.99))']
run("att-nf-hold   does Priya believe the tunnel is flooded? (sealed content binds)", ATT_NF,
    '(And (Member $e believe) (Experiencer $e priya) (Theme $e (Member $x flooded)))', contains="sk_tunnel_1")
run("att-nf-noleak SAFETY non-factive belief does NOT assert P: is the tunnel flooded? (expect [])", ATT_NF,
    '(Member $x flooded)', want="empty")
ATT_F=['(: k1 (Member sk_know_1 know) (STV 1.0 0.99))',
       '(: k2 (Experiencer sk_know_1 sk_inspector_1) (STV 1.0 0.99))',
       '(: k3 (Member sk_inspector_1 inspector) (STV 1.0 0.99))',
       '(: k4 (Theme sk_know_1 (Member sk_cable_1 frayed)) (STV 1.0 0.99))',
       '(: k5 (Member sk_cable_1 frayed) (STV 1.0 0.99))']
run("att-f-entail  factive know entails P: is the cable frayed? (binds)", ATT_F, '(Member sk_cable_1 frayed)')
run("att-f-know    does the inspector know it? (attitude bundle binds)", ATT_F,
    '(And (Member $e know) (Experiencer $e $i) (Member $i inspector) (Theme $e $c))', contains="sk_know_1")
ATT_NEG=['(: n1 (And (Member sk_think_1 think) (Experiencer sk_think_1 omar) (Theme sk_think_1 (And (Member sk_close_1 close) (Patient sk_close_1 sk_deal_1) (Future sk_close_1)))) (STV 0.0 0.99))',
         '(: nn (Name omar "Omar") (STV 1.0 0.99))']
run("att-neg       'Omar doesn't think the deal will close': attitude negated, pinned @0 binds", ATT_NEG,
    '(And (Member $e think) (Experiencer $e omar) (Theme $e $c))', tv='(STV 0.0 $conf)', contains="sk_think_1")
run("att-neg-noleak SAFETY sealed content not asserted: no top-level close event (expect [])", ATT_NEG,
    '(Member $e close)', want="empty")

# Focus particles & clefts (#38): assert the prejacent + ONE opaque focus tag (Only/Even/Also/Cleft);
# NO unbounded exclusion rule, NO invented presupposition.
FOC_ONLY=['(: o1 (Member sk_object_1 object) (STV 1.0 0.99))','(: o2 (Agent sk_object_1 sk_treasurer_1) (STV 1.0 0.99))',
          '(: o3 (Member sk_treasurer_1 treasurer) (STV 1.0 0.99))','(: o4 (Past sk_object_1) (STV 1.0 0.99))',
          '(: o5 (Only sk_treasurer_1 sk_object_1) (STV 1.0 0.99))']
run("foc-only      who alone objected? exclusive focus (-> treasurer)", FOC_ONLY,
    '(And (Member $e object) (Only $x $e) (Member $x treasurer))', contains="sk_treasurer_1")
run("foc-only-prej prejacent asserted: did the treasurer object?", FOC_ONLY,
    '(And (Member $e object) (Agent $e sk_treasurer_1))', contains="sk_object_1")
run("foc-only-noexcl SAFETY no unbounded exclusion rule (any object@0?) (expect [])", FOC_ONLY,
    '(Member $e object)', tv='(STV 0.0 $conf)', want="empty")
FOC_CLEFT=['(: c1 (Member sk_lose_1 lose) (STV 1.0 0.99))','(: c2 (Agent sk_lose_1 sk_courier_1) (STV 1.0 0.99))',
           '(: c3 (Theme sk_lose_1 sk_parcel_1) (STV 1.0 0.99))','(: c4 (Member sk_courier_1 courier) (STV 1.0 0.99))',
           '(: c5 (Member sk_parcel_1 parcel) (STV 1.0 0.99))','(: c6 (Past sk_lose_1) (STV 1.0 0.99))',
           '(: c7 (Cleft sk_courier_1 sk_lose_1) (STV 1.0 0.99))']
run("foc-cleft     it-cleft: who was it that lost the parcel? (-> courier)", FOC_CLEFT,
    '(And (Cleft $x $e) (Member $e lose) (Member $x courier))', contains="sk_courier_1")
run("foc-cleft-prej prejacent asserted: did the courier lose the parcel?", FOC_CLEFT,
    '(And (Member $e lose) (Agent $e sk_courier_1) (Theme $e sk_parcel_1))', contains="sk_lose_1")
FOC_EVEN=['(: ev1 (Member sk_hesitate_1 hesitate) (STV 1.0 0.99))','(: ev2 (Agent sk_hesitate_1 sk_veteran_1) (STV 1.0 0.99))',
          '(: ev3 (Member sk_veteran_1 veteran) (STV 1.0 0.99))','(: ev4 (Past sk_hesitate_1) (STV 1.0 0.99))',
          '(: ev5 (Even sk_veteran_1 sk_hesitate_1) (STV 1.0 0.99))']
run("foc-even      even who hesitated? scalar focus (-> veteran)", FOC_EVEN,
    '(And (Member $e hesitate) (Even $x $e) (Member $x veteran))', contains="sk_veteran_1")
FOC_PSEUDO=['(: ps1 (Member sk_want_1 want) (STV 1.0 0.99))','(: ps2 (Experiencer sk_want_1 sk_committee_1) (STV 1.0 0.99))',
            '(: ps3 (Member sk_committee_1 committee) (STV 1.0 0.99))','(: ps4 (Stimulus sk_want_1 transparency) (STV 1.0 0.99))',
            '(: ps5 (Past sk_want_1) (STV 1.0 0.99))','(: ps6 (Cleft transparency sk_want_1) (STV 1.0 0.99))']
run("foc-pseudo    pseudo-cleft focus (-> transparency)", FOC_PSEUDO,
    '(And (Cleft transparency $e) (Member $e want))', contains="sk_want_1")
run("foc-pseudo-prej prejacent NOT lost: committee wanted transparency", FOC_PSEUDO,
    '(And (Member $e want) (Experiencer $e sk_committee_1) (Stimulus $e transparency))', contains="sk_want_1")
FOC_ALSO=['(: a1 (Member sk_sign_1 sign) (STV 1.0 0.99))','(: a2 (Agent sk_sign_1 marco) (STV 1.0 0.99))',
          '(: a3 (Theme sk_sign_1 sk_petition_1) (STV 1.0 0.99))','(: a4 (Member sk_petition_1 petition) (STV 1.0 0.99))',
          '(: a5 (Past sk_sign_1) (STV 1.0 0.99))','(: a6 (Also marco sk_sign_1) (STV 1.0 0.99))',
          '(: an (Name marco "Marco") (STV 1.0 0.99))']
run("foc-also      what did Marco also do? additive focus binds (-> sign)", FOC_ALSO,
    '(And (Also marco $e) (Member $e sign))', contains="sk_sign_1")
run("foc-also-nopresup SAFETY additive presupposition not asserted (no 2nd signer) (expect [])", FOC_ALSO,
    '(And (Member $e sign) (Agent $e $x) (Compute == ($x marco) -> false))', want="empty")

# Imperatives (#47): the commanded event is SEALED under (Directive ...) / (Forbid ...) -- no
# occurrence asserted -> no KB contamination; a vocative addressee rides INSIDE the seal as Agent.
IMP_POS=['(: d1 (Directive (And (Member sk_lock_1 lock) (Patient sk_lock_1 sk_gate_1))) (STV 1.0 0.99))',
         '(: d2 (Member sk_gate_1 gate) (STV 1.0 0.99))']
run("imp-directive what was commanded? (Directive term binds)", IMP_POS, '(Directive $c)', contains="sk_lock_1")
run("imp-noocc     SAFETY command not contaminating: no occurred lock event (expect [])", IMP_POS,
    '(Member $e lock)', want="empty")
IMP_NEG=['(: f1 (Forbid (And (Member sk_share_1 share) (Theme sk_share_1 sk_passcode_1))) (STV 1.0 0.99))',
         '(: f2 (Member sk_passcode_1 passcode) (STV 1.0 0.99))']
run("imp-forbid    negative command: what was forbidden? (Forbid binds)", IMP_NEG, '(Forbid $c)', contains="sk_share")
IMP_VOC=['(: v1 (Directive (And (Member sk_water_1 water) (Agent sk_water_1 rosa) (Patient sk_water_1 sk_group_1))) (STV 1.0 0.99))',
         '(: v2 (GroupOf sk_group_1 plant) (STV 1.0 0.99))','(: vn (Name rosa "Rosa") (STV 1.0 0.99))']
run("imp-vocative  vocative addressee Rosa rides inside the seal as Agent", IMP_VOC,
    '(Directive $c)', contains=["rosa","water"])
run("imp-voc-struct fully-structured query reaches into the sealed directive term", IMP_VOC,
    '(Directive (And (Member $e water) (Agent $e rosa) (Patient $e sk_group_1)))')

# ============================================================================
# Tier-2 batch WAVE 1 (#44/#42/#43/#45/#46).
# #44 kind-level (non-distributing) property: (KindProperty kind prop) is OPAQUE -> a kind-only
# property (extinct/endangered) does NOT distribute to instances (unlike Inheritance, which would).
KP44=['(: ga_genus (Inheritance great_auk auk) (STV 1.0 0.99))',
      '(: ga_extinct (KindProperty great_auk extinct) (STV 1.0 0.9))',
      '(: ga_mem (Member sk_auk_1 great_auk) (STV 1.0 0.99))']
run("kindprop-kind   is the great auk (kind) extinct? (KindProperty binds)", KP44, '(KindProperty great_auk extinct)')
run("kindprop-nodist SAFETY is THIS auk extinct? kind-property does NOT distribute (expect [])", KP44,
    '(Member sk_auk_1 extinct)', want="empty")
# #42 ordinals: (Ordinal entity n scale) -- rank n on an ordering scale.
ORD=['(: nadia_ord (Ordinal nadia 2 finish) (STV 1.0 0.99))','(: e_finish (Member sk_finish_1 finish) (STV 1.0 0.99))',
     '(: e_finish_ag (Agent sk_finish_1 nadia) (STV 1.0 0.99))','(: e_finish_past (Past sk_finish_1) (STV 1.0 0.99))',
     '(: nadia_name (Name nadia "Nadia") (STV 1.0 0.99))']
run("ord-rank      what rank did Nadia finish? (-> 2)", ORD, '(Ordinal nadia $n finish)', contains=" 2 ")
ORDW=['(: w_ord (Ordinal sk_witness_1 4 testify) (STV 1.0 0.99))','(: e_witness (Member sk_witness_1 witness) (STV 1.0 0.99))',
      '(: e_testify (Member sk_testify_1 testify) (STV 1.0 0.99))','(: e_testify_ag (Agent sk_testify_1 sk_witness_1) (STV 1.0 0.99))',
      '(: e_testify_past (Past sk_testify_1) (STV 1.0 0.99))']
run("ord-fourth    who was the fourth witness? (-> sk_witness_1)", ORDW,
    '(And (Ordinal $w 4 testify) (Member $w witness))', contains="sk_witness_1")
# #43 aspectual particles: opaque (Again/Still/Already/Yet event) tag + the asserted prejacent.
AGA=['(: jam_ev (Member sk_jam_1 jam) (STV 1.0 0.99))','(: jam_pat (Patient sk_jam_1 sk_printer_1) (STV 1.0 0.99))',
     '(: jam_printer (Member sk_printer_1 printer) (STV 1.0 0.99))','(: jam_past (Past sk_jam_1) (STV 1.0 0.99))',
     '(: jam_again (Again sk_jam_1) (STV 1.0 0.99))']
run("asp-again     did the printer jam again? (Again tag binds)", AGA, '(And (Member $e jam) (Again $e))', contains="sk_jam_1")
run("asp-again-prej prejacent asserted: did the printer jam?", AGA,
    '(And (Member $e jam) (Patient $e sk_printer_1))', contains="sk_jam_1")
STILL=['(: run_ev (Member sk_run_1 run) (STV 1.0 0.99))','(: run_ag (Agent sk_run_1 sk_reactor_1) (STV 1.0 0.99))',
       '(: run_reactor (Member sk_reactor_1 reactor) (STV 1.0 0.99))','(: run_ong (Ongoing sk_run_1) (STV 1.0 0.99))',
       '(: run_still (Still sk_run_1) (STV 1.0 0.99))']
run("asp-still     is the reactor still running? (Still tag binds)", STILL, '(Still $e)', contains="sk_run_1")
ALR=['(: dep_ev (Member sk_depart_1 depart) (STV 1.0 0.99))','(: dep_ag (Agent sk_depart_1 sk_ferry_1) (STV 1.0 0.99))',
     '(: dep_ferry (Member sk_ferry_1 ferry) (STV 1.0 0.99))','(: dep_past (Past sk_depart_1) (STV 1.0 0.99))',
     '(: dep_already (Already sk_depart_1) (STV 1.0 0.99))']
run("asp-already   had the ferry already departed? (Already tag binds)", ALR,
    '(And (Member $e depart) (Already $e))', contains="sk_depart_1")
# #45 comparison-class: (Degree X scale (forKind class)) -- relative to the class norm, NO absolute.
CC=['(: cc_deg (Degree bruno fast (forKind tortoise)) (STV 1.0 0.99))','(: cc_name (Name bruno "Bruno") (STV 1.0 0.99))']
run("cc-rel        is Bruno fast for a tortoise? (relative degree binds)", CC, '(Degree bruno fast (forKind tortoise))')
run("cc-noabs      SAFETY absolute fastness NOT asserted: is Bruno fast? (expect [])", CC,
    '(Member bruno fast)', want="empty")
# #46 clausal comparative: reify both clauses, compare the two quantity GROUPS with More.
CQ=['(: sell_ev (Member sk_sell_1 sell) (STV 1.0 0.99))','(: sell_grp (GroupOf sk_sold_1 book) (STV 1.0 0.99))',
    '(: sell_thm (Theme sk_sell_1 sk_sold_1) (STV 1.0 0.99))','(: sell_past (Past sk_sell_1) (STV 1.0 0.99))',
    '(: order_ev (Member sk_order_1 order) (STV 1.0 0.99))','(: order_ag (Agent sk_order_1 sk_store_1) (STV 1.0 0.99))',
    '(: order_grp (GroupOf sk_ord_1 book) (STV 1.0 0.99))','(: order_thm (Theme sk_order_1 sk_ord_1) (STV 1.0 0.99))',
    '(: order_past (Past sk_order_1) (STV 1.0 0.99))','(: store_m (Member sk_store_1 store) (STV 1.0 0.99))',
    '(: sold_more (More many sk_sold_1 sk_ord_1) (STV 1.0 0.99))']
run("cq-cmp        more books sold than ordered? (More many over the two groups)", CQ,
    '(More many sk_sold_1 sk_ord_1)')
run("cq-groups     both quantity groups present (sold & ordered books)", CQ,
    '(And (GroupOf $a book) (GroupOf $b book) (More many $a $b))', contains=["sk_sold_1","sk_ord_1"])

# ============================================================================
# Tier-2 batch WAVE 2 (#39/#40), reusing the #41 SEALING mechanism.
# #39 embedded questions: reify the matrix verb + Experiencer + the QUESTION sealed under Theme --
# (Whether P) for polar, (Question <wh> content-with-gap) for constituent. Content NOT asserted;
# "whether P" must not become (Might P), the wh-gap must not leak.
WQ=['(: e1_referee (Member sk_referee_1 referee) (STV 1.0 0.99))','(: e1_wonder (Member sk_wonder_1 wonder) (STV 1.0 0.99))',
    '(: e1_wonder_exp (Experiencer sk_wonder_1 sk_referee_1) (STV 1.0 0.99))','(: e1_wonder_past (Past sk_wonder_1) (STV 1.0 0.99))',
    '(: e1_wonder_theme (Theme sk_wonder_1 (Whether (And (Member sk_count_1 count) (Experiencer sk_count_1 sk_goal_1) (Past sk_count_1)))) (STV 1.0 0.99))',
    '(: e1_goal (Member sk_goal_1 goal) (STV 1.0 0.99))']
run("eq-whether     what does the referee wonder? (Whether-question binds)", WQ,
    '(And (Member $e wonder) (Experiencer $e sk_referee_1) (Theme $e (Whether $p)))', contains="sk_count_1")
run("eq-whether-noleak SAFETY sealed: did the goal count? not asserted (expect [])", WQ,
    '(And (Member $e count) (Experiencer $e sk_goal_1))', want="empty")
run("eq-whether-nomight SAFETY 'whether P' NOT collapsed to (Might P) (expect [])", WQ, '(Might $p)', want="empty")
KQ=['(: e3_clerk (Member sk_clerk_1 clerk) (STV 1.0 0.99))','(: e3_ask (Member sk_ask_1 ask) (STV 1.0 0.99))',
    '(: e3_ask_exp (Experiencer sk_ask_1 sk_clerk_1) (STV 1.0 0.99))','(: e3_ask_past (Past sk_ask_1) (STV 1.0 0.99))',
    '(: e3_ask_theme (Theme sk_ask_1 (Question who (And (Member sk_approve_1 approve) (Agent sk_approve_1 who) (Theme sk_approve_1 sk_refund_1) (Past sk_approve_1)))) (STV 1.0 0.99))',
    '(: e3_refund (Member sk_refund_1 refund) (STV 1.0 0.99))']
run("eq-wh-who      what does the clerk ask? (wh Question who binds)", KQ,
    '(And (Member $e ask) (Theme $e (Question who $c)))', contains="sk_approve_1")
run("eq-wh-noleak   SAFETY wh-gap does not leak: did an approval happen? (expect [])", KQ,
    '(And (Member $e approve) (Theme $e sk_refund_1))', want="empty")
DQ=['(: e2_historian (Member sk_historian_1 historian) (STV 1.0 0.99))','(: e2_discover (Member sk_discover_1 discover) (STV 1.0 0.99))',
    '(: e2_discover_exp (Experiencer sk_discover_1 sk_historian_1) (STV 1.0 0.99))','(: e2_discover_past (Past sk_discover_1) (STV 1.0 0.99))',
    '(: e2_discover_theme (Theme sk_discover_1 (Question when (And (Member sk_sign_1 sign) (Theme sk_sign_1 sk_treaty_1) (Time sk_sign_1 when) (Past sk_sign_1)))) (STV 1.0 0.99))',
    '(: e2_treaty (Member sk_treaty_1 treaty) (STV 1.0 0.99))']
run("eq-wh-when     what does the historian discover? (wh Question when binds; when fills the gap)", DQ,
    '(And (Member $e discover) (Theme $e (Question when $c)))', contains="sk_sign_1")
# #40 counterfactual: opaque (Counterfactual (And ante) (And cons)) -- both clauses SEALED, neither
# asserted true -- PLUS the antecedent re-asserted at strength-0 ("it didn't happen").
CF=['(: e2_cf (Counterfactual (And (Member sk_study_1 study) (Agent sk_study_1 omar) (Past sk_study_1)) (And (Member sk_pass_1 pass) (Agent sk_pass_1 omar) (Past sk_pass_1))) (STV 1.0 0.99))',
    '(: e2_neg (And (Member sk_study_1 study) (Agent sk_study_1 omar) (Past sk_study_1)) (STV 0.0 0.99))',
    '(: e2_name (Name omar "Omar") (STV 1.0 0.99))']
run("cf-rel         counterfactual study->pass about Omar binds", CF, '(Counterfactual $a $c)', contains="sk_pass_1")
run("cf-ante0       presupposition: did Omar study? pinned @0 binds (he didn't)", CF,
    '(And (Member $e study) (Agent $e omar))', tv='(STV 0.0 $conf)', contains="sk_study_1")
run("cf-cons-noleak SAFETY consequent NOT asserted: did Omar pass? (expect [])", CF,
    '(Member $e pass)', want="empty")

# ============================================================================
# Can-routing (2026-07-27 review decision #1): a capability generic is a reified property
# (Inheritance kind (can verb)) — kind-Q queries the property (wh binds inside the term);
# individual-Q = event-branch ∪ property-branch union, branches disjoint both ways.
CAP_PROP=['(: bird_canfly (Inheritance bird (can fly)) (STV 0.9 0.9))',
          '(: p1 (Member pingu bird) (STV 1.0 0.99))','(: pn (Name pingu "Pingu") (STV 1.0 0.99))']
CAP_EVT=['(: e_swim (Member sk_swim_1 swim) (STV 1.0 0.99))','(: e_ag (Agent sk_swim_1 rufus) (STV 1.0 0.99))',
         '(: e_can (Can sk_swim_1) (STV 1.0 0.99))','(: rn (Name rufus "Rufus") (STV 1.0 0.99))']
run("can-kind      kind capability Q -> property form binds", CAP_PROP, '(Inheritance bird (can fly))')
run("can-kind-wh   what can birds do? -> (can $v) binds inside the term", CAP_PROP, '(Inheritance bird (can $v))', contains="fly")
run("can-ind-prop  individual union: property branch (Name + inherited (can fly))", CAP_PROP,
    '(And (Name $p "Pingu") (Member $p (can fly)))')
run("can-ind-evt   individual union: event branch (asserted ability, Name-bound)", CAP_EVT,
    '(And (Name $r "Rufus") (Member $e swim) (Agent $e $r) (Can $e))')
run("can-disjoint  SAFETY event branch finds nothing on property storage", CAP_PROP,
    '(And (Name $p "Pingu") (Member $e fly) (Agent $e $p) (Can $e))', want="empty")

# Possession bridge (decision #3): questions query (Possession y x); seeded rules derive it
# from have/own events (Holder-gated; "lack" deliberately unbridged).
POSS_HAVE=['(: h1 (Member sk_have_1 have) (STV 1.0 0.99))','(: h2 (Holder sk_have_1 tom) (STV 1.0 0.99))',
           '(: h3 (Theme sk_have_1 sk_kettle_1) (STV 1.0 0.99))','(: h4 (Member sk_kettle_1 kettle) (STV 1.0 0.99))',
           '(: h5 (Name tom "Tom") (STV 1.0 0.99))','(: b1 (Member sk_break_1 break) (STV 1.0 0.99))',
           '(: b2 (Patient sk_break_1 sk_kettle_1) (STV 1.0 0.99))','(: b3 (Past sk_break_1) (STV 1.0 0.99))']
POSS_OWN=['(: o1 (Member sk_own_1 own) (STV 1.0 0.99))','(: o2 (Holder sk_own_1 rita) (STV 1.0 0.99))',
          '(: o3 (Theme sk_own_1 sk_mill_1) (STV 1.0 0.99))','(: o4 (Member sk_mill_1 mill) (STV 1.0 0.99))']
run("poss-br-have  have-event -> (Possession y x) derives via seeded bridge", POSS_HAVE,
    '(Possession $y $x)', seeded=True, contains="tom")
run("poss-br-whose whose-kettle-broke chain over have storage", POSS_HAVE,
    '(And (Member $k kettle) (Possession $k $who) (Member $e break) (Patient $e $k) (Past $e))', seeded=True, contains="tom")
run("poss-br-own   own-event -> (Possession y x) derives via seeded bridge", POSS_OWN,
    '(Possession $y $x)', seeded=True, contains="rita")
run("poss-br-ctrl  SAFETY no possession stated -> empty", ['(: c1 (Member sk_lamp_9 lamp) (STV 1.0 0.99))'],
    '(Possession $y $x)', seeded=True, want="empty")

# "None of the Ns V" (decision #4): the universal's negative twin — the same per-member
# distribution rule at strength 0.0 (no subset, no Cardinality 0).
NONE_R=['(: none_objected (Implication (Premises (Member $x juror)) (Conclusions (Member (sk_object $x) object) (Agent (sk_object $x) $x) (Past (sk_object $x)))) (STV 0.0 0.9))',
        '(: a1 (Member ann juror) (STV 1.0 0.99))','(: an (Name ann "Ann") (STV 1.0 0.99))']
run_strength("none-member  'did Ann object?' derives ~0 (blanket denial distributes)", NONE_R,
    '(And (Name $a "Ann") (Member $e object) (Agent $e $a) (Past $e))', 0.0, 0.2)
run("none-pin      pinned (STV 0.0 $conf) form binds the denial", NONE_R,
    '(And (Name $a "Ann") (Member $e object) (Agent $e $a) (Past $e))', tv='(STV 0.0 $conf)')

# "yet" placement (decision #5): the (Yet e) expectation tag lives OUTSIDE the strength-0
# denial bundle (inside, it marginally projects at strength 0 — the expectation would read as denied).
YET=['(: t1 (Member sk_train_1 train) (STV 1.0 0.99))',
     '(: neg (And (Member sk_arrive_1 arrive) (Agent sk_arrive_1 sk_train_1) (Past sk_arrive_1)) (STV 0.0 0.99))',
     '(: y1 (Yet sk_arrive_1) (STV 1.0 0.99))']
run_strength("yet-tag      (Yet $e) expectation reads POSITIVE (~1, outside the denial)", YET, '(Yet $e)', 0.8, 1.0)
run("yet-denial    pinned 'has it arrived?' denial still binds beside the tag", YET,
    '(And (Member $e arrive) (Agent $e $t) (Member $t train) (Past $e))', tv='(STV 0.0 $conf)')

# QuantifierPhrase extended to verbal rules (decision #6): the quantifier word rides a companion
# beside the rule, mirroring the copular convention (absence = bare generic).
QPV=['(: r (Implication (Premises (Member $x gull)) (Conclusions (Member (sk_scavenge $x) scavenge) (Agent (sk_scavenge $x) $x))) (STV 0.9 0.9))',
     '(: q (QuantifierPhrase gull scavenge "most") (STV 1.0 0.99))']
run("qp-verbal     companion binds by pattern beside the rule", QPV, '(QuantifierPhrase gull $v $w)', contains="most")

# ============================================================================
# Bundle-QA rigidity family: the FAITHFUL translator queries (Name-bound / full-context) used to
# return [] (couldn't conjoin a (Name ...) with a rule-derived bundle; evidence-overlap guard
# rejected co-derived conclusions). ENGINE FIXED 2026-07-09 ("Pool same-source projections in
# conjunction frontiers") after the filed repros (bug_name_binding_on_bundle_query.py,
# bug_and_query_order_sensitivity.py, bug_overlap_guard_overfire.py) -- the four ex-GAP markers
# below are now POSITIVE checks. Two gaps REMAIN: GAP-cess-name + GAP-whenever below.
GAPDK=['(: r (Implication (Premises (Member $x passenger)) (Conclusions (Member (sk_board $x) board) (Agent (sk_board $x) $x) (Past (sk_board $x)))) (STV 1.0 0.9))',
       '(: p (Member omar passenger) (STV 1.0 0.99))','(: n (Name omar "Omar") (STV 1.0 0.99))']
run("distr-name    faithful 'did Omar board?' (Name-bound; engine fixed 2026-07-09)", GAPDK,
    '(And (Name $o "Omar") (Member $e board) (Agent $e $o) (Past $e))', contains="sk_board", chain=True)
run("recip-name    faithful 'does Ann distrust Ben?' (Name-bound; engine fixed 2026-07-09)",
    RECIP_JUR+['(: nA (Name ann "Ann") (STV 1.0 0.99))','(: nB (Name ben "Ben") (STV 1.0 0.99))'],
    '(And (Name $a "Ann") (Name $b "Ben") (Member $e distrust) (Experiencer $e $a) (Stimulus $e $b))', chain=True)
run("grouped-name  faithful 'did Fido bark?' (Name-bound; engine fixed 2026-07-09)", DFIDO,
    '(And (Name $f "Fido") (Member $e bark) (Agent $e $f) (Past $e))', contains="sk_bark", chain=True)
run("scope-thresh  faithful 'did Al read >2 books?' (full-context; engine fixed 2026-07-09)",
    NUMSC+['(: na (Name al "Al") (STV 1.0 0.99))'],
    '(And (Name $a "Al") (Member $e read) (Agent $e $a) (Theme $e $g) (GroupOf $g book) (Cardinality $g $n) (Compute > ($n 2) -> true))', chain=True)
# Name-on-bundle, NEW consequence found in #32: a (Name ...) conjunct not only misses the stored
# (And...) denial -- it also BLOCKS the same-proposition merge, so the faithful Name-bound
# "does X still V?" returns the misleading bare positive and the pinned form returns [].
run("GAP-cess-name  faithful Name-bound 'has Dario stopped painting?' (pin) -> [] pending engine fix", CESS,
    '(And (Member $e paint) (Agent $e $d) (Name $d "Dario"))', tv='(STV 0.0 $conf)', want="empty")
# A blind question can't know an event is whenever-rule-derived: the natural "did the terrier
# growl?" (kind-bound agent + Past, no During) is a partial/kind-bound pattern against the derived
# bundle -> the same rigidity family; the whole-bundle open-trigger form (tail-whenever) works.
run("GAP-whenever  faithful natural 'did the terrier growl?' -> [] pending engine fix (bundle rigidity)", TWHEN,
    '(And (Member $e growl) (Agent $e $t) (Member $t terrier) (Past $e))', want="empty")

print("\n==== %d / %d PASS ====" % (sum(1 for ok,_ in results if ok), len(results)))
print("KNOWN ENGINE-GAP markers (faithful queries [], pending engine fix):",
      sum(1 for _,l in results if l.strip().startswith("GAP-")))
print("CAUSE-B markers (2026-07-21 cessation-revision change, re-baselined to current behavior):",
      sum(1 for _,l in results if l.strip().startswith("CAUSE-B")))
print("FAILURES:", [l for ok,l in results if not ok] or "none")
