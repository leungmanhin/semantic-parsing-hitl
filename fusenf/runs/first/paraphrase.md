# §5.4 paraphrase alignment — run `first` — 2026-11-12 01:44

The pairs of SICK and MRPC, aligned on our side and classified by the chainer (our engine line). WHAT IS MINED is the
TWO-WAY REWRITE: a difference between the two sentences of a pair that, used in both directions, makes a paraphrase
pair equivalent on its own. It is rejected when it makes a non-paraphrase pair equivalent on its own or — where the
labels have a direction — when one of its directions alone makes a direction hold that the label denies. The human
labels are fields: read by the boundary check and the evaluation, never by the alignment or the verdicts.

## The pairs and their labels

- aligned pairs: 8389 (6354 sentences); without a parse of both sentences: {'sick/mine': 2123, 'mrpc/mine': 3245, 'mrpc/evaluate': 1759}; a reply the emitter refused: {'sick/evaluate': 49, 'sick/mine': 35, 'mrpc/mine': 25, 'mrpc/evaluate': 16}
- the renaming check (both sentences renamed and shuffled, aligned again): 8348 of 8389 identical
- engine round 1: 6354 spaces, 127226 queries; background 302 statements (lexicon facts + query-stage rules; the 13 kinship-closure rules left out)
- THE YES / NO LABEL every set gives (is the pair a paraphrase: does each sentence say what the other says?): sick = both directions labelled entailing; mrpc = its own pair label. Pairs labelled yes: sick/mine 459 of 3594, mrpc/mine 322 of 494, sick/evaluate 546 of 4039, mrpc/evaluate 170 of 262
- labels with a direction (each direction entails / is neutral / contradicts — the bonus checks): sick
- a loose yes (given by a looser standard than equivalence: not counted as support, its no still counts): mrpc

## The chainer's verdicts against the labels

### sick/mine — 3594 pairs

pair verdicts: contradiction 310, equivalence 138, one-way x>y 142, one-way y>x 23, relatedness 2687, unrelated 294

**before** — equivalence_precision 0.978, equivalence_recall 0.294, equivalent 138, paraphrases 459, non_paraphrase_equivalent 3, holds_precision 0.989, holds_recall 0.295, holds 441, entails 1477, contradiction_precision 0.968, contradiction_recall 0.619, neutral_or_contradicts_holding 5

| label / verdict (per direction) | n |
|---|---|
| contradicts / contradicts | 170 |
| contradicts / fails | 1034 |
| contradicts / holds | 2 |
| entails / fails | 1041 |
| entails / holds | 436 |
| neutral / contradicts | 2 |
| neutral / fails | 4500 |
| neutral / holds | 3 |

### mrpc/mine — 494 pairs

pair verdicts: contradiction 1, equivalence 7, one-way x>y 21, one-way y>x 22, relatedness 396, unrelated 47

**before** — equivalence_precision 0.714, equivalence_recall 0.016, equivalent 7, paraphrases 322, non_paraphrase_equivalent 2

| label / verdict (per direction) | n |
|---|---|
| non-paraphrase / fails | 326 |
| non-paraphrase / holds | 18 |
| paraphrase / contradicts | 1 |
| paraphrase / fails | 604 |
| paraphrase / holds | 39 |

### sick/evaluate — 4039 pairs

pair verdicts: contradiction 373, equivalence 154, one-way x>y 168, one-way y>x 27, relatedness 2969, unrelated 348

**before** — equivalence_precision 0.981, equivalence_recall 0.277, equivalent 154, paraphrases 546, non_paraphrase_equivalent 3, holds_precision 0.98, holds_recall 0.286, holds 503, entails 1725, contradiction_precision 0.944, contradiction_recall 0.598, neutral_or_contradicts_holding 10

| label / verdict (per direction) | n |
|---|---|
| contradicts / contradicts | 181 |
| contradicts / fails | 1254 |
| contradicts / holds | 5 |
| entails / fails | 1232 |
| entails / holds | 493 |
| neutral / contradicts | 2 |
| neutral / fails | 4906 |
| neutral / holds | 5 |

**after (the admitted two-way rewrites as rules)** — equivalence_precision 0.983, equivalence_recall 0.321, equivalent 178, paraphrases 546, non_paraphrase_equivalent 3, holds_precision 0.982, holds_recall 0.315, holds 554, entails 1725, contradiction_precision 0.944, contradiction_recall 0.598, neutral_or_contradicts_holding 10

| label / verdict (per direction) | n |
|---|---|
| contradicts / contradicts | 181 |
| contradicts / fails | 1254 |
| contradicts / holds | 5 |
| entails / fails | 1181 |
| entails / holds | 544 |
| neutral / contradicts | 2 |
| neutral / fails | 4906 |
| neutral / holds | 5 |

**a measurement: with the one-way findings' rules added (they are not admitted)** — equivalence_precision 0.983, equivalence_recall 0.321, equivalent 178, paraphrases 546, non_paraphrase_equivalent 3, holds_precision 0.984, holds_recall 0.351, holds 616, entails 1725, contradiction_precision 0.944, contradiction_recall 0.598, neutral_or_contradicts_holding 10

**a measurement: the two-way rewrites admitted when a loose yes counts as support** — equivalence_precision 0.983, equivalence_recall 0.321, equivalent 178, paraphrases 546, non_paraphrase_equivalent 3, holds_precision 0.982, holds_recall 0.316, holds 555, entails 1725, contradiction_precision 0.944, contradiction_recall 0.598, neutral_or_contradicts_holding 10

### mrpc/evaluate — 262 pairs

pair verdicts: equivalence 6, one-way x>y 3, one-way y>x 18, relatedness 202, unrelated 33

**before** — equivalence_precision 0.833, equivalence_recall 0.029, equivalent 6, paraphrases 170, non_paraphrase_equivalent 1

| label / verdict (per direction) | n |
|---|---|
| non-paraphrase / fails | 176 |
| non-paraphrase / holds | 8 |
| paraphrase / fails | 315 |
| paraphrase / holds | 25 |

**after (the admitted two-way rewrites as rules)** — equivalence_precision 0.833, equivalence_recall 0.029, equivalent 6, paraphrases 170, non_paraphrase_equivalent 1

| label / verdict (per direction) | n |
|---|---|
| non-paraphrase / fails | 176 |
| non-paraphrase / holds | 8 |
| paraphrase / fails | 314 |
| paraphrase / holds | 26 |

**a measurement: with the one-way findings' rules added (they are not admitted)** — equivalence_precision 0.833, equivalence_recall 0.029, equivalent 6, paraphrases 170, non_paraphrase_equivalent 1

**a measurement: the two-way rewrites admitted when a loose yes counts as support** — equivalence_precision 0.833, equivalence_recall 0.029, equivalent 6, paraphrases 170, non_paraphrase_equivalent 1

Contradictions by source (the chainer: an opposite answer or an instance of a denial; the alignment: a negated
statement flipped word for word): sick/mine {'chainer': 168, 'alignment': 140, 'chainer+alignment': 2}; mrpc/mine {'chainer': 1}; sick/evaluate {'chainer': 181, 'alignment': 191, 'chainer+alignment': 1}; mrpc/evaluate {}

## What changed on the evaluation share — after (the admitted two-way rewrites as rules)

52 directions changed verdict: entails / holds 51, paraphrase / holds 1

directions per rewrite used in their proofs: `slice → cut` 7, `cut → slice` 7, `kid → child` 6, `child → kid` 6, `paraphrase-E003789` 6, `woman → lady` 5, `lady → woman` 5, `little → young` 4, `paraphrase-E003785` 4, `young → little` 2

| pair | dir | label | before → after | rewrites used | sentences |
|---|---|---|---|---|---|
| mrpc-test-0744 | x>y | paraphrase | fails → holds | paraphrase-E003785 | Mr. Bremer said Iran continued to interfere in fledgling political reconstruction, including Tehran s intelligence service. ‖ Mr. Bremer said that Iran, including its intelligence service, continued to interfere in fledgling political reconstruction. |
| sick-2349 | x>y | entails | fails → holds | woman → lady | The woman is adding cheese to the sauce ‖ The lady is adding cheese to the sauce |
| sick-2349 | y>x | entails | fails → holds | lady → woman | The woman is adding cheese to the sauce ‖ The lady is adding cheese to the sauce |
| sick-2584 | x>y | entails | fails → holds | slice → cut | A person is slicing some mushrooms ‖ A person is cutting some mushrooms |
| sick-2584 | y>x | entails | fails → holds | cut → slice | A person is slicing some mushrooms ‖ A person is cutting some mushrooms |
| sick-2829 | x>y | entails | fails → holds | lady → woman | The lady is penciling on eyeshadow ‖ The woman is penciling on eyeshadow |
| sick-2829 | y>x | entails | fails → holds | woman → lady | The lady is penciling on eyeshadow ‖ The woman is penciling on eyeshadow |
| sick-4172 | x>y | entails | fails → holds | cut → slice | A woman is cutting a vegetable ‖ A woman is slicing a vegetable |
| sick-4172 | y>x | entails | fails → holds | slice → cut | A woman is cutting a vegetable ‖ A woman is slicing a vegetable |
| sick-4591 | x>y | entails | fails → holds | cut → slice | Some onions are being cut by a person ‖ A person is slicing some onions |
| sick-4591 | y>x | entails | fails → holds | slice → cut | Some onions are being cut by a person ‖ A person is slicing some onions |
| sick-4777 | x>y | entails | fails → holds | little → young | A little boy is playing a guitar ‖ A young boy is playing a guitar |
| sick-4777 | y>x | entails | fails → holds | young → little | A little boy is playing a guitar ‖ A young boy is playing a guitar |
| sick-4869 | x>y | entails | fails → holds | cut → slice | A woman is cutting potatoes ‖ A woman is slicing potatoes |
| sick-4869 | y>x | entails | fails → holds | slice → cut | A woman is cutting potatoes ‖ A woman is slicing potatoes |
| sick-4923 | x>y | entails | fails → holds | cut → slice | A person is cutting garlic into pieces with a knife ‖ A person is slicing garlic into pieces with a knife |
| sick-4923 | y>x | entails | fails → holds | slice → cut | A person is cutting garlic into pieces with a knife ‖ A person is slicing garlic into pieces with a knife |
| sick-52 | x>y | entails | fails → holds | kid → child | Kids in red shirts are playing in the leaves ‖ Children in red shirts are playing in the leaves |
| sick-52 | y>x | entails | fails → holds | child → kid | Kids in red shirts are playing in the leaves ‖ Children in red shirts are playing in the leaves |
| sick-5527 | x>y | entails | fails → holds | slice → cut | A woman is slicing tofu ‖ A woman is cutting tofu |
| sick-5527 | y>x | entails | fails → holds | cut → slice | A woman is slicing tofu ‖ A woman is cutting tofu |
| sick-5678 | x>y | entails | fails → holds | cut → slice | A woman is cutting butter ‖ A woman is slicing butter |
| sick-5678 | y>x | entails | fails → holds | slice → cut | A woman is cutting butter ‖ A woman is slicing butter |
| sick-5914 | x>y | entails | fails → holds | paraphrase-E003789 | A horse is being ridden by a person ‖ A person is riding a horse |
| sick-5914 | y>x | entails | fails → holds | paraphrase-E003789 | A horse is being ridden by a person ‖ A person is riding a horse |
| sick-6054 | x>y | entails | fails → holds | paraphrase-E003785 | The little dog is grabbing the bedroom slipper with its mouth funnily ‖ The little dog is grabbing the bedroom slipper with its mouth |
| sick-6415 | x>y | entails | fails → holds | paraphrase-E003789 | A bike is being ridden by a person ‖ A person is riding a bike |
| sick-6415 | y>x | entails | fails → holds | paraphrase-E003789 | A bike is being ridden by a person ‖ A person is riding a bike |
| sick-6832 | x>y | entails | fails → holds | kid → child | The kids are chasing each other in the sand ‖ The children are chasing each other in the sand |
| sick-6832 | y>x | entails | fails → holds | child → kid | The kids are chasing each other in the sand ‖ The children are chasing each other in the sand |
| sick-7028 | x>y | entails | fails → holds | child → kid | Some children are playing on a playground ‖ Some kids are playing on a playground |
| sick-7028 | y>x | entails | fails → holds | kid → child | Some children are playing on a playground ‖ Some kids are playing on a playground |
| sick-7284 | x>y | entails | fails → holds | woman → lady | A woman in a fur hat and fur coat is standing outside a building ‖ A lady in a fur hat and fur coat is standing outside a building |
| sick-7284 | y>x | entails | fails → holds | lady → woman | A woman in a fur hat and fur coat is standing outside a building ‖ A lady in a fur hat and fur coat is standing outside a building |
| sick-7433 | x>y | entails | fails → holds | paraphrase-E003785 | A man is sitting on a train and resting his hand against his face ‖ The man is sitting on the train and resting his hand against his face |
| sick-7433 | y>x | entails | fails → holds | paraphrase-E003785 | A man is sitting on a train and resting his hand against his face ‖ The man is sitting on the train and resting his hand against his face |
| sick-7692 | x>y | entails | fails → holds | little → young | One little boy with brown hair is jumping off of the brown chair onto the floor ‖ A young boy is jumping off a chair |
| sick-7694 | x>y | entails | fails → holds | little → young | A little boy with brown hair is jumping off of a brown chair onto the floor ‖ A young boy is jumping off a chair |
| sick-8030 | x>y | entails | fails → holds | little → young | A little boy with a bib is watching the camera ‖ A young boy with a bib is watching the camera |
| sick-8030 | y>x | entails | fails → holds | young → little | A little boy with a bib is watching the camera ‖ A young boy with a bib is watching the camera |
| sick-8307 | x>y | entails | fails → holds | child → kid | Children are being dressed in costumes and playing a game ‖ Kids are being dressed in costumes and playing a game |
| sick-8307 | y>x | entails | fails → holds | kid → child | Children are being dressed in costumes and playing a game ‖ Kids are being dressed in costumes and playing a game |
| sick-8435 | x>y | entails | fails → holds | kid → child | A child is splashing in a pool for children and other kids are playing in the background ‖ A child is splashing in a pool for children and other children are playing in the background |
| sick-8435 | y>x | entails | fails → holds | child → kid | A child is splashing in a pool for children and other kids are playing in the background ‖ A child is splashing in a pool for children and other children are playing in the background |
| sick-8894 | x>y | entails | fails → holds | paraphrase-E003789 | Two people are riding motorbikes ‖ Motorbikes are being ridden by two people |
| sick-8894 | y>x | entails | fails → holds | paraphrase-E003789 | Two people are riding motorbikes ‖ Motorbikes are being ridden by two people |
| sick-912 | x>y | entails | fails → holds | woman → lady | A woman is being kissed by a man ‖ A lady is being kissed by a man |
| sick-912 | y>x | entails | fails → holds | lady → woman | A woman is being kissed by a man ‖ A lady is being kissed by a man |
| sick-9584 | x>y | entails | fails → holds | woman → lady | The woman is holding the paintbrush next to the artist's easel ‖ The lady is holding the paintbrush next to the artist's easel |
| sick-9584 | y>x | entails | fails → holds | lady → woman | The woman is holding the paintbrush next to the artist's easel ‖ The lady is holding the paintbrush next to the artist's easel |
| sick-98 | x>y | entails | fails → holds | kid → child | Four kids are doing backbends in the park ‖ Four children are doing backbends in the park |
| sick-98 | y>x | entails | fails → holds | child → kid | Four kids are doing backbends in the park ‖ Four children are doing backbends in the park |

## What changed on the evaluation share — a measurement: with the one-way findings' rules added (they are not admitted)

114 directions changed verdict: entails / holds 113, paraphrase / holds 1

directions per rewrite used in their proofs: `man → person` 31, `boy → kid` 17, `kid → child` 16, `dog → animal` 12, `slice → cut` 7, `cut → slice` 7, `child → kid` 6, `paraphrase-E003789` 6, `woman → lady` 5, `lady → woman` 5, `little → young` 4, `paraphrase-E003785` 4, `young → little` 2, `pace → walk` 1, `woman → person` 1

## What changed on the evaluation share — a measurement: the two-way rewrites admitted when a loose yes counts as support

53 directions changed verdict: entails / holds 52, paraphrase / holds 1

directions per rewrite used in their proofs: `slice → cut` 7, `cut → slice` 7, `kid → child` 6, `child → kid` 6, `paraphrase-E003789` 6, `woman → lady` 5, `lady → woman` 5, `little → young` 4, `paraphrase-E003785` 4, `young → little` 2, `paraphrase-E003536` 1

## Examples of the verdicts (evaluation share)

**equivalence**

- sick-30 (sick, label entailment): A man with a jersey is dunking the ball at a basketball game ‖ The ball is being dunked by a man with a jersey at a basketball game
- sick-265 (sick, label entailment): The brown horse is very near a red barrel at the rodeo ‖ The brown horse is near a red barrel at the rodeo
- sick-531 (sick, label entailment): A black helmet is being worn by a man who is pushing a bicycle ‖ One man is wearing a black helmet and pushing a bicycle
- sick-652 (sick, label entailment): The young boy is climbing the wall made of rock ‖ One young boy is climbing a wall made of rock

**one-way x>y**

- sick-10 (sick, label entailment): A brown dog is attacking another animal in front of the tall man in pants ‖ A brown dog is attacking another animal in front of the man in pants
- sick-22 (sick, label entailment): A skilled person is riding a bicycle on one wheel ‖ A person is riding the bicycle on one wheel
- sick-151 (sick, label entailment): A wild deer is jumping a fence ‖ A deer is jumping a fence
- sick-169 (sick, label entailment): A family is watching a little boy who is hitting a baseball ‖ A family is watching a boy who is hitting a baseball

**contradiction**

- sick-23 (sick, label contradiction): Nobody is riding the bicycle on one wheel ‖ A person is riding the bicycle on one wheel
- sick-31 (sick, label contradiction): A man with a jersey is dunking the ball at a basketball game ‖ There is no man dunking the ball at a basketball game
- sick-42 (sick, label contradiction): Two people are kickboxing and spectators are not watching ‖ Two people are kickboxing and spectators are watching
- sick-150 (sick, label contradiction): A deer is jumping over a fence ‖ A deer isn't jumping over the fence

**relatedness**

- sick-11 (sick, label neutral): A brown dog is attacking another animal in front of the man in pants ‖ A brown dog is helping another animal in front of the man in pants
- sick-12 (sick, label neutral): Two dogs are fighting ‖ Two dogs are wrestling and hugging
- sick-14 (sick, label neutral): A brown dog is attacking another animal in front of the man in pants ‖ Two dogs are fighting
- sick-16 (sick, label neutral): Two dogs are wrestling and hugging ‖ A brown dog is attacking another animal in front of the tall man in pants

**unrelated**

- sick-13 (sick, label contradiction): Two dogs are wrestling and hugging ‖ There is no dog wrestling and hugging
- sick-15 (sick, label neutral): A brown dog is attacking another animal in front of the man in pants ‖ There is no dog wrestling and hugging
- sick-20 (sick, label contradiction): There is no man in a black jacket doing tricks on a motorbike ‖ A person in a black jacket is doing tricks on a motorbike
- sick-25 (sick, label neutral): Nobody is riding the bicycle on one wheel ‖ A person in a black jacket is doing tricks on a motorbike

## The candidates: two-way rewrites

A candidate is a rewrite with its reverse. SUPPORT: a mining pair labelled yes that the rewrite alone makes equivalent (admitted from 2 families on). VIOLATION, by the pair: a pair labelled no that it alone makes equivalent; by a direction (labels with a direction only): a direction the label denies that holds under one of its two directions alone. A CONTACT is the same with several rewrites together: recorded, never counted.

| kind / status | n |
|---|---|
| class / admitted | 6 |
| class / candidate | 49 |
| class / note | 1242 |
| class / rejected | 239 |
| substitution / admitted | 2 |
| substitution / candidate | 34 |
| substitution / note | 2068 |
| substitution / rejected | 155 |

### admitted (the first 8 by supporting families)

| id | rewrite | supporting fam. | loose-yes fam. | violations by a pair | by a direction | contacts | an example |
|---|---|---|---|---|---|---|---|
| paraphrase-E000426 | `child ↔ kid` | 5 | 0 | 0 | 0 | 0 | Two young kids are eating corndogs ‖ Two young children are eating corndogs (yes) |
| paraphrase-E000570 | `cut ↔ slice` | 3 | 0 | 0 | 0 | 4 | A person is slicing an onion ‖ A person is cutting an onion (yes) |
| paraphrase-E000087 | `automobile ↔ car` | 2 | 0 | 0 | 0 | 0 | A man is getting into an automobile ‖ A man is getting into a car (yes) |
| paraphrase-E001034 | `lady ↔ woman` | 2 | 0 | 0 | 0 | 1 | The woman is stirring eggs in a bowl ‖ The lady is stirring eggs in a bowl (yes) |
| paraphrase-E001073 | `little ↔ small` | 2 | 0 | 0 | 0 | 1 | A small boy in a striped shirt is sliding out of a green tube ‖ A little boy in a striped shirt is sliding out of a green tube (yes) |
| paraphrase-E001076 | `little ↔ young` | 2 | 0 | 0 | 0 | 0 | A little girl is looking at a woman in costume ‖ A young girl is looking at a woman in costume (yes) |
| paraphrase-E003785 | `L:¦PartOf($x1,$x2)¦asserted & R:¦Possession($x1,$x2)¦asserted` | 2 | 0 | 0 | 0 | 1 | A boy in blue shirt is looking at his hand near a stack of blocks on table ‖ The boy in blue shirt is looking at his hand near the stack of blocks on table (yes) |
| paraphrase-E003789 | `L:¦Patient($e1,$x1)¦asserted & R:¦Theme($e1,$x1)¦asserted` | 2 | 0 | 0 | 0 | 2 | The ice skating rink placed outdoors is full of people ‖ An ice skating rink placed outdoors is full of people (yes) |

### rejected (the first 40 by violations)

| id | rewrite | supporting fam. | loose-yes fam. | violations by a pair | by a direction | contacts | an example |
|---|---|---|---|---|---|---|---|
| paraphrase-E001140 | `man ↔ woman` | 0 | 0 | 24 | 51 | 19 | A little girl is looking at a woman in costume ‖ The little girl is looking at a man in costume (no) |
| paraphrase-E001117 | `man ↔ person` | 0 | 0 | 16 | 18 | 28 | A man is sitting comfortably at a table ‖ A person is sitting comfortably at the table (no) |
| paraphrase-E000280 | `boy ↔ girl` | 0 | 0 | 11 | 22 | 0 | A girl is playing a wind instrument ‖ A boy is playing a wind instrument (no) |
| paraphrase-E000393 | `cat ↔ dog` | 0 | 0 | 10 | 20 | 2 | A dog is opening a drawer and climbing inside ‖ A cat is opening a drawer and climbing inside (no) |
| paraphrase-E001445 | `sit ↔ stand` | 0 | 0 | 6 | 13 | 5 | Four people are standing on a low cement ledge ‖ Four people are sitting on a low cement ledge (no) |
| paraphrase-E003468 | `L:¦Goal($e1,$x1)¦asserted & R:¦Source($e1,$x1)¦asserted` | 0 | 0 | 5 | 10 | 0 | A soccer player is kicking a ball out of the goal ‖ A soccer player is kicking a ball into the goal (no) |
| paraphrase-E000055 | `animal ↔ dog` | 0 | 0 | 6 | 6 | 0 | A dog is barking at a ball ‖ An animal is barking at a ball (no) |
| paraphrase-E000224 | `black ↔ white` | 0 | 0 | 4 | 8 | 3 | A man in a blue cowboy hat is riding a black horse ‖ A man in a blue cowboy hat is riding a white horse (no) |
| paraphrase-E000283 | `boy ↔ kid` | 0 | 0 | 5 | 6 | 1 | Several boys are jumping on a trampoline ‖ Several kids are jumping on a trampoline (no) |
| paraphrase-E001449 | `sit ↔ walk` | 0 | 0 | 3 | 8 | 0 | A man, a woman and two girls are walking on the beach ‖ A man, a woman and two girls are sitting on the beach (no) |
| paraphrase-E001412 | `run ↔ stand` | 0 | 0 | 3 | 7 | 0 | Five people are running with three dogs in the green field beside the road ‖ Five people are standing with three dogs in the green field beside the road (no) |
| paraphrase-E001210 | `old ↔ young` | 0 | 0 | 3 | 6 | 0 | An old woman is shaking hands with a man ‖ A young woman is shaking hands with a man (no) |
| paraphrase-E001409 | `run ↔ sit` | 0 | 0 | 3 | 6 | 0 | A man is sitting in a field ‖ A man is running in a field (no) |
| paraphrase-E000669 | `dog ↔ man` | 0 | 0 | 2 | 5 | 0 | The man is running on the road ‖ A dog is running on the road (no) |
| paraphrase-E000776 | `field ↔ grass` | 0 | 0 | 3 | 4 | 1 | A person is wearing a hat and is sitting on the grass ‖ A person is sitting in a field and is wearing a hat (no) |
| paraphrase-E000025 | `air ↔ ground` | 0 | 0 | 2 | 4 | 1 | A little boy in red clothes is jumping onto the ground ‖ A little boy in red clothes is jumping into the air (no) |
| paraphrase-E000182 | `big ↔ small` | 0 | 0 | 2 | 4 | 2 | A big cat is opening a plastic drawer with its paws and is jumping inside ‖ A small cat is opening a plastic drawer with its paws and jumping inside (no) |
| paraphrase-E000285 | `boy ↔ man` | 0 | 0 | 1 | 5 | 7 | A group of men is playing soccer on the beach ‖ A group of boys is playing soccer on the beach (no) |
| paraphrase-E000412 | `chase ↔ lose` | 0 | 0 | 2 | 4 | 0 | A dog is chasing a ball on the grass ‖ A dog is losing a ball on the grass (no) |
| paraphrase-E001042 | `large ↔ small` | 0 | 0 | 2 | 4 | 0 | A small white dog is jumping up in the snow ‖ A large white dog is jumping up in the snow (no) |
| paraphrase-E001279 | `play ↔ put_away` | 0 | 0 | 2 | 4 | 1 | A flute is being played by a girl ‖ A flute is being put away by a girl (no) |
| paraphrase-E003254 | `L:¦Agent($e1,$x1)¦asserted & L:¦Patient($e1,$x2)¦asserted & R:¦Patient($e1,$x1)¦asserted & R:¦With($x1,$x2)¦asserted` | 0 | 0 | 2 | 4 | 0 | A dog is chasing a ball in the grass ‖ A dog with a ball is being chased in the grass (no) |
| paraphrase-E003267 | `L:¦Around($e1,$x1)¦asserted & L:¦Member($x1,cage)¦asserted & R:¦Direction($e1,around)¦asserted & R:¦Manner($e1,aimlessly)¦asserted` | 0 | 0 | 2 | 4 | 0 | A tiger is aimlessly walking around ‖ A tiger is walking around a cage (no) |
| paraphrase-E003313 | `L:¦Behind($e1,$x1)¦asserted & R:¦InFrontOf($e1,$x1)¦asserted` | 0 | 0 | 2 | 4 | 0 | The blond girl is dancing behind the sound equipment ‖ The blond girl is dancing in front of the sound equipment (no) |
| paraphrase-E003381 | `L:¦Down($e1,$x1)¦asserted & L:¦Member($x1,street)¦asserted & L:¦Theme($e1,$x2)¦asserted & R:¦Patient($e1,$x2)¦asserted` | 0 | 0 | 3 | 3 | 0 | A woman is walking the dog down the street ‖ The dog is being walked by the woman (no) |
| paraphrase-E003741 | `L:¦Member($e1,peel)¦asserted & L:¦Member($x1,onion)¦asserted & L:¦Patient($e1,$x1)¦asserted & R:¦Member($e1,slice)¦asserted & R:¦Patient($e1,onion)¦asserted` | 0 | 0 | 2 | 4 | 0 | The person is slicing onions ‖ The person is peeling an onion (no) |
| paraphrase-E000593 | `dance ↔ stand` | 0 | 0 | 0 | 5 | 0 | A group of people are dancing at a concert ‖ A group of people are standing (x>y, neutral) |
| paraphrase-E000613 | `dead ↔ leafless` | 0 | 0 | 1 | 4 | 0 | The black bird is sitting in a leafless tree ‖ A black bird is sitting on a dead tree (no) |
| paraphrase-E000685 | `draw ↔ paint` | 0 | 0 | 2 | 3 | 0 | The man is drawing ‖ The man is painting (no) |
| paraphrase-E000806 | `flute ↔ instrument` | 0 | 0 | 1 | 4 | 0 | A girl in a band is playing the flute ‖ A girl in a band is playing an instrument (no) |
| paraphrase-E000854 | `girl ↔ woman` | 0 | 0 | 2 | 3 | 2 | A flute is being played in a lovely way by a girl ‖ One woman is playing a flute (no) |
| paraphrase-E001384 | `river ↔ stream` | 0 | 0 | 2 | 3 | 0 | A man is fishing in the river ‖ A man is fishing in the stream (no) |
| paraphrase-E003384 | `L:¦Down($e1,$x1)¦asserted & R:¦Up($e1,$x1)¦asserted` | 0 | 0 | 2 | 3 | 0 | A married couple is walking up the aisle ‖ A married couple is walking down the aisle (no) |
| paraphrase-E003656 | `L:¦Location($e1,$x1)¦asserted & R:¦Source($e1,$x1)¦asserted` | 0 | 0 | 2 | 3 | 0 | A boy is jumping on the side of a stone water fountain in front of a building ‖ A boy is jumping off the side of a stone water fountain in front of a building (no) |
| paraphrase-E000128 | `barbell ↔ weight` | 0 | 0 | 2 | 2 | 0 | A man is lifting barbells ‖ The man is lifting weights (no) |
| paraphrase-E000521 | `cord ↔ rope` | 1 | 0 | 2 | 2 | 0 | A cord is being climbed by a man ‖ A rope is being climbed by a man (no) |
| paraphrase-E000714 | `eat ↔ talk` | 0 | 0 | 1 | 3 | 0 | A man and a woman are eating ‖ A man and woman are talking (no) |
| paraphrase-E000751 | `eyeshadow ↔ make-up` | 0 | 0 | 2 | 2 | 1 | Eyeshadow is being put on by a woman ‖ A woman is putting make-up on (no) |
| paraphrase-E000866 | `grass ↔ hay` | 0 | 0 | 2 | 2 | 0 | Hay is being eaten by a cow ‖ A cow is eating grass (no) |
| paraphrase-E000908 | `gun ↔ weapon` | 0 | 0 | 2 | 2 | 0 | Five kids are standing close together and one kid has a gun ‖ Five kids are standing close together and one kid has a weapon (no) |

### candidate (the first 40 by supporting families)

| id | rewrite | supporting fam. | loose-yes fam. | violations by a pair | by a direction | contacts | an example |
|---|---|---|---|---|---|---|---|
| paraphrase-E000038 | `air ↔ wind` | 1 | 0 | 0 | 0 | 0 | A dog is in the sand that is blowing in the air ‖ A dog is in the sand that is blowing in the wind (yes) |
| paraphrase-E000129 | `bark ↔ shout` | 1 | 0 | 0 | 0 | 0 | The military officer is shouting at the recruits ‖ The military officer is barking at the recruits (yes) |
| paraphrase-E000138 | `battle ↔ fight` | 1 | 0 | 0 | 0 | 0 | Two dogs are battling for a frisbee in a lake ‖ Two dogs are fighting for a frisbee in a lake (yes) |
| paraphrase-E000148 | `beach ↔ shore` | 1 | 0 | 0 | 0 | 0 | The brown dogs are playfully fighting on the sandy beach ‖ The brown dogs are playfully fighting on the sandy shore (yes) |
| paraphrase-E000180 | `big ↔ huge` | 1 | 0 | 0 | 0 | 0 | A black and white dog is carrying a big stick on the green grass ‖ A black and white dog is carrying a huge stick on the green grass (yes) |
| paraphrase-E000305 | `break ↔ crack` | 1 | 0 | 0 | 0 | 0 | The lady is breaking an egg for the mixer ‖ The lady is cracking an egg for the mixer (yes) |
| paraphrase-E000353 | `camera ↔ photo` | 1 | 0 | 0 | 0 | 0 | Three friends are making faces for the camera ‖ Three friends are making faces for a photo (yes) |
| paraphrase-E000376 | `carefully ↔ cautiously` | 1 | 0 | 0 | 0 | 0 | The man is carefully feeding a mouse to the snake ‖ The man is cautiously feeding a mouse to the snake (yes) |
| paraphrase-E000415 | `chase ↔ run_after` | 1 | 0 | 0 | 0 | 0 | A dog is running after a ball in the grass ‖ A dog is chasing a ball in the grass (yes) |
| paraphrase-E000435 | `chop ↔ cut` | 1 | 0 | 0 | 0 | 0 | A person is quickly cutting mushrooms with a knife ‖ A person is quickly chopping mushrooms with a knife (yes) |
| paraphrase-E000437 | `chop_down ↔ cut` | 1 | 0 | 0 | 0 | 0 | A tree is being cut by a man with an axe ‖ A man is chopping down a tree with an axe (yes) |
| paraphrase-E000441 | `chop_up ↔ cut` | 1 | 0 | 0 | 0 | 0 | A woman is chopping up an octopus ‖ A woman is cutting an octopus (yes) |
| paraphrase-E000451 | `clean ↔ cleanse` | 1 | 0 | 0 | 0 | 1 | Someone is cleaning an animal ‖ Someone is cleansing an animal (yes) |
| paraphrase-E000515 | `cook ↔ prepare` | 1 | 0 | 0 | 0 | 1 | A chef is preparing a meal ‖ A chef is cooking a meal (yes) |
| paraphrase-E000516 | `cook ↔ roast` | 1 | 0 | 0 | 0 | 0 | A man is cooking a snake ‖ A man is roasting a snake (yes) |
| paraphrase-E000518 | `cooking_oil ↔ oil` | 1 | 0 | 0 | 0 | 0 | A person is pouring oil for cooking into a pot ‖ A person is pouring cooking oil into a pot (yes) |
| paraphrase-E000526 | `couch ↔ sofa` | 1 | 0 | 0 | 0 | 0 | A small group of people are standing and two are sitting on the couch ‖ A small group of people are standing and two are sitting on the sofa (yes) |
| paraphrase-E000579 | `cyclist ↔ person` | 1 | 0 | 0 | 0 | 0 | A person on a yellow bike is airborne ‖ A cyclist on a yellow bike is airborne (yes) |
| paraphrase-E000626 | `devour ↔ eat` | 1 | 0 | 0 | 0 | 0 | A guinea pig is devouring a carrot ‖ A guinea pig is eating a carrot (yes) |
| paraphrase-E000636 | `dirty ↔ muddy` | 1 | 0 | 0 | 0 | 0 | Two children are rolling in dirty water ‖ Two children are rolling in muddy water (yes) |
| paraphrase-E000649 | `dive ↔ jump` | 1 | 0 | 0 | 0 | 0 | A young boy is diving into a still lake ‖ A young boy is jumping into a still lake (yes) |
| paraphrase-E000762 | `fast ↔ quickly` | 1 | 0 | 0 | 0 | 0 | A brown and white dog with a brown and black bandanna is quickly running ‖ A brown and white dog with a brown and black bandanna is running very fast (yes) |
| paraphrase-E000766 | `female ↔ girl` | 1 | 0 | 0 | 0 | 0 | A young female is dancing ‖ A young girl is dancing (yes) |
| paraphrase-E000834 | `gather ↔ group` | 1 | 0 | 0 | 0 | 0 | The adults and children are being grouped near an outdoor seating arrangement ‖ The adults and children are being gathered near an outdoor seating arrangement (yes) |
| paraphrase-E000839 | `get ↔ push` | 1 | 0 | 0 | 0 | 0 | A young man is getting a motocross bike up a dirt hill ‖ A young man is pushing a motocross bike up a dirt hill (yes) |
| paraphrase-E000857 | `go ↔ turn` | 1 | 0 | 0 | 0 | 0 | A man on a motorcycle is turning around a corner ‖ A man on a motorcycle is going around a corner (yes) |
| paraphrase-E000934 | `have_a_conversation ↔ talk` | 1 | 0 | 0 | 0 | 0 | A man and woman are talking ‖ A man and a woman are having a conversation (yes) |
| paraphrase-E000955 | `hold ↔ hold_up` | 1 | 0 | 0 | 0 | 0 | One man in a big city is holding up a sign and begging for money ‖ A man in a big city is holding a sign and begging for money (yes) |
| paraphrase-E001001 | `jump ↔ leap` | 1 | 0 | 0 | 0 | 0 | A brown and white dog is leaping in the air with a tennis ball in its mouth ‖ A brown and white dog is jumping in the air with a tennis ball in its mouth (yes) |
| paraphrase-E001084 | `look ↔ stare` | 1 | 0 | 0 | 0 | 0 | A boy is looking at a calendar ‖ A boy is staring at a calendar (yes) |
| paraphrase-E001087 | `look ↔ watch` | 1 | 0 | 0 | 0 | 0 | Two people are standing in the ocean and watching the sunset ‖ Two people are standing in the ocean and looking at the sunset (yes) |
| paraphrase-E001095 | `make-up ↔ make_up` | 1 | 0 | 0 | 0 | 1 | A woman is putting make-up on ‖ The woman is putting make-up on (yes) |
| paraphrase-E001146 | `marriage ↔ wedding` | 1 | 0 | 0 | 0 | 0 | The bride and the groom are leaving after the marriage ‖ The bride and the groom are leaving after the wedding (yes) |
| paraphrase-E001177 | `move ↔ splash` | 1 | 0 | 0 | 0 | 0 | Two dogs are looking at something that is moving in the water ‖ Two dogs are looking at something that is splashing in the water (yes) |
| paraphrase-E001178 | `move ↔ walk` | 1 | 0 | 0 | 0 | 0 | A person with a red hooded jacket and a black backpack is walking near a rocky wall ‖ A person with a red hooded jacket and a black backpack is moving near a rocky wall (yes) |
| paraphrase-E001196 | `object ↔ thing` | 1 | 0 | 0 | 0 | 0 | A boy next to some buckets of rags is holding something ‖ A boy next to some buckets of rags is holding an object (yes) |
| paraphrase-E001221 | `outdoors ↔ outside` | 1 | 0 | 0 | 0 | 0 | The large brown dog is running outdoors in the dirt ‖ The large brown dog is running outside in the dirt (yes) |
| paraphrase-E001225 | `pack ↔ put` | 1 | 0 | 0 | 0 | 0 | The men are putting suitcases into the trunk of a car ‖ The men are packing suitcases into the trunk of a car (yes) |
| paraphrase-E001243 | `path ↔ trail` | 1 | 0 | 0 | 0 | 0 | A brown dog is running through a snowy path ‖ A brown dog is running through a snowy trail (yes) |
| paraphrase-E001272 | `ping_pong ↔ table_tennis` | 1 | 0 | 0 | 0 | 0 | Two men are playing table tennis ‖ Two men are playing ping pong (yes) |

## One-way findings (labels with a direction only; not admitted, not loaded as rules)

A rewrite in ONE direction that alone carries directions labelled entailing in 2 families or more, with no direction the label denies, and whose two-way rewrite is no admitted equivalence. It says what follows, not what is the same: another kind of knowledge than an invariance, kept in a file of its own (`paraphrase/one_way.jsonl`).

| id | finding | entailing fam. | its reverse: denied directions | an example |
|---|---|---|---|---|
| paraphrase-C001561 | `man → person` | 16 | 18 | A man is sitting comfortably at a table ‖ A person is sitting comfortably at the table (x>y, entails) |
| paraphrase-C000303 | `boy → kid` | 6 | 6 | Several boys are jumping on a trampoline ‖ Several kids are jumping on a trampoline (x>y, entails) |
| paraphrase-C000780 | `dog → animal` | 6 | 6 | A dog is barking at a ball ‖ An animal is barking at a ball (x>y, entails) |
| paraphrase-C000588 | `cord → rope` | 3 | 2 | A cord is being climbed by a man ‖ A rope is being climbed by a man (x>y, entails) |
| paraphrase-C003015 | `woman → person` | 3 | 1 | A woman is boiling noodles in water ‖ The person is boiling noodles (x>y, entails) |
| paraphrase-C000409 | `car → vehicle` | 2 | 2 | The girl is recklessly jumping onto a car ‖ The girl is recklessly jumping onto a vehicle (x>y, entails) |
| paraphrase-C001146 | `gun → weapon` | 2 | 2 | Five kids are standing close together and one kid has a gun ‖ Five kids are standing close together and one kid has a weapon (x>y, entails) |
| paraphrase-C001766 | `pace → walk` | 2 | 1 | A tiger is pacing around a cage ‖ A tiger is walking around a cage (x>y, entails) |
| paraphrase-C002299 | `seashore → beach` | 2 | 1 | A group of boys is playing soccer on the seashore ‖ A group of boys is playing soccer on the beach (x>y, entails) |

## Side view: a loose yes counted as support

The same admission with the yes of mrpc counted. Every two-way rewrite that such a pair supports, and its status in both views:

| id | rewrite | supporting fam. | loose-yes fam. | violations | status → with the loose yes | an example |
|---|---|---|---|---|---|---|
| paraphrase-E000400 | `central ↔ centre` | 0 | 1 | 0 | note → candidate | Mohcine Douali, who lives in the centre of Algiers, said: "It was a great shock. ‖ "It was a great shock," said Mohcine Douali, who lives in central Algiers. (yes) |
| paraphrase-E003350 | `L:¦Cardinality($x1,4000000)¦asserted & L:¦GroupOf($x1,person)¦asserted & L:¦Of($x2,$x1)¦asserted & R:¦Measure($x2,population,4000000,person)¦asserted` | 0 | 1 | 0 | note → candidate | The number of probable cases dropped to 64 on Tuesday from 66 on Monday in and around Toronto, a city of four million people. ‖ As of Monday, there were 66 probable cases in and around Toronto, a city of 4 million people |
| paraphrase-E003536 | `L:¦In($e1,$x1)¦asserted & R:¦Location($e1,$x1)¦asserted` | 1 | 1 | 0 | candidate → admitted | The little boy is riding a bicycle in a race ‖ A bicycle is being ridden by the little boy in a race (yes) |

## The residual edits over all pairs

class 9707, substitution 5258, drop 6192, flip 4039, band 45

