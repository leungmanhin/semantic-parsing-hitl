# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 945 rooted-subtree units of the §4.3.1 faithful view (`out_tier_b/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
| vectorisation | per record, the number of matches (variable bindings) of each unit, recounted with the miner's enumerator (k = 4, 28 eligible atoms per record, surface atoms excluded, constants verbatim) and verified against the inventory; raw counts, no scaling |
| autoencoder | one hidden layer of k sigmoid units (dial [32], adopted 32), linear output, tied decoder x_hat = h W + c; W uniform(±sqrt(6/(F+k))), b = 0, c = column means |
| loss | mean over records of the squared reconstruction error summed over units + 0.0001·‖W‖² + beta·Σ_j KL(rho ‖ mean activation_j), rho 0.1, beta [2.0] (adopted 2; the plain AE beta 0 and beta 2 are twin runs `ae_faithful_beta2_plain.*` / `ae_faithful_beta2_beta2.*` when present) |
| training | full batch, Adam lr 0.01, 10000 epochs, float32, 8 thread(s); seed 0 adopted, seeds 0..4 for stability |
| ties | cosine between two units' encoder weight vectors (columns of W); gate cosine ≥ tau, dial [0.8, 0.85, 0.9, 0.95], adopted 0.85; recording floor 0.8 |
| norm floor | a unit enters the comparison when its encoder-vector norm is at least the floor; dial none, median, init, adopted init (init = the initialisation norm a·sqrt(k/3), a = sqrt(6/(F+k)): training grew the vector beyond where it started; median = the median unit norm) |
| co-occurrence | field per pair from the units' record sets: exclusive / overlapping / nested / same-records; part-of = §4.3.1 containment — never a filter |
| tie groups | complete linkage on the cosine distance of the entering units' weight vectors, cut at 1 − tau: every pair inside a group passes the gate; a partition (the pairwise record is the JSONL) |
| renderings | one .metta per bottleneck at the adopted gate (passes grouped by relation, exclusive first); the cosine and floor dials are read off the records |

## Count matrix

- 1950 records × 945 units; 7956 non-zero cells (4.08 units per record on average); 363 repeat matches beyond the first (max count 4); 0 record(s) truncated at 28 atoms by the miner's cap; column sums and non-zero rows reproduce the inventory's occurrences and support sets exactly

## Training

| k | beta | seed | reconstruction / record | R² | mean activation | units > 0.5 / record | reconstruction at each tenth of the epochs |
|---|---|---|---|---|---|---|---|
| 32 | 2 | 0 | 2.0971 | 0.5288 | 0.1007 | 0.62 | 2.3184 / 2.2169 / 2.1403 / 2.1164 / 2.1037 / 2.1003 / 2.0987 / 2.0982 / 2.0974 / 2.0972 |
| 32 | 2 | 1 | 2.096 | 0.529 | 0.1009 | 0.55 | 2.3336 / 2.2053 / 2.1394 / 2.1167 / 2.1042 / 2.1011 / 2.0985 / 2.0966 / 2.1001 / 2.096 |
| 32 | 2 | 2 | 2.0939 | 0.5295 | 0.1008 | 0.57 | 2.3361 / 2.2181 / 2.1476 / 2.1131 / 2.1033 / 2.0963 / 2.0953 / 2.0942 / 2.0938 / 2.0939 |
| 32 | 2 | 3 | 2.1003 | 0.5281 | 0.1011 | 0.57 | 2.3468 / 2.2218 / 2.1473 / 2.1249 / 2.1069 / 2.1015 / 2.0998 / 2.1069 / 2.0965 / 2.0997 |
| 32 | 2 | 4 | 2.0968 | 0.5289 | 0.1008 | 0.56 | 2.3362 / 2.2127 / 2.1499 / 2.1182 / 2.1045 / 2.1008 / 2.102 / 2.0986 / 2.1009 / 2.0969 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 2 | 0.000 (945) | 0.157 (473) | 0.256 (295) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive (shape-parallel) | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 2 | 0.80 | 873 | 23 (6) | 344 | 390 | 116 | 349 | 50 | 796 | 56 (39 / 650) | 2599 / 502 | 1578 / 101 | 873 / 23 |
| 32 | 2 | 0.85 | 797 | 13 (4) | 290 | 378 | 116 | 338 | 50 | 706 | 52 (56 / 650) | 1871 / 208 | 1267 / 40 | 797 / 13 |
| 32 | 2 | 0.90 | 674 | 4 (1) | 209 | 345 | 116 | 308 | 47 | 511 | 51 (77 / 650) | 1334 / 78 | 981 / 11 | 674 / 4 |
| 32 | 2 | 0.95 | 424 | 0 (0) | 103 | 205 | 116 | 207 | 40 | 344 | 56 (100 / 650) | 764 / 34 | 563 / 2 | 424 / 0 |

## Adopted block: k 32, beta 2, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading; shape-parallel ones are the rules)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 0.911 | 5/5 | exclusive (shape-parallel) | 0.48 / 0.28 | `(And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))` (6) | `(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))` (4) | 0 | The ball ricocheted off the bat. | The concert drew attendees from the surrounding towns. |
| 0.897 | 5/5 | exclusive (shape-parallel) | 0.56 / 0.32 | `(And (Patient $e0 $x0) (Source $e0 $x1))` (8) | `(And (Source $e0 $x0) (Theme $e0 $x1))` (5) | 0 | The ball ricocheted off the bat. | Mark tried to steal a hot dog from a street vendor. |
| 0.893 | 4/5 | exclusive (shape-parallel) | 0.38 / 0.53 | `(Member $e0 work)` (9) | `(Member $e0 cry)` (4) | 0 | The site should be working just fine now. | Rima and Skura stopped crying. |
| 0.874 | 2/5 | exclusive (shape-parallel) | 0.86 / 0.56 | `(And (Future $e0) (Patient $e0 $x0))` (11) | `(And (Future $e0) (Theme $e0 $x0))` (8) | 0 | The whole thing is about to collapse. | Starting next month, Brazil will implement the law of reciprocity with Spain. |
| 0.909 | 4/5 | exclusive | 0.35 / 0.53 | `(And (Member $e0 work) (Past $e0))` (5) | `(Member $e0 cry)` (4) | 0 | The travel adaptor worked perfectly in Europe. | Rima and Skura stopped crying. |
| 0.907 | 5/5 | exclusive | 0.48 / 0.32 | `(And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))` (6) | `(And (Source $e0 $x0) (Theme $e0 $x1))` (5) | 0 | The ball ricocheted off the bat. | Mark tried to steal a hot dog from a street vendor. |
| 0.907 | 5/5 | exclusive | 0.56 / 0.28 | `(And (Patient $e0 $x0) (Source $e0 $x1))` (8) | `(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))` (4) | 0 | The ball ricocheted off the bat. | The concert drew attendees from the surrounding towns. |
| 0.875 | 3/5 | exclusive | 0.37 / 0.26 | `(And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))` (5) | `(And (Member $e0 fall) (Past $e0) (Source $e0 $x0))` (3) | 0 | Someone ate all the cookies from the cookie jar. | Ice pellets were falling from the sky. |
| 0.875 | 3/5 | exclusive | 0.37 / 0.26 | `(And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))` (5) | `(And (Member $e0 fall) (Source $e0 $x0))` (3) | 0 | Someone ate all the cookies from the cookie jar. | Ice pellets were falling from the sky. |
| 0.874 | 5/5 | exclusive | 0.32 / 0.26 | `(And (Source $e0 $x0) (Theme $e0 $x1))` (5) | `(And (Member $e0 fall) (Past $e0) (Source $e0 $x0))` (3) | 0 | Mark tried to steal a hot dog from a street vendor. | Ice pellets were falling from the sky. |
| 0.874 | 5/5 | exclusive | 0.32 / 0.26 | `(And (Source $e0 $x0) (Theme $e0 $x1))` (5) | `(And (Member $e0 fall) (Source $e0 $x0))` (3) | 0 | Mark tried to steal a hot dog from a street vendor. | Ice pellets were falling from the sky. |
| 0.865 | 5/5 | exclusive | 0.28 / 0.26 | `(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))` (4) | `(And (Member $e0 fall) (Past $e0) (Source $e0 $x0))` (3) | 0 | The concert drew attendees from the surrounding towns. | Ice pellets were falling from the sky. |
| 0.865 | 5/5 | exclusive | 0.28 / 0.26 | `(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))` (4) | `(And (Member $e0 fall) (Source $e0 $x0))` (3) | 0 | The concert drew attendees from the surrounding towns. | Ice pellets were falling from the sky. |

## Adopted block: k 32, beta 2, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.93 / 0.93 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.93 / 0.93 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.93 / 0.93 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(Holder $e0 $x0)` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records | 0.93 / 0.93 | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.93 / 0.93 | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | `(Holder $e0 $x0)` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.93 / 0.93 | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (23) | `(Holder $e0 $x0)` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.78 / 0.78 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (12) | `(And (Member $e0 start) (Theme $e0 $e1))` (12) | 12 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records (part-of) | 0.67 / 0.67 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records | 0.65 / 0.65 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` (7) | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | 7 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records (part-of) | 0.74 / 0.74 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.74 / 0.74 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.74 / 0.74 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records | 0.74 / 0.74 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.74 / 0.74 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.74 / 0.74 | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.50 / 0.50 | `(And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))` (5) | `(And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))` (5) | 5 | The crack in the windshield has started to disappear. | The crack in the windshield has started to disappear. |
| 1.000 | 5/5 | same-records (part-of) | 0.27 / 0.27 | `(And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))` (5) | `(And (Cardinality $x0 <num>) (Patient $e0 $x0))` (5) | 5 | One of the windows was broken. | One of the windows was broken. |
| 1.000 | 5/5 | same-records (part-of) | 0.34 / 0.34 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.34 / 0.34 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.34 / 0.34 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records | 0.34 / 0.34 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` (5) | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.34 / 0.34 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` (5) | `(And (Holder $e0 $x0) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.34 / 0.34 | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.94 / 0.94 | `(And (Member $e0 contain) (Theme $e0 $x0))` (5) | `(Member $e0 contain)` (5) | 5 | A deck of cards contains four kings, four queens, and four jacks. | A deck of cards contains four kings, four queens, and four jacks. |
| 1.000 | 5/5 | same-records | 0.52 / 0.52 | `(And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (4) | `(And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))` (4) | 4 | Both girls started to cry. | Both girls started to cry. |
