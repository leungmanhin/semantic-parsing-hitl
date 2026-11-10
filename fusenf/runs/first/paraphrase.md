# §5.4 paraphrase alignment — run `first` — 2026-11-10 17:54

The pairs of SICK and MRPC, aligned on our side and classified by the chainer (our engine line); the residual of a
pair that holds under it proposes invariance candidates, admitted only if no near-neighbour holds under them. The
human labels are fields: read by the boundary check and the evaluation, never by the alignment or the verdicts.

## The pairs

- aligned pairs: 8389 (6354 sentences); without a parse of both sentences: {'sick/mine': 2123, 'mrpc/mine': 3245, 'mrpc/evaluate': 1759}; a reply the emitter refused: {'sick/evaluate': 49, 'sick/mine': 35, 'mrpc/mine': 25, 'mrpc/evaluate': 16}
- the renaming check (both sentences renamed and shuffled, aligned again): 8348 of 8389 identical
- engine round 1: 6354 spaces, 127226 queries; background 302 statements (lexicon facts + query-stage rules; the 13 kinship-closure rules left out)

## The chainer's verdicts against the labels

### sick/mine — 3594 pairs

pair verdicts: contradiction 310, equivalence 138, one-way x>y 142, one-way y>x 23, relatedness 2687, unrelated 294

**before** — holds_precision 0.989, holds_recall 0.295, holds 441, entails 1477, contradiction_precision 0.968, contradiction_recall 0.619, neutral_or_contradicts_holding 5

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

**before** — holds_precision 0.98, holds_recall 0.286, holds 503, entails 1725, contradiction_precision 0.944, contradiction_recall 0.598, neutral_or_contradicts_holding 10

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

**after** — holds_precision 0.984, holds_recall 0.352, holds 617, entails 1725, contradiction_precision 0.944, contradiction_recall 0.598, neutral_or_contradicts_holding 10

| label / verdict (per direction) | n |
|---|---|
| contradicts / contradicts | 181 |
| contradicts / fails | 1254 |
| contradicts / holds | 5 |
| entails / fails | 1118 |
| entails / holds | 607 |
| neutral / contradicts | 2 |
| neutral / fails | 4906 |
| neutral / holds | 5 |

### mrpc/evaluate — 262 pairs

pair verdicts: equivalence 6, one-way x>y 3, one-way y>x 18, relatedness 202, unrelated 33

**before** — equivalence_precision 0.833, equivalence_recall 0.029, equivalent 6, paraphrases 170, non_paraphrase_equivalent 1

| label / verdict (per direction) | n |
|---|---|
| non-paraphrase / fails | 176 |
| non-paraphrase / holds | 8 |
| paraphrase / fails | 315 |
| paraphrase / holds | 25 |

**after** — equivalence_precision 0.833, equivalence_recall 0.029, equivalent 6, paraphrases 170, non_paraphrase_equivalent 1

| label / verdict (per direction) | n |
|---|---|
| non-paraphrase / fails | 176 |
| non-paraphrase / holds | 8 |
| paraphrase / fails | 314 |
| paraphrase / holds | 26 |

Contradictions by source (the chainer: an opposite answer or an instance of a denial; the alignment: a negated
statement flipped word for word): sick/mine {'chainer': 168, 'alignment': 140, 'chainer+alignment': 2}; mrpc/mine {'chainer': 1}; sick/evaluate {'chainer': 181, 'alignment': 191, 'chainer+alignment': 1}; mrpc/evaluate {}

## What the admitted candidates changed on the evaluation share

115 directions changed verdict: entails / holds 114, paraphrase / holds 1

| pair | dir | label | before → after | rules used | sentences |
|---|---|---|---|---|---|
| mrpc-test-0744 | x>y | paraphrase | fails → holds | paraphrase-S004371 | Mr. Bremer said Iran continued to interfere in fledgling political reconstruction, including Tehran s intelligence service. ‖ Mr. Bremer said that Iran, including its intelligence service, continued to interfere in fledgling political reconstruction. |
| sick-1121 | x>y | entails | fails → holds | paraphrase-C000780 | A dog is riding a skateboard ‖ An animal is riding a skateboard |
| sick-167 | x>y | entails | fails → holds | paraphrase-C000303, paraphrase-C001336 | A boy is hitting a baseball ‖ A child is hitting a baseball |
| sick-1677 | x>y | entails | fails → holds | paraphrase-C001561 | The man is pouring oil on a few tomatoes ‖ One person pours oil on a few tomatoes |
| sick-172 | x>y | entails | fails → holds | paraphrase-C000303, paraphrase-C001336 | A family is watching a boy who is hitting a baseball ‖ A child is hitting a baseball |
| sick-1723 | x>y | entails | fails → holds | paraphrase-C001561 | A man is recklessly riding a horse ‖ A person is recklessly riding a horse |
| sick-177 | x>y | entails | fails → holds | paraphrase-C000303, paraphrase-C001336 | A family is watching a little boy who is hitting a baseball ‖ A child is hitting a baseball |
| sick-19 | y>x | entails | fails → holds | paraphrase-C001561 | A person in a black jacket is doing tricks on a motorbike ‖ A man in a black jacket is doing tricks on a motorbike |
| sick-2188 | x>y | entails | fails → holds | paraphrase-C001561 | A few men are cheerfully playing cricket ‖ People are playing cricket |
| sick-2190 | y>x | entails | fails → holds | paraphrase-C001561 | People are playing cricket ‖ A few men are playing cricket |
| sick-2349 | x>y | entails | fails → holds | paraphrase-C003008 | The woman is adding cheese to the sauce ‖ The lady is adding cheese to the sauce |
| sick-2349 | y>x | entails | fails → holds | paraphrase-C001368 | The woman is adding cheese to the sauce ‖ The lady is adding cheese to the sauce |
| sick-2389 | x>y | entails | fails → holds | paraphrase-C001561 | The man is slicing the potato ‖ The person is slicing the potato |
| sick-2391 | x>y | entails | fails → holds | paraphrase-C001561 | The man is slicing a potato ‖ The person is slicing the potato |
| sick-2584 | x>y | entails | fails → holds | paraphrase-C002442 | A person is slicing some mushrooms ‖ A person is cutting some mushrooms |
| sick-2584 | y>x | entails | fails → holds | paraphrase-C000655 | A person is slicing some mushrooms ‖ A person is cutting some mushrooms |
| sick-2829 | x>y | entails | fails → holds | paraphrase-C001368 | The lady is penciling on eyeshadow ‖ The woman is penciling on eyeshadow |
| sick-2829 | y>x | entails | fails → holds | paraphrase-C003008 | The lady is penciling on eyeshadow ‖ The woman is penciling on eyeshadow |
| sick-3111 | x>y | entails | fails → holds | paraphrase-C001561 | The man is eating ‖ The person is eating |
| sick-3113 | x>y | entails | fails → holds | paraphrase-C001561 | A man is eating some food ‖ The person is eating |
| sick-3406 | x>y | entails | fails → holds | paraphrase-C001561 | A man is folding a tortilla ‖ A tortilla is being folded by a person |
| sick-3408 | x>y | entails | fails → holds | paraphrase-C001561 | A man is slowly folding a tortilla ‖ A person is folding a tortilla |
| sick-3410 | x>y | entails | fails → holds | paraphrase-C001561 | A man is folding a tortilla ‖ A person is folding a tortilla |
| sick-4094 | x>y | entails | fails → holds | paraphrase-C001561 | A picture is being drawn by a man ‖ The person is drawing |
| sick-4097 | x>y | entails | fails → holds | paraphrase-C001561 | A man is drawing a picture ‖ The person is drawing |
| sick-4172 | x>y | entails | fails → holds | paraphrase-C000655 | A woman is cutting a vegetable ‖ A woman is slicing a vegetable |
| sick-4172 | y>x | entails | fails → holds | paraphrase-C002442 | A woman is cutting a vegetable ‖ A woman is slicing a vegetable |
| sick-4591 | x>y | entails | fails → holds | paraphrase-C000655 | Some onions are being cut by a person ‖ A person is slicing some onions |
| sick-4591 | y>x | entails | fails → holds | paraphrase-C002442 | Some onions are being cut by a person ‖ A person is slicing some onions |
| sick-4616 | x>y | entails | fails → holds | paraphrase-C000303 | A boy is cutting grass with scissors ‖ A kid is cutting grass with scissors |
| sick-473 | x>y | entails | fails → holds | paraphrase-C000303, paraphrase-C001336 | A boy is holding a squirt gun ‖ A child is holding a squirt gun |
| sick-4777 | x>y | entails | fails → holds | paraphrase-C001445 | A little boy is playing a guitar ‖ A young boy is playing a guitar |
| sick-4777 | y>x | entails | fails → holds | paraphrase-C003060 | A little boy is playing a guitar ‖ A young boy is playing a guitar |
| sick-4869 | x>y | entails | fails → holds | paraphrase-C000655 | A woman is cutting potatoes ‖ A woman is slicing potatoes |
| sick-4869 | y>x | entails | fails → holds | paraphrase-C002442 | A woman is cutting potatoes ‖ A woman is slicing potatoes |
| sick-4923 | x>y | entails | fails → holds | paraphrase-C000655 | A person is cutting garlic into pieces with a knife ‖ A person is slicing garlic into pieces with a knife |
| sick-4923 | y>x | entails | fails → holds | paraphrase-C002442 | A person is cutting garlic into pieces with a knife ‖ A person is slicing garlic into pieces with a knife |
| sick-52 | x>y | entails | fails → holds | paraphrase-C001336 | Kids in red shirts are playing in the leaves ‖ Children in red shirts are playing in the leaves |
| sick-52 | y>x | entails | fails → holds | paraphrase-C000473 | Kids in red shirts are playing in the leaves ‖ Children in red shirts are playing in the leaves |
| sick-5293 | x>y | entails | fails → holds | paraphrase-C003015 | A woman is slicing a cucumber ‖ A person is slicing a cucumber |
| sick-5482 | x>y | entails | fails → holds | paraphrase-C001561 | The man is cracking eggs into a bowl ‖ The person is cracking eggs into a bowl |
| sick-55 | x>y | entails | fails → holds | paraphrase-C000303 | Three boys are jumping in the leaves ‖ Three kids are jumping in the leaves |
| sick-5527 | x>y | entails | fails → holds | paraphrase-C002442 | A woman is slicing tofu ‖ A woman is cutting tofu |
| sick-5527 | y>x | entails | fails → holds | paraphrase-C000655 | A woman is slicing tofu ‖ A woman is cutting tofu |
| sick-5671 | x>y | entails | fails → holds | paraphrase-C000780 | A small dog is lying on the bed ‖ A small animal is lying on the bed |
| sick-5673 | x>y | entails | fails → holds | paraphrase-C000780 | A small dog is lying on a bed ‖ A small animal is lying on the bed |
| sick-5678 | x>y | entails | fails → holds | paraphrase-C000655 | A woman is cutting butter ‖ A woman is slicing butter |
| sick-5678 | y>x | entails | fails → holds | paraphrase-C002442 | A woman is cutting butter ‖ A woman is slicing butter |
| sick-570 | y>x | entails | fails → holds | paraphrase-C001766 | A white and brown dog is walking through the water with difficulty ‖ A white and brown dog is pacing through the water with difficulty |
| sick-5772 | x>y | entails | fails → holds | paraphrase-C001561 | A man is riding an electric bicycle ‖ A person is riding an electric bicycle |
| sick-587 | x>y | entails | fails → holds | paraphrase-C000303, paraphrase-C001336 | A bunch of boys are playing with a ball in front of a large door made of wood ‖ The children are playing in front of a large door |
| sick-590 | x>y | entails | fails → holds | paraphrase-C000303, paraphrase-C001336 | A group of boys are playing with a ball in front of a large door made of wood ‖ The children are playing in front of a large door |
| sick-5914 | x>y | entails | fails → holds | paraphrase-S004403 | A horse is being ridden by a person ‖ A person is riding a horse |
| sick-5914 | y>x | entails | fails → holds | paraphrase-S004456 | A horse is being ridden by a person ‖ A person is riding a horse |
| sick-6054 | x>y | entails | fails → holds | paraphrase-S004371 | The little dog is grabbing the bedroom slipper with its mouth funnily ‖ The little dog is grabbing the bedroom slipper with its mouth |
| sick-6375 | x>y | entails | fails → holds | paraphrase-C001561 | The man is wearing a wetsuit and is riding a surfboard ‖ The person is wearing a wetsuit and is riding a surfboard |
| sick-6415 | x>y | entails | fails → holds | paraphrase-S004403 | A bike is being ridden by a person ‖ A person is riding a bike |
| sick-6415 | y>x | entails | fails → holds | paraphrase-S004456 | A bike is being ridden by a person ‖ A person is riding a bike |
| sick-6497 | x>y | entails | fails → holds | paraphrase-C001561 | A man is holding up an electronic device ‖ A person is holding up an electronic device |
| sick-6832 | x>y | entails | fails → holds | paraphrase-C001336 | The kids are chasing each other in the sand ‖ The children are chasing each other in the sand |

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

## The candidates

| kind / status | n |
|---|---|
| class/admitted | 21 |
| class/candidate | 207 |
| class/note | 2471 |
| class/rejected | 373 |
| substitution/admitted | 6 |
| substitution/candidate | 108 |
| substitution/note | 4136 |
| substitution/rejected | 262 |

### admitted (the first 27 by sole-support families)

| id | candidate | sole fam. | joint fam. | proposed fam. | violations | contacts | an example |
|---|---|---|---|---|---|---|---|
| paraphrase-C001561 | `man → person` | 16 | 18 | 40 | 0 | 25 | A man is sitting comfortably at a table ‖ A person is sitting comfortably at the table (x>y, entails) |
| paraphrase-C000303 | `boy → kid` | 6 | 4 | 13 | 0 | 5 | Several boys are jumping on a trampoline ‖ Several kids are jumping on a trampoline (x>y, entails) |
| paraphrase-C000473 | `child → kid` | 6 | 0 | 10 | 0 | 0 | Two young kids are eating corndogs ‖ Two young children are eating corndogs (y>x, entails) |
| paraphrase-C000780 | `dog → animal` | 6 | 4 | 7 | 0 | 2 | A dog is barking at a ball ‖ An animal is barking at a ball (x>y, entails) |
| paraphrase-C001336 | `kid → child` | 5 | 1 | 10 | 0 | 1 | Two young kids are eating corndogs ‖ Two young children are eating corndogs (x>y, entails) |
| paraphrase-S004456 | `L:¦Theme($e1,$x1)¦asserted & R:¦Patient($e1,$x1)¦asserted` | 4 | 2 | 7 | 0 | 2 | The ice skating rink placed outdoors is full of people ‖ An ice skating rink placed outdoors is full of people (x>y, entails) |
| paraphrase-C000588 | `cord → rope` | 3 | 0 | 3 | 0 | 0 | A cord is being climbed by a man ‖ A rope is being climbed by a man (x>y, entails) |
| paraphrase-C000655 | `cut → slice` | 3 | 2 | 4 | 0 | 3 | A person is slicing an onion ‖ A person is cutting an onion (y>x, entails) |
| paraphrase-C002442 | `slice → cut` | 3 | 3 | 4 | 0 | 7 | A person is slicing an onion ‖ A person is cutting an onion (x>y, entails) |
| paraphrase-C003015 | `woman → person` | 3 | 9 | 18 | 0 | 13 | A woman is boiling noodles in water ‖ The person is boiling noodles (x>y, entails) |
| paraphrase-C000091 | `automobile → car` | 2 | 0 | 2 | 0 | 0 | A man is getting into an automobile ‖ A man is getting into a car (x>y, entails) |
| paraphrase-C000398 | `car → automobile` | 2 | 0 | 2 | 0 | 0 | A man is getting into an automobile ‖ A man is getting into a car (y>x, entails) |
| paraphrase-C000409 | `car → vehicle` | 2 | 2 | 4 | 0 | 1 | The girl is recklessly jumping onto a car ‖ The girl is recklessly jumping onto a vehicle (x>y, entails) |
| paraphrase-C001146 | `gun → weapon` | 2 | 0 | 2 | 0 | 0 | Five kids are standing close together and one kid has a gun ‖ Five kids are standing close together and one kid has a weapon (x>y, entails) |
| paraphrase-C001368 | `lady → woman` | 2 | 1 | 6 | 0 | 1 | The woman is stirring eggs in a bowl ‖ The lady is stirring eggs in a bowl (y>x, entails) |
| paraphrase-C001442 | `little → small` | 2 | 1 | 4 | 0 | 1 | A small boy in a striped shirt is sliding out of a green tube ‖ A little boy in a striped shirt is sliding out of a green tube (y>x, entails) |
| paraphrase-C001445 | `little → young` | 2 | 0 | 4 | 0 | 0 | A little girl is looking at a woman in costume ‖ A young girl is looking at a woman in costume (x>y, entails) |
| paraphrase-C001766 | `pace → walk` | 2 | 0 | 2 | 0 | 0 | A tiger is pacing around a cage ‖ A tiger is walking around a cage (x>y, entails) |
| paraphrase-C002299 | `seashore → beach` | 2 | 2 | 2 | 0 | 2 | A group of boys is playing soccer on the seashore ‖ A group of boys is playing soccer on the beach (x>y, entails) |
| paraphrase-C002470 | `small → little` | 2 | 1 | 4 | 0 | 1 | A small boy in a striped shirt is sliding out of a green tube ‖ A little boy in a striped shirt is sliding out of a green tube (x>y, entails) |
| paraphrase-C003008 | `woman → lady` | 2 | 1 | 6 | 0 | 2 | The woman is stirring eggs in a bowl ‖ The lady is stirring eggs in a bowl (x>y, entails) |
| paraphrase-C003060 | `young → little` | 2 | 1 | 4 | 0 | 2 | A little girl is looking at a woman in costume ‖ A young girl is looking at a woman in costume (y>x, entails) |
| paraphrase-S003293 | `L:¦In($e1,$x1)¦asserted & R:¦Location($e1,$x1)¦asserted` | 2 | 2 | 4 | 0 | 1 | The little boy is riding a bicycle in a race ‖ A bicycle is being ridden by the little boy in a race (x>y, entails) |
| paraphrase-S003646 | `L:¦Location($e1,$x1)¦asserted & R:¦In($e1,$x1)¦asserted` | 2 | 2 | 4 | 0 | 2 | The little boy is riding a bicycle in a race ‖ A bicycle is being ridden by the little boy in a race (y>x, entails) |
| paraphrase-S004371 | `L:¦PartOf($x1,$x2)¦asserted & R:¦Possession($x1,$x2)¦asserted` | 2 | 1 | 2 | 0 | 1 | A boy in blue shirt is looking at his hand near a stack of blocks on table ‖ The boy in blue shirt is looking at his hand near the stack of blocks on table (y>x, entails) |
| paraphrase-S004403 | `L:¦Patient($e1,$x1)¦asserted & R:¦Theme($e1,$x1)¦asserted` | 2 | 2 | 7 | 0 | 1 | The ice skating rink placed outdoors is full of people ‖ An ice skating rink placed outdoors is full of people (y>x, entails) |
| paraphrase-S004437 | `L:¦Possession($x1,$x2)¦asserted & R:¦PartOf($x1,$x2)¦asserted` | 2 | 1 | 2 | 0 | 1 | A boy in blue shirt is looking at his hand near a stack of blocks on table ‖ The boy in blue shirt is looking at his hand near the stack of blocks on table (x>y, entails) |

### rejected (the first 40 by sole-support families)

| id | candidate | sole fam. | joint fam. | proposed fam. | violations | contacts | an example |
|---|---|---|---|---|---|---|---|
| paraphrase-C003011 | `woman → man` | 24 | 13 | 41 | 26 | 23 | A little girl is looking at a woman in costume ‖ The little girl is looking at a man in costume (x>y, contradicts) |
| paraphrase-C001584 | `man → woman` | 22 | 13 | 41 | 25 | 22 | A little girl is looking at a woman in costume ‖ The little girl is looking at a man in costume (y>x, neutral) |
| paraphrase-C001860 | `person → man` | 16 | 18 | 40 | 18 | 34 | A person is sitting in a field and is wearing a hat ‖ A man is sitting in a field (x>y, neutral) |
| paraphrase-C000300 | `boy → girl` | 11 | 4 | 14 | 11 | 4 | A girl is playing a wind instrument ‖ A boy is playing a wind instrument (y>x, neutral) |
| paraphrase-C001035 | `girl → boy` | 11 | 0 | 14 | 11 | 0 | A girl is playing a wind instrument ‖ A boy is playing a wind instrument (x>y, neutral) |
| paraphrase-C000430 | `cat → dog` | 10 | 4 | 11 | 10 | 4 | A dog is opening a drawer and climbing inside ‖ A cat is opening a drawer and climbing inside (y>x, neutral) |
| paraphrase-C000785 | `dog → cat` | 10 | 3 | 11 | 10 | 3 | A dog is opening a drawer and climbing inside ‖ A cat is opening a drawer and climbing inside (x>y, neutral) |
| paraphrase-C002558 | `stand → sit` | 7 | 4 | 14 | 7 | 5 | Four people are standing on a low cement ledge ‖ Four people are sitting on a low cement ledge (x>y, neutral) |
| paraphrase-C000056 | `animal → dog` | 6 | 1 | 7 | 6 | 1 | A dog is barking at a ball ‖ An animal is barking at a ball (y>x, neutral) |
| paraphrase-C001335 | `kid → boy` | 6 | 2 | 13 | 6 | 2 | Several boys are jumping on a trampoline ‖ Several kids are jumping on a trampoline (y>x, neutral) |
| paraphrase-C002405 | `sit → stand` | 6 | 4 | 14 | 6 | 5 | Four people are standing on a low cement ledge ‖ Four people are sitting on a low cement ledge (y>x, neutral) |
| paraphrase-S003148 | `L:¦Goal($e1,$x1)¦asserted & R:¦Source($e1,$x1)¦asserted` | 5 | 0 | 6 | 5 | 0 | A soccer player is kicking a ball out of the goal ‖ A soccer player is kicking a ball into the goal (y>x, neutral) |
| paraphrase-S004446 | `L:¦Source($e1,$x1)¦asserted & R:¦Goal($e1,$x1)¦asserted` | 5 | 0 | 6 | 5 | 0 | A soccer player is kicking a ball out of the goal ‖ A soccer player is kicking a ball into the goal (x>y, contradicts) |
| paraphrase-C000239 | `black → white` | 4 | 3 | 10 | 4 | 4 | A man in a blue cowboy hat is riding a black horse ‖ A man in a blue cowboy hat is riding a white horse (x>y, contradicts) |
| paraphrase-C000941 | `field → grass` | 4 | 2 | 9 | 1 | 2 | A person is wearing a hat and is sitting on the grass ‖ A person is sitting in a field and is wearing a hat (y>x, neutral) |
| paraphrase-C001083 | `grass → field` | 4 | 3 | 9 | 3 | 3 | A person is wearing a hat and is sitting on the grass ‖ A person is sitting in a field and is wearing a hat (x>y, neutral) |
| paraphrase-C002555 | `stand → run` | 4 | 0 | 4 | 4 | 0 | A group of football players is running in the field ‖ A group of football players is standing still in the field (y>x, neutral) |
| paraphrase-C002900 | `walk → sit` | 4 | 1 | 4 | 5 | 1 | A man, a woman and two girls are walking on the beach ‖ A man, a woman and two girls are sitting on the beach (x>y, neutral) |
| paraphrase-C002975 | `white → black` | 4 | 4 | 10 | 4 | 4 | A man in a blue cowboy hat is riding a black horse ‖ A man in a blue cowboy hat is riding a white horse (y>x, neutral) |
| paraphrase-C001733 | `old → young` | 3 | 0 | 3 | 3 | 0 | An old woman is shaking hands with a man ‖ A young woman is shaking hands with a man (x>y, neutral) |
| paraphrase-C002219 | `rope → cord` | 3 | 0 | 3 | 2 | 0 | A cord is being climbed by a man ‖ A rope is being climbed by a man (y>x, neutral) |
| paraphrase-C002240 | `run → sit` | 3 | 1 | 5 | 3 | 1 | A man is sitting in a field ‖ A man is running in a field (y>x, neutral) |
| paraphrase-C002243 | `run → stand` | 3 | 1 | 4 | 3 | 1 | Five people are running with three dogs in the green field beside the road ‖ Five people are standing with three dogs in the green field beside the road (x>y, neutral) |
| paraphrase-C002401 | `sit → run` | 3 | 1 | 5 | 3 | 1 | A man is sitting in a field ‖ A man is running in a field (x>y, neutral) |
| paraphrase-C002409 | `sit → walk` | 3 | 0 | 4 | 3 | 0 | A man, a woman and two girls are walking on the beach ‖ A man, a woman and two girls are sitting on the beach (y>x, neutral) |
| paraphrase-C002865 | `vehicle → car` | 3 | 2 | 4 | 2 | 1 | The girl is recklessly jumping onto a car ‖ The girl is recklessly jumping onto a vehicle (y>x, neutral) |
| paraphrase-C003061 | `young → old` | 3 | 0 | 3 | 3 | 0 | An old woman is shaking hands with a man ‖ A young woman is shaking hands with a man (y>x, neutral) |
| paraphrase-C000025 | `air → ground` | 2 | 1 | 3 | 2 | 1 | A little boy in red clothes is jumping onto the ground ‖ A little boy in red clothes is jumping into the air (y>x, contradicts) |
| paraphrase-C000152 | `beach → seashore` | 2 | 1 | 2 | 1 | 1 | A group of boys is playing soccer on the seashore ‖ A group of boys is playing soccer on the beach (y>x, neutral) |
| paraphrase-C000191 | `big → small` | 2 | 2 | 5 | 2 | 2 | A big cat is opening a plastic drawer with its paws and is jumping inside ‖ A small cat is opening a plastic drawer with its paws and jumping inside (x>y, neutral) |
| paraphrase-C000305 | `boy → man` | 2 | 4 | 10 | 2 | 7 | One man is talking to a girl with an internet camera ‖ A boy in his teens is talking to a girl with an internet camera (y>x, neutral) |
| paraphrase-C001116 | `ground → air` | 2 | 1 | 3 | 2 | 1 | A little boy in red clothes is jumping onto the ground ‖ A little boy in red clothes is jumping into the air (x>y, neutral) |
| paraphrase-C001264 | `instrument → flute` | 2 | 1 | 2 | 4 | 1 | A girl is playing a flute ‖ A wind instrument is being played by a girl (y>x, neutral) |
| paraphrase-C001384 | `large → small` | 2 | 1 | 3 | 2 | 1 | A small white dog is jumping up in the snow ‖ A large white dog is jumping up in the snow (y>x, neutral) |
| paraphrase-C001516 | `man → boy` | 2 | 5 | 10 | 3 | 11 | A man is walking slowly across a bridge made of rope ‖ A boy is walking across a bridge (x>y, neutral) |
| paraphrase-C001933 | `play → put_away` | 2 | 2 | 2 | 2 | 2 | A flute is being played by a girl ‖ A flute is being put away by a girl (x>y, contradicts) |
| paraphrase-C001935 | `play → rest` | 2 | 0 | 2 | 2 | 0 | Different teams are playing football on a field ‖ Different teams are resting on a field (x>y, neutral) |
| paraphrase-C002026 | `put_away → play` | 2 | 1 | 2 | 2 | 1 | A flute is being played by a girl ‖ A flute is being put away by a girl (y>x, contradicts) |
| paraphrase-C002165 | `river → stream` | 2 | 0 | 2 | 1 | 0 | A man is fishing in the river ‖ A man is fishing in the stream (x>y, neutral) |
| paraphrase-C002465 | `small → big` | 2 | 2 | 5 | 2 | 2 | A big cat is opening a plastic drawer with its paws and is jumping inside ‖ A small cat is opening a plastic drawer with its paws and jumping inside (y>x, neutral) |

### candidate (the first 40 by sole-support families)

| id | candidate | sole fam. | joint fam. | proposed fam. | violations | contacts | an example |
|---|---|---|---|---|---|---|---|
| paraphrase-C000019 | `aim → draw` | 1 | 0 | 1 | 0 | 0 | The man is aiming a gun ‖ The man is drawing a gun (x>y, entails) |
| paraphrase-C000020 | `aim → handle` | 1 | 0 | 1 | 0 | 0 | The man is aiming a gun ‖ The man is handling a gun (x>y, entails) |
| paraphrase-C000038 | `air → wind` | 1 | 0 | 1 | 0 | 0 | A dog is in the sand that is blowing in the air ‖ A dog is in the sand that is blowing in the wind (x>y, entails) |
| paraphrase-C000125 | `ball → toy` | 1 | 1 | 2 | 0 | 1 | Two white dogs and one brown dog are chasing a ball ‖ Two white dogs and one brown dog are chasing a toy (x>y, entails) |
| paraphrase-C000128 | `banana → fruit` | 1 | 1 | 1 | 0 | 1 | A man is eating a banana ‖ A man is eating a fruit (x>y, entails) |
| paraphrase-C000133 | `barbell → weight` | 1 | 0 | 1 | 0 | 0 | A man is lifting barbells ‖ The man is lifting weights (x>y, entails) |
| paraphrase-C000134 | `bark → shout` | 1 | 0 | 1 | 0 | 0 | The military officer is shouting at the recruits ‖ The military officer is barking at the recruits (y>x, entails) |
| paraphrase-C000143 | `battle → fight` | 1 | 0 | 1 | 0 | 0 | Two dogs are battling for a frisbee in a lake ‖ Two dogs are fighting for a frisbee in a lake (x>y, entails) |
| paraphrase-C000150 | `beach → sand` | 1 | 0 | 3 | 0 | 0 | A dog is running on the beach and chasing a ball ‖ A dog is running on the sand and chasing a ball (x>y, entails) |
| paraphrase-C000153 | `beach → shore` | 1 | 1 | 2 | 0 | 0 | The brown dogs are playfully fighting on the sandy beach ‖ The brown dogs are playfully fighting on the sandy shore (x>y, entails) |
| paraphrase-C000157 | `bear → panda` | 1 | 1 | 1 | 0 | 1 | Two pandas are lying together ‖ Two panda bears are lying together (y>x, entails) |
| paraphrase-C000189 | `big → huge` | 1 | 0 | 1 | 0 | 0 | A black and white dog is carrying a big stick on the green grass ‖ A black and white dog is carrying a huge stick on the green grass (x>y, entails) |
| paraphrase-C000222 | `black → colored` | 1 | 0 | 1 | 0 | 0 | A girl has black and orange patches on the cheeks ‖ A girl has colored patches on the cheeks (x>y, entails) |
| paraphrase-C000268 | `body → water` | 1 | 0 | 1 | 0 | 0 | Two bmx bikers are jumping dirt ramps in front of the water ‖ Two bmx bikers are jumping dirt ramps in front of a body of water (y>x, entails) |
| paraphrase-C000280 | `boulder → rock` | 1 | 0 | 1 | 0 | 0 | A woman on a boulder is lying on a blanket and reading a book ‖ A woman on a rock is lying on a blanket and reading a book (x>y, entails) |
| paraphrase-C000296 | `box → container` | 1 | 1 | 1 | 0 | 1 | A man is putting some food in a box ‖ A man is putting some food in a container (x>y, entails) |
| paraphrase-C000298 | `boy → child` | 1 | 1 | 10 | 0 | 1 | The boy, who is young, is running through the ocean waves ‖ A child is running in and out of the ocean waves (x>y, entails) |
| paraphrase-C000302 | `boy → guy` | 1 | 0 | 1 | 0 | 0 | A boy is mowing the lawn ‖ A guy is mowing the lawn (x>y, entails) |
| paraphrase-C000314 | `boy → swimmer` | 1 | 0 | 1 | 0 | 0 | A young boy is sitting in a bathing suit and waiting for the next race ‖ A young swimmer is sitting in a bathing suit and waiting for the next race (x>y, entails) |
| paraphrase-C000326 | `break → crack` | 1 | 0 | 1 | 0 | 0 | The lady is breaking an egg for the mixer ‖ The lady is cracking an egg for the mixer (x>y, entails) |
| paraphrase-C000372 | `burn → set_fire_to` | 1 | 0 | 1 | 0 | 0 | Some cameras are being burned by a person with a blow torch ‖ The person is setting fire to the cameras (x>y, entails) |
| paraphrase-C000383 | `camera → photo` | 1 | 0 | 1 | 0 | 0 | Three friends are making faces for the camera ‖ Three friends are making faces for a photo (x>y, entails) |
| paraphrase-C000388 | `camera → webcam` | 1 | 1 | 1 | 0 | 3 | A boy in his teens is talking to a girl with an internet camera ‖ A boy in his teens is talking to a girl with a webcam (x>y, entails) |
| paraphrase-C000389 | `candidate → millionaire` | 1 | 0 | 1 | 0 | 0 | The law does not regulate how much individuals can contribute to their own campaigns, a decided advantage for millionaires like Mr. Schwarzenegger and Mr. Ueberroth, both Republican candidates. ‖ The law does not regulat |
| paraphrase-C000412 | `carefully → cautiously` | 1 | 0 | 1 | 0 | 0 | The man is carefully feeding a mouse to the snake ‖ The man is cautiously feeding a mouse to the snake (x>y, entails) |
| paraphrase-C000438 | `cautiously → carefully` | 1 | 0 | 1 | 0 | 0 | The man is carefully feeding a mouse to the snake ‖ The man is cautiously feeding a mouse to the snake (y>x, entails) |
| paraphrase-C000439 | `central → centre` | 1 | 0 | 1 | 0 | 0 | Mohcine Douali, who lives in the centre of Algiers, said: "It was a great shock. ‖ "It was a great shock," said Mohcine Douali, who lives in central Algiers. (y>x, paraphrase) |
| paraphrase-C000440 | `centre → central` | 1 | 0 | 1 | 0 | 0 | Mohcine Douali, who lives in the centre of Algiers, said: "It was a great shock. ‖ "It was a great shock," said Mohcine Douali, who lives in central Algiers. (x>y, paraphrase) |
| paraphrase-C000456 | `chase → run_after` | 1 | 0 | 1 | 0 | 0 | A dog is running after a ball in the grass ‖ A dog is chasing a ball in the grass (y>x, entails) |
| paraphrase-C000457 | `check → read` | 1 | 1 | 1 | 0 | 1 | Someone is checking the email ‖ Someone is reading the email (x>y, entails) |
| paraphrase-C000460 | `cheerfully → joyfully` | 1 | 0 | 1 | 0 | 0 | One white dog and one black one are cheerfully running side by side on the grass ‖ A black and a white dog are joyfully running on the grass (x>y, entails) |
| paraphrase-C000461 | `cheerleader → man` | 1 | 0 | 1 | 0 | 0 | A female cheerleader is sitting on the knee of a male cheerleader ‖ A female cheerleader is sitting on the knee of a man (x>y, entails) |
| paraphrase-C000482 | `chop → cut` | 1 | 0 | 1 | 0 | 0 | A person is quickly cutting mushrooms with a knife ‖ A person is quickly chopping mushrooms with a knife (y>x, entails) |
| paraphrase-C000484 | `chop_down → cut` | 1 | 1 | 1 | 0 | 0 | A tree is being cut by a man with an axe ‖ A man is chopping down a tree with an axe (y>x, entails) |
| paraphrase-C000488 | `chop_up → cut` | 1 | 0 | 1 | 0 | 0 | A woman is chopping up an octopus ‖ A woman is cutting an octopus (x>y, entails) |
| paraphrase-C000500 | `clean → cleanse` | 1 | 1 | 1 | 0 | 0 | Someone is cleaning an animal ‖ Someone is cleansing an animal (x>y, entails) |
| paraphrase-C000505 | `cleanse → clean` | 1 | 1 | 1 | 0 | 1 | Someone is cleaning an animal ‖ Someone is cleansing an animal (y>x, entails) |
| paraphrase-C000563 | `concert → show` | 1 | 0 | 1 | 0 | 0 | A group of people are dancing at a concert ‖ A group of people are dancing in a show (x>y, entails) |
| paraphrase-C000569 | `construction → work` | 1 | 0 | 1 | 0 | 0 | Two men are taking a break from construction ‖ Two men are taking a break from work (x>y, entails) |
| paraphrase-C000580 | `cook → prepare` | 1 | 1 | 1 | 0 | 0 | A chef is preparing a meal ‖ A chef is cooking a meal (y>x, entails) |

## The residual edits over all pairs

class 9707, substitution 5258, drop 6192, flip 4039, band 45

