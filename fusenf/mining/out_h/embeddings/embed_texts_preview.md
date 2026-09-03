# Embedding text preview — what each filler occurrence would send (H, 2026-09-03)

- inventory: word mode 2896 distinct texts; subtree mode 3401; union 3404 (one run of the union yields both modes)
- columns: slot = center class.head; word = one text per label (multi-label = each label, 1/m mass); subtree = the label bag / name / constant as one text

## Multi-label skolem fillers (the alphabetical-first cases)

| record | sentence | slot | word texts | subtree text |
|---|---|---|---|---|
| tierB-000004 | Tom leaves the lights on all day. | leave.Patient | light · on | light, on (plural) |
| tierB-000137 | William is the type of friend who always listens and gives good advice. | give.Theme | advice · good | advice, good |
| tierB-000370 | Everything is getting more expensive. Only the excuses are getting cheaper. | get.Patient | expensive · thing | expensive, thing |
| tierB-000596 | The hat got wet and went limp. | limp.Experiencer | hat · limp · wet | hat, limp, wet |
| tierB-000748 | The weather is getting worse. | get.Patient | bad · weather | bad, weather |
| tierB-000871 | The quick brown fox jumped over the lazy brown dog. | jump.Agent | brown · fox · quick | brown, fox, quick |
| tierB-000997 | Briefly, the answer is no. This has been an issue since 2015. | issue.Experiencer | answer · no | answer, no |
| tierB-001196 | That place is full of insects, more than a simple fly. | <unclassed>.LocatedIn | full · place | full, place |
| tierB-001384 | Faint grew the sound of the train. | faint.Experiencer | faint · sound | faint, sound |
| tierB-001568 | The man was ashamed of being born poor. | bear.Patient | man · poor | man, poor |
| tierB-001716 | The colonial authorities are doing nothing to improve the health care of the loc | health_care.Possession | local · population | local, population |
| tierB-001882 | Oh, the toast is burned black. | black.Experiencer | black · toast | black, toast |
| tierB-001995 | The trace amounts of cyanide produced when apple seeds are digested are harmless | produce.Patient | cyanide · harmless · trace | cyanide, harmless, trace |
| tierC-000135 | This view is usual in northern India and parts of southern India . | usual.Experiencer | usual · view | usual, view |

(363 such occurrences)

## Plural groups (typed via GroupOf)

| record | sentence | slot | word texts | subtree text |
|---|---|---|---|---|
| tierB-000005 | The Berber-speaking population quickly plummeted with the arrival of the first F | arrival.Agent | french settler | french settler (plural) |
| tierB-000166 | Yair Stern made two attempts to collaborate with the Nazis. | collaborate.Agent | nazi | nazi (plural) |
| tierB-000359 | These three parties govern together in a coalition. | govern.Agent | party | party (plural) |
| tierB-000556 | With this ticket, two people can enter for free. | enter.Agent | person | person (plural) |
| tierB-000749 | The teacher teaches the useful phrases. | teach.Theme | phrase | phrase (plural) |
| tierB-000913 | The army blocked the roads to the city. | block.Patient | road | road (plural) |
| tierB-001079 | Lady Ashton became much alarmed and consulted the family physicians. | consult.Theme | family physician | family physician (plural) |
| tierB-001295 | The women in this film are dressed in a very conventional way. | dress.Patient | woman | woman (plural) |
| tierB-001449 | Linda always knows the right questions to ask. | know.Stimulus | question | question (plural) |
| tierB-001628 | Most of the pupils here go to school by bike. | go.Agent | pupil | pupil (plural) |
| tierB-001816 | Hopefully, things will start to improve. | improve.Patient | thing | thing (plural) |
| tierB-001955 | The dishes need to be done. | do.Patient | dish | dish (plural) |
| tierC-000113 | Like many aspects of Islamic ivory this reflects the Byzantine traditions Islam  | inherit.Theme | byzantine tradition | byzantine tradition (plural) |
| tierC-000160 | It supported the views of the Free Soil Party and the Republican Party . | support.Theme | view | view (plural) |

(389 such occurrences)

## Named constants (surface Name string used)

| record | sentence | slot | word texts | subtree text |
|---|---|---|---|---|
| tierB-000001 | Ziri was running around constantly. | run_around.Agent | Ziri | Ziri |
| tierB-000137 | William is the type of friend who always listens and gives good advice. | give.Agent | William | William |
| tierB-000253 | Fadil studied Arabic for one year. | study.Theme | Arabic | Arabic |
| tierB-000441 | Bill searched the entire house. | search.Agent | Bill | Bill |
| tierB-000667 | Matthew traveled for work so much. | travel.Agent | Matthew | Matthew |
| tierB-000951 | Hanako walked through the hallway making a clicking sound. | make.Agent | Hanako | Hanako |
| tierB-001272 | This style of costume originated in Paris. | originate.Location | Paris | Paris |
| tierB-001683 | The Wagner Group is still very present in Africa. | present.Experiencer | Wagner Group | Wagner Group |
| tierC-000017 | Her family contacted Corentin Rahier , who suggested Muriel Zazoui as a potentia | suggest.Theme | Muriel Zazoui | Muriel Zazoui |
| tierC-000078 | The Speaker was first Thomas Bain , and later James David Edgar . | speaker.Experiencer | James David Edgar | James David Edgar |
| tierC-000120 | It was designed by architect Henry L. Taylor and was built by O. R. Woodcock . | design.Agent | Henry L. Taylor | Henry L. Taylor |
| tierC-000184 | The PacifiCats were designed by Philip Hercus of Vancouver and Robert Allan Limi | design.Agent | Philip Hercus | Philip Hercus |
| tierC-000240 | Kristoffer together with Karen had eight children . | have.CoAgent | Karen | Karen |
| tierC-000291 | In Turkey , the company built a hotel in Eskisehir and a paper mill in Kazakhsta | build.Location | Turkey | Turkey |

(855 such occurrences)

## Non-name constants under obliques / Time / Manner (adverbs, times, bare kinds)

| record | sentence | slot | word texts | subtree text |
|---|---|---|---|---|
| tierB-000001 | Ziri was running around constantly. | run_around.Manner | constantly | constantly |
| tierB-000152 | This word comes from the Greek. | come.Source | greek | greek |
| tierB-000310 | Translating sentences is not an easy task. | translate.Theme | sentence | sentence |
| tierB-000489 | The other day something horrible happened in a Tokyo suburb. | horrible.Time | the other day | the other day |
| tierB-000686 | A full moon can be seen tonight. | see.Time | tonight | tonight |
| tierB-000915 | Revenge is a dish which is best served cold. | serve.Manner | best | best |
| tierB-001085 | School begins at 8:10 a.m. | begin.Patient | school | school |
| tierB-001270 | Now, Alexander can translate in Spanish. | translate.In | spanish | spanish |
| tierB-001482 | Plurivocality in a society is provided by media, of course. | provide.Agent | media | media |
| tierB-001628 | Most of the pupils here go to school by bike. | <unclassed>.LocatedIn | here | here |
| tierB-001774 | The origin of Sudanese food comes from a great many places. | origin.Possession | sudanese food | sudanese food |
| tierB-001948 | Toxicology testing was positive for diacetylmorphine. | positive.For | diacetylmorphine | diacetylmorphine |
| tierC-000108 | Ralph encouraged Maurice in mathematics and chess . | encourage.In | mathematics | mathematics |
| tierC-000198 | Company sells ice cream , then expands to bake ice cones headquarters moves to B | sell.Theme | ice cream | ice cream |

(624 such occurrences)

## Eventive complements (event-kind fillers)

| record | sentence | slot | word texts | subtree text |
|---|---|---|---|---|
| tierB-000002 | Tom waited for Mary to ring. | wait.For | ring | ring |
| tierB-000173 | David began to make progress. | begin.Theme | make | make |
| tierB-000316 | Stefan spotted another person in the huge gym working out. | spot.Stimulus | work out | work out |
| tierB-000470 | The crocodile tried to pull Boris into the river. | try.Theme | pull | pull |
| tierB-000738 | Both girls started to cry. | start.Theme | cry | cry |
| tierB-000903 | This broadcast was scheduled for a very late hour. | schedule.Patient | broadcast | broadcast |
| tierB-001130 | The company is trying to burnish its image after the scandal. | scandal.Before | try | try |
| tierB-001337 | These houses are new, but those ones are old. | new.But | old | old |
| tierB-001531 | The scent of fresh rain lingered in the air after the storm. | storm.Before | linger | linger |
| tierB-001669 | The anger of the people exploded, leading to a series of riots. | explode.Patient | anger | anger |
| tierB-001878 | An extradition clause was also included in the treaty. | extradition_clause.Also | include | include |
| tierC-000001 | Once the indigenous people had become indigenous , they would cease to be French | become.Before | cease | cease |
| tierC-000123 | To prevent this , her father cursed her and stabbed Appius Claudius Crassus . | curse.To | prevent | prevent |
| tierC-000231 | When it was printed commercially , illustrations were added by J. Augustus Knapp | add.During | print | print |

(252 such occurrences)

## Class constants under Member / Inheritance / GroupOf heads (the 'other' bucket; texts = class words)

| record | sentence | slot | word texts | subtree text |
|---|---|---|---|---|
| tierB-000001 | Ziri was running around constantly. | run_around.Member | run around | run around |
| tierB-000319 | Jonas can help the girl. | girl.Member | girl | girl |
| tierB-000650 | The biggest problem is water. | problem.Member | water | water |
| tierB-000942 | The cook took the roller and started rolling the pizza dough on the peel. | start.Member | start | start |
| tierB-001239 | This park is maintained by the municipality. | park.Member | park | park |
| tierB-001541 | The shopping arcade was covered with lots of paper decorations. | shopping_arcade.Member | shopping arcade | shopping arcade |
| tierB-001854 | Chang-Yong Lim is the pitcher with the straight pitch that wriggles like a snake | pitch.Member | straight | straight |
| tierC-000103 | The album was produced by Colin Richardson and mixed by Jason Suecof . | mix.Member | mix | mix |

(4676 such occurrences)

