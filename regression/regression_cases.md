# Regression cases — NL → PeTTaChainer logic (Maximal neo-Davidsonian)

Golden `sentence → expected atoms` pairs for the translator driven by `prompt.txt`.

## How to run (manual / judge-driven)

1. Spawn a Sonnet translator that reads the current `prompt.txt` as its only instructions.
2. Feed each NL input below, independently.
3. Compare each output to Expected **semantically**:
   - **Categorical**: check relation (`Member`/`Inheritance`), args, and STV.
   - **Events**: check the event **class** `(Member e <verb>)`, the **role** atoms, and the
     **status** atoms (`Past`/`Ongoing`/`Can`/…). **Ignore** the event/witness symbol
     (`sk_<verb>_<n>`, `(sk_<verb> $x)`) and proof-names — they may differ in a passing run.
   - **Queries**: check the conjuncts and variable placement; `$prf`/`$tv` names are immaterial.
4. (Optional) load the produced atoms into the chainer to catch malformed output and run the
   paired query; `e2e_regression.py` exercises the full NL→atoms→chainer→answer path for a
   representative subset.

Coreference cases are **passages** (multiple sentences) — feed the whole passage at once; the
key check is that coreferring mentions (pronoun, "the X", a name, event anaphora) **share one
symbol** across sentences (the exact `sk_*` symbol and some role labels may vary).

**Inputs are deliberately NOT the prompt's own examples** — each is structurally parallel to a
`prompt.txt` illustration but lexically different, so a pass reflects the rules generalizing,
not the translator reciting the prompt. Keep it that way: when a convention changes, add a
*new* contrastive sentence rather than copying the prompt's example. Update Expected too.

---

## Categorical (copular: "X is a/an N", "X is ADJ")

**[cat-mem] Grace is a pilot.** — named individual → `Member` + `Name`

    (: grace_is_pilot (Member grace pilot) (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[cat-def] Oaks are trees.** — definitional/taxonomic → 1.0 / 0.99

    (: oak_is_tree (Inheritance oak tree) (STV 1.0 0.99))

**[cat-emp] All lions are fierce.** — empirical universal → confidence 0.9; quantifier word recorded

    (: lions_are_fierce (Inheritance lion fierce) (STV 1.0 0.9))
    (: lions_q (QuantifierPhrase lion fierce "all") (STV 1.0 0.99))

**[cat-generic] Lemons are sour.** — bare generic → strength 0.9, empirical 0.9; NO QuantifierPhrase (its absence marks the bare generic)

    (: lemons_are_sour (Inheritance lemon sour) (STV 0.9 0.9))

**[cat-most] Most athletes are fit.** — graded → strength 0.9 + quantifier word (distinguishes it from a bare generic, which is also 0.9)

    (: most_athletes_fit (Inheritance athlete fit) (STV 0.9 0.9))
    (: athletes_q (QuantifierPhrase athlete fit "most") (STV 1.0 0.99))

**[cat-few] Few volcanoes are active.** — graded → strength 0.1 + quantifier word

    (: few_volcanoes_active (Inheritance volcano active) (STV 0.1 0.9))
    (: volcanoes_q (QuantifierPhrase volcano active "few") (STV 1.0 0.99))

**[cat-no] No square is round.** — strength 0; definitional trait → conf 0.99; "no" is a quantifier → companion (contrast [cat-neg], plain "not", which has none)

    (: square_not_round (Inheritance square round) (STV 0.0 0.99))
    (: square_q (QuantifierPhrase square round "no") (STV 1.0 0.99))

**[cat-neg] Spiders are not insects.** — negation → strength 0; taxonomic → 0.99

    (: spiders_not_insects (Inheritance spider insect) (STV 0.0 0.99))

**[cat-notall] Not all metals are magnetic.** — ¬∀ → counterexample witness

    (: sk_metal_1_metal (Member sk_metal_1 metal) (STV 1.0 0.99))
    (: sk_metal_1_not_magnetic (Member sk_metal_1 magnetic) (STV 0.0 0.99))

**[cat-antonym] Victor is dishonest.** — antonym is a positive property

    (: victor_dishonest (Member victor dishonest) (STV 1.0 0.99))
    (: victor_name (Name victor "Victor") (STV 1.0 0.99))

**[cat-status] Mary must be ill.** — epistemic modality over a copular clause → wrap the atom (0.9)

    (: mary_must_ill (Must (Member mary ill)) (STV 1.0 0.9))
    (: mary_name (Name mary "Mary") (STV 1.0 0.99))

**[cat-past] Tom was nervous.** — tense over a copular clause → wrap the atom

    (: tom_was_nervous (Past (Member tom nervous)) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))

## Events (verbal)

**[ev-intrans] Felix jogs.** — habitual (unmarked status)

    (: e_jog (Member sk_jog_1 jog) (STV 1.0 0.99))
    (: e_agent (Agent sk_jog_1 felix) (STV 1.0 0.99))
    (: felix_name (Name felix "Felix") (STV 1.0 0.99))

**[ev-trans] Nina brews coffee.** — + Patient role

    (: e_brew (Member sk_brew_1 brew) (STV 1.0 0.99))
    (: e_agent (Agent sk_brew_1 nina) (STV 1.0 0.99))
    (: e_patient (Patient sk_brew_1 coffee) (STV 1.0 0.99))
    (: nina_name (Name nina "Nina") (STV 1.0 0.99))

**[ev-ditrans] Tom sent Grace a letter.** — Agent/Recipient/Theme + existential Theme + Past

    (: e_send (Member sk_send_1 send) (STV 1.0 0.99))
    (: e_agent (Agent sk_send_1 tom) (STV 1.0 0.99))
    (: e_recip (Recipient sk_send_1 grace) (STV 1.0 0.99))
    (: e_theme (Theme sk_send_1 sk_letter_1) (STV 1.0 0.99))
    (: e_letter (Member sk_letter_1 letter) (STV 1.0 0.99))
    (: e_past (Past sk_send_1) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[ev-stative] Victor owns a yacht.** — state eventuality: Holder/Theme + existential Theme

    (: e_own (Member sk_own_1 own) (STV 1.0 0.99))
    (: e_holder (Holder sk_own_1 victor) (STV 1.0 0.99))
    (: e_theme (Theme sk_own_1 sk_yacht_1) (STV 1.0 0.99))
    (: e_yacht (Member sk_yacht_1 yacht) (STV 1.0 0.99))
    (: victor_name (Name victor "Victor") (STV 1.0 0.99))

**[ev-state-conn] The trail was icy, so the ranger closed it.** — a predicate-adjective state that is a **connective-atom endpoint** reifies as a state witness with **`Experiencer`** (never `Holder` — that is possession-only) + the flat copular form; the stated connective becomes the surface head (`So`, a coordinator — surface order)

    (: e_icy (Member sk_icy_1 icy) (STV 1.0 0.99))
    (: e_icy_exp (Experiencer sk_icy_1 sk_trail_1) (STV 1.0 0.99))
    (: e_trail (Member sk_trail_1 trail) (STV 1.0 0.99))
    (: e_icy_past (Past sk_icy_1) (STV 1.0 0.99))
    (: e_trail_icy_flat (Past (Member sk_trail_1 icy)) (STV 1.0 0.99))
    (: e_close (Member sk_close_1 close) (STV 1.0 0.99))
    (: e_close_agent (Agent sk_close_1 sk_ranger_1) (STV 1.0 0.99))
    (: e_ranger (Member sk_ranger_1 ranger) (STV 1.0 0.99))
    (: e_close_patient (Patient sk_close_1 sk_trail_1) (STV 1.0 0.99))
    (: e_close_past (Past sk_close_1) (STV 1.0 0.99))
    (: conn (So sk_icy_1 sk_close_1) (STV 1.0 0.99))

**[expletive-it] It rained all afternoon.** — expletive / weather "it" is dropped; the weather predicate is reified **agentless** (no `Agent`/`Experiencer`), carrying its Time and tense

    (: e_rain (Member sk_rain_1 rain) (STV 1.0 0.99))
    (: e_rain_time (Time sk_rain_1 afternoon) (STV 1.0 0.99))
    (: e_rain_past (Past sk_rain_1) (STV 1.0 0.99))

**[ev-past] Leo served lunch yesterday.** — Past + Time role (fine-temporal as a role)

    (: e_serve (Member sk_serve_1 serve) (STV 1.0 0.99))
    (: e_agent (Agent sk_serve_1 leo) (STV 1.0 0.99))
    (: e_theme (Theme sk_serve_1 lunch) (STV 1.0 0.99))
    (: e_past (Past sk_serve_1) (STV 1.0 0.99))
    (: e_time (Time sk_serve_1 yesterday) (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))

**[ev-ongoing] Oscar is running.** — progressive → Ongoing

    (: e_run (Member sk_run_1 run) (STV 1.0 0.99))
    (: e_agent (Agent sk_run_1 oscar) (STV 1.0 0.99))
    (: e_ongoing (Ongoing sk_run_1) (STV 1.0 0.99))
    (: oscar_name (Name oscar "Oscar") (STV 1.0 0.99))

**[ev-can] Grace can speak French.** — capability → Can

    (: e_speak (Member sk_speak_1 speak) (STV 1.0 0.99))
    (: e_agent (Agent sk_speak_1 grace) (STV 1.0 0.99))
    (: e_theme (Theme sk_speak_1 french) (STV 1.0 0.99))
    (: e_can (Can sk_speak_1) (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[ev-epistemic] Oscar might resign.** — epistemic over a verbal clause → Might on the event

    (: e_resign (Member sk_resign_1 resign) (STV 1.0 0.99))
    (: e_agent (Agent sk_resign_1 oscar) (STV 1.0 0.99))
    (: e_might (Might sk_resign_1) (STV 1.0 0.9))
    (: oscar_name (Name oscar "Oscar") (STV 1.0 0.99))

**[ev-deontic] Tom must comply.** — deontic obligation (individual) → Obligated

    (: e_comply (Member sk_comply_1 comply) (STV 1.0 0.99))
    (: e_agent (Agent sk_comply_1 tom) (STV 1.0 0.99))
    (: e_obligated (Obligated sk_comply_1) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))

**[ev-passive] The report was published.** — passive: Patient, no Agent

    (: e_publish (Member sk_publish_1 publish) (STV 1.0 0.99))
    (: e_patient (Patient sk_publish_1 sk_report_1) (STV 1.0 0.99))
    (: e_report (Member sk_report_1 report) (STV 1.0 0.99))
    (: e_past (Past sk_publish_1) (STV 1.0 0.99))

**[ev-neg] Grace didn't sign the contract.** — event negation → strength-0 conjunction

    (: sk_contract_1_contract (Member sk_contract_1 contract) (STV 1.0 0.99))
    (: grace_not_sign (And (Member sk_sign_1 sign) (Agent sk_sign_1 grace) (Patient sk_sign_1 sk_contract_1) (Past sk_sign_1)) (STV 0.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[ev-coagent] The ranger hiked the ridge with Petra.** — comitative "with" (a co-participant) → `CoAgent`, never `Instrument`

    (: e_hike (Member sk_hike_1 hike) (STV 1.0 0.99))
    (: e_agent (Agent sk_hike_1 sk_ranger_1) (STV 1.0 0.99))
    (: e_ranger (Member sk_ranger_1 ranger) (STV 1.0 0.99))
    (: e_theme (Theme sk_hike_1 sk_ridge_1) (STV 1.0 0.99))
    (: e_ridge (Member sk_ridge_1 ridge) (STV 1.0 0.99))
    (: e_coagent (CoAgent sk_hike_1 petra) (STV 1.0 0.99))
    (: e_past (Past sk_hike_1) (STV 1.0 0.99))
    (: petra_name (Name petra "Petra") (STV 1.0 0.99))

**[ev-coagent-together] Elena hiked together with Marco.** — comitative "together **with** NP" is a `CoAgent` phrase (one event, one `Agent`), NOT the bare-"together" collective

    (: e_hike (Member sk_hike_1 hike) (STV 1.0 0.99))
    (: e_agent (Agent sk_hike_1 elena) (STV 1.0 0.99))
    (: e_coagent (CoAgent sk_hike_1 marco) (STV 1.0 0.99))
    (: e_past (Past sk_hike_1) (STV 1.0 0.99))
    (: elena_name (Name elena "Elena") (STV 1.0 0.99))
    (: marco_name (Name marco "Marco") (STV 1.0 0.99))

**[ev-instrument] The ranger split the log with a wedge.** — contrast control: instrumental "with" (a means) stays `Instrument`

    (: e_split (Member sk_split_1 split) (STV 1.0 0.99))
    (: e_agent (Agent sk_split_1 sk_ranger_1) (STV 1.0 0.99))
    (: e_ranger (Member sk_ranger_1 ranger) (STV 1.0 0.99))
    (: e_patient (Patient sk_split_1 sk_log_1) (STV 1.0 0.99))
    (: e_log (Member sk_log_1 log) (STV 1.0 0.99))
    (: e_instr (Instrument sk_split_1 sk_wedge_1) (STV 1.0 0.99))
    (: e_wedge (Member sk_wedge_1 wedge) (STV 1.0 0.99))
    (: e_past (Past sk_split_1) (STV 1.0 0.99))

### Thematic role: Theme vs Patient (#23)

The object role must be the **same** in a statement and its question or the query misses (roles are opaque). Rule: `Patient` only when the action creates / destroys / consumes / physically changes the object; otherwise (acquired / transferred / perceived / evaluated) `Theme`, the default when unclear. These fresh verbs (not in the prompt's lists) check the rule generalizes; each statement/question pair must agree.

**[role-theme-stmt] Maya purchased a bicycle.** — acquire, object unchanged → `Theme`

    (: e_buy (Member sk_purchase_1 purchase) (STV 1.0 0.99))
    (: e_agent (Agent sk_purchase_1 maya) (STV 1.0 0.99))
    (: e_theme (Theme sk_purchase_1 sk_bicycle_1) (STV 1.0 0.99))
    (: e_bike (Member sk_bicycle_1 bicycle) (STV 1.0 0.99))
    (: e_past (Past sk_purchase_1) (STV 1.0 0.99))
    (: maya_name (Name maya "Maya") (STV 1.0 0.99))

**[role-theme-q] What did Maya purchase?** — same verb → same `Theme` role, so the query matches the statement

    (: $prf (And (Name $m "Maya") (Member $e purchase) (Agent $e $m) (Theme $e $what) (Past $e)) $tv)

**[role-eval-stmt] The auditor inspected the ledger.** — evaluate/perceive, object unchanged → `Theme`

    (: e_insp (Member sk_inspect_1 inspect) (STV 1.0 0.99))
    (: e_agent (Agent sk_inspect_1 sk_auditor_1) (STV 1.0 0.99))
    (: e_aud (Member sk_auditor_1 auditor) (STV 1.0 0.99))
    (: e_theme (Theme sk_inspect_1 sk_ledger_1) (STV 1.0 0.99))
    (: e_ledg (Member sk_ledger_1 ledger) (STV 1.0 0.99))
    (: e_past (Past sk_inspect_1) (STV 1.0 0.99))

**[role-patient-stmt] The worker assembled a cabinet.** — creates / physically forms the object → `Patient`

    (: e_asm (Member sk_assemble_1 assemble) (STV 1.0 0.99))
    (: e_agent (Agent sk_assemble_1 sk_worker_1) (STV 1.0 0.99))
    (: e_wkr (Member sk_worker_1 worker) (STV 1.0 0.99))
    (: e_patient (Patient sk_assemble_1 sk_cabinet_1) (STV 1.0 0.99))
    (: e_cab (Member sk_cabinet_1 cabinet) (STV 1.0 0.99))
    (: e_past (Past sk_assemble_1) (STV 1.0 0.99))

**[role-patient-q] What did the worker assemble?** — same verb → same `Patient` role

    (: $prf (And (Member $w worker) (Member $e assemble) (Agent $e $w) (Patient $e $what) (Past $e)) $tv)

**[intrans-natural] The reservoir drained.** — a **non-volitional natural process** (a mass moved by gravity) puts its subject in `Patient` (it **undergoes** the draining), not `Agent`, even though "drain" is motion-like (#36)

    (: e_drain (Member sk_drain_1 drain) (STV 1.0 0.99))
    (: e_drain_patient (Patient sk_drain_1 sk_reservoir_1) (STV 1.0 0.99))
    (: e_reservoir (Member sk_reservoir_1 reservoir) (STV 1.0 0.99))
    (: e_drain_past (Past sk_drain_1) (STV 1.0 0.99))

### Resultatives & secondary predicates (#34a)

A **resultative** predicates a result of the object caused by the action. **State result** ("scrubbed it spotless") → object `Patient` + reified result state (`Member` + `Experiencer`) + flat `(Member obj state)` + `(Result event state)`. **Motion result** ("rolled it into the yard") → object `Theme` + the path as a `Source`/`Goal` **oblique**, **no** `Result` atom (the oblique is the result). A **depictive** (a state merely concurrent, not caused — "served it cold") is **not** a resultative: plain concurrent state, no `Result` link.

**[result-state] Hana scrubbed the pan spotless.** — state resultative: object `Patient` (changed) + reified result state (`Experiencer`) + flat property + `(Result event state)`

    (: e_scrub (Member sk_scrub_1 scrub) (STV 1.0 0.99))
    (: e_scrub_agent (Agent sk_scrub_1 hana) (STV 1.0 0.99))
    (: e_scrub_patient (Patient sk_scrub_1 sk_pan_1) (STV 1.0 0.99))
    (: e_scrub_past (Past sk_scrub_1) (STV 1.0 0.99))
    (: e_pan (Member sk_pan_1 pan) (STV 1.0 0.99))
    (: e_spotless (Member sk_spotless_1 spotless) (STV 1.0 0.99))
    (: e_spotless_exp (Experiencer sk_spotless_1 sk_pan_1) (STV 1.0 0.99))
    (: e_pan_spotless (Member sk_pan_1 spotless) (STV 1.0 0.99))
    (: e_result (Result sk_scrub_1 sk_spotless_1) (STV 1.0 0.99))
    (: hana_name (Name hana "Hana") (STV 1.0 0.99))

**[result-motion-goal] Diego rolled the barrel into the yard.** — motion resultative: object moved → `Theme`, path → `Goal` oblique, **no** `Result` atom

    (: e_roll (Member sk_roll_1 roll) (STV 1.0 0.99))
    (: e_roll_agent (Agent sk_roll_1 diego) (STV 1.0 0.99))
    (: e_roll_theme (Theme sk_roll_1 sk_barrel_1) (STV 1.0 0.99))
    (: e_roll_past (Past sk_roll_1) (STV 1.0 0.99))
    (: e_barrel (Member sk_barrel_1 barrel) (STV 1.0 0.99))
    (: e_yard (Member sk_yard_1 yard) (STV 1.0 0.99))
    (: e_roll_goal (Goal sk_roll_1 sk_yard_1) (STV 1.0 0.99))
    (: diego_name (Name diego "Diego") (STV 1.0 0.99))

**[result-motion-source] Bruno wiped the smudge off the mirror.** — motion resultative with a `Source` path ("off …"); object moved → `Theme`, **no** `Result` atom

    (: e_wipe (Member sk_wipe_1 wipe) (STV 1.0 0.99))
    (: e_wipe_agent (Agent sk_wipe_1 bruno) (STV 1.0 0.99))
    (: e_wipe_theme (Theme sk_wipe_1 sk_smudge_1) (STV 1.0 0.99))
    (: e_wipe_past (Past sk_wipe_1) (STV 1.0 0.99))
    (: e_smudge (Member sk_smudge_1 smudge) (STV 1.0 0.99))
    (: e_mirror (Member sk_mirror_1 mirror) (STV 1.0 0.99))
    (: e_wipe_source (Source sk_wipe_1 sk_mirror_1) (STV 1.0 0.99))
    (: bruno_name (Name bruno "Bruno") (STV 1.0 0.99))

**[result-depictive] Lena served the soup cold.** — a **depictive** (the soup was cold independently, not made cold by serving) → plain concurrent state, **no** `Result` link; serve is a transfer → `Theme`

    (: e_serve (Member sk_serve_1 serve) (STV 1.0 0.99))
    (: e_serve_agent (Agent sk_serve_1 lena) (STV 1.0 0.99))
    (: e_serve_theme (Theme sk_serve_1 sk_soup_1) (STV 1.0 0.99))
    (: e_serve_past (Past sk_serve_1) (STV 1.0 0.99))
    (: e_soup (Member sk_soup_1 soup) (STV 1.0 0.99))
    (: e_soup_cold (Member sk_soup_1 cold) (STV 1.0 0.99))
    (: lena_name (Name lena "Lena") (STV 1.0 0.99))

### Periphrastic causatives (#34b)

"have / get / make / let X do" → the causative verb is a matrix event (`Agent` = causer, `Theme` = the reified caused event); the causee's role in the caused event follows the embedded **verb form** — a **past participle** ("had it repaired") makes the object the caused event's `Patient` (causee/agent implicit → omitted); a **bare/`to`-infinitive** ("made him sign", "got her to sign", "let them leave") makes the object the caused event's `Agent`. Flavor (arrange/coerce/permit) rides the surface verb symbol; no separate operator. "have/get + NP" **alone** is possession (`Holder`/`Theme`), not causative.

**[caus-participle] Dmitri had the roof replaced.** — participle complement → matrix `have` (Agent=causer, Theme=caused event); the object is the caused event's `Patient`, the causee implicit (omitted)

    (: e_have (Member sk_have_1 have) (STV 1.0 0.99))
    (: e_have_agent (Agent sk_have_1 dmitri) (STV 1.0 0.99))
    (: e_have_theme (Theme sk_have_1 sk_replace_1) (STV 1.0 0.99))
    (: e_have_past (Past sk_have_1) (STV 1.0 0.99))
    (: e_replace (Member sk_replace_1 replace) (STV 1.0 0.99))
    (: e_replace_patient (Patient sk_replace_1 sk_roof_1) (STV 1.0 0.99))
    (: e_roof (Member sk_roof_1 roof) (STV 1.0 0.99))
    (: dmitri_name (Name dmitri "Dmitri") (STV 1.0 0.99))

**[caus-infinitive] The sergeant made the recruit kneel.** — bare-infinitive complement → matrix `make`; the object is the caused event's `Agent` (the causee)

    (: e_make (Member sk_make_1 make) (STV 1.0 0.99))
    (: e_make_agent (Agent sk_make_1 sk_sergeant_1) (STV 1.0 0.99))
    (: e_sergeant (Member sk_sergeant_1 sergeant) (STV 1.0 0.99))
    (: e_make_theme (Theme sk_make_1 sk_kneel_1) (STV 1.0 0.99))
    (: e_make_past (Past sk_make_1) (STV 1.0 0.99))
    (: e_kneel (Member sk_kneel_1 kneel) (STV 1.0 0.99))
    (: e_kneel_agent (Agent sk_kneel_1 sk_recruit_1) (STV 1.0 0.99))
    (: e_recruit (Member sk_recruit_1 recruit) (STV 1.0 0.99))

**[caus-get-to] Elena got the vendor to lower the price.** — "get … to"-infinitive → the object (vendor) is the caused event's `Agent` (causee); the embedded event keeps its own object (price → `Patient`)

    (: e_get (Member sk_get_1 get) (STV 1.0 0.99))
    (: e_get_agent (Agent sk_get_1 elena) (STV 1.0 0.99))
    (: e_get_theme (Theme sk_get_1 sk_lower_1) (STV 1.0 0.99))
    (: e_get_past (Past sk_get_1) (STV 1.0 0.99))
    (: e_lower (Member sk_lower_1 lower) (STV 1.0 0.99))
    (: e_lower_agent (Agent sk_lower_1 sk_vendor_1) (STV 1.0 0.99))
    (: e_vendor (Member sk_vendor_1 vendor) (STV 1.0 0.99))
    (: e_lower_patient (Patient sk_lower_1 sk_price_1) (STV 1.0 0.99))
    (: e_price (Member sk_price_1 price) (STV 1.0 0.99))
    (: elena_name (Name elena "Elena") (STV 1.0 0.99))

**[caus-boundary] Otis has a compass.** — CONTROL: "have + NP" alone (no verb complement) is **possession**, not causative → `have` event with `Holder`/`Theme`, no caused event, no `Agent`

    (: e_have (Member sk_have_1 have) (STV 1.0 0.99))
    (: e_have_holder (Holder sk_have_1 otis) (STV 1.0 0.99))
    (: e_have_theme (Theme sk_have_1 sk_compass_1) (STV 1.0 0.99))
    (: e_compass (Member sk_compass_1 compass) (STV 1.0 0.99))
    (: otis_name (Name otis "Otis") (STV 1.0 0.99))

## Coordination & plurals

**[coord-vp] Nina laughed and cried.** — coordinated VPs → two events, shared agent

    (: e_laugh (Member sk_laugh_1 laugh) (STV 1.0 0.99))
    (: e_laugh_agent (Agent sk_laugh_1 nina) (STV 1.0 0.99))
    (: e_laugh_past (Past sk_laugh_1) (STV 1.0 0.99))
    (: e_cry (Member sk_cry_1 cry) (STV 1.0 0.99))
    (: e_cry_agent (Agent sk_cry_1 nina) (STV 1.0 0.99))
    (: e_cry_past (Past sk_cry_1) (STV 1.0 0.99))
    (: nina_name (Name nina "Nina") (STV 1.0 0.99))

**[coord-distrib] Tom and Grace departed.** — coordinated NPs, distributive → two events

    (: e_depart1 (Member sk_depart_1 depart) (STV 1.0 0.99))
    (: e_depart1_agent (Agent sk_depart_1 tom) (STV 1.0 0.99))
    (: e_depart1_past (Past sk_depart_1) (STV 1.0 0.99))
    (: e_depart2 (Member sk_depart_2 depart) (STV 1.0 0.99))
    (: e_depart2_agent (Agent sk_depart_2 grace) (STV 1.0 0.99))
    (: e_depart2_past (Past sk_depart_2) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[coord-copular] Leo and Mary are nurses.** — distributive copular → one atom per conjunct

    (: leo_nurse (Member leo nurse) (STV 1.0 0.99))
    (: mary_nurse (Member mary nurse) (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))
    (: mary_name (Name mary "Mary") (STV 1.0 0.99))

**[coord-shared] Tom and Grace cleaned the kitchen.** — distributive + shared object (one `kitchen`)

    (: sk_kitchen_1_kitchen (Member sk_kitchen_1 kitchen) (STV 1.0 0.99))
    (: e_clean1 (Member sk_clean_1 clean) (STV 1.0 0.99))
    (: e_clean1_agent (Agent sk_clean_1 tom) (STV 1.0 0.99))
    (: e_clean1_patient (Patient sk_clean_1 sk_kitchen_1) (STV 1.0 0.99))
    (: e_clean1_past (Past sk_clean_1) (STV 1.0 0.99))
    (: e_clean2 (Member sk_clean_2 clean) (STV 1.0 0.99))
    (: e_clean2_agent (Agent sk_clean_2 grace) (STV 1.0 0.99))
    (: e_clean2_patient (Patient sk_clean_2 sk_kitchen_1) (STV 1.0 0.99))
    (: e_clean2_past (Past sk_clean_2) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[coord-collective] Leo and Mary argued.** — reciprocal verb → one event, two `Agent` atoms

    (: e_argue (Member sk_argue_1 argue) (STV 1.0 0.99))
    (: e_argue_agent1 (Agent sk_argue_1 leo) (STV 1.0 0.99))
    (: e_argue_agent2 (Agent sk_argue_1 mary) (STV 1.0 0.99))
    (: e_argue_past (Past sk_argue_1) (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))
    (: mary_name (Name mary "Mary") (STV 1.0 0.99))

**[coord-together] Nils and Petra lifted the crate together.** — bare "together" on the coordinated subject → collective (one event, two `Agent` atoms); the crate is moved, not changed → `Theme`

    (: e_lift (Member sk_lift_1 lift) (STV 1.0 0.99))
    (: e_lift_agent1 (Agent sk_lift_1 nils) (STV 1.0 0.99))
    (: e_lift_agent2 (Agent sk_lift_1 petra) (STV 1.0 0.99))
    (: e_lift_theme (Theme sk_lift_1 sk_crate_1) (STV 1.0 0.99))
    (: e_crate (Member sk_crate_1 crate) (STV 1.0 0.99))
    (: e_lift_past (Past sk_lift_1) (STV 1.0 0.99))
    (: nils_name (Name nils "Nils") (STV 1.0 0.99))
    (: petra_name (Name petra "Petra") (STV 1.0 0.99))

**[coord-group] The orchestra performed.** — group as a unit (collective noun) → sum individual

    (: sk_orchestra_1_orchestra (Member sk_orchestra_1 orchestra) (STV 1.0 0.99))
    (: e_perform (Member sk_perform_1 perform) (STV 1.0 0.99))
    (: e_perform_agent (Agent sk_perform_1 sk_orchestra_1) (STV 1.0 0.99))
    (: e_perform_past (Past sk_perform_1) (STV 1.0 0.99))

**[plural-group] The tourists assembled.** — bare definite plural → group entity + `GroupOf` member kind

    (: sk_group_1_tourists (GroupOf sk_group_1 tourist) (STV 1.0 0.99))
    (: e_assemble (Member sk_assemble_1 assemble) (STV 1.0 0.99))
    (: e_assemble_agent (Agent sk_assemble_1 sk_group_1) (STV 1.0 0.99))
    (: e_assemble_past (Past sk_assemble_1) (STV 1.0 0.99))

**[coord-pronoun] Felix and Diana traveled. They were exhausted.** — plural pronoun distributes (passage)

    (: e_travel1 (Member sk_travel_1 travel) (STV 1.0 0.99))
    (: e_travel1_agent (Agent sk_travel_1 felix) (STV 1.0 0.99))
    (: e_travel1_past (Past sk_travel_1) (STV 1.0 0.99))
    (: e_travel2 (Member sk_travel_2 travel) (STV 1.0 0.99))
    (: e_travel2_agent (Agent sk_travel_2 diana) (STV 1.0 0.99))
    (: e_travel2_past (Past sk_travel_2) (STV 1.0 0.99))
    (: felix_exhausted (Past (Member felix exhausted)) (STV 1.0 0.99))
    (: diana_exhausted (Past (Member diana exhausted)) (STV 1.0 0.99))
    (: felix_name (Name felix "Felix") (STV 1.0 0.99))
    (: diana_name (Name diana "Diana") (STV 1.0 0.99))

**Mass partitives & precise proportions (#6 residuals).** A **mass** whole → `PartOf` + a single portion witness (no `GroupOf`); a **precise fraction** → `(Fraction n d)` in the `ProportionOf` level slot; a **percentage** `p%` → `(Fraction p 100)` (surface number over 100, **never reduced**, decimals allowed). The level slot is polymorphic over {vague symbol, `Fraction`}.

**[part-mass] Half of the milk spoiled.** — mass partitive: the whole is a plain `Member` (not `GroupOf`), the portion `Member` + `PartOf` (mass analogue of `SubsetOf`), `ProportionOf` level `half`; predicate on the portion

    (: e_milk (Member sk_milk_1 milk) (STV 1.0 0.99))
    (: e_portion (Member sk_portion_1 milk) (STV 1.0 0.99))
    (: e_portion_part (PartOf sk_portion_1 sk_milk_1) (STV 1.0 0.99))
    (: e_portion_prop (ProportionOf sk_portion_1 sk_milk_1 half) (STV 1.0 0.99))
    (: e_spoil (Member sk_spoil_1 spoil) (STV 1.0 0.99))
    (: e_spoil_patient (Patient sk_spoil_1 sk_portion_1) (STV 1.0 0.99))
    (: e_spoil_past (Past sk_spoil_1) (STV 1.0 0.99))

**[part-fraction] Two-thirds of the jurors abstained.** — count partitive, precise fraction → `(Fraction 2 3)` in the level slot (subset form unchanged)

    (: e_jurors (GroupOf sk_jurors_1 juror) (STV 1.0 0.99))
    (: e_sub (GroupOf sk_sub_1 juror) (STV 1.0 0.99))
    (: e_sub_subset (SubsetOf sk_sub_1 sk_jurors_1) (STV 1.0 0.99))
    (: e_sub_prop (ProportionOf sk_sub_1 sk_jurors_1 (Fraction 2 3)) (STV 1.0 0.99))
    (: e_abstain (Member sk_abstain_1 abstain) (STV 1.0 0.99))
    (: e_abstain_agent (Agent sk_abstain_1 sk_sub_1) (STV 1.0 0.99))
    (: e_abstain_past (Past sk_abstain_1) (STV 1.0 0.99))

**[part-percent] Forty percent of the budget was cut.** — mass partitive + percentage → `(Fraction 40 100)` (unreduced — denom 100 keeps the percent signal)

    (: e_budget (Member sk_budget_1 budget) (STV 1.0 0.99))
    (: e_portion (Member sk_portion_1 budget) (STV 1.0 0.99))
    (: e_portion_part (PartOf sk_portion_1 sk_budget_1) (STV 1.0 0.99))
    (: e_portion_prop (ProportionOf sk_portion_1 sk_budget_1 (Fraction 40 100)) (STV 1.0 0.99))
    (: e_cut (Member sk_cut_1 cut) (STV 1.0 0.99))
    (: e_cut_patient (Patient sk_cut_1 sk_portion_1) (STV 1.0 0.99))
    (: e_cut_past (Past sk_cut_1) (STV 1.0 0.99))

**[part-percent-decimal] 12.5% of the applicants withdrew.** — count partitive + **decimal** percentage → `(Fraction 12.5 100)` (decimal numerator, denom 100, unreduced)

    (: e_applicants (GroupOf sk_applicants_1 applicant) (STV 1.0 0.99))
    (: e_sub (GroupOf sk_sub_1 applicant) (STV 1.0 0.99))
    (: e_sub_subset (SubsetOf sk_sub_1 sk_applicants_1) (STV 1.0 0.99))
    (: e_sub_prop (ProportionOf sk_sub_1 sk_applicants_1 (Fraction 12.5 100)) (STV 1.0 0.99))
    (: e_withdraw (Member sk_withdraw_1 withdraw) (STV 1.0 0.99))
    (: e_withdraw_agent (Agent sk_withdraw_1 sk_sub_1) (STV 1.0 0.99))
    (: e_withdraw_past (Past sk_withdraw_1) (STV 1.0 0.99))

**[part-rest] Two runners finished; the rest of the runners collapsed.** — "the rest of X" = the **remainder** partitive → count portion (`GroupOf`+`SubsetOf`) + `(RestOf rest whole)`; the mentioned part (the 2 finishers) stays its own disjoint `SubsetOf` portion (a mass/heterogeneous whole would use `PartOf` instead)

    (: e_finishers (GroupOf sk_finishers_1 runner) (STV 1.0 0.99))
    (: e_finishers_card (Cardinality sk_finishers_1 2) (STV 1.0 0.99))
    (: e_runners (GroupOf sk_runners_1 runner) (STV 1.0 0.99))
    (: e_fin_subset (SubsetOf sk_finishers_1 sk_runners_1) (STV 1.0 0.99))
    (: e_finish (Member sk_finish_1 finish) (STV 1.0 0.99))
    (: e_finish_agent (Agent sk_finish_1 sk_finishers_1) (STV 1.0 0.99))
    (: e_finish_past (Past sk_finish_1) (STV 1.0 0.99))
    (: e_rest (GroupOf sk_rest_1 runner) (STV 1.0 0.99))
    (: e_rest_subset (SubsetOf sk_rest_1 sk_runners_1) (STV 1.0 0.99))
    (: e_rest_restof (RestOf sk_rest_1 sk_runners_1) (STV 1.0 0.99))
    (: e_collapse (Member sk_collapse_1 collapse) (STV 1.0 0.99))
    (: e_collapse_patient (Patient sk_collapse_1 sk_rest_1) (STV 1.0 0.99))
    (: e_collapse_past (Past sk_collapse_1) (STV 1.0 0.99))

## Cardinality (counting)

**[card-exact] Four chefs prepared the banquet.** — exact cardinal → `GroupOf` + `Cardinality n`, predicate over the group

    (: sk_group_1_chefs (GroupOf sk_group_1 chef) (STV 1.0 0.99))
    (: sk_group_1_card (Cardinality sk_group_1 4) (STV 1.0 0.99))
    (: e_prepare (Member sk_prepare_1 prepare) (STV 1.0 0.99))
    (: e_prepare_agent (Agent sk_prepare_1 sk_group_1) (STV 1.0 0.99))
    (: e_prepare_patient (Patient sk_prepare_1 sk_banquet_1) (STV 1.0 0.99))
    (: e_banquet (Member sk_banquet_1 banquet) (STV 1.0 0.99))
    (: e_prepare_past (Past sk_prepare_1) (STV 1.0 0.99))

**[card-both] Both twins laughed.** — "both" = exactly 2 (definite); laugh is **distributive** → group event (counting) **plus** a per-member distribution rule over `(PartOf $x <group>)`

    (: sk_group_1_twins (GroupOf sk_group_1 twin) (STV 1.0 0.99))
    (: sk_group_1_card (Cardinality sk_group_1 2) (STV 1.0 0.99))
    (: e_laugh (Member sk_laugh_1 laugh) (STV 1.0 0.99))
    (: e_laugh_agent (Agent sk_laugh_1 sk_group_1) (STV 1.0 0.99))
    (: e_laugh_past (Past sk_laugh_1) (STV 1.0 0.99))
    (: twins_laughed (Implication (Premises (PartOf $x sk_group_1)) (Conclusions (Member (sk_laugh $x) laugh) (Agent (sk_laugh $x) $x) (Past (sk_laugh $x)))) (STV 1.0 0.9))

**[dist-grouped] Several dogs barked. Fido was one of those dogs.** — vague-counted distributive plural → group + `CardinalityPhrase` + group event (counting / "did any?") + a distribution rule over `(PartOf $x <group>)`; `(PartOf fido …)` fires the rule so "did Fido bark?" resolves (works for vague/large counts, no enumeration)

    (: sk_group_1_g (GroupOf sk_group_1 dog) (STV 1.0 0.99))
    (: sk_group_1_cp (CardinalityPhrase sk_group_1 "several") (STV 1.0 0.99))
    (: e_bark (Member sk_bark_1 bark) (STV 1.0 0.99))
    (: e_bark_agent (Agent sk_bark_1 sk_group_1) (STV 1.0 0.99))
    (: e_bark_past (Past sk_bark_1) (STV 1.0 0.99))
    (: dogs_barked (Implication (Premises (PartOf $x sk_group_1)) (Conclusions (Member (sk_bark $x) bark) (Agent (sk_bark $x) $x) (Past (sk_bark $x)))) (STV 1.0 0.9))
    (: fido_dog (Member fido dog) (STV 1.0 0.99))
    (: fido_partof (PartOf fido sk_group_1) (STV 1.0 0.99))
    (: fido_name (Name fido "Fido") (STV 1.0 0.99))

**[card-possess] Bob has three cars.** — cardinal possession → group is the Theme

    (: sk_group_1_cars (GroupOf sk_group_1 car) (STV 1.0 0.99))
    (: sk_group_1_card (Cardinality sk_group_1 3) (STV 1.0 0.99))
    (: e_have (Member sk_have_1 have) (STV 1.0 0.99))
    (: e_have_holder (Holder sk_have_1 bob) (STV 1.0 0.99))
    (: e_have_theme (Theme sk_have_1 sk_group_1) (STV 1.0 0.99))
    (: bob_name (Name bob "Bob") (STV 1.0 0.99))

**[card-atleast] More than five passengers complained.** — bounded → `CardinalityAtLeast` (>5 ⇒ ≥6)

    (: sk_group_1_passengers (GroupOf sk_group_1 passenger) (STV 1.0 0.99))
    (: sk_group_1_atleast (CardinalityAtLeast sk_group_1 6) (STV 1.0 0.99))
    (: e_complain (Member sk_complain_1 complain) (STV 1.0 0.99))
    (: e_complain_agent (Agent sk_complain_1 sk_group_1) (STV 1.0 0.99))
    (: e_complain_past (Past sk_complain_1) (STV 1.0 0.99))

**[card-atmost] Fewer than ten students attended.** — bounded → `CardinalityAtMost` (<10 ⇒ ≤9)

    (: sk_group_1_students (GroupOf sk_group_1 student) (STV 1.0 0.99))
    (: sk_group_1_atmost (CardinalityAtMost sk_group_1 9) (STV 1.0 0.99))
    (: e_attend (Member sk_attend_1 attend) (STV 1.0 0.99))
    (: e_attend_agent (Agent sk_attend_1 sk_group_1) (STV 1.0 0.99))
    (: e_attend_past (Past sk_attend_1) (STV 1.0 0.99))

**[card-vague] A few children napped.** — vague phrase → `GroupOf` + `CardinalityPhrase`, no number (seeded rules derive the bound)

    (: sk_group_1_children (GroupOf sk_group_1 child) (STV 1.0 0.99))
    (: sk_group_1_phrase (CardinalityPhrase sk_group_1 "a few") (STV 1.0 0.99))
    (: e_nap (Member sk_nap_1 nap) (STV 1.0 0.99))
    (: e_nap_agent (Agent sk_nap_1 sk_group_1) (STV 1.0 0.99))
    (: e_nap_past (Past sk_nap_1) (STV 1.0 0.99))

**[card-phrase] Dozens of protesters marched.** — large vague magnitude → `CardinalityPhrase "dozens"` (seeded rule ⟹ `CardinalityAtLeast 24`)

    (: sk_group_1_protesters (GroupOf sk_group_1 protester) (STV 1.0 0.99))
    (: sk_group_1_phrase (CardinalityPhrase sk_group_1 "dozens") (STV 1.0 0.99))
    (: e_march (Member sk_march_1 march) (STV 1.0 0.99))
    (: e_march_agent (Agent sk_march_1 sk_group_1) (STV 1.0 0.99))
    (: e_march_past (Past sk_march_1) (STV 1.0 0.99))

**[card-howmany-q] How many visitors registered?** — count question → bind `(Cardinality $g $n)`

    (: $prf (And (Member $e register) (Agent $e $g) (GroupOf $g visitor) (Cardinality $g $n) (Past $e)) $tv)

**[card-bounded-q] Did more than four players score?** — bounded (lower) question: a count may be stored exact *or* as a bound, so emit the `Cardinality` branch **and** the `CardinalityAtLeast` branch + union (disjoint); "more than" → `>`

    (: $prf (And (Member $e score) (Agent $e $g) (GroupOf $g player) (Cardinality $g $n) (Compute > ($n 4) -> true) (Past $e)) $tv)
    (: $prf (And (Member $e score) (Agent $e $g) (GroupOf $g player) (CardinalityAtLeast $g $m) (Compute > ($m 4) -> true) (Past $e)) $tv)

**[card-bounded-upper-q] Did fewer than seven hikers return?** — bounded (upper) question → `Cardinality` branch **and** `CardinalityAtMost` branch + union; "fewer than" → `<`

    (: $prf (And (Member $e return) (Agent $e $g) (GroupOf $g hiker) (Cardinality $g $n) (Compute < ($n 7) -> true) (Past $e)) $tv)
    (: $prf (And (Member $e return) (Agent $e $g) (GroupOf $g hiker) (CardinalityAtMost $g $k) (Compute < ($k 7) -> true) (Past $e)) $tv)

### Partitives — "Q of the Ns" (#6)

"Q **of the** Ns" quantifies a **definite, specific set**: emit a definite superset group + a `SubsetOf` subset, predicate on the subset, and **no** generic kind-claim. Cardinal → `Cardinality`; proportional → `ProportionOf S G level`. The two control cases (bare generic / bare count, no "of the") must **not** get a superset.

**[part-card] Four of the jurors disagreed.** — cardinal partitive → definite superset + `SubsetOf` subset + `Cardinality`

    (: jurors_set (GroupOf sk_jurors_1 juror) (STV 1.0 0.99))
    (: sub_grp (GroupOf sk_group_1 juror) (STV 1.0 0.99))
    (: sub_of (SubsetOf sk_group_1 sk_jurors_1) (STV 1.0 0.99))
    (: sub_card (Cardinality sk_group_1 4) (STV 1.0 0.99))
    (: e_disagree (Member sk_disagree_1 disagree) (STV 1.0 0.99))
    (: e_agent (Agent sk_disagree_1 sk_group_1) (STV 1.0 0.99))
    (: e_past (Past sk_disagree_1) (STV 1.0 0.99))

**[part-card-q] How many of the jurors disagreed?** — partitive count question → bind `Cardinality` of the `SubsetOf` subset

    (: $prf (And (Member $e disagree) (Agent $e $s) (SubsetOf $s sk_jurors_1) (Cardinality $s $n) (Past $e)) $tv)

**[part-prop] Most of the votes were valid.** — proportional partitive → `ProportionOf S G most` + property on the subset

    (: votes_set (GroupOf sk_votes_1 vote) (STV 1.0 0.99))
    (: sub_grp (GroupOf sk_group_1 vote) (STV 1.0 0.99))
    (: sub_of (SubsetOf sk_group_1 sk_votes_1) (STV 1.0 0.99))
    (: sub_prop (ProportionOf sk_group_1 sk_votes_1 most) (STV 1.0 0.99))
    (: valid_past (Past (Member sk_group_1 valid)) (STV 1.0 0.99))

**[part-generic-ctrl] Most insects are harmless.** — bare generic (no "of the") → kind `Inheritance` @0.9, **no** superset / `SubsetOf`

    (: insects_harmless (Inheritance insect harmless) (STV 0.9 0.9))

**[part-count-ctrl] Five swimmers finished.** — bare count (no "of the") → group + `Cardinality`, **no** superset / `SubsetOf`

    (: swimmers_grp (GroupOf sk_group_1 swimmer) (STV 1.0 0.99))
    (: swimmers_card (Cardinality sk_group_1 5) (STV 1.0 0.99))
    (: e_finish (Member sk_finish_1 finish) (STV 1.0 0.99))
    (: e_agent (Agent sk_finish_1 sk_group_1) (STV 1.0 0.99))
    (: e_past (Past sk_finish_1) (STV 1.0 0.99))

## Comparatives & degree

**[comp-basic] Carol is faster than Dan.** — comparative → `More` (no positive property)

    (: comp_basic (More fast carol dan) (STV 1.0 0.99))
    (: carol_name (Name carol "Carol") (STV 1.0 0.99))
    (: dan_name (Name dan "Dan") (STV 1.0 0.99))

**[comp-less] Leo is less experienced than Mary.** — "less" → swap the pair

    (: comp_less (More experienced mary leo) (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))
    (: mary_name (Name mary "Mary") (STV 1.0 0.99))

**[comp-antonym] Nina is weaker than Oscar.** — antonym keeps its SURFACE scale and argument order; the seeded `ScaleOpposite` lexicon derives `(More strong oscar nina)`

    (: comp_antonym (More weak nina oscar) (STV 1.0 0.99))
    (: nina_name (Name nina "Nina") (STV 1.0 0.99))
    (: oscar_name (Name oscar "Oscar") (STV 1.0 0.99))

**[comp-super] Felix is the smartest engineer.** — superlative → `Most` + class membership

    (: comp_super (Most smart felix engineer) (STV 1.0 0.99))
    (: felix_engineer (Member felix engineer) (STV 1.0 0.99))
    (: felix_name (Name felix "Felix") (STV 1.0 0.99))

**[comp-equative] Grace is as old as Victor.** — equative → `SameDegree`

    (: comp_equative (SameDegree old grace victor) (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))
    (: victor_name (Name victor "Victor") (STV 1.0 0.99))

**[comp-very] Diana is extremely calm.** — intensifier → positive + `Degree` carrying the SURFACE adverb (not a collapsed band)

    (: diana_calm (Member diana calm) (STV 1.0 0.99))
    (: diana_calm_deg (Degree diana calm extremely) (STV 1.0 0.99))
    (: diana_name (Name diana "Diana") (STV 1.0 0.99))

**[comp-too] The coffee is too sweet.** — "too" → `Degree excessive` (definite `the coffee` typed)

    (: sk_coffee_1_coffee (Member sk_coffee_1 coffee) (STV 1.0 0.99))
    (: sk_coffee_1_sweet (Member sk_coffee_1 sweet) (STV 1.0 0.99))
    (: sk_coffee_1_deg (Degree sk_coffee_1 sweet excessive) (STV 1.0 0.99))

**[comp-enough] The rope is long enough.** — "enough" → `Degree sufficient`

    (: sk_rope_1_rope (Member sk_rope_1 rope) (STV 1.0 0.99))
    (: sk_rope_1_long (Member sk_rope_1 long) (STV 1.0 0.99))
    (: sk_rope_1_deg (Degree sk_rope_1 long sufficient) (STV 1.0 0.99))

**[comp-tense] Carol was taller than Dan.** — tense wraps the comparative atom

    (: comp_tense (Past (More tall carol dan)) (STV 1.0 0.99))
    (: carol_name (Name carol "Carol") (STV 1.0 0.99))
    (: dan_name (Name dan "Dan") (STV 1.0 0.99))

**[comp-q-who] Who is faster than Dan?** — wh on the higher term

    (: $prf (And (Name $d "Dan") (More fast $x $d)) $tv)

**[comp-q-super] Who is the smartest engineer?** — superlative query

    (: $prf (Most smart $x engineer) $tv)

**[comp-diff] Nora is 6 centimeters taller than Owen.** — differential comparative → `MoreBy` (seeded `morebydiff` derives the plain `More`)

    (: nora_owen_diff (MoreBy tall nora owen 6 centimeter) (STV 1.0 0.99))
    (: nora_name (Name nora "Nora") (STV 1.0 0.99))
    (: owen_name (Name owen "Owen") (STV 1.0 0.99))

**[comp-diff-antonym] The pony is 30 kilograms lighter than the horse.** — antonym keeps its SURFACE scale and order; seeded rules derive `(MoreBy heavy sk_horse_1 sk_pony_1 30 kilogram)` and `(More heavy sk_horse_1 sk_pony_1)`

    (: pony_horse_diff (MoreBy light sk_pony_1 sk_horse_1 30 kilogram) (STV 1.0 0.99))
    (: pony_member (Member sk_pony_1 pony) (STV 1.0 0.99))
    (: horse_member (Member sk_horse_1 horse) (STV 1.0 0.99))

**[comp-diff-q] How much taller is Nora than Owen?** — gap query → bind magnitude + unit

    (: $prf (And (Name $n "Nora") (Name $o "Owen") (MoreBy tall $n $o $m $u)) $tv)

**[comp-diff-threshold] Is Nora more than 5 cm taller than Owen?** — gap threshold; the gap may be stored exact or approximate, so emit BOTH branches (`Compute` ∪ `GreaterThan`) + union

    (: $prf (And (Name $n "Nora") (Name $o "Owen") (MoreBy tall $n $o $m centimeter) (Compute > ($m 5) -> true)) $tv)
    (: $prf (And (Name $n "Nora") (Name $o "Owen") (MoreBy tall $n $o $m centimeter) (GreaterThan $m 5)) $tv)

### Ratios, rates, correlatives, adverbials & purpose (#24)

**[ratio-times] The warehouse is three times as large as the shop.** — multiplicative → `TimesAs` (factor 3; seeded rule derives `More large warehouse shop`)

    (: ware_shop_ratio (TimesAs large sk_warehouse_1 sk_shop_1 3) (STV 1.0 0.99))
    (: ware_member (Member sk_warehouse_1 warehouse) (STV 1.0 0.99))
    (: shop_member (Member sk_shop_1 shop) (STV 1.0 0.99))

**[ratio-half] The new tablet is half as heavy as the old laptop.** — fractional factor 0.5 (seeded rule derives `More heavy laptop tablet`); adjective modifiers `new`/`old` optional

    (: tab_lap_ratio (TimesAs heavy sk_tablet_1 sk_laptop_1 0.5) (STV 1.0 0.99))
    (: tablet_member (Member sk_tablet_1 tablet) (STV 1.0 0.99))
    (: laptop_member (Member sk_laptop_1 laptop) (STV 1.0 0.99))

**[ratio-q] How many times as large is the warehouse as the shop?** — bind the factor

    (: $prf (And (Member $w warehouse) (Member $s shop) (TimesAs large $w $s $f)) $tv)

**[rate-diff] The cheetah is 40 km/h faster than the gazelle.** — rate differential → `MoreBy` with a compound rate unit

    (: cheetah_gaz_rate (MoreBy fast sk_cheetah_1 sk_gazelle_1 40 kilometer_per_hour) (STV 1.0 0.99))
    (: cheetah_member (Member sk_cheetah_1 cheetah) (STV 1.0 0.99))
    (: gazelle_member (Member sk_gazelle_1 gazelle) (STV 1.0 0.99))

**[corr-direct] The wider a road is, the safer it is.** — covariation rule, restricted to the domain noun `road`

    (: corr_wide_safe (Implication (Premises (Member $x road) (Member $y road) (More wide $x $y)) (Conclusions (More safe $x $y))) (STV 0.9 0.9))

**[corr-inverse] The heavier a vehicle is, the less efficient it is.** — inverse correlative → swap the conclusion pair (`More efficient $y $x`)

    (: corr_heavy_ineff (Implication (Premises (Member $x vehicle) (Member $y vehicle) (More heavy $x $y)) (Conclusions (More efficient $y $x))) (STV 0.9 0.9))

**[adv-comp] The courier rides faster than the cyclist.** — adverbial comparative → two events compared with `More fast`

    (: ride1 (Member sk_ride_1 ride) (STV 1.0 0.99))
    (: ride1_agent (Agent sk_ride_1 sk_courier_1) (STV 1.0 0.99))
    (: courier_member (Member sk_courier_1 courier) (STV 1.0 0.99))
    (: ride2 (Member sk_ride_2 ride) (STV 1.0 0.99))
    (: ride2_agent (Agent sk_ride_2 sk_cyclist_1) (STV 1.0 0.99))
    (: cyclist_member (Member sk_cyclist_1 cyclist) (STV 1.0 0.99))
    (: adv_more (More fast sk_ride_1 sk_ride_2) (STV 1.0 0.99))

**[too-purpose] The puppy is too small to climb the stairs.** — "too ADJ to V" → `Degree excessive` + negated capability event (cannot climb; one strength-0 conjunction)

    (: puppy_member (Member sk_puppy_1 puppy) (STV 1.0 0.99))
    (: puppy_small (Member sk_puppy_1 small) (STV 1.0 0.99))
    (: puppy_deg (Degree sk_puppy_1 small excessive) (STV 1.0 0.99))
    (: puppy_cant_climb (And (Member sk_climb_1 climb) (Agent sk_climb_1 sk_puppy_1) (Theme sk_climb_1 sk_stairs_1) (Can sk_climb_1)) (STV 0.0 0.99))
    (: stairs_member (Member sk_stairs_1 stair) (STV 1.0 0.99))

**[enough-purpose] The rope is long enough to span the gap.** — "ADJ enough to V" → `Degree sufficient` + positive capability event (can span)

    (: rope_member (Member sk_rope_1 rope) (STV 1.0 0.99))
    (: rope_long (Member sk_rope_1 long) (STV 1.0 0.99))
    (: rope_deg (Degree sk_rope_1 long sufficient) (STV 1.0 0.99))
    (: span1 (Member sk_span_1 span) (STV 1.0 0.99))
    (: span1_agent (Agent sk_span_1 sk_rope_1) (STV 1.0 0.99))
    (: span1_theme (Theme sk_span_1 sk_gap_1) (STV 1.0 0.99))
    (: gap_member (Member sk_gap_1 gap) (STV 1.0 0.99))
    (: rope_can_span (Can sk_span_1) (STV 1.0 0.99))

**[purpose-q] Can the rope span the gap?** — query the capability event

    (: $prf (And (Member $r rope) (Member $e span) (Agent $e $r) (Theme $e $g) (Member $g gap) (Can $e)) $tv)

**[deg-toolittle] There was too little rain.** — "too little" + a mass noun evaluates the **amount** → `(Degree <mass> quantity insufficient)` (the new `insufficient` marker), not an adjective degree

    (: e_rain (Member sk_rain_1 rain) (STV 1.0 0.99))
    (: e_rain_deg (Degree sk_rain_1 quantity insufficient) (STV 1.0 0.99))

**[deg-toomuch] Mia used too much glue.** — "too much" + a mass noun → `(Degree <mass> quantity excessive)` on the noun's witness (its role in the event stays as usual)

    (: e_use (Member sk_use_1 use) (STV 1.0 0.99))
    (: e_use_agent (Agent sk_use_1 mia) (STV 1.0 0.99))
    (: e_use_theme (Theme sk_use_1 sk_glue_1) (STV 1.0 0.99))
    (: e_glue (Member sk_glue_1 glue) (STV 1.0 0.99))
    (: e_glue_deg (Degree sk_glue_1 quantity excessive) (STV 1.0 0.99))
    (: e_use_past (Past sk_use_1) (STV 1.0 0.99))
    (: mia_name (Name mia "Mia") (STV 1.0 0.99))

## Measures & units

**[meas-adj] Grace is 165 centimeters tall.** — measure on a stated adjective scale

    (: meas_adj (Measure grace tall 165 centimeter) (STV 1.0 0.99))
    (: grace_name (Name grace "Grace") (STV 1.0 0.99))

**[meas-age] Leo is 40 years old.** — age → `old` scale

    (: meas_age (Measure leo old 40 year) (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))

**[meas-verb] The parcel weighs 2 kilograms.** — verb → dimension noun `weight` (no adjective stated)

    (: sk_parcel_1_parcel (Member sk_parcel_1 parcel) (STV 1.0 0.99))
    (: meas_verb (Measure sk_parcel_1 weight 2 kilogram) (STV 1.0 0.99))

**[meas-price] The ticket costs 50 dollars.** — "costs" → `price` scale

    (: sk_ticket_1_ticket (Member sk_ticket_1 ticket) (STV 1.0 0.99))
    (: meas_price (Measure sk_ticket_1 price 50 dollar) (STV 1.0 0.99))

**[meas-tense] The bridge was 200 meters long.** — tense wraps the measure atom

    (: sk_bridge_1_bridge (Member sk_bridge_1 bridge) (STV 1.0 0.99))
    (: meas_tense (Past (Measure sk_bridge_1 long 200 meter)) (STV 1.0 0.99))

**[meas-atleast] The fence is at least 4 meters long.** — bounded → `MeasureAtLeast`

    (: sk_fence_1_fence (Member sk_fence_1 fence) (STV 1.0 0.99))
    (: meas_atleast (MeasureAtLeast sk_fence_1 long 4 meter) (STV 1.0 0.99))

**[meas-atmost] The package weighs no more than 3 kilograms.** — bounded → `MeasureAtMost`

    (: sk_package_1_package (Member sk_package_1 package) (STV 1.0 0.99))
    (: meas_atmost (MeasureAtMost sk_package_1 weight 3 kilogram) (STV 1.0 0.99))

**[meas-q-how] How old is Leo?** — measure question → bind magnitude + unit

    (: $prf (And (Name $l "Leo") (Measure $l old $n $u)) $tv)

**[meas-q-threshold] Is Grace taller than 160 centimeters?** — a threshold question can't know if the target is stored exact or approximate → emit BOTH branches + union

    (: $prf (And (Name $g "Grace") (Measure $g tall $n centimeter) (Compute > ($n 160) -> true)) $tv)
    (: $prf (And (Name $g "Grace") (Measure $g tall $n centimeter) (GreaterThan $n 160)) $tv)

**[meas-approx-adj] The fence is about 3 meters tall.** — approximate, **tight** hedge ("about") → distribution magnitude `(ParticleFromNormal X σ)`, σ ≈ 10% of X

    (: fence_tall (Measure sk_fence_1 tall (ParticleFromNormal 3 0.3) meter) (STV 1.0 0.99))
    (: fence_member (Member sk_fence_1 fence) (STV 1.0 0.99))

**[meas-approx-verb] The crate weighs roughly 40 kilograms.** — approximate, **loose** hedge ("roughly") on a dimension-noun scale → σ ≈ 20% of X

    (: crate_weight (Measure sk_crate_1 weight (ParticleFromNormal 40 8) kilogram) (STV 1.0 0.99))
    (: crate_member (Member sk_crate_1 crate) (STV 1.0 0.99))

**[meas-q-threshold-open] Which beams are longer than 5 meters?** — open threshold over a possibly-mixed KB (some beams exact, some approximate); BOTH branches + union, branches disjoint so no double-count

    (: $prf (And (Member $b beam) (Measure $b long $n meter) (Compute > ($n 5) -> true)) $tv)
    (: $prf (And (Member $b beam) (Measure $b long $n meter) (GreaterThan $n 5)) $tv)

### Cross-unit conversion

Measures keep their stated unit (a seeded lexicon auto-derives the canonical unit — meter/kilogram/second). Compare or threshold **in the canonical unit**; convert a non-canonical threshold in-query via `Compute *`.

**[unit-compare] The plank is 2 meters long. The beam is 250 centimeters long. Is the beam longer than the plank?** — cross-unit comparison → query both in canonical `meter`

    (: plank_mem (Member sk_plank_1 plank) (STV 1.0 0.99))
    (: plank_long (Measure sk_plank_1 long 2 meter) (STV 1.0 0.99))
    (: beam_mem (Member sk_beam_1 beam) (STV 1.0 0.99))
    (: beam_long (Measure sk_beam_1 long 250 centimeter) (STV 1.0 0.99))
    (: $prf (And (Member $b beam) (Measure $b long $mb meter) (Member $p plank) (Measure $p long $mp meter) (Compute > ($mb $mp) -> true)) $tv)

**[unit-threshold] The fence is 300 centimeters tall. Is it taller than 8 feet?** — cross-unit threshold → entity auto-converts to `meter`, threshold converted in-query (foot 0.3048)

    (: fence_mem (Member sk_fence_1 fence) (STV 1.0 0.99))
    (: fence_tall (Measure sk_fence_1 tall 300 centimeter) (STV 1.0 0.99))
    (: $prf (And (Member $f fence) (Measure $f tall $m meter) (Compute * (8 0.3048) -> $t) (Compute > ($m $t) -> true)) $tv)

**[unit-mass] The cat weighs 4 kilograms. The dog weighs 8000 grams. Is the dog heavier than the cat?** — cross-unit mass comparison → query both in canonical `kilogram`

    (: cat_mem (Member sk_cat_1 cat) (STV 1.0 0.99))
    (: cat_weight (Measure sk_cat_1 weight 4 kilogram) (STV 1.0 0.99))
    (: dog_mem (Member sk_dog_1 dog) (STV 1.0 0.99))
    (: dog_weight (Measure sk_dog_1 weight 8000 gram) (STV 1.0 0.99))
    (: $prf (And (Member $d dog) (Measure $d weight $md kilogram) (Member $c cat) (Measure $c weight $mc kilogram) (Compute > ($md $mc) -> true)) $tv)

**[temp-compare] The forge is 1500°C. The kiln is 2000°F. Is the forge hotter than the kiln?** — temperature is affine; canonical `kelvin`; scale = `temperature`; compare in kelvin

    (: forge_m (Member sk_forge_1 forge) (STV 1.0 0.99))
    (: forge_temp (Measure sk_forge_1 temperature 1500 celsius) (STV 1.0 0.99))
    (: kiln_m (Member sk_kiln_1 kiln) (STV 1.0 0.99))
    (: kiln_temp (Measure sk_kiln_1 temperature 2000 fahrenheit) (STV 1.0 0.99))
    (: $prf (And (Member $f forge) (Measure $f temperature $kf kelvin) (Member $k kiln) (Measure $k temperature $kk kelvin) (Compute > ($kf $kk) -> true)) $tv)

**[temp-threshold] The freezer is at 4°C. Is it colder than 10°C?** — "colder" = stored < threshold; threshold converted in-query (`+273.15`); dual-branch per cross-type routing

    (: freezer_m (Member sk_freezer_1 freezer) (STV 1.0 0.99))
    (: freezer_temp (Measure sk_freezer_1 temperature 4 celsius) (STV 1.0 0.99))
    (: $prf (And (Member $f freezer) (Measure $f temperature $k kelvin) (Compute + (10 273.15) -> $t) (Compute < ($k $t) -> true)) $tv)
    (: $prf (And (Member $f freezer) (Measure $f temperature $k kelvin) (Compute + (10 273.15) -> $t) (GreaterThan $t $k)) $tv)

**[unit-bound] The ladder is at least 12 feet tall. What is its minimum height in meters?** — bounded measure converts the bound; query in canonical `meter`

    (: ladder_mem (Member sk_ladder_1 ladder) (STV 1.0 0.99))
    (: ladder_tall (MeasureAtLeast sk_ladder_1 tall 12 foot) (STV 1.0 0.99))
    (: $prf (And (Member $l ladder) (MeasureAtLeast $l tall $m meter)) $tv)

## Time — dates, ordering, intervals & duration

**[time-date] The museum reopened on March 12, 2019.** — one `Time` atom per stated granularity; unaccusative "reopened" → `Patient`

    (: e_reopen (Member sk_reopen_1 reopen) (STV 1.0 0.99))
    (: e_pat (Patient sk_reopen_1 sk_museum_1) (STV 1.0 0.99))
    (: e_mus (Member sk_museum_1 museum) (STV 1.0 0.99))
    (: e_yr (Time sk_reopen_1 (Year 2019)) (STV 1.0 0.99))
    (: e_mo (Time sk_reopen_1 (Month march)) (STV 1.0 0.99))
    (: e_dy (Time sk_reopen_1 (Day 12)) (STV 1.0 0.99))
    (: e_past (Past sk_reopen_1) (STV 1.0 0.99))

**[time-clock] Priya will arrive at 9:45 am.** — clock → `Hour` + `Minute` (24-hour)

    (: e_arrive (Member sk_arrive_1 arrive) (STV 1.0 0.99))
    (: e_agent (Agent sk_arrive_1 priya) (STV 1.0 0.99))
    (: e_fut (Future sk_arrive_1) (STV 1.0 0.99))
    (: e_hr (Time sk_arrive_1 (Hour 9)) (STV 1.0 0.99))
    (: e_min (Time sk_arrive_1 (Minute 45)) (STV 1.0 0.99))
    (: priya_name (Name priya "Priya") (STV 1.0 0.99))

**[time-weekday] Raj will visit Delhi next Tuesday.** — "next" is carried by `Future`, no `next_` symbol

    (: e_visit (Member sk_visit_1 visit) (STV 1.0 0.99))
    (: e_agent (Agent sk_visit_1 raj) (STV 1.0 0.99))
    (: e_theme (Theme sk_visit_1 delhi) (STV 1.0 0.99))
    (: e_fut (Future sk_visit_1) (STV 1.0 0.99))
    (: e_wd (Time sk_visit_1 (Weekday tuesday)) (STV 1.0 0.99))
    (: raj_name (Name raj "Raj") (STV 1.0 0.99))
    (: delhi_name (Name delhi "Delhi") (STV 1.0 0.99))

**[time-deictic] Elena called the plumber this morning.** — deictic stays a bare symbol

    (: e_call (Member sk_call_1 call) (STV 1.0 0.99))
    (: e_agent (Agent sk_call_1 elena) (STV 1.0 0.99))
    (: e_theme (Theme sk_call_1 sk_plumber_1) (STV 1.0 0.99))
    (: e_plumber (Member sk_plumber_1 plumber) (STV 1.0 0.99))
    (: e_time (Time sk_call_1 this_morning) (STV 1.0 0.99))
    (: e_past (Past sk_call_1) (STV 1.0 0.99))
    (: elena_name (Name elena "Elena") (STV 1.0 0.99))

**[time-after] The crowd cheered after the goal was scored.** — "after" swaps into canonical `Before`

    (: e_crowd (Member sk_crowd_1 crowd) (STV 1.0 0.99))
    (: e_cheer (Member sk_cheer_1 cheer) (STV 1.0 0.99))
    (: e_cheer_ag (Agent sk_cheer_1 sk_crowd_1) (STV 1.0 0.99))
    (: e_cheer_past (Past sk_cheer_1) (STV 1.0 0.99))
    (: e_goal (Member sk_goal_1 goal) (STV 1.0 0.99))
    (: e_score (Member sk_score_1 score) (STV 1.0 0.99))
    (: e_score_pat (Patient sk_score_1 sk_goal_1) (STV 1.0 0.99))
    (: e_score_past (Past sk_score_1) (STV 1.0 0.99))
    (: e_before (Before sk_score_1 sk_cheer_1) (STV 1.0 0.99))

**[time-gapby] The band stopped playing an hour before the fireworks.** — measured gap → `BeforeBy`; the aspectual complement decomposes to a linked `play` event (two blind translators converged on this)

    (: e_band (Member sk_band_1 band) (STV 1.0 0.99))
    (: e_play (Member sk_play_1 play) (STV 1.0 0.99))
    (: e_play_ag (Agent sk_play_1 sk_band_1) (STV 1.0 0.99))
    (: e_play_past (Past sk_play_1) (STV 1.0 0.99))
    (: e_stop (Member sk_stop_1 stop) (STV 1.0 0.99))
    (: e_stop_ag (Agent sk_stop_1 sk_band_1) (STV 1.0 0.99))
    (: e_stop_th (Theme sk_stop_1 sk_play_1) (STV 1.0 0.99))
    (: e_stop_past (Past sk_stop_1) (STV 1.0 0.99))
    (: e_fw (Member sk_firework_1 firework) (STV 1.0 0.99))
    (: e_gap (BeforeBy sk_stop_1 sk_firework_1 1 hour) (STV 1.0 0.99))

**[time-ago] Tara moved to Lisbon two years ago.** — "ago" anchors on the reserved symbol `now`

    (: e_move (Member sk_move_1 move) (STV 1.0 0.99))
    (: e_agent (Agent sk_move_1 tara) (STV 1.0 0.99))
    (: e_goal (Goal sk_move_1 lisbon) (STV 1.0 0.99))
    (: e_past (Past sk_move_1) (STV 1.0 0.99))
    (: e_gap (BeforeBy sk_move_1 now 2 year) (STV 1.0 0.99))
    (: tara_name (Name tara "Tara") (STV 1.0 0.99))
    (: lisbon_name (Name lisbon "Lisbon") (STV 1.0 0.99))

**[time-pastperf] Marta had eaten by the time the ceremony began.** — past perfect + reference clause = `Past` on both + `Before`

    (: e_eat (Member sk_eat_1 eat) (STV 1.0 0.99))
    (: e_eat_ag (Agent sk_eat_1 marta) (STV 1.0 0.99))
    (: e_eat_past (Past sk_eat_1) (STV 1.0 0.99))
    (: e_begin (Member sk_begin_1 begin) (STV 1.0 0.99))
    (: e_begin_pat (Patient sk_begin_1 sk_ceremony_1) (STV 1.0 0.99))
    (: e_cer (Member sk_ceremony_1 ceremony) (STV 1.0 0.99))
    (: e_begin_past (Past sk_begin_1) (STV 1.0 0.99))
    (: e_before (Before sk_eat_1 sk_begin_1) (STV 1.0 0.99))
    (: marta_name (Name marta "Marta") (STV 1.0 0.99))

**[time-bound-year] The castle was demolished before 1960.** — unknown year, bounded; strict "before" drops the boundary → `(Year 1959)`

    (: e_castle (Member sk_castle_1 castle) (STV 1.0 0.99))
    (: e_dem (Member sk_demolish_1 demolish) (STV 1.0 0.99))
    (: e_dem_pat (Patient sk_demolish_1 sk_castle_1) (STV 1.0 0.99))
    (: e_dem_past (Past sk_demolish_1) (STV 1.0 0.99))
    (: e_dem_bound (TimeAtMost sk_demolish_1 (Year 1959)) (STV 1.0 0.99))

**[time-deadline] Dana must return the projector by 6 pm.** — "by T" deadline → `TimeAtMost` on the obligated act

    (: e_ret (Member sk_return_1 return) (STV 1.0 0.99))
    (: e_ret_ag (Agent sk_return_1 dana) (STV 1.0 0.99))
    (: e_ret_th (Theme sk_return_1 sk_projector_1) (STV 1.0 0.99))
    (: e_proj (Member sk_projector_1 projector) (STV 1.0 0.99))
    (: e_ret_ob (Obligated sk_return_1) (STV 1.0 0.99))
    (: e_ret_dl (TimeAtMost sk_return_1 (Hour 18)) (STV 1.0 0.99))
    (: dana_name (Name dana "Dana") (STV 1.0 0.99))

**[time-interval] The clinic operates from 9 am to 2 pm.** — `Start`/`End` terms; habitual schedule stays unmarked

    (: e_op (Member sk_operate_1 operate) (STV 1.0 0.99))
    (: e_op_ag (Agent sk_operate_1 sk_clinic_1) (STV 1.0 0.99))
    (: e_clinic (Member sk_clinic_1 clinic) (STV 1.0 0.99))
    (: e_op_start (Start sk_operate_1 (Hour 9)) (STV 1.0 0.99))
    (: e_op_end (End sk_operate_1 (Hour 14)) (STV 1.0 0.99))

**[time-since] Ken has worked at the mill since 2021.** — continuative perfect → `Ongoing` + `Start`, **no** `Past`

    (: e_work (Member sk_work_1 work) (STV 1.0 0.99))
    (: e_work_ag (Agent sk_work_1 ken) (STV 1.0 0.99))
    (: e_work_loc (Location sk_work_1 sk_mill_1) (STV 1.0 0.99))
    (: e_mill (Member sk_mill_1 mill) (STV 1.0 0.99))
    (: e_work_on (Ongoing sk_work_1) (STV 1.0 0.99))
    (: e_work_start (Start sk_work_1 (Year 2021)) (STV 1.0 0.99))
    (: ken_name (Name ken "Ken") (STV 1.0 0.99))

**[time-during] The generator failed during the storm.** — `During` nests the event in the containing eventuality

    (: e_gen (Member sk_generator_1 generator) (STV 1.0 0.99))
    (: e_fail (Member sk_fail_1 fail) (STV 1.0 0.99))
    (: e_fail_pat (Patient sk_fail_1 sk_generator_1) (STV 1.0 0.99))
    (: e_storm (Member sk_storm_1 storm) (STV 1.0 0.99))
    (: e_during (During sk_fail_1 sk_storm_1) (STV 1.0 0.99))
    (: e_fail_past (Past sk_fail_1) (STV 1.0 0.99))

**[time-duration] Rosa hiked for five hours.** — "for N units" adverbial → duration measure

    (: e_hike (Member sk_hike_1 hike) (STV 1.0 0.99))
    (: e_hike_ag (Agent sk_hike_1 rosa) (STV 1.0 0.99))
    (: e_hike_past (Past sk_hike_1) (STV 1.0 0.99))
    (: e_hike_dur (Measure sk_hike_1 duration 5 hour) (STV 1.0 0.99))
    (: rosa_name (Name rosa "Rosa") (STV 1.0 0.99))

**[dur-plural] The outage lasted for days.** — a **bare-plural** duration ("for days", no count) implies **at least two** → `(MeasureAtLeast e duration 2 day)` on the event-noun witness (#36)

    (: e_outage (Member sk_outage_1 outage) (STV 1.0 0.99))
    (: e_outage_past (Past sk_outage_1) (STV 1.0 0.99))
    (: e_outage_dur (MeasureAtLeast sk_outage_1 duration 2 day) (STV 1.0 0.99))

**[time-inyear] The archive burned in 1985.** — year alone → one `Time` atom

    (: e_arch (Member sk_archive_1 archive) (STV 1.0 0.99))
    (: e_burn (Member sk_burn_1 burn) (STV 1.0 0.99))
    (: e_burn_pat (Patient sk_burn_1 sk_archive_1) (STV 1.0 0.99))
    (: e_burn_yr (Time sk_burn_1 (Year 1985)) (STV 1.0 0.99))
    (: e_burn_past (Past sk_burn_1) (STV 1.0 0.99))

**[time-none-ctrl] Victor painted the fence.** — control: no temporal wording → **no** time atoms

    (: e_paint (Member sk_paint_1 paint) (STV 1.0 0.99))
    (: e_paint_ag (Agent sk_paint_1 victor) (STV 1.0 0.99))
    (: e_paint_pat (Patient sk_paint_1 sk_fence_1) (STV 1.0 0.99))
    (: e_fence (Member sk_fence_1 fence) (STV 1.0 0.99))
    (: e_paint_past (Past sk_paint_1) (STV 1.0 0.99))
    (: victor_name (Name victor "Victor") (STV 1.0 0.99))

**[time-deictic-family] The board met last month.** — an unlisted deictic-family form stays a speech-anchored constant (no `sk_` witness, no `Member` atom for it); `meet` is collective → group event only, no distribution rule

    (: e_board (Member sk_board_1 board) (STV 1.0 0.99))
    (: e_meet (Member sk_meet_1 meet) (STV 1.0 0.99))
    (: e_agent (Agent sk_meet_1 sk_board_1) (STV 1.0 0.99))
    (: e_past (Past sk_meet_1) (STV 1.0 0.99))
    (: e_time (Time sk_meet_1 last_month) (STV 1.0 0.99))

**[time-anaphoric] The hikers reached the summit on Sunday. That evening, they celebrated.** — discourse-anaphoric time resolves by **term propagation** (2026-07-07, supersedes the earlier `that_evening` constant interim): the antecedent's day terms copy onto the new event + the day-part symbol; distributive predicates over the group add `PartOf` rules carrying the same time atoms

    (: hiker_group (GroupOf sk_group_1 hiker) (STV 1.0 0.99))
    (: reach_e (Member sk_reach_1 reach) (STV 1.0 0.99))
    (: reach_agent (Agent sk_reach_1 sk_group_1) (STV 1.0 0.99))
    (: reach_theme (Theme sk_reach_1 sk_summit_1) (STV 1.0 0.99))
    (: summit_e (Member sk_summit_1 summit) (STV 1.0 0.99))
    (: reach_past (Past sk_reach_1) (STV 1.0 0.99))
    (: reach_time (Time sk_reach_1 (Weekday sunday)) (STV 1.0 0.99))
    (: reach_rule (Implication (Premises (PartOf $x sk_group_1)) (Conclusions (Member (sk_reach $x) reach) (Agent (sk_reach $x) $x) (Theme (sk_reach $x) sk_summit_1) (Past (sk_reach $x)) (Time (sk_reach $x) (Weekday sunday)))) (STV 1.0 0.9))
    (: celebrate_e (Member sk_celebrate_1 celebrate) (STV 1.0 0.99))
    (: celebrate_agent (Agent sk_celebrate_1 sk_group_1) (STV 1.0 0.99))
    (: celebrate_past (Past sk_celebrate_1) (STV 1.0 0.99))
    (: celebrate_wd (Time sk_celebrate_1 (Weekday sunday)) (STV 1.0 0.99))
    (: celebrate_part (Time sk_celebrate_1 evening) (STV 1.0 0.99))
    (: celebrate_rule (Implication (Premises (PartOf $x sk_group_1)) (Conclusions (Member (sk_celebrate $x) celebrate) (Agent (sk_celebrate $x) $x) (Past (sk_celebrate $x)) (Time (sk_celebrate $x) (Weekday sunday)) (Time (sk_celebrate $x) evening))) (STV 1.0 0.9))

**[time-anaphor-next] Vera landed in Oslo on Wednesday. The next morning, she toured the harbor.** — "the next morning" = the antecedent day's **successor** + the day-part + explicit `Before`

    (: v_name (Name vera "Vera") (STV 1.0 0.99))
    (: v_land (Member sk_land_1 land) (STV 1.0 0.99))
    (: v_land_ag (Agent sk_land_1 vera) (STV 1.0 0.99))
    (: v_land_loc (Location sk_land_1 oslo) (STV 1.0 0.99))
    (: v_land_t (Time sk_land_1 (Weekday wednesday)) (STV 1.0 0.99))
    (: v_land_past (Past sk_land_1) (STV 1.0 0.99))
    (: v_harbor (Member sk_harbor_1 harbor) (STV 1.0 0.99))
    (: v_tour (Member sk_tour_1 tour) (STV 1.0 0.99))
    (: v_tour_ag (Agent sk_tour_1 vera) (STV 1.0 0.99))
    (: v_tour_th (Theme sk_tour_1 sk_harbor_1) (STV 1.0 0.99))
    (: v_tour_t1 (Time sk_tour_1 (Weekday thursday)) (STV 1.0 0.99))
    (: v_tour_t2 (Time sk_tour_1 morning) (STV 1.0 0.99))
    (: v_before (Before sk_land_1 sk_tour_1) (STV 1.0 0.99))
    (: v_tour_past (Past sk_tour_1) (STV 1.0 0.99))

**[time-anaphor-day] The gallery opened on April 2. The following day, a critic wrote a review.** — numeric day + 1 propagates (`Day 3`, month copied); no day-part in "the following day"

    (: gal_g (Member sk_gallery_1 gallery) (STV 1.0 0.99))
    (: gal_open (Member sk_open_1 open) (STV 1.0 0.99))
    (: gal_open_pat (Patient sk_open_1 sk_gallery_1) (STV 1.0 0.99))
    (: gal_open_m (Time sk_open_1 (Month april)) (STV 1.0 0.99))
    (: gal_open_d (Time sk_open_1 (Day 2)) (STV 1.0 0.99))
    (: gal_open_past (Past sk_open_1) (STV 1.0 0.99))
    (: gal_critic (Member sk_critic_1 critic) (STV 1.0 0.99))
    (: gal_write (Member sk_write_1 write) (STV 1.0 0.99))
    (: gal_write_ag (Agent sk_write_1 sk_critic_1) (STV 1.0 0.99))
    (: gal_write_pat (Patient sk_write_1 sk_review_1) (STV 1.0 0.99))
    (: gal_review (Member sk_review_1 review) (STV 1.0 0.99))
    (: gal_write_m (Time sk_write_1 (Month april)) (STV 1.0 0.99))
    (: gal_write_d (Time sk_write_1 (Day 3)) (STV 1.0 0.99))
    (: gal_before (Before sk_open_1 sk_write_1) (STV 1.0 0.99))
    (: gal_write_past (Past sk_write_1) (STV 1.0 0.99))

**[time-anaphor-fallback] Noor finished the draft late at night. The next morning, she submitted it.** — antecedent day unknown → **no** day terms propagate; just the day-part + the `Before`

    (: n_name (Name noor "Noor") (STV 1.0 0.99))
    (: n_draft (Member sk_draft_1 draft) (STV 1.0 0.99))
    (: n_finish (Member sk_finish_1 finish) (STV 1.0 0.99))
    (: n_finish_ag (Agent sk_finish_1 noor) (STV 1.0 0.99))
    (: n_finish_pat (Patient sk_finish_1 sk_draft_1) (STV 1.0 0.99))
    (: n_finish_t (Time sk_finish_1 night) (STV 1.0 0.99))
    (: n_finish_past (Past sk_finish_1) (STV 1.0 0.99))
    (: n_submit (Member sk_submit_1 submit) (STV 1.0 0.99))
    (: n_submit_ag (Agent sk_submit_1 noor) (STV 1.0 0.99))
    (: n_submit_th (Theme sk_submit_1 sk_draft_1) (STV 1.0 0.99))
    (: n_submit_t (Time sk_submit_1 morning) (STV 1.0 0.99))
    (: n_before (Before sk_finish_1 sk_submit_1) (STV 1.0 0.99))
    (: n_submit_past (Past sk_submit_1) (STV 1.0 0.99))

**[time-daypart] Farid waters the plants in the morning.** — plain day-part on a habitual (unmarked) event

    (: f_name (Name farid "Farid") (STV 1.0 0.99))
    (: f_plants (GroupOf sk_group_1 plant) (STV 1.0 0.99))
    (: f_water (Member sk_water_1 water) (STV 1.0 0.99))
    (: f_water_ag (Agent sk_water_1 farid) (STV 1.0 0.99))
    (: f_water_th (Theme sk_water_1 sk_group_1) (STV 1.0 0.99))
    (: f_water_t (Time sk_water_1 morning) (STV 1.0 0.99))

**[freq-slot] The clinic screens patients every Friday.** — habitual (unmarked) + slot term + the slot's cycle `(Every e 1 week)`

    (: c_clinic (Member sk_clinic_1 clinic) (STV 1.0 0.99))
    (: c_screen (Member sk_screen_1 screen) (STV 1.0 0.99))
    (: c_screen_ag (Agent sk_screen_1 sk_clinic_1) (STV 1.0 0.99))
    (: c_screen_th (Theme sk_screen_1 patient) (STV 1.0 0.99))
    (: c_screen_t (Time sk_screen_1 (Weekday friday)) (STV 1.0 0.99))
    (: c_screen_ev (Every sk_screen_1 1 week) (STV 1.0 0.99))

**[freq-period] The inspector visits every three months.** — periodic wording → `(Every e n unit)`

    (: i_insp (Member sk_inspector_1 inspector) (STV 1.0 0.99))
    (: i_visit (Member sk_visit_1 visit) (STV 1.0 0.99))
    (: i_visit_ag (Agent sk_visit_1 sk_inspector_1) (STV 1.0 0.99))
    (: i_visit_ev (Every sk_visit_1 3 month) (STV 1.0 0.99))

**[freq-rate] Tomas rows twice a week.** — rate wording → `(TimesPer e n unit)`

    (: t_name (Name tomas "Tomas") (STV 1.0 0.99))
    (: t_row (Member sk_row_1 row) (STV 1.0 0.99))
    (: t_row_ag (Agent sk_row_1 tomas) (STV 1.0 0.99))
    (: t_row_tp (TimesPer sk_row_1 2 week) (STV 1.0 0.99))

**[freq-whenever] Every time the doorbell buzzes, the terrier growls. The doorbell buzzed at midnight.** — "every time/whenever + clause" quantifies over **occurrences** → an `Implication` (trigger clause as premises, per-occurrence Skolem event `During`-linked to its trigger); the specific buzz then fires it. Contrast "every Friday" ([freq-slot]): calendar slots are terms, not entities — no rule. (QA: the derived growl answers to the whole-bundle open-trigger query; the natural kind-bound + `Past` form hits the bundle-rigidity gap — `GAP-whenever`.)

    (: e_doorbell (Member sk_doorbell_1 doorbell) (STV 1.0 0.99))
    (: e_terrier (Member sk_terrier_1 terrier) (STV 1.0 0.99))
    (: whenever_buzz_growl (Implication (Premises (Member $x buzz) (Agent $x sk_doorbell_1)) (Conclusions (Member (sk_growl $x) growl) (Agent (sk_growl $x) sk_terrier_1) (During (sk_growl $x) $x))) (STV 1.0 0.9))
    (: e_buzz (Member sk_buzz_1 buzz) (STV 1.0 0.99))
    (: e_buzz_ag (Agent sk_buzz_1 sk_doorbell_1) (STV 1.0 0.99))
    (: e_buzz_t (Time sk_buzz_1 (Hour 0)) (STV 1.0 0.99))
    (: e_buzz_past (Past sk_buzz_1) (STV 1.0 0.99))

**[time-q-anaphor] Did the host serve dinner on Tuesday?** (after "The guests arrived on Tuesday. That evening, the host served dinner.") — the propagated day term answers the yes/no directly

    (: $prf (And (Member $e serve) (Agent $e $h) (Member $h host) (Theme $e dinner) (Time $e (Weekday tuesday)) (Past $e)) $tv)

**[freq-q-often] How often does the inspector visit?** — storage follows the statement's wording → `Every` ∪ `TimesPer` branches + union

    (: $prf (And (Member $e visit) (Agent $e $i) (Member $i inspector) (Every $e $n $u)) $tv)
    (: $prf (And (Member $e visit) (Agent $e $i) (Member $i inspector) (TimesPer $e $n $u)) $tv)

**[freq-q-day] What day does the clinic screen patients?** — bind the slot term (habitual: no tense)

    (: $prf (And (Member $e screen) (Agent $e $c) (Member $c clinic) (Theme $e patient) (Time $e (Weekday $w))) $tv)

**[aspect-inception] The baby started to cry.** — inceptive aspect (mirror of cessation): an eventive `start`/`begin` event + `Theme` = the activity (its own witness, `Ongoing`), both `Past`; the `start`/`begin` lemma kept surface-faithful

    (: e_start (Member sk_start_1 start) (STV 1.0 0.99))
    (: e_start_ag (Agent sk_start_1 sk_baby_1) (STV 1.0 0.99))
    (: e_start_th (Theme sk_start_1 sk_cry_1) (STV 1.0 0.99))
    (: e_start_past (Past sk_start_1) (STV 1.0 0.99))
    (: e_baby (Member sk_baby_1 baby) (STV 1.0 0.99))
    (: e_cry (Member sk_cry_1 cry) (STV 1.0 0.99))
    (: e_cry_ag (Agent sk_cry_1 sk_baby_1) (STV 1.0 0.99))
    (: e_cry_on (Ongoing sk_cry_1) (STV 1.0 0.99))

**[cess-update] Jonas no longer works at the garage.** — with CONTEXT = the parse of "Jonas works
at the garage." (`sk_work_1`, `jonas`, `sk_garage_1`): cessation on the SAME context symbols —
`(Past e)` (the state held; the only new positive atom) + the strength-0 denial WITHOUT the
`Past`; nothing re-emitted. Engine: past-Q → yes (~1.0), bare present-Q → graded leaning-no
blend, pinned `(STV 0.0 $conf)` → the raw denial

    (: e_wpast (Past sk_work_1) (STV 1.0 0.99))
    (: e_wnot (And (Member sk_work_1 work) (Agent sk_work_1 jonas) (Location sk_work_1 sk_garage_1)) (STV 0.0 0.99))

**[cess-usedto] Dario used to paint.** — first-mention past habit → the full cessation bundle on a
fresh witness: positives + `Past` + the same-symbol denial (no `Past` inside)

    (: e_paint (Member sk_paint_1 paint) (STV 1.0 0.99))
    (: e_page (Agent sk_paint_1 dario) (STV 1.0 0.99))
    (: e_ppast (Past sk_paint_1) (STV 1.0 0.99))
    (: e_pnot (And (Member sk_paint_1 paint) (Agent sk_paint_1 dario)) (STV 0.0 0.99))
    (: dario_name (Name dario "Dario") (STV 1.0 0.99))

**[cess-anymore] The fountain doesn't operate anymore.** — "not … anymore" = the same stative
cessation bundle

    (: e_op (Member sk_operate_1 operate) (STV 1.0 0.99))
    (: e_opag (Agent sk_operate_1 sk_fountain_1) (STV 1.0 0.99))
    (: e_fountain (Member sk_fountain_1 fountain) (STV 1.0 0.99))
    (: e_oppast (Past sk_operate_1) (STV 1.0 0.99))
    (: e_opnot (And (Member sk_operate_1 operate) (Agent sk_operate_1 sk_fountain_1)) (STV 0.0 0.99))

**[cess-eventive-ctrl] Greta stopped knitting.** — control: "stopped V-ing" is EVENTIVE — a stop
event + the activity, both positive `Past`, **no** denial blob

    (: e_knit (Member sk_knit_1 knit) (STV 1.0 0.99))
    (: e_knag (Agent sk_knit_1 greta) (STV 1.0 0.99))
    (: e_knpast (Past sk_knit_1) (STV 1.0 0.99))
    (: e_stop (Member sk_stop_1 stop) (STV 1.0 0.99))
    (: e_stag (Agent sk_stop_1 greta) (STV 1.0 0.99))
    (: e_stth (Theme sk_stop_1 sk_knit_1) (STV 1.0 0.99))
    (: e_stpast (Past sk_stop_1) (STV 1.0 0.99))
    (: greta_name (Name greta "Greta") (STV 1.0 0.99))

**[cess-until-ctrl] The mine operated until 1998.** — control: "until <date>" is an interval `End`,
**no** denial blob

    (: e_op (Member sk_operate_1 operate) (STV 1.0 0.99))
    (: e_opag (Agent sk_operate_1 sk_mine_1) (STV 1.0 0.99))
    (: e_mine (Member sk_mine_1 mine) (STV 1.0 0.99))
    (: e_oppast (Past sk_operate_1) (STV 1.0 0.99))
    (: e_opend (End sk_operate_1 (Year 1998)) (STV 1.0 0.99))

**[cess-q-did] Did Jonas work at the garage?** — the past query; the `Past` conjunct keeps it clear
of the denial (answers ~1.0 against [cess-update])

    (: $prf (And (Member $e work) (Agent $e $j) (Name $j "Jonas") (Location $e $g) (Member $g garage) (Past $e)) $tv)

**[cess-q-still] Does Dario still paint?** — the bare present query; the graded blended TV
(leaning no) IS the answer. (Engine note: the faithful Name-bound form currently hits the
Name-on-bundle gap — the constant/context form blends correctly.)

    (: $prf (And (Member $e paint) (Agent $e $d) (Name $d "Dario")) $tv)

**[cess-q-stopped] Has the fountain stopped operating?** — explicitly negative wording → pin
`(STV 0.0 $conf)` (retrieves the raw denial, pre-merge)

    (: $prf (And (Member $e operate) (Agent $e $f) (Member $f fountain)) (STV 0.0 $conf))

**[cess-q-when-stop] When did the mine stop operating?** — the endpoint may be stored as the
activity's `End` ("until <date>") or as a reified stop event ("stopped V-ing") → both branches +
union

    (: $prf (And (Member $e operate) (Agent $e $m) (Member $m mine) (End $e $t) (Past $e)) $tv)
    (: $prf (And (Member $s stop) (Agent $s $m) (Member $m mine) (Theme $s $o) (Member $o operate) (Time $s $t) (Past $s)) $tv)

**[time-bound-month] The renovation finished before March.** — month bound: strict "before" decrements the month **name**

    (: e1_finish (Member sk_finish_1 finish) (STV 1.0 0.99))
    (: e1_patient (Patient sk_finish_1 sk_renovation_1) (STV 1.0 0.99))
    (: e1_renovation (Member sk_renovation_1 renovation) (STV 1.0 0.99))
    (: e1_past (Past sk_finish_1) (STV 1.0 0.99))
    (: e1_before (TimeAtMost sk_finish_1 (Month february)) (STV 1.0 0.99))

**[time-bound-month-after] The boiler was installed after October.** — "after" increments → at least november

    (: e2_install (Member sk_install_1 install) (STV 1.0 0.99))
    (: e2_patient (Patient sk_install_1 sk_boiler_1) (STV 1.0 0.99))
    (: e2_boiler (Member sk_boiler_1 boiler) (STV 1.0 0.99))
    (: e2_past (Past sk_install_1) (STV 1.0 0.99))
    (: e2_after (TimeAtLeast sk_install_1 (Month november)) (STV 1.0 0.99))

**[time-deadline-weekday] Rita must return the badge by Friday.** — weekday deadline on the obligated act

    (: e3_return (Member sk_return_1 return) (STV 1.0 0.99))
    (: e3_agent (Agent sk_return_1 rita) (STV 1.0 0.99))
    (: e3_theme (Theme sk_return_1 sk_badge_1) (STV 1.0 0.99))
    (: e3_badge (Member sk_badge_1 badge) (STV 1.0 0.99))
    (: e3_obligated (Obligated sk_return_1) (STV 1.0 0.99))
    (: e3_deadline (TimeAtMost sk_return_1 (Weekday friday)) (STV 1.0 0.99))
    (: rita_name (Name rita "Rita") (STV 1.0 0.99))

**[time-lightverb] The audit occurred in March 2022. The launch occurred in June 2022.** — light verbs (occur/happen/take place) do NOT reify their own event: the event-noun witness IS the eventuality; Time terms + tense sit on it directly (seeded strict date rules then derive `(Before sk_audit_1 sk_launch_1)`)

    (: e_audit (Member sk_audit_1 audit) (STV 1.0 0.99))
    (: e_audit_month (Time sk_audit_1 (Month march)) (STV 1.0 0.99))
    (: e_audit_year (Time sk_audit_1 (Year 2022)) (STV 1.0 0.99))
    (: e_audit_past (Past sk_audit_1) (STV 1.0 0.99))
    (: e_launch (Member sk_launch_1 launch) (STV 1.0 0.99))
    (: e_launch_month (Time sk_launch_1 (Month june)) (STV 1.0 0.99))
    (: e_launch_year (Time sk_launch_1 (Year 2022)) (STV 1.0 0.99))
    (: e_launch_past (Past sk_launch_1) (STV 1.0 0.99))

**[time-approx] The courier arrived around 5 pm.** — approximate clock time: a distribution in the `Hour` value slot (tight hedge → σ ≈ 1)

    (: e_arrive (Member sk_arrive_1 arrive) (STV 1.0 0.99))
    (: e_courier (Member sk_courier_1 courier) (STV 1.0 0.99))
    (: e_agent (Agent sk_arrive_1 sk_courier_1) (STV 1.0 0.99))
    (: e_past (Past sk_arrive_1) (STV 1.0 0.99))
    (: e_time (Time sk_arrive_1 (Hour (ParticleFromNormal 17 1))) (STV 1.0 0.99))

**[time-clock-minutes] Zia called at 4:10 pm.** — hour + minute terms (24-hour)

    (: e_call (Member sk_call_1 call) (STV 1.0 0.99))
    (: zia_name (Name zia "Zia") (STV 1.0 0.99))
    (: e_agent (Agent sk_call_1 zia) (STV 1.0 0.99))
    (: e_past (Past sk_call_1) (STV 1.0 0.99))
    (: e_hour (Time sk_call_1 (Hour 16)) (STV 1.0 0.99))
    (: e_minute (Time sk_call_1 (Minute 10)) (STV 1.0 0.99))

**[time-q-bound-month] Did the renovation finish before May?** — exact ∪ bound branches, each joined through `MonthNumber` (May = 5)

    (: $prf (And (Member $e finish) (Patient $e $r) (Member $r renovation) (Time $e (Month $m)) (MonthNumber $m $n) (Compute < ($n 5) -> true) (Past $e)) $tv)
    (: $prf (And (Member $e finish) (Patient $e $r) (Member $r renovation) (TimeAtMost $e (Month $m)) (MonthNumber $m $n) (Compute < ($n 5) -> true) (Past $e)) $tv)

**[time-q-deadline] By when must Rita return the badge?** — bind the deadline bound (open term)

    (: $prf (And (Member $e return) (Agent $e $r) (Name $r "Rita") (Theme $e $w) (Member $w badge) (Obligated $e) (TimeAtMost $e $t)) $tv)

**[time-q-order-dated] Did the audit occur before the launch?** — event-noun witnesses relate directly; `Before` derives from their calendar terms (seeded)

    (: $prf (And (Member $e1 audit) (Past $e1) (Member $e2 launch) (Past $e2) (Before $e1 $e2)) $tv)

**[time-q-hour-thresh] Did the courier arrive after 4 pm?** — hour threshold = exact (`Compute`) ∪ approximate (`GreaterThan`) branches

    (: $prf (And (Member $e arrive) (Agent $e $c) (Member $c courier) (Time $e (Hour $h)) (Compute > ($h 16) -> true) (Past $e)) $tv)
    (: $prf (And (Member $e arrive) (Agent $e $c) (Member $c courier) (Time $e (Hour $h)) (GreaterThan $h 16) (Past $e)) $tv)

**[time-q-minute-thresh] Did Zia call before 4:30 pm?** — minute split: hours strictly below ∪ the boundary hour with minutes below

    (: $prf (And (Member $e call) (Agent $e $z) (Name $z "Zia") (Time $e (Hour $h)) (Compute < ($h 16) -> true) (Past $e)) $tv)
    (: $prf (And (Member $e call) (Agent $e $z) (Name $z "Zia") (Time $e (Hour 16)) (Time $e (Minute $m)) (Compute < ($m 30) -> true) (Past $e)) $tv)

**[time-q-when] When did the museum reopen?** — open `(Time $e $t)`; one row per stored granularity

    (: $prf (And (Member $e reopen) (Patient $e $m) (Member $m museum) (Time $e $t) (Past $e)) $tv)

**[time-q-year] What year did the archive burn?** — bind inside the term

    (: $prf (And (Member $e burn) (Patient $e $a) (Member $a archive) (Time $e (Year $y)) (Past $e)) $tv)

**[time-q-order] Did the band stop playing before the fireworks?** — query the `Before` (derived from the gap via seeded `beforeby_before`)

    (: $prf (And (Member $s stop) (Agent $s $b) (Member $b band) (Past $s) (Member $f firework) (Before $s $f)) $tv)

**[time-q-bound] Was the castle demolished before 1970?** — dual branch: exact `Time` ∪ matching-direction `TimeAtMost`, union

    (: $prf (And (Member $e demolish) (Patient $e $c) (Member $c castle) (Time $e (Year $y)) (Compute < ($y 1970) -> true) (Past $e)) $tv)
    (: $prf (And (Member $e demolish) (Patient $e $c) (Member $c castle) (TimeAtMost $e (Year $y)) (Compute < ($y 1970) -> true) (Past $e)) $tv)

**[time-q-contain] Is the clinic operating at noon?** — noon → 12; interval containment via two `Compute`s

    (: $prf (And (Member $e operate) (Agent $e $c) (Member $c clinic) (Start $e (Hour $s)) (Compute <= ($s 12) -> true) (End $e (Hour $n)) (Compute >= ($n 12) -> true)) $tv)

**[time-q-dur] How long did Rosa hike?** — bind the duration measure

    (: $prf (And (Member $e hike) (Agent $e $r) (Name $r "Rosa") (Measure $e duration $n $u) (Past $e)) $tv)

**[time-q-gap] How long before the fireworks did the band stop playing?** — bind the `BeforeBy` gap

    (: $prf (And (Member $s stop) (Agent $s $b) (Member $b band) (Past $s) (Member $f firework) (BeforeBy $s $f $n $u)) $tv)

**[time-q-month] Did the museum reopen before June?** — month name has no number; join the seeded `MonthNumber` lexicon

    (: $prf (And (Member $e reopen) (Patient $e $m) (Member $m museum) (Time $e (Month $mo)) (MonthNumber $mo $n) (Compute < ($n 6) -> true) (Past $e)) $tv)

## Generics & scope (verbal → rules)

**[gen-verbal] Fish swim.** — verbal generic over a kind → Skolem-event rule, 0.9/0.9

    (: fish_swim (Implication (Premises (Member $x fish)) (Conclusions (Member (sk_swim $x) swim) (Agent (sk_swim $x) $x))) (STV 0.9 0.9))

**[gen-quant] Most gulls scavenge.** — a verbal generic's explicit quantifier word rides a `QuantifierPhrase` companion beside the 0.9 rule (mirror of the copular convention; a bare generic gets NO companion)

    (: most_scavenge (Implication (Premises (Member $x gull)) (Conclusions (Member (sk_scavenge $x) scavenge) (Agent (sk_scavenge $x) $x))) (STV 0.9 0.9))
    (: gulls_q (QuantifierPhrase gull scavenge "most") (STV 1.0 0.99))

**[gen-cap] Cats can climb.** — capability generic → **reified property** on the kind (same family as deontic norms & agent-nominalizations; inherits to members natively, revisable by exceptions), NOT an event rule

    (: cats_can_climb (Inheritance cat (can climb)) (STV 0.9 0.9))

**[gen-deontic] Citizens must pay tax.** — deontic norm over a kind → reified property `(Inheritance kind (obligated action))` @ 1.0/0.99 (NOT an event rule) + compound-action decomposition

    (: citizen_tax (Inheritance citizen (obligated pay_tax)) (STV 1.0 0.99))
    (: pay_tax_g (Inheritance pay_tax pay) (STV 1.0 0.99))
    (: pay_tax_o (Patient pay_tax tax) (STV 1.0 0.99))

**[gen-none] None of the tenants complained.** — "none of the Ns" = the universal's **negative twin**: the same per-member distribution rule at **strength 0.0** (ranging as the universal does; no subset, no `Cardinality 0`) — an individuated member's event then derives at ~0; the quantifier word rides the `"none"` companion (quantifier-none vs plain "don't")

    (: none_tenants_complained (Implication (Premises (Member $x tenant)) (Conclusions (Member (sk_complain $x) complain) (Agent (sk_complain $x) $x) (Past (sk_complain $x)))) (STV 0.0 0.9))
    (: tenants_q (QuantifierPhrase tenant complain "none") (STV 1.0 0.99))

**[scope-ae] Every guest brings a gift.** — ∀∃ dependent → Skolem function event + gift

    (: every_guest_brings_gift (Implication (Premises (Member $x guest)) (Conclusions (Member (sk_bring $x) bring) (Agent (sk_bring $x) $x) (Theme (sk_bring $x) (sk_gift $x)) (Member (sk_gift $x) gift))) (STV 1.0 0.9))

**[scope-ea] Some teacher graded every exam.** — ∃∀ shared → witness constant + rule over exams

    (: sk_teacher_1_teacher (Member sk_teacher_1 teacher) (STV 1.0 0.99))
    (: teacher_graded_exams (Implication (Premises (Member $y exam)) (Conclusions (Member (sk_grade $y) grade) (Agent (sk_grade $y) sk_teacher_1) (Theme (sk_grade $y) $y) (Past (sk_grade $y)))) (STV 1.0 0.9))

**[scope-aa] Every wolf hunted every deer.** — ∀∀ → two universal premises

    (: every_wolf_hunted_deer (Implication (Premises (Member $x wolf) (Member $y deer)) (Conclusions (Member (sk_hunt $x $y) hunt) (Agent (sk_hunt $x $y) $x) (Patient (sk_hunt $x $y) $y) (Past (sk_hunt $x $y)))) (STV 1.0 0.9))

**[scope-aae] Every coach assigned every player a drill.** — ∀∀∃ → two universal premises; dependent existential = Skolem of **both** `(sk_drill $c $p)`

    (: every_coach_assigned_drill (Implication (Premises (Member $c coach) (Member $p player)) (Conclusions (Member (sk_assign $c $p) assign) (Agent (sk_assign $c $p) $c) (Recipient (sk_assign $c $p) $p) (Theme (sk_assign $c $p) (sk_drill $c $p)) (Member (sk_drill $c $p) drill) (Past (sk_assign $c $p)))) (STV 1.0 0.9))

**[scope-num] Every student memorized three poems.** — numeric under ∀ → Skolem **group** + `Cardinality` (a function of `$x`)

    (: every_student_memorized_poems (Implication (Premises (Member $x student)) (Conclusions (Member (sk_memorize $x) memorize) (Agent (sk_memorize $x) $x) (Theme (sk_memorize $x) (sk_poems $x)) (GroupOf (sk_poems $x) poem) (Cardinality (sk_poems $x) 3) (Past (sk_memorize $x)))) (STV 1.0 0.9))

**[scope-num-thresh] Did Tara memorize more than two poems?** (over "every student memorized three poems") — threshold over a scope-derived count → the faithful full-context query: bind Tara's group through the event and threshold its `Cardinality`

    (: $prf (And (Name $t "Tara") (Member $e memorize) (Agent $e $t) (Theme $e $g) (GroupOf $g poem) (Cardinality $g $n) (Compute > ($n 2) -> true)) $tv)

**[scope-shared] Every senator emailed every colleague the same memo.** — ∀∀ + "the same" → one **shared constant** memo (not a Skolem function)

    (: sk_memo_1_memo (Member sk_memo_1 memo) (STV 1.0 0.99))
    (: every_senator_emailed_colleague (Implication (Premises (Member $s senator) (Member $c colleague)) (Conclusions (Member (sk_email $s $c) email) (Agent (sk_email $s $c) $s) (Recipient (sk_email $s $c) $c) (Theme (sk_email $s $c) sk_memo_1) (Past (sk_email $s $c)))) (STV 1.0 0.9))

**[rel-univ] Everyone who has a garden is a gardener.** — event-premise rule + copular conclusion

    (: gardener_rule (Implication (Premises (Member $e have) (Holder $e $x) (Theme $e $y) (Member $y garden)) (Conclusions (Member $x gardener))) (STV 1.0 0.99))

### Distribution to each member (#21)

Explicit distributive-universal ("all the / each of the / every one of the Ns V") over a **distributive** verbal predicate → the same rule form, ranging over the members (kind-named → `(Member $x kind)`; collective-noun group → `(PartOf $x group)`), one per-member Skolem event. A **collective** predicate and a **bare** plural/count do **not** distribute.

**[dist-kind] All the passengers boarded.** — kind-named plural, intransitive → rule over `(Member $x passenger)`, strength 1.0

    (: all_passengers_boarded (Implication (Premises (Member $x passenger)) (Conclusions (Member (sk_board $x) board) (Agent (sk_board $x) $x) (Past (sk_board $x)))) (STV 1.0 0.9))

**[dist-partof] Every member of the panel abstained.** — collective-noun group → rule over `(PartOf $x sk_panel_1)`

    (: panel_abstained (Implication (Premises (PartOf $x sk_panel_1)) (Conclusions (Member (sk_abstain $x) abstain) (Agent (sk_abstain $x) $x) (Past (sk_abstain $x)))) (STV 1.0 0.9))
    (: p (Member sk_panel_1 panel) (STV 1.0 0.99))

**[dist-theme] All the analysts endorsed the proposal.** — distribution carries roles; `endorse` → **Theme** (object unchanged, per #23), shared definite object

    (: analysts_endorsed (Implication (Premises (Member $x analyst)) (Conclusions (Member (sk_endorse $x) endorse) (Agent (sk_endorse $x) $x) (Theme (sk_endorse $x) sk_proposal_1) (Past (sk_endorse $x)))) (STV 1.0 0.9))
    (: pr (Member sk_proposal_1 proposal) (STV 1.0 0.99))

**[dist-q] Did Omar board?** (over [dist-kind], Omar a passenger) — query the distributed member like any event, the named member bound by `Name`

    (: $prf (And (Name $o "Omar") (Member $e board) (Agent $e $o) (Past $e)) $tv)

**[dist-collective] The tourists assembled in the lobby.** — collective/reciprocal predicate → **one** event, group agent, **no** distribution rule

    (: assemble (Member sk_assemble_1 assemble) (STV 1.0 0.99))
    (: ta (Agent sk_assemble_1 sk_group_1) (STV 1.0 0.99))
    (: tg (GroupOf sk_group_1 tourist) (STV 1.0 0.99))
    (: tp (Past sk_assemble_1) (STV 1.0 0.99))

**[dist-bare] The trustees approved the budget.** — bare plural, **no** explicit universal → stays collective (group as unit), **no** distribution rule (conservative trigger)

    (: approve (Member sk_approve_1 approve) (STV 1.0 0.99))
    (: aa (Agent sk_approve_1 sk_group_1) (STV 1.0 0.99))
    (: ag (GroupOf sk_group_1 trustee) (STV 1.0 0.99))
    (: at (Theme sk_approve_1 sk_budget_1) (STV 1.0 0.99))
    (: ab (Member sk_budget_1 budget) (STV 1.0 0.99))
    (: ap (Past sk_approve_1) (STV 1.0 0.99))

**[dist-ofthe] All of the delegates voted.** — universal with "of the" → per-member **distribution** rule (NOT a partitive `ProportionOf`); "of the" does not make a universal a partitive, and "each of the" no longer double-matches

    (: delegates_voted (Implication (Premises (Member $x delegate)) (Conclusions (Member (sk_vote $x) vote) (Agent (sk_vote $x) $x) (Past (sk_vote $x)))) (STV 1.0 0.9))

### Striking & relational generics

Judge whether the property holds of *most* individuals. A bare generic relating two KINDS → a kind-level relation (no instance distribution, strength stays high). A striking *minority* copular generic → `Inheritance` at a lowered strength; a striking **verbal** generic naming a *rare event* (that befalls few members) → the distribution **rule** at a lowered strength, while a *characteristic disposition* stays 0.9. (An *explicit* universal stays a ∀∀ rule — see [scope-aa].)

**[genR-rel-eat] Vultures eat carrion.** — relational generic (two kinds) → kind-level relation, never distributes to instances, strength high

    (: vultures_eat_carrion (Eat vulture carrion) (STV 0.9 0.9))

**[genR-rel-catch] Spiders catch insects.** — relational generic → kind-level relation

    (: spiders_catch_insects (Catch spider insect) (STV 0.9 0.9))

**[genR-strike] Programmers are antisocial.** — striking *minority* copular generic → `Inheritance` at LOWERED strength (~0.2–0.3, not 0.9)

    (: programmers_antisocial (Inheritance programmer antisocial) (STV 0.3 0.9))

**[genR-majority] Eagles are predators.** — *majority* copular generic (control) → `Inheritance` at 0.9, NOT lowered

    (: eagles_predators (Inheritance eagle predator) (STV 0.9 0.9))

**[genR-strike-verbal] Ships sink.** — striking **verbal** generic naming a *rare event* (an arbitrary ship seldom sinks) → the distribution **rule** at LOWERED strength (~0.3), the undergoer → `Patient`; a *characteristic disposition* like "dogs bite" stays 0.9

    (: ships_sink (Implication (Premises (Member $x ship)) (Conclusions (Member (sk_sink $x) sink) (Patient (sk_sink $x) $x))) (STV 0.3 0.9))

### Defeasible generics & exceptions

A general generic + a sub-kind exception: emit the general `Inheritance` at empirical **0.9**, the taxonomy link, and the exception at the **opposite** strength and **higher** confidence **0.99** — revision then overrides the general for that sub-kind while ordinary members keep it. Capability `(can V)` for ability contrasts, plain property for copular; the exception's property symbol must **match** the general's.

**[defeas-cap] Cats can retract their claws, but cheetahs can't.** — capability defeasible → exception `(can …)` at strength 0 / conf 0.99

    (: cat_retract (Inheritance cat (can retract_claws)) (STV 0.9 0.9))
    (: cheetah_cat (Inheritance cheetah cat) (STV 1.0 0.99))
    (: cheetah_noretract (Inheritance cheetah (can retract_claws)) (STV 0.0 0.99))

**[defeas-prop] Citrus fruits are sour, but oranges aren't.** — copular property defeasible → exception against the SAME property `sour` at strength 0

    (: citrus_sour (Inheritance citrus_fruit sour) (STV 0.9 0.9))
    (: orange_citrus (Inheritance orange citrus_fruit) (STV 1.0 0.99))
    (: orange_notsour (Inheritance orange sour) (STV 0.0 0.99))

**[defeas-rev] Fish can't survive on land, but lungfish can.** — reverse polarity: negative general (0.0/0.9), positive exception (1.0/0.99)

    (: fish_noland (Inheritance fish (can survive_on_land)) (STV 0.0 0.9))
    (: lungfish_fish (Inheritance lungfish fish) (STV 1.0 0.99))
    (: lungfish_land (Inheritance lungfish (can survive_on_land)) (STV 1.0 0.99))

**[defeas-control] Owls are nocturnal.** — generic with NO stated exception → plain generic, no exception fact

    (: owls_nocturnal (Inheritance owl nocturnal) (STV 0.9 0.9))

### Defeasible deontic norms

A deontic norm over a **kind** reifies the obligation/permission as a property `(obligated <action>)` / `(permitted <action>)` — plain norms, prohibitions (denial of permission at strength 0), and defeasible ones (the Group S three-fact pattern) all use this one form. A **specific individual act** keeps the event `Obligated`/`Permitted` instead.

**[deon-oblig] Passengers must wear seatbelts, but infants are exempt.** — defeasible obligation → reified `(obligated …)` property, exemption at strength 0 / conf 0.99

    (: passenger_seatbelt (Inheritance passenger (obligated wear_seatbelt)) (STV 0.9 0.9))
    (: infant_passenger (Inheritance infant passenger) (STV 1.0 0.99))
    (: infant_exempt (Inheritance infant (obligated wear_seatbelt)) (STV 0.0 0.99))

**[deon-perm] Staff may access the archive, but interns may not.** — defeasible permission → reified `(permitted …)` property

    (: staff_archive (Inheritance staff (permitted access_archive)) (STV 0.9 0.9))
    (: intern_staff (Inheritance intern staff) (STV 1.0 0.99))
    (: intern_noperm (Inheritance intern (permitted access_archive)) (STV 0.0 0.99))

**[deon-plain] Pedestrians must use the crosswalk.** — plain deontic norm over a kind (no exemption) → reified property `(Inheritance kind (obligated action))` @ 1.0/0.99 + decomposition (the defeasible form minus the exception)

    (: pedestrian_crosswalk (Inheritance pedestrian (obligated use_crosswalk)) (STV 1.0 0.99))
    (: uc_g (Inheritance use_crosswalk use) (STV 1.0 0.99))
    (: uc_o (Patient use_crosswalk crosswalk) (STV 1.0 0.99))

**[deon-prohibition] Minors must not gamble.** — prohibition over a kind → denial of permission `(permitted gamble)` at strength 0.0 (NOT a negated obligation)

    (: minor_gamble (Inheritance minor (permitted gamble)) (STV 0.0 0.99))

## Compound decomposition (cross-cutting)

Prefer single-word symbols; when a compound is genuinely needed, also emit decomposition atoms at `0.99/0.99` — **action** `verb_object` → genus `(Inheritance compound verb)` + object `(Patient compound obj)`; **kind** `modifier_noun` → genus `(Inheritance compound head-noun)` (+ adjective modifier when it genuinely describes the compound); **agent-nominalization** `X-er` → capability `(Inheritance nom (can verb))` + kind-relation `(Verb nom obj)` if an object is incorporated. Stop at single-word lemmas; leave purpose/association modifiers opaque (and adjective/condition compounds, deferred). A **possessor+part** noun-noun (a part *of* a whole: "car engine", "desk drawer") is **not** a compound kind — emit the head as its own kind + `(PartOf part whole)`, never fused. A **phrasal / particle verb** ("went out", "brought in") stays one surface symbol `verb_particle` (`go_out`, `bring_in`) — no single-word synonym, no genus; recognizing `go_out` ≈ `fail` is deferred to a downstream statistical normalizer, not done here.

**[decomp-action] Residents must recycle waste, but tenants are exempt.** — compound action `recycle_waste` (inside `(obligated …)`) → genus `recycle` + object `waste`

    (: resident_recycle (Inheritance resident (obligated recycle_waste)) (STV 0.9 0.9))
    (: tenant_resident (Inheritance tenant resident) (STV 1.0 0.99))
    (: tenant_exempt (Inheritance tenant (obligated recycle_waste)) (STV 0.0 0.99))
    (: rw_genus (Inheritance recycle_waste recycle) (STV 1.0 0.99))
    (: rw_obj (Patient recycle_waste waste) (STV 1.0 0.99))

**[decomp-kind] A police dog barked.** — compound kind `police_dog` → genus `dog`; "police" is an association modifier, left in the symbol (a police dog is not `police`)

    (: sk_police_dog_1_m (Member sk_police_dog_1 police_dog) (STV 1.0 0.99))
    (: pd_genus (Inheritance police_dog dog) (STV 1.0 0.99))
    (: e_bark (Member sk_bark_1 bark) (STV 1.0 0.99))
    (: e_agent (Agent sk_bark_1 sk_police_dog_1) (STV 1.0 0.99))
    (: e_past (Past sk_bark_1) (STV 1.0 0.99))

**[decomp-kind-adj] The wooden bridge is old.** — compound kind `wooden_bridge` → genus `bridge` + adjective modifier `wooden` (a wooden bridge IS wooden)

    (: sk_wooden_bridge_1_m (Member sk_wooden_bridge_1 wooden_bridge) (STV 1.0 0.99))
    (: wb_genus (Inheritance wooden_bridge bridge) (STV 1.0 0.99))
    (: wb_adj (Inheritance wooden_bridge wooden) (STV 1.0 0.99))
    (: wb_old (Member sk_wooden_bridge_1 old) (STV 1.0 0.99))

**[decomp-part] Dana cleaned the desk drawer.** — a **possessor+part** noun-noun ("the drawer of a desk") is **not** a compound kind: the head is its own kind + `(PartOf part whole)` (the whole a witness), never fused `desk_drawer`

    (: e_clean (Member sk_clean_1 clean) (STV 1.0 0.99))
    (: e_clean_agent (Agent sk_clean_1 dana) (STV 1.0 0.99))
    (: e_clean_patient (Patient sk_clean_1 sk_drawer_1) (STV 1.0 0.99))
    (: e_drawer (Member sk_drawer_1 drawer) (STV 1.0 0.99))
    (: e_drawer_partof (PartOf sk_drawer_1 sk_desk_1) (STV 1.0 0.99))
    (: e_desk (Member sk_desk_1 desk) (STV 1.0 0.99))
    (: e_clean_past (Past sk_clean_1) (STV 1.0 0.99))
    (: dana_name (Name dana "Dana") (STV 1.0 0.99))

**[decomp-phrasal] The heater switched off overnight.** — a **phrasal / particle verb** stays a single surface symbol `verb_particle` (`switch_off`), never a synonym (`deactivate`) or a bare head (`switch`), and takes **no genus**; the subject/object attaches by role (surface kept faithful — lexical synonymy is a downstream normalization step)

    (: e_switch_off (Member sk_switch_off_1 switch_off) (STV 1.0 0.99))
    (: e_heater (Member sk_heater_1 heater) (STV 1.0 0.99))
    (: e_switch_off_pat (Patient sk_switch_off_1 sk_heater_1) (STV 1.0 0.99))
    (: e_switch_off_time (Time sk_switch_off_1 night) (STV 1.0 0.99))
    (: e_switch_off_past (Past sk_switch_off_1) (STV 1.0 0.99))

**[nom-intrans] Greyhounds are racers.** — intransitive agent-nominalization → capability `(can <verb>)`, no object

    (: greyhound_racer (Inheritance greyhound racer) (STV 0.9 0.9))
    (: racer_can (Inheritance racer (can race)) (STV 1.0 0.99))

**[nom-trans] Beavers are dam-builders.** — transitive nominalization (object incorporated) → capability + kind-relation `(Build dam_builder dam)`

    (: beaver_builder (Inheritance beaver dam_builder) (STV 0.9 0.9))
    (: builder_can (Inheritance dam_builder (can build)) (STV 1.0 0.99))
    (: builder_rel (Build dam_builder dam) (STV 1.0 0.99))

**[nom-noobject] Hawks are hunters.** — verb takes an object but the noun doesn't incorporate one → capability only, no kind-relation

    (: hawk_hunter (Inheritance hawk hunter) (STV 0.9 0.9))
    (: hunter_can (Inheritance hunter (can hunt)) (STV 1.0 0.99))

### Possessive / genitive NPs (#35)

A possessor marked by **'s** or a **possessive pronoun** attaches to the possessed head by one test — is the possessed a **part/component** of the possessor? If yes → `(PartOf possessed possessor)` (the part-whole rule); else one opaque `(Possession possessed possessor)` (possessed first), **never** an `own` event. `Possession` is opaque, so ownership, kinship, and looser association all use it. The possessor resolves by coreference (a name stays itself; a pronoun reuses its antecedent).

**[poss-alienable] Priya's kettle broke.** — alienable ownership 's-genitive → `Possession` (possessed first), no `own` event; the possessed is its own witness, the possessor a bare name

    (: e_kettle (Member sk_kettle_1 kettle) (STV 1.0 0.99))
    (: e_kettle_poss (Possession sk_kettle_1 priya) (STV 1.0 0.99))
    (: e_break (Member sk_break_1 break) (STV 1.0 0.99))
    (: e_break_patient (Patient sk_break_1 sk_kettle_1) (STV 1.0 0.99))
    (: e_break_past (Past sk_break_1) (STV 1.0 0.99))
    (: priya_name (Name priya "Priya") (STV 1.0 0.99))

**[poss-part] The tower's antenna toppled.** — a part/component 's-genitive routes to `PartOf` (not `Possession`), the whole a witness — the 's form reuses the "car engine" part-whole rule

    (: e_antenna (Member sk_antenna_1 antenna) (STV 1.0 0.99))
    (: e_antenna_partof (PartOf sk_antenna_1 sk_tower_1) (STV 1.0 0.99))
    (: e_tower (Member sk_tower_1 tower) (STV 1.0 0.99))
    (: e_topple (Member sk_topple_1 topple) (STV 1.0 0.99))
    (: e_topple_patient (Patient sk_topple_1 sk_antenna_1) (STV 1.0 0.99))
    (: e_topple_past (Past sk_topple_1) (STV 1.0 0.99))

**[poss-kinship] Leo's uncle laughed.** — a kinship 's-genitive is still `Possession` (opaque — **not** an invented `Uncle` relation head, **not** an `own` event); the possessed `uncle` is a person witness, the subject an `Agent` (volitional intransitive)

    (: e_uncle (Member sk_uncle_1 uncle) (STV 1.0 0.99))
    (: e_uncle_poss (Possession sk_uncle_1 leo) (STV 1.0 0.99))
    (: e_laugh (Member sk_laugh_1 laugh) (STV 1.0 0.99))
    (: e_laugh_agent (Agent sk_laugh_1 sk_uncle_1) (STV 1.0 0.99))
    (: e_laugh_past (Past sk_laugh_1) (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))

**[poss-pronoun] Marcus frowned. His van stalled.** — a possessive **pronoun** "his" resolves by coreference to the antecedent `marcus`; the van is his via `Possession`

    (: e_frown (Member sk_frown_1 frown) (STV 1.0 0.99))
    (: e_frown_agent (Agent sk_frown_1 marcus) (STV 1.0 0.99))
    (: e_frown_past (Past sk_frown_1) (STV 1.0 0.99))
    (: marcus_name (Name marcus "Marcus") (STV 1.0 0.99))
    (: e_van (Member sk_van_1 van) (STV 1.0 0.99))
    (: e_van_poss (Possession sk_van_1 marcus) (STV 1.0 0.99))
    (: e_stall (Member sk_stall_1 stall) (STV 1.0 0.99))
    (: e_stall_patient (Patient sk_stall_1 sk_van_1) (STV 1.0 0.99))
    (: e_stall_past (Past sk_stall_1) (STV 1.0 0.99))

## Conditional properties

"X is P when/at/under/if C" → reified `(ConditionalProperty kind property condition)` (do NOT assert the bare property unconditionally); a seeded `cond_prop` rule gives the property to a kind-member also in the condition-state. Decompose a compound condition per **Compound concepts**.

**[cond-adj] Clay is malleable when wet.** — adjectival condition → reified conditional, condition `wet`

    (: clay_malleable (ConditionalProperty clay malleable wet) (STV 0.9 0.9))

**[cond-measure] Chocolate is soft in warm weather.** — environment condition; the compound `warm_weather` decomposes to its head noun

    (: choc_soft (ConditionalProperty chocolate soft warm_weather) (STV 0.9 0.9))
    (: ww_genus (Inheritance warm_weather weather) (STV 1.0 0.99))

**[cond-if] Berries are dangerous if unripe.** — "if" condition

    (: berry_danger (ConditionalProperty berry dangerous unripe) (STV 0.9 0.9))

## Coreference & anaphora (passages)

**[coref-pronoun] Nina owns a parrot. It is green.** — "it" = the parrot → shared `sk_parrot_1`

    (: e_own (Member sk_own_1 own) (STV 1.0 0.99))
    (: e_holder (Holder sk_own_1 nina) (STV 1.0 0.99))
    (: e_theme (Theme sk_own_1 sk_parrot_1) (STV 1.0 0.99))
    (: e_parrot (Member sk_parrot_1 parrot) (STV 1.0 0.99))
    (: it_green (Member sk_parrot_1 green) (STV 1.0 0.99))
    (: nina_name (Name nina "Nina") (STV 1.0 0.99))

**[coref-definite] A stranger appeared. The stranger spoke.** — "the stranger" = `sk_stranger_1`

    (: sk_stranger_1_stranger (Member sk_stranger_1 stranger) (STV 1.0 0.99))
    (: e_appear (Member sk_appear_1 appear) (STV 1.0 0.99))
    (: e_appear_agent (Agent sk_appear_1 sk_stranger_1) (STV 1.0 0.99))
    (: e_appear_past (Past sk_appear_1) (STV 1.0 0.99))
    (: e_speak (Member sk_speak_1 speak) (STV 1.0 0.99))
    (: e_speak_agent (Agent sk_speak_1 sk_stranger_1) (STV 1.0 0.99))
    (: e_speak_past (Past sk_speak_1) (STV 1.0 0.99))

**[coref-named] Felix greeted Diana. She waved.** — "she" = `diana` (gender agreement)

    (: e_greet (Member sk_greet_1 greet) (STV 1.0 0.99))
    (: e_greet_agent (Agent sk_greet_1 felix) (STV 1.0 0.99))
    (: e_greet_theme (Theme sk_greet_1 diana) (STV 1.0 0.99))
    (: e_greet_past (Past sk_greet_1) (STV 1.0 0.99))
    (: e_wave (Member sk_wave_1 wave) (STV 1.0 0.99))
    (: e_wave_agent (Agent sk_wave_1 diana) (STV 1.0 0.99))
    (: e_wave_past (Past sk_wave_1) (STV 1.0 0.99))
    (: felix_name (Name felix "Felix") (STV 1.0 0.99))
    (: diana_name (Name diana "Diana") (STV 1.0 0.99))

**[coref-event] Felix scored a goal. It thrilled Diana.** — event anaphora: "It" = the scoring event `sk_score_1`

    (: e_score (Member sk_score_1 score) (STV 1.0 0.99))
    (: e_score_agent (Agent sk_score_1 felix) (STV 1.0 0.99))
    (: e_score_patient (Patient sk_score_1 sk_goal_1) (STV 1.0 0.99))
    (: e_goal (Member sk_goal_1 goal) (STV 1.0 0.99))
    (: e_score_past (Past sk_score_1) (STV 1.0 0.99))
    (: e_thrill (Member sk_thrill_1 thrill) (STV 1.0 0.99))
    (: e_thrill_stim (Stimulus sk_thrill_1 sk_score_1) (STV 1.0 0.99))
    (: e_thrill_exp (Experiencer sk_thrill_1 diana) (STV 1.0 0.99))
    (: e_thrill_past (Past sk_thrill_1) (STV 1.0 0.99))
    (: felix_name (Name felix "Felix") (STV 1.0 0.99))
    (: diana_name (Name diana "Diana") (STV 1.0 0.99))

**[coref-reflexive] Oscar blamed himself.** — "himself" = the subject `oscar`

    (: e_blame (Member sk_blame_1 blame) (STV 1.0 0.99))
    (: e_blame_agent (Agent sk_blame_1 oscar) (STV 1.0 0.99))
    (: e_blame_theme (Theme sk_blame_1 oscar) (STV 1.0 0.99))
    (: e_blame_past (Past sk_blame_1) (STV 1.0 0.99))
    (: oscar_name (Name oscar "Oscar") (STV 1.0 0.99))

**[coref-bridging] Tom rented a house. The roof was damaged.** — "the roof" new, bridged to the house

    (: e_rent (Member sk_rent_1 rent) (STV 1.0 0.99))
    (: e_rent_agent (Agent sk_rent_1 tom) (STV 1.0 0.99))
    (: e_rent_theme (Theme sk_rent_1 sk_house_1) (STV 1.0 0.99))
    (: e_house (Member sk_house_1 house) (STV 1.0 0.99))
    (: e_rent_past (Past sk_rent_1) (STV 1.0 0.99))
    (: e_roof (Member sk_roof_1 roof) (STV 1.0 0.99))
    (: e_roof_partof (PartOf sk_roof_1 sk_house_1) (STV 1.0 0.99))
    (: e_roof_damaged (Past (Member sk_roof_1 damaged)) (STV 1.0 0.99))
    (: tom_name (Name tom "Tom") (STV 1.0 0.99))

**[coref-one] Nina bought a wooden table. Leo bought a metal one.** — "one" = a fresh table `sk_table_2` (same class)

    (: e_buy1 (Member sk_buy_1 buy) (STV 1.0 0.99))
    (: e_buy1_agent (Agent sk_buy_1 nina) (STV 1.0 0.99))
    (: e_buy1_theme (Theme sk_buy_1 sk_table_1) (STV 1.0 0.99))
    (: e_table1 (Member sk_table_1 table) (STV 1.0 0.99))
    (: e_table1_wooden (Member sk_table_1 wooden) (STV 1.0 0.99))
    (: e_buy1_past (Past sk_buy_1) (STV 1.0 0.99))
    (: e_buy2 (Member sk_buy_2 buy) (STV 1.0 0.99))
    (: e_buy2_agent (Agent sk_buy_2 leo) (STV 1.0 0.99))
    (: e_buy2_theme (Theme sk_buy_2 sk_table_2) (STV 1.0 0.99))
    (: e_table2 (Member sk_table_2 table) (STV 1.0 0.99))
    (: e_table2_metal (Member sk_table_2 metal) (STV 1.0 0.99))
    (: e_buy2_past (Past sk_buy_2) (STV 1.0 0.99))
    (: nina_name (Name nina "Nina") (STV 1.0 0.99))
    (: leo_name (Name leo "Leo") (STV 1.0 0.99))

**[coref-donkey] Every shepherd who owns a sheep shears it.** — "it" = the premise-bound `$d`

    (: every_shepherd_shears_sheep (Implication (Premises (Member $f shepherd) (Member $e own) (Holder $e $f) (Theme $e $d) (Member $d sheep)) (Conclusions (Member (sk_shear $f $d) shear) (Agent (sk_shear $f $d) $f) (Patient (sk_shear $f $d) $d))) (STV 1.0 0.9))

## Context input (#18)

These cases have TWO input blocks — feed both, exactly as shown: `CONTEXT:` (prior atoms
verbatim; optional `TODAY:` / `DOMAIN:` lines) then `TEXT:`. Expected atoms cover the TEXT
only — context atoms are read-only background and must **not** be re-emitted.

**[ctx-coref] The puppy chewed his shoe.** — with CONTEXT = the parse of "Tomas adopted a puppy.":

    CONTEXT:
    (: e_adopt (Member sk_adopt_1 adopt) (STV 1.0 0.99))
    (: e_adopt_ag (Agent sk_adopt_1 tomas) (STV 1.0 0.99))
    (: e_adopt_th (Theme sk_adopt_1 sk_puppy_1) (STV 1.0 0.99))
    (: e_puppy (Member sk_puppy_1 puppy) (STV 1.0 0.99))
    (: e_adopt_past (Past sk_adopt_1) (STV 1.0 0.99))
    (: tomas_name (Name tomas "Tomas") (STV 1.0 0.99))

"the puppy" reuses `sk_puppy_1`; "his" → `tomas` (possessive → own-event); fresh witnesses for
chew/shoe/own; no context atom re-emitted:

    (: e_chew (Member sk_chew_1 chew) (STV 1.0 0.99))
    (: e_chew_ag (Agent sk_chew_1 sk_puppy_1) (STV 1.0 0.99))
    (: e_chew_pat (Patient sk_chew_1 sk_shoe_1) (STV 1.0 0.99))
    (: e_shoe (Member sk_shoe_1 shoe) (STV 1.0 0.99))
    (: e_own (Member sk_own_1 own) (STV 1.0 0.99))
    (: e_own_holder (Holder sk_own_1 tomas) (STV 1.0 0.99))
    (: e_own_theme (Theme sk_own_1 sk_shoe_1) (STV 1.0 0.99))
    (: e_chew_past (Past sk_chew_1) (STV 1.0 0.99))

**[ctx-fresh] Ann filed a report.** — with CONTEXT = the parse of "Omar filed a report." (`sk_file_1`,
`sk_report_1`, `omar`): the indefinite is a **new** witness and indices continue per class —
`sk_file_2` / `sk_report_2`, no reuse, nothing re-emitted:

    (: ann_file (Member sk_file_2 file) (STV 1.0 0.99))
    (: ann_file_ag (Agent sk_file_2 ann) (STV 1.0 0.99))
    (: ann_file_th (Theme sk_file_2 sk_report_2) (STV 1.0 0.99))
    (: ann_report (Member sk_report_2 report) (STV 1.0 0.99))
    (: ann_file_past (Past sk_file_2) (STV 1.0 0.99))
    (: ann_name (Name ann "Ann") (STV 1.0 0.99))

**[ctx-ground] The shipment arrived yesterday.** — with `CONTEXT: TODAY: Tuesday 2026-07-07` —
dual-emit: the deictic constant stays AND the calendar atoms are added (±1 day):

    (: e_arrive (Member sk_arrive_1 arrive) (STV 1.0 0.99))
    (: e_agent (Agent sk_arrive_1 sk_shipment_1) (STV 1.0 0.99))
    (: e_shipment (Member sk_shipment_1 shipment) (STV 1.0 0.99))
    (: e_past (Past sk_arrive_1) (STV 1.0 0.99))
    (: e_time (Time sk_arrive_1 yesterday) (STV 1.0 0.99))
    (: e_day (Time sk_arrive_1 (Day 6)) (STV 1.0 0.99))
    (: e_month (Time sk_arrive_1 (Month july)) (STV 1.0 0.99))
    (: e_year (Time sk_arrive_1 (Year 2026)) (STV 1.0 0.99))

(No-context control: the same sentence WITHOUT `TODAY` emits the constant only — no calendar
atoms.)

**[ctx-ground-subday] Milo mowed the lawn this morning.** — same `TODAY` context; a sub-day deictic
keeps its constant and adds **today's** day atoms (Day 7, not 6):

    (: e_mow (Member sk_mow_1 mow) (STV 1.0 0.99))
    (: e_agent (Agent sk_mow_1 milo) (STV 1.0 0.99))
    (: e_patient (Patient sk_mow_1 sk_lawn_1) (STV 1.0 0.99))
    (: e_lawn (Member sk_lawn_1 lawn) (STV 1.0 0.99))
    (: e_past (Past sk_mow_1) (STV 1.0 0.99))
    (: e_time (Time sk_mow_1 this_morning) (STV 1.0 0.99))
    (: e_day (Time sk_mow_1 (Day 7)) (STV 1.0 0.99))
    (: e_month (Time sk_mow_1 (Month july)) (STV 1.0 0.99))
    (: e_year (Time sk_mow_1 (Year 2026)) (STV 1.0 0.99))
    (: milo_name (Name milo "Milo") (STV 1.0 0.99))

**[ctx-ground-noarith] Zoe will fly to Rome next Tuesday.** — same `TODAY` context; weekday-relative
stays `Weekday` + tense, **no** calendar atoms (no week arithmetic):

    (: e_fly (Member sk_fly_1 fly) (STV 1.0 0.99))
    (: e_agent (Agent sk_fly_1 zoe) (STV 1.0 0.99))
    (: e_goal (Goal sk_fly_1 rome) (STV 1.0 0.99))
    (: e_future (Future sk_fly_1) (STV 1.0 0.99))
    (: e_time (Time sk_fly_1 (Weekday tuesday)) (STV 1.0 0.99))
    (: zoe_name (Name zoe "Zoe") (STV 1.0 0.99))
    (: rome_name (Name rome "Rome") (STV 1.0 0.99))

**[ctx-update] Bo no longer works at the bakery.** — with CONTEXT = the parse of "Bo works at the
bakery." (`sk_work_1`, `bo`, `sk_bakery_1`): the denial goes on the **same context symbols** —
engine revision then blends it with the old positives into one graded leaning-no answer (~0.25;
a fresh witness would leave the stale positive untouched — engine-verified):

    (: bo_no_longer_work (And (Member sk_work_1 work) (Agent sk_work_1 bo) (Location sk_work_1 sk_bakery_1)) (STV 0.0 0.99))

**[ctx-query] Who owns the parrot?** — with CONTEXT = the parse of "Nadia owns a parrot."
(`sk_own_1`, `nadia`, `sk_parrot_1`): a context-identified referent is queried as its **constant**
symbol (the KB symbol is known — that is what context is for):

    (: $prf (And (Member $e own) (Theme $e sk_parrot_1) (Holder $e $who)) $tv)

## Reciprocals & symmetric relations

**[recip-directed-pair] Hannah and Ivan congratulated each other.** — "each other" + directed verb, named → one directed event per ordered pair, roles swapped

    (: e_congrat1 (Member sk_congratulate_1 congratulate) (STV 1.0 0.99))
    (: e_congrat1_agent (Agent sk_congratulate_1 hannah) (STV 1.0 0.99))
    (: e_congrat1_theme (Theme sk_congratulate_1 ivan) (STV 1.0 0.99))
    (: e_congrat1_past (Past sk_congratulate_1) (STV 1.0 0.99))
    (: e_congrat2 (Member sk_congratulate_2 congratulate) (STV 1.0 0.99))
    (: e_congrat2_agent (Agent sk_congratulate_2 ivan) (STV 1.0 0.99))
    (: e_congrat2_theme (Theme sk_congratulate_2 hannah) (STV 1.0 0.99))
    (: e_congrat2_past (Past sk_congratulate_2) (STV 1.0 0.99))
    (: hannah_name (Name hannah "Hannah") (STV 1.0 0.99))
    (: ivan_name (Name ivan "Ivan") (STV 1.0 0.99))

**[recip-group-kind] The rivals undermine one another.** — unnamed group, plural names the kind → rule over `(Member $x rival)`, distinctness guard, Skolem-pair event

    (: rivals_undermine (Implication (Premises (Member $x rival) (Member $y rival) (Compute == ($x $y) -> false)) (Conclusions (Member (sk_undermine $x $y) undermine) (Agent (sk_undermine $x $y) $x) (Patient (sk_undermine $x $y) $y))) (STV 1.0 0.9))

**[recip-group-collnoun] The panel members questioned one another.** — collective noun → rule over `(PartOf $x <group>)`, tense **inside** Conclusions (a compound-kind `(Member $x panel_member)` reading is an accepted equivalent)

    (: panel_question (Implication (Premises (PartOf $x sk_panel_1) (PartOf $y sk_panel_1) (Compute == ($x $y) -> false)) (Conclusions (Member (sk_question $x $y) question) (Agent (sk_question $x $y) $x) (Theme (sk_question $x $y) $y) (Past (sk_question $x $y)))) (STV 1.0 0.9))
    (: sk_panel_1_panel (Member sk_panel_1 panel) (STV 1.0 0.99))

**[recip-sym-pair] Wendy and Xavier are cousins.** — symmetric relation → assert once + `(Symmetric <Rel>)` tag (seeded `sym_rel` derives the reverse)

    (: wendy_xavier_cousin (Cousin wendy xavier) (STV 1.0 0.99))
    (: cousin_sym_tag (Symmetric Cousin) (STV 1.0 0.99))
    (: wendy_name (Name wendy "Wendy") (STV 1.0 0.99))
    (: xavier_name (Name xavier "Xavier") (STV 1.0 0.99))

**[recip-sym-group] All the finalists are rivals.** — symmetric relation over a group → literal-head rule (both directions from the pair-range), **no** separate symmetry rule

    (: finalists_rivals (Implication (Premises (Member $x finalist) (Member $y finalist) (Compute == ($x $y) -> false)) (Conclusions (Rival $x $y))) (STV 1.0 0.9))

**[recip-routing] Hassan and Omar reconciled with each other.** — eventive symmetric verb + "each other" → **collective** (one event, two `Agent` atoms), not two directed events

    (: e_reconcile (Member sk_reconcile_1 reconcile) (STV 1.0 0.99))
    (: e_reconcile_agent1 (Agent sk_reconcile_1 hassan) (STV 1.0 0.99))
    (: e_reconcile_agent2 (Agent sk_reconcile_1 omar) (STV 1.0 0.99))
    (: e_reconcile_past (Past sk_reconcile_1) (STV 1.0 0.99))
    (: hassan_name (Name hassan "Hassan") (STV 1.0 0.99))
    (: omar_name (Name omar "Omar") (STV 1.0 0.99))

**[recip-q-sym] Who is Wendy a cousin of?** — symmetric-relation query (reverse derived by the symmetry rule)

    (: $prf (And (Name $w "Wendy") (Cousin $w $x)) $tv)

**[recip-q-directed] Did Hannah congratulate Ivan?** — directed each-other query (one direction)

    (: $prf (And (Name $h "Hannah") (Name $i "Ivan") (Member $e congratulate) (Agent $e $h) (Patient $e $i) (Past $e)) $tv)

## Disjunction ("or")

**[disj-subj-named] Greg or Tina will win.** — disjoint named subject → narrow `(Or …)` over the Agent inside one `(And …)` fact

    (: greg_or_tina_win (And (Member sk_win_1 win) (Or (Agent sk_win_1 greg) (Agent sk_win_1 tina)) (Future sk_win_1)) (STV 1.0 0.99))
    (: greg_name (Name greg "Greg") (STV 1.0 0.99))
    (: tina_name (Name tina "Tina") (STV 1.0 0.99))

**[disj-obj] Carla drinks juice or water.** — disjoint bare-noun object → narrow `(Or …)` over the Theme (habitual, unmarked)

    (: carla_drink (And (Member sk_drink_1 drink) (Agent sk_drink_1 carla) (Or (Theme sk_drink_1 juice) (Theme sk_drink_1 water))) (STV 1.0 0.99))
    (: carla_name (Name carla "Carla") (STV 1.0 0.99))

**[disj-obj-indef] Sam will buy a bike or a scooter.** — disjoint *indefinite* object → each witness's `(Member …)` lives **inside** its Or branch

    (: sam_buy (And (Member sk_buy_1 buy) (Agent sk_buy_1 sam) (Or (And (Theme sk_buy_1 sk_bike_1) (Member sk_bike_1 bike)) (And (Theme sk_buy_1 sk_scooter_1) (Member sk_scooter_1 scooter))) (Future sk_buy_1)) (STV 1.0 0.99))
    (: sam_name (Name sam "Sam") (STV 1.0 0.99))

**[disj-cop] The light is red or amber.** — disjoint property → `(Or …)` of two `Member` atoms + definite subject membership

    (: light_color (Or (Member sk_light_1 red) (Member sk_light_1 amber)) (STV 1.0 0.99))
    (: light (Member sk_light_1 light) (STV 1.0 0.99))

**[disj-wide] The engine stalled or the brakes failed.** — independent clauses → wide `(Or <bundleA> <bundleB>)`, definite subjects outside

    (: engine_or_brakes (Or (And (Member sk_stall_1 stall) (Agent sk_stall_1 sk_engine_1) (Past sk_stall_1)) (And (Member sk_fail_1 fail) (Agent sk_fail_1 sk_brake_1) (Past sk_fail_1))) (STV 1.0 0.99))
    (: engine (Member sk_engine_1 engine) (STV 1.0 0.99))
    (: brake (Member sk_brake_1 brake) (STV 1.0 0.99))

**[disj-rule] A driver who is reckless or drunk is fined.** — disjunctive rule condition → one rule per disjunct

    (: reckless_fined (Implication (Premises (Member $x driver) (Member $x reckless)) (Conclusions (Member (sk_fine $x) fine) (Patient (sk_fine $x) $x))) (STV 1.0 0.99))
    (: drunk_fined (Implication (Premises (Member $x driver) (Member $x drunk)) (Conclusions (Member (sk_fine $x) fine) (Patient (sk_fine $x) $x))) (STV 1.0 0.99))

**[disj-q-comp] Who is older or taller than Tom?** — disjunctive question → one query line per disjunct

    (: $prf (And (Name $t "Tom") (More old $x $t)) $tv)
    (: $prf (And (Name $t "Tom") (More tall $x $t)) $tv)

**[disj-q-event] Did the bell chime or the phone buzz?** — disjunctive event question → one query line per disjunct

    (: $prf (And (Member $e chime) (Agent $e sk_bell_1) (Member sk_bell_1 bell) (Past $e)) $tv)
    (: $prf (And (Member $e buzz) (Agent $e sk_phone_1) (Member sk_phone_1 phone) (Past $e)) $tv)

## Exclusive or (XOR)

Bare "or" is inclusive (above); these carry an exclusivity cue — explicit "but not both" / "exactly one of", or contradictory states of one entity — so *exactly one* holds. Reify as `(Xor a b)`; **atomic** disjuncts also get two strength-0 implications (`a→¬b`, `b→¬a`) for the rule-out inference; **complex/event** disjuncts get the label only.

**[xor-atomic-states] The reactor is either online or offline.** — contradictory states → exclusive; atomic → `Xor` + two strength-0 rules

    (: sk_reactor_1_reactor (Member sk_reactor_1 reactor) (STV 1.0 0.99))
    (: reactor_xor (Xor (Member sk_reactor_1 online) (Member sk_reactor_1 offline)) (STV 1.0 0.99))
    (: reactor_excl_1 (Implication (Premises (Member sk_reactor_1 online)) (Conclusions (Member sk_reactor_1 offline))) (STV 0.0 0.99))
    (: reactor_excl_2 (Implication (Premises (Member sk_reactor_1 offline)) (Conclusions (Member sk_reactor_1 online))) (STV 0.0 0.99))

**[xor-atomic-cue] The patient is either conscious or unconscious, but not both.** — explicit "but not both" → exclusive; atomic

    (: sk_patient_1_patient (Member sk_patient_1 patient) (STV 1.0 0.99))
    (: patient_xor (Xor (Member sk_patient_1 conscious) (Member sk_patient_1 unconscious)) (STV 1.0 0.99))
    (: patient_excl_1 (Implication (Premises (Member sk_patient_1 conscious)) (Conclusions (Member sk_patient_1 unconscious))) (STV 0.0 0.99))
    (: patient_excl_2 (Implication (Premises (Member sk_patient_1 unconscious)) (Conclusions (Member sk_patient_1 conscious))) (STV 0.0 0.99))

**[xor-event-label] Either the committee will approve the proposal or it will reject it, but not both.** — complex/event disjuncts → `Xor` **label only** (no rules)

    (: sk_committee_1_committee (Member sk_committee_1 committee) (STV 1.0 0.99))
    (: sk_proposal_1_proposal (Member sk_proposal_1 proposal) (STV 1.0 0.99))
    (: committee_xor (Xor (And (Member sk_approve_1 approve) (Agent sk_approve_1 sk_committee_1) (Theme sk_approve_1 sk_proposal_1) (Future sk_approve_1)) (And (Member sk_reject_1 reject) (Agent sk_reject_1 sk_committee_1) (Theme sk_reject_1 sk_proposal_1) (Future sk_reject_1))) (STV 1.0 0.99))

**[xor-passage-ruleout] The reactor is either online or offline. It is currently online.** — passage: the confirmed state is **bare/present** (not `Ongoing`), so the rule rules out "offline" at strength 0

    (: sk_reactor_1_reactor (Member sk_reactor_1 reactor) (STV 1.0 0.99))
    (: reactor_xor (Xor (Member sk_reactor_1 online) (Member sk_reactor_1 offline)) (STV 1.0 0.99))
    (: reactor_excl_1 (Implication (Premises (Member sk_reactor_1 online)) (Conclusions (Member sk_reactor_1 offline))) (STV 0.0 0.99))
    (: reactor_excl_2 (Implication (Premises (Member sk_reactor_1 offline)) (Conclusions (Member sk_reactor_1 online))) (STV 0.0 0.99))
    (: reactor_online (Member sk_reactor_1 online) (STV 1.0 0.99))

**[xor-control-inclusive] The fabric is either waterproof or breathable.** — "either…or" but the two properties are NOT mutually exclusive and there is no cue → stays **inclusive** `Or`, NOT `Xor`

    (: sk_fabric_1_fabric (Member sk_fabric_1 fabric) (STV 1.0 0.99))
    (: fabric_props (Or (Member sk_fabric_1 waterproof) (Member sk_fabric_1 breathable)) (STV 1.0 0.99))

## Queries (questions → query patterns)

For these the expected output is a single query line `(: $prf <pattern> $tv)`; check the
conjuncts and variable placement. Named individuals are bound by `(Name $x "…")`.

**[q-yesno-cat] Is Paris a capital?** — categorical yes/no; named → Name constraint

    (: $prf (And (Name $x "Paris") (Member $x capital)) $tv)

**[q-yesno-ev] Did Leo serve lunch?** — event yes/no

    (: $prf (And (Name $l "Leo") (Member $e serve) (Agent $e $l) (Patient $e lunch) (Past $e)) $tv)

**[q-wh-what] What did Oscar bake?** — wh on the Patient

    (: $prf (And (Name $o "Oscar") (Member $e bake) (Agent $e $o) (Patient $e $what) (Past $e)) $tv)

**[q-wh-who] Who painted the mural?** — wh on the Agent (definite object bound by kind)

    (: $prf (And (Member $e paint) (Patient $e $m) (Member $m mural) (Agent $e $who) (Past $e)) $tv)

**[q-wh-whose] Whose kettle broke?** — wh on the **possessor** → bind the `Possession` possessor slot, the possessed chained by kind + its event; the seeded have/own→`Possession` bridge makes this one form cover verbally-stored possession too (pairs with [poss-alienable] → `priya`)

    (: $prf (And (Member $k kettle) (Possession $k $who) (Member $e break) (Patient $e $k)) $tv)

**[q-have] What does Marisol have?** — possessed-slot wh: the single `Possession` query (the seeded bridge derives it from a have/own event, so no event branch is needed)

    (: $prf (And (Name $m "Marisol") (Possession $w $m)) $tv)

**[q-wh-do] What does Nina do?** — wh on the verb class (habitual, unmarked)

    (: $prf (And (Name $n "Nina") (Member $e $verb) (Agent $e $n)) $tv)

**[q-cap] Can ostriches fly?** — capability yes/no with a KIND subject → query the reified property

    (: $prf (Inheritance ostrich (can fly)) $tv)

**[q-cap-ind] Can Rufus swim?** — individual capability: the ability may be stored as an asserted event (`Can e`) or inherited from a kind property → **both branches + union** (disjoint)

    (: $prf (And (Name $r "Rufus") (Member $e swim) (Agent $e $r) (Can $e)) $tv)
    (: $prf (And (Name $r "Rufus") (Member $r (can swim))) $tv)

**[q-neg] What can't infants do?** — negative/polarity (kind subject) → the property form, TV pinned to strength 0

    (: $prf (Inheritance infant (can $verb)) (STV 0.0 $conf))

**[q-compound-chain] Who is the smartest, and what do they study?** — compound (shared referent) → one query, `$who` chains the parts, two unknowns

    (: $prf (And (Most smart $who person) (Member $e study) (Agent $e $who) (Patient $e $what)) $tv)

**[q-compound-obj] What did Nora paint, and who bought it?** — compound chained via the object "it" (shared `$work`)

    (: $prf (And (Name $n "Nora") (Member $pe paint) (Agent $pe $n) (Patient $pe $work) (Past $pe) (Member $be buy) (Agent $be $who) (Patient $be $work) (Past $be)) $tv)

**[q-compound-indep] Who is the oldest dog, and who is the youngest cat?** — independent parts (no shared variable) → **one query line each** (a conjoined `And` would drop the whole answer if either half has no data)

    (: $prf (Most old $d dog) $tv)
    (: $prf (Most young $c cat) $tv)

**[q-compound-difftv] What can robots do, and what can't they do?** — different truth-value pins → the one case that splits into two lines (kind subject → property form)

    (: $prf (Inheritance robot (can $verb)) $tv)
    (: $prf (Inheritance robot (can $verb)) (STV 0.0 $conf))

## Inter-clause connectives (surface-head)

**[conn-because] The bridge collapsed because the cable snapped.** — the stated connective becomes the **UpperCamelCase surface head** (`Because`), **main clause first**, subordinate clause second (here identical to surface order); each clause parses as usual, undergoers → `Patient`

    (: e_collapse (Member sk_collapse_1 collapse) (STV 1.0 0.99))
    (: collapse_pat (Patient sk_collapse_1 sk_bridge_1) (STV 1.0 0.99))
    (: e_bridge (Member sk_bridge_1 bridge) (STV 1.0 0.99))
    (: collapse_past (Past sk_collapse_1) (STV 1.0 0.99))
    (: e_snap (Member sk_snap_1 snap) (STV 1.0 0.99))
    (: snap_pat (Patient sk_snap_1 sk_cable_1) (STV 1.0 0.99))
    (: e_cable (Member sk_cable_1 cable) (STV 1.0 0.99))
    (: snap_past (Past sk_snap_1) (STV 1.0 0.99))
    (: conn (Because sk_collapse_1 sk_snap_1) (STV 1.0 0.99))

**[conn-because-fronted] Because the cable snapped, the bridge collapsed.** — fronting the subordinate clause changes NOTHING: the main clause is still the first argument (same atoms as [conn-because])

    (: e_collapse (Member sk_collapse_1 collapse) (STV 1.0 0.99))
    (: collapse_pat (Patient sk_collapse_1 sk_bridge_1) (STV 1.0 0.99))
    (: e_bridge (Member sk_bridge_1 bridge) (STV 1.0 0.99))
    (: collapse_past (Past sk_collapse_1) (STV 1.0 0.99))
    (: e_snap (Member sk_snap_1 snap) (STV 1.0 0.99))
    (: snap_pat (Patient sk_snap_1 sk_cable_1) (STV 1.0 0.99))
    (: e_cable (Member sk_cable_1 cable) (STV 1.0 0.99))
    (: snap_past (Past sk_snap_1) (STV 1.0 0.99))
    (: conn (Because sk_collapse_1 sk_snap_1) (STV 1.0 0.99))

**[coref-bridge-clause] The cottage burned, so the chimney toppled.** — in-sentence bridging: the definite part-NP in the second clause links to the first clause's whole by `PartOf` (same rule as cross-sentence bridging), alongside the surface connective

    (: e_burn (Member sk_burn_1 burn) (STV 1.0 0.99))
    (: burn_pat (Patient sk_burn_1 sk_cottage_1) (STV 1.0 0.99))
    (: e_cottage (Member sk_cottage_1 cottage) (STV 1.0 0.99))
    (: burn_past (Past sk_burn_1) (STV 1.0 0.99))
    (: e_topple (Member sk_topple_1 topple) (STV 1.0 0.99))
    (: topple_pat (Patient sk_topple_1 sk_chimney_1) (STV 1.0 0.99))
    (: e_chimney (Member sk_chimney_1 chimney) (STV 1.0 0.99))
    (: chimney_partof (PartOf sk_chimney_1 sk_cottage_1) (STV 1.0 0.99))
    (: topple_past (Past sk_topple_1) (STV 1.0 0.99))
    (: conn (So sk_burn_1 sk_topple_1) (STV 1.0 0.99))

**[conn-purpose] Liam saved money to buy a bicycle.** — purpose infinitive → head `To`, main action first; the non-finite purpose event carries NO tense/status atom (nothing is asserted about whether it occurred)

    (: e_save (Member sk_save_1 save) (STV 1.0 0.99))
    (: save_ag (Agent sk_save_1 liam) (STV 1.0 0.99))
    (: save_th (Theme sk_save_1 money) (STV 1.0 0.99))
    (: save_past (Past sk_save_1) (STV 1.0 0.99))
    (: liam_name (Name liam "Liam") (STV 1.0 0.99))
    (: e_buy (Member sk_buy_1 buy) (STV 1.0 0.99))
    (: buy_ag (Agent sk_buy_1 liam) (STV 1.0 0.99))
    (: buy_th (Theme sk_buy_1 sk_bicycle_1) (STV 1.0 0.99))
    (: e_bicycle (Member sk_bicycle_1 bicycle) (STV 1.0 0.99))
    (: conn (To sk_save_1 sk_buy_1) (STV 1.0 0.99))

**[conn-belief] The vendor believed the crowd would grow, so she restocked the cart.** — belief-reason "so": the antecedent is the attitude eventuality itself; the belief content attaches by `Stimulus` and keeps the status its own grammar marks ("would" → `Future`)

    (: e_believe (Member sk_believe_1 believe) (STV 1.0 0.99))
    (: believe_exp (Experiencer sk_believe_1 sk_vendor_1) (STV 1.0 0.99))
    (: e_vendor (Member sk_vendor_1 vendor) (STV 1.0 0.99))
    (: believe_past (Past sk_believe_1) (STV 1.0 0.99))
    (: e_grow (Member sk_grow_1 grow) (STV 1.0 0.99))
    (: grow_pat (Patient sk_grow_1 sk_crowd_1) (STV 1.0 0.99))
    (: e_crowd (Member sk_crowd_1 crowd) (STV 1.0 0.99))
    (: grow_future (Future sk_grow_1) (STV 1.0 0.99))
    (: believe_stim (Stimulus sk_believe_1 sk_grow_1) (STV 1.0 0.99))
    (: e_restock (Member sk_restock_1 restock) (STV 1.0 0.99))
    (: restock_ag (Agent sk_restock_1 sk_vendor_1) (STV 1.0 0.99))
    (: restock_pat (Patient sk_restock_1 sk_cart_1) (STV 1.0 0.99))
    (: e_cart (Member sk_cart_1 cart) (STV 1.0 0.99))
    (: restock_past (Past sk_restock_1) (STV 1.0 0.99))
    (: conn (So sk_believe_1 sk_restock_1) (STV 1.0 0.99))

**[conn-but] The rooster crowed, but the farmhand dozed.** — adversative "but" is captured like any other stated connective: surface head `But`, surface order

    (: e_crow (Member sk_crow_1 crow) (STV 1.0 0.99))
    (: e_rooster (Member sk_rooster_1 rooster) (STV 1.0 0.99))
    (: e_crow_ag (Agent sk_crow_1 sk_rooster_1) (STV 1.0 0.99))
    (: e_crow_past (Past sk_crow_1) (STV 1.0 0.99))
    (: e_doze (Member sk_doze_1 doze) (STV 1.0 0.99))
    (: e_farmhand (Member sk_farmhand_1 farmhand) (STV 1.0 0.99))
    (: e_doze_ag (Agent sk_doze_1 sk_farmhand_1) (STV 1.0 0.99))
    (: e_doze_past (Past sk_doze_1) (STV 1.0 0.99))
    (: conn (But sk_crow_1 sk_doze_1) (STV 1.0 0.99))

**[conn-no-but-defeasible] Reptiles are cold-blooded, but sea turtles aren't.** — a "but" introducing a **defeasible exception** to a generic is consumed by that construction (generic clauses reify no eventualities → no endpoints): the three-fact exception pattern and **NO** connective atom

    (: general (Inheritance reptile cold_blooded) (STV 0.9 0.9))
    (: taxonomy (Inheritance sea_turtle reptile) (STV 1.0 0.99))
    (: genus (Inheritance sea_turtle turtle) (STV 1.0 0.99))
    (: exception (Inheritance sea_turtle cold_blooded) (STV 0.0 0.99))

**[conn-although] Although it snowed, the marathon proceeded.** — concessive → surface head `Although`; the concessive clause is SUBORDINATE, so the fronted MAIN clause is still the first argument (the weather clause keeps its expletive-"it" agentless form)

    (: e_snow (Member sk_snow_1 snow) (STV 1.0 0.99))
    (: snow_past (Past sk_snow_1) (STV 1.0 0.99))
    (: e_proceed (Member sk_proceed_1 proceed) (STV 1.0 0.99))
    (: proceed_ag (Agent sk_proceed_1 sk_marathon_1) (STV 1.0 0.99))
    (: e_marathon (Member sk_marathon_1 marathon) (STV 1.0 0.99))
    (: proceed_past (Past sk_proceed_1) (STV 1.0 0.99))
    (: conn (Although sk_proceed_1 sk_snow_1) (STV 1.0 0.99))

**[conn-verb] The nurse kept the toddler from falling.** — a causation-flavored VERB is an ordinary event (never a relation head); the embedded eventuality attaches by `Theme`, the shared NP takes its role INSIDE the embedded event, and the non-finite embedded event carries no tense/status atom

    (: e_keep (Member sk_keep_1 keep) (STV 1.0 0.99))
    (: keep_ag (Agent sk_keep_1 sk_nurse_1) (STV 1.0 0.99))
    (: e_nurse (Member sk_nurse_1 nurse) (STV 1.0 0.99))
    (: keep_past (Past sk_keep_1) (STV 1.0 0.99))
    (: keep_th (Theme sk_keep_1 sk_fall_1) (STV 1.0 0.99))
    (: e_fall (Member sk_fall_1 fall) (STV 1.0 0.99))
    (: fall_pat (Patient sk_fall_1 sk_toddler_1) (STV 1.0 0.99))
    (: e_toddler (Member sk_toddler_1 toddler) (STV 1.0 0.99))

**[conn-why-q] Why did the bridge collapse?** — the focus event pattern (built per Queries, incl. tense) + the canonical ask-conjunct `(ReasonFor $r <focus>)`; seeded rules derive `ReasonFor` from whatever surface head was stored, so no head enumeration is needed

    (: $prf (And (Member $f collapse) (Patient $f $b) (Member $b bridge) (Past $f) (ReasonFor $r $f)) $tv)

**[conn-whatfor-q] What did Liam save for?** — "what … for" asks the purpose only → conjoin `(PurposeOf $g <focus>)`

    (: $prf (And (Member $e save) (Agent $e $l) (Name $l "Liam") (Past $e) (PurposeOf $g $e)) $tv)

**[conn-how-q] How did the shutdown happen?** — mechanism → the two-hop `ReasonFor` chain into the focus, binding the intermediate

    (: $prf (And (Member $f shutdown) (ReasonFor $mid $f) (ReasonFor $c $mid)) $tv)

## Propositional attitudes (#41)

**[att-believe] Priya believes that the tunnel is flooded.** — non-factive attitude: reify the attitude event + `Experiencer` holder + the complement **sealed** as one term under `Theme`; P is **not** asserted at top level (belief ≠ truth)

    (: e_believe (Member sk_believe_1 believe) (STV 1.0 0.99))
    (: e_believe_exp (Experiencer sk_believe_1 priya) (STV 1.0 0.99))
    (: e_believe_theme (Theme sk_believe_1 (Member sk_tunnel_1 flooded)) (STV 1.0 0.99))
    (: priya_name (Name priya "Priya") (STV 1.0 0.99))

**[att-know] The inspector knows that the cable is frayed.** — factive attitude: same shape, and the complement is **also** emitted as ordinary top-level facts (know entails P)

    (: e_know (Member sk_know_1 know) (STV 1.0 0.99))
    (: e_know_exp (Experiencer sk_know_1 sk_inspector_1) (STV 1.0 0.99))
    (: e_inspector (Member sk_inspector_1 inspector) (STV 1.0 0.99))
    (: e_know_theme (Theme sk_know_1 (Member sk_cable_1 frayed)) (STV 1.0 0.99))
    (: e_cable_frayed (Member sk_cable_1 frayed) (STV 1.0 0.99))

**[att-negation] Omar doesn't think that the deal will close.** — negation targets the **attitude** (strength-0 bundle), not P; the complement stays sealed and unasserted

    (: e_not_think (And (Member sk_think_1 think) (Experiencer sk_think_1 omar) (Theme sk_think_1 (And (Member sk_close_1 close) (Patient sk_close_1 sk_deal_1) (Future sk_close_1)))) (STV 0.0 0.99))
    (: omar_name (Name omar "Omar") (STV 1.0 0.99))

**[att-entity-object] Lena distrusts the auditor.** — CONTROL: a psych verb with an **entity** object keeps `Experiencer`/`Stimulus`; no clausal complement, no sealing, no `Theme`-term

    (: e_distrust (Member sk_distrust_1 distrust) (STV 1.0 0.99))
    (: e_distrust_exp (Experiencer sk_distrust_1 lena) (STV 1.0 0.99))
    (: e_distrust_stim (Stimulus sk_distrust_1 sk_auditor_1) (STV 1.0 0.99))
    (: e_auditor (Member sk_auditor_1 auditor) (STV 1.0 0.99))
    (: lena_name (Name lena "Lena") (STV 1.0 0.99))

## Focus particles & clefts (#38)

**[foc-only] Only the treasurer objected.** — exclusive focus → assert the prejacent + opaque `(Only filler event)`; NO unbounded exclusion rule

    (: e_object (Member sk_object_1 object) (STV 1.0 0.99))
    (: e_object_agent (Agent sk_object_1 sk_treasurer_1) (STV 1.0 0.99))
    (: e_treasurer (Member sk_treasurer_1 treasurer) (STV 1.0 0.99))
    (: e_object_past (Past sk_object_1) (STV 1.0 0.99))
    (: e_only (Only sk_treasurer_1 sk_object_1) (STV 1.0 0.99))

**[foc-even] Even the veteran hesitated.** — scalar focus → prejacent + opaque `(Even filler event)`; the least-expected presupposition is recorded structurally, not asserted

    (: e_hesitate (Member sk_hesitate_1 hesitate) (STV 1.0 0.99))
    (: e_hesitate_agent (Agent sk_hesitate_1 sk_veteran_1) (STV 1.0 0.99))
    (: e_veteran (Member sk_veteran_1 veteran) (STV 1.0 0.99))
    (: e_hesitate_past (Past sk_hesitate_1) (STV 1.0 0.99))
    (: e_even (Even sk_veteran_1 sk_hesitate_1) (STV 1.0 0.99))

**[foc-also] Marco also signed the petition.** — additive focus → prejacent + opaque `(Also filler event)`; the "someone else too" presupposition is not asserted

    (: e_sign (Member sk_sign_1 sign) (STV 1.0 0.99))
    (: e_sign_agent (Agent sk_sign_1 marco) (STV 1.0 0.99))
    (: e_sign_theme (Theme sk_sign_1 sk_petition_1) (STV 1.0 0.99))
    (: e_petition (Member sk_petition_1 petition) (STV 1.0 0.99))
    (: e_sign_past (Past sk_sign_1) (STV 1.0 0.99))
    (: e_also (Also marco sk_sign_1) (STV 1.0 0.99))
    (: marco_name (Name marco "Marco") (STV 1.0 0.99))

**[foc-itcleft] It was the courier who lost the parcel.** — it-cleft = exhaustive identificational focus → prejacent + opaque `(Cleft filler event)`

    (: e_lose (Member sk_lose_1 lose) (STV 1.0 0.99))
    (: e_lose_agent (Agent sk_lose_1 sk_courier_1) (STV 1.0 0.99))
    (: e_lose_theme (Theme sk_lose_1 sk_parcel_1) (STV 1.0 0.99))
    (: e_courier (Member sk_courier_1 courier) (STV 1.0 0.99))
    (: e_parcel (Member sk_parcel_1 parcel) (STV 1.0 0.99))
    (: e_lose_past (Past sk_lose_1) (STV 1.0 0.99))
    (: e_cleft (Cleft sk_courier_1 sk_lose_1) (STV 1.0 0.99))

**[foc-pseudocleft] What the committee wanted was transparency.** — pseudo-cleft → assert the backgrounded clause (committee wanted transparency) + `(Cleft focus event)`

    (: e_want (Member sk_want_1 want) (STV 1.0 0.99))
    (: e_want_exp (Experiencer sk_want_1 sk_committee_1) (STV 1.0 0.99))
    (: e_committee (Member sk_committee_1 committee) (STV 1.0 0.99))
    (: e_want_stim (Stimulus sk_want_1 transparency) (STV 1.0 0.99))
    (: e_want_past (Past sk_want_1) (STV 1.0 0.99))
    (: e_cleft (Cleft transparency sk_want_1) (STV 1.0 0.99))

**[foc-vp] Greta only hummed.** — VP / whole-predicate focus → the **verb-class lemma** is the filler

    (: e_hum (Member sk_hum_1 hum) (STV 1.0 0.99))
    (: e_hum_agent (Agent sk_hum_1 greta) (STV 1.0 0.99))
    (: e_hum_past (Past sk_hum_1) (STV 1.0 0.99))
    (: e_hum_only (Only hum sk_hum_1) (STV 1.0 0.99))
    (: greta_name (Name greta "Greta") (STV 1.0 0.99))

## Imperatives (#47)

**[imp-positive] Lock the gate.** — directive → the commanded event **sealed** under `(Directive <sealed-event>)`; no tense/occurrence asserted, no addressee referent (real object referents still typed)

    (: e_directive (Directive (And (Member sk_lock_1 lock) (Patient sk_lock_1 sk_gate_1))) (STV 1.0 0.99))
    (: e_gate (Member sk_gate_1 gate) (STV 1.0 0.99))

**[imp-negative] Never share the passcode.** — negative command → `(Forbid <sealed-event>)`

    (: e_forbid (Forbid (And (Member sk_share_1 share) (Theme sk_share_1 sk_passcode_1))) (STV 1.0 0.99))
    (: e_passcode (Member sk_passcode_1 passcode) (STV 1.0 0.99))

**[imp-vocative] Rosa, water the plants.** — explicit vocative addressee rides **inside** the sealed term as the `Agent`

    (: e_directive (Directive (And (Member sk_water_1 water) (Agent sk_water_1 rosa) (Patient sk_water_1 sk_group_1))) (STV 1.0 0.99))
    (: e_plants (GroupOf sk_group_1 plant) (STV 1.0 0.99))
    (: rosa_name (Name rosa "Rosa") (STV 1.0 0.99))

## Kind-level (non-distributing) properties (#44)

**[kind-extinct] The great auk is extinct.** — a KIND-only property (no individual can be "extinct") → opaque `(KindProperty kind prop)`, which does **not** distribute (unlike `Inheritance`, which would hand "extinct" to every instance via member-inheritance); an optional taxonomy genus is fine

    (: ga_genus (Inheritance great_auk auk) (STV 1.0 0.99))
    (: ga_extinct (KindProperty great_auk extinct) (STV 1.0 0.9))

**[kind-endangered] Rhinos are endangered.** — same class (endangered / widespread / common / rare / numerous / thriving) → `(KindProperty rhino endangered)`

    (: rhino_endangered (KindProperty rhino endangered) (STV 1.0 0.9))

**[kind-control-grey] Sparrows are grey.** — CONTROL: an ordinary property one individual CAN hold stays a distributing `(Inheritance kind prop)@0.9`, NOT `KindProperty`

    (: sparrow_grey (Inheritance sparrow grey) (STV 0.9 0.9))

## Ordinals (#42)

**[ord-nth] Nadia was the second to finish.** — `(Ordinal <entity> <n> <scale>)`: rank `n` on an ordering scale (the associated event); "first" → `1`; a superlative is the rank-1 special case

    (: nadia_ord (Ordinal nadia 2 finish) (STV 1.0 0.99))
    (: e_finish (Member sk_finish_1 finish) (STV 1.0 0.99))
    (: e_finish_ag (Agent sk_finish_1 nadia) (STV 1.0 0.99))
    (: e_finish_past (Past sk_finish_1) (STV 1.0 0.99))
    (: nadia_name (Name nadia "Nadia") (STV 1.0 0.99))

**[ord-noun] The fourth witness testified.** — ordinal on the head noun ranked by its associated event (`testify`)

    (: witness_ord (Ordinal sk_witness_1 4 testify) (STV 1.0 0.99))
    (: e_witness (Member sk_witness_1 witness) (STV 1.0 0.99))
    (: e_testify (Member sk_testify_1 testify) (STV 1.0 0.99))
    (: e_testify_ag (Agent sk_testify_1 sk_witness_1) (STV 1.0 0.99))
    (: e_testify_past (Past sk_testify_1) (STV 1.0 0.99))

## Aspectual particles (#43)

**[asp-again] The printer jammed again.** — repetitive → the eventuality asserted normally + an opaque `(Again <event>)` tag (the prior-event presupposition recorded, not asserted); never stuffed into `Manner`

    (: jam_ev (Member sk_jam_1 jam) (STV 1.0 0.99))
    (: jam_pat (Patient sk_jam_1 sk_printer_1) (STV 1.0 0.99))
    (: jam_printer (Member sk_printer_1 printer) (STV 1.0 0.99))
    (: jam_past (Past sk_jam_1) (STV 1.0 0.99))
    (: jam_again (Again sk_jam_1) (STV 1.0 0.99))

**[asp-still] The reactor is still running.** — continuative (the positive counterpart of cessation) → `(Still <event>)`

    (: run_ev (Member sk_run_1 run) (STV 1.0 0.99))
    (: run_ag (Agent sk_run_1 sk_reactor_1) (STV 1.0 0.99))
    (: run_reactor (Member sk_reactor_1 reactor) (STV 1.0 0.99))
    (: run_ong (Ongoing sk_run_1) (STV 1.0 0.99))
    (: run_still (Still sk_run_1) (STV 1.0 0.99))

**[asp-already] The ferry had already departed.** — phasal (earlier than expected) → `(Already <event>)`

    (: dep_ev (Member sk_depart_1 depart) (STV 1.0 0.99))
    (: dep_ag (Agent sk_depart_1 sk_ferry_1) (STV 1.0 0.99))
    (: dep_ferry (Member sk_ferry_1 ferry) (STV 1.0 0.99))
    (: dep_past (Past sk_depart_1) (STV 1.0 0.99))
    (: dep_already (Already sk_depart_1) (STV 1.0 0.99))

**[asp-yet] The invoice hasn't been paid yet.** — NPI "yet" under negation: the strength-0 denial bundle + the `(Yet <event>)` expectation tag as its **own positive atom OUTSIDE** the bundle (inside, the expectation would read as denied)

    (: e_invoice (Member sk_invoice_1 invoice) (STV 1.0 0.99))
    (: e_pay_neg (And (Member sk_pay_1 pay) (Patient sk_pay_1 sk_invoice_1) (Past sk_pay_1)) (STV 0.0 0.99))
    (: e_pay_yet (Yet sk_pay_1) (STV 1.0 0.99))

## Comparison-class & clausal comparatives (#45 / #46)

**[cmp-class] Bruno is fast for a tortoise.** — comparison-class: X exceeds the class norm, NOT an absolute claim → `(Degree X <scale> (forKind <class>))`, with **no** plain `(Member X <scale>)`

    (: bruno_deg (Degree bruno fast (forKind tortoise)) (STV 1.0 0.99))
    (: bruno_name (Name bruno "Bruno") (STV 1.0 0.99))

**[cmp-class-intens] Tomas is very strong for a violinist.** — an intensifier beside a comparison-class: BOTH `Degree` atoms, the positive property still un-asserted

    (: tomas_deg_very (Degree tomas strong very) (STV 1.0 0.99))
    (: tomas_deg_class (Degree tomas strong (forKind violinist)) (STV 1.0 0.99))
    (: tomas_name (Name tomas "Tomas") (STV 1.0 0.99))

**[cmp-clausal] More books sold than the store ordered.** — a comparative whose standard is a CLAUSE and dimension is a QUANTITY → reify both clauses, make each varying quantity a group, compare with `More` on the quantity scale (antonym pole: "more" → `many`, "fewer/less" → `few`)

    (: sell_ev (Member sk_sell_1 sell) (STV 1.0 0.99))
    (: sell_grp (GroupOf sk_sold_1 book) (STV 1.0 0.99))
    (: sell_thm (Theme sk_sell_1 sk_sold_1) (STV 1.0 0.99))
    (: sell_past (Past sk_sell_1) (STV 1.0 0.99))
    (: order_ev (Member sk_order_1 order) (STV 1.0 0.99))
    (: order_ag (Agent sk_order_1 sk_store_1) (STV 1.0 0.99))
    (: order_grp (GroupOf sk_ord_1 book) (STV 1.0 0.99))
    (: order_thm (Theme sk_order_1 sk_ord_1) (STV 1.0 0.99))
    (: order_past (Past sk_order_1) (STV 1.0 0.99))
    (: store_m (Member sk_store_1 store) (STV 1.0 0.99))
    (: sold_more (More many sk_sold_1 sk_ord_1) (STV 1.0 0.99))

## Embedded questions (#39)

**[eq-whether] The referee wondered whether the goal counted.** — a polar embedded question → reify the matrix verb + `Experiencer` holder (as an attitude) + the QUESTION sealed under `Theme` as `(Whether <sealed-P>)`; P is not asserted and "whether P" must **not** become `(Might P)`

    (: e1_referee (Member sk_referee_1 referee) (STV 1.0 0.99))
    (: e1_wonder (Member sk_wonder_1 wonder) (STV 1.0 0.99))
    (: e1_wonder_exp (Experiencer sk_wonder_1 sk_referee_1) (STV 1.0 0.99))
    (: e1_wonder_past (Past sk_wonder_1) (STV 1.0 0.99))
    (: e1_wonder_theme (Theme sk_wonder_1 (Whether (And (Member sk_count_1 count) (Experiencer sk_count_1 sk_goal_1) (Past sk_count_1)))) (STV 1.0 0.99))
    (: e1_goal (Member sk_goal_1 goal) (STV 1.0 0.99))

**[eq-wh-who] The clerk asked who approved the refund.** — a constituent wh-question → `(Question who <sealed-content>)`, the wh-word `who` reused as the **gap** filler in the Agent slot

    (: e3_clerk (Member sk_clerk_1 clerk) (STV 1.0 0.99))
    (: e3_ask (Member sk_ask_1 ask) (STV 1.0 0.99))
    (: e3_ask_exp (Experiencer sk_ask_1 sk_clerk_1) (STV 1.0 0.99))
    (: e3_ask_past (Past sk_ask_1) (STV 1.0 0.99))
    (: e3_ask_theme (Theme sk_ask_1 (Question who (And (Member sk_approve_1 approve) (Agent sk_approve_1 who) (Theme sk_approve_1 sk_refund_1) (Past sk_approve_1)))) (STV 1.0 0.99))
    (: e3_refund (Member sk_refund_1 refund) (STV 1.0 0.99))

**[eq-wh-when] The historian discovered when the treaty was signed.** — wh-`when` → `(Question when …)`, `when` filling the `(Time … when)` gap

    (: e2_historian (Member sk_historian_1 historian) (STV 1.0 0.99))
    (: e2_discover (Member sk_discover_1 discover) (STV 1.0 0.99))
    (: e2_discover_exp (Experiencer sk_discover_1 sk_historian_1) (STV 1.0 0.99))
    (: e2_discover_past (Past sk_discover_1) (STV 1.0 0.99))
    (: e2_discover_theme (Theme sk_discover_1 (Question when (And (Member sk_sign_1 sign) (Theme sk_sign_1 sk_treaty_1) (Time sk_sign_1 when) (Past sk_sign_1)))) (STV 1.0 0.99))
    (: e2_treaty (Member sk_treaty_1 treaty) (STV 1.0 0.99))

## Counterfactual conditionals (#40)

**[cf-basic] If the levee had held, the town would have survived.** — subjunctive counterfactual → opaque `(Counterfactual (And <ante>) (And <cons>))` (both clauses sealed, neither asserted true) + the antecedent re-asserted at strength-`0.0` (the "it didn't happen" presupposition); the consequent is never asserted (real referents levee/town are still typed)

    (: e1_cf (Counterfactual (And (Member sk_hold_1 hold) (Patient sk_hold_1 sk_levee_1) (Past sk_hold_1)) (And (Member sk_survive_1 survive) (Agent sk_survive_1 sk_town_1) (Past sk_survive_1))) (STV 1.0 0.99))
    (: e1_levee (Member sk_levee_1 levee) (STV 1.0 0.99))
    (: e1_town (Member sk_town_1 town) (STV 1.0 0.99))
    (: e1_neg (And (Member sk_hold_1 hold) (Patient sk_hold_1 sk_levee_1) (Past sk_hold_1)) (STV 0.0 0.99))

**[cf-named] If Omar had studied, he would have passed.** — same shape with the consequent subject "he" → `omar` by coreference

    (: e2_cf (Counterfactual (And (Member sk_study_1 study) (Agent sk_study_1 omar) (Past sk_study_1)) (And (Member sk_pass_1 pass) (Agent sk_pass_1 omar) (Past sk_pass_1))) (STV 1.0 0.99))
    (: e2_neg (And (Member sk_study_1 study) (Agent sk_study_1 omar) (Past sk_study_1)) (STV 0.0 0.99))
    (: e2_name (Name omar "Omar") (STV 1.0 0.99))
