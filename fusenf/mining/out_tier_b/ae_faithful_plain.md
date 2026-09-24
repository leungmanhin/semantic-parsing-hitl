# §4.3.5 Autoencoder Analysis — FAITHFUL arm (paper as written)

> "We vectorize each SENF graph by its feature counts and train a shallow autoencoder with a low-dimensional bottleneck. Input features whose activations are tied together in the encoder weights indicate clusters of subtrees that serve interchangeable semantic functions — another source of consolidation rules." — FUSE-NF §4.3.5

## Implementation parameters (doc-open choices, disclosed)

| parameter | choice |
|---|---|
| features | the 945 rooted-subtree units of the §4.3.1 faithful view (`out_tier_b/patterns2_faithful.jsonl`), taken as-is: subsumed units and identical columns included (the faithful arm never pre-filters its input; dedup / closed-only / binary input are additions) |
| vectorisation | per record, the number of matches (variable bindings) of each unit, recounted with the miner's enumerator (k = 4, 28 eligible atoms per record, surface atoms excluded, constants verbatim) and verified against the inventory; raw counts, no scaling |
| autoencoder | one hidden layer of k sigmoid units (dial [32], adopted 32), linear output, tied decoder x_hat = h W + c; W uniform(±sqrt(6/(F+k))), b = 0, c = column means |
| loss | mean over records of the squared reconstruction error summed over units + 0.0001·‖W‖² + beta·Σ_j KL(rho ‖ mean activation_j), rho 0.1, beta [0.0] (adopted 0; the plain AE beta 0 and beta 2 are twin runs `ae_faithful_plain_plain.*` / `ae_faithful_plain_beta2.*` when present) |
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
| 32 | 0 | 0 | 2.082 | 0.5322 | 0.3167 | 4.31 | 2.1251 / 2.1133 / 2.0957 / 2.0885 / 2.0911 / 2.0856 / 2.0862 / 2.0981 / 2.0954 / 2.0819 |
| 32 | 0 | 1 | 2.0807 | 0.5325 | 0.3193 | 4.82 | 2.1304 / 2.1038 / 2.0928 / 2.0944 / 2.1035 / 2.0911 / 2.0843 / 2.0813 / 2.1023 / 2.0806 |
| 32 | 0 | 2 | 2.101 | 0.5279 | 0.3181 | 5.43 | 2.1278 / 2.0993 / 2.1109 / 2.0949 / 2.09 / 2.0839 / 2.1116 / 2.0922 / 2.081 / 2.0955 |
| 32 | 0 | 3 | 2.0891 | 0.5306 | 0.3053 | 5.23 | 2.132 / 2.1055 / 2.0901 / 2.0894 / 2.0853 / 2.085 / 2.0822 / 2.0964 / 2.0809 / 2.0939 |
| 32 | 0 | 4 | 2.0852 | 0.5315 | 0.3039 | 3.44 | 2.129 / 2.1089 / 2.0915 / 2.0992 / 2.0846 / 2.0853 / 2.0815 / 2.0826 / 2.0804 / 2.0846 |

## Norm floors and entering units

| k | beta | floor none (units entering) | floor median (units entering) | floor init (units entering) |
|---|---|---|---|---|
| 32 | 0 | 0.000 (945) | 0.135 (473) | 0.256 (266) |

## Tied pairs across the dial (gate: cosine ≥ tau and both norms ≥ the adopted floor `init`)

| k | beta | cosine ≥ | pass | exclusive (shape-parallel) | overlapping | nested | same-records | part-of | shared with §4.3.3 passes | stable in all seeds | tie groups (untied / below floor) | pass / exclusive at floor none | pass / exclusive at floor median | pass / exclusive at floor init |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 32 | 0 | 0.80 | 800 | 23 (6) | 312 | 352 | 113 | 311 | 49 | 774 | 52 (31 / 679) | 2785 / 507 | 1643 / 104 | 800 / 23 |
| 32 | 0 | 0.85 | 723 | 20 (5) | 247 | 343 | 113 | 302 | 48 | 695 | 54 (35 / 679) | 2027 / 265 | 1308 / 61 | 723 / 20 |
| 32 | 0 | 0.90 | 569 | 2 (1) | 171 | 283 | 113 | 272 | 46 | 554 | 55 (51 / 679) | 1349 / 87 | 930 / 13 | 569 / 2 |
| 32 | 0 | 0.95 | 401 | 0 (0) | 86 | 202 | 113 | 203 | 41 | 389 | 51 (83 / 679) | 807 / 35 | 582 / 2 | 401 / 0 |

## Adopted block: k 32, beta 0, cosine ≥ 0.85, floor init — top 25 EXCLUSIVE passes (the paper's interchangeability reading; shape-parallel ones are the rules)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 0.905 | 5/5 | exclusive (shape-parallel) | 0.49 / 0.28 | `(And (Patient $e0 $x0) (Source $e0 $x1))` (8) | `(And (Source $e0 $x0) (Theme $e0 $x1))` (5) | 0 | The ball ricocheted off the bat. | Mark tried to steal a hot dog from a street vendor. |
| 0.869 | 5/5 | exclusive (shape-parallel) | 0.33 / 0.45 | `(Member $e0 work)` (9) | `(Member $e0 cry)` (4) | 0 | The site should be working just fine now. | Rima and Skura stopped crying. |
| 0.869 | 5/5 | exclusive (shape-parallel) | 0.76 / 0.37 | `(And (Agent $e0 $x0) (GroupOf $x0 person))` (8) | `(And (GroupOf $x0 person) (Patient $e0 $x0))` (5) | 0 | The people rebelled against the king. | Some of those rescued were pretty badly burned. |
| 0.869 | 5/5 | exclusive (shape-parallel) | 0.30 / 0.27 | `(Agent $e0 david)` (3) | `(Agent $e0 mark)` (3) | 0 | David was trying to reach Amanda. | Mark and Jessica began hanging out often. |
| 0.857 | 2/5 | exclusive (shape-parallel) | 0.62 / 0.44 | `(And (Future $e0) (Patient $e0 $x0))` (11) | `(And (Future $e0) (Theme $e0 $x0))` (8) | 0 | The whole thing is about to collapse. | Starting next month, Brazil will implement the law of reciprocity with Spain. |
| 0.906 | 5/5 | exclusive | 0.42 / 0.28 | `(And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))` (6) | `(And (Source $e0 $x0) (Theme $e0 $x1))` (5) | 0 | The ball ricocheted off the bat. | Mark tried to steal a hot dog from a street vendor. |
| 0.885 | 5/5 | exclusive | 0.37 / 0.28 | `(And (GroupOf $x0 person) (Patient $e0 $x0))` (5) | `(Member $e0 travel)` (5) | 0 | Some of those rescued were pretty badly burned. | Nothing is so pleasant as traveling alone. |
| 0.882 | 5/5 | exclusive | 0.30 / 0.45 | `(And (Member $e0 work) (Past $e0))` (5) | `(Member $e0 cry)` (4) | 0 | The travel adaptor worked perfectly in Europe. | Rima and Skura stopped crying. |
| 0.880 | 5/5 | exclusive | 0.37 / 0.27 | `(And (GroupOf $x0 person) (Patient $e0 $x0))` (5) | `(And (Member $e0 travel) (Past $e0))` (3) | 0 | Some of those rescued were pretty badly burned. | Matthew traveled for work so much. |
| 0.871 | 5/5 | exclusive | 0.62 / 0.37 | `(And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))` (7) | `(And (GroupOf $x0 person) (Patient $e0 $x0))` (5) | 0 | The people rebelled against the king. | Some of those rescued were pretty badly burned. |
| 0.869 | 5/5 | exclusive | 0.37 / 0.44 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` (5) | `(And (Goal $e0 bed) (Member $e0 go))` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.869 | 5/5 | exclusive | 0.37 / 0.44 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` (5) | `(Goal $e0 bed)` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.868 | 5/5 | exclusive | 0.41 / 0.44 | `(And (Goal $e0 $x0) (Member $e0 go))` (6) | `(And (Goal $e0 bed) (Member $e0 go))` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.868 | 5/5 | exclusive | 0.41 / 0.44 | `(And (Goal $e0 $x0) (Member $e0 go))` (6) | `(Goal $e0 bed)` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.864 | 5/5 | exclusive | 0.37 / 0.34 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` (5) | `(Time $e0 night)` (4) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.863 | 5/5 | exclusive | 0.41 / 0.34 | `(And (Goal $e0 $x0) (Member $e0 go))` (6) | `(Time $e0 night)` (4) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.861 | 5/5 | exclusive | 0.37 / 0.33 | `(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))` (5) | `(And (Past $e0) (Time $e0 night))` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.860 | 5/5 | exclusive | 0.41 / 0.33 | `(And (Goal $e0 $x0) (Member $e0 go))` (6) | `(And (Past $e0) (Time $e0 night))` (3) | 0 | Mom went to the supermarket. | Kalman and Olivia partied that night and went to bed late. |
| 0.858 | 3/5 | exclusive | 0.28 / 0.29 | `(Member $e0 travel)` (5) | `(And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))` (3) | 0 | Nothing is so pleasant as traveling alone. | Some of those rescued were pretty badly burned. |
| 0.852 | 2/5 | exclusive | 0.29 / 0.27 | `(And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))` (3) | `(And (Member $e0 travel) (Past $e0))` (3) | 0 | Some of those rescued were pretty badly burned. | Matthew traveled for work so much. |

## Adopted block: k 32, beta 0, cosine ≥ 0.85, floor init — top 25 co-occurrence passes (overlapping / nested / same-records)

| cosine | seeds | relation | norms A / B | A (support) | B (support) | shared | A e.g. | B e.g. |
|---|---|---|---|---|---|---|---|---|
| 1.000 | 5/5 | same-records (part-of) | 0.82 / 0.82 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.82 / 0.82 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.82 / 0.82 | `(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))` (23) | `(Holder $e0 $x0)` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records | 0.82 / 0.82 | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.82 / 0.82 | `(And (Holder $e0 $x0) (Member $e0 have))` (23) | `(Holder $e0 $x0)` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.82 / 0.82 | `(And (Holder $e0 $x0) (Theme $e0 $x1))` (23) | `(Holder $e0 $x0)` (23) | 23 | This sentence has various meanings. | This sentence has various meanings. |
| 1.000 | 5/5 | same-records (part-of) | 0.67 / 0.67 | `(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (12) | `(And (Member $e0 start) (Theme $e0 $e1))` (12) | 12 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records (part-of) | 0.58 / 0.58 | `(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (9) | `(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))` (9) | 9 | Karl started vomitting in disgust. | Karl started vomitting in disgust. |
| 1.000 | 5/5 | same-records | 0.57 / 0.57 | `(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))` (7) | `(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | 7 | The rebels began distributing food and clothing from the storehouse to the locals. | The rebels began distributing food and clothing from the storehouse to the locals. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records | 0.64 / 0.64 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.64 / 0.64 | `(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))` (7) | `(And (Member $e0 begin) (Theme $e0 $e1))` (7) | 7 | Mark and Jessica began hanging out often. | Mark and Jessica began hanging out often. |
| 1.000 | 5/5 | same-records (part-of) | 0.40 / 0.40 | `(And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))` (5) | `(And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))` (5) | 5 | The crack in the windshield has started to disappear. | The crack in the windshield has started to disappear. |
| 1.000 | 5/5 | same-records (part-of) | 0.30 / 0.30 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.30 / 0.30 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.30 / 0.30 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records | 0.30 / 0.30 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` (5) | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.30 / 0.30 | `(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))` (5) | `(And (Holder $e0 $x0) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.30 / 0.30 | `(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))` (5) | `(And (Holder $e0 $x0) (Past $e0))` (5) | 5 | That old mosque had an eerie feeling. | That old mosque had an eerie feeling. |
| 1.000 | 5/5 | same-records (part-of) | 0.69 / 0.69 | `(And (Member $e0 contain) (Theme $e0 $x0))` (5) | `(Member $e0 contain)` (5) | 5 | A deck of cards contains four kings, four queens, and four jacks. | A deck of cards contains four kings, four queens, and four jacks. |
| 1.000 | 5/5 | same-records | 0.45 / 0.45 | `(And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (4) | `(And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))` (4) | 4 | Both girls started to cry. | Both girls started to cry. |
| 1.000 | 5/5 | same-records | 0.45 / 0.45 | `(And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))` (4) | `(And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))` (4) | 4 | Both girls started to cry. | Both girls started to cry. |
