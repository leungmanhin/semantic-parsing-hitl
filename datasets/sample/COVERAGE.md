# Coverage report

574 sentences · manifest e56a9c929e95 · parser gemini-4-argon · covered 158 (28%), partial 323, none 86, malformed 7, errors 0

covered = every span mapped and at least one predication fired; partial = predications beside unmapped spans; none = nothing but referents or everything unmapped; malformed = the reply broke the contract or the emitter refused it.

## By source

| source | sentences | covered | partial | none | malformed | errors | covered rate | median instances | lints | issue reports |
|---|---|---|---|---|---|---|---|---|---|---|
| hotpotqa.validation | 150 | 16 | 118 | 15 | 1 | 0 | 11% | 6.0 | 4 | 5 |
| drop.dev/history | 40 | 5 | 28 | 7 | 0 | 0 | 12% | 7.0 | 3 | 5 |
| drop.dev/nfl | 20 | 1 | 19 | 0 | 0 | 0 | 5% | 9.5 | 1 | 0 |
| wikitext-103.validation | 80 | 12 | 55 | 11 | 2 | 0 | 15% | 7.0 | 1 | 2 |
| openwebtext.slice | 80 | 10 | 48 | 21 | 1 | 0 | 12% | 8.0 | 4 | 6 |
| clutrr.gen_train23_test2to10.test | 98 | 57 | 33 | 8 | 0 | 0 | 58% | 8.0 | 2 | 36 |
| babi.qa1.test | 46 | 46 | 0 | 0 | 0 | 0 | 100% | 3.0 | 0 | 0 |
| lambada.test | 30 | 9 | 7 | 12 | 2 | 0 | 30% | 5.0 | 3 | 2 |
| pg19.validation | 30 | 2 | 15 | 12 | 1 | 0 | 7% | 8.0 | 1 | 1 |

## Gap codes on the unmapped spans

- G00: 653
- G03: 46
- G02: 26
- G10: 19
- G05: 12
- G01: 10
- G09: 3
- G04: 1
- G07: 1
- G06: 1

## Unmapped span shapes (capitalized words N, numbers #)

-  20 · #
-  13 · born N # #
-   7 · # #
-   6 · week #
-   5 · 
-   5 · born # N #
-   5 · but
-   4 · # N # # N #
-   4 · however
-   3 · between # and #
-   3 · both
-   3 · of # #
-   3 · as
-   3 · another
-   3 · who is the sister of N
-   2 · directed by N N
-   2 · former
-   2 · august # # N # #
-   2 · u N
-   2 · between N and N N
-   2 · only
-   2 · november # # N # #
-   2 · southern
-   2 · very
-   2 · earlier
-   2 · who
-   2 · nba
-   2 · while
-   2 · again
-   2 · coming off their win over the N
-   2 · their N N
-   2 · stayed at home for a N # duel with the N N
-   2 · finally
-   2 · top
-   2 · more
-   2 · so
-   2 · because it is her birthday
-   2 · his name is N
-   2 · you think of everything don't you
-   1 · of domestic policy

## Templates fired

- named-entity: 1316
- witness: 445
- copular: 292
- mention: 284
- coref: 281
- activity: 222
- postmodifier: 141
- stative-relation: 138
- oblique: 138
- group: 136
- motion: 130
- time: 89
- locative: 81
- location: 66
- distribution: 51
- time-relation: 51
- change-of-state: 49
- attitude: 48
- part-whole: 45
- superlative: 36
- purpose: 35
- adjunct: 33
- creation: 26
- acquisition: 23
- link: 20
- psych: 20
- manner: 16
- focus: 15
- communication: 15
- negation: 13
- adjective-complement: 12
- range: 12
- measure: 11
- generic: 9
- class-statement: 8
- portion: 8
- habitual: 8
- imperative: 8
- perception: 8
- transfer: 7
- frequency: 7
- degree: 6
- modal: 6
- possession: 5
- causative: 5
- hedge: 4
- control: 4
- norm: 4
- extent: 4
- sensation: 2
- aspectual: 1
- comparative: 1
- evidential: 1

## Validator lints

- dangling-referent: 13
- type: 5
- bare-predication: 1

## Parser issue reports

- hotpotqa-validation-FinallyCeCePenis-001: {"code": "P00", "where": "named-entity", "text": "The named-entity template has no slots for possessors or adjectival/noun modifiers attached to the class appositive in 'her debut single \"Finally\"'. · Prior to the release of this album, Peniston released her debut single "Finally", which topped the US "Billboard" Hot Da
- hotpotqa-validation-DioncielArmstron-001: {"code": "P00", "where": "copular / stative-relation", "text": "It is ambiguous whether a definite role title with an of-complement ('the president and CEO of X') is an unmapped definite copular ident · He is currently the president and CEO of Mind Vision Productions.
- hotpotqa-validation-VirginAtlantic-003: {"code": "P00", "where": "time", "text": "The instructions allow a time to be predicated of an eventive witness with 'be', but do not explicitly specify how to handle 'take place' or 'occur' with an e · The maiden flight from London Gatwick to Newark Liberty International Airport took place on 22 June 1984.
- hotpotqa-validation-TheShard-002: {"code": "P00", "where": "superlative", "text": "The superlative template does not specify how to encode additional adjectival modifiers (like 'free-standing') or domain locations (like 'in the United · It is also the second-tallest free-standing structure in the United Kingdom, after the concrete tower at the Emley Moor 
- hotpotqa-validation-TheSimpleThings-002: {"code": "P00", "where": "group", "text": "No template covers a colon-introduced appositive list enumerating the named members of a plural group."} · Following this short, one-shot Mickey shorts were produced: the featurettes "Mickey's Christmas Carol" (1983) and "The P
- drop-dev-history1212-000: {"code": "P00", "where": "time", "text": "The time template does not specify whether BCE/BC years should be encoded as negative integers in the year slot or reported as unmapped."} · In 326 BCE, Alexander the Great invaded Pauravas and defeated King Porus.
- drop-dev-history3244-000: {"code": "P00", "where": "group", "text": "The group template has no slot for an approximation hedge on an exact count ('approximately 14,086 total jobs'), unlike the measure template."} · The commune of Aix-les-Bains had approximately 14,086 total jobs (employee + self-employed) in 1999, including 1,039 sal
- drop-dev-history2090-000: {"code": "P00", "where": "Unmapped spans", "text": "The instruction not to introduce a witness for something stated only in words reported as unmapped does not say whether a group phrase inside an unm · Consequences of obesity Obesity causes several chronic diseases including heart disease and diabetes.
- drop-dev-history724-000: {"code": "P00", "where": "aspectual", "text": "Intransitive 'continue' with an event noun subject ('Fighting continued') is excluded from aspectual, while change-of-state only explicitly lists 'begin, · Fighting continued throughout the winter between the KDP and PUK.
- drop-dev-history1167-000: {"code": "P00", "where": "link", "text": "Causal 'as' is mentioned in the time-relation boundary notes as belonging to the link template, but 'As' is not in the link template's allowed head enum."} · Over the next year, however, the Polish forces were subject to attrition, as the Sejm again refused to raise taxes and p
- wikitext-103-validation-Homarusgammarus1-000: {"code": "P00", "where": "range", "text": "The range template has no props slot for an adjectival modifier on a generic subject ('Adult H. gammarus'), requiring it to be encoded as a condition on the  · Adult H. gammarus live on the continental shelf at depths of 0 – 150 metres (0 – 492 ft), although not normally deeper t
- wikitext-103-validation-AirRhodesiaFligh-000: {"code": "P00", "where": "link", "text": "Causal 'as' has no own head in the link template's head enum, though the time-relation boundary notes a causal 'as' is a link."} · Historians Paul Moorcraft and Peter McLaughlin write that this exaggerated considerably the actual number of guerrillas 
- openwebtext-slice-514-000: {"code": "P00", "where": "witness", "text": "The instructions say an existential 'there is / there are' is the referent alone with no predication instance, which leaves no event id for a temporal clau · When the Charlotte Hornets selected Malik Monk with the 11th overall pick in the 2017 NBA draft, there were some undoubt
- openwebtext-slice-470-000: {"code": "P00", "where": "perception", "text": "The template requires stimulus or event for 'listen', leaving no clear way to encode an intransitive imperative 'LISTEN'."} · LISTEN: Your browser does not support the audio element.
- openwebtext-slice-531-000: {"code": "P00", "where": "Identifiers and fillers", "text": "The instructions give no guidance on a pronoun ('them') whose antecedent ('strawberries') is a bare plural class-level filler with no refer · I absolutely love strawberries and cook with them frequently.
- openwebtext-slice-767-000: {"code": "P00", "where": "superlative", "text": "The superlative template handles plain ordinals on a class ('the third ferret') or ordinals on a superlative adjective ('the n-th ADJ-est N'), but does · Eric Fanning (waving) is the first openly gay Secretary of the Army in US history.
- openwebtext-slice-976-000: {"code": "P00", "where": "postmodifier", "text": "The postmodifier template specifies that the noun slot takes a witness or named-entity instance, leaving no explicit rule for a prepositional phrase r · Partisans of the Left compulsively claim President George W. Bush was an imbecile who couldn’t be trusted on anything.
- openwebtext-slice-751-000: {"code": "P00", "where": "named-entity", "text": "The named-entity template takes a class from an appositive phrase, but has no props slot for adjectival or nominal modifiers inside that appositive."} · A source at PDVSA, the Venezuelan state oil company, has played down speculation about Pastor Maldonado's immediate futu
- clutrr-gen_train23_test2to10.test-3d7fcd1f99e94515-000: {"code": "P00", "where": "stative-relation", "text": "The instructions do not specify whether a possessed relational noun in apposition ('her son Freddie') should be encoded using 'stative-relation'." · Judy and her son Freddie went out to lunch together yesterday.
- clutrr-gen_train23_test2to10.test-3d7fcd1f99e94515-001: {"code": "P00", "where": "stative-relation", "text": "The instructions do not specify whether an appositive kinship phrase ('his father Timothy') should be encoded as a stative-relation or as a posses · Joseph played golf with his father Timothy and his son Freddie.
- clutrr-gen_train23_test2to10.test-3d7fcd1f99e94515-002: {"code": "P00", "where": "negation", "text": "The auxiliary 'would' in 'would n't let' expresses past refusal rather than epistemic/capability modality or a counterfactual, and no instruction specifie · Timothy would n't let his son Joseph go to the park by himself.
- clutrr-gen_train23_test2to10.test-3d7fcd1f99e94515-003: {"code": "P01", "where": "attitude / control", "text": "The verb 'offer' with a to-infinitive could be parsed as a non-factive attitude (like promise, agree) or as a control verb with implication 'non · Joseph's brother Kenneth offered to go with him.
- clutrr-gen_train23_test2to10.test-3d7fcd1f99e94515-004: {"code": "P00", "where": "adjunct", "text": "The benefactive double-object construction ('bought him a watch') has no preposition, but `adjunct` requires `preposition`."} · Kenneth's wife Michele bought him a watch Michele invited her daughter Jami to lunch.
- clutrr-gen_train23_test2to10.test-3d7fcd1f99e94515-004: {"code": "P00", "where": "stative-relation", "text": "The appositive possessed kinship construction ('Kenneth's wife Michele') is not explicitly listed in `stative-relation` forms or `named-entity` cl · Kenneth's wife Michele bought him a watch Michele invited her daughter Jami to lunch.
- clutrr-gen_train23_test2to10.test-7076b76bc46e47c1-003: {"code": "P00", "where": "stative-relation", "text": "The instructions do not specify how to encode a possessed relational noun used as a pre-nominal appositive modifier on a proper name ('her mother' · Kimberley was always arguing with her mother's husband Richard.
- clutrr-gen_train23_test2to10.test-7076b76bc46e47c1-003: {"code": "P01", "where": "adjunct", "text": "Both 'adjunct' (CoAgent) and 'oblique' (With) could apply to 'with Richard' on 'arguing', as arguing with someone is a reciprocal activity."} · Kimberley was always arguing with her mother's husband Richard.
- clutrr-gen_train23_test2to10.test-365c381f7b5045a3-000: {"code": "P00", "where": "stative-relation", "text": "The template does not explicitly state whether possessive relational nouns in appositive or title constructions ('his father Alan', 'Valerie's son · Clarence bought to dress for his father Alan Valerie's son Clarence made a crayon drawing for Molly, Valerie's mother.
- clutrr-gen_train23_test2to10.test-0dbffc28728e4cab-002: {"code": "P00", "where": "stative-relation", "text": "The instructions cover 'is Y's cousin' as a copular stative-relation and 'Lamine, a glazier' as a named-entity class appositive, but do not specif · Dorothy asked her daughter, Helen, if she would like to go to a movie with her on Saturday night.
- clutrr-gen_train23_test2to10.test-0dbffc28728e4cab-003: {"code": "P00", "where": "named-entity", "text": "A possessed relational title or appositive on a proper name ('her daughter Joanne') is not explicitly specified between named-entity.class and stative · Helen invited her daughter Joanne to lunch.
- clutrr-gen_train23_test2to10.test-2c12736a210e4b5b-001: {"code": "P00", "where": "stative-relation", "text": "No instructions are provided for encoding a relational noun in apposition with a proper name ('their mother, Dana') or for resolving a plural pron · Joseph and William were both still very upset with their mother, Dana.
- clutrr-gen_train23_test2to10.test-d615af46b56948c8-000: {"code": "P00", "where": "stative-relation", "text": "The instructions explain how to encode a possessed relational noun in copular position ('is Lamine's cousin'), but do not specify whether an appos · Michelle asked her brother, Elliott, if he could pick up her daughter, Reta, from school.
- clutrr-gen_train23_test2to10.test-d615af46b56948c8-001: {"code": "P00", "where": "stative-relation", "text": "The template covers relational nouns in copular clauses ('X is Y's cousin'), but does not explicitly state how to encode appositive possessed kins · Reta made a cake for her grandfather, Stanley.
- clutrr-gen_train23_test2to10.test-4e0867d67e09415f-000: {"code": "P00", "where": "stative-relation", "text": "The template covers relational nouns with a possessor in copular clauses ('is Lamine's cousin'), but does not explicitly state whether an appositi · Tommy went fishing with his daughter Judy.
- clutrr-gen_train23_test2to10.test-4e0867d67e09415f-002: {"code": "P00", "where": "stative-relation", "text": "The stative-relation template specifies 'be' with a relational noun ('X is Y's cousin'), but does not explicitly mention non-copular appositives l · Maxine and her son, Philip, went to the park to fly a kite.
- clutrr-gen_train23_test2to10.test-4e0867d67e09415f-006: {"code": "P00", "where": "stative-relation", "text": "The instructions do not specify how to encode a possessed relational noun in apposition to a proper name (e.g., 'her brother, Reynaldo')."} · Judy passed it along to her brother, Reynaldo.
- clutrr-gen_train23_test2to10.test-8586a1c067f54154-001: {"code": "P00", "where": "stative-relation", "text": "The instructions cover copular kinship predicates ('X is Y's cousin') and appositive classes on named-entity ('Lamine, a glazier'), but do not exp · Frank drove his daughter Julia to soccer practice.
- clutrr-gen_train23_test2to10.test-04a47cf367e540a5-005: {"code": "P00", "where": "stative-relation", "text": "No instruction specifies how to encode a possessed relational noun in apposition to a proper name ('her son Richard')."} · Jamie always goes to the park with her son Richard on Saturdays.
- clutrr-gen_train23_test2to10.test-04a47cf367e540a5-006: {"code": "P00", "where": "stative-relation", "text": "The instructions do not specify whether an appositive possessed relational noun ('her brother Roger') uses stative-relation or named-entity class, · Faye and her brother Roger went to the park to feed the ducks.
- clutrr-gen_train23_test2to10.test-4143c114243e43c5-000: {"code": "P00", "where": "stative-relation", "text": "The instructions do not specify whether an appositive relational noun phrase like 'his son Kent' is covered by stative-relation or by the class sl · James took his son Kent and his daughter Florence out for pizza.
- clutrr-gen_train23_test2to10.test-4143c114243e43c5-004: {"code": "P00", "where": "stative-relation", "text": "The instructions cover copular kinship relations ('is Lamine's cousin'), but do not explicitly specify how to encode a possessed kinship noun in a · Sharon loves her son Rick very much.

## Examples of unmapped sentences, by source

- hotpotqa.validation: Khrushchev was responsible for the de-Stalinization of the Soviet Union, for backing the progress of the early Soviet space program, and for several relatively  → G00 «of domestic policy»
- hotpotqa.validation: Get a Clue is a 2002 Disney Channel Original Movie starring Lindsay Lohan as Lexy Gold, a teenage high school student who investigates a mystery after one of he → G00 «2002»; G00 «starring Lindsay Lohan as Lexy Gold»; G00 «who investigates a mystery after one of her teachers goes missing»
- hotpotqa.validation: The school serves approximately 2200 students, making it the largest public high school in New Hampshire, and the second largest high school overall, after the  → G00 «The school serves approximately 2200 students»; G00 «making»; G00 «overall, after the private Pinkerton Academy»
- drop.dev/history: On 7-8 October at the Battle of Slobodyshche 14,000-15,000 Poles and 5,000-6,000 Tatars defeated the Cossacks under Yurii Khmelnytsky, who was trying to link up → G00 «On 7-8 October»; G00 «14,000-15,000»; G00 «5,000-6,000»; G00 «under Yurii Khmelnytsky»; G00 «who was trying to link up with Sheremetev»
- drop.dev/history: As the first part of a 10-year Road Sector Development Program, between 1997 and 2002 the Ethiopian government began a sustained effort to improve its infrastru → G00 «As the first part of a 10-year Road Sector Development Program»; G00 «between 1997 and 2002»; G00 «to improve its infrastructure of roads»
- drop.dev/history: The U.S. Marine Corps issued a request for proposals (RFP) in 2013 for its Humvee sustainment modification initiative to upgrade 6,700 expanded capacity vehicle → G03 «(RFP)»; G00 «Humvee sustainment modification»; G00 «capacity»; G03 «(ECVs)»
- drop.dev/nfl: The return of Rob Gronkowski, and a late-game interception resulted in the Patriots defeating the Steelers. → G00 «The return of Rob Gronkowski, and a late-game interception resulted in»
- drop.dev/nfl: Coming off their win over the Lions, the Jets flew to Cleveland Browns Stadium for a Week 10 duel with the Cleveland Browns. → G00 «Coming off their win over the Lions»; G00 «Week 10»
- drop.dev/nfl: Coming off their win over the Vikings, the Dolphins went home, donned their alternate uniforms, and played their Week 3 home-opener against their AFC East foe,  → G00 «Coming off their win over the Vikings»; G00 «Week 3»; G00 «their AFC East»
- wikitext-103.validation: Temple 33 was a funerary pyramid erected over the tomb of Siyaj Chan K 'awiil I (known as Burial 48) in the North Acropolis. → G00 «erected over the tomb of Siyaj Chan K 'awiil I (known as Burial 48) in the North Acropolis»
- wikitext-103.validation: Tikal may have benefited from the collapse of the large Preclassic states such as El Mirador. → G00 «such as El Mirador»
- wikitext-103.validation: The episode features guest appearances by the members of the band Kiss — Peter Criss, Ace Frehley, Gene Simmons and Paul Stanley — who each portray both themsel → G00 «— Peter Criss, Ace Frehley, Gene Simmons and Paul Stanley —»; G00 «who each portray both themselves and a small cameo role»
- openwebtext.slice: The Texas lieutenant governor said on Monday he has enlisted Christian pastors statewide to help him win approval for legislation heading to a sate Senate commi → G02 «statewide»; G00 «heading to a sate Senate committee this week»; G00 «that limits access to public restroom access for transgender people»
- openwebtext.slice: As the film Philomena heads into awards season, draped with nominations for Oscars and Baftas, you might think nuns are having a bad PR moment. → G00 «As the film Philomena heads into awards season, draped with nominations for Oscars and Baftas, you might think nuns are having a bad PR moment.»
- openwebtext.slice: Three prostitution cases have been thrown out this month by Hennepin County judges and the Minneapolis city attorney, who said Minneapolis undercover police inv → G00 «who said Minneapolis undercover police investigators went too far»
- clutrr.gen_train23_test2to10.test: Judy and her son Freddie went out to lunch together yesterday. → G00 «Judy and her son Freddie went out to lunch together yesterday.»
- clutrr.gen_train23_test2to10.test: Anne, who is the sister of Kelley, is a lovely girl. → G00 «who is the sister of Kelley»
- clutrr.gen_train23_test2to10.test: Clarence bought to dress for his father Alan Valerie's son Clarence made a crayon drawing for Molly, Valerie's mother. → G00 «Clarence bought to dress for his father Alan»
- lambada.test: To the west, a large white dome protrudes from the ice, the remnants of the once lush island of Lanai. → G00 «To the west, a large white dome protrudes from the ice»; G00 «the remnants of the once lush island of Lanai»
- lambada.test: And the rest of the story is: We love and we feel and we try and we hope. → G05 «And»; G00 «the rest of the story is: We love and we feel and we try and we hope»
- lambada.test: But how would she ever pull it off? → G05 «But»; G00 «how would she ever pull it off?»
- pg19.validation: When, in March, 1832, the first volume of the now famous _Contes Drolatiques_ was published by Gosselin of Paris, Balzac, in a short preface, written in the pub → G02 «now»; G00 «written in the publisher's name»; G00 «which he anticipated certain critics would make upon his hardy experiment»
- pg19.validation: I wish to speak a word for Nature, for absolute freedom and wildness, as contrasted with a freedom and culture merely civil--to regard man as an inhabitant, or  → G00 «as contrasted with a freedom and culture merely civil»; G00 «to regard man as an inhabitant, or a part and parcel of Nature, rather than a member of society»
- pg19.validation: In our methodical New England life, we still recognize some magic in summer. → G00 «In our methodical New England life, we still recognize some magic in summer»

usage: input 55,585,441 (cached 49,046,352), output 242,250
