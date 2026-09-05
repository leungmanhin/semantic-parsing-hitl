;; FUSE-NF §4.3.2 Role-Filler Distribution Clustering — FAITHFUL arm — readable MeTTa
;; RENDERING (never loaded: a slot is a conjunctive query over variables, not an assertion).
;; embeddings /home/manhin/Dev/semantic-parsing-hitl/fusenf/mining/out_h/embeddings (3399 texts, dim 4096); average-linkage clustering on cosine
;; distance cut at cluster cosine [0.8, 0.85, 0.9, 0.95, 1.0]; texts word, subtree; distributions = raw mass over clusters.
;; A slot renders as (And (Member $e0 <class>) (<Head> $e0 $x1)) — $x1 stands for any filler; the
;; slot's distribution follows in comments: cluster id, mass, member texts. A pooled head renders
;; as (<Head> $e $x). A signal = two slot queries under a comment with cosine, JSD, shared clusters
;; and witness records. rolefiller2_slotdist_*.jsonl / rolefiller2_signals_*.jsonl are the record.

;; ==================== word @ cluster cos 0.80: pooled role level (136 head pairs) ====================

;; Agent ~ Experiencer  cosine 0.69  JSD 0.584  n 888 / 261  shared: {person, people} {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing}
(Agent $e $x)
(Experiencer $e $x)

;; Patient ~ Theme  cosine 0.52  JSD 0.683  n 455 / 594  shared: {thing, things, stuff, practice, thing} {person, people} {movie, film}
(Patient $e $x)
(Theme $e $x)

;; Experiencer ~ Patient  cosine 0.47  JSD 0.625  n 261 / 455  shared: {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
(Experiencer $e $x)
(Patient $e $x)

;; Agent ~ Patient  cosine 0.47  JSD 0.705  n 888 / 455  shared: {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
(Agent $e $x)
(Patient $e $x)

;; Agent ~ Theme  cosine 0.43  JSD 0.71  n 888 / 594  shared: {person, people} {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …}
(Agent $e $x)
(Theme $e $x)

;; Experiencer ~ Theme  cosine 0.42  JSD 0.711  n 261 / 594  shared: {thing, things, stuff, practice, thing} {person, people} {Gustavo, Alberto, Martino, Pietro, …}
(Experiencer $e $x)
(Theme $e $x)

;; Agent ~ Recipient  cosine 0.38  JSD 0.761  n 888 / 29  shared: {person, people} {Jessica, Linda, Beth, Katherine, …} {company, corporation}
(Agent $e $x)
(Recipient $e $x)

;; Stimulus ~ Theme  cosine 0.38  JSD 0.853  n 34 / 594  shared: {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …} {food, eat}
(Stimulus $e $x)
(Theme $e $x)

;; Experiencer ~ Holder  cosine 0.36  JSD 0.716  n 261 / 48  shared: {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Boris, Ivan, Oleg, Fyodor, …}
(Experiencer $e $x)
(Holder $e $x)

;; Experiencer ~ Recipient  cosine 0.27  JSD 0.823  n 261 / 29  shared: {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
(Experiencer $e $x)
(Recipient $e $x)

;; Holder ~ Theme  cosine 0.27  JSD 0.818  n 48 / 594  shared: {thing, things, stuff, practice, thing} {Boldi, Bruno, Felix, Maurice, …} {house, home, comfortable, house, houses, …}
(Holder $e $x)
(Theme $e $x)

;; Agent ~ Holder  cosine 0.26  JSD 0.779  n 888 / 48  shared: {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Jonas, Roger, Bob, Ralph, …}
(Agent $e $x)
(Holder $e $x)

;; Patient ~ Stimulus  cosine 0.24  JSD 0.913  n 455 / 34  shared: {thing, things, stuff, practice, thing} {child, children, kid, baby, …} {knock, kick, kick out}
(Patient $e $x)
(Stimulus $e $x)

;; Holder ~ Patient  cosine 0.24  JSD 0.806  n 48 / 455  shared: {thing, things, stuff, practice, thing} {movie, film} {room, changing room, rooms}
(Holder $e $x)
(Patient $e $x)

;; Goal ~ Location  cosine 0.24  JSD 0.797  n 93 / 210  shared: {Germany, Denmark, Norway, Sweden} {house, home, comfortable, house, houses, …} {city, town, cities, town, unknown, …}
(Goal $e $x)
(Location $e $x)

;; Location ~ Source  cosine 0.20  JSD 0.829  n 210 / 47  shared: {here, host} {city, town, cities, town, unknown, …} {Santiago, Manila, Havana}
(Location $e $x)
(Source $e $x)

;; Experiencer ~ Stimulus  cosine 0.19  JSD 0.883  n 261 / 34  shared: {thing, things, stuff, practice, thing} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
(Experiencer $e $x)
(Stimulus $e $x)

;; Agent ~ Stimulus  cosine 0.18  JSD 0.886  n 888 / 34  shared: {Jessica, Linda, Beth, Katherine, …} {thing, things, stuff, practice, thing} {child, children, kid, baby, …}
(Agent $e $x)
(Stimulus $e $x)

;; Patient ~ Recipient  cosine 0.17  JSD 0.908  n 455 / 29  shared: {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
(Patient $e $x)
(Recipient $e $x)

;; Manner ~ Result  cosine 0.16  JSD 0.883  n 115 / 43  shared: {use, well, direct, do, …} {together, come together} {former, back, early, backward, …}
(Manner $e $x)
(Result $e $x)

;; Goal ~ Source  cosine 0.16  JSD 0.852  n 93 / 47  shared: {city, town, cities, town, unknown, …} {here, host} {school, university, campus, college, …}
(Goal $e $x)
(Source $e $x)

;; Recipient ~ Theme  cosine 0.15  JSD 0.906  n 29 / 594  shared: {person, people} {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
(Recipient $e $x)
(Theme $e $x)

;; Theme ~ To  cosine 0.15  JSD 0.881  n 594 / 46  shared: {thing, things, stuff, practice, thing} {talk, conversation, discussion} {music}
(Theme $e $x)
(To $e $x)

;; Experiencer ~ Result  cosine 0.15  JSD 0.806  n 261 / 43  shared: {bad, bad, relationship, bad, matter, bad, problem} {black, blue, white, brown, …} {use, well, direct, do, …}
(Experiencer $e $x)
(Result $e $x)

;; Holder ~ Stimulus  cosine 0.15  JSD 0.892  n 48 / 34  shared: {thing, things, stuff, practice, thing} {author, writer, novelist} {food, eat}
(Holder $e $x)
(Stimulus $e $x)

;; Goal ~ Theme  cosine 0.13  JSD 0.888  n 93 / 594  shared: {house, home, comfortable, house, houses, …} {Jessica, Linda, Beth, Katherine, …} {Baltimore, Boston, San Francisco, Springfield}
(Goal $e $x)
(Theme $e $x)

;; Patient ~ Result  cosine 0.12  JSD 0.863  n 455 / 43  shared: {bad, bad, relationship, bad, matter, bad, problem} {black, blue, white, brown, …} {snow, cold, frost, snowstorm, …}
(Patient $e $x)
(Result $e $x)

;; Patient ~ Source  cosine 0.12  JSD 0.895  n 455 / 47  shared: {tree, trees, treetop} {room, changing room, rooms} {road, way, lane, motorway, …}
(Patient $e $x)
(Source $e $x)

;; Goal ~ Holder  cosine 0.12  JSD 0.891  n 93 / 48  shared: {house, home, comfortable, house, houses, …} {city, town, cities, town, unknown, …} {place, places, easy, place, full, place}
(Goal $e $x)
(Holder $e $x)

;; Holder ~ Source  cosine 0.12  JSD 0.89  n 48 / 47  shared: {city, town, cities, town, unknown, …} {room, changing room, rooms} {place, places, easy, place, full, place}
(Holder $e $x)
(Source $e $x)

;; Goal ~ Patient  cosine 0.11  JSD 0.864  n 93 / 455  shared: {tree, trees, treetop} {house, home, comfortable, house, houses, …} {room, changing room, rooms}
(Goal $e $x)
(Patient $e $x)

;; For ~ Theme  cosine 0.11  JSD 0.917  n 39 / 594  shared: {work, job, work through, hard, work} {portray, portrait, portrayal} {ship, british ship, israeli military ship, merchant ship, …}
(For $e $x)
(Theme $e $x)

;; Experiencer ~ Goal  cosine 0.10  JSD 0.869  n 261 / 93  shared: {house, home, comfortable, house, houses, …} {Jessica, Linda, Beth, Katherine, …} {Algeria, Afghanistan, Iran, Morocco, …}
(Experiencer $e $x)
(Goal $e $x)

;; Recipient ~ Stimulus  cosine 0.10  JSD 0.913  n 29 / 34  shared: {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
(Recipient $e $x)
(Stimulus $e $x)

;; Goal ~ Recipient  cosine 0.10  JSD 0.907  n 93 / 29  shared: {Jessica, Linda, Beth, Katherine, …} {city, town, cities, town, unknown, …} {class, classroom}
(Goal $e $x)
(Recipient $e $x)

;; Goal ~ Result  cosine 0.10  JSD 0.887  n 93 / 43  shared: {sleep, bed} {use, well, direct, do, …} {snow, cold, frost, snowstorm, …}
(Goal $e $x)
(Result $e $x)

;; Source ~ Theme  cosine 0.09  JSD 0.9  n 47 / 594  shared: {view, views, common, view, public, view, …} {food, eat} {room, changing room, rooms}
(Source $e $x)
(Theme $e $x)

;; Patient ~ To  cosine 0.09  JSD 0.931  n 455 / 46  shared: {thing, things, stuff, practice, thing} {computer, machine} {bake, bakery, bread}
(Patient $e $x)
(To $e $x)

;; Holder ~ Location  cosine 0.09  JSD 0.908  n 48 / 210  shared: {city, town, cities, town, unknown, …} {house, home, comfortable, house, houses, …} {place, places, easy, place, full, place}
(Holder $e $x)
(Location $e $x)

;; Stimulus ~ To  cosine 0.09  JSD 0.907  n 34 / 46  shared: {thing, things, stuff, practice, thing} {practice} {action, activity, active, act, …}
(Stimulus $e $x)
(To $e $x)

;; Location ~ Patient  cosine 0.08  JSD 0.877  n 210 / 455  shared: {door, back door, door, open, door, unlocked, …} {table} {hotel}
(Location $e $x)
(Patient $e $x)

;; Agent ~ Goal  cosine 0.07  JSD 0.907  n 888 / 93  shared: {Jessica, Linda, Beth, Katherine, …} {house, home, comfortable, house, houses, …} {sleep, bed}
(Agent $e $x)
(Goal $e $x)

;; Experiencer ~ Location  cosine 0.07  JSD 0.877  n 261 / 210  shared: {Europe, Western Europe} {Kazakhstan, North Korea} {house, home, comfortable, house, houses, …}
(Experiencer $e $x)
(Location $e $x)

;; Recipient ~ Source  cosine 0.07  JSD 0.913  n 29 / 47  shared: {city, town, cities, town, unknown, …} {local, local level, locals} {company, corporation}
(Recipient $e $x)
(Source $e $x)

;; Experiencer ~ Manner  cosine 0.06  JSD 0.926  n 261 / 115  shared: {use, well, direct, do, …} {late, later, let, last, …} {truth, fact, true, really, …}
(Experiencer $e $x)
(Manner $e $x)

;; Location ~ Theme  cosine 0.06  JSD 0.898  n 210 / 594  shared: {house, home, comfortable, house, houses, …} {city, town, cities, town, unknown, …} {station, Springfield Station}
(Location $e $x)
(Theme $e $x)

;; Goal ~ Manner  cosine 0.06  JSD 0.95  n 93 / 115  shared: {use, well, direct, do, …} {former, back, early, backward, …} {happiness, happy, happily, joy}
(Goal $e $x)
(Manner $e $x)

;; Manner ~ Theme  cosine 0.05  JSD 0.947  n 115 / 594  shared: {use, well, direct, do, …} {whole, full, entire, fully, …} {truth, fact, true, really, …}
(Manner $e $x)
(Theme $e $x)

;; Agent ~ To  cosine 0.05  JSD 0.937  n 888 / 46  shared: {thing, things, stuff, practice, thing} {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb} {doctor, doctors}
(Agent $e $x)
(To $e $x)

;; Experiencer ~ To  cosine 0.05  JSD 0.944  n 261 / 46  shared: {thing, things, stuff, practice, thing} {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb} {doctor, doctors}
(Experiencer $e $x)
(To $e $x)

;; For ~ Goal  cosine 0.05  JSD 0.951  n 39 / 93  shared: {sleep, bed} {happiness, happy, happily, joy}
(For $e $x)
(Goal $e $x)

;; Result ~ Theme  cosine 0.05  JSD 0.943  n 43 / 594  shared: {black, blue, white, brown, …} {use, well, direct, do, …} {sleep, bed}
(Result $e $x)
(Theme $e $x)

;; Instrument ~ Source  cosine 0.05  JSD 0.938  n 34 / 47  shared: {road, way, lane, motorway, …} {food, eat} {big, large, huge, massive, …}
(Instrument $e $x)
(Source $e $x)

;; Holder ~ To  cosine 0.05  JSD 0.942  n 48 / 46  shared: {thing, things, stuff, practice, thing} {repeat, repetition}
(Holder $e $x)
(To $e $x)

;; Experiencer ~ Source  cosine 0.05  JSD 0.925  n 261 / 47  shared: {place, places, easy, place, full, place} {road, way, lane, motorway, …} {room, changing room, rooms}
(Experiencer $e $x)
(Source $e $x)

;; Instrument ~ Patient  cosine 0.04  JSD 0.939  n 34 / 455  shared: {snow, cold, frost, snowstorm, …} {road, way, lane, motorway, …} {ticket, issue, bug, tickets}
(Instrument $e $x)
(Patient $e $x)

;; Location ~ Recipient  cosine 0.04  JSD 0.946  n 210 / 29  shared: {city, town, cities, town, unknown, …} {local, local level, locals} {little, small, low, thin, …}
(Location $e $x)
(Recipient $e $x)

;; Agent ~ Source  cosine 0.04  JSD 0.939  n 888 / 47  shared: {company, corporation} {Santiago, Manila, Havana} {plane, flight, aeroplane, airplane, …}
(Agent $e $x)
(Source $e $x)

;; Instrument ~ Result  cosine 0.04  JSD 0.937  n 34 / 43  shared: {red, rag, rip, rough, …} {snow, cold, frost, snowstorm, …} {big, large, huge, massive, …}
(Instrument $e $x)
(Result $e $x)

;; Manner ~ Patient  cosine 0.04  JSD 0.966  n 115 / 455  shared: {use, well, direct, do, …} {whole, full, entire, fully, …} {together, come together}
(Manner $e $x)
(Patient $e $x)

;; In ~ Patient  cosine 0.04  JSD 0.948  n 50 / 455  shared: {community, society} {road, way, lane, motorway, …} {weather, bad, weather}
(In $e $x)
(Patient $e $x)

;; Instrument ~ Theme  cosine 0.04  JSD 0.955  n 34 / 594  shared: {food, eat} {drum, snare, drums} {new, brand new, language, new, new, product}
(Instrument $e $x)
(Theme $e $x)

;; Manner ~ Time  cosine 0.04  JSD 0.904  n 115 / 107  shared: {late, later, let, last, …} {immediately, instantly, next instant, right away} {former, back, early, backward, …}
(Manner $e $x)
(Time $e $x)

;; Experiencer ~ In  cosine 0.04  JSD 0.948  n 261 / 50  shared: {weather, bad, weather} {action, activity, active, act, …} {road, way, lane, motorway, …}
(Experiencer $e $x)
(In $e $x)

;; Instrument ~ Stimulus  cosine 0.04  JSD 0.95  n 34 / 34  shared: {food, eat} {accident, crash}
(Instrument $e $x)
(Stimulus $e $x)

;; Location ~ Manner  cosine 0.04  JSD 0.957  n 210 / 115  shared: {use, well, direct, do, …} {world, international, global, internationally} {former, back, early, backward, …}
(Location $e $x)
(Manner $e $x)

;; Holder ~ Recipient  cosine 0.04  JSD 0.962  n 48 / 29  shared: {city, town, cities, town, unknown, …}
(Holder $e $x)
(Recipient $e $x)

;; Experiencer ~ Time  cosine 0.04  JSD 0.956  n 261 / 107  shared: {now, today, this year, current, …} {night, tonight, night shift, midnight, …} {late, later, let, last, …}
(Experiencer $e $x)
(Time $e $x)

;; In ~ Theme  cosine 0.04  JSD 0.961  n 50 / 594  shared: {language, english} {understand, misunderstand} {truth, fact, true, really, …}
(In $e $x)
(Theme $e $x)

;; In ~ Stimulus  cosine 0.03  JSD 0.953  n 50 / 34  shared: {action, activity, active, act, …} {poetry}
(In $e $x)
(Stimulus $e $x)

;; Experiencer ~ Instrument  cosine 0.03  JSD 0.95  n 261 / 34  shared: {train} {road, way, lane, motorway, …} {snow, cold, frost, snowstorm, …}
(Experiencer $e $x)
(Instrument $e $x)

;; For ~ Result  cosine 0.03  JSD 0.951  n 39 / 43  shared: {beautiful, beauty, gorgeous, pretty} {sleep, bed}
(For $e $x)
(Result $e $x)

;; Goal ~ Instrument  cosine 0.03  JSD 0.95  n 93 / 34  shared: {snow, cold, frost, snowstorm, …} {road, way, lane, motorway, …} {big, large, huge, massive, …}
(Goal $e $x)
(Instrument $e $x)

;; Goal ~ In  cosine 0.03  JSD 0.954  n 93 / 50  shared: {road, way, lane, motorway, …} {community, society} {field, fields}
(Goal $e $x)
(In $e $x)

;; Instrument ~ Recipient  cosine 0.03  JSD 0.952  n 34 / 29  shared: {crop, rice crop, corn, crops} {big, large, huge, massive, …}
(Instrument $e $x)
(Recipient $e $x)

;; Agent ~ Location  cosine 0.03  JSD 0.926  n 888 / 210  shared: {here, host} {Santiago, Manila, Havana} {France, French Dahomey}
(Agent $e $x)
(Location $e $x)

;; Holder ~ Result  cosine 0.03  JSD 0.976  n 48 / 43  shared: {bad, bad, relationship, bad, matter, bad, problem}
(Holder $e $x)
(Result $e $x)

;; For ~ Manner  cosine 0.03  JSD 0.945  n 39 / 115  shared: {whole, full, entire, fully, …} {around, ring, round} {happiness, happy, happily, joy}
(For $e $x)
(Manner $e $x)

;; In ~ Result  cosine 0.03  JSD 0.97  n 50 / 43  shared: {silent, silence, forest, silent}
(In $e $x)
(Result $e $x)

;; Result ~ Source  cosine 0.03  JSD 0.963  n 43 / 47  shared: {bat} {big, large, huge, massive, …}
(Result $e $x)
(Source $e $x)

;; Theme ~ Time  cosine 0.03  JSD 0.976  n 594 / 107  shared: {now, today, this year, current, …} {morning, dawn, early morning, morning light, …} {day, days, days, short, one day}
(Theme $e $x)
(Time $e $x)

;; Experiencer ~ For  cosine 0.03  JSD 0.957  n 261 / 39  shared: {word, word processor} {happiness, happy, happily, joy} {beautiful, beauty, gorgeous, pretty}
(Experiencer $e $x)
(For $e $x)

;; Goal ~ Stimulus  cosine 0.03  JSD 0.975  n 93 / 34  shared: {Jessica, Linda, Beth, Katherine, …}
(Goal $e $x)
(Stimulus $e $x)

;; In ~ Instrument  cosine 0.03  JSD 0.97  n 50 / 34  shared: {road, way, lane, motorway, …}
(In $e $x)
(Instrument $e $x)

;; Location ~ Result  cosine 0.03  JSD 0.959  n 210 / 43  shared: {use, well, direct, do, …} {big, large, huge, massive, …} {snow, cold, frost, snowstorm, …}
(Location $e $x)
(Result $e $x)

;; Agent ~ Result  cosine 0.02  JSD 0.956  n 888 / 43  shared: {indigenous, indigenous, people, native american, indigenous american, …} {crow, eagle, stork, caw} {black, blue, white, brown, …}
(Agent $e $x)
(Result $e $x)

;; Agent ~ Instrument  cosine 0.02  JSD 0.958  n 888 / 34  shared: {Mark, marker, markers} {snow, cold, frost, snowstorm, …} {train}
(Agent $e $x)
(Instrument $e $x)

;; In ~ Location  cosine 0.02  JSD 0.969  n 50 / 210  shared: {mat, mathematics} {water, water source, clear, water, good, water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; In ~ Source  cosine 0.02  JSD 0.975  n 50 / 47  shared: {road, way, lane, motorway, …}
(In $e $x)
(Source $e $x)

;; Source ~ Stimulus  cosine 0.02  JSD 0.975  n 47 / 34  shared: {food, eat}
(Source $e $x)
(Stimulus $e $x)

;; For ~ Stimulus  cosine 0.02  JSD 0.973  n 39 / 34  shared: {start, begin}
(For $e $x)
(Stimulus $e $x)

;; Agent ~ For  cosine 0.02  JSD 0.963  n 888 / 39  shared: {bus, bus ride} {cook, recipe} {ship, british ship, israeli military ship, merchant ship, …}
(Agent $e $x)
(For $e $x)

;; Holder ~ Instrument  cosine 0.02  JSD 0.975  n 48 / 34  shared: {food, eat}
(Holder $e $x)
(Instrument $e $x)

;; Location ~ To  cosine 0.02  JSD 0.978  n 210 / 46  shared: {talk, conversation, discussion} {shore, beach, coast, shoreline}
(Location $e $x)
(To $e $x)

;; For ~ Holder  cosine 0.01  JSD 0.977  n 39 / 48  shared: {word, word processor}
(For $e $x)
(Holder $e $x)

;; For ~ Patient  cosine 0.01  JSD 0.971  n 39 / 455  shared: {ship, british ship, israeli military ship, merchant ship, …} {call, telephone call, call for} {word, word processor}
(For $e $x)
(Patient $e $x)

;; In ~ Manner  cosine 0.01  JSD 0.977  n 50 / 115  shared: {truth, fact, true, really, …}
(In $e $x)
(Manner $e $x)

;; Patient ~ Time  cosine 0.01  JSD 0.97  n 455 / 107  shared: {night, tonight, night shift, midnight, …} {storm, soon, thunder} {hurricane, typhoon, hurricane season}
(Patient $e $x)
(Time $e $x)

;; For ~ In  cosine 0.01  JSD 0.977  n 39 / 50  shared: {nothing, no, almost nothing, empty, …}
(For $e $x)
(In $e $x)

;; Agent ~ Time  cosine 0.01  JSD 0.977  n 888 / 107  shared: {now, today, this year, current, …} {hurricane, typhoon, hurricane season} {storm, soon, thunder}
(Agent $e $x)
(Time $e $x)

;; Agent ~ Manner  cosine 0.01  JSD 0.984  n 888 / 115  shared: {use, well, direct, do, …} {quickly, quick, fast} {whole, full, entire, fully, …}
(Agent $e $x)
(Manner $e $x)

;; In ~ To  cosine 0.01  JSD 0.981  n 50 / 46  shared: {action, activity, active, act, …}
(In $e $x)
(To $e $x)

;; Recipient ~ Result  cosine 0.01  JSD 0.98  n 29 / 43  shared: {big, large, huge, massive, …}
(Recipient $e $x)
(Result $e $x)

;; Instrument ~ To  cosine 0.01  JSD 0.983  n 34 / 46  shared: {ticket, issue, bug, tickets}
(Instrument $e $x)
(To $e $x)

;; Result ~ Time  cosine 0.01  JSD 0.968  n 43 / 107  shared: {modern times, modern} {former, back, early, backward, …}
(Result $e $x)
(Time $e $x)

;; Agent ~ In  cosine 0.01  JSD 0.981  n 888 / 50  shared: {community, society} {context, condition, situation} {road, way, lane, motorway, …}
(Agent $e $x)
(In $e $x)

;; Instrument ~ Location  cosine 0.01  JSD 0.986  n 34 / 210  shared: {snow, cold, frost, snowstorm, …} {big, large, huge, massive, …}
(Instrument $e $x)
(Location $e $x)

;; Manner ~ Stimulus  cosine 0.01  JSD 0.985  n 115 / 34  shared: {difficult, hard, difficulty, harder}
(Manner $e $x)
(Stimulus $e $x)

;; Holder ~ In  cosine 0.01  JSD 0.986  n 48 / 50  shared: {weather, bad, weather}
(Holder $e $x)
(In $e $x)

;; Manner ~ Source  cosine 0.01  JSD 0.981  n 115 / 47  shared: {dark, darkness, dimly} {world, international, global, internationally}
(Manner $e $x)
(Source $e $x)

;; Goal ~ Time  cosine 0.00  JSD 0.986  n 93 / 107  shared: {former, back, early, backward, …}
(Goal $e $x)
(Time $e $x)

;; Location ~ Time  cosine 0.00  JSD 0.988  n 210 / 107  shared: {morning, dawn, early morning, morning light, …} {former, back, early, backward, …}
(Location $e $x)
(Time $e $x)

;; Source ~ Time  cosine 0.00  JSD 0.986  n 47 / 107  shared: {point, point out, indicate, mention}
(Source $e $x)
(Time $e $x)

;; Holder ~ Time  cosine 0.00  JSD 0.99  n 48 / 107  shared: {old, aging, ages ago, elderly}
(Holder $e $x)
(Time $e $x)

;; Instrument ~ Time  cosine 0.00  JSD 0.988  n 34 / 107  shared: {present, presented}
(Instrument $e $x)
(Time $e $x)

;; For ~ Instrument  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Instrument $e $x)

;; For ~ Location  cosine 0.00  JSD 1.0  n 39 / 210  shared: 
(For $e $x)
(Location $e $x)

;; For ~ Recipient  cosine 0.00  JSD 1.0  n 39 / 29  shared: 
(For $e $x)
(Recipient $e $x)

;; For ~ Source  cosine 0.00  JSD 1.0  n 39 / 47  shared: 
(For $e $x)
(Source $e $x)

;; For ~ Time  cosine 0.00  JSD 1.0  n 39 / 107  shared: 
(For $e $x)
(Time $e $x)

;; For ~ To  cosine 0.00  JSD 1.0  n 39 / 46  shared: 
(For $e $x)
(To $e $x)

;; Goal ~ To  cosine 0.00  JSD 1.0  n 93 / 46  shared: 
(Goal $e $x)
(To $e $x)

;; Holder ~ Manner  cosine 0.00  JSD 1.0  n 48 / 115  shared: 
(Holder $e $x)
(Manner $e $x)

;; In ~ Recipient  cosine 0.00  JSD 1.0  n 50 / 29  shared: 
(In $e $x)
(Recipient $e $x)

;; In ~ Time  cosine 0.00  JSD 1.0  n 50 / 107  shared: 
(In $e $x)
(Time $e $x)

;; Instrument ~ Manner  cosine 0.00  JSD 1.0  n 34 / 115  shared: 
(Instrument $e $x)
(Manner $e $x)

;; Location ~ Stimulus  cosine 0.00  JSD 1.0  n 210 / 34  shared: 
(Location $e $x)
(Stimulus $e $x)

;; Manner ~ Recipient  cosine 0.00  JSD 1.0  n 115 / 29  shared: 
(Manner $e $x)
(Recipient $e $x)

;; Manner ~ To  cosine 0.00  JSD 1.0  n 115 / 46  shared: 
(Manner $e $x)
(To $e $x)

;; Recipient ~ Time  cosine 0.00  JSD 1.0  n 29 / 107  shared: 
(Recipient $e $x)
(Time $e $x)

;; Recipient ~ To  cosine 0.00  JSD 1.0  n 29 / 46  shared: 
(Recipient $e $x)
(To $e $x)

;; Result ~ Stimulus  cosine 0.00  JSD 1.0  n 43 / 34  shared: 
(Result $e $x)
(Stimulus $e $x)

;; Result ~ To  cosine 0.00  JSD 1.0  n 43 / 46  shared: 
(Result $e $x)
(To $e $x)

;; Source ~ To  cosine 0.00  JSD 1.0  n 47 / 46  shared: 
(Source $e $x)
(To $e $x)

;; Stimulus ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Stimulus $e $x)
(Time $e $x)

;; Time ~ To  cosine 0.00  JSD 1.0  n 107 / 46  shared: 
(Time $e $x)
(To $e $x)

;; ==================== word @ cluster cos 0.80: slot pairs (3 event-center signals) ====================

;; [same role, different class]  accompany.Agent ~ appear.Agent  cosine 0.76  JSD 0.23  n 4 / 6  shared: {sister, sisters} {person, people}
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000050 tierC-000259
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; [same role, different class]  appear.Agent ~ replace.Agent  cosine 0.76  JSD 0.251  n 6 / 4  shared: {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;;   A e.g. tierC-000259 tierC-000260   B e.g. tierC-000359 tierC-000360
(And (Member $e0 appear) (Agent $e0 $x1))
(And (Member $e0 replace) (Agent $e0 $x1))

;; [different class and role]  die.Patient ~ sleep.Agent  cosine 0.99  JSD 0.006  n 4 / 3  shared: {person, people} {family, family business, families}
;;   A e.g. tierB-001967 tierC-000199   B e.g. tierC-000041 tierC-000042
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 sleep) (Agent $e0 $x1))

;; ==================== word @ cluster cos 0.80: compared slots with their distributions (269 slots, n >= 3) ====================

;; ---- slot <unclassed>.LocatedIn  [entity center]  n 46  clusters 40
(LocatedIn $x0 $x1)
;;     c1678  mass 3  {here, host}
;;      c157  mass 2  {city, town, cities, town, unknown, …}
;;      c159  mass 2  {southern}
;;       c27  mass 2  {Loglan, Lojban}
;;      c596  mass 2  {class, classroom}
;;      c623  mass 2  {island, Derwent Isle}
;;      c777  mass 2  {garden, beautiful, garden}
;;     c1732  mass 1.5  {whole, full, entire, fully, …}
;;     c1088  mass 1  {ceiling, black, ceiling}
;;     c1089  mass 1  {floor, wood floor}
;;     c1095  mass 1  {wall, cold, wall}
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1107  mass 1  {storehouse, storeroom}
;;     c1191  mass 1  {table}
;;     c1372  mass 1  {play}
;;      c165  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}
;;      c166  mass 1  {El Harrach, El Harrach River}
;;      c177  mass 1  {Crimea, Russian Far East, Siberia}
;;      c182  mass 1  {Colombia, Brazil, Cuba, Peru, …}
;;      c183  mass 1  {India, Indonesia}
;;      c184  mass 1  {Japan, China}
;;      c190  mass 1  {Gaul}
;;      c191  mass 1  {England, Scotland, UK}
;;      c202  mass 1  {movie, film}
;;      c282  mass 1  {market}
;;      c393  mass 1  {world, international, global, internationally}
;;      c434  mass 1  {park, parking lot, parking}
;;      c442  mass 1  {street, road, street, entire, street}
;;      c602  mass 1  {lake, Lake Towada, Dianchi Lake, Lake Akan, …}
;;      c610  mass 1  {Huancavelica}
;;      c621  mass 1  {sea, ocean, ocean, vast}
;;      c771  mass 1  {village, villager, villagers}
;;      c793  mass 1  {tree, trees, treetop}
;;      c943  mass 1  {country, backward, country}
;;      c968  mass 1  {Tatoeba}
;;     c1103  mass 0.5  {place, places, easy, place, full, place}
;;     c1144  mass 0.5  {fountain, fountain, full}
;;     c1344  mass 0.5  {red, rag, rip, rough, …}
;;      c728  mass 0.5  {kitchen, kitchen island, kitchen sink}
;;      c843  mass 0.5  {basket, bask, basket, red}

;; ---- slot have.Holder  [event center]  n 44  clusters 38
(And (Member $e0 have) (Holder $e0 $x1))
;;      c520  mass 4  {Karl, Kristoffer}
;;      c157  mass 2  {city, town, cities, town, unknown, …}
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;      c539  mass 2  {Karen, Kalman, Kerr, Ken}
;;      c563  mass 2  {homentropic current, homentropic flow}
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1101  mass 1  {castle, tower}
;;     c1103  mass 1  {place, places, easy, place, full, place}
;;     c1104  mass 1  {hotel}
;;     c1116  mass 1  {room, changing room, rooms}
;;     c1320  mass 1  {february}
;;      c164  mass 1  {mozabite, tuareg, Beja, mozabites, …}
;;      c165  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}
;;     c1752  mass 1  {decide, decision, choose, option}
;;     c1764  mass 1  {repeat, repetition}
;;      c181  mass 1  {Algeria, Afghanistan, Iran, Morocco, …}
;;      c191  mass 1  {England, Scotland, UK}
;;      c202  mass 1  {movie, film}
;;      c273  mass 1  {insurance}
;;      c372  mass 1  {book, library, books}
;;      c374  mass 1  {author, writer, novelist}
;;      c388  mass 1  {lawyer}
;;      c433  mass 1  {gas station, gas pump, gas pumps}
;;      c494  mass 1  {Wilson, wilson}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c525  mass 1  {Boldi, Bruno, Felix, Maurice, …}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c621  mass 1  {sea, ocean, ocean, vast}
;;      c753  mass 1  {food, eat}
;;      c782  mass 1  {Ivy, ivy}
;;      c809  mass 1  {creature, enemy, monster}
;;      c967  mass 1  {sentence, english sentence, sentences}
;;      c971  mass 1  {word, word processor}
;;     c1044  mass 0.5  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1157  mass 0.5  {weather, bad, weather}
;;      c217  mass 0.5  {mosque, mosque, old}
;;      c912  mass 0.5  {old, aging, ages ago, elderly}

;; ---- slot have.Theme  [event center]  n 43  clusters 58
(And (Member $e0 have) (Theme $e0 $x1))
;;      c921  mass 4  {child, children, kid, baby, …}
;;     c1664  mass 2  {representation, refer, represent, refuse, …}
;;     c1281  mass 1.333  {valuable, worth, value}
;;     c1285  mass 1  {reputation}
;;     c1334  mass 1  {day, days, days, short, one day}
;;     c1455  mass 1  {chance, fortune}
;;     c1469  mass 1  {color}
;;     c1579  mass 1  {mean, meaning, means, meanings}
;;     c1587  mass 1  {effective, affect, effect, effectively}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;     c1654  mass 1  {right}
;;     c1657  mass 1  {consider, thought, consideration, mull over, …}
;;      c212  mass 1  {cemetery, cemetery chapel, tomb, cemeteries}
;;      c433  mass 1  {gas station, gas pump, gas pumps}
;;      c459  mass 1  {guard, bodyguard, guards}
;;       c63  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;      c778  mass 1  {leaf, foliage, leaves}
;;      c830  mass 1  {antler, antlers}
;;      c833  mass 1  {herd, herds}
;;      c902  mass 1  {friend, friends, friend, good}
;;     c1733  mass 0.667  {constant, always, as always, constantly}
;;     c1734  mass 0.667  {uniform, common, usual, conventional, …}
;;      c881  mass 0.667  {entropy, constant, entropy, uniform}
;;     c1015  mass 0.5  {nasty, nasty, personality}
;;     c1028  mass 0.5  {eerie, eerie, feeling}
;;     c1029  mass 0.5  {crazy, strange, weird, weird out}
;;     c1030  mass 0.5  {dream, dream, weird}
;;     c1086  mass 0.5  {roof, conical, roof}
;;     c1122  mass 0.5  {curtain, blue, curtain, curtains}
;;     c1159  mass 0.5  {atmosphere}
;;     c1176  mass 0.5  {draw, plot}
;;     c1238  mass 0.5  {homely, atmosphere, homely}
;;     c1246  mass 0.5  {feel, feeling}
;;     c1257  mass 0.5  {intriguing}
;;     c1262  mass 0.5  {beautiful, beauty, gorgeous, pretty}
;;     c1350  mass 0.5  {star, stare}
;;     c1406  mass 0.5  {high, hefty}
;;     c1407  mass 0.5  {rich}
;;     c1468  mass 0.5  {black, blue, white, brown, …}
;;     c1649  mass 0.5  {purpose, purpose, single}
;;     c1726  mass 0.5  {alone, own, single, by itself}
;;     c1740  mass 0.5  {good, great, nice, pleasant, …}
;;      c236  mass 0.5  {history, history, rich}
;;      c272  mass 0.5  {deductible, deductible, high}
;;      c352  mass 0.5  {style}
;;      c396  mass 0.5  {internal politics, internal politics, intriguing}
;;      c576  mass 0.5  {parenthetic, parenthetic, style}
;;      c704  mass 0.5  {flavor, taste test, taste, nice, taste, …}
;;      c715  mass 0.5  {conical}
;;      c777  mass 0.5  {garden, beautiful, garden}
;;      c798  mass 0.5  {predictable, plot, predictable}
;;      c895  mass 0.5  {personality, character}
;;      c995  mass 0.5  {soul piercing, soul piercing, stare}
;;     c1394  mass 0.333  {widespread, widely, wide, attention, widespread, …}
;;     c1404  mass 0.333  {serious, severe}
;;     c1640  mass 0.333  {conclusion, consequence}
;;      c276  mass 0.333  {bank, banking industry}
;;      c973  mass 0.333  {document}

;; ---- slot <unclassed>.Possession  [entity center]  n 30  clusters 20
(Possession $x0 $x1)
;;      c385  mass 8  {Free Soil Party, Republican Party}
;;      c897  mass 5  {person, people}
;;      c256  mass 2  {subsequent game}
;;      c573  mass 2  {logic, logical phrase, logical proposition}
;;      c216  mass 1.25  {sunni community, sunni, communities, neighbouring, other, sunni, sunni communities}
;;      c123  mass 1  {Yunnan, Chongqing}
;;     c1592  mass 1  {junction, union, join, jointly}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c344  mass 1  {islamic ivory, ivory}
;;      c454  mass 1  {radical group}
;;      c481  mass 1  {God}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c633  mass 1  {Jupiter}
;;      c939  mass 1  {Twilight}
;;      c943  mass 1  {country, backward, country}
;;     c1413  mass 0.5  {general, generalization, general purpose, easy, generalization}
;;     c1636  mass 0.5  {easy, simple, soft}
;;     c1414  mass 0.25  {other}
;;      c146  mass 0.25  {next door, neighbouring}
;;      c582  mass 0.25  {community, society}

;; ---- slot use.Theme  [event center]  n 23  clusters 23
(And (Member $e0 use) (Theme $e0 $x1))
;;        c3  mass 2  {banach mackey topology}
;;        c4  mass 2  {weak arens space topology}
;;     c1116  mass 1  {room, changing room, rooms}
;;     c1136  mass 1  {fire, flame, burn, scorch, …}
;;     c1195  mass 1  {computer, machine}
;;     c1727  mass 1  {now, today, this year, current, …}
;;     c1781  mass 1  {public fund}
;;      c324  mass 1  {chemical agent}
;;      c453  mass 1  {Wagner Group, paramilitary group}
;;       c51  mass 1  {Midway}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c664  mass 1  {jingle}
;;      c675  mass 1  {auto tune, tune}
;;      c717  mass 1  {sugar}
;;       c75  mass 1  {Laravel}
;;      c958  mass 1  {metaphor}
;;      c966  mass 1  {phrase, phrases}
;;      c967  mass 1  {sentence, english sentence, sentences}
;;      c971  mass 1  {word, word processor}
;;     c1299  mass 0.5  {schedule, calendar}
;;     c1575  mass 0.5  {diverse, various}
;;       c76  mass 0.5  {naming convention, current, naming convention}
;;       c77  mass 0.5  {designation convention, current, designation convention}

;; ---- slot make.Patient  [event center]  n 20  clusters 25
(And (Member $e0 make) (Patient $e0 $x1))
;;     c1576  mass 1.5  {difference, different, distinction, distinguish, …}
;;     c1182  mass 1  {cope}
;;     c1275  mass 1  {buy, purchase}
;;     c1395  mass 1  {big, large, huge, massive, …}
;;     c1510  mass 1  {claim, appeal, claims}
;;      c181  mass 1  {Algeria, Afghanistan, Iran, Morocco, …}
;;      c364  mass 1  {paper, paper factory, paper mill, paper sheet, …}
;;      c483  mass 1  {Augustus, Appius Claudius Crassus}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;       c54  mass 1  {call, telephone call, call for}
;;      c644  mass 1  {travel}
;;      c708  mass 1  {cup, plastic cup}
;;      c746  mass 1  {chicken, chicken fried steak}
;;      c997  mass 1  {eye contact}
;;     c1044  mass 0.5  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1099  mass 0.5  {house, home, comfortable, house, houses, …}
;;     c1116  mass 0.5  {room, changing room, rooms}
;;     c1153  mass 0.5  {snowman, big, snowman}
;;     c1239  mass 0.5  {cozy, comfortable}
;;     c1262  mass 0.5  {beautiful, beauty, gorgeous, pretty}
;;     c1645  mass 0.5  {matter, mass}
;;      c654  mass 0.5  {high pitched, high pitched, noise}
;;      c666  mass 0.5  {noise, noises}
;;      c667  mass 0.5  {sound, sound wave}
;;      c668  mass 0.5  {clicking, clicking, sound}

;; ---- slot build.Patient  [event center]  n 18  clusters 11
(And (Member $e0 build) (Patient $e0 $x1))
;;     c1104  mass 4  {hotel}
;;      c364  mass 4  {paper, paper factory, paper mill, paper sheet, …}
;;     c1116  mass 3  {room, changing room, rooms}
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;     c1705  mass 2  {head, horn, hat}
;;     c1207  mass 0.5  {network}
;;     c1441  mass 0.5  {new, brand new, language, new, new, product}
;;     c1580  mass 0.5  {original, origin, originate}
;;     c1757  mass 0.5  {use, well, direct, do, …}
;;      c251  mass 0.5  {playground, new, playground}
;;       c45  mass 0.5  {turing machine, original, turing machine}

;; ---- slot make.Agent  [event center]  n 18  clusters 16
(And (Member $e0 make) (Agent $e0 $x1))
;;      c521  mass 2  {David, William, James}
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;     c1122  mass 1  {curtain, blue, curtain, curtains}
;;     c1151  mass 1  {wind, gusty, gusty, winds}
;;     c1265  mass 1  {artistic beauty}
;;     c1415  mass 1  {practical utility}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c452  mass 1  {Hezbollah, Taliban}
;;      c483  mass 1  {Augustus, Appius Claudius Crassus}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}
;;       c57  mass 1  {customer, customers}
;;      c722  mass 1  {restaurant, diner, packed, restaurant}
;;      c806  mass 1  {cat, cats}
;;      c908  mass 1  {man, guy, man, old}
;;      c919  mass 1  {boy, boys}

;; ---- slot go.Agent  [event center]  n 15  clusters 12
(And (Member $e0 go) (Agent $e0 $x1))
;;      c507  mass 4  {Jessica, Linda, Beth, Katherine, …}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c519  mass 1  {Matthew}
;;      c524  mass 1  {Donald, Harvey}
;;      c531  mass 1  {Mennad, Ziri, Lessos, Malaleel, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c538  mass 1  {Dan, Daniel}
;;      c539  mass 1  {Karen, Kalman, Kerr, Ken}
;;      c591  mass 1  {pupil, pupils}
;;      c806  mass 1  {cat, cats}
;;      c904  mass 1  {Mom, mother, grandmother, parent, …}
;;      c921  mass 1  {child, children, kid, baby, …}

;; ---- slot play.Agent  [event center]  n 15  clusters 8
(And (Member $e0 play) (Agent $e0 $x1))
;;      c462  mass 4  {Boston Red Sox, Cincinnati Reds}
;;      c921  mass 4  {child, children, kid, baby, …}
;;      c502  mass 2  {Audrey Hepburn, Audrey Heppurn}
;;      c111  mass 1  {biology}
;;      c222  mass 1  {religion, church, faith}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c919  mass 1  {boy, boys}

;; ---- slot build.Agent  [event center]  n 14  clusters 5
(And (Member $e0 build) (Agent $e0 $x1))
;;      c861  mass 8  {company, corporation}
;;      c555  mass 2  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c897  mass 2  {person, people}
;;      c164  mass 1  {mozabite, tuareg, Beja, mozabites, …}
;;      c582  mass 1  {community, society}

;; ---- slot find.Location  [event center]  n 14  clusters 10
(And (Member $e0 find) (Location $e0 $x1))
;;      c123  mass 2  {Yunnan, Chongqing}
;;     c1565  mass 2  {bench, base}
;;      c159  mass 2  {southern}
;;      c603  mass 2  {river, tributary, tributaries}
;;      c140  mass 1  {station, Springfield Station}
;;      c175  mass 1  {Europe, Western Europe}
;;      c212  mass 1  {cemetery, cemetery chapel, tomb, cemeteries}
;;      c602  mass 1  {lake, Lake Towada, Dianchi Lake, Lake Akan, …}
;;      c620  mass 1  {desert, Sahara Desert}
;;      c945  mass 1  {west, western}

;; ---- slot <unclassed>.SubsetOf  [entity center]  n 13  clusters 12
(SubsetOf $x0 $x1)
;;      c897  mass 2  {person, people}
;;     c1194  mass 1  {system, window, platform, windows}
;;     c1274  mass 1  {store, shop, shopping, shops}
;;      c144  mass 1  {corner, corners}
;;      c371  mass 1  {mayan book, mayan books}
;;      c414  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c591  mass 1  {pupil, pupils}
;;      c771  mass 1  {village, villager, villagers}
;;      c820  mass 1  {dung beetle, insect, centipede, centipedes, …}
;;       c91  mass 1  {refugee, refugees}
;;      c922  mass 1  {chick, chicks}
;;      c923  mass 1  {girl, girls, girl, little}

;; ---- slot start.Theme  [event center]  n 13  clusters 13
(And (Member $e0 start) (Theme $e0 $x1))
;;     c1719  mass 2  {appear, see, display, show, …}
;;     c1007  mass 1  {vomit}
;;     c1142  mass 1  {cry, pray}
;;     c1371  mass 1  {hear, listen}
;;     c1374  mass 1  {talk, conversation, discussion}
;;     c1446  mass 1  {improve}
;;     c1519  mass 1  {disappear, fade, vanish}
;;     c1608  mass 1  {run out, keep away, run away}
;;     c1712  mass 1  {roll, roller, roll over}
;;      c594  mass 1  {school, university, campus, college, …}
;;      c682  mass 1  {song, sing, chant}
;;     c1246  mass 0.5  {feel, feeling}
;;        c8  mass 0.5  {light headed, feel, light headed}

;; ---- slot go.Goal  [event center]  n 12  clusters 9
(And (Member $e0 go) (Goal $e0 $x1))
;;     c1331  mass 4  {sleep, bed}
;;      c101  mass 1  {hospital, emergency room}
;;     c1103  mass 1  {place, places, easy, place, full, place}
;;     c1119  mass 1  {bathroom}
;;      c443  mass 1  {road, way, lane, motorway, …}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c594  mass 1  {school, university, campus, college, …}
;;       c63  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;       c66  mass 1  {supermarket}

;; ---- slot study.Agent  [event center]  n 12  clusters 9
(And (Member $e0 study) (Agent $e0 $x1))
;;      c897  mass 3  {person, people}
;;       c43  mass 2  {scientist, scientists}
;;       c38  mass 1  {forensics researcher, forensics researchers}
;;      c482  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c512  mass 1  {Peter, Paul, Paulus}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c529  mass 1  {Fadil, Jamil, Sami}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}

;; ---- slot <unclassed>.PartOf  [entity center]  n 11  clusters 11
(PartOf $x0 $x1)
;;      c470  mass 2  {Khurda Road}
;;      c123  mass 1  {Yunnan, Chongqing}
;;     c1372  mass 1  {play}
;;      c344  mass 1  {islamic ivory, ivory}
;;      c588  mass 1  {student association, student associations}
;;      c741  mass 1  {cake, pastry, pie, hot cake, …}
;;      c782  mass 1  {Ivy, ivy}
;;      c786  mass 1  {plant, bushes, plants}
;;      c837  mass 1  {animal, species, zoo, animals}
;;      c442  mass 0.5  {street, road, street, entire, street}
;;      c443  mass 0.5  {road, way, lane, motorway, …}

;; ---- slot become.Patient  [event center]  n 11  clusters 15
(And (Member $e0 become) (Patient $e0 $x1))
;;      c897  mass 1.5  {person, people}
;;     c1044  mass 1  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c508  mass 1  {Lady Ashton}
;;       c83  mass 1  {indigenous, indigenous, people, native american, indigenous american, …}
;;      c903  mass 1  {relationship, relate, relationships}
;;     c1293  mass 0.5  {discipline, discipline, lax}
;;     c1344  mass 0.5  {red, rag, rip, rough, …}
;;     c1349  mass 0.5  {uprising, revolutionary, revolution}
;;      c139  mass 0.5  {lax}
;;      c383  mass 0.5  {conservative, conservative, revolutionary}
;;      c509  mass 0.5  {inomaru, inomaru, person}
;;      c612  mass 0.5  {Earth, planet, earth}
;;      c655  mass 0.5  {intense, intense, noise}
;;      c666  mass 0.5  {noise, noises}

;; ---- slot begin.Agent  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Agent $e0 $x1))
;;      c521  mass 2  {David, William, James}
;;       c83  mass 2  {indigenous, indigenous, people, native american, indigenous american, …}
;;       c86  mass 2  {european american settler, european american settlers, french settler, french settlers}
;;     c1348  mass 1  {rebel, rebels}
;;      c455  mass 1  {legionnaire, legionnaires}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c980  mass 1  {Mark, marker, markers}
;;      c983  mass 1  {crowd, crowd, whole}

;; ---- slot begin.Theme  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Theme $e0 $x1))
;;     c1546  mass 4  {create, construct}
;;     c1038  mass 1  {confess}
;;     c1462  mass 1  {bud, bloom}
;;     c1545  mass 1  {make}
;;     c1698  mass 1  {hang, hang out}
;;     c1722  mass 1  {distribute}
;;      c310  mass 1  {torture}
;;      c993  mass 1  {applaud}

;; ---- slot build.Location  [event center]  n 11  clusters 4
(And (Member $e0 build) (Location $e0 $x1))
;;      c178  mass 4  {Kazakhstan, North Korea}
;;      c122  mass 3  {Eskisehir, Giresun, Istanbul}
;;      c193  mass 3  {Turkey, Cyprus}
;;      c165  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}

;; ---- slot kill.Patient  [event center]  n 11  clusters 5
(And (Member $e0 kill) (Patient $e0 $x1))
;;      c897  mass 6  {person, people}
;;      c457  mass 2  {soldier, guardsman, warrior}
;;      c813  mass 1  {zombie, zombies}
;;      c834  mass 1  {gazelle, giraffe, giraffes}
;;      c839  mass 1  {fox, wolf, wild boar, ox, …}

;; ---- slot produce.Patient  [event center]  n 11  clusters 10
(And (Member $e0 produce) (Patient $e0 $x1))
;;      c202  mass 4.833  {movie, film}
;;      c684  mass 2  {album}
;;      c109  mass 1  {insulin}
;;      c201  mass 0.833  {syrian film, film, syrian film, destined, film, syrian film}
;;     c1260  mass 0.5  {mesmerizing, mesmerizing, sheen}
;;     c1475  mass 0.5  {shine, sheen}
;;     c1248  mass 0.333  {harmless}
;;     c1360  mass 0.333  {trail, trace, track}
;;     c1458  mass 0.333  {destined}
;;      c323  mass 0.333  {poison, cyanide}

;; ---- slot start.Patient  [event center]  n 11  clusters 14
(And (Member $e0 start) (Patient $e0 $x1))
;;     c1324  mass 1  {watermelon season}
;;     c1522  mass 1  {crack, cracked}
;;     c1543  mass 1  {knock, kick, kick out}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;        c2  mass 1  {national fibre optic network project}
;;      c426  mass 1  {truck, wagon}
;;      c634  mass 1  {Milky Way}
;;      c802  mass 1  {dog, dog feed}
;;      c989  mass 1  {concert, concert hall, auditorium}
;;      c379  mass 0.5  {gusher}
;;      c381  mass 0.5  {freedom movement, freedom, independence}
;;     c1158  mass 0.333  {sky, air, clouds}
;;     c1423  mass 0.333  {pocket}
;;     c1468  mass 0.333  {black, blue, white, brown, …}

;; ---- slot find.Theme  [event center]  n 10  clusters 6
(And (Member $e0 find) (Theme $e0 $x1))
;;     c1646  mass 4  {thing, things, stuff, practice, thing}
;;      c430  mass 2  {Couper}
;;      c342  mass 1  {clay figurine, clay figurines}
;;      c364  mass 1  {paper, paper factory, paper mill, paper sheet, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c617  mass 1  {meteorite}

;; ---- slot leave.Agent  [event center]  n 10  clusters 10
(And (Member $e0 leave) (Agent $e0 $x1))
;;       c11  mass 1  {ship, british ship, israeli military ship, merchant ship, …}
;;      c414  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c422  mass 1  {bus, bus ride}
;;      c427  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c517  mass 1  {Michael, Marco, Marcus}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c551  mass 1  {Jon Bon Jovi, Sambora, Brian}
;;      c897  mass 1  {person, people}

;; ---- slot serve.Agent  [event center]  n 10  clusters 8
(And (Member $e0 serve) (Agent $e0 $x1))
;;      c126  mass 2  {Nelson, Ipswich, Ipswich & Rosewood}
;;      c127  mass 2  {Indooroopilly}
;;      c897  mass 1.5  {person, people}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c554  mass 1  {Yair Stern, Lev L. Spiro, Yitzhak}
;;      c904  mass 1  {Mom, mother, grandmother, parent, …}
;;      c937  mass 1  {paradise, Rosewood}
;;      c496  mass 0.5  {president, person, president}

;; ---- slot take.Theme  [event center]  n 10  clusters 11
(And (Member $e0 take) (Theme $e0 $x1))
;;      c896  mass 2  {identity, identify}
;;     c1169  mass 1  {portray, portrait, portrayal}
;;     c1401  mass 1  {strong, powerful, force, power}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;     c1712  mass 1  {roll, roller, roll over}
;;     c1765  mass 1  {while}
;;      c859  mass 1  {office}
;;     c1403  mass 0.5  {drastic, drastic, measures}
;;     c1578  mass 0.5  {measure, measures}
;;     c1756  mass 0.5  {open, close, end, closed}
;;     c1762  mass 0.5  {look, look into, look up, peek}

;; ---- slot try.Agent  [event center]  n 10  clusters 11
(And (Member $e0 try) (Agent $e0 $x1))
;;      c132  mass 1  {Santiago, Manila, Havana}
;;      c521  mass 1  {David, William, James}
;;      c525  mass 1  {Boldi, Bruno, Felix, Maurice, …}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c628  mass 1  {alien}
;;      c832  mass 1  {crocodile, snake}
;;      c861  mass 1  {company, corporation}
;;      c980  mass 1  {Mark, marker, markers}
;;      c908  mass 0.5  {man, guy, man, old}
;;      c916  mass 0.5  {young, critic, young}

;; ---- slot write.Patient  [event center]  n 10  clusters 7
(And (Member $e0 write) (Patient $e0 $x1))
;;     c1213  mass 2  {episode}
;;      c682  mass 2  {song, sing, chant}
;;      c969  mass 2  {screenplay, script}
;;     c1426  mass 1  {letter}
;;      c372  mass 1  {book, library, books}
;;      c895  mass 1  {personality, character}
;;      c967  mass 1  {sentence, english sentence, sentences}

;; ---- slot fall.Patient  [event center]  n 9  clusters 12
(And (Member $e0 fall) (Patient $e0 $x1))
;;     c1155  mass 1  {snow, cold, frost, snowstorm, …}
;;     c1186  mass 1  {scaffolding}
;;      c372  mass 1  {book, library, books}
;;      c591  mass 1  {pupil, pupils}
;;      c713  mass 1  {ice, ice cream, ice cone, ice cream cone, …}
;;      c922  mass 1  {chick, chicks}
;;      c976  mass 1  {hush of anticipation}
;;     c1521  mass 0.5  {silent, silence, forest, silent}
;;      c791  mass 0.5  {forest, jungle, natural lowland forest}
;;     c1064  mass 0.333  {rotten}
;;     c1536  mass 0.333  {dead, die, death, die down, …}
;;      c793  mass 0.333  {tree, trees, treetop}

;; ---- slot follow.Agent  [event center]  n 9  clusters 9
(And (Member $e0 follow) (Agent $e0 $x1))
;;     c1461  mass 2  {bhadala, bhadalas}
;;      c218  mass 1.5  {muslim, muslim house, muslim community, house, muslim, …}
;;      c443  mass 1  {road, way, lane, motorway, …}
;;      c484  mass 1  {Alexander}
;;      c527  mass 1  {Bailey}
;;      c529  mass 1  {Fadil, Jamil, Sami}
;;     c1099  mass 0.5  {house, home, comfortable, house, houses, …}
;;      c817  mass 0.5  {crawling, beast, crawling}
;;      c840  mass 0.5  {bear, beast, lion attack, tiger, …}

;; ---- slot follow.Theme  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Theme $e0 $x1))
;;      c160  mass 2  {region, regional level, regions}
;;      c234  mass 2  {tradition, traditions}
;;      c504  mass 1  {Layla, Liisa}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c535  mass 1  {Leon, Lukas}
;;      c548  mass 1  {Cowper, Henry Cole}
;;      c624  mass 1  {shore, beach, coast, shoreline}

;; ---- slot hear.Stimulus  [event center]  n 9  clusters 12
(And (Member $e0 hear) (Stimulus $e0 $x1))
;;     c1054  mass 1  {accident, crash}
;;     c1229  mass 1  {shoot, hunter, shot}
;;     c1541  mass 1  {break out, bang, break, burst, …}
;;     c1543  mass 1  {knock, kick, kick out}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;     c1688  mass 1  {start, begin}
;;      c666  mass 0.833  {noise, noises}
;;      c659  mass 0.5  {ticking, tick away}
;;      c673  mass 0.5  {upbeat, music, upbeat}
;;      c679  mass 0.5  {music}
;;      c651  mass 0.333  {barking, barking, growling, noises}
;;      c652  mass 0.333  {growling, roar}

;; ---- slot kill.Agent  [event center]  n 9  clusters 6
(And (Member $e0 kill) (Agent $e0 $x1))
;;     c1147  mass 4  {hurricane, typhoon, hurricane season}
;;      c108  mass 1  {cancer}
;;     c1136  mass 1  {fire, flame, burn, scorch, …}
;;     c1229  mass 1  {shoot, hunter, shot}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c840  mass 1  {bear, beast, lion attack, tiger, …}

;; ---- slot sing.Agent  [event center]  n 9  clusters 8
(And (Member $e0 sing) (Agent $e0 $x1))
;;      c891  mass 2  {sister, sisters}
;;      c897  mass 2  {person, people}
;;      c475  mass 1  {actress, actor}
;;      c521  mass 1  {David, William, James}
;;      c685  mass 1  {Amateur Barbershop Harmony Society}
;;      c826  mass 1  {bird, bird dropping, mother bird, birds}
;;     c1315  mass 0.5  {group}
;;      c854  mass 0.5  {profession, professional}

;; ---- slot take.Agent  [event center]  n 9  clusters 7
(And (Member $e0 take) (Agent $e0 $x1))
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;      c897  mass 2  {person, people}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c491  mass 1  {Jerry Rawlings}
;;      c496  mass 1  {president, person, president}
;;      c517  mass 1  {Michael, Marco, Marcus}
;;      c744  mass 1  {cook, recipe}

;; ---- slot become.Result  [event center]  n 8  clusters 7
(And (Member $e0 become) (Result $e0 $x1))
;;     c1044  mass 2  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1034  mass 1  {alarmed}
;;     c1344  mass 1  {red, rag, rip, rough, …}
;;      c139  mass 1  {lax}
;;      c383  mass 1  {conservative, conservative, revolutionary}
;;      c509  mass 1  {inomaru, inomaru, person}
;;       c83  mass 1  {indigenous, indigenous, people, native american, indigenous american, …}

;; ---- slot change.Patient  [event center]  n 8  clusters 7
(And (Member $e0 change) (Patient $e0 $x1))
;;     c1157  mass 2  {weather, bad, weather}
;;     c1145  mass 1  {rain, rainwater, fresh, rain}
;;     c1469  mass 1  {color}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c569  mass 1  {mind, mental, mental world}
;;      c599  mass 1  {course}
;;      c898  mass 1  {name}

;; ---- slot hear.Experiencer  [event center]  n 8  clusters 6
(And (Member $e0 hear) (Experiencer $e0 $x1))
;;      c525  mass 2  {Boldi, Bruno, Felix, Maurice, …}
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c521  mass 1  {David, William, James}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c529  mass 1  {Fadil, Jamil, Sami}

;; ---- slot live.Agent  [event center]  n 8  clusters 7
(And (Member $e0 live) (Agent $e0 $x1))
;;      c531  mass 2  {Mennad, Ziri, Lessos, Malaleel, …}
;;      c164  mass 1  {mozabite, tuareg, Beja, mozabites, …}
;;      c518  mass 1  {Mary, Hugo, Maria}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}
;;      c542  mass 1  {Ray Kurtzweil}
;;      c559  mass 1  {Cainan}
;;      c839  mass 1  {fox, wolf, wild boar, ox, …}

;; ---- slot live.Location  [event center]  n 8  clusters 8
(And (Member $e0 live) (Location $e0 $x1))
;;      c195  mass 2  {Germany, Denmark, Norway, Sweden}
;;     c1099  mass 1.5  {house, home, comfortable, house, houses, …}
;;     c1315  mass 1  {group}
;;      c145  mass 1  {southeastern corner}
;;      c155  mass 1  {suburb, neighborhood}
;;     c1239  mass 0.5  {cozy, comfortable}
;;     c1395  mass 0.5  {big, large, huge, massive, …}
;;     c1725  mass 0.5  {isolated, secluded}

;; ---- slot need.Experiencer  [event center]  n 8  clusters 8
(And (Member $e0 need) (Experiencer $e0 $x1))
;;     c1692  mass 1  {gate}
;;      c181  mass 1  {Algeria, Afghanistan, Iran, Morocco, …}
;;      c520  mass 1  {Karl, Kristoffer}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c553  mass 1  {Yanni}
;;      c758  mass 1  {sauce, soup}
;;      c921  mass 1  {child, children, kid, baby, …}
;;       c98  mass 1  {doctor, doctors}

;; ---- slot open.Patient  [event center]  n 8  clusters 4
(And (Member $e0 open) (Patient $e0 $x1))
;;     c1094  mass 4.5  {door, back door, door, open, door, unlocked, …}
;;      c386  mass 2  {law, legislation, laws, law, new, …}
;;      c276  mass 1  {bank, banking industry}
;;     c1090  mass 0.5  {vault like, door, vault like}

;; ---- slot play.Theme  [event center]  n 8  clusters 6
(And (Member $e0 play) (Theme $e0 $x1))
;;      c245  mass 2  {tennis}
;;      c503  mass 2  {Holly Golightly}
;;     c1212  mass 1  {sequence, series, sequences}
;;     c1433  mass 1  {role, crucial, role, important, role}
;;     c1435  mass 1  {important, crucial}
;;      c691  mass 1  {harp}

;; ---- slot produce.Agent  [event center]  n 8  clusters 5
(And (Member $e0 produce) (Agent $e0 $x1))
;;      c555  mass 6  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c110  mass 1  {pancreas}
;;     c1560  mass 0.333  {layer}
;;     c1635  mass 0.333  {little, small, low, thin, …}
;;      c321  mass 0.333  {oil}

;; ---- slot speak.Agent  [event center]  n 8  clusters 6
(And (Member $e0 speak) (Agent $e0 $x1))
;;      c507  mass 2  {Jessica, Linda, Beth, Katherine, …}
;;      c532  mass 2  {Horner, Oates, Wyman, Regis}
;;      c488  mass 1  {Xavier}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c561  mass 1  {Kari Wahlgren}
;;      c908  mass 1  {man, guy, man, old}

;; ---- slot talk.Agent  [event center]  n 8  clusters 6
(And (Member $e0 talk) (Agent $e0 $x1))
;;      c507  mass 3  {Jessica, Linda, Beth, Katherine, …}
;;      c374  mass 1  {author, writer, novelist}
;;      c538  mass 1  {Dan, Daniel}
;;      c541  mass 1  {Jordan Peterson}
;;      c873  mass 1  {school janitor}
;;      c902  mass 1  {friend, friends, friend, good}

;; ---- slot use.Agent  [event center]  n 8  clusters 7
(And (Member $e0 use) (Agent $e0 $x1))
;;       c78  mass 2  {localized version, localized versions}
;;       c10  mass 1  {ukrainian army, ukrainian combat loss, ukrainian combat losses}
;;      c163  mass 1  {algerian government}
;;      c493  mass 1  {Cameron, Blair, Churchill}
;;      c568  mass 1  {human brain}
;;      c683  mass 1  {singer}
;;      c905  mass 1  {father, Dad, dad}

;; ---- slot walk.Agent  [event center]  n 8  clusters 8
(And (Member $e0 walk) (Agent $e0 $x1))
;;     c1757  mass 1  {use, well, direct, do, …}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c517  mass 1  {Michael, Marco, Marcus}
;;      c525  mass 1  {Boldi, Bruno, Felix, Maurice, …}
;;      c535  mass 1  {Leon, Lukas}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;       c57  mass 1  {customer, customers}
;;      c873  mass 1  {school janitor}

;; ---- slot want.Experiencer  [event center]  n 8  clusters 6
(And (Member $e0 want) (Experiencer $e0 $x1))
;;      c480  mass 2  {Aslan}
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c535  mass 1  {Leon, Lukas}
;;      c757  mass 1  {chili, Pepper}
;;      c806  mass 1  {cat, cats}

;; ---- slot work.Agent  [event center]  n 8  clusters 9
(And (Member $e0 work) (Agent $e0 $x1))
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c530  mass 1  {Ashe, Asserson}
;;      c538  mass 1  {Dan, Daniel}
;;      c545  mass 1  {Mr. Jones, Mr Johnson}
;;      c874  mass 1  {volunteer, volunteers}
;;      c897  mass 1  {person, people}
;;      c905  mass 1  {father, Dad, dad}
;;      c692  mass 0.5  {adaptor, adaptor, old}
;;      c912  mass 0.5  {old, aging, ages ago, elderly}

;; ---- slot write.Agent  [event center]  n 8  clusters 6
(And (Member $e0 write) (Agent $e0 $x1))
;;      c897  mass 2.5  {person, people}
;;      c522  mass 2  {Gilles Thibaut, James of Barrochan}
;;      c555  mass 2  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c858  mass 0.5  {busy}
;;      c905  mass 0.5  {father, Dad, dad}
;;      c927  mass 0.5  {famous, fame}

;; ---- slot come.Agent  [event center]  n 7  clusters 7
(And (Member $e0 come) (Agent $e0 $x1))
;;     c1331  mass 1  {sleep, bed}
;;     c1361  mass 1  {train}
;;     c1374  mass 1  {talk, conversation, discussion}
;;      c422  mass 1  {bus, bus ride}
;;      c592  mass 1  {student, students}
;;      c908  mass 1  {man, guy, man, old}
;;      c943  mass 1  {country, backward, country}

;; ---- slot contain.Agent  [event center]  n 7  clusters 5
(And (Member $e0 contain) (Agent $e0 $x1))
;;      c649  mass 3  {card, deck, cards, deck}
;;      c104  mass 1  {vitamin pill}
;;      c650  mass 1  {chest, heart}
;;      c682  mass 1  {song, sing, chant}
;;      c694  mass 1  {plasma}

;; ---- slot contain.Theme  [event center]  n 7  clusters 8
(And (Member $e0 contain) (Theme $e0 $x1))
;;      c490  mass 2  {king, royal family, queen, kings}
;;     c1226  mass 1  {jack, jacks}
;;      c336  mass 1  {electrolyte, electrolytes}
;;      c347  mass 1  {gold coin, gold, gold coins}
;;      c103  mass 0.5  {nutrition}
;;     c1063  mass 0.5  {degrading}
;;     c1390  mass 0.5  {abundant, plenty, abundant, nutrition}
;;      c681  mass 0.5  {lyric, degrading, lyric, lyrics}

;; ---- slot create.Patient  [event center]  n 7  clusters 6
(And (Member $e0 create) (Patient $e0 $x1))
;;      c582  mass 4  {community, society}
;;       c47  mass 1  {particle accelerator}
;;     c1299  mass 0.5  {schedule, calendar}
;;     c1441  mass 0.5  {new, brand new, language, new, new, product}
;;     c1575  mass 0.5  {diverse, various}
;;      c963  mass 0.5  {language, english}

;; ---- slot form.Agent  [event center]  n 7  clusters 5
(And (Member $e0 form) (Agent $e0 $x1))
;;      c551  mass 4  {Jon Bon Jovi, Sambora, Brian}
;;      c333  mass 1  {technetium}
;;      c870  mass 1  {labourer, labourers}
;;     c1408  mass 0.5  {complex, complex, simple, complicated}
;;     c1636  mass 0.5  {easy, simple, soft}

;; ---- slot get.Patient  [event center]  n 7  clusters 12
(And (Member $e0 get) (Patient $e0 $x1))
;;     c1044  mass 1  {bad, bad, relationship, bad, matter, bad, problem}
;;      c181  mass 1  {Algeria, Afghanistan, Iran, Morocco, …}
;;     c1037  mass 0.5  {sorry, excuse, apologize, person, sorry}
;;     c1136  mass 0.5  {fire, flame, burn, scorch, …}
;;     c1157  mass 0.5  {weather, bad, weather}
;;     c1277  mass 0.5  {expensive, expensive, thing}
;;     c1278  mass 0.5  {cheap, inexpensive, low, price}
;;     c1334  mass 0.5  {day, days, days, short, one day}
;;     c1364  mass 0.5  {problem, problems}
;;     c1395  mass 0.5  {big, large, huge, massive, …}
;;     c1637  mass 0.5  {short, shortening}
;;     c1646  mass 0.5  {thing, things, stuff, practice, thing}

;; ---- slot make.Result  [event center]  n 7  clusters 8
(And (Member $e0 make) (Result $e0 $x1))
;;     c1025  mass 1  {uncomfortable}
;;     c1044  mass 1  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1051  mass 1  {dangerous, hazardous}
;;     c1262  mass 1  {beautiful, beauty, gorgeous, pretty}
;;     c1468  mass 1  {black, blue, white, brown, …}
;;      c490  mass 1  {king, royal family, queen, kings}
;;     c1753  mass 0.5  {former, back, early, backward, …}
;;      c943  mass 0.5  {country, backward, country}

;; ---- slot sell.Theme  [event center]  n 7  clusters 8
(And (Member $e0 sell) (Theme $e0 $x1))
;;      c713  mass 2  {ice, ice cream, ice cone, ice cream cone, …}
;;     c1417  mass 1  {copy, copes, copies}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c732  mass 1  {milk, yogurt}
;;     c1193  mass 0.5  {cell phone, device, mobile phone, cell phone, new}
;;     c1441  mass 0.5  {new, brand new, language, new, new, product}
;;      c743  mass 0.5  {roast, roasted}
;;      c764  mass 0.5  {bean, beans, roasted}

;; ---- slot serve.Theme  [event center]  n 7  clusters 4
(And (Member $e0 serve) (Theme $e0 $x1))
;;      c140  mass 3  {station, Springfield Station}
;;      c128  mass 2  {Baltimore, Boston, San Francisco, Springfield}
;;     c1019  mass 1  {revenge}
;;       c61  mass 1  {coffee, tea, coffee, strong}

;; ---- slot try.Theme  [event center]  n 7  clusters 7
(And (Member $e0 try) (Theme $e0 $x1))
;;     c1470  mass 1  {burnish}
;;     c1675  mass 1  {pull, commit, merge}
;;     c1680  mass 1  {connect, reach, contact}
;;     c1750  mass 1  {lose, give up, lost, fail}
;;      c297  mass 1  {steal}
;;      c312  mass 1  {abuse, violence, violent}
;;       c54  mass 1  {call, telephone call, call for}

;; ---- slot turn.Patient  [event center]  n 7  clusters 11
(And (Member $e0 turn) (Patient $e0 $x1))
;;     c1340  mass 1  {war, world war}
;;       c20  mass 1  {russian speech, russian}
;;      c443  mass 1  {road, way, lane, motorway, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;     c1088  mass 0.5  {ceiling, black, ceiling}
;;     c1468  mass 0.5  {black, blue, white, brown, …}
;;      c379  mass 0.5  {gusher}
;;      c381  mass 0.5  {freedom movement, freedom, independence}
;;     c1344  mass 0.333  {red, rag, rip, rough, …}
;;     c1467  mass 0.333  {yellow, orange}
;;      c778  mass 0.333  {leaf, foliage, leaves}

;; ---- slot win.Agent  [event center]  n 7  clusters 4
(And (Member $e0 win) (Agent $e0 $x1))
;;      c494  mass 3  {Wilson, wilson}
;;      c543  mass 2  {James Woods, Jeremy Irons}
;;     c1309  mass 1  {team, first team, away team}
;;      c835  mass 1  {horse, donkey}

;; ---- slot <unclassed>.Only  [entity center]  n 6  clusters 4
(Only $x0 $x1)
;;     c1701  mass 2  {have, possess}
;;     c1760  mass 2  {find, search, found, seek, …}
;;     c1755  mass 1  {follow, like, prefer}
;;      c888  mass 1  {solve}

;; ---- slot appear.Agent  [event center]  n 6  clusters 3
(And (Member $e0 appear) (Agent $e0 $x1))
;;      c897  mass 3  {person, people}
;;      c555  mass 2  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c891  mass 1  {sister, sisters}

;; ---- slot bear.Patient  [event center]  n 6  clusters 5
(And (Member $e0 bear) (Patient $e0 $x1))
;;      c897  mass 3  {person, people}
;;      c482  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}
;;     c1045  mass 0.5  {poor, man, poor, poorly}
;;      c908  mass 0.5  {man, guy, man, old}

;; ---- slot build.Instrument  [event center]  n 6  clusters 4
(And (Member $e0 build) (Instrument $e0 $x1))
;;     c1160  mass 2  {barometer}
;;     c1679  mass 2  {help, assistant, support}
;;     c1178  mass 1.5  {presented in scale, scale, presented, scale}
;;     c1718  mass 0.5  {present, presented}

;; ---- slot capture.Theme  [event center]  n 6  clusters 5
(And (Member $e0 capture) (Theme $e0 $x1))
;;       c11  mass 2  {ship, british ship, israeli military ship, merchant ship, …}
;;      c151  mass 1  {capital, provincial capital}
;;      c165  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}
;;      c823  mass 1  {magpie}
;;      c935  mass 1  {Valerian}

;; ---- slot cause.Agent  [event center]  n 6  clusters 6
(And (Member $e0 cause) (Agent $e0 $x1))
;;     c1148  mass 1  {storm, soon, thunder}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c368  mass 1  {news}
;;      c440  mass 1  {walk}
;;      c618  mass 1  {tide, tides}
;;      c810  mass 1  {evil, demon, devil, sadist, …}

;; ---- slot create.Agent  [event center]  n 6  clusters 4
(And (Member $e0 create) (Agent $e0 $x1))
;;       c83  mass 2  {indigenous, indigenous, people, native american, indigenous american, …}
;;       c86  mass 2  {european american settler, european american settlers, french settler, french settlers}
;;      c374  mass 1  {author, writer, novelist}
;;      c512  mass 1  {Peter, Paul, Paulus}

;; ---- slot enter.Agent  [event center]  n 6  clusters 5
(And (Member $e0 enter) (Agent $e0 $x1))
;;      c601  mass 2  {Issaquah Creek, Lake Sammamish}
;;      c218  mass 1  {muslim, muslim house, muslim community, house, muslim, …}
;;      c504  mass 1  {Layla, Liisa}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c897  mass 1  {person, people}

;; ---- slot form.Patient  [event center]  n 6  clusters 6
(And (Member $e0 form) (Patient $e0 $x1))
;;      c672  mass 2.5  {main songwriting unit, songwriting unit, main, songwriting unit}
;;      c333  mass 1  {technetium}
;;      c461  mass 1  {human barricade}
;;     c1408  mass 0.5  {complex, complex, simple, complicated}
;;     c1636  mass 0.5  {easy, simple, soft}
;;     c1676  mass 0.5  {master, main}

;; ---- slot fund.Agent  [event center]  n 6  clusters 3
(And (Member $e0 fund) (Agent $e0 $x1))
;;      c198  mass 3  {JICA}
;;      c405  mass 2  {government, govern}
;;      c168  mass 1  {Government of Kenya, Government of Uganda}

;; ---- slot get.Agent  [event center]  n 6  clusters 6
(And (Member $e0 get) (Agent $e0 $x1))
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c516  mass 1  {Leonid}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}
;;      c908  mass 0.5  {man, guy, man, old}
;;      c916  mass 0.5  {young, critic, young}

;; ---- slot get.Result  [event center]  n 6  clusters 6
(And (Member $e0 get) (Result $e0 $x1))
;;     c1044  mass 1  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1277  mass 1  {expensive, expensive, thing}
;;     c1278  mass 1  {cheap, inexpensive, low, price}
;;     c1401  mass 1  {strong, powerful, force, power}
;;     c1637  mass 1  {short, shortening}
;;     c1687  mass 1  {ready, prepare}

;; ---- slot help.Agent  [event center]  n 6  clusters 6
(And (Member $e0 help) (Agent $e0 $x1))
;;     c1132  mass 1  {hothouse condition, hothouse conditions}
;;     c1583  mass 1  {life, life experience}
;;     c1642  mass 1  {context, condition, situation}
;;      c517  mass 1  {Michael, Marco, Marcus}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c539  mass 1  {Karen, Kalman, Kerr, Ken}

;; ---- slot receive.Theme  [event center]  n 6  clusters 6
(And (Member $e0 receive) (Theme $e0 $x1))
;;      c857  mass 2  {work, job, work through, hard, work}
;;     c1674  mass 1  {win, award, winner}
;;     c1746  mass 1  {permit, permitted}
;;     c1779  mass 1  {honorary knighthood}
;;     c1441  mass 0.5  {new, brand new, language, new, new, product}
;;      c427  mass 0.5  {car, motor vehicle, vehicle, motor vehicles, …}

;; ---- slot run.Agent  [event center]  n 6  clusters 5
(And (Member $e0 run) (Agent $e0 $x1))
;;      c549  mass 2  {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}
;;      c836  mass 1  {cow, goat, sheep, calf}
;;      c838  mass 1  {rabbit, rat, squirrel, hamster}
;;       c98  mass 1  {doctor, doctors}

;; ---- slot sleep.Experiencer  [event center]  n 6  clusters 4
(And (Member $e0 sleep) (Experiencer $e0 $x1))
;;      c806  mass 2  {cat, cats}
;;      c921  mass 2  {child, children, kid, baby, …}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c802  mass 1  {dog, dog feed}

;; ---- slot speak.Theme  [event center]  n 6  clusters 5
(And (Member $e0 speak) (Theme $e0 $x1))
;;      c530  mass 2  {Ashe, Asserson}
;;      c963  mass 1.5  {language, english}
;;     c1471  mass 1  {polish}
;;       c21  mass 1  {czech}
;;      c394  mass 0.5  {foreign, foreign language, foreign, language, foreigner}

;; ---- slot start.Agent  [event center]  n 6  clusters 7
(And (Member $e0 start) (Agent $e0 $x1))
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c520  mass 1  {Karl, Kristoffer}
;;      c744  mass 1  {cook, recipe}
;;      c873  mass 1  {school janitor}
;;      c923  mass 1  {girl, girls, girl, little}
;;     c1732  mass 0.5  {whole, full, entire, fully, …}
;;      c983  mass 0.5  {crowd, crowd, whole}

;; ---- slot study.Location  [event center]  n 6  clusters 4
(And (Member $e0 study) (Location $e0 $x1))
;;      c487  mass 2  {Davis Studio}
;;      c489  mass 2  {Julian Ashton Art School}
;;      c137  mass 1  {Munich, Prague}
;;      c594  mass 1  {school, university, campus, college, …}

;; ---- slot write.CoAgent  [event center]  n 6  clusters 2
(And (Member $e0 write) (CoAgent $e0 $x1))
;;      c505  mass 4  {Bianca Olsen, Laurie Aubanel, Muriel Zazoui, Patricia Kaas}
;;      c556  mass 2  {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …}

;; ---- slot add.Agent  [event center]  n 5  clusters 4
(And (Member $e0 add) (Agent $e0 $x1))
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;      c549  mass 1  {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb}
;;      c744  mass 1  {cook, recipe}
;;      c786  mass 1  {plant, bushes, plants}

;; ---- slot appear.Location  [event center]  n 5  clusters 4
(And (Member $e0 appear) (Location $e0 $x1))
;;       c62  mass 2  {cafe}
;;      c203  mass 1  {musical film}
;;        c6  mass 1  {Coronation Street}
;;      c952  mass 1  {comedic role}

;; ---- slot buy.Theme  [event center]  n 5  clusters 7
(And (Member $e0 buy) (Theme $e0 $x1))
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1195  mass 1  {computer, machine}
;;      c753  mass 1  {food, eat}
;;     c1467  mass 0.5  {yellow, orange}
;;     c1468  mass 0.5  {black, blue, white, brown, …}
;;      c357  mass 0.5  {trouser, trousers, trouser, yellow}
;;      c359  mass 0.5  {shirt}

;; ---- slot cry.Agent  [event center]  n 5  clusters 4
(And (Member $e0 cry) (Agent $e0 $x1))
;;      c510  mass 2  {Baya, Skura, Inomaru, Barako, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c631  mass 1  {Rima}
;;      c923  mass 1  {girl, girls, girl, little}

;; ---- slot direct.Agent  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Agent $e0 $x1))
;;      c554  mass 2  {Yair Stern, Lev L. Spiro, Yitzhak}
;;      c500  mass 1  {Claude Lelouch}
;;      c555  mass 1  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c690  mass 1  {conductor}

;; ---- slot direct.Patient  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Patient $e0 $x1))
;;     c1213  mass 2  {episode}
;;      c202  mass 1.5  {movie, film}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c201  mass 0.5  {syrian film, film, syrian film, destined, film, syrian film}

;; ---- slot draw.Agent  [event center]  n 5  clusters 3
(And (Member $e0 draw) (Agent $e0 $x1))
;;      c548  mass 2  {Cowper, Henry Cole}
;;      c921  mass 2  {child, children, kid, baby, …}
;;      c989  mass 1  {concert, concert hall, auditorium}

;; ---- slot eat.Patient  [event center]  n 5  clusters 4
(And (Member $e0 eat) (Patient $e0 $x1))
;;      c699  mass 2  {cookie, cookie jar, cookies}
;;      c740  mass 1  {bake, bakery, bread}
;;      c746  mass 1  {chicken, chicken fried steak}
;;      c838  mass 1  {rabbit, rat, squirrel, hamster}

;; ---- slot fly.Agent  [event center]  n 5  clusters 5
(And (Member $e0 fly) (Agent $e0 $x1))
;;      c414  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c486  mass 1  {Lex Lex Luthor, Lex Luthor, Superman}
;;      c627  mass 1  {pace, rocket, space mission, space}
;;      c820  mass 1  {dung beetle, insect, centipede, centipedes, …}
;;      c825  mass 1  {crow, eagle, stork, caw}

;; ---- slot include.Theme  [event center]  n 5  clusters 4
(And (Member $e0 include) (Theme $e0 $x1))
;;      c464  mass 2  {Armaan Jain, Ranbir Kapoor}
;;      c465  mass 1  {Nikhil Nanda}
;;      c687  mass 1  {marching band, marching bands}
;;       c93  mass 1  {extradition clause}

;; ---- slot lead.Agent  [event center]  n 5  clusters 4
(And (Member $e0 lead) (Agent $e0 $x1))
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;     c1413  mass 1  {general, generalization, general purpose, easy, generalization}
;;      c594  mass 1  {school, university, campus, college, …}
;;      c802  mass 1  {dog, dog feed}

;; ---- slot lead.Goal  [event center]  n 5  clusters 7
(And (Member $e0 lead) (Goal $e0 $x1))
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1244  mass 1  {pacificat, pacificats, peace}
;;     c1251  mass 1  {happiness, happy, happily, joy}
;;     c1395  mass 0.5  {big, large, huge, massive, …}
;;     c1750  mass 0.5  {lose, give up, lost, fail}
;;      c805  mass 0.5  {cat fight, big, cat fight}
;;      c936  mass 0.5  {glory, glory, lost}

;; ---- slot marry.Agent  [event center]  n 5  clusters 3
(And (Member $e0 marry) (Agent $e0 $x1))
;;      c507  mass 3  {Jessica, Linda, Beth, Katherine, …}
;;      c522  mass 1  {Gilles Thibaut, James of Barrochan}
;;      c557  mass 1  {Steve}

;; ---- slot need.Theme  [event center]  n 5  clusters 5
(And (Member $e0 need) (Theme $e0 $x1))
;;     c1173  mass 1  {paint, painting}
;;     c1356  mass 1  {run, runner, runners}
;;     c1547  mass 1  {generate}
;;     c1573  mass 1  {understand, misunderstand}
;;       c73  mass 1  {go}

;; ---- slot portray.Agent  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Agent $e0 $x1))
;;      c494  mass 2  {Wilson, wilson}
;;      c510  mass 2  {Baya, Skura, Inomaru, Barako, …}
;;      c543  mass 1  {James Woods, Jeremy Irons}

;; ---- slot portray.Theme  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Theme $e0 $x1))
;;      c511  mass 2  {Kantaro Suga}
;;      c543  mass 2  {James Woods, Jeremy Irons}
;;      c494  mass 1  {Wilson, wilson}

;; ---- slot present.Theme  [event center]  n 5  clusters 4
(And (Member $e0 present) (Theme $e0 $x1))
;;      c682  mass 2  {song, sing, chant}
;;     c1174  mass 1  {picture, image}
;;     c1372  mass 1  {play}
;;     c1454  mass 1  {opportunity, golden opportunity}

;; ---- slot provide.Agent  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Agent $e0 $x1))
;;     c1294  mass 1  {organisation, organise}
;;      c266  mass 1  {power station}
;;      c365  mass 1  {mainstream media, media}
;;      c728  mass 1  {kitchen, kitchen island, kitchen sink}
;;      c982  mass 1  {witness, witnesses}

;; ---- slot provide.Theme  [event center]  n 5  clusters 6
(And (Member $e0 provide) (Theme $e0 $x1))
;;     c1289  mass 1  {description, detailed, descriptions, detailed}
;;      c265  mass 1  {energy, electricity}
;;      c753  mass 1  {food, eat}
;;      c961  mass 1  {plurivocality}
;;     c1211  mass 0.5  {counter space, counter space, extra}
;;     c1714  mass 0.5  {extra, exceed}

;; ---- slot ready.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 ready) (Experiencer $e0 $x1))
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c516  mass 1  {Leonid}
;;      c553  mass 1  {Yanni}
;;      c741  mass 1  {cake, pastry, pie, hot cake, …}
;;      c750  mass 1  {dinner, dinner table}

;; ---- slot sell.Agent  [event center]  n 5  clusters 5
(And (Member $e0 sell) (Agent $e0 $x1))
;;      c861  mass 2  {company, corporation}
;;      c366  mass 1  {newspaper, newspapers}
;;      c531  mass 1  {Mennad, Ziri, Lessos, Malaleel, …}
;;       c60  mass 0.5  {coffee brand, coffee brand, indie}
;;      c941  mass 0.5  {indie}

;; ---- slot sing.Theme  [event center]  n 5  clusters 2
(And (Member $e0 sing) (Theme $e0 $x1))
;;      c679  mass 4  {music}
;;      c682  mass 1  {song, sing, chant}

;; ---- slot sing.To  [event center]  n 5  clusters 3
(And (Member $e0 sing) (To $e0 $x1))
;;     c1500  mass 4  {accompany}
;;     c1047  mass 0.5  {sad, suffer}
;;      c679  mass 0.5  {music}

;; ---- slot sleep.Location  [event center]  n 5  clusters 3
(And (Member $e0 sleep) (Location $e0 $x1))
;;     c1105  mass 3  {couch}
;;     c1596  mass 1  {contain, inside, into}
;;      c883  mass 1  {mat, mathematics}

;; ---- slot stand.Experiencer  [event center]  n 5  clusters 3
(And (Member $e0 stand) (Experiencer $e0 $x1))
;;      c536  mass 3  {Gustavo, Alberto, Martino, Pietro, …}
;;     c1413  mass 1  {general, generalization, general purpose, easy, generalization}
;;      c592  mass 1  {student, students}

;; ---- slot start.Experiencer  [event center]  n 5  clusters 4
(And (Member $e0 start) (Experiencer $e0 $x1))
;;      c148  mass 2  {bridge}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c534  mass 1  {Gunter}
;;      c566  mass 1  {tunnel}

;; ---- slot study.Theme  [event center]  n 5  clusters 6
(And (Member $e0 study) (Theme $e0 $x1))
;;      c167  mass 1  {Arabic}
;;     c1710  mass 1  {rate}
;;      c262  mass 1  {mechanical engineering}
;;      c389  mass 1  {canon law}
;;      c113  mass 0.5  {bacterium, bacterium, new}
;;     c1441  mass 0.5  {new, brand new, language, new, new, product}

;; ---- slot swim.Agent  [event center]  n 5  clusters 5
(And (Member $e0 swim) (Agent $e0 $x1))
;;      c799  mass 1.5  {fish, salmon, fish, red}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c594  mass 1  {school, university, campus, college, …}
;;      c921  mass 1  {child, children, kid, baby, …}
;;     c1344  mass 0.5  {red, rag, rip, rough, …}

;; ---- slot travel.Agent  [event center]  n 5  clusters 4
(And (Member $e0 travel) (Agent $e0 $x1))
;;      c897  mass 2  {person, people}
;;      c401  mass 1  {campaigner, candidate}
;;      c519  mass 1  {Matthew}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}

;; ---- slot turn.Result  [event center]  n 5  clusters 5
(And (Member $e0 turn) (Result $e0 $x1))
;;     c1344  mass 1  {red, rag, rip, rough, …}
;;     c1467  mass 1  {yellow, orange}
;;     c1468  mass 1  {black, blue, white, brown, …}
;;      c379  mass 1  {gusher}
;;      c825  mass 1  {crow, eagle, stork, caw}

;; ---- slot watch.Agent  [event center]  n 5  clusters 5
(And (Member $e0 watch) (Agent $e0 $x1))
;;      c405  mass 1  {government, govern}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c590  mass 1  {coach}
;;      c897  mass 1  {person, people}
;;      c899  mass 1  {family, family business, families}

;; ---- slot win.Theme  [event center]  n 5  clusters 2
(And (Member $e0 win) (Theme $e0 $x1))
;;      c474  mass 4  {emmy}
;;      c313  mass 1  {race}

;; ---- slot bad.Between  [entity center]  n 4  clusters 2
(And (Member $x0 bad) (Between $x0 $x1))
;;      c194  mass 2  {Estonia, Poland, Ukraine, Russia}
;;      c195  mass 2  {Germany, Denmark, Norway, Sweden}

;; ---- slot beauty.Possession  [entity center]  n 4  clusters 4
(And (Member $x0 beauty) (Possession $x0 $x1))
;;      c602  mass 1  {lake, Lake Towada, Dianchi Lake, Lake Akan, …}
;;      c638  mass 1  {landscape, scenery, mountain scenery}
;;      c878  mass 1  {sex, sexually}
;;      c996  mass 1  {sight, eye}

;; ---- slot family.Possession  [entity center]  n 4  clusters 1
(And (Member $x0 family) (Possession $x0 $x1))
;;      c897  mass 4  {person, people}

;; ---- slot northern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 northern) (LocatedIn $x0 $x1))
;;      c183  mass 2  {India, Indonesia}
;;      c194  mass 2  {Estonia, Poland, Ukraine, Russia}

;; ---- slot southern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 southern) (LocatedIn $x0 $x1))
;;      c176  mass 2  {North Africa, Africa}
;;      c183  mass 2  {India, Indonesia}

;; ---- slot accompany.Agent  [event center]  n 4  clusters 2
(And (Member $e0 accompany) (Agent $e0 $x1))
;;      c891  mass 2  {sister, sisters}
;;      c897  mass 2  {person, people}

;; ---- slot accompany.Theme  [event center]  n 4  clusters 1
(And (Member $e0 accompany) (Theme $e0 $x1))
;;      c204  mass 4  {silent film}

;; ---- slot active.Time  [event center]  n 4  clusters 2
(And (Member $e0 active) (Time $e0 $x1))
;;     c1325  mass 2  {morning, dawn, early morning, morning light, …}
;;     c1335  mass 2  {evening, late afternoon}

;; ---- slot add.Theme  [event center]  n 4  clusters 3
(And (Member $e0 add) (Theme $e0 $x1))
;;     c1171  mass 2  {illustration, illustrations, illustrate}
;;      c756  mass 1  {clove, lemongrass, cloves}
;;      c780  mass 1  {green, greenery}

;; ---- slot arrive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 arrive) (Agent $e0 $x1))
;;      c418  mass 1  {paris train}
;;      c424  mass 1  {drive, driver}
;;      c524  mass 1  {Donald, Harvey}
;;       c72  mass 1  {spring}

;; ---- slot avoid.Theme  [event center]  n 4  clusters 4
(And (Member $e0 avoid) (Theme $e0 $x1))
;;     c1040  mass 1  {pitfall, pitfalls}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;     c1735  mass 1  {conform, consist, constitute}
;;      c278  mass 1  {bankruptcy}

;; ---- slot bad.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 bad) (Experiencer $e0 $x1))
;;     c1044  mass 2  {bad, bad, relationship, bad, matter, bad, problem}
;;      c903  mass 1  {relationship, relate, relationships}
;;     c1157  mass 0.5  {weather, bad, weather}
;;     c1645  mass 0.5  {matter, mass}

;; ---- slot bear.Location  [event center]  n 4  clusters 3
(And (Member $e0 bear) (Location $e0 $x1))
;;      c135  mass 2  {Stockholm, Bromma}
;;      c195  mass 1  {Germany, Denmark, Norway, Sweden}
;;      c612  mass 1  {Earth, planet, earth}

;; ---- slot begin.Patient  [event center]  n 4  clusters 4
(And (Member $e0 begin) (Patient $e0 $x1))
;;     c1336  mass 1  {night, tonight, night shift, midnight, …}
;;     c1349  mass 1  {uprising, revolutionary, revolution}
;;      c594  mass 1  {school, university, campus, college, …}
;;      c793  mass 1  {tree, trees, treetop}

;; ---- slot bring.Theme  [event center]  n 4  clusters 4
(And (Member $e0 bring) (Theme $e0 $x1))
;;       c11  mass 1  {ship, british ship, israeli military ship, merchant ship, …}
;;     c1412  mass 1  {advantage}
;;       c15  mass 1  {chinese dumpling}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}

;; ---- slot capture.Agent  [event center]  n 4  clusters 4
(And (Member $e0 capture) (Agent $e0 $x1))
;;      c192  mass 1  {Spain, Italy}
;;      c303  mass 1  {pirate, pirates}
;;      c458  mass 1  {army, soldiers, troop, troops}
;;      c829  mass 1  {falcon}

;; ---- slot cause.Patient  [event center]  n 4  clusters 5
(And (Member $e0 cause) (Patient $e0 $x1))
;;     c1059  mass 1  {wound, damage, injure}
;;       c48  mass 1  {earthquake, earthquakes}
;;       c52  mass 1  {abandonment anxiety}
;;      c667  mass 0.5  {sound, sound wave}
;;      c669  mass 0.5  {creaking, crackle, creaking, sound}

;; ---- slot change.Agent  [event center]  n 4  clusters 4
(And (Member $e0 change) (Agent $e0 $x1))
;;      c189  mass 1  {France, French Dahomey}
;;      c493  mass 1  {Cameron, Blair, Churchill}
;;      c778  mass 1  {leaf, foliage, leaves}
;;      c908  mass 1  {man, guy, man, old}

;; ---- slot close.Experiencer  [event center]  n 4  clusters 2
(And (Member $e0 close) (Experiencer $e0 $x1))
;;       c25  mass 3  {Low German}
;;      c525  mass 1  {Boldi, Bruno, Felix, Maurice, …}

;; ---- slot come.Source  [event center]  n 4  clusters 4
(And (Member $e0 come) (Source $e0 $x1))
;;     c1103  mass 1  {place, places, easy, place, full, place}
;;     c1359  mass 1  {treeline}
;;      c232  mass 1  {greek, greek drama}
;;      c777  mass 1  {garden, beautiful, garden}

;; ---- slot connect.Theme  [event center]  n 4  clusters 2
(And (Member $e0 connect) (Theme $e0 $x1))
;;      c124  mass 2  {Tokyo, Nagoya, Narita, Osaka}
;;      c606  mass 2  {Breakheart Hill, Kayalar}

;; ---- slot create.Location  [event center]  n 4  clusters 1
(And (Member $e0 create) (Location $e0 $x1))
;;     c1200  mass 4  {post, blog}

;; ---- slot decide.Agent  [event center]  n 4  clusters 3
(And (Member $e0 decide) (Agent $e0 $x1))
;;      c514  mass 2  {Boris, Ivan, Oleg, Fyodor, …}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}

;; ---- slot design.Agent  [event center]  n 4  clusters 2
(And (Member $e0 design) (Agent $e0 $x1))
;;      c555  mass 3  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;       c13  mass 1  {Robert Allan Limited}

;; ---- slot design.Patient  [event center]  n 4  clusters 2
(And (Member $e0 design) (Patient $e0 $x1))
;;     c1244  mass 2  {pacificat, pacificats, peace}
;;     c1646  mass 2  {thing, things, stuff, practice, thing}

;; ---- slot die.Patient  [event center]  n 4  clusters 2
(And (Member $e0 die) (Patient $e0 $x1))
;;      c897  mass 3  {person, people}
;;      c899  mass 1  {family, family business, families}

;; ---- slot discover.Theme  [event center]  n 4  clusters 5
(And (Member $e0 discover) (Theme $e0 $x1))
;;      c898  mass 2  {name}
;;       c37  mass 1  {pterosaur egg, pterosaur eggs}
;;     c1437  mass 0.333  {magnet, magnet, new, type}
;;     c1441  mass 0.333  {new, brand new, language, new, new, product}
;;     c1558  mass 0.333  {type}

;; ---- slot do.Patient  [event center]  n 4  clusters 4
(And (Member $e0 do) (Patient $e0 $x1))
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;      c748  mass 1  {dish, plate}
;;     c1635  mass 0.5  {little, small, low, thin, …}
;;      c949  mass 0.5  {dance, dance, little}

;; ---- slot eat.Agent  [event center]  n 4  clusters 5
(And (Member $e0 eat) (Agent $e0 $x1))
;;      c826  mass 1  {bird, bird dropping, mother bird, birds}
;;      c897  mass 1  {person, people}
;;      c921  mass 1  {child, children, kid, baby, …}
;;     c1468  mass 0.5  {black, blue, white, brown, …}
;;      c802  mass 0.5  {dog, dog feed}

;; ---- slot encourage.In  [event center]  n 4  clusters 2
(And (Member $e0 encourage) (In $e0 $x1))
;;      c248  mass 2  {chess, chess play}
;;      c883  mass 2  {mat, mathematics}

;; ---- slot enter.Theme  [event center]  n 4  clusters 4
(And (Member $e0 enter) (Theme $e0 $x1))
;;     c1091  mass 1  {cave, hole, lair, burrow}
;;      c186  mass 1  {America, Canada, United States, U.S., …}
;;      c434  mass 1  {park, parking lot, parking}
;;      c601  mass 1  {Issaquah Creek, Lake Sammamish}

;; ---- slot find.Agent  [event center]  n 4  clusters 2
(And (Member $e0 find) (Agent $e0 $x1))
;;      c430  mass 2  {Couper}
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}

;; ---- slot get.Theme  [event center]  n 4  clusters 5
(And (Member $e0 get) (Theme $e0 $x1))
;;      c293  mass 1  {arrest}
;;      c754  mass 1  {snack}
;;      c838  mass 1  {rabbit, rat, squirrel, hamster}
;;     c1279  mass 0.5  {price, cost, prices}
;;     c1635  mass 0.5  {little, small, low, thin, …}

;; ---- slot give.Theme  [event center]  n 4  clusters 5
(And (Member $e0 give) (Theme $e0 $x1))
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c712  mass 1  {mock champagne}
;;      c716  mass 1  {chocolate}
;;     c1411  mass 0.5  {advice, advise, advice, good}
;;     c1740  mass 0.5  {good, great, nice, pleasant, …}

;; ---- slot good.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 good) (Experiencer $e0 $x1))
;;     c1157  mass 1  {weather, bad, weather}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c410  mass 1  {windshield}
;;      c734  mass 1  {barley, barley bread}

;; ---- slot help.Theme  [event center]  n 4  clusters 4
(And (Member $e0 help) (Theme $e0 $x1))
;;     c1389  mass 1  {thrive}
;;     c1556  mass 1  {define}
;;      c897  mass 1  {person, people}
;;      c923  mass 1  {girl, girls, girl, little}

;; ---- slot include.Agent  [event center]  n 4  clusters 2
(And (Member $e0 include) (Agent $e0 $x1))
;;      c918  mass 3  {nephew, nephews}
;;      c938  mass 1  {parade}

;; ---- slot increase.Patient  [event center]  n 4  clusters 4
(And (Member $e0 increase) (Patient $e0 $x1))
;;       c10  mass 1  {ukrainian army, ukrainian combat loss, ukrainian combat losses}
;;      c268  mass 1  {industrialization, industrial output}
;;      c314  mass 1  {xenophobia}
;;      c427  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}

;; ---- slot jump.Agent  [event center]  n 4  clusters 6
(And (Member $e0 jump) (Agent $e0 $x1))
;;      c835  mass 1  {horse, donkey}
;;      c836  mass 1  {cow, goat, sheep, calf}
;;      c919  mass 1  {boy, boys}
;;     c1468  mass 0.333  {black, blue, white, brown, …}
;;     c1728  mass 0.333  {quickly, quick, fast}
;;      c839  mass 0.333  {fox, wolf, wild boar, ox, …}

;; ---- slot kill.Location  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Location $e0 $x1))
;;      c407  mass 3  {state, nation}
;;     c1678  mass 1  {here, host}

;; ---- slot kill.Manner  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Manner $e0 $x1))
;;     c1491  mass 2  {indirectly}
;;     c1757  mass 2  {use, well, direct, do, …}

;; ---- slot lie.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 lie) (Experiencer $e0 $x1))
;;     c1192  mass 1  {notebook}
;;     c1702  mass 1  {stick, pen}
;;      c372  mass 1  {book, library, books}
;;      c657  mass 1  {tape recorder}

;; ---- slot lie.Location  [event center]  n 4  clusters 1
(And (Member $e0 lie) (Location $e0 $x1))
;;     c1191  mass 4  {table}

;; ---- slot look.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 look) (Experiencer $e0 $x1))
;;      c175  mass 1  {Europe, Western Europe}
;;      c446  mass 1  {flag, philippine flag, inverted, philippine flag}
;;      c594  mass 1  {school, university, campus, college, …}
;;      c623  mass 1  {island, Derwent Isle}

;; ---- slot look.Like  [event center]  n 4  clusters 6
(And (Member $e0 look) (Like $e0 $x1))
;;      c292  mass 1  {imprison, inmate, jail, prison}
;;      c937  mass 1  {paradise, Rosewood}
;;     c1395  mass 0.5  {big, large, huge, massive, …}
;;     c1768  mass 0.5  {inverted}
;;      c446  mass 0.5  {flag, philippine flag, inverted, philippine flag}
;;      c819  mass 0.5  {spider, huge, spider, spider, vegetarian, spiders}

;; ---- slot move.Agent  [event center]  n 4  clusters 4
(And (Member $e0 move) (Agent $e0 $x1))
;;      c869  mass 2  {headquarters}
;;      c528  mass 1  {Sammy}
;;      c594  mass 0.5  {school, university, campus, college, …}
;;      c799  mass 0.5  {fish, salmon, fish, red}

;; ---- slot perform.Location  [event center]  n 4  clusters 3
(And (Member $e0 perform) (Location $e0 $x1))
;;       c62  mass 2  {cafe}
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1656  mass 1  {public}

;; ---- slot preach.Agent  [event center]  n 4  clusters 1
(And (Member $e0 preach) (Agent $e0 $x1))
;;      c897  mass 4  {person, people}

;; ---- slot preach.Location  [event center]  n 4  clusters 2
(And (Member $e0 preach) (Location $e0 $x1))
;;      c134  mass 2  {Gareccio, Bologna}
;;      c192  mass 2  {Spain, Italy}

;; ---- slot present.Agent  [event center]  n 4  clusters 3
(And (Member $e0 present) (Agent $e0 $x1))
;;      c532  mass 2  {Horner, Oates, Wyman, Regis}
;;     c1454  mass 1  {opportunity, golden opportunity}
;;      c861  mass 1  {company, corporation}

;; ---- slot receive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 receive) (Agent $e0 $x1))
;;     c1674  mass 1  {win, award, winner}
;;      c456  mass 1  {General Franks}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;       c91  mass 1  {refugee, refugees}

;; ---- slot replace.Agent  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Agent $e0 $x1))
;;      c555  mass 2  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c556  mass 1  {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …}
;;      c897  mass 1  {person, people}

;; ---- slot replace.Theme  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Theme $e0 $x1))
;;      c486  mass 2  {Lex Lex Luthor, Lex Luthor, Superman}
;;      c555  mass 1  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c897  mass 1  {person, people}

;; ---- slot require.Theme  [event center]  n 4  clusters 6
(And (Member $e0 require) (Theme $e0 $x1))
;;      c264  mass 1  {repair, repairs}
;;       c55  mass 1  {american phone number}
;;     c1409  mass 0.5  {difficult, hard, difficulty, harder}
;;     c1757  mass 0.5  {use, well, direct, do, …}
;;      c648  mass 0.5  {id card, id card, valid}
;;      c857  mass 0.5  {work, job, work through, hard, work}

;; ---- slot specify.In  [event center]  n 4  clusters 1
(And (Member $e0 specify) (In $e0 $x1))
;;     c1068  mass 4  {continuous time, discrete time}

;; ---- slot spend.Agent  [event center]  n 4  clusters 3
(And (Member $e0 spend) (Agent $e0 $x1))
;;      c897  mass 2  {person, people}
;;     c1319  mass 1  {May, march}
;;      c834  mass 1  {gazelle, giraffe, giraffes}

;; ---- slot star.Agent  [event center]  n 4  clusters 1
(And (Member $e0 star) (Agent $e0 $x1))
;;     c1646  mass 4  {thing, things, stuff, practice, thing}

;; ---- slot star.Theme  [event center]  n 4  clusters 2
(And (Member $e0 star) (Theme $e0 $x1))
;;      c505  mass 2  {Bianca Olsen, Laurie Aubanel, Muriel Zazoui, Patricia Kaas}
;;      c543  mass 2  {James Woods, Jeremy Irons}

;; ---- slot stop.Agent  [event center]  n 4  clusters 5
(And (Member $e0 stop) (Agent $e0 $x1))
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c553  mass 1  {Yanni}
;;      c631  mass 1  {Rima}
;;      c692  mass 0.5  {adaptor, adaptor, old}
;;      c912  mass 0.5  {old, aging, ages ago, elderly}

;; ---- slot stop.Theme  [event center]  n 4  clusters 2
(And (Member $e0 stop) (Theme $e0 $x1))
;;     c1142  mass 2  {cry, pray}
;;      c857  mass 2  {work, job, work through, hard, work}

;; ---- slot support.Theme  [event center]  n 4  clusters 1
(And (Member $e0 support) (Theme $e0 $x1))
;;     c1179  mass 4  {view, views, common, view, public, view, …}

;; ---- slot use.Manner  [event center]  n 4  clusters 3
(And (Member $e0 use) (Manner $e0 $x1))
;;     c1497  mass 2  {rarely}
;;     c1431  mass 1  {responsibility, responsibly}
;;     c1498  mass 1  {colloquially}

;; ---- slot use.To  [event center]  n 4  clusters 4
(And (Member $e0 use) (To $e0 $x1))
;;     c1545  mass 1  {make}
;;     c1683  mass 1  {develop}
;;      c597  mass 1  {study, learn}
;;      c743  mass 1  {roast, roasted}

;; ---- slot walk.Goal  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Goal $e0 $x1))
;;     c1274  mass 1  {store, shop, shopping, shops}
;;     c1753  mass 1  {former, back, early, backward, …}
;;      c596  mass 1  {class, classroom}
;;      c791  mass 1  {forest, jungle, natural lowland forest}

;; ---- slot walk.Location  [event center]  n 4  clusters 5
(And (Member $e0 walk) (Location $e0 $x1))
;;     c1089  mass 1  {floor, wood floor}
;;     c1114  mass 1  {hallway}
;;     c1465  mass 1  {dark, darkness, dimly}
;;     c1635  mass 0.5  {little, small, low, thin, …}
;;      c844  mass 0.5  {balloon, balloon, little}

;; ---- slot watch.Theme  [event center]  n 4  clusters 4
(And (Member $e0 watch) (Theme $e0 $x1))
;;     c1301  mass 1  {event}
;;     c1591  mass 1  {action, activity, active, act, …}
;;     c1780  mass 1  {natural hair video}
;;      c202  mass 1  {movie, film}

;; ---- slot win.For  [event center]  n 4  clusters 1
(And (Member $e0 win) (For $e0 $x1))
;;     c1169  mass 4  {portray, portrait, portrayal}

;; ---- slot work.Location  [event center]  n 4  clusters 4
(And (Member $e0 work) (Location $e0 $x1))
;;      c175  mass 1  {Europe, Western Europe}
;;      c226  mass 1  {Church of Norway}
;;      c267  mass 1  {factory, factories}
;;      c294  mass 1  {prison kitchen}

;; ---- slot bottom.PartOf  [entity center]  n 3  clusters 2
(And (Member $x0 bottom) (PartOf $x0 $x1))
;;      c363  mass 2  {page, sheet}
;;      c726  mass 1  {stew pot}

;; ---- slot fight.Against  [entity center]  n 3  clusters 3
(And (Member $x0 fight) (Against $x0 $x1))
;;     c1536  mass 1  {dead, die, death, die down, …}
;;     c1581  mass 1  {native, natural, nature}
;;      c209  mass 1  {fate}

;; ---- slot thing.LocatedIn  [entity center]  n 3  clusters 2
(And (Member $x0 thing) (LocatedIn $x0 $x1))
;;      c607  mass 2  {hill, mountain, hills, peaks}
;;      c355  mass 1  {closet}

;; ---- slot active.Experiencer  [event center]  n 3  clusters 2
(And (Member $e0 active) (Experiencer $e0 $x1))
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;      c530  mass 1  {Ashe, Asserson}

;; ---- slot affect.Agent  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Agent $e0 $x1))
;;      c319  mass 3  {cyberattack}

;; ---- slot affect.Location  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Location $e0 $x1))
;;      c393  mass 3  {world, international, global, internationally}

;; ---- slot affect.Theme  [event center]  n 3  clusters 3
(And (Member $e0 affect) (Theme $e0 $x1))
;;      c101  mass 1  {hospital, emergency room}
;;      c276  mass 1  {bank, banking industry}
;;      c861  mass 1  {company, corporation}

;; ---- slot affect.Time  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Time $e0 $x1))
;;     c1727  mass 3  {now, today, this year, current, …}

;; ---- slot approve.Theme  [event center]  n 3  clusters 3
(And (Member $e0 approve) (Theme $e0 $x1))
;;     c1287  mass 1  {treaty}
;;     c1297  mass 1  {plan, project}
;;     c1463  mass 1  {Bill, bill}

;; ---- slot attack.Patient  [event center]  n 3  clusters 3
(And (Member $e0 attack) (Patient $e0 $x1))
;;     c1102  mass 1  {building}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;       c59  mass 1  {consumer rights}

;; ---- slot bake.Agent  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Agent $e0 $x1))
;;      c861  mass 2  {company, corporation}
;;      c506  mass 1  {Emily, Ella}

;; ---- slot bake.Patient  [event center]  n 3  clusters 3
(And (Member $e0 bake) (Patient $e0 $x1))
;;      c713  mass 2  {ice, ice cream, ice cone, ice cream cone, …}
;;      c705  mass 0.5  {appetizing, scrumptious, delicious, appetizing, bug}
;;      c741  mass 0.5  {cake, pastry, pie, hot cake, …}

;; ---- slot base.On  [event center]  n 3  clusters 3
(And (Member $e0 base) (On $e0 $x1))
;;     c1339  mass 1  {battle, fight}
;;      c230  mass 1  {puritan value}
;;       c28  mass 1  {esperanto alphabet, latin alphabet}

;; ---- slot beautiful.Experiencer  [event center]  n 3  clusters 4
(And (Member $e0 beautiful) (Experiencer $e0 $x1))
;;     c1157  mass 1  {weather, bad, weather}
;;     c1262  mass 1  {beautiful, beauty, gorgeous, pretty}
;;     c1116  mass 0.5  {room, changing room, rooms}
;;      c626  mass 0.5  {moon, full moon, beautiful, moon}

;; ---- slot break_out.Patient  [event center]  n 3  clusters 3
(And (Member $e0 break_out) (Patient $e0 $x1))
;;     c1136  mass 1  {fire, flame, burn, scorch, …}
;;     c1137  mass 1  {forest fire, forest fires}
;;     c1340  mass 1  {war, world war}

;; ---- slot bring.Goal  [event center]  n 3  clusters 3
(And (Member $e0 bring) (Goal $e0 $x1))
;;     c1235  mass 1  {gallows}
;;      c183  mass 1  {India, Indonesia}
;;      c186  mass 1  {America, Canada, United States, U.S., …}

;; ---- slot buy.Agent  [event center]  n 3  clusters 2
(And (Member $e0 buy) (Agent $e0 $x1))
;;      c510  mass 2  {Baya, Skura, Inomaru, Barako, …}
;;      c532  mass 1  {Horner, Oates, Wyman, Regis}

;; ---- slot close.Agent  [event center]  n 3  clusters 4
(And (Member $e0 close) (Agent $e0 $x1))
;;      c413  mass 1  {pilot, pilot error, pilot errors}
;;      c459  mass 1  {guard, bodyguard, guards}
;;      c834  mass 0.5  {gazelle, giraffe, giraffes}
;;      c892  mass 0.5  {woman, lady, female, women}

;; ---- slot close.Goal  [event center]  n 3  clusters 2
(And (Member $e0 close) (Goal $e0 $x1))
;;       c23  mass 2  {Dutch, Frisian}
;;       c24  mass 1  {High German}

;; ---- slot close.Patient  [event center]  n 3  clusters 2
(And (Member $e0 close) (Patient $e0 $x1))
;;     c1094  mass 2  {door, back door, door, open, door, unlocked, …}
;;     c1274  mass 1  {store, shop, shopping, shops}

;; ---- slot come.Goal  [event center]  n 3  clusters 4
(And (Member $e0 come) (Goal $e0 $x1))
;;     c1640  mass 1  {conclusion, consequence}
;;      c989  mass 1  {concert, concert hall, auditorium}
;;     c1503  mass 0.5  {settlement, settle, political, settlement}
;;      c397  mass 0.5  {political, political power}

;; ---- slot come.Patient  [event center]  n 3  clusters 3
(And (Member $e0 come) (Patient $e0 $x1))
;;     c1147  mass 1  {hurricane, typhoon, hurricane season}
;;      c667  mass 1  {sound, sound wave}
;;      c816  mass 1  {insect sound, insect sounds}

;; ---- slot come_back.Agent  [event center]  n 3  clusters 3
(And (Member $e0 come_back) (Agent $e0 $x1))
;;      c904  mass 1  {Mom, mother, grandmother, parent, …}
;;      c905  mass 1  {father, Dad, dad}
;;      c919  mass 1  {boy, boys}

;; ---- slot compose.Patient  [event center]  n 3  clusters 3
(And (Member $e0 compose) (Patient $e0 $x1))
;;      c682  mass 2  {song, sing, chant}
;;     c1740  mass 0.5  {good, great, nice, pleasant, …}
;;      c689  mass 0.5  {orchestra, symphony, great, symphonies}

;; ---- slot conduct.Agent  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Agent $e0 $x1))
;;      c555  mass 2  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c449  mass 1  {CIA, FBI}

;; ---- slot conduct.Theme  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Theme $e0 $x1))
;;      c689  mass 2  {orchestra, symphony, great, symphonies}
;;      c580  mass 1  {surveillance}

;; ---- slot cover.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Instrument $e0 $x1))
;;     c1155  mass 1  {snow, cold, frost, snowstorm, …}
;;      c362  mass 1  {paper decoration, paper decorations}
;;      c787  mass 1  {weed}

;; ---- slot cover.Patient  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Patient $e0 $x1))
;;     c1113  mass 1  {courtyard, veranda}
;;     c1704  mass 1  {top, peak}
;;      c254  mass 1  {shopping arcade}

;; ---- slot define.Theme  [event center]  n 3  clusters 2
(And (Member $e0 define) (Theme $e0 $x1))
;;     c1212  mass 2  {sequence, series, sequences}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}

;; ---- slot die.Location  [event center]  n 3  clusters 2
(And (Member $e0 die) (Location $e0 $x1))
;;      c135  mass 2  {Stockholm, Bromma}
;;     c1136  mass 1  {fire, flame, burn, scorch, …}

;; ---- slot drink.Patient  [event center]  n 3  clusters 3
(And (Member $e0 drink) (Patient $e0 $x1))
;;       c61  mass 2  {coffee, tea, coffee, strong}
;;     c1146  mass 0.5  {water, water source, clear, water, good, water}
;;     c1740  mass 0.5  {good, great, nice, pleasant, …}

;; ---- slot drive.Agent  [event center]  n 3  clusters 2
(And (Member $e0 drive) (Agent $e0 $x1))
;;      c422  mass 2  {bus, bus ride}
;;      c431  mass 1  {van}

;; ---- slot encourage.Agent  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Agent $e0 $x1))
;;      c526  mass 3  {Jonas, Roger, Bob, Ralph, …}

;; ---- slot encourage.Theme  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Theme $e0 $x1))
;;      c525  mass 3  {Boldi, Bruno, Felix, Maurice, …}

;; ---- slot endorse.Theme  [event center]  n 3  clusters 1
(And (Member $e0 endorse) (Theme $e0 $x1))
;;     c1179  mass 3  {view, views, common, view, public, view, …}

;; ---- slot fall.Source  [event center]  n 3  clusters 3
(And (Member $e0 fall) (Source $e0 $x1))
;;     c1110  mass 1  {shelf}
;;     c1158  mass 1  {sky, air, clouds}
;;      c793  mass 1  {tree, trees, treetop}

;; ---- slot fight.Agent  [event center]  n 3  clusters 2
(And (Member $e0 fight) (Agent $e0 $x1))
;;       c80  mass 2  {kabye person, kabye people}
;;      c864  mass 1  {union boss, union bosses}

;; ---- slot fight.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fight) (Theme $e0 $x1))
;;     c1477  mass 1  {freeze, freeze over}
;;      c215  mass 1  {islamic fundamentalism}
;;      c307  mass 1  {terrorism, terrorist activity}

;; ---- slot fund.Theme  [event center]  n 3  clusters 2
(And (Member $e0 fund) (Theme $e0 $x1))
;;      c169  mass 2  {Kenya, Lessos-Kenya, Lessos-Uganda, Uganda}
;;      c147  mass 1  {border, border incident, border section}

;; ---- slot give.Agent  [event center]  n 3  clusters 2
(And (Member $e0 give) (Agent $e0 $x1))
;;      c514  mass 2  {Boris, Ivan, Oleg, Fyodor, …}
;;      c521  mass 1  {David, William, James}

;; ---- slot go.Manner  [event center]  n 3  clusters 2
(And (Member $e0 go) (Manner $e0 $x1))
;;     c1744  mass 2  {late, later, let, last, …}
;;     c1729  mass 1  {immediately, instantly, next instant, right away}

;; ---- slot go.To  [event center]  n 3  clusters 2
(And (Member $e0 go) (To $e0 $x1))
;;     c1374  mass 2  {talk, conversation, discussion}
;;     c1719  mass 1  {appear, see, display, show, …}

;; ---- slot grow.Patient  [event center]  n 3  clusters 4
(And (Member $e0 grow) (Patient $e0 $x1))
;;     c1003  mass 1  {beard}
;;      c539  mass 1  {Karen, Kalman, Kerr, Ken}
;;     c1520  mass 0.5  {faint, faint, sound}
;;      c667  mass 0.5  {sound, sound wave}

;; ---- slot have.In  [event center]  n 3  clusters 2
(And (Member $e0 have) (In $e0 $x1))
;;      c261  mass 2  {fluid mechanics}
;;      c959  mass 1  {poetry}

;; ---- slot hold.Patient  [event center]  n 3  clusters 4
(And (Member $e0 hold) (Patient $e0 $x1))
;;     c1300  mass 1  {meeting}
;;      c227  mass 1  {prayer, prayers}
;;     c1645  mass 0.5  {matter, mass}
;;      c991  mass 0.5  {ceremony, ceremony, mass}

;; ---- slot lead.Theme  [event center]  n 3  clusters 4
(And (Member $e0 lead) (Theme $e0 $x1))
;;     c1310  mass 1  {squad}
;;      c836  mass 1  {cow, goat, sheep, calf}
;;     c1395  mass 0.5  {big, large, huge, massive, …}
;;      c805  mass 0.5  {cat fight, big, cat fight}

;; ---- slot learn.Theme  [event center]  n 3  clusters 4
(And (Member $e0 learn) (Theme $e0 $x1))
;;     c1460  mass 1  {berber speaking, berber}
;;      c962  mass 1  {dictionary, vocabulary}
;;      c394  mass 0.5  {foreign, foreign language, foreign, language, foreigner}
;;      c963  mass 0.5  {language, english}

;; ---- slot leave.Patient  [event center]  n 3  clusters 5
(And (Member $e0 leave) (Patient $e0 $x1))
;;     c1094  mass 1  {door, back door, door, open, door, unlocked, …}
;;     c1092  mass 0.5  {unlocked, locked, lock, door, locked}
;;     c1472  mass 0.5  {light, shed light}
;;     c1756  mass 0.5  {open, close, end, closed}
;;     c1757  mass 0.5  {use, well, direct, do, …}

;; ---- slot leave.Result  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Result $e0 $x1))
;;     c1092  mass 1  {unlocked, locked, lock, door, locked}
;;     c1756  mass 1  {open, close, end, closed}
;;     c1757  mass 1  {use, well, direct, do, …}

;; ---- slot leave.Theme  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Theme $e0 $x1))
;;     c1116  mass 1  {room, changing room, rooms}
;;      c427  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}
;;      c434  mass 1  {park, parking lot, parking}

;; ---- slot lose.Agent  [event center]  n 3  clusters 2
(And (Member $e0 lose) (Agent $e0 $x1))
;;      c549  mass 2  {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb}
;;      c432  mass 1  {tire}

;; ---- slot move.Goal  [event center]  n 3  clusters 2
(And (Member $e0 move) (Goal $e0 $x1))
;;      c128  mass 2  {Baltimore, Boston, San Francisco, Springfield}
;;     c1678  mass 1  {here, host}

;; ---- slot paint.Patient  [event center]  n 3  clusters 2
(And (Member $e0 paint) (Patient $e0 $x1))
;;      c638  mass 2  {landscape, scenery, mountain scenery}
;;     c1692  mass 1  {gate}

;; ---- slot pick_up.Agent  [event center]  n 3  clusters 3
(And (Member $e0 pick_up) (Agent $e0 $x1))
;;     c1184  mass 1  {camera}
;;      c132  mass 1  {Santiago, Manila, Havana}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}

;; ---- slot play.Location  [event center]  n 3  clusters 2
(And (Member $e0 play) (Location $e0 $x1))
;;      c132  mass 2  {Santiago, Manila, Havana}
;;     c1089  mass 1  {floor, wood floor}

;; ---- slot pull.Theme  [event center]  n 3  clusters 5
(And (Member $e0 pull) (Theme $e0 $x1))
;;      c132  mass 1  {Santiago, Manila, Havana}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;     c1358  mass 0.333  {line}
;;     c1745  mass 0.333  {long}
;;      c416  mass 0.333  {railroad, freight train, locomotive, freight car}

;; ---- slot read.Agent  [event center]  n 3  clusters 4
(And (Member $e0 read) (Agent $e0 $x1))
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;     c1635  mass 0.5  {little, small, low, thin, …}
;;      c923  mass 0.5  {girl, girls, girl, little}

;; ---- slot read.Theme  [event center]  n 3  clusters 3
(And (Member $e0 read) (Theme $e0 $x1))
;;      c208  mass 1  {fairy tale}
;;      c288  mass 1  {economics magazine}
;;      c953  mass 1  {comic}

;; ---- slot require.Agent  [event center]  n 3  clusters 3
(And (Member $e0 require) (Agent $e0 $x1))
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1676  mass 1  {master, main}
;;     c1682  mass 1  {app, apply}

;; ---- slot return.Agent  [event center]  n 3  clusters 2
(And (Member $e0 return) (Agent $e0 $x1))
;;      c463  mass 2  {Glasnow}
;;       c12  mass 1  {fishing boat}

;; ---- slot return.Goal  [event center]  n 3  clusters 2
(And (Member $e0 return) (Goal $e0 $x1))
;;      c129  mass 2  {Altoona}
;;     c1204  mass 1  {port, old, port}

;; ---- slot rule.Agent  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Agent $e0 $x1))
;;      c471  mass 2  {Arakkal, Tipu Sultan}
;;      c192  mass 1  {Spain, Italy}

;; ---- slot rule.Theme  [event center]  n 3  clusters 3
(And (Member $e0 rule) (Theme $e0 $x1))
;;      c218  mass 1.5  {muslim, muslim house, muslim community, house, muslim, …}
;;      c182  mass 1  {Colombia, Brazil, Cuba, Peru, …}
;;     c1099  mass 0.5  {house, home, comfortable, house, houses, …}

;; ---- slot say.Theme  [event center]  n 3  clusters 2
(And (Member $e0 say) (Theme $e0 $x1))
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;      c211  mass 1  {funeral prayer, funeral}

;; ---- slot season.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 season) (Instrument $e0 $x1))
;;      c756  mass 1  {clove, lemongrass, cloves}
;;      c761  mass 1  {horse radish}
;;      c763  mass 1  {ramson}

;; ---- slot see.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 see) (Stimulus $e0 $x1))
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c626  mass 1  {moon, full moon, beautiful, moon}
;;      c837  mass 1  {animal, species, zoo, animals}

;; ---- slot shoot.Patient  [event center]  n 3  clusters 3
(And (Member $e0 shoot) (Patient $e0 $x1))
;;      c498  mass 1  {JFK}
;;      c538  mass 1  {Dan, Daniel}
;;      c840  mass 1  {bear, beast, lion attack, tiger, …}

;; ---- slot sleep.Agent  [event center]  n 3  clusters 2
(And (Member $e0 sleep) (Agent $e0 $x1))
;;      c897  mass 2  {person, people}
;;      c899  mass 1  {family, family business, families}

;; ---- slot solve.Patient  [event center]  n 3  clusters 1
(And (Member $e0 solve) (Patient $e0 $x1))
;;     c1364  mass 3  {problem, problems}

;; ---- slot spend.Theme  [event center]  n 3  clusters 2
(And (Member $e0 spend) (Theme $e0 $x1))
;;       c92  mass 2  {exile}
;;     c1334  mass 1  {day, days, days, short, one day}

;; ---- slot start.Location  [event center]  n 3  clusters 1
(And (Member $e0 start) (Location $e0 $x1))
;;      c195  mass 3  {Germany, Denmark, Norway, Sweden}

;; ---- slot stick.Patient  [event center]  n 3  clusters 3
(And (Member $e0 stick) (Patient $e0 $x1))
;;      c426  mass 1  {truck, wagon}
;;      c718  mass 1  {chewing gum}
;;      c835  mass 1  {horse, donkey}

;; ---- slot succeed.Agent  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Agent $e0 $x1))
;;      c484  mass 1  {Alexander}
;;      c527  mass 1  {Bailey}
;;      c556  mass 1  {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …}

;; ---- slot succeed.Theme  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Theme $e0 $x1))
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c548  mass 1  {Cowper, Henry Cole}
;;      c897  mass 1  {person, people}

;; ---- slot take_off.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_off) (Agent $e0 $x1))
;;      c414  mass 2  {plane, flight, aeroplane, airplane, …}
;;      c538  mass 1  {Dan, Daniel}

;; ---- slot take_over.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_over) (Agent $e0 $x1))
;;      c495  mass 2  {Watts}
;;      c782  mass 1  {Ivy, ivy}

;; ---- slot talk.Recipient  [event center]  n 3  clusters 4
(And (Member $e0 talk) (Recipient $e0 $x1))
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c589  mass 1  {teacher, professor}
;;     c1395  mass 0.5  {big, large, huge, massive, …}
;;      c984  mass 0.5  {audience, audience, large}

;; ---- slot turn.Goal  [event center]  n 3  clusters 3
(And (Member $e0 turn) (Goal $e0 $x1))
;;     c1665  mass 1  {report}
;;      c603  mass 1  {river, tributary, tributaries}
;;      c956  mass 1  {quagmire}

;; ---- slot understand.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 understand) (Stimulus $e0 $x1))
;;     c1365  mass 1  {specific issue}
;;     c1643  mass 1  {cause, reason, cause, unknown}
;;       c96  mass 1  {public health issue}

;; ---- slot wear.Theme  [event center]  n 3  clusters 3
(And (Member $e0 wear) (Theme $e0 $x1))
;;     c1000  mass 1  {mask}
;;      c360  mass 1  {inaugural gown}
;;      c409  mass 1  {helmet}

;; ---- slot welcome.Agent  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Agent $e0 $x1))
;;     c1678  mass 1  {here, host}
;;      c268  mass 1  {industrialization, industrial output}
;;      c384  mass 1  {whig, whigs}

;; ---- slot welcome.Theme  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Theme $e0 $x1))
;;      c268  mass 1  {industrialization, industrial output}
;;      c384  mass 1  {whig, whigs}
;;      c986  mass 1  {guest, guests}

;; ---- slot work.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 work) (Experiencer $e0 $x1))
;;     c1197  mass 1  {mouse}
;;     c1201  mass 1  {site}
;;      c693  mass 1  {travel adaptor}

;; ---- slot work.Manner  [event center]  n 3  clusters 3
(And (Member $e0 work) (Manner $e0 $x1))
;;     c1741  mass 1  {perfectly}
;;     c1744  mass 1  {late, later, let, last, …}
;;     c1757  mass 1  {use, well, direct, do, …}

;; ==================== word @ cluster cos 0.85: pooled role level (136 head pairs) ====================

;; Agent ~ Experiencer  cosine 0.61  JSD 0.65  n 888 / 261  shared: {person, people} {thing, things} {child, children, kid, kids}
(Agent $e $x)
(Experiencer $e $x)

;; Patient ~ Theme  cosine 0.51  JSD 0.746  n 455 / 594  shared: {thing, things} {person, people} {movie, film}
(Patient $e $x)
(Theme $e $x)

;; Agent ~ Patient  cosine 0.50  JSD 0.762  n 888 / 455  shared: {person, people} {thing, things} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
(Agent $e $x)
(Patient $e $x)

;; Experiencer ~ Patient  cosine 0.50  JSD 0.664  n 261 / 455  shared: {person, people} {thing, things} {door, door, open, door, unlocked}
(Experiencer $e $x)
(Patient $e $x)

;; Agent ~ Theme  cosine 0.42  JSD 0.765  n 888 / 594  shared: {person, people} {thing, things} {company, corporation}
(Agent $e $x)
(Theme $e $x)

;; Experiencer ~ Theme  cosine 0.41  JSD 0.776  n 261 / 594  shared: {thing, things} {person, people} {child, children, kid, kids}
(Experiencer $e $x)
(Theme $e $x)

;; Agent ~ Recipient  cosine 0.36  JSD 0.805  n 888 / 29  shared: {person, people} {company, corporation} {child, children, kid, kids}
(Agent $e $x)
(Recipient $e $x)

;; Stimulus ~ Theme  cosine 0.36  JSD 0.881  n 34 / 594  shared: {thing, things} {child, children, kid, kids} {food, eat}
(Stimulus $e $x)
(Theme $e $x)

;; Experiencer ~ Recipient  cosine 0.24  JSD 0.866  n 261 / 29  shared: {person, people} {child, children, kid, kids} {man, guy}
(Experiencer $e $x)
(Recipient $e $x)

;; Patient ~ Stimulus  cosine 0.24  JSD 0.918  n 455 / 34  shared: {thing, things} {child, children, kid, kids} {knock}
(Patient $e $x)
(Stimulus $e $x)

;; Holder ~ Theme  cosine 0.23  JSD 0.867  n 48 / 594  shared: {thing, things} {house, home, houses} {food, eat}
(Holder $e $x)
(Theme $e $x)

;; Experiencer ~ Holder  cosine 0.21  JSD 0.809  n 261 / 48  shared: {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Boris, Ivan, Dmitri, Rasputin}
(Experiencer $e $x)
(Holder $e $x)

;; Holder ~ Patient  cosine 0.21  JSD 0.852  n 48 / 455  shared: {thing, things} {movie, film} {room, rooms}
(Holder $e $x)
(Patient $e $x)

;; Experiencer ~ Stimulus  cosine 0.18  JSD 0.921  n 261 / 34  shared: {thing, things} {child, children, kid, kids} {difficult, hard, difficulty, harder}
(Experiencer $e $x)
(Stimulus $e $x)

;; Agent ~ Stimulus  cosine 0.17  JSD 0.91  n 888 / 34  shared: {thing, things} {child, children, kid, kids} {Jessica, Beth}
(Agent $e $x)
(Stimulus $e $x)

;; Patient ~ Recipient  cosine 0.17  JSD 0.921  n 455 / 29  shared: {person, people} {child, children, kid, kids} {big, large, huge, massive, …}
(Patient $e $x)
(Recipient $e $x)

;; Experiencer ~ Result  cosine 0.16  JSD 0.812  n 261 / 43  shared: {bad, bad, matter, bad, problem} {black, white} {red}
(Experiencer $e $x)
(Result $e $x)

;; Goal ~ Location  cosine 0.16  JSD 0.859  n 93 / 210  shared: {house, home, houses} {here} {Eskisehir, Giresun}
(Goal $e $x)
(Location $e $x)

;; Goal ~ Source  cosine 0.16  JSD 0.857  n 93 / 47  shared: {town, towns} {here} {school, education}
(Goal $e $x)
(Source $e $x)

;; Holder ~ Stimulus  cosine 0.15  JSD 0.892  n 48 / 34  shared: {thing, things} {author, writer, novelist} {food, eat}
(Holder $e $x)
(Stimulus $e $x)

;; Agent ~ Holder  cosine 0.15  JSD 0.857  n 888 / 48  shared: {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
(Agent $e $x)
(Holder $e $x)

;; Theme ~ To  cosine 0.14  JSD 0.908  n 594 / 46  shared: {thing, things} {talk, conversation, discussion} {music}
(Theme $e $x)
(To $e $x)

;; Recipient ~ Theme  cosine 0.14  JSD 0.912  n 29 / 594  shared: {person, people} {child, children, kid, kids} {Margaret Fleming, Martha, Anne, Marie}
(Recipient $e $x)
(Theme $e $x)

;; Location ~ Source  cosine 0.13  JSD 0.89  n 210 / 47  shared: {here} {town, towns} {place, places}
(Location $e $x)
(Source $e $x)

;; Goal ~ Holder  cosine 0.13  JSD 0.891  n 93 / 48  shared: {house, home, houses} {town, towns} {place, places}
(Goal $e $x)
(Holder $e $x)

;; Holder ~ Source  cosine 0.13  JSD 0.89  n 48 / 47  shared: {town, towns} {room, rooms} {place, places}
(Holder $e $x)
(Source $e $x)

;; Patient ~ Result  cosine 0.10  JSD 0.878  n 455 / 43  shared: {bad, bad, matter, bad, problem} {black, white} {red}
(Patient $e $x)
(Result $e $x)

;; Goal ~ Patient  cosine 0.09  JSD 0.896  n 93 / 455  shared: {tree, trees} {house, home, houses} {room, rooms}
(Goal $e $x)
(Patient $e $x)

;; Stimulus ~ To  cosine 0.09  JSD 0.907  n 34 / 46  shared: {thing, things} {practice} {action, act, actions}
(Stimulus $e $x)
(To $e $x)

;; For ~ Theme  cosine 0.09  JSD 0.944  n 39 / 594  shared: {work, job} {portray, portrait, portrayal} {word, word processor}
(For $e $x)
(Theme $e $x)

;; Manner ~ Result  cosine 0.09  JSD 0.895  n 115 / 43  shared: {well, on, there, be} {direct, straight, directly} {together, come together}
(Manner $e $x)
(Result $e $x)

;; Experiencer ~ Goal  cosine 0.09  JSD 0.905  n 261 / 93  shared: {house, home, houses} {place, places} {Linda, Amanda, Loren, Dora Smith, …}
(Experiencer $e $x)
(Goal $e $x)

;; Patient ~ To  cosine 0.08  JSD 0.95  n 455 / 46  shared: {thing, things} {bake, bakery, bread} {woman, lady, female, women}
(Patient $e $x)
(To $e $x)

;; Patient ~ Source  cosine 0.08  JSD 0.93  n 455 / 47  shared: {tree, trees} {room, rooms} {cookie, cookie jar, cookies}
(Patient $e $x)
(Source $e $x)

;; Goal ~ Theme  cosine 0.07  JSD 0.933  n 93 / 594  shared: {house, home, houses} {Baltimore, Boston, Springfield} {room, rooms}
(Goal $e $x)
(Theme $e $x)

;; Source ~ Theme  cosine 0.07  JSD 0.927  n 47 / 594  shared: {view, views, common, view, public, view, …} {food, eat} {room, rooms}
(Source $e $x)
(Theme $e $x)

;; Holder ~ Location  cosine 0.06  JSD 0.927  n 48 / 210  shared: {town, towns} {house, home, houses} {place, places}
(Holder $e $x)
(Location $e $x)

;; Agent ~ To  cosine 0.06  JSD 0.94  n 888 / 46  shared: {thing, things} {doctor, doctors} {George Allen, James David Edgar, Chuck Robb}
(Agent $e $x)
(To $e $x)

;; Experiencer ~ To  cosine 0.06  JSD 0.951  n 261 / 46  shared: {thing, things} {George Allen, James David Edgar, Chuck Robb} {doctor, doctors}
(Experiencer $e $x)
(To $e $x)

;; Location ~ Patient  cosine 0.06  JSD 0.9  n 210 / 455  shared: {door, door, open, door, unlocked} {table} {hotel}
(Location $e $x)
(Patient $e $x)

;; Experiencer ~ Location  cosine 0.06  JSD 0.913  n 261 / 210  shared: {Europe, Western Europe} {house, home, houses} {place, places}
(Experiencer $e $x)
(Location $e $x)

;; For ~ Goal  cosine 0.05  JSD 0.951  n 39 / 93  shared: {bed} {happiness, happy, happily, joy}
(For $e $x)
(Goal $e $x)

;; Holder ~ To  cosine 0.05  JSD 0.942  n 48 / 46  shared: {thing, things} {repeat, repetition}
(Holder $e $x)
(To $e $x)

;; Recipient ~ Stimulus  cosine 0.05  JSD 0.957  n 29 / 34  shared: {child, children, kid, kids}
(Recipient $e $x)
(Stimulus $e $x)

;; Location ~ Theme  cosine 0.04  JSD 0.925  n 210 / 594  shared: {house, home, houses} {Santiago, Havana} {Gareccio, Bologna}
(Location $e $x)
(Theme $e $x)

;; Instrument ~ Patient  cosine 0.04  JSD 0.949  n 34 / 455  shared: {snow, snowstorm, deep, snow} {road, motorway, roads} {blood}
(Instrument $e $x)
(Patient $e $x)

;; Experiencer ~ Source  cosine 0.04  JSD 0.946  n 261 / 47  shared: {place, places} {room, rooms} {school, education}
(Experiencer $e $x)
(Source $e $x)

;; Agent ~ Goal  cosine 0.04  JSD 0.942  n 888 / 93  shared: {Linda, Amanda, Loren, Dora Smith, …} {house, home, houses} {school, education}
(Agent $e $x)
(Goal $e $x)

;; Instrument ~ Stimulus  cosine 0.04  JSD 0.95  n 34 / 34  shared: {food, eat} {crash}
(Instrument $e $x)
(Stimulus $e $x)

;; In ~ Stimulus  cosine 0.04  JSD 0.953  n 50 / 34  shared: {action, act, actions} {poetry}
(In $e $x)
(Stimulus $e $x)

;; Manner ~ Time  cosine 0.04  JSD 0.928  n 115 / 107  shared: {late, later, last} {immediately, instantly, right away} {back, backward, before, past}
(Manner $e $x)
(Time $e $x)

;; Experiencer ~ Manner  cosine 0.03  JSD 0.951  n 261 / 115  shared: {well, on, there, be} {direct, straight, directly} {late, later, last}
(Experiencer $e $x)
(Manner $e $x)

;; Goal ~ Manner  cosine 0.03  JSD 0.96  n 93 / 115  shared: {well, on, there, be} {happiness, happy, happily, joy} {back, backward, before, past}
(Goal $e $x)
(Manner $e $x)

;; Goal ~ Result  cosine 0.03  JSD 0.948  n 93 / 43  shared: {dead, die, death, die down, …} {well, on, there, be} {big, large, huge, massive, …}
(Goal $e $x)
(Result $e $x)

;; Holder ~ Result  cosine 0.03  JSD 0.976  n 48 / 43  shared: {bad, bad, matter, bad, problem}
(Holder $e $x)
(Result $e $x)

;; Instrument ~ Recipient  cosine 0.03  JSD 0.952  n 34 / 29  shared: {crop, rice crop, corn, crops} {big, large, huge, massive, …}
(Instrument $e $x)
(Recipient $e $x)

;; Experiencer ~ Instrument  cosine 0.03  JSD 0.965  n 261 / 34  shared: {train} {road, motorway, roads} {crop, rice crop, corn, crops}
(Experiencer $e $x)
(Instrument $e $x)

;; Goal ~ Recipient  cosine 0.03  JSD 0.964  n 93 / 29  shared: {Linda, Amanda, Loren, Dora Smith, …} {big, large, huge, massive, …}
(Goal $e $x)
(Recipient $e $x)

;; In ~ Result  cosine 0.03  JSD 0.97  n 50 / 43  shared: {silent, silence}
(In $e $x)
(Result $e $x)

;; In ~ Theme  cosine 0.03  JSD 0.969  n 50 / 594  shared: {language, english} {understand, misunderstand} {way, ways}
(In $e $x)
(Theme $e $x)

;; Instrument ~ Theme  cosine 0.03  JSD 0.969  n 34 / 594  shared: {food, eat} {drum, snare, drums} {new, brand new, new, product}
(Instrument $e $x)
(Theme $e $x)

;; Agent ~ Source  cosine 0.03  JSD 0.97  n 888 / 47  shared: {company, corporation} {plane, flight, aeroplane, airplane, …} {school, education}
(Agent $e $x)
(Source $e $x)

;; Instrument ~ Source  cosine 0.03  JSD 0.963  n 34 / 47  shared: {food, eat} {big, large, huge, massive, …}
(Instrument $e $x)
(Source $e $x)

;; Recipient ~ Source  cosine 0.03  JSD 0.951  n 29 / 47  shared: {company, corporation} {local, locals} {big, large, huge, massive, …}
(Recipient $e $x)
(Source $e $x)

;; Result ~ Source  cosine 0.03  JSD 0.963  n 43 / 47  shared: {bat} {big, large, huge, massive, …}
(Result $e $x)
(Source $e $x)

;; Result ~ Theme  cosine 0.03  JSD 0.965  n 43 / 594  shared: {sleep} {king, queen, kings} {big, large, huge, massive, …}
(Result $e $x)
(Theme $e $x)

;; Experiencer ~ Time  cosine 0.03  JSD 0.968  n 261 / 107  shared: {night, tonight, midnight} {late, later, last} {modern times, modern}
(Experiencer $e $x)
(Time $e $x)

;; Location ~ Recipient  cosine 0.03  JSD 0.965  n 210 / 29  shared: {city, cities} {little, small, minor} {big, large, huge, massive, …}
(Location $e $x)
(Recipient $e $x)

;; In ~ Source  cosine 0.02  JSD 0.975  n 50 / 47  shared: {way, ways}
(In $e $x)
(Source $e $x)

;; Theme ~ Time  cosine 0.02  JSD 0.981  n 594 / 107  shared: {now, today, current} {morning, early morning, this morning} {day, days, days, short}
(Theme $e $x)
(Time $e $x)

;; Goal ~ In  cosine 0.02  JSD 0.969  n 93 / 50  shared: {way, ways} {field, fields}
(Goal $e $x)
(In $e $x)

;; In ~ Location  cosine 0.02  JSD 0.969  n 50 / 210  shared: {mat, mathematics} {water, water source, clear, water, good, water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; Source ~ Stimulus  cosine 0.02  JSD 0.975  n 47 / 34  shared: {food, eat}
(Source $e $x)
(Stimulus $e $x)

;; Experiencer ~ For  cosine 0.02  JSD 0.971  n 261 / 39  shared: {word, word processor} {happiness, happy, happily, joy} {general, general purpose}
(Experiencer $e $x)
(For $e $x)

;; In ~ Patient  cosine 0.02  JSD 0.972  n 50 / 455  shared: {weather} {field, fields} {language, english}
(In $e $x)
(Patient $e $x)

;; For ~ Stimulus  cosine 0.02  JSD 0.973  n 39 / 34  shared: {start, begin}
(For $e $x)
(Stimulus $e $x)

;; Agent ~ For  cosine 0.02  JSD 0.966  n 888 / 39  shared: {bus, bus ride} {cook} {ship, merchant ship, modern ship}
(Agent $e $x)
(For $e $x)

;; Experiencer ~ In  cosine 0.02  JSD 0.976  n 261 / 50  shared: {weather} {silent, silence} {nothing, no, empty, zero, …}
(Experiencer $e $x)
(In $e $x)

;; Goal ~ Instrument  cosine 0.02  JSD 0.966  n 93 / 34  shared: {snow, snowstorm, deep, snow} {big, large, huge, massive, …} {new, brand new, new, product}
(Goal $e $x)
(Instrument $e $x)

;; Holder ~ Instrument  cosine 0.02  JSD 0.975  n 48 / 34  shared: {food, eat}
(Holder $e $x)
(Instrument $e $x)

;; Location ~ To  cosine 0.02  JSD 0.978  n 210 / 46  shared: {talk, conversation, discussion} {shore, coast, shoreline}
(Location $e $x)
(To $e $x)

;; Manner ~ Patient  cosine 0.02  JSD 0.979  n 115 / 455  shared: {well, on, there, be} {direct, straight, directly} {together, come together}
(Manner $e $x)
(Patient $e $x)

;; Agent ~ Location  cosine 0.02  JSD 0.956  n 888 / 210  shared: {Santiago, Havana} {house, home, houses} {sun, sunlight, direct sun}
(Agent $e $x)
(Location $e $x)

;; In ~ Manner  cosine 0.02  JSD 0.977  n 50 / 115  shared: {really, real, reality, actual, …}
(In $e $x)
(Manner $e $x)

;; Agent ~ Result  cosine 0.02  JSD 0.971  n 888 / 43  shared: {indigenous, indigenous, people, native american, indigenous american, …} {crow, caw} {red}
(Agent $e $x)
(Result $e $x)

;; For ~ Holder  cosine 0.01  JSD 0.977  n 39 / 48  shared: {word, word processor}
(For $e $x)
(Holder $e $x)

;; Location ~ Manner  cosine 0.01  JSD 0.984  n 210 / 115  shared: {well, on, there, be} {early}
(Location $e $x)
(Manner $e $x)

;; Manner ~ Theme  cosine 0.01  JSD 0.978  n 115 / 594  shared: {full, fully, full fledged, complete, …} {really, real, reality, actual, …} {widespread, widely, wide, attention, widespread, …}
(Manner $e $x)
(Theme $e $x)

;; Patient ~ Time  cosine 0.01  JSD 0.983  n 455 / 107  shared: {night, tonight, midnight} {summer, this summer} {hour, hours}
(Patient $e $x)
(Time $e $x)

;; Agent ~ Time  cosine 0.01  JSD 0.986  n 888 / 107  shared: {now, today, current} {hurricane, hurricane season} {spring}
(Agent $e $x)
(Time $e $x)

;; In ~ To  cosine 0.01  JSD 0.981  n 50 / 46  shared: {action, act, actions}
(In $e $x)
(To $e $x)

;; Location ~ Result  cosine 0.01  JSD 0.982  n 210 / 43  shared: {big, large, huge, massive, …} {well, on, there, be}
(Location $e $x)
(Result $e $x)

;; Agent ~ Instrument  cosine 0.01  JSD 0.981  n 888 / 34  shared: {train} {plant, plants} {snow, snowstorm, deep, snow}
(Agent $e $x)
(Instrument $e $x)

;; Instrument ~ Result  cosine 0.01  JSD 0.982  n 34 / 43  shared: {big, large, huge, massive, …}
(Instrument $e $x)
(Result $e $x)

;; Recipient ~ Result  cosine 0.01  JSD 0.98  n 29 / 43  shared: {big, large, huge, massive, …}
(Recipient $e $x)
(Result $e $x)

;; Result ~ Time  cosine 0.01  JSD 0.968  n 43 / 107  shared: {modern times, modern} {back, backward, before, past}
(Result $e $x)
(Time $e $x)

;; For ~ Patient  cosine 0.01  JSD 0.983  n 39 / 455  shared: {word, word processor} {call, telephone call} {dance}
(For $e $x)
(Patient $e $x)

;; Manner ~ Stimulus  cosine 0.01  JSD 0.985  n 115 / 34  shared: {difficult, hard, difficulty, harder}
(Manner $e $x)
(Stimulus $e $x)

;; Holder ~ In  cosine 0.01  JSD 0.986  n 48 / 50  shared: {weather}
(Holder $e $x)
(In $e $x)

;; Instrument ~ Location  cosine 0.01  JSD 0.986  n 34 / 210  shared: {snow, snowstorm, deep, snow} {big, large, huge, massive, …}
(Instrument $e $x)
(Location $e $x)

;; For ~ Manner  cosine 0.01  JSD 0.986  n 39 / 115  shared: {happiness, happy, happily, joy}
(For $e $x)
(Manner $e $x)

;; Goal ~ Time  cosine 0.01  JSD 0.986  n 93 / 107  shared: {back, backward, before, past}
(Goal $e $x)
(Time $e $x)

;; Source ~ Time  cosine 0.01  JSD 0.986  n 47 / 107  shared: {point, point out}
(Source $e $x)
(Time $e $x)

;; Agent ~ Manner  cosine 0.00  JSD 0.995  n 888 / 115  shared: {quickly, quick, fast} {really, real, reality, actual, …}
(Agent $e $x)
(Manner $e $x)

;; Manner ~ Source  cosine 0.00  JSD 0.99  n 115 / 47  shared: {international, internationally}
(Manner $e $x)
(Source $e $x)

;; Instrument ~ Time  cosine 0.00  JSD 0.988  n 34 / 107  shared: {present, presented}
(Instrument $e $x)
(Time $e $x)

;; Agent ~ In  cosine 0.00  JSD 0.994  n 888 / 50  shared: {really, real, reality, actual, …} {context}
(Agent $e $x)
(In $e $x)

;; For ~ In  cosine 0.00  JSD 1.0  n 39 / 50  shared: 
(For $e $x)
(In $e $x)

;; For ~ Instrument  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Instrument $e $x)

;; For ~ Location  cosine 0.00  JSD 1.0  n 39 / 210  shared: 
(For $e $x)
(Location $e $x)

;; For ~ Recipient  cosine 0.00  JSD 1.0  n 39 / 29  shared: 
(For $e $x)
(Recipient $e $x)

;; For ~ Result  cosine 0.00  JSD 1.0  n 39 / 43  shared: 
(For $e $x)
(Result $e $x)

;; For ~ Source  cosine 0.00  JSD 1.0  n 39 / 47  shared: 
(For $e $x)
(Source $e $x)

;; For ~ Time  cosine 0.00  JSD 1.0  n 39 / 107  shared: 
(For $e $x)
(Time $e $x)

;; For ~ To  cosine 0.00  JSD 1.0  n 39 / 46  shared: 
(For $e $x)
(To $e $x)

;; Goal ~ Stimulus  cosine 0.00  JSD 1.0  n 93 / 34  shared: 
(Goal $e $x)
(Stimulus $e $x)

;; Goal ~ To  cosine 0.00  JSD 1.0  n 93 / 46  shared: 
(Goal $e $x)
(To $e $x)

;; Holder ~ Manner  cosine 0.00  JSD 1.0  n 48 / 115  shared: 
(Holder $e $x)
(Manner $e $x)

;; Holder ~ Recipient  cosine 0.00  JSD 1.0  n 48 / 29  shared: 
(Holder $e $x)
(Recipient $e $x)

;; Holder ~ Time  cosine 0.00  JSD 1.0  n 48 / 107  shared: 
(Holder $e $x)
(Time $e $x)

;; In ~ Instrument  cosine 0.00  JSD 1.0  n 50 / 34  shared: 
(In $e $x)
(Instrument $e $x)

;; In ~ Recipient  cosine 0.00  JSD 1.0  n 50 / 29  shared: 
(In $e $x)
(Recipient $e $x)

;; In ~ Time  cosine 0.00  JSD 1.0  n 50 / 107  shared: 
(In $e $x)
(Time $e $x)

;; Instrument ~ Manner  cosine 0.00  JSD 1.0  n 34 / 115  shared: 
(Instrument $e $x)
(Manner $e $x)

;; Instrument ~ To  cosine 0.00  JSD 1.0  n 34 / 46  shared: 
(Instrument $e $x)
(To $e $x)

;; Location ~ Stimulus  cosine 0.00  JSD 1.0  n 210 / 34  shared: 
(Location $e $x)
(Stimulus $e $x)

;; Location ~ Time  cosine 0.00  JSD 1.0  n 210 / 107  shared: 
(Location $e $x)
(Time $e $x)

;; Manner ~ Recipient  cosine 0.00  JSD 1.0  n 115 / 29  shared: 
(Manner $e $x)
(Recipient $e $x)

;; Manner ~ To  cosine 0.00  JSD 1.0  n 115 / 46  shared: 
(Manner $e $x)
(To $e $x)

;; Recipient ~ Time  cosine 0.00  JSD 1.0  n 29 / 107  shared: 
(Recipient $e $x)
(Time $e $x)

;; Recipient ~ To  cosine 0.00  JSD 1.0  n 29 / 46  shared: 
(Recipient $e $x)
(To $e $x)

;; Result ~ Stimulus  cosine 0.00  JSD 1.0  n 43 / 34  shared: 
(Result $e $x)
(Stimulus $e $x)

;; Result ~ To  cosine 0.00  JSD 1.0  n 43 / 46  shared: 
(Result $e $x)
(To $e $x)

;; Source ~ To  cosine 0.00  JSD 1.0  n 47 / 46  shared: 
(Source $e $x)
(To $e $x)

;; Stimulus ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Stimulus $e $x)
(Time $e $x)

;; Time ~ To  cosine 0.00  JSD 1.0  n 107 / 46  shared: 
(Time $e $x)
(To $e $x)

;; ==================== word @ cluster cos 0.85: slot pairs (3 event-center signals) ====================

;; [same role, different class]  accompany.Agent ~ appear.Agent  cosine 0.76  JSD 0.23  n 4 / 6  shared: {sister, sisters} {person, people}
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000050 tierC-000259
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; [same role, different class]  design.Agent ~ produce.Agent  cosine 0.88  JSD 0.25  n 4 / 8  shared: {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …}
;;   A e.g. tierC-000184 tierC-000119   B e.g. tierC-000103 tierC-000104
(And (Member $e0 design) (Agent $e0 $x1))
(And (Member $e0 produce) (Agent $e0 $x1))

;; [different class and role]  die.Patient ~ sleep.Agent  cosine 0.99  JSD 0.006  n 4 / 3  shared: {person, people} {family, families}
;;   A e.g. tierB-001967 tierC-000199   B e.g. tierC-000041 tierC-000042
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 sleep) (Agent $e0 $x1))

;; ==================== word @ cluster cos 0.85: compared slots with their distributions (269 slots, n >= 3) ====================

;; ---- slot <unclassed>.LocatedIn  [entity center]  n 46  clusters 40
(LocatedIn $x0 $x1)
;;     c2205  mass 3  {here}
;;     c1002  mass 2  {garden}
;;      c184  mass 2  {city, cities}
;;      c189  mass 2  {southern}
;;       c30  mass 2  {Loglan, Lojban}
;;      c769  mass 2  {class}
;;      c807  mass 2  {island, Derwent Isle}
;;     c2290  mass 1.5  {full, fully, full fledged, complete, …}
;;     c1021  mass 1  {tree, trees}
;;     c1222  mass 1  {country}
;;     c1253  mass 1  {Tatoeba}
;;     c1405  mass 1  {ceiling, black, ceiling}
;;     c1406  mass 1  {floor, wood floor}
;;     c1418  mass 1  {wall, cold, wall}
;;     c1425  mass 1  {house, home, houses}
;;     c1438  mass 1  {storehouse, storeroom}
;;     c1542  mass 1  {table}
;;     c1773  mass 1  {play}
;;      c199  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}
;;      c200  mass 1  {El Harrach}
;;      c212  mass 1  {Russian Far East, Siberia}
;;      c222  mass 1  {Colombia, Cuba, Peru, Venezuela}
;;      c224  mass 1  {India, Indonesia}
;;      c225  mass 1  {Japan, China}
;;      c234  mass 1  {Gaul}
;;      c235  mass 1  {England, UK}
;;      c251  mass 1  {movie, film}
;;      c344  mass 1  {market}
;;      c478  mass 1  {world}
;;      c530  mass 1  {park, parking lot, parking}
;;      c539  mass 1  {street, road, street}
;;      c777  mass 1  {Dianchi Lake, Lake Dianchi}
;;      c789  mass 1  {Huancavelica}
;;      c804  mass 1  {sea, ocean}
;;      c994  mass 1  {village, villager, villagers}
;;     c1096  mass 0.5  {basket, basket, red}
;;     c1432  mass 0.5  {place, places}
;;     c1486  mass 0.5  {fountain, fountain, full}
;;     c1738  mass 0.5  {red}
;;      c934  mass 0.5  {kitchen, kitchen sink}

;; ---- slot have.Holder  [event center]  n 44  clusters 40
(And (Member $e0 have) (Holder $e0 $x1))
;;      c650  mass 4  {Kristoffer}
;;      c185  mass 2  {town, towns}
;;     c2154  mass 2  {thing, things}
;;      c693  mass 2  {Karen, Ken}
;;     c1007  mass 1  {Ivy, ivy}
;;     c1040  mass 1  {creature, enemy, monster}
;;     c1251  mass 1  {sentence, sentences}
;;     c1257  mass 1  {word, word processor}
;;     c1425  mass 1  {house, home, houses}
;;     c1430  mass 1  {tower}
;;     c1432  mass 1  {place, places}
;;     c1435  mass 1  {hotel}
;;     c1449  mass 1  {room, rooms}
;;     c1703  mass 1  {february}
;;      c197  mass 1  {tuareg, tuaregs}
;;      c199  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}
;;      c220  mass 1  {Algeria, Morocco}
;;     c2328  mass 1  {decide, decision, choose, option}
;;      c236  mass 1  {Scotland}
;;     c2364  mass 1  {repeat, repetition}
;;      c251  mass 1  {movie, film}
;;      c332  mass 1  {insurance}
;;      c449  mass 1  {library}
;;      c451  mass 1  {author, writer, novelist}
;;      c470  mass 1  {lawyer}
;;      c529  mass 1  {gas station, gas pump, gas pumps}
;;      c607  mass 1  {Wilson, wilson}
;;      c641  mass 1  {Boris, Ivan, Dmitri, Rasputin}
;;      c658  mass 1  {Boldi, Bruno, Frankie}
;;      c661  mass 1  {Thomas, Tom, Tommy}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c687  mass 1  {Janos, Miroslav, Lajos}
;;      c728  mass 1  {homentropic current}
;;      c729  mass 1  {homentropic flow}
;;      c804  mass 1  {sea, ocean}
;;      c968  mass 1  {food, eat}
;;     c1184  mass 0.5  {old, elderly}
;;     c1347  mass 0.5  {bad, bad, matter, bad, problem}
;;     c1504  mass 0.5  {weather}
;;      c267  mass 0.5  {mosque, mosque, old}

;; ---- slot have.Theme  [event center]  n 43  clusters 59
(And (Member $e0 have) (Theme $e0 $x1))
;;     c1196  mass 4  {child, children, kid, kids}
;;     c2182  mass 2  {representation, represent}
;;     c1003  mass 1  {leaf, foliage, leaves}
;;     c1071  mass 1  {antler, antlers}
;;     c1075  mass 1  {herd, herds}
;;     c1167  mass 1  {friend, friends}
;;     c1652  mass 1  {value}
;;     c1658  mass 1  {reputation}
;;     c1721  mass 1  {day, days, days, short}
;;     c1876  mass 1  {chance}
;;     c1897  mass 1  {color}
;;     c2047  mass 1  {meaning, meanings}
;;     c2061  mass 1  {effect}
;;     c2154  mass 1  {thing, things}
;;     c2165  mass 1  {right}
;;     c2168  mass 1  {thought, think}
;;      c261  mass 1  {cemetery, cemetery chapel, cemeteries}
;;      c529  mass 1  {gas station, gas pump, gas pumps}
;;      c564  mass 1  {guard, bodyguard, guards}
;;       c69  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;     c1143  mass 0.667  {entropy}
;;     c2292  mass 0.667  {constant, always, constantly}
;;     c2296  mass 0.667  {uniform}
;;     c1002  mass 0.5  {garden}
;;     c1028  mass 0.5  {predictable, plot, predictable}
;;     c1159  mass 0.5  {personality}
;;     c1287  mass 0.5  {soul piercing, soul piercing, stare}
;;     c1310  mass 0.5  {nasty, nasty, personality}
;;     c1327  mass 0.5  {eerie, eerie, feeling}
;;     c1328  mass 0.5  {strange, weird, weird out}
;;     c1330  mass 0.5  {dream, dream, weird}
;;     c1403  mass 0.5  {roof, conical, roof}
;;     c1456  mass 0.5  {curtain, curtains}
;;     c1508  mass 0.5  {atmosphere}
;;     c1527  mass 0.5  {plot}
;;     c1597  mass 0.5  {homely, atmosphere, homely}
;;     c1607  mass 0.5  {feel, feeling}
;;     c1619  mass 0.5  {intriguing}
;;     c1628  mass 0.5  {beautiful, gorgeous, pretty}
;;     c1746  mass 0.5  {stare}
;;     c1815  mass 0.5  {high, hefty}
;;     c1816  mass 0.5  {rich}
;;     c1893  mass 0.5  {blue, purple}
;;     c2159  mass 0.5  {purpose, purpose, single}
;;     c2277  mass 0.5  {alone, own, single}
;;     c2308  mass 0.5  {good, nice, pleasant, positive}
;;      c290  mass 0.5  {history}
;;      c331  mass 0.5  {deductible, deductible, high}
;;      c423  mass 0.5  {style}
;;      c482  mass 0.5  {internal politics, internal politics, intriguing}
;;      c744  mass 0.5  {parenthetic, parenthetic, style}
;;      c904  mass 0.5  {taste test, taste, nice, taste, taste tests}
;;      c919  mass 0.5  {conical}
;;     c1260  mass 0.333  {document}
;;     c1654  mass 0.333  {valuable}
;;     c1798  mass 0.333  {widespread, widely, wide, attention, widespread, …}
;;     c1812  mass 0.333  {serious, severe}
;;     c2144  mass 0.333  {consequence}
;;      c336  mass 0.333  {bank}

;; ---- slot <unclassed>.Possession  [entity center]  n 30  clusters 21
(Possession $x0 $x1)
;;     c1161  mass 5  {person, people}
;;      c464  mass 4  {Free Soil Party}
;;      c465  mass 4  {Republican Party}
;;      c312  mass 2  {subsequent game}
;;      c740  mass 2  {logical phrase, logical proposition}
;;      c266  mass 1.25  {sunni community, sunni, communities, neighbouring, other, sunni, sunni communities}
;;     c1217  mass 1  {Twilight}
;;     c1222  mass 1  {country}
;;      c143  mass 1  {Yunnan}
;;     c2070  mass 1  {union}
;;     c2154  mass 1  {thing, things}
;;      c414  mass 1  {islamic ivory, ivory}
;;      c557  mass 1  {radical group}
;;      c589  mass 1  {God}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;      c819  mass 1  {Jupiter}
;;     c1823  mass 0.5  {generalization, easy, generalization}
;;     c2137  mass 0.5  {easy}
;;      c171  mass 0.25  {next door, neighbouring}
;;     c1824  mass 0.25  {other}
;;      c751  mass 0.25  {community}

;; ---- slot use.Theme  [event center]  n 23  clusters 23
(And (Member $e0 use) (Theme $e0 $x1))
;;        c3  mass 2  {banach mackey topology}
;;        c4  mass 2  {weak arens space topology}
;;     c1240  mass 1  {metaphor}
;;     c1249  mass 1  {phrase}
;;     c1251  mass 1  {sentence, sentences}
;;     c1257  mass 1  {word, word processor}
;;     c1449  mass 1  {room, rooms}
;;     c1473  mass 1  {fire, burn, scorch}
;;     c1550  mass 1  {machine}
;;     c2281  mass 1  {now, today, current}
;;     c2382  mass 1  {public fund}
;;      c392  mass 1  {chemical agent}
;;       c55  mass 1  {Midway}
;;      c556  mass 1  {paramilitary group}
;;      c633  mass 1  {Baya, Iga, Keike}
;;       c83  mass 1  {Laravel}
;;      c857  mass 1  {jingle}
;;      c869  mass 1  {auto tune, tune}
;;      c921  mass 1  {sugar}
;;     c1677  mass 0.5  {schedule, calendar}
;;     c2042  mass 0.5  {various}
;;       c84  mass 0.5  {naming convention, current, naming convention}
;;       c85  mass 0.5  {designation convention, current, designation convention}

;; ---- slot make.Patient  [event center]  n 20  clusters 25
(And (Member $e0 make) (Patient $e0 $x1))
;;     c2043  mass 1.5  {difference, different, distinction, distinguish, …}
;;     c1290  mass 1  {eye contact}
;;     c1533  mass 1  {cope}
;;     c1643  mass 1  {buy, purchase}
;;     c1799  mass 1  {big, large, huge, massive, …}
;;     c1953  mass 1  {claim, claims}
;;      c219  mass 1  {Afghanistan, Iran, Iraq, Persia}
;;      c437  mass 1  {paper, paper sheet, paper sheets}
;;       c58  mass 1  {call, telephone call}
;;      c592  mass 1  {Augustus}
;;      c626  mass 1  {Katherine, Isabella, Kate}
;;      c833  mass 1  {travel}
;;      c910  mass 1  {cup, plastic cup}
;;      c960  mass 1  {chicken fried steak}
;;     c1347  mass 0.5  {bad, bad, matter, bad, problem}
;;     c1425  mass 0.5  {house, home, houses}
;;     c1449  mass 0.5  {room, rooms}
;;     c1498  mass 0.5  {snowman, big, snowman}
;;     c1598  mass 0.5  {comfortable}
;;     c1628  mass 0.5  {beautiful, gorgeous, pretty}
;;     c2153  mass 0.5  {matter, mass}
;;      c846  mass 0.5  {high pitched, high pitched, noise}
;;      c859  mass 0.5  {noise, noises}
;;      c860  mass 0.5  {sound, sound wave}
;;      c861  mass 0.5  {clicking, clicking, sound}

;; ---- slot build.Patient  [event center]  n 18  clusters 11
(And (Member $e0 build) (Patient $e0 $x1))
;;     c1435  mass 4  {hotel}
;;      c438  mass 4  {paper factory, paper mill}
;;     c1449  mass 3  {room, rooms}
;;     c2154  mass 2  {thing, things}
;;     c2246  mass 2  {horn}
;;     c1563  mass 0.5  {network}
;;     c1857  mass 0.5  {new, brand new, new, product}
;;     c2048  mass 0.5  {original, origin, originate}
;;     c2348  mass 0.5  {well, on, there, be}
;;      c306  mass 0.5  {playground, new, playground}
;;       c49  mass 0.5  {turing machine, original, turing machine}

;; ---- slot make.Agent  [event center]  n 18  clusters 18
(And (Member $e0 make) (Agent $e0 $x1))
;;      c689  mass 2  {Martino, Pietro, Lorenzo, Damiano}
;;     c1037  mass 1  {cat, cats}
;;     c1178  mass 1  {man, guy}
;;     c1194  mass 1  {boy, boys}
;;     c1456  mass 1  {curtain, curtains}
;;     c1632  mass 1  {artistic beauty}
;;     c1825  mass 1  {practical utility}
;;     c2154  mass 1  {thing, things}
;;      c554  mass 1  {Taliban}
;;      c592  mass 1  {Augustus}
;;       c62  mass 1  {customer, customers}
;;      c631  mass 1  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c651  mass 1  {William, James}
;;      c652  mass 1  {David}
;;      c679  mass 1  {Elias, Gabriel}
;;      c926  mass 1  {restaurant, diner}
;;     c1495  mass 0.5  {wind, gusty, winds}
;;     c1496  mass 0.5  {gusty}

;; ---- slot go.Agent  [event center]  n 15  clusters 14
(And (Member $e0 go) (Agent $e0 $x1))
;;      c626  mass 2  {Katherine, Isabella, Kate}
;;     c1037  mass 1  {cat, cats}
;;     c1171  mass 1  {Mom, mother, mom}
;;     c1196  mass 1  {child, children, kid, kids}
;;      c625  mass 1  {Olivia, Sophia}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;      c631  mass 1  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c648  mass 1  {Matthew}
;;      c656  mass 1  {Donald}
;;      c672  mass 1  {Mennad, Lessos}
;;      c688  mass 1  {Adriano, Claudio, Flavio}
;;      c692  mass 1  {Daniel}
;;      c694  mass 1  {Kalman}
;;      c762  mass 1  {pupil, pupils}

;; ---- slot play.Agent  [event center]  n 15  clusters 9
(And (Member $e0 play) (Agent $e0 $x1))
;;     c1196  mass 4  {child, children, kid, kids}
;;      c567  mass 2  {Boston Red Sox}
;;      c568  mass 2  {Cincinnati Reds}
;;      c616  mass 2  {Audrey Hepburn, Audrey Heppurn}
;;     c1194  mass 1  {boy, boys}
;;      c128  mass 1  {biology}
;;      c274  mass 1  {religion, faith}
;;      c631  mass 1  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c662  mass 1  {Tony}

;; ---- slot build.Agent  [event center]  n 14  clusters 5
(And (Member $e0 build) (Agent $e0 $x1))
;;     c1119  mass 8  {company, corporation}
;;     c1161  mass 2  {person, people}
;;      c716  mass 2  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;;      c196  mass 1  {mozabite, mozabites}
;;      c751  mass 1  {community}

;; ---- slot find.Location  [event center]  n 14  clusters 10
(And (Member $e0 find) (Location $e0 $x1))
;;      c143  mass 2  {Yunnan}
;;      c189  mass 2  {southern}
;;     c2030  mass 2  {bench}
;;      c779  mass 2  {tributary, tributaries}
;;     c1224  mass 1  {west, western}
;;      c165  mass 1  {station}
;;      c210  mass 1  {Europe, Western Europe}
;;      c262  mass 1  {tomb}
;;      c777  mass 1  {Dianchi Lake, Lake Dianchi}
;;      c803  mass 1  {desert, Sahara Desert}

;; ---- slot <unclassed>.SubsetOf  [entity center]  n 13  clusters 12
(SubsetOf $x0 $x1)
;;     c1161  mass 2  {person, people}
;;      c105  mass 1  {refugee, refugees}
;;     c1055  mass 1  {centipede, centipedes, pillar}
;;     c1198  mass 1  {chick, chicks}
;;     c1199  mass 1  {girl, girls}
;;     c1546  mass 1  {window, windows}
;;     c1642  mass 1  {store, shop, shopping, shops}
;;      c169  mass 1  {corner, corners}
;;      c447  mass 1  {mayan book, mayan books}
;;      c504  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c762  mass 1  {pupil, pupils}
;;      c994  mass 1  {village, villager, villagers}

;; ---- slot start.Theme  [event center]  n 13  clusters 14
(And (Member $e0 start) (Theme $e0 $x1))
;;     c1302  mass 1  {vomit}
;;     c1483  mass 1  {cry}
;;     c1772  mass 1  {hear, listen}
;;     c1775  mass 1  {talk, conversation, discussion}
;;     c1863  mass 1  {improve}
;;     c1966  mass 1  {disappear, vanish}
;;     c2093  mass 1  {run out, run away}
;;     c2254  mass 1  {roll, roller, roll over}
;;     c2266  mass 1  {appear, show up}
;;     c2268  mass 1  {show}
;;      c767  mass 1  {high school}
;;      c879  mass 1  {song, sing, chant}
;;     c1607  mass 0.5  {feel, feeling}
;;        c8  mass 0.5  {light headed, feel, light headed}

;; ---- slot go.Goal  [event center]  n 12  clusters 9
(And (Member $e0 go) (Goal $e0 $x1))
;;     c1717  mass 4  {bed}
;;      c116  mass 1  {hospital}
;;     c1432  mass 1  {place, places}
;;     c1453  mass 1  {bathroom}
;;      c542  mass 1  {way, ways}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;       c69  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;       c72  mass 1  {supermarket}
;;      c766  mass 1  {school, education}

;; ---- slot study.Agent  [event center]  n 12  clusters 9
(And (Member $e0 study) (Agent $e0 $x1))
;;     c1161  mass 3  {person, people}
;;       c47  mass 2  {scientist, scientists}
;;       c42  mass 1  {forensics researcher, forensics researchers}
;;      c590  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c627  mass 1  {Jessica, Beth}
;;      c636  mass 1  {Peter}
;;      c639  mass 1  {Yuri}
;;      c668  mass 1  {Fadil, Jamil}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}

;; ---- slot <unclassed>.PartOf  [entity center]  n 11  clusters 11
(PartOf $x0 $x1)
;;      c577  mass 2  {Khurda Road}
;;     c1007  mass 1  {Ivy, ivy}
;;     c1012  mass 1  {plant, plants}
;;     c1081  mass 1  {animal, animals}
;;      c143  mass 1  {Yunnan}
;;     c1773  mass 1  {play}
;;      c414  mass 1  {islamic ivory, ivory}
;;      c759  mass 1  {student association, student associations}
;;      c952  mass 1  {cake, pie}
;;      c539  mass 0.5  {street, road, street}
;;      c541  mass 0.5  {road, motorway, roads}

;; ---- slot become.Patient  [event center]  n 11  clusters 15
(And (Member $e0 become) (Patient $e0 $x1))
;;     c1161  mass 1.5  {person, people}
;;     c1169  mass 1  {relationship, relationships}
;;     c1347  mass 1  {bad, bad, matter, bad, problem}
;;     c2154  mass 1  {thing, things}
;;      c629  mass 1  {Lady Ashton}
;;       c93  mass 1  {indigenous, indigenous, people, native american, indigenous american, …}
;;      c163  mass 0.5  {lax}
;;     c1668  mass 0.5  {discipline}
;;     c1738  mass 0.5  {red}
;;     c1743  mass 0.5  {revolutionary, revolution}
;;      c462  mass 0.5  {conservative, conservative, revolutionary}
;;      c630  mass 0.5  {inomaru, inomaru, person}
;;      c793  mass 0.5  {Earth, planet, earth}
;;      c847  mass 0.5  {intense}
;;      c859  mass 0.5  {noise, noises}

;; ---- slot begin.Agent  [event center]  n 11  clusters 9
(And (Member $e0 begin) (Agent $e0 $x1))
;;       c93  mass 2  {indigenous, indigenous, people, native american, indigenous american, …}
;;       c99  mass 2  {european american settler, european american settlers}
;;     c1269  mass 1  {Mark}
;;     c1272  mass 1  {crowd, crowd, whole}
;;     c1742  mass 1  {rebel, rebels}
;;      c558  mass 1  {legionnaire, legionnaires}
;;      c627  mass 1  {Jessica, Beth}
;;      c651  mass 1  {William, James}
;;      c652  mass 1  {David}

;; ---- slot begin.Theme  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Theme $e0 $x1))
;;     c2008  mass 4  {create}
;;     c1285  mass 1  {applaud}
;;     c1340  mass 1  {confess}
;;     c1886  mass 1  {bud}
;;     c2006  mass 1  {make}
;;     c2236  mass 1  {hang out}
;;     c2273  mass 1  {distribute}
;;      c375  mass 1  {torture}

;; ---- slot build.Location  [event center]  n 11  clusters 4
(And (Member $e0 build) (Location $e0 $x1))
;;      c214  mass 4  {Kazakhstan}
;;      c140  mass 3  {Eskisehir, Giresun}
;;      c240  mass 3  {Turkey}
;;      c199  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}

;; ---- slot kill.Patient  [event center]  n 11  clusters 5
(And (Member $e0 kill) (Patient $e0 $x1))
;;     c1161  mass 6  {person, people}
;;      c560  mass 2  {soldier, warrior}
;;     c1046  mass 1  {zombie, zombies}
;;     c1076  mass 1  {gazelle, giraffe, giraffes}
;;     c1087  mass 1  {fox, ox}

;; ---- slot produce.Patient  [event center]  n 11  clusters 10
(And (Member $e0 produce) (Patient $e0 $x1))
;;      c251  mass 4.833  {movie, film}
;;      c881  mass 2  {album}
;;      c126  mass 1  {insulin}
;;      c250  mass 0.833  {syrian film, film, syrian film, destined, film, syrian film}
;;     c1623  mass 0.5  {mesmerizing}
;;     c1905  mass 0.5  {shine, sheen}
;;     c1609  mass 0.333  {harmless}
;;     c1758  mass 0.333  {trail, trace}
;;     c1881  mass 0.333  {destined}
;;      c390  mass 0.333  {cyanide}

;; ---- slot start.Patient  [event center]  n 11  clusters 14
(And (Member $e0 start) (Patient $e0 $x1))
;;     c1033  mass 1  {dog, dog feed}
;;     c1280  mass 1  {concert}
;;     c1708  mass 1  {watermelon season}
;;     c1971  mass 1  {crack, cracked}
;;        c2  mass 1  {national fibre optic network project}
;;     c2004  mass 1  {knock}
;;     c2154  mass 1  {thing, things}
;;      c520  mass 1  {truck}
;;      c820  mass 1  {Milky Way}
;;      c456  mass 0.5  {gusher}
;;      c459  mass 0.5  {freedom movement, freedom}
;;     c1506  mass 0.333  {sky}
;;     c1835  mass 0.333  {pocket}
;;     c1893  mass 0.333  {blue, purple}

;; ---- slot find.Theme  [event center]  n 10  clusters 6
(And (Member $e0 find) (Theme $e0 $x1))
;;     c2154  mass 4  {thing, things}
;;      c526  mass 2  {Couper}
;;      c412  mass 1  {clay figurine, clay figurines}
;;      c437  mass 1  {paper, paper sheet, paper sheets}
;;      c689  mass 1  {Martino, Pietro, Lorenzo, Damiano}
;;      c800  mass 1  {meteorite}

;; ---- slot leave.Agent  [event center]  n 10  clusters 10
(And (Member $e0 leave) (Agent $e0 $x1))
;;     c1161  mass 1  {person, people}
;;       c12  mass 1  {ship, merchant ship, modern ship}
;;      c504  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c515  mass 1  {bus, bus ride}
;;      c522  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}
;;      c641  mass 1  {Boris, Ivan, Dmitri, Rasputin}
;;      c645  mass 1  {Michael, Marco, Marcus}
;;      c661  mass 1  {Thomas, Tom, Tommy}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c711  mass 1  {Brian}

;; ---- slot serve.Agent  [event center]  n 10  clusters 8
(And (Member $e0 serve) (Agent $e0 $x1))
;;      c146  mass 2  {Ipswich, Ipswich & Rosewood}
;;      c148  mass 2  {Indooroopilly}
;;     c1161  mass 1.5  {person, people}
;;     c1173  mass 1  {grandmother}
;;     c1214  mass 1  {Rosewood}
;;      c687  mass 1  {Janos, Miroslav, Lajos}
;;      c714  mass 1  {Yair Stern, Yitzhak}
;;      c609  mass 0.5  {president, person, president}

;; ---- slot take.Theme  [event center]  n 10  clusters 11
(And (Member $e0 take) (Theme $e0 $x1))
;;     c1160  mass 2  {identity, identify}
;;     c1117  mass 1  {office}
;;     c1519  mass 1  {portray, portrait, portrayal}
;;     c1807  mass 1  {powerful, power}
;;     c2154  mass 1  {thing, things}
;;     c2254  mass 1  {roll, roller, roll over}
;;     c2365  mass 1  {while}
;;     c1811  mass 0.5  {drastic, drastic, measures}
;;     c2045  mass 0.5  {measure, measures}
;;     c2336  mass 0.5  {close, closed}
;;     c2361  mass 0.5  {look, look into, look up}

;; ---- slot try.Agent  [event center]  n 10  clusters 11
(And (Member $e0 try) (Agent $e0 $x1))
;;     c1073  mass 1  {crocodile}
;;     c1119  mass 1  {company, corporation}
;;     c1269  mass 1  {Mark}
;;      c154  mass 1  {Santiago, Havana}
;;      c652  mass 1  {David}
;;      c659  mass 1  {Felix}
;;      c664  mass 1  {Roger, Bob, Bobby, Robbie, …}
;;      c688  mass 1  {Adriano, Claudio, Flavio}
;;      c814  mass 1  {alien}
;;     c1178  mass 0.5  {man, guy}
;;     c1191  mass 0.5  {young}

;; ---- slot write.Patient  [event center]  n 10  clusters 8
(And (Member $e0 write) (Patient $e0 $x1))
;;     c1570  mass 2  {episode}
;;      c879  mass 2  {song, sing, chant}
;;     c1158  mass 1  {character}
;;     c1251  mass 1  {sentence, sentences}
;;     c1254  mass 1  {screenplay}
;;     c1255  mass 1  {script}
;;     c1839  mass 1  {letter}
;;      c448  mass 1  {book, books}

;; ---- slot fall.Patient  [event center]  n 9  clusters 12
(And (Member $e0 fall) (Patient $e0 $x1))
;;     c1198  mass 1  {chick, chicks}
;;     c1263  mass 1  {hush of anticipation}
;;     c1500  mass 1  {snow, snowstorm, deep, snow}
;;     c1537  mass 1  {scaffolding}
;;      c448  mass 1  {book, books}
;;      c762  mass 1  {pupil, pupils}
;;      c917  mass 1  {ice, ice pellet}
;;     c1018  mass 0.5  {forest, jungle}
;;     c1969  mass 0.5  {silent, silence}
;;     c1021  mass 0.333  {tree, trees}
;;     c1375  mass 0.333  {rotten}
;;     c1992  mass 0.333  {dead, die, death, die down, …}

;; ---- slot follow.Agent  [event center]  n 9  clusters 10
(And (Member $e0 follow) (Agent $e0 $x1))
;;     c1884  mass 2  {bhadala, bhadalas}
;;      c268  mass 1  {muslim house, house, muslim}
;;      c541  mass 1  {road, motorway, roads}
;;      c593  mass 1  {Alexander}
;;      c666  mass 1  {Bailey}
;;      c669  mass 1  {Sami}
;;     c1051  mass 0.5  {crawling}
;;     c1092  mass 0.5  {beast}
;;     c1425  mass 0.5  {house, home, houses}
;;      c269  mass 0.5  {muslim, muslim community, muslims}

;; ---- slot follow.Theme  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Theme $e0 $x1))
;;      c190  mass 2  {region, regions}
;;      c288  mass 2  {tradition, traditions}
;;      c618  mass 1  {Layla}
;;      c624  mass 1  {Margaret Fleming, Martha, Anne, Marie}
;;      c684  mass 1  {Lukas}
;;      c706  mass 1  {Henry Cole}
;;      c808  mass 1  {shore, coast, shoreline}

;; ---- slot hear.Stimulus  [event center]  n 9  clusters 12
(And (Member $e0 hear) (Stimulus $e0 $x1))
;;     c1362  mass 1  {crash}
;;     c1587  mass 1  {shoot, shot}
;;     c1999  mass 1  {bang, burst}
;;     c2004  mass 1  {knock}
;;     c2154  mass 1  {thing, things}
;;     c2222  mass 1  {start, begin}
;;      c859  mass 0.833  {noise, noises}
;;      c852  mass 0.5  {ticking, tick away}
;;      c867  mass 0.5  {upbeat, music, upbeat}
;;      c875  mass 0.5  {music}
;;      c841  mass 0.333  {barking}
;;      c843  mass 0.333  {growling}

;; ---- slot kill.Agent  [event center]  n 9  clusters 6
(And (Member $e0 kill) (Agent $e0 $x1))
;;     c1489  mass 4  {hurricane, hurricane season}
;;     c1089  mass 1  {tiger, lion, lions}
;;      c125  mass 1  {cancer}
;;     c1473  mass 1  {fire, burn, scorch}
;;     c1588  mass 1  {hunter}
;;      c641  mass 1  {Boris, Ivan, Dmitri, Rasputin}

;; ---- slot sing.Agent  [event center]  n 9  clusters 8
(And (Member $e0 sing) (Agent $e0 $x1))
;;     c1154  mass 2  {sister, sisters}
;;     c1161  mass 2  {person, people}
;;     c1065  mass 1  {bird, bird dropping, birds}
;;      c583  mass 1  {actress, actor}
;;      c652  mass 1  {David}
;;      c882  mass 1  {Amateur Barbershop Harmony Society}
;;     c1110  mass 0.5  {profession, professional}
;;     c1697  mass 0.5  {group}

;; ---- slot take.Agent  [event center]  n 9  clusters 8
(And (Member $e0 take) (Agent $e0 $x1))
;;     c1161  mass 2  {person, people}
;;     c2154  mass 1  {thing, things}
;;      c602  mass 1  {Jerry Rawlings}
;;      c609  mass 1  {president, person, president}
;;      c645  mass 1  {Michael, Marco, Marcus}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c687  mass 1  {Janos, Miroslav, Lajos}
;;      c956  mass 1  {cook}

;; ---- slot become.Result  [event center]  n 8  clusters 7
(And (Member $e0 become) (Result $e0 $x1))
;;     c1347  mass 2  {bad, bad, matter, bad, problem}
;;     c1335  mass 1  {alarmed}
;;      c163  mass 1  {lax}
;;     c1738  mass 1  {red}
;;      c462  mass 1  {conservative, conservative, revolutionary}
;;      c630  mass 1  {inomaru, inomaru, person}
;;       c93  mass 1  {indigenous, indigenous, people, native american, indigenous american, …}

;; ---- slot change.Patient  [event center]  n 8  clusters 7
(And (Member $e0 change) (Patient $e0 $x1))
;;     c1504  mass 2  {weather}
;;     c1162  mass 1  {name}
;;     c1487  mass 1  {rain, rainwater, fresh, rain}
;;     c1897  mass 1  {color}
;;     c2154  mass 1  {thing, things}
;;      c736  mass 1  {mind, mental, mental world}
;;      c774  mass 1  {course}

;; ---- slot hear.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 hear) (Experiencer $e0 $x1))
;;      c658  mass 2  {Boldi, Bruno, Frankie}
;;      c640  mass 1  {Oleg, Vladimir}
;;      c651  mass 1  {William, James}
;;      c663  mass 1  {Jonas, John, Jonathan, Jack, …}
;;      c668  mass 1  {Fadil, Jamil}
;;      c688  mass 1  {Adriano, Claudio, Flavio}
;;      c689  mass 1  {Martino, Pietro, Lorenzo, Damiano}

;; ---- slot live.Agent  [event center]  n 8  clusters 8
(And (Member $e0 live) (Agent $e0 $x1))
;;     c1086  mass 1  {wolf, wolves}
;;      c198  mass 1  {Beja}
;;      c646  mass 1  {Mary, Maria}
;;      c674  mass 1  {Ziri, Tiziri}
;;      c675  mass 1  {Yidir}
;;      c679  mass 1  {Elias, Gabriel}
;;      c698  mass 1  {Ray Kurtzweil}
;;      c724  mass 1  {Cainan}

;; ---- slot live.Location  [event center]  n 8  clusters 8
(And (Member $e0 live) (Location $e0 $x1))
;;      c243  mass 2  {Denmark, Norway, Sweden}
;;     c1425  mass 1.5  {house, home, houses}
;;     c1697  mass 1  {group}
;;      c170  mass 1  {southeastern corner}
;;      c182  mass 1  {suburb}
;;     c1598  mass 0.5  {comfortable}
;;     c1799  mass 0.5  {big, large, huge, massive, …}
;;     c2276  mass 0.5  {isolated, secluded}

;; ---- slot need.Experiencer  [event center]  n 8  clusters 8
(And (Member $e0 need) (Experiencer $e0 $x1))
;;      c112  mass 1  {doctor, doctors}
;;     c1196  mass 1  {child, children, kid, kids}
;;      c220  mass 1  {Algeria, Morocco}
;;     c2226  mass 1  {gate}
;;      c649  mass 1  {Karl}
;;      c689  mass 1  {Martino, Pietro, Lorenzo, Damiano}
;;      c713  mass 1  {Yanni}
;;      c975  mass 1  {sauce}

;; ---- slot open.Patient  [event center]  n 8  clusters 4
(And (Member $e0 open) (Patient $e0 $x1))
;;     c1415  mass 4.5  {door, door, open, door, unlocked}
;;      c466  mass 2  {law, laws, legal}
;;      c336  mass 1  {bank}
;;     c1407  mass 0.5  {vault like, door, vault like}

;; ---- slot play.Theme  [event center]  n 8  clusters 7
(And (Member $e0 play) (Theme $e0 $x1))
;;      c300  mass 2  {tennis}
;;      c617  mass 2  {Holly Golightly}
;;     c1569  mass 1  {series}
;;     c1848  mass 1  {role}
;;      c889  mass 1  {harp}
;;     c1850  mass 0.5  {crucial}
;;     c1851  mass 0.5  {important}

;; ---- slot produce.Agent  [event center]  n 8  clusters 6
(And (Member $e0 produce) (Agent $e0 $x1))
;;      c718  mass 4  {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …}
;;      c716  mass 2  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;;      c127  mass 1  {pancreas}
;;     c2024  mass 0.333  {layer}
;;     c2134  mass 0.333  {thin, weak}
;;      c388  mass 0.333  {oil}

;; ---- slot speak.Agent  [event center]  n 8  clusters 6
(And (Member $e0 speak) (Agent $e0 $x1))
;;      c625  mass 2  {Olivia, Sophia}
;;      c678  mass 2  {Oates}
;;     c1178  mass 1  {man, guy}
;;      c598  mass 1  {Xavier}
;;      c631  mass 1  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c726  mass 1  {Kari Wahlgren}

;; ---- slot talk.Agent  [event center]  n 8  clusters 7
(And (Member $e0 talk) (Agent $e0 $x1))
;;      c626  mass 2  {Katherine, Isabella, Kate}
;;     c1132  mass 1  {school janitor}
;;     c1167  mass 1  {friend, friends}
;;      c451  mass 1  {author, writer, novelist}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;      c692  mass 1  {Daniel}
;;      c697  mass 1  {Jordan Peterson}

;; ---- slot use.Agent  [event center]  n 8  clusters 7
(And (Member $e0 use) (Agent $e0 $x1))
;;       c86  mass 2  {localized version, localized versions}
;;       c11  mass 1  {ukrainian army}
;;     c1174  mass 1  {father, Dad, dad}
;;      c195  mass 1  {algerian government}
;;      c606  mass 1  {Churchill}
;;      c735  mass 1  {human brain}
;;      c880  mass 1  {singer}

;; ---- slot walk.Agent  [event center]  n 8  clusters 8
(And (Member $e0 walk) (Agent $e0 $x1))
;;     c1132  mass 1  {school janitor}
;;     c2347  mass 1  {ad, ant}
;;       c62  mass 1  {customer, customers}
;;      c631  mass 1  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c645  mass 1  {Michael, Marco, Marcus}
;;      c659  mass 1  {Felix}
;;      c683  mass 1  {Leon}
;;      c688  mass 1  {Adriano, Claudio, Flavio}

;; ---- slot want.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 want) (Experiencer $e0 $x1))
;;      c588  mass 2  {Aslan}
;;     c1037  mass 1  {cat, cats}
;;      c662  mass 1  {Tony}
;;      c683  mass 1  {Leon}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c686  mass 1  {Benedito}
;;      c973  mass 1  {Pepper}

;; ---- slot work.Agent  [event center]  n 8  clusters 9
(And (Member $e0 work) (Agent $e0 $x1))
;;     c1133  mass 1  {volunteer, volunteers}
;;     c1161  mass 1  {person, people}
;;     c1174  mass 1  {father, Dad, dad}
;;      c641  mass 1  {Boris, Ivan, Dmitri, Rasputin}
;;      c671  mass 1  {Asserson}
;;      c691  mass 1  {Dan}
;;      c702  mass 1  {Mr. Jones}
;;     c1184  mass 0.5  {old, elderly}
;;      c890  mass 0.5  {adaptor, adaptor, old}

;; ---- slot write.Agent  [event center]  n 8  clusters 6
(And (Member $e0 write) (Agent $e0 $x1))
;;     c1161  mass 2.5  {person, people}
;;      c653  mass 2  {Gilles Thibaut}
;;      c718  mass 2  {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …}
;;     c1116  mass 0.5  {busy}
;;     c1174  mass 0.5  {father, Dad, dad}
;;     c1204  mass 0.5  {famous, fame}

;; ---- slot come.Agent  [event center]  n 7  clusters 7
(And (Member $e0 come) (Agent $e0 $x1))
;;     c1178  mass 1  {man, guy}
;;     c1222  mass 1  {country}
;;     c1718  mass 1  {sleep}
;;     c1760  mass 1  {train}
;;     c1775  mass 1  {talk, conversation, discussion}
;;      c515  mass 1  {bus, bus ride}
;;      c763  mass 1  {student, students}

;; ---- slot contain.Agent  [event center]  n 7  clusters 5
(And (Member $e0 contain) (Agent $e0 $x1))
;;      c838  mass 3  {card, deck, cards, deck}
;;      c120  mass 1  {vitamin pill}
;;      c839  mass 1  {chest}
;;      c879  mass 1  {song, sing, chant}
;;      c892  mass 1  {plasma}

;; ---- slot contain.Theme  [event center]  n 7  clusters 8
(And (Member $e0 contain) (Theme $e0 $x1))
;;      c600  mass 2  {king, queen, kings}
;;     c1584  mass 1  {jack, jacks}
;;      c405  mass 1  {electrolyte, electrolytes}
;;      c417  mass 1  {gold coin, gold, gold coins}
;;      c119  mass 0.5  {nutrition}
;;     c1374  mass 0.5  {degrading}
;;     c1792  mass 0.5  {abundant, plenty}
;;      c877  mass 0.5  {lyric, lyrics}

;; ---- slot create.Patient  [event center]  n 7  clusters 6
(And (Member $e0 create) (Patient $e0 $x1))
;;      c751  mass 4  {community}
;;       c51  mass 1  {particle accelerator}
;;     c1245  mass 0.5  {language, english}
;;     c1677  mass 0.5  {schedule, calendar}
;;     c1857  mass 0.5  {new, brand new, new, product}
;;     c2042  mass 0.5  {various}

;; ---- slot form.Agent  [event center]  n 7  clusters 5
(And (Member $e0 form) (Agent $e0 $x1))
;;      c710  mass 4  {Jon Bon Jovi, Sambora}
;;     c1129  mass 1  {labourer, labourers}
;;      c402  mass 1  {technetium}
;;     c1817  mass 0.5  {complex, complex, simple, complicated}
;;     c2138  mass 0.5  {simple}

;; ---- slot get.Patient  [event center]  n 7  clusters 12
(And (Member $e0 get) (Patient $e0 $x1))
;;     c1347  mass 1  {bad, bad, matter, bad, problem}
;;      c219  mass 1  {Afghanistan, Iran, Iraq, Persia}
;;     c1339  mass 0.5  {excuse}
;;     c1473  mass 0.5  {fire, burn, scorch}
;;     c1504  mass 0.5  {weather}
;;     c1647  mass 0.5  {expensive, expensive, thing}
;;     c1648  mass 0.5  {cheap, inexpensive, low, price}
;;     c1721  mass 0.5  {day, days, days, short}
;;     c1764  mass 0.5  {problem, problems}
;;     c1799  mass 0.5  {big, large, huge, massive, …}
;;     c2140  mass 0.5  {short, shortening}
;;     c2154  mass 0.5  {thing, things}

;; ---- slot make.Result  [event center]  n 7  clusters 8
(And (Member $e0 make) (Result $e0 $x1))
;;     c1324  mass 1  {uncomfortable}
;;     c1347  mass 1  {bad, bad, matter, bad, problem}
;;     c1357  mass 1  {dangerous, hazardous}
;;     c1628  mass 1  {beautiful, gorgeous, pretty}
;;     c1896  mass 1  {black, white}
;;      c600  mass 1  {king, queen, kings}
;;     c1222  mass 0.5  {country}
;;     c2329  mass 0.5  {back, backward, before, past}

;; ---- slot sell.Theme  [event center]  n 7  clusters 8
(And (Member $e0 sell) (Theme $e0 $x1))
;;      c916  mass 2  {ice cream, ice cone, ice cream cone}
;;     c1827  mass 1  {copy, copies}
;;     c2154  mass 1  {thing, things}
;;      c939  mass 1  {milk}
;;     c1544  mass 0.5  {cell phone, mobile phone, cell phone, new}
;;     c1857  mass 0.5  {new, brand new, new, product}
;;      c955  mass 0.5  {roast, roasted}
;;      c983  mass 0.5  {bean}

;; ---- slot serve.Theme  [event center]  n 7  clusters 4
(And (Member $e0 serve) (Theme $e0 $x1))
;;      c164  mass 3  {Springfield Station}
;;      c149  mass 2  {Baltimore, Boston, Springfield}
;;     c1315  mass 1  {revenge}
;;       c66  mass 1  {coffee, coffee, strong}

;; ---- slot try.Theme  [event center]  n 7  clusters 7
(And (Member $e0 try) (Theme $e0 $x1))
;;     c1898  mass 1  {burnish}
;;     c2202  mass 1  {pull}
;;     c2210  mass 1  {reach}
;;     c2323  mass 1  {give up}
;;      c361  mass 1  {steal}
;;      c379  mass 1  {abuse}
;;       c58  mass 1  {call, telephone call}

;; ---- slot turn.Patient  [event center]  n 7  clusters 11
(And (Member $e0 turn) (Patient $e0 $x1))
;;     c1731  mass 1  {war, world war}
;;       c23  mass 1  {russian speech, russian}
;;      c541  mass 1  {road, motorway, roads}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;     c1405  mass 0.5  {ceiling, black, ceiling}
;;     c1896  mass 0.5  {black, white}
;;      c456  mass 0.5  {gusher}
;;      c459  mass 0.5  {freedom movement, freedom}
;;     c1003  mass 0.333  {leaf, foliage, leaves}
;;     c1738  mass 0.333  {red}
;;     c1892  mass 0.333  {yellow, orange}

;; ---- slot win.Agent  [event center]  n 7  clusters 4
(And (Member $e0 win) (Agent $e0 $x1))
;;      c607  mass 3  {Wilson, wilson}
;;      c699  mass 2  {James Woods, Jeremy Irons}
;;     c1078  mass 1  {horse}
;;     c1690  mass 1  {away team}

;; ---- slot <unclassed>.Only  [entity center]  n 6  clusters 4
(Only $x0 $x1)
;;     c2239  mass 2  {have, possess}
;;     c2357  mass 2  {find, found}
;;     c1151  mass 1  {solve}
;;     c2334  mass 1  {like, prefer}

;; ---- slot appear.Agent  [event center]  n 6  clusters 3
(And (Member $e0 appear) (Agent $e0 $x1))
;;     c1161  mass 3  {person, people}
;;      c716  mass 2  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;;     c1154  mass 1  {sister, sisters}

;; ---- slot bear.Patient  [event center]  n 6  clusters 5
(And (Member $e0 bear) (Patient $e0 $x1))
;;     c1161  mass 3  {person, people}
;;      c590  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c680  mass 1  {Tobias}
;;     c1178  mass 0.5  {man, guy}
;;     c1349  mass 0.5  {poor, poorly}

;; ---- slot build.Instrument  [event center]  n 6  clusters 4
(And (Member $e0 build) (Instrument $e0 $x1))
;;     c1509  mass 2  {barometer}
;;     c2207  mass 2  {help, support}
;;     c1529  mass 1.5  {presented in scale, scale, presented, scale}
;;     c2264  mass 0.5  {present, presented}

;; ---- slot capture.Theme  [event center]  n 6  clusters 6
(And (Member $e0 capture) (Theme $e0 $x1))
;;     c1060  mass 1  {magpie}
;;       c12  mass 1  {ship, merchant ship, modern ship}
;;     c1212  mass 1  {Valerian}
;;       c13  mass 1  {british ship}
;;      c177  mass 1  {capital, provincial capital}
;;      c199  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}

;; ---- slot cause.Agent  [event center]  n 6  clusters 6
(And (Member $e0 cause) (Agent $e0 $x1))
;;     c1042  mass 1  {demon, devil}
;;     c1491  mass 1  {storm, thunder}
;;     c2154  mass 1  {thing, things}
;;      c443  mass 1  {news}
;;      c537  mass 1  {walk}
;;      c801  mass 1  {tide, tides}

;; ---- slot create.Agent  [event center]  n 6  clusters 4
(And (Member $e0 create) (Agent $e0 $x1))
;;       c93  mass 2  {indigenous, indigenous, people, native american, indigenous american, …}
;;       c99  mass 2  {european american settler, european american settlers}
;;      c451  mass 1  {author, writer, novelist}
;;      c635  mass 1  {Paul, Paulus}

;; ---- slot enter.Agent  [event center]  n 6  clusters 5
(And (Member $e0 enter) (Agent $e0 $x1))
;;      c776  mass 2  {Issaquah Creek, Lake Sammamish}
;;     c1161  mass 1  {person, people}
;;      c269  mass 1  {muslim, muslim community, muslims}
;;      c618  mass 1  {Layla}
;;      c689  mass 1  {Martino, Pietro, Lorenzo, Damiano}

;; ---- slot form.Patient  [event center]  n 6  clusters 6
(And (Member $e0 form) (Patient $e0 $x1))
;;      c866  mass 2.5  {main songwriting unit, songwriting unit, main, songwriting unit}
;;      c402  mass 1  {technetium}
;;      c566  mass 1  {human barricade}
;;     c1817  mass 0.5  {complex, complex, simple, complicated}
;;     c2138  mass 0.5  {simple}
;;     c2203  mass 0.5  {master, main}

;; ---- slot fund.Agent  [event center]  n 6  clusters 3
(And (Member $e0 fund) (Agent $e0 $x1))
;;      c247  mass 3  {JICA}
;;      c493  mass 2  {government, govern}
;;      c203  mass 1  {Government of Kenya, Government of Uganda}

;; ---- slot get.Agent  [event center]  n 6  clusters 7
(And (Member $e0 get) (Agent $e0 $x1))
;;     c2154  mass 1  {thing, things}
;;      c644  mass 1  {Leonid}
;;      c679  mass 1  {Elias, Gabriel}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c687  mass 1  {Janos, Miroslav, Lajos}
;;     c1178  mass 0.5  {man, guy}
;;     c1191  mass 0.5  {young}

;; ---- slot get.Result  [event center]  n 6  clusters 6
(And (Member $e0 get) (Result $e0 $x1))
;;     c1347  mass 1  {bad, bad, matter, bad, problem}
;;     c1647  mass 1  {expensive, expensive, thing}
;;     c1648  mass 1  {cheap, inexpensive, low, price}
;;     c1807  mass 1  {powerful, power}
;;     c2140  mass 1  {short, shortening}
;;     c2221  mass 1  {ready}

;; ---- slot help.Agent  [event center]  n 6  clusters 6
(And (Member $e0 help) (Agent $e0 $x1))
;;     c1468  mass 1  {hothouse condition, hothouse conditions}
;;     c2053  mass 1  {life experience}
;;     c2149  mass 1  {context}
;;      c645  mass 1  {Michael, Marco, Marcus}
;;      c663  mass 1  {Jonas, John, Jonathan, Jack, …}
;;      c693  mass 1  {Karen, Ken}

;; ---- slot receive.Theme  [event center]  n 6  clusters 6
(And (Member $e0 receive) (Theme $e0 $x1))
;;     c1113  mass 2  {work, job}
;;     c2199  mass 1  {award}
;;     c2317  mass 1  {permit, permitted}
;;     c2380  mass 1  {honorary knighthood}
;;     c1857  mass 0.5  {new, brand new, new, product}
;;      c522  mass 0.5  {car, motor vehicle, vehicle, motor vehicles, …}

;; ---- slot run.Agent  [event center]  n 6  clusters 5
(And (Member $e0 run) (Agent $e0 $x1))
;;      c707  mass 2  {George Allen, James David Edgar, Chuck Robb}
;;     c1079  mass 1  {goat, sheep}
;;     c1085  mass 1  {squirrel}
;;      c112  mass 1  {doctor, doctors}
;;      c680  mass 1  {Tobias}

;; ---- slot sleep.Experiencer  [event center]  n 6  clusters 4
(And (Member $e0 sleep) (Experiencer $e0 $x1))
;;     c1037  mass 2  {cat, cats}
;;     c1196  mass 2  {child, children, kid, kids}
;;     c1033  mass 1  {dog, dog feed}
;;      c633  mass 1  {Baya, Iga, Keike}

;; ---- slot speak.Theme  [event center]  n 6  clusters 5
(And (Member $e0 speak) (Theme $e0 $x1))
;;      c670  mass 2  {Ashe}
;;     c1245  mass 1.5  {language, english}
;;     c1899  mass 1  {polish}
;;       c24  mass 1  {czech}
;;      c480  mass 0.5  {foreign, foreigner}

;; ---- slot start.Agent  [event center]  n 6  clusters 7
(And (Member $e0 start) (Agent $e0 $x1))
;;     c1132  mass 1  {school janitor}
;;     c1199  mass 1  {girl, girls}
;;      c632  mass 1  {Skura, Inomaru, Barako}
;;      c649  mass 1  {Karl}
;;      c956  mass 1  {cook}
;;     c1272  mass 0.5  {crowd, crowd, whole}
;;     c2289  mass 0.5  {whole, entire, thing, whole}

;; ---- slot study.Location  [event center]  n 6  clusters 4
(And (Member $e0 study) (Location $e0 $x1))
;;      c597  mass 2  {Davis Studio}
;;      c599  mass 2  {Julian Ashton Art School}
;;      c160  mass 1  {Munich}
;;      c765  mass 1  {university, campus, college}

;; ---- slot write.CoAgent  [event center]  n 6  clusters 3
(And (Member $e0 write) (CoAgent $e0 $x1))
;;      c620  mass 2  {Laurie Aubanel, Muriel Zazoui, Patricia Kaas}
;;      c621  mass 2  {Bianca Olsen}
;;      c720  mass 2  {Cyril Rambour}

;; ---- slot add.Agent  [event center]  n 5  clusters 4
(And (Member $e0 add) (Agent $e0 $x1))
;;     c2154  mass 2  {thing, things}
;;     c1012  mass 1  {plant, plants}
;;      c708  mass 1  {J. Augustus Knapp}
;;      c956  mass 1  {cook}

;; ---- slot appear.Location  [event center]  n 5  clusters 4
(And (Member $e0 appear) (Location $e0 $x1))
;;       c68  mass 2  {cafe}
;;     c1233  mass 1  {comedic role}
;;      c252  mass 1  {musical film}
;;        c6  mass 1  {Coronation Street}

;; ---- slot buy.Theme  [event center]  n 5  clusters 7
(And (Member $e0 buy) (Theme $e0 $x1))
;;     c1425  mass 1  {house, home, houses}
;;     c1549  mass 1  {computer}
;;      c968  mass 1  {food, eat}
;;     c1892  mass 0.5  {yellow, orange}
;;     c1893  mass 0.5  {blue, purple}
;;      c428  mass 0.5  {trouser, trousers}
;;      c431  mass 0.5  {shirt}

;; ---- slot cry.Agent  [event center]  n 5  clusters 5
(And (Member $e0 cry) (Agent $e0 $x1))
;;     c1199  mass 1  {girl, girls}
;;      c632  mass 1  {Skura, Inomaru, Barako}
;;      c633  mass 1  {Baya, Iga, Keike}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c817  mass 1  {Rima}

;; ---- slot direct.Agent  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Agent $e0 $x1))
;;      c715  mass 2  {Lev L. Spiro}
;;      c614  mass 1  {Claude Lelouch}
;;      c717  mass 1  {Jason Suecof, Nick De Caro, Robert Day, Matt Brown, …}
;;      c888  mass 1  {conductor}

;; ---- slot direct.Patient  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Patient $e0 $x1))
;;     c1570  mass 2  {episode}
;;      c251  mass 1.5  {movie, film}
;;     c2154  mass 1  {thing, things}
;;      c250  mass 0.5  {syrian film, film, syrian film, destined, film, syrian film}

;; ---- slot draw.Agent  [event center]  n 5  clusters 3
(And (Member $e0 draw) (Agent $e0 $x1))
;;     c1196  mass 2  {child, children, kid, kids}
;;      c705  mass 2  {Cowper}
;;     c1280  mass 1  {concert}

;; ---- slot eat.Patient  [event center]  n 5  clusters 4
(And (Member $e0 eat) (Patient $e0 $x1))
;;      c897  mass 2  {cookie, cookie jar, cookies}
;;     c1084  mass 1  {rabbit, rat, hamster}
;;      c950  mass 1  {bake, bakery, bread}
;;      c959  mass 1  {chicken}

;; ---- slot fly.Agent  [event center]  n 5  clusters 5
(And (Member $e0 fly) (Agent $e0 $x1))
;;     c1057  mass 1  {insect, insects}
;;     c1063  mass 1  {eagle}
;;      c504  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c596  mass 1  {Superman}
;;      c813  mass 1  {pace, rocket, space mission, space}

;; ---- slot include.Theme  [event center]  n 5  clusters 5
(And (Member $e0 include) (Theme $e0 $x1))
;;      c107  mass 1  {extradition clause}
;;      c570  mass 1  {Armaan Jain}
;;      c571  mass 1  {Ranbir Kapoor}
;;      c572  mass 1  {Nikhil Nanda}
;;      c884  mass 1  {marching band, marching bands}

;; ---- slot lead.Agent  [event center]  n 5  clusters 4
(And (Member $e0 lead) (Agent $e0 $x1))
;;     c2154  mass 2  {thing, things}
;;     c1033  mass 1  {dog, dog feed}
;;     c1822  mass 1  {general, general purpose}
;;      c766  mass 1  {school, education}

;; ---- slot lead.Goal  [event center]  n 5  clusters 7
(And (Member $e0 lead) (Goal $e0 $x1))
;;     c1425  mass 1  {house, home, houses}
;;     c1605  mass 1  {pacificat, pacificats, peace}
;;     c1613  mass 1  {happiness, happy, happily, joy}
;;     c1036  mass 0.5  {cat fight, big, cat fight}
;;     c1213  mass 0.5  {glory, glory, lost}
;;     c1799  mass 0.5  {big, large, huge, massive, …}
;;     c2322  mass 0.5  {lose, lost, fail}

;; ---- slot marry.Agent  [event center]  n 5  clusters 4
(And (Member $e0 marry) (Agent $e0 $x1))
;;      c624  mass 2  {Margaret Fleming, Martha, Anne, Marie}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;      c654  mass 1  {James of Barrochan}
;;      c722  mass 1  {Steve}

;; ---- slot need.Theme  [event center]  n 5  clusters 5
(And (Member $e0 need) (Theme $e0 $x1))
;;     c1523  mass 1  {paint, painting}
;;     c1753  mass 1  {run, runner}
;;     c2009  mass 1  {generate}
;;     c2039  mass 1  {understand, misunderstand}
;;       c81  mass 1  {go}

;; ---- slot portray.Agent  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Agent $e0 $x1))
;;      c607  mass 2  {Wilson, wilson}
;;      c631  mass 2  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c699  mass 1  {James Woods, Jeremy Irons}

;; ---- slot portray.Theme  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Theme $e0 $x1))
;;      c634  mass 2  {Kantaro Suga}
;;      c699  mass 2  {James Woods, Jeremy Irons}
;;      c607  mass 1  {Wilson, wilson}

;; ---- slot present.Theme  [event center]  n 5  clusters 4
(And (Member $e0 present) (Theme $e0 $x1))
;;      c879  mass 2  {song, sing, chant}
;;     c1524  mass 1  {picture, image}
;;     c1773  mass 1  {play}
;;     c1874  mass 1  {golden opportunity}

;; ---- slot provide.Agent  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Agent $e0 $x1))
;;     c1271  mass 1  {witness, witnesses}
;;     c1670  mass 1  {organisation}
;;      c324  mass 1  {power station}
;;      c440  mass 1  {media}
;;      c935  mass 1  {kitchen island}

;; ---- slot provide.Theme  [event center]  n 5  clusters 7
(And (Member $e0 provide) (Theme $e0 $x1))
;;     c1243  mass 1  {plurivocality}
;;      c322  mass 1  {electricity}
;;      c968  mass 1  {food, eat}
;;     c1567  mass 0.5  {counter space, counter space, extra}
;;     c1663  mass 0.5  {detailed}
;;     c1664  mass 0.5  {description}
;;     c2258  mass 0.5  {extra}

;; ---- slot ready.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 ready) (Experiencer $e0 $x1))
;;      c632  mass 1  {Skura, Inomaru, Barako}
;;      c644  mass 1  {Leonid}
;;      c713  mass 1  {Yanni}
;;      c952  mass 1  {cake, pie}
;;      c964  mass 1  {dinner, dinner table}

;; ---- slot sell.Agent  [event center]  n 5  clusters 5
(And (Member $e0 sell) (Agent $e0 $x1))
;;     c1119  mass 2  {company, corporation}
;;      c441  mass 1  {newspaper, newspapers}
;;      c672  mass 1  {Mennad, Lessos}
;;     c1219  mass 0.5  {indie}
;;       c65  mass 0.5  {coffee brand, coffee brand, indie}

;; ---- slot sing.Theme  [event center]  n 5  clusters 2
(And (Member $e0 sing) (Theme $e0 $x1))
;;      c875  mass 4  {music}
;;      c879  mass 1  {song, sing, chant}

;; ---- slot sing.To  [event center]  n 5  clusters 3
(And (Member $e0 sing) (To $e0 $x1))
;;     c1937  mass 4  {accompany}
;;     c1352  mass 0.5  {sad}
;;      c875  mass 0.5  {music}

;; ---- slot sleep.Location  [event center]  n 5  clusters 3
(And (Member $e0 sleep) (Location $e0 $x1))
;;     c1436  mass 3  {couch}
;;     c1145  mass 1  {mat, mathematics}
;;     c2075  mass 1  {inside, into}

;; ---- slot stand.Experiencer  [event center]  n 5  clusters 3
(And (Member $e0 stand) (Experiencer $e0 $x1))
;;      c685  mass 3  {Gustavo, Alberto, Diego, Rodrigo, …}
;;     c1822  mass 1  {general, general purpose}
;;      c763  mass 1  {student, students}

;; ---- slot start.Experiencer  [event center]  n 5  clusters 4
(And (Member $e0 start) (Experiencer $e0 $x1))
;;      c174  mass 2  {bridge}
;;      c640  mass 1  {Oleg, Vladimir}
;;      c682  mass 1  {Gunter}
;;      c732  mass 1  {tunnel}

;; ---- slot study.Theme  [event center]  n 5  clusters 6
(And (Member $e0 study) (Theme $e0 $x1))
;;      c202  mass 1  {Arabic}
;;     c2252  mass 1  {rate}
;;      c319  mass 1  {mechanical engineering}
;;      c471  mass 1  {canon law}
;;      c130  mass 0.5  {bacterium, bacterium, new}
;;     c1857  mass 0.5  {new, brand new, new, product}

;; ---- slot swim.Agent  [event center]  n 5  clusters 5
(And (Member $e0 swim) (Agent $e0 $x1))
;;     c1029  mass 1.5  {fish, salmon}
;;     c1196  mass 1  {child, children, kid, kids}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;      c766  mass 1  {school, education}
;;     c1738  mass 0.5  {red}

;; ---- slot travel.Agent  [event center]  n 5  clusters 4
(And (Member $e0 travel) (Agent $e0 $x1))
;;     c1161  mass 2  {person, people}
;;      c488  mass 1  {campaigner}
;;      c648  mass 1  {Matthew}
;;      c664  mass 1  {Roger, Bob, Bobby, Robbie, …}

;; ---- slot turn.Result  [event center]  n 5  clusters 5
(And (Member $e0 turn) (Result $e0 $x1))
;;     c1062  mass 1  {crow, caw}
;;     c1738  mass 1  {red}
;;     c1892  mass 1  {yellow, orange}
;;     c1896  mass 1  {black, white}
;;      c456  mass 1  {gusher}

;; ---- slot watch.Agent  [event center]  n 5  clusters 5
(And (Member $e0 watch) (Agent $e0 $x1))
;;     c1161  mass 1  {person, people}
;;     c1163  mass 1  {family, families}
;;      c493  mass 1  {government, govern}
;;      c633  mass 1  {Baya, Iga, Keike}
;;      c761  mass 1  {coach}

;; ---- slot win.Theme  [event center]  n 5  clusters 2
(And (Member $e0 win) (Theme $e0 $x1))
;;      c582  mass 4  {emmy}
;;      c380  mass 1  {race}

;; ---- slot bad.Between  [entity center]  n 4  clusters 2
(And (Member $x0 bad) (Between $x0 $x1))
;;      c242  mass 2  {Estonia, Poland}
;;      c244  mass 2  {Germany}

;; ---- slot beauty.Possession  [entity center]  n 4  clusters 4
(And (Member $x0 beauty) (Possession $x0 $x1))
;;     c1139  mass 1  {sex, sexually}
;;     c1289  mass 1  {sight}
;;      c778  mass 1  {lake, Lake Towada, Lake Akan}
;;      c825  mass 1  {landscape, scenery}

;; ---- slot family.Possession  [entity center]  n 4  clusters 1
(And (Member $x0 family) (Possession $x0 $x1))
;;     c1161  mass 4  {person, people}

;; ---- slot northern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 northern) (LocatedIn $x0 $x1))
;;      c224  mass 2  {India, Indonesia}
;;      c242  mass 2  {Estonia, Poland}

;; ---- slot southern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 southern) (LocatedIn $x0 $x1))
;;      c211  mass 2  {North Africa, Africa}
;;      c224  mass 2  {India, Indonesia}

;; ---- slot accompany.Agent  [event center]  n 4  clusters 2
(And (Member $e0 accompany) (Agent $e0 $x1))
;;     c1154  mass 2  {sister, sisters}
;;     c1161  mass 2  {person, people}

;; ---- slot accompany.Theme  [event center]  n 4  clusters 1
(And (Member $e0 accompany) (Theme $e0 $x1))
;;      c253  mass 4  {silent film}

;; ---- slot active.Time  [event center]  n 4  clusters 2
(And (Member $e0 active) (Time $e0 $x1))
;;     c1709  mass 2  {morning, early morning, this morning}
;;     c1723  mass 2  {evening, late afternoon}

;; ---- slot add.Theme  [event center]  n 4  clusters 3
(And (Member $e0 add) (Theme $e0 $x1))
;;     c1521  mass 2  {illustration, illustrations, illustrate}
;;     c1005  mass 1  {green, greenery}
;;      c971  mass 1  {clove, cloves}

;; ---- slot arrive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 arrive) (Agent $e0 $x1))
;;      c509  mass 1  {paris train}
;;      c517  mass 1  {drive, driver}
;;      c656  mass 1  {Donald}
;;       c80  mass 1  {spring}

;; ---- slot avoid.Theme  [event center]  n 4  clusters 4
(And (Member $e0 avoid) (Theme $e0 $x1))
;;     c1342  mass 1  {pitfall, pitfalls}
;;     c2154  mass 1  {thing, things}
;;     c2299  mass 1  {conform}
;;      c340  mass 1  {bankruptcy}

;; ---- slot bad.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 bad) (Experiencer $e0 $x1))
;;     c1347  mass 2  {bad, bad, matter, bad, problem}
;;     c1169  mass 1  {relationship, relationships}
;;     c1504  mass 0.5  {weather}
;;     c2153  mass 0.5  {matter, mass}

;; ---- slot bear.Location  [event center]  n 4  clusters 3
(And (Member $e0 bear) (Location $e0 $x1))
;;      c158  mass 2  {Stockholm, Bromma}
;;      c243  mass 1  {Denmark, Norway, Sweden}
;;      c793  mass 1  {Earth, planet, earth}

;; ---- slot begin.Patient  [event center]  n 4  clusters 4
(And (Member $e0 begin) (Patient $e0 $x1))
;;     c1021  mass 1  {tree, trees}
;;     c1724  mass 1  {night, tonight, midnight}
;;     c1744  mass 1  {uprising}
;;      c766  mass 1  {school, education}

;; ---- slot bring.Theme  [event center]  n 4  clusters 4
(And (Member $e0 bring) (Theme $e0 $x1))
;;       c13  mass 1  {british ship}
;;       c18  mass 1  {chinese dumpling}
;;     c1821  mass 1  {advantage}
;;      c663  mass 1  {Jonas, John, Jonathan, Jack, …}

;; ---- slot capture.Agent  [event center]  n 4  clusters 4
(And (Member $e0 capture) (Agent $e0 $x1))
;;     c1070  mass 1  {falcon}
;;      c238  mass 1  {Spain}
;;      c367  mass 1  {pirate, pirates}
;;      c563  mass 1  {troop}

;; ---- slot cause.Patient  [event center]  n 4  clusters 5
(And (Member $e0 cause) (Patient $e0 $x1))
;;     c1367  mass 1  {damage}
;;       c52  mass 1  {earthquake, earthquakes}
;;       c56  mass 1  {abandonment anxiety}
;;      c860  mass 0.5  {sound, sound wave}
;;      c862  mass 0.5  {creaking, creaking, sound}

;; ---- slot change.Agent  [event center]  n 4  clusters 4
(And (Member $e0 change) (Agent $e0 $x1))
;;     c1003  mass 1  {leaf, foliage, leaves}
;;     c1178  mass 1  {man, guy}
;;      c233  mass 1  {French Dahomey}
;;      c605  mass 1  {Cameron}

;; ---- slot close.Experiencer  [event center]  n 4  clusters 2
(And (Member $e0 close) (Experiencer $e0 $x1))
;;       c28  mass 3  {Low German}
;;      c658  mass 1  {Boldi, Bruno, Frankie}

;; ---- slot come.Source  [event center]  n 4  clusters 4
(And (Member $e0 come) (Source $e0 $x1))
;;     c1002  mass 1  {garden}
;;     c1432  mass 1  {place, places}
;;     c1757  mass 1  {treeline}
;;      c285  mass 1  {greek}

;; ---- slot connect.Theme  [event center]  n 4  clusters 2
(And (Member $e0 connect) (Theme $e0 $x1))
;;      c144  mass 2  {Tokyo, Nagoya, Narita, Osaka}
;;      c784  mass 2  {Kayalar}

;; ---- slot create.Location  [event center]  n 4  clusters 1
(And (Member $e0 create) (Location $e0 $x1))
;;     c1556  mass 4  {post, blog}

;; ---- slot decide.Agent  [event center]  n 4  clusters 3
(And (Member $e0 decide) (Agent $e0 $x1))
;;      c642  mass 2  {Fyodor}
;;      c627  mass 1  {Jessica, Beth}
;;      c679  mass 1  {Elias, Gabriel}

;; ---- slot design.Agent  [event center]  n 4  clusters 3
(And (Member $e0 design) (Agent $e0 $x1))
;;      c718  mass 2  {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …}
;;       c16  mass 1  {Robert Allan Limited}
;;      c716  mass 1  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}

;; ---- slot design.Patient  [event center]  n 4  clusters 2
(And (Member $e0 design) (Patient $e0 $x1))
;;     c1605  mass 2  {pacificat, pacificats, peace}
;;     c2154  mass 2  {thing, things}

;; ---- slot die.Patient  [event center]  n 4  clusters 2
(And (Member $e0 die) (Patient $e0 $x1))
;;     c1161  mass 3  {person, people}
;;     c1163  mass 1  {family, families}

;; ---- slot discover.Theme  [event center]  n 4  clusters 5
(And (Member $e0 discover) (Theme $e0 $x1))
;;     c1162  mass 2  {name}
;;       c41  mass 1  {pterosaur egg, pterosaur eggs}
;;     c1853  mass 0.333  {magnet, magnet, new, type}
;;     c1857  mass 0.333  {new, brand new, new, product}
;;     c2022  mass 0.333  {type}

;; ---- slot do.Patient  [event center]  n 4  clusters 4
(And (Member $e0 do) (Patient $e0 $x1))
;;     c2154  mass 2  {thing, things}
;;      c962  mass 1  {dish, plate}
;;     c1229  mass 0.5  {dance}
;;     c2135  mass 0.5  {little, small, minor}

;; ---- slot eat.Agent  [event center]  n 4  clusters 5
(And (Member $e0 eat) (Agent $e0 $x1))
;;     c1065  mass 1  {bird, bird dropping, birds}
;;     c1161  mass 1  {person, people}
;;     c1196  mass 1  {child, children, kid, kids}
;;     c1033  mass 0.5  {dog, dog feed}
;;     c1895  mass 0.5  {brown, gray}

;; ---- slot encourage.In  [event center]  n 4  clusters 2
(And (Member $e0 encourage) (In $e0 $x1))
;;     c1145  mass 2  {mat, mathematics}
;;      c303  mass 2  {chess, chess play}

;; ---- slot enter.Theme  [event center]  n 4  clusters 4
(And (Member $e0 enter) (Theme $e0 $x1))
;;     c1410  mass 1  {cave}
;;      c227  mass 1  {United States, U.S., USA}
;;      c530  mass 1  {park, parking lot, parking}
;;      c776  mass 1  {Issaquah Creek, Lake Sammamish}

;; ---- slot find.Agent  [event center]  n 4  clusters 3
(And (Member $e0 find) (Agent $e0 $x1))
;;      c526  mass 2  {Couper}
;;      c688  mass 1  {Adriano, Claudio, Flavio}
;;      c689  mass 1  {Martino, Pietro, Lorenzo, Damiano}

;; ---- slot get.Theme  [event center]  n 4  clusters 5
(And (Member $e0 get) (Theme $e0 $x1))
;;     c1084  mass 1  {rabbit, rat, hamster}
;;      c357  mass 1  {arrest}
;;      c969  mass 1  {snack}
;;     c1649  mass 0.5  {price, prices}
;;     c2136  mass 0.5  {low}

;; ---- slot give.Theme  [event center]  n 4  clusters 5
(And (Member $e0 give) (Theme $e0 $x1))
;;     c2154  mass 1  {thing, things}
;;      c915  mass 1  {mock champagne}
;;      c920  mass 1  {chocolate}
;;     c1820  mass 0.5  {advice, advise, advice, good}
;;     c2308  mass 0.5  {good, nice, pleasant, positive}

;; ---- slot good.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 good) (Experiencer $e0 $x1))
;;     c1504  mass 1  {weather}
;;     c2154  mass 1  {thing, things}
;;      c499  mass 1  {windshield}
;;      c942  mass 1  {barley, barley bread}

;; ---- slot help.Theme  [event center]  n 4  clusters 4
(And (Member $e0 help) (Theme $e0 $x1))
;;     c1161  mass 1  {person, people}
;;     c1199  mass 1  {girl, girls}
;;     c1791  mass 1  {thrive}
;;     c2020  mass 1  {define}

;; ---- slot include.Agent  [event center]  n 4  clusters 2
(And (Member $e0 include) (Agent $e0 $x1))
;;     c1193  mass 3  {nephew, nephews}
;;     c1216  mass 1  {parade}

;; ---- slot increase.Patient  [event center]  n 4  clusters 4
(And (Member $e0 increase) (Patient $e0 $x1))
;;       c10  mass 1  {ukrainian combat loss, ukrainian combat losses}
;;      c326  mass 1  {industrial output}
;;      c381  mass 1  {xenophobia}
;;      c522  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}

;; ---- slot jump.Agent  [event center]  n 4  clusters 6
(And (Member $e0 jump) (Agent $e0 $x1))
;;     c1077  mass 1  {donkey}
;;     c1080  mass 1  {cow, calf}
;;     c1194  mass 1  {boy, boys}
;;     c1087  mass 0.333  {fox, ox}
;;     c1895  mass 0.333  {brown, gray}
;;     c2283  mass 0.333  {quickly, quick, fast}

;; ---- slot kill.Location  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Location $e0 $x1))
;;      c496  mass 3  {state}
;;     c2205  mass 1  {here}

;; ---- slot kill.Manner  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Manner $e0 $x1))
;;     c1926  mass 2  {indirectly}
;;     c2339  mass 2  {direct, straight, directly}

;; ---- slot lie.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 lie) (Experiencer $e0 $x1))
;;     c1543  mass 1  {notebook}
;;     c2240  mass 1  {pen}
;;      c448  mass 1  {book, books}
;;      c850  mass 1  {tape recorder}

;; ---- slot lie.Location  [event center]  n 4  clusters 1
(And (Member $e0 lie) (Location $e0 $x1))
;;     c1542  mass 4  {table}

;; ---- slot look.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 look) (Experiencer $e0 $x1))
;;      c210  mass 1  {Europe, Western Europe}
;;      c547  mass 1  {flag}
;;      c766  mass 1  {school, education}
;;      c807  mass 1  {island, Derwent Isle}

;; ---- slot look.Like  [event center]  n 4  clusters 6
(And (Member $e0 look) (Like $e0 $x1))
;;     c1215  mass 1  {paradise}
;;      c355  mass 1  {imprison, jail, prison}
;;     c1053  mass 0.5  {spider, huge, spider, spiders}
;;     c1799  mass 0.5  {big, large, huge, massive, …}
;;     c2369  mass 0.5  {inverted}
;;      c546  mass 0.5  {philippine flag, inverted, philippine flag}

;; ---- slot move.Agent  [event center]  n 4  clusters 4
(And (Member $e0 move) (Agent $e0 $x1))
;;     c1128  mass 2  {headquarters}
;;      c667  mass 1  {Sammy}
;;     c1029  mass 0.5  {fish, salmon}
;;      c766  mass 0.5  {school, education}

;; ---- slot perform.Location  [event center]  n 4  clusters 3
(And (Member $e0 perform) (Location $e0 $x1))
;;       c68  mass 2  {cafe}
;;     c1425  mass 1  {house, home, houses}
;;     c2167  mass 1  {public}

;; ---- slot preach.Agent  [event center]  n 4  clusters 1
(And (Member $e0 preach) (Agent $e0 $x1))
;;     c1161  mass 4  {person, people}

;; ---- slot preach.Location  [event center]  n 4  clusters 2
(And (Member $e0 preach) (Location $e0 $x1))
;;      c157  mass 2  {Gareccio, Bologna}
;;      c237  mass 2  {Italy}

;; ---- slot present.Agent  [event center]  n 4  clusters 3
(And (Member $e0 present) (Agent $e0 $x1))
;;      c677  mass 2  {Horner}
;;     c1119  mass 1  {company, corporation}
;;     c1874  mass 1  {golden opportunity}

;; ---- slot receive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 receive) (Agent $e0 $x1))
;;      c105  mass 1  {refugee, refugees}
;;     c2198  mass 1  {win, winner}
;;      c559  mass 1  {General Franks}
;;      c627  mass 1  {Jessica, Beth}

;; ---- slot replace.Agent  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Agent $e0 $x1))
;;      c718  mass 2  {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …}
;;     c1161  mass 1  {person, people}
;;      c719  mass 1  {Corentin Rahier, Peter Gaussen, Van Bavel}

;; ---- slot replace.Theme  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Theme $e0 $x1))
;;      c595  mass 2  {Lex Lex Luthor, Lex Luthor}
;;     c1161  mass 1  {person, people}
;;      c716  mass 1  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}

;; ---- slot require.Theme  [event center]  n 4  clusters 6
(And (Member $e0 require) (Theme $e0 $x1))
;;      c321  mass 1  {repair, repairs}
;;       c60  mass 1  {american phone number}
;;     c1113  mass 0.5  {work, job}
;;     c1818  mass 0.5  {difficult, hard, difficulty, harder}
;;     c2352  mass 0.5  {valid}
;;      c837  mass 0.5  {id card, id card, valid}

;; ---- slot specify.In  [event center]  n 4  clusters 2
(And (Member $e0 specify) (In $e0 $x1))
;;     c1379  mass 2  {continuous time}
;;     c1380  mass 2  {discrete time}

;; ---- slot spend.Agent  [event center]  n 4  clusters 3
(And (Member $e0 spend) (Agent $e0 $x1))
;;     c1161  mass 2  {person, people}
;;     c1076  mass 1  {gazelle, giraffe, giraffes}
;;     c1701  mass 1  {May}

;; ---- slot star.Agent  [event center]  n 4  clusters 1
(And (Member $e0 star) (Agent $e0 $x1))
;;     c2154  mass 4  {thing, things}

;; ---- slot star.Theme  [event center]  n 4  clusters 2
(And (Member $e0 star) (Theme $e0 $x1))
;;      c620  mass 2  {Laurie Aubanel, Muriel Zazoui, Patricia Kaas}
;;      c699  mass 2  {James Woods, Jeremy Irons}

;; ---- slot stop.Agent  [event center]  n 4  clusters 5
(And (Member $e0 stop) (Agent $e0 $x1))
;;      c632  mass 1  {Skura, Inomaru, Barako}
;;      c713  mass 1  {Yanni}
;;      c817  mass 1  {Rima}
;;     c1184  mass 0.5  {old, elderly}
;;      c890  mass 0.5  {adaptor, adaptor, old}

;; ---- slot stop.Theme  [event center]  n 4  clusters 2
(And (Member $e0 stop) (Theme $e0 $x1))
;;     c1113  mass 2  {work, job}
;;     c1483  mass 2  {cry}

;; ---- slot support.Theme  [event center]  n 4  clusters 1
(And (Member $e0 support) (Theme $e0 $x1))
;;     c1530  mass 4  {view, views, common, view, public, view, …}

;; ---- slot use.Manner  [event center]  n 4  clusters 3
(And (Member $e0 use) (Manner $e0 $x1))
;;     c1934  mass 2  {rarely}
;;     c1845  mass 1  {responsibility, responsibly}
;;     c1935  mass 1  {colloquially}

;; ---- slot use.To  [event center]  n 4  clusters 4
(And (Member $e0 use) (To $e0 $x1))
;;     c2006  mass 1  {make}
;;     c2215  mass 1  {develop}
;;      c771  mass 1  {learn}
;;      c955  mass 1  {roast, roasted}

;; ---- slot walk.Goal  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Goal $e0 $x1))
;;     c1018  mass 1  {forest, jungle}
;;     c1642  mass 1  {store, shop, shopping, shops}
;;     c2329  mass 1  {back, backward, before, past}
;;      c770  mass 1  {classroom}

;; ---- slot walk.Location  [event center]  n 4  clusters 5
(And (Member $e0 walk) (Location $e0 $x1))
;;     c1406  mass 1  {floor, wood floor}
;;     c1447  mass 1  {hallway}
;;     c1889  mass 1  {dark, darkness}
;;     c1098  mass 0.5  {balloon, balloon, little}
;;     c2135  mass 0.5  {little, small, minor}

;; ---- slot watch.Theme  [event center]  n 4  clusters 4
(And (Member $e0 watch) (Theme $e0 $x1))
;;     c1679  mass 1  {event}
;;     c2066  mass 1  {activity, activities}
;;     c2381  mass 1  {natural hair video}
;;      c251  mass 1  {movie, film}

;; ---- slot win.For  [event center]  n 4  clusters 1
(And (Member $e0 win) (For $e0 $x1))
;;     c1519  mass 4  {portray, portrait, portrayal}

;; ---- slot work.Location  [event center]  n 4  clusters 4
(And (Member $e0 work) (Location $e0 $x1))
;;      c210  mass 1  {Europe, Western Europe}
;;      c279  mass 1  {Church of Norway}
;;      c325  mass 1  {factory, factories}
;;      c358  mass 1  {prison kitchen}

;; ---- slot bottom.PartOf  [entity center]  n 3  clusters 2
(And (Member $x0 bottom) (PartOf $x0 $x1))
;;      c435  mass 2  {page}
;;      c932  mass 1  {stew pot}

;; ---- slot fight.Against  [entity center]  n 3  clusters 3
(And (Member $x0 fight) (Against $x0 $x1))
;;     c1992  mass 1  {dead, die, death, die down, …}
;;     c2049  mass 1  {natural, nature}
;;      c258  mass 1  {fate}

;; ---- slot thing.LocatedIn  [entity center]  n 3  clusters 2
(And (Member $x0 thing) (LocatedIn $x0 $x1))
;;      c785  mass 2  {hill, mountain, hills}
;;      c426  mass 1  {closet}

;; ---- slot active.Experiencer  [event center]  n 3  clusters 2
(And (Member $e0 active) (Experiencer $e0 $x1))
;;     c2154  mass 2  {thing, things}
;;      c671  mass 1  {Asserson}

;; ---- slot affect.Agent  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Agent $e0 $x1))
;;      c386  mass 3  {cyberattack}

;; ---- slot affect.Location  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Location $e0 $x1))
;;      c478  mass 3  {world}

;; ---- slot affect.Theme  [event center]  n 3  clusters 3
(And (Member $e0 affect) (Theme $e0 $x1))
;;     c1119  mass 1  {company, corporation}
;;      c116  mass 1  {hospital}
;;      c336  mass 1  {bank}

;; ---- slot affect.Time  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Time $e0 $x1))
;;     c2282  mass 3  {this year}

;; ---- slot approve.Theme  [event center]  n 3  clusters 3
(And (Member $e0 approve) (Theme $e0 $x1))
;;     c1660  mass 1  {treaty}
;;     c1674  mass 1  {plan}
;;     c1887  mass 1  {Bill, bill}

;; ---- slot attack.Patient  [event center]  n 3  clusters 3
(And (Member $e0 attack) (Patient $e0 $x1))
;;     c1431  mass 1  {building}
;;       c64  mass 1  {consumer rights}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}

;; ---- slot bake.Agent  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Agent $e0 $x1))
;;     c1119  mass 2  {company, corporation}
;;      c622  mass 1  {Ella}

;; ---- slot bake.Patient  [event center]  n 3  clusters 3
(And (Member $e0 bake) (Patient $e0 $x1))
;;      c916  mass 2  {ice cream, ice cone, ice cream cone}
;;      c906  mass 0.5  {appetizing, scrumptious, delicious}
;;      c952  mass 0.5  {cake, pie}

;; ---- slot base.On  [event center]  n 3  clusters 3
(And (Member $e0 base) (On $e0 $x1))
;;     c1730  mass 1  {battle, fight}
;;      c283  mass 1  {puritan value}
;;       c32  mass 1  {latin alphabet}

;; ---- slot beautiful.Experiencer  [event center]  n 3  clusters 4
(And (Member $e0 beautiful) (Experiencer $e0 $x1))
;;     c1504  mass 1  {weather}
;;     c1628  mass 1  {beautiful, gorgeous, pretty}
;;     c1449  mass 0.5  {room, rooms}
;;      c811  mass 0.5  {moon, full moon}

;; ---- slot break_out.Patient  [event center]  n 3  clusters 3
(And (Member $e0 break_out) (Patient $e0 $x1))
;;     c1473  mass 1  {fire, burn, scorch}
;;     c1476  mass 1  {forest fire, forest fires}
;;     c1731  mass 1  {war, world war}

;; ---- slot bring.Goal  [event center]  n 3  clusters 3
(And (Member $e0 bring) (Goal $e0 $x1))
;;     c1594  mass 1  {gallows}
;;      c224  mass 1  {India, Indonesia}
;;      c227  mass 1  {United States, U.S., USA}

;; ---- slot buy.Agent  [event center]  n 3  clusters 2
(And (Member $e0 buy) (Agent $e0 $x1))
;;      c633  mass 2  {Baya, Iga, Keike}
;;      c676  mass 1  {Wyman, Regis}

;; ---- slot close.Agent  [event center]  n 3  clusters 4
(And (Member $e0 close) (Agent $e0 $x1))
;;      c503  mass 1  {pilot}
;;      c564  mass 1  {guard, bodyguard, guards}
;;     c1076  mass 0.5  {gazelle, giraffe, giraffes}
;;     c1155  mass 0.5  {woman, lady, female, women}

;; ---- slot close.Goal  [event center]  n 3  clusters 2
(And (Member $e0 close) (Goal $e0 $x1))
;;       c26  mass 2  {Dutch, Frisian}
;;       c27  mass 1  {High German}

;; ---- slot close.Patient  [event center]  n 3  clusters 2
(And (Member $e0 close) (Patient $e0 $x1))
;;     c1415  mass 2  {door, door, open, door, unlocked}
;;     c1642  mass 1  {store, shop, shopping, shops}

;; ---- slot come.Goal  [event center]  n 3  clusters 4
(And (Member $e0 come) (Goal $e0 $x1))
;;     c1280  mass 1  {concert}
;;     c2143  mass 1  {conclusion}
;;     c1940  mass 0.5  {settlement, settle}
;;      c483  mass 0.5  {political}

;; ---- slot come.Patient  [event center]  n 3  clusters 3
(And (Member $e0 come) (Patient $e0 $x1))
;;     c1049  mass 1  {insect sound, insect sounds}
;;     c1490  mass 1  {typhoon}
;;      c860  mass 1  {sound, sound wave}

;; ---- slot come_back.Agent  [event center]  n 3  clusters 3
(And (Member $e0 come_back) (Agent $e0 $x1))
;;     c1171  mass 1  {Mom, mother, mom}
;;     c1174  mass 1  {father, Dad, dad}
;;     c1194  mass 1  {boy, boys}

;; ---- slot compose.Patient  [event center]  n 3  clusters 3
(And (Member $e0 compose) (Patient $e0 $x1))
;;      c879  mass 2  {song, sing, chant}
;;     c2306  mass 0.5  {great, excellent}
;;      c886  mass 0.5  {symphony, great, symphonies}

;; ---- slot conduct.Agent  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Agent $e0 $x1))
;;      c716  mass 2  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;;      c550  mass 1  {CIA, FBI}

;; ---- slot conduct.Theme  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Theme $e0 $x1))
;;      c887  mass 2  {orchestra}
;;      c749  mass 1  {surveillance}

;; ---- slot cover.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Instrument $e0 $x1))
;;     c1014  mass 1  {weed}
;;     c1500  mass 1  {snow, snowstorm, deep, snow}
;;      c434  mass 1  {paper decoration, paper decorations}

;; ---- slot cover.Patient  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Patient $e0 $x1))
;;     c1445  mass 1  {courtyard}
;;     c2244  mass 1  {top, peak}
;;      c310  mass 1  {shopping arcade}

;; ---- slot define.Theme  [event center]  n 3  clusters 2
(And (Member $e0 define) (Theme $e0 $x1))
;;     c1568  mass 2  {sequence, sequences}
;;     c2154  mass 1  {thing, things}

;; ---- slot die.Location  [event center]  n 3  clusters 2
(And (Member $e0 die) (Location $e0 $x1))
;;      c158  mass 2  {Stockholm, Bromma}
;;     c1473  mass 1  {fire, burn, scorch}

;; ---- slot drink.Patient  [event center]  n 3  clusters 3
(And (Member $e0 drink) (Patient $e0 $x1))
;;       c67  mass 2  {tea}
;;     c1488  mass 0.5  {water, water source, clear, water, good, water}
;;     c2308  mass 0.5  {good, nice, pleasant, positive}

;; ---- slot drive.Agent  [event center]  n 3  clusters 2
(And (Member $e0 drive) (Agent $e0 $x1))
;;      c515  mass 2  {bus, bus ride}
;;      c527  mass 1  {van}

;; ---- slot encourage.Agent  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Agent $e0 $x1))
;;      c665  mass 3  {Ralph}

;; ---- slot encourage.Theme  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Theme $e0 $x1))
;;      c660  mass 3  {Maurice}

;; ---- slot endorse.Theme  [event center]  n 3  clusters 1
(And (Member $e0 endorse) (Theme $e0 $x1))
;;     c1530  mass 3  {view, views, common, view, public, view, …}

;; ---- slot fall.Source  [event center]  n 3  clusters 3
(And (Member $e0 fall) (Source $e0 $x1))
;;     c1021  mass 1  {tree, trees}
;;     c1441  mass 1  {shelf}
;;     c1506  mass 1  {sky}

;; ---- slot fight.Agent  [event center]  n 3  clusters 2
(And (Member $e0 fight) (Agent $e0 $x1))
;;       c88  mass 2  {kabye person, kabye people}
;;     c1122  mass 1  {union boss, union bosses}

;; ---- slot fight.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fight) (Theme $e0 $x1))
;;     c1908  mass 1  {freeze, freeze over}
;;      c265  mass 1  {islamic fundamentalism}
;;      c371  mass 1  {terrorism, terrorist activity}

;; ---- slot fund.Theme  [event center]  n 3  clusters 2
(And (Member $e0 fund) (Theme $e0 $x1))
;;      c204  mass 2  {Kenya, Lessos-Kenya, Lessos-Uganda, Uganda}
;;      c172  mass 1  {border, border section}

;; ---- slot give.Agent  [event center]  n 3  clusters 2
(And (Member $e0 give) (Agent $e0 $x1))
;;      c640  mass 2  {Oleg, Vladimir}
;;      c651  mass 1  {William, James}

;; ---- slot go.Manner  [event center]  n 3  clusters 2
(And (Member $e0 go) (Manner $e0 $x1))
;;     c2314  mass 2  {late, later, last}
;;     c2284  mass 1  {immediately, instantly, right away}

;; ---- slot go.To  [event center]  n 3  clusters 2
(And (Member $e0 go) (To $e0 $x1))
;;     c1775  mass 2  {talk, conversation, discussion}
;;     c2265  mass 1  {see, visible}

;; ---- slot grow.Patient  [event center]  n 3  clusters 4
(And (Member $e0 grow) (Patient $e0 $x1))
;;     c1297  mass 1  {beard}
;;      c694  mass 1  {Kalman}
;;     c1968  mass 0.5  {faint, faint, sound}
;;      c860  mass 0.5  {sound, sound wave}

;; ---- slot have.In  [event center]  n 3  clusters 2
(And (Member $e0 have) (In $e0 $x1))
;;      c318  mass 2  {fluid mechanics}
;;     c1241  mass 1  {poetry}

;; ---- slot hold.Patient  [event center]  n 3  clusters 4
(And (Member $e0 hold) (Patient $e0 $x1))
;;     c1678  mass 1  {meeting}
;;      c280  mass 1  {prayer, prayers}
;;     c1283  mass 0.5  {ceremony, ceremony, mass}
;;     c2153  mass 0.5  {matter, mass}

;; ---- slot lead.Theme  [event center]  n 3  clusters 4
(And (Member $e0 lead) (Theme $e0 $x1))
;;     c1079  mass 1  {goat, sheep}
;;     c1691  mass 1  {squad}
;;     c1036  mass 0.5  {cat fight, big, cat fight}
;;     c1799  mass 0.5  {big, large, huge, massive, …}

;; ---- slot learn.Theme  [event center]  n 3  clusters 4
(And (Member $e0 learn) (Theme $e0 $x1))
;;     c1244  mass 1  {dictionary, vocabulary}
;;     c1883  mass 1  {berber speaking, berber}
;;     c1245  mass 0.5  {language, english}
;;      c480  mass 0.5  {foreign, foreigner}

;; ---- slot leave.Patient  [event center]  n 3  clusters 5
(And (Member $e0 leave) (Patient $e0 $x1))
;;     c1415  mass 1  {door, door, open, door, unlocked}
;;     c1413  mass 0.5  {unlocked}
;;     c1900  mass 0.5  {light}
;;     c2338  mass 0.5  {open}
;;     c2348  mass 0.5  {well, on, there, be}

;; ---- slot leave.Result  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Result $e0 $x1))
;;     c1413  mass 1  {unlocked}
;;     c2338  mass 1  {open}
;;     c2348  mass 1  {well, on, there, be}

;; ---- slot leave.Theme  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Theme $e0 $x1))
;;     c1449  mass 1  {room, rooms}
;;      c522  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}
;;      c530  mass 1  {park, parking lot, parking}

;; ---- slot lose.Agent  [event center]  n 3  clusters 2
(And (Member $e0 lose) (Agent $e0 $x1))
;;      c707  mass 2  {George Allen, James David Edgar, Chuck Robb}
;;      c528  mass 1  {tire}

;; ---- slot move.Goal  [event center]  n 3  clusters 2
(And (Member $e0 move) (Goal $e0 $x1))
;;      c149  mass 2  {Baltimore, Boston, Springfield}
;;     c2205  mass 1  {here}

;; ---- slot paint.Patient  [event center]  n 3  clusters 2
(And (Member $e0 paint) (Patient $e0 $x1))
;;      c825  mass 2  {landscape, scenery}
;;     c2226  mass 1  {gate}

;; ---- slot pick_up.Agent  [event center]  n 3  clusters 3
(And (Member $e0 pick_up) (Agent $e0 $x1))
;;     c1535  mass 1  {camera}
;;      c154  mass 1  {Santiago, Havana}
;;      c663  mass 1  {Jonas, John, Jonathan, Jack, …}

;; ---- slot play.Location  [event center]  n 3  clusters 2
(And (Member $e0 play) (Location $e0 $x1))
;;      c154  mass 2  {Santiago, Havana}
;;     c1406  mass 1  {floor, wood floor}

;; ---- slot pull.Theme  [event center]  n 3  clusters 5
(And (Member $e0 pull) (Theme $e0 $x1))
;;      c154  mass 1  {Santiago, Havana}
;;      c641  mass 1  {Boris, Ivan, Dmitri, Rasputin}
;;     c1756  mass 0.333  {line}
;;     c2316  mass 0.333  {long}
;;      c506  mass 0.333  {freight train, locomotive, freight car}

;; ---- slot read.Agent  [event center]  n 3  clusters 4
(And (Member $e0 read) (Agent $e0 $x1))
;;      c638  mass 1  {Katya}
;;      c661  mass 1  {Thomas, Tom, Tommy}
;;     c1199  mass 0.5  {girl, girls}
;;     c2135  mass 0.5  {little, small, minor}

;; ---- slot read.Theme  [event center]  n 3  clusters 3
(And (Member $e0 read) (Theme $e0 $x1))
;;     c1234  mass 1  {comic}
;;      c257  mass 1  {fairy tale}
;;      c351  mass 1  {economics magazine}

;; ---- slot require.Agent  [event center]  n 3  clusters 3
(And (Member $e0 require) (Agent $e0 $x1))
;;     c1425  mass 1  {house, home, houses}
;;     c2203  mass 1  {master, main}
;;     c2213  mass 1  {app}

;; ---- slot return.Agent  [event center]  n 3  clusters 2
(And (Member $e0 return) (Agent $e0 $x1))
;;      c569  mass 2  {Glasnow}
;;       c15  mass 1  {fishing boat}

;; ---- slot return.Goal  [event center]  n 3  clusters 2
(And (Member $e0 return) (Goal $e0 $x1))
;;      c151  mass 2  {Altoona}
;;     c1560  mass 1  {port, old, port}

;; ---- slot rule.Agent  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Agent $e0 $x1))
;;      c579  mass 2  {Tipu Sultan}
;;      c238  mass 1  {Spain}

;; ---- slot rule.Theme  [event center]  n 3  clusters 4
(And (Member $e0 rule) (Theme $e0 $x1))
;;      c222  mass 1  {Colombia, Cuba, Peru, Venezuela}
;;      c268  mass 1  {muslim house, house, muslim}
;;     c1425  mass 0.5  {house, home, houses}
;;      c269  mass 0.5  {muslim, muslim community, muslims}

;; ---- slot say.Theme  [event center]  n 3  clusters 2
(And (Member $e0 say) (Theme $e0 $x1))
;;     c2154  mass 2  {thing, things}
;;      c260  mass 1  {funeral prayer, funeral}

;; ---- slot season.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 season) (Instrument $e0 $x1))
;;      c972  mass 1  {lemongrass}
;;      c980  mass 1  {horse radish}
;;      c982  mass 1  {ramson}

;; ---- slot see.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 see) (Stimulus $e0 $x1))
;;     c1081  mass 1  {animal, animals}
;;      c627  mass 1  {Jessica, Beth}
;;      c811  mass 1  {moon, full moon}

;; ---- slot shoot.Patient  [event center]  n 3  clusters 3
(And (Member $e0 shoot) (Patient $e0 $x1))
;;     c1091  mass 1  {bear}
;;      c612  mass 1  {JFK}
;;      c691  mass 1  {Dan}

;; ---- slot sleep.Agent  [event center]  n 3  clusters 2
(And (Member $e0 sleep) (Agent $e0 $x1))
;;     c1161  mass 2  {person, people}
;;     c1163  mass 1  {family, families}

;; ---- slot solve.Patient  [event center]  n 3  clusters 1
(And (Member $e0 solve) (Patient $e0 $x1))
;;     c1764  mass 3  {problem, problems}

;; ---- slot spend.Theme  [event center]  n 3  clusters 2
(And (Member $e0 spend) (Theme $e0 $x1))
;;      c106  mass 2  {exile}
;;     c1721  mass 1  {day, days, days, short}

;; ---- slot start.Location  [event center]  n 3  clusters 1
(And (Member $e0 start) (Location $e0 $x1))
;;      c243  mass 3  {Denmark, Norway, Sweden}

;; ---- slot stick.Patient  [event center]  n 3  clusters 3
(And (Member $e0 stick) (Patient $e0 $x1))
;;     c1078  mass 1  {horse}
;;      c520  mass 1  {truck}
;;      c922  mass 1  {chewing gum}

;; ---- slot succeed.Agent  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Agent $e0 $x1))
;;      c593  mass 1  {Alexander}
;;      c666  mass 1  {Bailey}
;;      c719  mass 1  {Corentin Rahier, Peter Gaussen, Van Bavel}

;; ---- slot succeed.Theme  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Theme $e0 $x1))
;;     c1161  mass 1  {person, people}
;;      c624  mass 1  {Margaret Fleming, Martha, Anne, Marie}
;;      c706  mass 1  {Henry Cole}

;; ---- slot take_off.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_off) (Agent $e0 $x1))
;;      c504  mass 2  {plane, flight, aeroplane, airplane, …}
;;      c691  mass 1  {Dan}

;; ---- slot take_over.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_over) (Agent $e0 $x1))
;;      c608  mass 2  {Watts}
;;     c1007  mass 1  {Ivy, ivy}

;; ---- slot talk.Recipient  [event center]  n 3  clusters 4
(And (Member $e0 talk) (Recipient $e0 $x1))
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;      c760  mass 1  {teacher, professor}
;;     c1273  mass 0.5  {audience, audience, large}
;;     c1799  mass 0.5  {big, large, huge, massive, …}

;; ---- slot turn.Goal  [event center]  n 3  clusters 3
(And (Member $e0 turn) (Goal $e0 $x1))
;;     c1238  mass 1  {quagmire}
;;     c2184  mass 1  {report}
;;      c780  mass 1  {river}

;; ---- slot understand.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 understand) (Stimulus $e0 $x1))
;;      c110  mass 1  {public health issue}
;;     c1765  mass 1  {specific issue}
;;     c2151  mass 1  {reason}

;; ---- slot wear.Theme  [event center]  n 3  clusters 3
(And (Member $e0 wear) (Theme $e0 $x1))
;;     c1294  mass 1  {mask}
;;      c432  mass 1  {inaugural gown}
;;      c498  mass 1  {helmet}

;; ---- slot welcome.Agent  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Agent $e0 $x1))
;;     c2206  mass 1  {host}
;;      c327  mass 1  {industrialization}
;;      c463  mass 1  {whig, whigs}

;; ---- slot welcome.Theme  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Theme $e0 $x1))
;;     c1275  mass 1  {guest, guests}
;;      c327  mass 1  {industrialization}
;;      c463  mass 1  {whig, whigs}

;; ---- slot work.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 work) (Experiencer $e0 $x1))
;;     c1552  mass 1  {mouse}
;;     c1557  mass 1  {site}
;;      c891  mass 1  {travel adaptor}

;; ---- slot work.Manner  [event center]  n 3  clusters 3
(And (Member $e0 work) (Manner $e0 $x1))
;;     c2309  mass 1  {perfectly}
;;     c2314  mass 1  {late, later, last}
;;     c2340  mass 1  {fine, fair, flat}

;; ==================== word @ cluster cos 0.90: pooled role level (136 head pairs) ====================

;; Agent ~ Experiencer  cosine 0.56  JSD 0.719  n 888 / 261  shared: {person, people} {thing, things} {child, kid}
(Agent $e $x)
(Experiencer $e $x)

;; Agent ~ Patient  cosine 0.51  JSD 0.795  n 888 / 455  shared: {person, people} {thing, things} {child, kid}
(Agent $e $x)
(Patient $e $x)

;; Patient ~ Theme  cosine 0.51  JSD 0.775  n 455 / 594  shared: {thing, things} {person, people} {movie, film}
(Patient $e $x)
(Theme $e $x)

;; Experiencer ~ Patient  cosine 0.50  JSD 0.695  n 261 / 455  shared: {person, people} {thing, things} {door}
(Experiencer $e $x)
(Patient $e $x)

;; Agent ~ Theme  cosine 0.41  JSD 0.82  n 888 / 594  shared: {person, people} {thing, things} {company}
(Agent $e $x)
(Theme $e $x)

;; Experiencer ~ Theme  cosine 0.39  JSD 0.821  n 261 / 594  shared: {thing, things} {person, people} {child, kid}
(Experiencer $e $x)
(Theme $e $x)

;; Stimulus ~ Theme  cosine 0.36  JSD 0.887  n 34 / 594  shared: {thing, things} {child, kid} {music}
(Stimulus $e $x)
(Theme $e $x)

;; Agent ~ Recipient  cosine 0.35  JSD 0.833  n 888 / 29  shared: {person, people} {company} {child, kid}
(Agent $e $x)
(Recipient $e $x)

;; Patient ~ Stimulus  cosine 0.25  JSD 0.918  n 455 / 34  shared: {thing, things} {child, kid} {food}
(Patient $e $x)
(Stimulus $e $x)

;; Experiencer ~ Recipient  cosine 0.23  JSD 0.898  n 261 / 29  shared: {person, people} {child, kid} {man, guy}
(Experiencer $e $x)
(Recipient $e $x)

;; Holder ~ Theme  cosine 0.22  JSD 0.887  n 48 / 594  shared: {thing, things} {house, home} {food}
(Holder $e $x)
(Theme $e $x)

;; Holder ~ Patient  cosine 0.20  JSD 0.871  n 48 / 455  shared: {thing, things} {movie, film} {room, rooms}
(Holder $e $x)
(Patient $e $x)

;; Experiencer ~ Stimulus  cosine 0.19  JSD 0.926  n 261 / 34  shared: {thing, things} {child, kid} {difficult, difficulty}
(Experiencer $e $x)
(Stimulus $e $x)

;; Agent ~ Stimulus  cosine 0.17  JSD 0.919  n 888 / 34  shared: {thing, things} {child, kid} {Jessica}
(Agent $e $x)
(Stimulus $e $x)

;; Patient ~ Recipient  cosine 0.17  JSD 0.925  n 455 / 29  shared: {person, people} {child, kid} {city, cities}
(Patient $e $x)
(Recipient $e $x)

;; Experiencer ~ Result  cosine 0.16  JSD 0.821  n 261 / 43  shared: {bad} {red} {black}
(Experiencer $e $x)
(Result $e $x)

;; Goal ~ Source  cosine 0.16  JSD 0.864  n 93 / 47  shared: {town} {here} {school}
(Goal $e $x)
(Source $e $x)

;; Experiencer ~ Holder  cosine 0.16  JSD 0.862  n 261 / 48  shared: {thing, things} {house, home} {place, places}
(Experiencer $e $x)
(Holder $e $x)

;; Theme ~ To  cosine 0.15  JSD 0.919  n 594 / 46  shared: {thing, things} {talk, conversation} {music}
(Theme $e $x)
(To $e $x)

;; Holder ~ Stimulus  cosine 0.14  JSD 0.917  n 48 / 34  shared: {thing, things} {food}
(Holder $e $x)
(Stimulus $e $x)

;; Goal ~ Holder  cosine 0.13  JSD 0.891  n 93 / 48  shared: {house, home} {town} {place, places}
(Goal $e $x)
(Holder $e $x)

;; Goal ~ Location  cosine 0.13  JSD 0.89  n 93 / 210  shared: {house, home} {here} {town}
(Goal $e $x)
(Location $e $x)

;; Location ~ Source  cosine 0.13  JSD 0.906  n 210 / 47  shared: {here} {town} {place, places}
(Location $e $x)
(Source $e $x)

;; Recipient ~ Theme  cosine 0.12  JSD 0.928  n 29 / 594  shared: {person, people} {child, kid} {company}
(Recipient $e $x)
(Theme $e $x)

;; Holder ~ Source  cosine 0.11  JSD 0.911  n 48 / 47  shared: {town} {room, rooms} {place, places}
(Holder $e $x)
(Source $e $x)

;; Agent ~ Holder  cosine 0.10  JSD 0.922  n 888 / 48  shared: {thing, things} {Wilson, wilson} {Karen}
(Agent $e $x)
(Holder $e $x)

;; Stimulus ~ To  cosine 0.10  JSD 0.907  n 34 / 46  shared: {thing, things} {practice} {music}
(Stimulus $e $x)
(To $e $x)

;; Patient ~ Result  cosine 0.10  JSD 0.888  n 455 / 43  shared: {bad} {black} {red}
(Patient $e $x)
(Result $e $x)

;; Goal ~ Patient  cosine 0.09  JSD 0.906  n 93 / 455  shared: {tree, trees} {house, home} {room, rooms}
(Goal $e $x)
(Patient $e $x)

;; Patient ~ To  cosine 0.08  JSD 0.959  n 455 / 46  shared: {thing, things} {woman, female}
(Patient $e $x)
(To $e $x)

;; Experiencer ~ Goal  cosine 0.08  JSD 0.919  n 261 / 93  shared: {house, home} {place, places} {school}
(Experiencer $e $x)
(Goal $e $x)

;; Goal ~ Theme  cosine 0.07  JSD 0.941  n 93 / 594  shared: {house, home} {room, rooms} {new}
(Goal $e $x)
(Theme $e $x)

;; Patient ~ Source  cosine 0.07  JSD 0.949  n 455 / 47  shared: {tree, trees} {room, rooms} {school}
(Patient $e $x)
(Source $e $x)

;; Agent ~ To  cosine 0.06  JSD 0.944  n 888 / 46  shared: {thing, things} {doctor} {George Allen, Chuck Robb}
(Agent $e $x)
(To $e $x)

;; Holder ~ Location  cosine 0.06  JSD 0.935  n 48 / 210  shared: {town} {house, home} {place, places}
(Holder $e $x)
(Location $e $x)

;; Experiencer ~ To  cosine 0.06  JSD 0.963  n 261 / 46  shared: {thing, things} {doctor}
(Experiencer $e $x)
(To $e $x)

;; Location ~ Patient  cosine 0.06  JSD 0.911  n 210 / 455  shared: {door} {table} {hotel}
(Location $e $x)
(Patient $e $x)

;; Holder ~ To  cosine 0.06  JSD 0.942  n 48 / 46  shared: {thing, things} {repeat, repetition}
(Holder $e $x)
(To $e $x)

;; For ~ Goal  cosine 0.05  JSD 0.951  n 39 / 93  shared: {bed} {happiness, joy}
(For $e $x)
(Goal $e $x)

;; Recipient ~ Stimulus  cosine 0.05  JSD 0.957  n 29 / 34  shared: {child, kid}
(Recipient $e $x)
(Stimulus $e $x)

;; Experiencer ~ Location  cosine 0.05  JSD 0.932  n 261 / 210  shared: {Europe, Western Europe} {house, home} {place, places}
(Experiencer $e $x)
(Location $e $x)

;; Manner ~ Time  cosine 0.04  JSD 0.95  n 115 / 107  shared: {late, later} {immediately, instantly, right away}
(Manner $e $x)
(Time $e $x)

;; Source ~ Theme  cosine 0.04  JSD 0.958  n 47 / 594  shared: {view, views} {room, rooms} {eat}
(Source $e $x)
(Theme $e $x)

;; Experiencer ~ Source  cosine 0.04  JSD 0.95  n 261 / 47  shared: {place, places} {room, rooms} {school}
(Experiencer $e $x)
(Source $e $x)

;; Instrument ~ Stimulus  cosine 0.04  JSD 0.95  n 34 / 34  shared: {food} {crash}
(Instrument $e $x)
(Stimulus $e $x)

;; Location ~ Theme  cosine 0.04  JSD 0.938  n 210 / 594  shared: {house, home} {Gareccio} {group}
(Location $e $x)
(Theme $e $x)

;; In ~ Stimulus  cosine 0.04  JSD 0.953  n 50 / 34  shared: {action} {poetry}
(In $e $x)
(Stimulus $e $x)

;; Instrument ~ Patient  cosine 0.04  JSD 0.956  n 34 / 455  shared: {road, roads} {snow} {food}
(Instrument $e $x)
(Patient $e $x)

;; For ~ Theme  cosine 0.03  JSD 0.965  n 39 / 594  shared: {work} {word} {polish}
(For $e $x)
(Theme $e $x)

;; Holder ~ Result  cosine 0.03  JSD 0.976  n 48 / 43  shared: {bad}
(Holder $e $x)
(Result $e $x)

;; Goal ~ Manner  cosine 0.03  JSD 0.97  n 93 / 115  shared: {well} {back, backward}
(Goal $e $x)
(Manner $e $x)

;; In ~ Result  cosine 0.03  JSD 0.97  n 50 / 43  shared: {silent, silence}
(In $e $x)
(Result $e $x)

;; Agent ~ Goal  cosine 0.02  JSD 0.961  n 888 / 93  shared: {house, home} {school} {campfire}
(Agent $e $x)
(Goal $e $x)

;; Goal ~ In  cosine 0.02  JSD 0.969  n 93 / 50  shared: {way, ways} {field, fields}
(Goal $e $x)
(In $e $x)

;; In ~ Source  cosine 0.02  JSD 0.975  n 50 / 47  shared: {way, ways}
(In $e $x)
(Source $e $x)

;; Manner ~ Result  cosine 0.02  JSD 0.956  n 115 / 43  shared: {together} {effective, effectively} {back, backward}
(Manner $e $x)
(Result $e $x)

;; Result ~ Theme  cosine 0.02  JSD 0.969  n 43 / 594  shared: {sleep} {king, queen} {big, large, huge}
(Result $e $x)
(Theme $e $x)

;; Experiencer ~ For  cosine 0.02  JSD 0.971  n 261 / 39  shared: {word} {happiness, joy} {general, general purpose}
(Experiencer $e $x)
(For $e $x)

;; Experiencer ~ Instrument  cosine 0.02  JSD 0.973  n 261 / 34  shared: {train} {road, roads} {big, large, huge}
(Experiencer $e $x)
(Instrument $e $x)

;; Goal ~ Result  cosine 0.02  JSD 0.964  n 93 / 43  shared: {dead, die, death} {big, large, huge} {back, backward}
(Goal $e $x)
(Result $e $x)

;; Experiencer ~ In  cosine 0.02  JSD 0.976  n 261 / 50  shared: {weather} {silent, silence} {nothing, no}
(Experiencer $e $x)
(In $e $x)

;; In ~ Theme  cosine 0.02  JSD 0.977  n 50 / 594  shared: {english} {understand} {way, ways}
(In $e $x)
(Theme $e $x)

;; Location ~ To  cosine 0.02  JSD 0.978  n 210 / 46  shared: {talk, conversation} {shore, shoreline}
(Location $e $x)
(To $e $x)

;; Theme ~ Time  cosine 0.02  JSD 0.984  n 594 / 107  shared: {now, current} {morning, early morning} {day}
(Theme $e $x)
(Time $e $x)

;; For ~ Stimulus  cosine 0.02  JSD 0.973  n 39 / 34  shared: {start, begin}
(For $e $x)
(Stimulus $e $x)

;; Holder ~ Instrument  cosine 0.02  JSD 0.975  n 48 / 34  shared: {food}
(Holder $e $x)
(Instrument $e $x)

;; Location ~ Recipient  cosine 0.02  JSD 0.975  n 210 / 29  shared: {city, cities} {big, large, huge}
(Location $e $x)
(Recipient $e $x)

;; Agent ~ For  cosine 0.02  JSD 0.972  n 888 / 39  shared: {cook} {bus} {patient}
(Agent $e $x)
(For $e $x)

;; In ~ Patient  cosine 0.02  JSD 0.975  n 50 / 455  shared: {weather} {field, fields} {silent, silence}
(In $e $x)
(Patient $e $x)

;; Result ~ Source  cosine 0.02  JSD 0.978  n 43 / 47  shared: {bat}
(Result $e $x)
(Source $e $x)

;; Experiencer ~ Time  cosine 0.02  JSD 0.979  n 261 / 107  shared: {night} {modern times, modern} {day}
(Experiencer $e $x)
(Time $e $x)

;; Goal ~ Instrument  cosine 0.02  JSD 0.975  n 93 / 34  shared: {snow} {big, large, huge}
(Goal $e $x)
(Instrument $e $x)

;; Goal ~ Recipient  cosine 0.02  JSD 0.973  n 93 / 29  shared: {Loren} {big, large, huge}
(Goal $e $x)
(Recipient $e $x)

;; In ~ Location  cosine 0.01  JSD 0.98  n 50 / 210  shared: {water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; Instrument ~ Theme  cosine 0.01  JSD 0.986  n 34 / 594  shared: {food} {big, large, huge}
(Instrument $e $x)
(Theme $e $x)

;; In ~ To  cosine 0.01  JSD 0.981  n 50 / 46  shared: {action}
(In $e $x)
(To $e $x)

;; Agent ~ Location  cosine 0.01  JSD 0.967  n 888 / 210  shared: {house, home} {fire} {sun, sunlight}
(Agent $e $x)
(Location $e $x)

;; Agent ~ Source  cosine 0.01  JSD 0.986  n 888 / 47  shared: {plane, aeroplane, airplane} {school}
(Agent $e $x)
(Source $e $x)

;; Instrument ~ Result  cosine 0.01  JSD 0.982  n 34 / 43  shared: {big, large, huge}
(Instrument $e $x)
(Result $e $x)

;; Manner ~ Patient  cosine 0.01  JSD 0.988  n 115 / 455  shared: {well} {together} {poor, poorly}
(Manner $e $x)
(Patient $e $x)

;; Recipient ~ Source  cosine 0.01  JSD 0.982  n 29 / 47  shared: {local, locals}
(Recipient $e $x)
(Source $e $x)

;; Agent ~ Instrument  cosine 0.01  JSD 0.984  n 888 / 34  shared: {train} {plant, plants} {snow}
(Agent $e $x)
(Instrument $e $x)

;; Recipient ~ Result  cosine 0.01  JSD 0.98  n 29 / 43  shared: {big, large, huge}
(Recipient $e $x)
(Result $e $x)

;; Agent ~ Result  cosine 0.01  JSD 0.982  n 888 / 43  shared: {crow} {red} {sleep}
(Agent $e $x)
(Result $e $x)

;; Patient ~ Time  cosine 0.01  JSD 0.988  n 455 / 107  shared: {night} {hour, hours} {day}
(Patient $e $x)
(Time $e $x)

;; Agent ~ Time  cosine 0.01  JSD 0.993  n 888 / 107  shared: {now, current} {spring}
(Agent $e $x)
(Time $e $x)

;; Instrument ~ Location  cosine 0.01  JSD 0.986  n 34 / 210  shared: {snow} {big, large, huge}
(Instrument $e $x)
(Location $e $x)

;; Result ~ Time  cosine 0.01  JSD 0.983  n 43 / 107  shared: {modern times, modern}
(Result $e $x)
(Time $e $x)

;; Holder ~ In  cosine 0.01  JSD 0.986  n 48 / 50  shared: {weather}
(Holder $e $x)
(In $e $x)

;; For ~ Patient  cosine 0.01  JSD 0.988  n 39 / 455  shared: {word} {dance} {whole, entire}
(For $e $x)
(Patient $e $x)

;; Instrument ~ Recipient  cosine 0.01  JSD 0.984  n 34 / 29  shared: {big, large, huge}
(Instrument $e $x)
(Recipient $e $x)

;; Location ~ Result  cosine 0.01  JSD 0.991  n 210 / 43  shared: {big, large, huge}
(Location $e $x)
(Result $e $x)

;; Source ~ Time  cosine 0.01  JSD 0.986  n 47 / 107  shared: {point}
(Source $e $x)
(Time $e $x)

;; Experiencer ~ Manner  cosine 0.01  JSD 0.988  n 261 / 115  shared: {together} {effective, effectively} {poor, poorly}
(Experiencer $e $x)
(Manner $e $x)

;; Manner ~ Source  cosine 0.00  JSD 0.99  n 115 / 47  shared: {international, internationally}
(Manner $e $x)
(Source $e $x)

;; Manner ~ Theme  cosine 0.00  JSD 0.992  n 115 / 594  shared: {alone, single} {widely, wide} {hard, harder}
(Manner $e $x)
(Theme $e $x)

;; Agent ~ In  cosine 0.00  JSD 0.994  n 888 / 50  shared: {reality, real life} {context}
(Agent $e $x)
(In $e $x)

;; Agent ~ Manner  cosine 0.00  JSD 0.998  n 888 / 115  shared: {quickly, quick, fast}
(Agent $e $x)
(Manner $e $x)

;; Location ~ Manner  cosine 0.00  JSD 0.996  n 210 / 115  shared: {early}
(Location $e $x)
(Manner $e $x)

;; For ~ Holder  cosine 0.00  JSD 1.0  n 39 / 48  shared: 
(For $e $x)
(Holder $e $x)

;; For ~ In  cosine 0.00  JSD 1.0  n 39 / 50  shared: 
(For $e $x)
(In $e $x)

;; For ~ Instrument  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Instrument $e $x)

;; For ~ Location  cosine 0.00  JSD 1.0  n 39 / 210  shared: 
(For $e $x)
(Location $e $x)

;; For ~ Manner  cosine 0.00  JSD 1.0  n 39 / 115  shared: 
(For $e $x)
(Manner $e $x)

;; For ~ Recipient  cosine 0.00  JSD 1.0  n 39 / 29  shared: 
(For $e $x)
(Recipient $e $x)

;; For ~ Result  cosine 0.00  JSD 1.0  n 39 / 43  shared: 
(For $e $x)
(Result $e $x)

;; For ~ Source  cosine 0.00  JSD 1.0  n 39 / 47  shared: 
(For $e $x)
(Source $e $x)

;; For ~ Time  cosine 0.00  JSD 1.0  n 39 / 107  shared: 
(For $e $x)
(Time $e $x)

;; For ~ To  cosine 0.00  JSD 1.0  n 39 / 46  shared: 
(For $e $x)
(To $e $x)

;; Goal ~ Stimulus  cosine 0.00  JSD 1.0  n 93 / 34  shared: 
(Goal $e $x)
(Stimulus $e $x)

;; Goal ~ Time  cosine 0.00  JSD 1.0  n 93 / 107  shared: 
(Goal $e $x)
(Time $e $x)

;; Goal ~ To  cosine 0.00  JSD 1.0  n 93 / 46  shared: 
(Goal $e $x)
(To $e $x)

;; Holder ~ Manner  cosine 0.00  JSD 1.0  n 48 / 115  shared: 
(Holder $e $x)
(Manner $e $x)

;; Holder ~ Recipient  cosine 0.00  JSD 1.0  n 48 / 29  shared: 
(Holder $e $x)
(Recipient $e $x)

;; Holder ~ Time  cosine 0.00  JSD 1.0  n 48 / 107  shared: 
(Holder $e $x)
(Time $e $x)

;; In ~ Instrument  cosine 0.00  JSD 1.0  n 50 / 34  shared: 
(In $e $x)
(Instrument $e $x)

;; In ~ Manner  cosine 0.00  JSD 1.0  n 50 / 115  shared: 
(In $e $x)
(Manner $e $x)

;; In ~ Recipient  cosine 0.00  JSD 1.0  n 50 / 29  shared: 
(In $e $x)
(Recipient $e $x)

;; In ~ Time  cosine 0.00  JSD 1.0  n 50 / 107  shared: 
(In $e $x)
(Time $e $x)

;; Instrument ~ Manner  cosine 0.00  JSD 1.0  n 34 / 115  shared: 
(Instrument $e $x)
(Manner $e $x)

;; Instrument ~ Source  cosine 0.00  JSD 1.0  n 34 / 47  shared: 
(Instrument $e $x)
(Source $e $x)

;; Instrument ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Instrument $e $x)
(Time $e $x)

;; Instrument ~ To  cosine 0.00  JSD 1.0  n 34 / 46  shared: 
(Instrument $e $x)
(To $e $x)

;; Location ~ Stimulus  cosine 0.00  JSD 1.0  n 210 / 34  shared: 
(Location $e $x)
(Stimulus $e $x)

;; Location ~ Time  cosine 0.00  JSD 1.0  n 210 / 107  shared: 
(Location $e $x)
(Time $e $x)

;; Manner ~ Recipient  cosine 0.00  JSD 1.0  n 115 / 29  shared: 
(Manner $e $x)
(Recipient $e $x)

;; Manner ~ Stimulus  cosine 0.00  JSD 1.0  n 115 / 34  shared: 
(Manner $e $x)
(Stimulus $e $x)

;; Manner ~ To  cosine 0.00  JSD 1.0  n 115 / 46  shared: 
(Manner $e $x)
(To $e $x)

;; Recipient ~ Time  cosine 0.00  JSD 1.0  n 29 / 107  shared: 
(Recipient $e $x)
(Time $e $x)

;; Recipient ~ To  cosine 0.00  JSD 1.0  n 29 / 46  shared: 
(Recipient $e $x)
(To $e $x)

;; Result ~ Stimulus  cosine 0.00  JSD 1.0  n 43 / 34  shared: 
(Result $e $x)
(Stimulus $e $x)

;; Result ~ To  cosine 0.00  JSD 1.0  n 43 / 46  shared: 
(Result $e $x)
(To $e $x)

;; Source ~ Stimulus  cosine 0.00  JSD 1.0  n 47 / 34  shared: 
(Source $e $x)
(Stimulus $e $x)

;; Source ~ To  cosine 0.00  JSD 1.0  n 47 / 46  shared: 
(Source $e $x)
(To $e $x)

;; Stimulus ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Stimulus $e $x)
(Time $e $x)

;; Time ~ To  cosine 0.00  JSD 1.0  n 107 / 46  shared: 
(Time $e $x)
(To $e $x)

;; ==================== word @ cluster cos 0.90: slot pairs (2 event-center signals) ====================

;; [same role, different class]  accompany.Agent ~ appear.Agent  cosine 0.76  JSD 0.23  n 4 / 6  shared: {sister, sisters} {person, people}
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000050 tierC-000259
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; [different class and role]  die.Patient ~ sleep.Agent  cosine 0.99  JSD 0.006  n 4 / 3  shared: {person, people} {family, families}
;;   A e.g. tierB-001967 tierC-000199   B e.g. tierC-000041 tierC-000042
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 sleep) (Agent $e0 $x1))

;; ==================== word @ cluster cos 0.90: compared slots with their distributions (269 slots, n >= 3) ====================

;; ---- slot <unclassed>.LocatedIn  [entity center]  n 46  clusters 41
(LocatedIn $x0 $x1)
;;     c2705  mass 3  {here}
;;     c1235  mass 2  {garden}
;;      c219  mass 2  {city, cities}
;;      c225  mass 2  {southern}
;;      c945  mass 2  {class}
;;      c989  mass 2  {Derwent Isle}
;;     c2813  mass 1.5  {full, fully, in full}
;;     c1225  mass 1  {village}
;;     c1259  mass 1  {tree, trees}
;;     c1500  mass 1  {country}
;;     c1536  mass 1  {Tatoeba}
;;     c1712  mass 1  {ceiling}
;;     c1713  mass 1  {floor}
;;     c1731  mass 1  {wall}
;;     c1738  mass 1  {house, home}
;;     c1753  mass 1  {storeroom}
;;     c1884  mass 1  {table}
;;     c2167  mass 1  {play}
;;      c236  mass 1  {Algiers}
;;      c238  mass 1  {El Harrach}
;;      c253  mass 1  {Russian Far East, Siberia}
;;      c266  mass 1  {Colombia, Peru}
;;      c270  mass 1  {India, Indonesia}
;;      c272  mass 1  {Japan}
;;      c281  mass 1  {Gaul}
;;      c282  mass 1  {England, UK}
;;      c302  mass 1  {movie, film}
;;       c36  mass 1  {Loglan}
;;       c37  mass 1  {Lojban}
;;      c412  mass 1  {market}
;;      c559  mass 1  {world}
;;      c622  mass 1  {park}
;;      c634  mass 1  {street}
;;      c953  mass 1  {Dianchi Lake, Lake Dianchi}
;;      c967  mass 1  {Huancavelica}
;;      c986  mass 1  {sea, ocean}
;;     c1150  mass 0.5  {kitchen sink}
;;     c1355  mass 0.5  {basket}
;;     c1746  mass 0.5  {place, places}
;;     c1807  mass 0.5  {fountain, fountain, full}
;;     c2126  mass 0.5  {red}

;; ---- slot have.Holder  [event center]  n 44  clusters 40
(And (Member $e0 have) (Holder $e0 $x1))
;;      c777  mass 4  {Kristoffer}
;;      c220  mass 2  {town}
;;     c2646  mass 2  {thing, things}
;;      c842  mass 2  {Karen}
;;     c1194  mass 1  {food}
;;     c1243  mass 1  {ivy}
;;     c1284  mass 1  {creature, monster}
;;     c1533  mass 1  {sentence}
;;     c1542  mass 1  {word processor}
;;     c1738  mass 1  {house, home}
;;     c1744  mass 1  {tower}
;;     c1746  mass 1  {place, places}
;;     c1749  mass 1  {hotel}
;;     c1765  mass 1  {room, rooms}
;;     c2075  mass 1  {february}
;;      c233  mass 1  {tuareg, tuaregs}
;;      c236  mass 1  {Algiers}
;;      c264  mass 1  {Algeria, Morocco}
;;      c283  mass 1  {Scotland}
;;     c2867  mass 1  {decide, decision}
;;     c2921  mass 1  {repeat, repetition}
;;      c302  mass 1  {movie, film}
;;      c400  mass 1  {insurance}
;;      c526  mass 1  {library}
;;      c529  mass 1  {writer}
;;      c551  mass 1  {lawyer}
;;      c620  mass 1  {gas station, gas pump, gas pumps}
;;      c710  mass 1  {Wilson, wilson}
;;      c767  mass 1  {Rasputin}
;;      c786  mass 1  {Boldi}
;;      c792  mass 1  {Thomas}
;;      c827  mass 1  {Diego}
;;      c833  mass 1  {Miroslav}
;;      c895  mass 1  {homentropic current}
;;      c896  mass 1  {homentropic flow}
;;      c986  mass 1  {sea, ocean}
;;     c1454  mass 0.5  {old}
;;     c1645  mass 0.5  {bad}
;;     c1837  mass 0.5  {weather}
;;      c322  mass 0.5  {mosque}

;; ---- slot have.Theme  [event center]  n 43  clusters 59
(And (Member $e0 have) (Theme $e0 $x1))
;;     c1468  mass 4  {child, kid}
;;     c2678  mass 2  {representation, represent}
;;     c1236  mass 1  {leaf, leaves}
;;     c1321  mass 1  {antler, antlers}
;;     c1325  mass 1  {herd, herds}
;;     c1435  mass 1  {friend}
;;     c2016  mass 1  {value}
;;     c2022  mass 1  {reputation}
;;     c2100  mass 1  {day}
;;     c2306  mass 1  {chance}
;;     c2333  mass 1  {color}
;;     c2507  mass 1  {meaning}
;;     c2526  mass 1  {effect}
;;     c2646  mass 1  {thing, things}
;;     c2660  mass 1  {right}
;;     c2663  mass 1  {thought, think}
;;      c314  mass 1  {cemetery, cemeteries}
;;      c620  mass 1  {gas station, gas pump, gas pumps}
;;      c665  mass 1  {guard, guards}
;;       c83  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;     c1408  mass 0.667  {entropy}
;;     c2818  mass 0.667  {constant}
;;     c2824  mass 0.667  {uniform}
;;     c1111  mass 0.5  {taste, nice, taste}
;;     c1133  mass 0.5  {conical}
;;     c1235  mass 0.5  {garden}
;;     c1268  mass 0.5  {predictable}
;;     c1427  mass 0.5  {personality}
;;     c1577  mass 0.5  {soul piercing}
;;     c1601  mass 0.5  {nasty}
;;     c1619  mass 0.5  {eerie}
;;     c1621  mass 0.5  {weird, weird out}
;;     c1624  mass 0.5  {dream}
;;     c1709  mass 0.5  {roof}
;;     c1772  mass 0.5  {curtain, curtains}
;;     c1841  mass 0.5  {atmosphere}
;;     c1864  mass 0.5  {plot}
;;     c1948  mass 0.5  {homely}
;;     c1960  mass 0.5  {feel, feeling}
;;     c1973  mass 0.5  {intriguing}
;;     c1984  mass 0.5  {beautiful, gorgeous}
;;     c2134  mass 0.5  {stare}
;;     c2227  mass 0.5  {high}
;;     c2228  mass 0.5  {rich}
;;     c2326  mass 0.5  {blue}
;;     c2652  mass 0.5  {purpose}
;;     c2794  mass 0.5  {alone, single}
;;     c2842  mass 0.5  {nice}
;;      c349  mass 0.5  {history}
;;      c398  mass 0.5  {deductible}
;;      c498  mass 0.5  {style}
;;      c563  mass 0.5  {internal politics}
;;      c914  mass 0.5  {parenthetic}
;;     c1545  mass 0.333  {document}
;;     c2018  mass 0.333  {valuable}
;;     c2202  mass 0.333  {widely, wide}
;;     c2222  mass 0.333  {serious}
;;     c2634  mass 0.333  {consequence}
;;      c404  mass 0.333  {bank}

;; ---- slot <unclassed>.Possession  [entity center]  n 30  clusters 23
(Possession $x0 $x1)
;;     c1429  mass 5  {person, people}
;;      c545  mass 4  {Free Soil Party}
;;      c546  mass 4  {Republican Party}
;;      c377  mass 2  {subsequent game}
;;     c1007  mass 1  {Jupiter}
;;     c1495  mass 1  {Twilight}
;;     c1500  mass 1  {country}
;;      c166  mass 1  {Yunnan}
;;     c2539  mass 1  {union}
;;     c2646  mass 1  {thing, things}
;;      c320  mass 1  {sunni community, communities, neighbouring, other, sunni, sunni communities}
;;      c488  mass 1  {islamic ivory}
;;      c656  mass 1  {radical group}
;;      c691  mass 1  {God}
;;      c741  mass 1  {Dora Smith}
;;      c909  mass 1  {logical phrase}
;;      c910  mass 1  {logical proposition}
;;     c2239  mass 0.5  {generalization}
;;     c2626  mass 0.5  {easy}
;;      c202  mass 0.25  {neighbouring}
;;     c2240  mass 0.25  {other}
;;      c321  mass 0.25  {sunni}
;;      c922  mass 0.25  {community}

;; ---- slot use.Theme  [event center]  n 23  clusters 23
(And (Member $e0 use) (Theme $e0 $x1))
;;        c3  mass 2  {banach mackey topology}
;;        c4  mass 2  {weak arens space topology}
;;     c1052  mass 1  {jingle}
;;     c1068  mass 1  {auto tune, tune}
;;     c1135  mass 1  {sugar}
;;     c1520  mass 1  {metaphor}
;;     c1531  mass 1  {phrase}
;;     c1533  mass 1  {sentence}
;;     c1541  mass 1  {word}
;;     c1765  mass 1  {room, rooms}
;;     c1792  mass 1  {fire}
;;     c1893  mass 1  {machine}
;;     c2800  mass 1  {now, current}
;;     c2939  mass 1  {public fund}
;;      c464  mass 1  {chemical agent}
;;       c65  mass 1  {Midway}
;;      c655  mass 1  {paramilitary group}
;;      c754  mass 1  {Iga}
;;       c98  mass 1  {Laravel}
;;      c101  mass 0.5  {designation convention}
;;     c2042  mass 0.5  {calendar}
;;     c2501  mass 0.5  {various}
;;       c99  mass 0.5  {naming convention, current, naming convention}

;; ---- slot make.Patient  [event center]  n 20  clusters 25
(And (Member $e0 make) (Patient $e0 $x1))
;;     c2503  mass 1.5  {difference, different, differ}
;;     c1025  mass 1  {travel}
;;     c1120  mass 1  {cup}
;;     c1183  mass 1  {chicken fried steak}
;;     c1581  mass 1  {eye contact}
;;     c1874  mass 1  {cope}
;;     c2005  mass 1  {buy, purchase}
;;     c2204  mass 1  {big, large, huge}
;;     c2396  mass 1  {claim, claims}
;;      c262  mass 1  {Afghanistan}
;;      c512  mass 1  {paper, paper sheet, paper sheets}
;;       c69  mass 1  {telephone call}
;;      c694  mass 1  {Augustus}
;;      c736  mass 1  {Isabella}
;;     c1040  mass 0.5  {high pitched, high pitched, noise}
;;     c1054  mass 0.5  {noise, noises}
;;     c1055  mass 0.5  {sound}
;;     c1057  mass 0.5  {clicking}
;;     c1645  mass 0.5  {bad}
;;     c1738  mass 0.5  {house, home}
;;     c1765  mass 0.5  {room, rooms}
;;     c1827  mass 0.5  {snowman}
;;     c1949  mass 0.5  {comfortable}
;;     c1984  mass 0.5  {beautiful, gorgeous}
;;     c2645  mass 0.5  {matter}

;; ---- slot build.Patient  [event center]  n 18  clusters 11
(And (Member $e0 build) (Patient $e0 $x1))
;;     c1749  mass 4  {hotel}
;;      c513  mass 4  {paper factory, paper mill}
;;     c1765  mass 3  {room, rooms}
;;     c2646  mass 2  {thing, things}
;;     c2755  mass 2  {horn}
;;     c1909  mass 0.5  {network}
;;     c2283  mass 0.5  {new}
;;     c2509  mass 0.5  {original, origin}
;;     c2900  mass 0.5  {well}
;;      c371  mass 0.5  {playground, new, playground}
;;       c59  mass 0.5  {turing machine}

;; ---- slot make.Agent  [event center]  n 18  clusters 19
(And (Member $e0 make) (Agent $e0 $x1))
;;     c1140  mass 1  {diner}
;;     c1281  mass 1  {cat, cats}
;;     c1447  mass 1  {man, guy}
;;     c1464  mass 1  {boy}
;;     c1772  mass 1  {curtain, curtains}
;;     c1990  mass 1  {artistic beauty}
;;     c2241  mass 1  {practical utility}
;;     c2646  mass 1  {thing, things}
;;      c653  mass 1  {Taliban}
;;      c694  mass 1  {Augustus}
;;       c73  mass 1  {customer}
;;      c748  mass 1  {Hanako, Mariko, Yumi}
;;      c778  mass 1  {James}
;;      c780  mass 1  {David}
;;      c819  mass 1  {Elias}
;;      c836  mass 1  {Martino, Damiano}
;;      c837  mass 1  {Lorenzo}
;;     c1823  mass 0.5  {wind, gusty, winds}
;;     c1824  mass 0.5  {gusty}

;; ---- slot go.Agent  [event center]  n 15  clusters 14
(And (Member $e0 go) (Agent $e0 $x1))
;;      c735  mass 2  {Katherine, Kate}
;;     c1281  mass 1  {cat, cats}
;;     c1440  mass 1  {Mom, mother, mom}
;;     c1468  mass 1  {child, kid}
;;      c733  mass 1  {Olivia}
;;      c739  mass 1  {Linda}
;;      c748  mass 1  {Hanako, Mariko, Yumi}
;;      c775  mass 1  {Matthew}
;;      c784  mass 1  {Donald}
;;      c810  mass 1  {Mennad}
;;      c834  mass 1  {Claudio, Flavio}
;;      c841  mass 1  {Daniel}
;;      c844  mass 1  {Kalman}
;;      c934  mass 1  {pupil}

;; ---- slot play.Agent  [event center]  n 15  clusters 10
(And (Member $e0 play) (Agent $e0 $x1))
;;     c1468  mass 4  {child, kid}
;;      c669  mass 2  {Boston Red Sox}
;;      c670  mass 2  {Cincinnati Reds}
;;     c1464  mass 1  {boy}
;;      c148  mass 1  {biology}
;;      c332  mass 1  {religion}
;;      c719  mass 1  {Audrey Hepburn}
;;      c720  mass 1  {Audrey Heppurn}
;;      c748  mass 1  {Hanako, Mariko, Yumi}
;;      c793  mass 1  {Tony}

;; ---- slot build.Agent  [event center]  n 14  clusters 5
(And (Member $e0 build) (Agent $e0 $x1))
;;     c1381  mass 8  {company}
;;     c1429  mass 2  {person, people}
;;      c870  mass 2  {O. R. Woodcock, William Ewer}
;;      c232  mass 1  {mozabite, mozabites}
;;      c922  mass 1  {community}

;; ---- slot find.Location  [event center]  n 14  clusters 10
(And (Member $e0 find) (Location $e0 $x1))
;;      c166  mass 2  {Yunnan}
;;      c225  mass 2  {southern}
;;     c2487  mass 2  {bench}
;;      c956  mass 2  {tributary, tributaries}
;;     c1502  mass 1  {west, western}
;;      c196  mass 1  {station}
;;      c251  mass 1  {Europe, Western Europe}
;;      c316  mass 1  {tomb}
;;      c953  mass 1  {Dianchi Lake, Lake Dianchi}
;;      c984  mass 1  {Sahara Desert}

;; ---- slot <unclassed>.SubsetOf  [entity center]  n 13  clusters 12
(SubsetOf $x0 $x1)
;;     c1429  mass 2  {person, people}
;;     c1224  mass 1  {villager, villagers}
;;      c123  mass 1  {refugee, refugees}
;;     c1301  mass 1  {centipede, centipedes}
;;     c1470  mass 1  {chick}
;;     c1472  mass 1  {girl}
;;     c1889  mass 1  {window, windows}
;;      c200  mass 1  {corner, corners}
;;     c2002  mass 1  {shop, shops}
;;      c523  mass 1  {mayan book, mayan books}
;;      c587  mass 1  {plane, aeroplane, airplane}
;;      c934  mass 1  {pupil}

;; ---- slot start.Theme  [event center]  n 13  clusters 14
(And (Member $e0 start) (Theme $e0 $x1))
;;     c1079  mass 1  {chant}
;;     c1593  mass 1  {vomit}
;;     c1804  mass 1  {cry}
;;     c2165  mass 1  {hear}
;;     c2169  mass 1  {talk, conversation}
;;     c2291  mass 1  {improve}
;;     c2411  mass 1  {disappear, vanish}
;;     c2571  mass 1  {run out}
;;     c2764  mass 1  {roll, roller}
;;     c2780  mass 1  {appear, show up}
;;     c2782  mass 1  {show}
;;      c943  mass 1  {high school}
;;     c1960  mass 0.5  {feel, feeling}
;;        c8  mass 0.5  {light headed, feel, light headed}

;; ---- slot go.Goal  [event center]  n 12  clusters 9
(And (Member $e0 go) (Goal $e0 $x1))
;;     c2095  mass 4  {bed}
;;      c135  mass 1  {hospital}
;;     c1746  mass 1  {place, places}
;;     c1769  mass 1  {bathroom}
;;      c638  mass 1  {way, ways}
;;      c740  mass 1  {Loren}
;;       c83  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;       c86  mass 1  {supermarket}
;;      c942  mass 1  {school}

;; ---- slot study.Agent  [event center]  n 12  clusters 9
(And (Member $e0 study) (Agent $e0 $x1))
;;     c1429  mass 3  {person, people}
;;       c55  mass 2  {scientist}
;;       c49  mass 1  {forensics researcher, forensics researchers}
;;      c692  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c737  mass 1  {Beth}
;;      c758  mass 1  {Peter}
;;      c761  mass 1  {Yuri}
;;      c804  mass 1  {Fadil}
;;      c826  mass 1  {Carlos}

;; ---- slot <unclassed>.PartOf  [entity center]  n 11  clusters 11
(PartOf $x0 $x1)
;;      c679  mass 2  {Khurda Road}
;;     c1173  mass 1  {cake}
;;     c1243  mass 1  {ivy}
;;     c1248  mass 1  {plant, plants}
;;     c1334  mass 1  {animal, animals}
;;      c166  mass 1  {Yunnan}
;;     c2167  mass 1  {play}
;;      c488  mass 1  {islamic ivory}
;;      c930  mass 1  {student association, student associations}
;;      c634  mass 0.5  {street}
;;      c636  mass 0.5  {road, roads}

;; ---- slot become.Patient  [event center]  n 11  clusters 15
(And (Member $e0 become) (Patient $e0 $x1))
;;     c1429  mass 1.5  {person, people}
;;      c111  mass 1  {indigenous, indigenous, people}
;;     c1438  mass 1  {relationship, relationships}
;;     c1645  mass 1  {bad}
;;     c2646  mass 1  {thing, things}
;;      c744  mass 1  {Lady Ashton}
;;     c1041  mass 0.5  {intense}
;;     c1054  mass 0.5  {noise, noises}
;;      c194  mass 0.5  {lax}
;;     c2033  mass 0.5  {discipline}
;;     c2126  mass 0.5  {red}
;;     c2131  mass 0.5  {revolutionary, revolution}
;;      c542  mass 0.5  {conservative}
;;      c745  mass 0.5  {inomaru}
;;      c971  mass 0.5  {Earth, earth}

;; ---- slot begin.Agent  [event center]  n 11  clusters 9
(And (Member $e0 begin) (Agent $e0 $x1))
;;      c110  mass 2  {native american, indigenous american, indigenous americans, native americans}
;;      c117  mass 2  {european american settler, european american settlers}
;;     c1554  mass 1  {Mark}
;;     c1557  mass 1  {crowd, crowd, whole}
;;     c2130  mass 1  {rebel, rebels}
;;      c657  mass 1  {legionnaire, legionnaires}
;;      c738  mass 1  {Jessica}
;;      c779  mass 1  {William}
;;      c780  mass 1  {David}

;; ---- slot begin.Theme  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Theme $e0 $x1))
;;     c2463  mass 4  {create}
;;     c1575  mass 1  {applaud}
;;     c1637  mass 1  {confess}
;;     c2318  mass 1  {bud}
;;     c2461  mass 1  {make}
;;     c2740  mass 1  {hang out}
;;     c2789  mass 1  {distribute}
;;      c447  mass 1  {torture}

;; ---- slot build.Location  [event center]  n 11  clusters 4
(And (Member $e0 build) (Location $e0 $x1))
;;      c255  mass 4  {Kazakhstan}
;;      c162  mass 3  {Eskisehir}
;;      c287  mass 3  {Turkey}
;;      c237  mass 1  {Ghardaia}

;; ---- slot kill.Patient  [event center]  n 11  clusters 5
(And (Member $e0 kill) (Patient $e0 $x1))
;;     c1429  mass 6  {person, people}
;;      c659  mass 2  {soldier}
;;     c1291  mass 1  {zombie, zombies}
;;     c1327  mass 1  {gazelle}
;;     c1342  mass 1  {fox}

;; ---- slot produce.Patient  [event center]  n 11  clusters 10
(And (Member $e0 produce) (Patient $e0 $x1))
;;      c302  mass 4.833  {movie, film}
;;     c1081  mass 2  {album}
;;      c146  mass 1  {insulin}
;;      c300  mass 0.833  {syrian film, film, syrian film}
;;     c1978  mass 0.5  {mesmerizing}
;;     c2342  mass 0.5  {sheen}
;;     c1962  mass 0.333  {harmless}
;;     c2148  mass 0.333  {trace}
;;     c2312  mass 0.333  {destined}
;;      c462  mass 0.333  {cyanide}

;; ---- slot start.Patient  [event center]  n 11  clusters 14
(And (Member $e0 start) (Patient $e0 $x1))
;;     c1008  mass 1  {Milky Way}
;;     c1276  mass 1  {dog feed}
;;     c1568  mass 1  {concert}
;;        c2  mass 1  {national fibre optic network project}
;;     c2082  mass 1  {watermelon season}
;;     c2417  mass 1  {crack, cracked}
;;     c2458  mass 1  {knock}
;;     c2646  mass 1  {thing, things}
;;      c610  mass 1  {truck}
;;      c535  mass 0.5  {gusher}
;;      c539  mass 0.5  {freedom movement}
;;     c1839  mass 0.333  {sky}
;;     c2254  mass 0.333  {pocket}
;;     c2326  mass 0.333  {blue}

;; ---- slot find.Theme  [event center]  n 10  clusters 6
(And (Member $e0 find) (Theme $e0 $x1))
;;     c2646  mass 4  {thing, things}
;;      c617  mass 2  {Couper}
;;      c485  mass 1  {clay figurine, clay figurines}
;;      c512  mass 1  {paper, paper sheet, paper sheets}
;;      c838  mass 1  {Pietro}
;;      c981  mass 1  {meteorite}

;; ---- slot leave.Agent  [event center]  n 10  clusters 10
(And (Member $e0 leave) (Agent $e0 $x1))
;;       c14  mass 1  {ship}
;;     c1429  mass 1  {person, people}
;;      c587  mass 1  {plane, aeroplane, airplane}
;;      c603  mass 1  {bus}
;;      c613  mass 1  {car}
;;      c766  mass 1  {Ivan}
;;      c771  mass 1  {Marco, Marcus}
;;      c791  mass 1  {Tom, Tommy}
;;      c829  mass 1  {Rodrigo}
;;      c864  mass 1  {Brian}

;; ---- slot serve.Agent  [event center]  n 10  clusters 9
(And (Member $e0 serve) (Agent $e0 $x1))
;;      c173  mass 2  {Indooroopilly}
;;     c1429  mass 1.5  {person, people}
;;     c1442  mass 1  {grandmother}
;;     c1492  mass 1  {Rosewood}
;;      c170  mass 1  {Ipswich}
;;      c171  mass 1  {Ipswich & Rosewood}
;;      c832  mass 1  {Janos, Lajos}
;;      c868  mass 1  {Yitzhak}
;;      c712  mass 0.5  {president, person, president}

;; ---- slot take.Theme  [event center]  n 10  clusters 11
(And (Member $e0 take) (Theme $e0 $x1))
;;     c1428  mass 2  {identity, identify}
;;     c1379  mass 1  {office}
;;     c1855  mass 1  {portrait}
;;     c2215  mass 1  {power}
;;     c2646  mass 1  {thing, things}
;;     c2764  mass 1  {roll, roller}
;;     c2922  mass 1  {while}
;;     c2220  mass 0.5  {drastic}
;;     c2505  mass 0.5  {measure, measures}
;;     c2883  mass 0.5  {close, closed}
;;     c2918  mass 0.5  {look}

;; ---- slot try.Agent  [event center]  n 10  clusters 11
(And (Member $e0 try) (Agent $e0 $x1))
;;     c1001  mass 1  {alien}
;;     c1323  mass 1  {crocodile}
;;     c1381  mass 1  {company}
;;     c1554  mass 1  {Mark}
;;      c182  mass 1  {Santiago}
;;      c780  mass 1  {David}
;;      c789  mass 1  {Felix}
;;      c798  mass 1  {Bob}
;;      c834  mass 1  {Claudio, Flavio}
;;     c1447  mass 0.5  {man, guy}
;;     c1461  mass 0.5  {young}

;; ---- slot write.Patient  [event center]  n 10  clusters 8
(And (Member $e0 write) (Patient $e0 $x1))
;;     c1078  mass 2  {song, sing}
;;     c1918  mass 2  {episode}
;;     c1426  mass 1  {character}
;;     c1533  mass 1  {sentence}
;;     c1537  mass 1  {screenplay}
;;     c1538  mass 1  {script}
;;     c2259  mass 1  {letter}
;;      c524  mass 1  {book}

;; ---- slot fall.Patient  [event center]  n 9  clusters 12
(And (Member $e0 fall) (Patient $e0 $x1))
;;     c1131  mass 1  {ice pellet}
;;     c1470  mass 1  {chick}
;;     c1548  mass 1  {hush of anticipation}
;;     c1829  mass 1  {snow}
;;     c1878  mass 1  {scaffolding}
;;      c524  mass 1  {book}
;;      c934  mass 1  {pupil}
;;     c1255  mass 0.5  {forest}
;;     c2415  mass 0.5  {silent, silence}
;;     c1259  mass 0.333  {tree, trees}
;;     c1675  mass 0.333  {rotten}
;;     c2442  mass 0.333  {dead, die, death}

;; ---- slot follow.Agent  [event center]  n 9  clusters 10
(And (Member $e0 follow) (Agent $e0 $x1))
;;     c2316  mass 2  {bhadala, bhadalas}
;;      c324  mass 1  {muslim house, house, muslim}
;;      c636  mass 1  {road, roads}
;;      c695  mass 1  {Alexander}
;;      c802  mass 1  {Bailey}
;;      c806  mass 1  {Sami}
;;     c1296  mass 0.5  {crawling}
;;     c1349  mass 0.5  {beast}
;;     c1738  mass 0.5  {house, home}
;;      c325  mass 0.5  {muslim, muslims}

;; ---- slot follow.Theme  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Theme $e0 $x1))
;;      c226  mass 2  {region, regions}
;;      c346  mass 2  {tradition, traditions}
;;      c722  mass 1  {Layla}
;;      c732  mass 1  {Margaret Fleming}
;;      c825  mass 1  {Lukas}
;;      c857  mass 1  {Henry Cole}
;;      c991  mass 1  {shore, shoreline}

;; ---- slot hear.Stimulus  [event center]  n 9  clusters 12
(And (Member $e0 hear) (Stimulus $e0 $x1))
;;     c1662  mass 1  {crash}
;;     c1937  mass 1  {shoot, shot}
;;     c2451  mass 1  {bang}
;;     c2458  mass 1  {knock}
;;     c2646  mass 1  {thing, things}
;;     c2724  mass 1  {start, begin}
;;     c1054  mass 0.833  {noise, noises}
;;     c1047  mass 0.5  {ticking}
;;     c1066  mass 0.5  {upbeat}
;;     c1074  mass 0.5  {music}
;;     c1035  mass 0.333  {barking}
;;     c1037  mass 0.333  {growling}

;; ---- slot kill.Agent  [event center]  n 9  clusters 6
(And (Member $e0 kill) (Agent $e0 $x1))
;;     c1815  mass 4  {hurricane}
;;     c1345  mass 1  {lion, lions}
;;      c145  mass 1  {cancer}
;;     c1792  mass 1  {fire}
;;     c1938  mass 1  {hunter}
;;      c766  mass 1  {Ivan}

;; ---- slot sing.Agent  [event center]  n 9  clusters 8
(And (Member $e0 sing) (Agent $e0 $x1))
;;     c1420  mass 2  {sister, sisters}
;;     c1429  mass 2  {person, people}
;;     c1082  mass 1  {Amateur Barbershop Harmony Society}
;;     c1313  mass 1  {bird, birds}
;;      c685  mass 1  {actress, actor}
;;      c780  mass 1  {David}
;;     c1371  mass 0.5  {professional}
;;     c2069  mass 0.5  {group}

;; ---- slot take.Agent  [event center]  n 9  clusters 8
(And (Member $e0 take) (Agent $e0 $x1))
;;     c1429  mass 2  {person, people}
;;     c1179  mass 1  {cook}
;;     c2646  mass 1  {thing, things}
;;      c705  mass 1  {Jerry Rawlings}
;;      c712  mass 1  {president, person, president}
;;      c772  mass 1  {Michael}
;;      c828  mass 1  {Gustavo, Edmundo}
;;      c832  mass 1  {Janos, Lajos}

;; ---- slot become.Result  [event center]  n 8  clusters 7
(And (Member $e0 become) (Result $e0 $x1))
;;     c1645  mass 2  {bad}
;;      c111  mass 1  {indigenous, indigenous, people}
;;     c1631  mass 1  {alarmed}
;;      c194  mass 1  {lax}
;;     c2126  mass 1  {red}
;;      c542  mass 1  {conservative}
;;      c745  mass 1  {inomaru}

;; ---- slot change.Patient  [event center]  n 8  clusters 7
(And (Member $e0 change) (Patient $e0 $x1))
;;     c1837  mass 2  {weather}
;;     c1430  mass 1  {name}
;;     c1808  mass 1  {rain}
;;     c2333  mass 1  {color}
;;     c2646  mass 1  {thing, things}
;;      c905  mass 1  {mind}
;;      c950  mass 1  {course}

;; ---- slot hear.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 hear) (Experiencer $e0 $x1))
;;      c787  mass 2  {Bruno}
;;      c762  mass 1  {Oleg}
;;      c778  mass 1  {James}
;;      c794  mass 1  {Jonas, Jonathan}
;;      c804  mass 1  {Fadil}
;;      c834  mass 1  {Claudio, Flavio}
;;      c836  mass 1  {Martino, Damiano}

;; ---- slot live.Agent  [event center]  n 8  clusters 8
(And (Member $e0 live) (Agent $e0 $x1))
;;     c1341  mass 1  {wolf, wolves}
;;      c234  mass 1  {Beja}
;;      c773  mass 1  {Mary, Maria}
;;      c812  mass 1  {Tiziri}
;;      c814  mass 1  {Yidir}
;;      c819  mass 1  {Elias}
;;      c848  mass 1  {Ray Kurtzweil}
;;      c891  mass 1  {Cainan}

;; ---- slot live.Location  [event center]  n 8  clusters 8
(And (Member $e0 live) (Location $e0 $x1))
;;      c292  mass 2  {Denmark, Norway}
;;     c1738  mass 1.5  {house, home}
;;      c201  mass 1  {southeastern corner}
;;     c2069  mass 1  {group}
;;      c216  mass 1  {suburb}
;;     c1949  mass 0.5  {comfortable}
;;     c2204  mass 0.5  {big, large, huge}
;;     c2792  mass 0.5  {isolated}

;; ---- slot need.Experiencer  [event center]  n 8  clusters 8
(And (Member $e0 need) (Experiencer $e0 $x1))
;;     c1201  mass 1  {sauce}
;;      c130  mass 1  {doctor}
;;     c1468  mass 1  {child, kid}
;;      c264  mass 1  {Algeria, Morocco}
;;     c2728  mass 1  {gate}
;;      c776  mass 1  {Karl}
;;      c836  mass 1  {Martino, Damiano}
;;      c866  mass 1  {Yanni}

;; ---- slot open.Patient  [event center]  n 8  clusters 4
(And (Member $e0 open) (Patient $e0 $x1))
;;     c1727  mass 4.5  {door}
;;      c547  mass 2  {law, laws, legal}
;;      c404  mass 1  {bank}
;;     c1716  mass 0.5  {vault like}

;; ---- slot play.Theme  [event center]  n 8  clusters 7
(And (Member $e0 play) (Theme $e0 $x1))
;;      c359  mass 2  {tennis}
;;      c721  mass 2  {Holly Golightly}
;;     c1091  mass 1  {harp}
;;     c1917  mass 1  {series}
;;     c2269  mass 1  {role}
;;     c2272  mass 0.5  {crucial}
;;     c2273  mass 0.5  {important}

;; ---- slot produce.Agent  [event center]  n 8  clusters 7
(And (Member $e0 produce) (Agent $e0 $x1))
;;      c873  mass 2  {Colin Richardson}
;;      c882  mass 2  {Harvey Hayutin}
;;      c883  mass 2  {Sy Weintraub}
;;      c147  mass 1  {pancreas}
;;     c2481  mass 0.333  {layer}
;;     c2621  mass 0.333  {thin}
;;      c460  mass 0.333  {oil}

;; ---- slot speak.Agent  [event center]  n 8  clusters 6
(And (Member $e0 speak) (Agent $e0 $x1))
;;      c734  mass 2  {Sophia}
;;      c818  mass 2  {Oates}
;;     c1447  mass 1  {man, guy}
;;      c700  mass 1  {Xavier}
;;      c747  mass 1  {Mie Sonozaki, Soichiro Akizuki}
;;      c893  mass 1  {Kari Wahlgren}

;; ---- slot talk.Agent  [event center]  n 8  clusters 7
(And (Member $e0 talk) (Agent $e0 $x1))
;;      c735  mass 2  {Katherine, Kate}
;;     c1396  mass 1  {school janitor}
;;     c1435  mass 1  {friend}
;;      c530  mass 1  {novelist}
;;      c739  mass 1  {Linda}
;;      c841  mass 1  {Daniel}
;;      c847  mass 1  {Jordan Peterson}

;; ---- slot use.Agent  [event center]  n 8  clusters 7
(And (Member $e0 use) (Agent $e0 $x1))
;;      c102  mass 2  {localized version, localized versions}
;;     c1080  mass 1  {singer}
;;       c12  mass 1  {ukrainian army}
;;     c1443  mass 1  {father, Dad, dad}
;;      c231  mass 1  {algerian government}
;;      c709  mass 1  {Churchill}
;;      c902  mass 1  {human brain}

;; ---- slot walk.Agent  [event center]  n 8  clusters 8
(And (Member $e0 walk) (Agent $e0 $x1))
;;     c1396  mass 1  {school janitor}
;;     c2897  mass 1  {ant}
;;       c73  mass 1  {customer}
;;      c748  mass 1  {Hanako, Mariko, Yumi}
;;      c772  mass 1  {Michael}
;;      c789  mass 1  {Felix}
;;      c824  mass 1  {Leon}
;;      c835  mass 1  {Adriano}

;; ---- slot want.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 want) (Experiencer $e0 $x1))
;;      c690  mass 2  {Aslan}
;;     c1199  mass 1  {Pepper}
;;     c1281  mass 1  {cat, cats}
;;      c793  mass 1  {Tony}
;;      c824  mass 1  {Leon}
;;      c828  mass 1  {Gustavo, Edmundo}
;;      c831  mass 1  {Benedito}

;; ---- slot work.Agent  [event center]  n 8  clusters 9
(And (Member $e0 work) (Agent $e0 $x1))
;;     c1397  mass 1  {volunteer, volunteers}
;;     c1429  mass 1  {person, people}
;;     c1443  mass 1  {father, Dad, dad}
;;      c765  mass 1  {Dmitri}
;;      c808  mass 1  {Asserson}
;;      c840  mass 1  {Dan}
;;      c853  mass 1  {Mr. Jones}
;;     c1092  mass 0.5  {adaptor}
;;     c1454  mass 0.5  {old}

;; ---- slot write.Agent  [event center]  n 8  clusters 6
(And (Member $e0 write) (Agent $e0 $x1))
;;     c1429  mass 2.5  {person, people}
;;      c781  mass 2  {Gilles Thibaut}
;;      c881  mass 2  {Bill Wrubel}
;;     c1378  mass 0.5  {busy}
;;     c1443  mass 0.5  {father, Dad, dad}
;;     c1481  mass 0.5  {famous}

;; ---- slot come.Agent  [event center]  n 7  clusters 7
(And (Member $e0 come) (Agent $e0 $x1))
;;     c1447  mass 1  {man, guy}
;;     c1500  mass 1  {country}
;;     c2096  mass 1  {sleep}
;;     c2151  mass 1  {train}
;;     c2170  mass 1  {discussion}
;;      c603  mass 1  {bus}
;;      c936  mass 1  {student}

;; ---- slot contain.Agent  [event center]  n 7  clusters 6
(And (Member $e0 contain) (Agent $e0 $x1))
;;     c1031  mass 1.5  {deck, cards, deck}
;;     c1032  mass 1.5  {card}
;;     c1033  mass 1  {chest}
;;     c1078  mass 1  {song, sing}
;;     c1095  mass 1  {plasma}
;;      c139  mass 1  {vitamin pill}

;; ---- slot contain.Theme  [event center]  n 7  clusters 8
(And (Member $e0 contain) (Theme $e0 $x1))
;;      c702  mass 2  {king, queen}
;;     c1933  mass 1  {jack}
;;      c478  mass 1  {electrolyte, electrolytes}
;;      c492  mass 1  {gold coin, gold, gold coins}
;;     c1076  mass 0.5  {lyric, lyrics}
;;      c138  mass 0.5  {nutrition}
;;     c1674  mass 0.5  {degrading}
;;     c2192  mass 0.5  {abundant}

;; ---- slot create.Patient  [event center]  n 7  clusters 6
(And (Member $e0 create) (Patient $e0 $x1))
;;      c922  mass 4  {community}
;;       c61  mass 1  {particle accelerator}
;;     c1527  mass 0.5  {language}
;;     c2042  mass 0.5  {calendar}
;;     c2283  mass 0.5  {new}
;;     c2501  mass 0.5  {various}

;; ---- slot form.Agent  [event center]  n 7  clusters 6
(And (Member $e0 form) (Agent $e0 $x1))
;;      c862  mass 2  {Jon Bon Jovi}
;;      c863  mass 2  {Sambora}
;;     c1392  mass 1  {labourer, labourers}
;;      c475  mass 1  {technetium}
;;     c2229  mass 0.5  {complex, complicated}
;;     c2627  mass 0.5  {simple}

;; ---- slot get.Patient  [event center]  n 7  clusters 12
(And (Member $e0 get) (Patient $e0 $x1))
;;     c1645  mass 1  {bad}
;;      c261  mass 1  {Iran, Iraq}
;;     c1636  mass 0.5  {excuse}
;;     c1792  mass 0.5  {fire}
;;     c1837  mass 0.5  {weather}
;;     c2009  mass 0.5  {expensive}
;;     c2011  mass 0.5  {cheap, inexpensive}
;;     c2100  mass 0.5  {day}
;;     c2156  mass 0.5  {problem, problems}
;;     c2204  mass 0.5  {big, large, huge}
;;     c2629  mass 0.5  {short}
;;     c2646  mass 0.5  {thing, things}

;; ---- slot make.Result  [event center]  n 7  clusters 8
(And (Member $e0 make) (Result $e0 $x1))
;;     c1616  mass 1  {uncomfortable}
;;     c1645  mass 1  {bad}
;;     c1657  mass 1  {dangerous, hazardous}
;;     c1984  mass 1  {beautiful, gorgeous}
;;     c2332  mass 1  {white}
;;      c702  mass 1  {king, queen}
;;     c1500  mass 0.5  {country}
;;     c2870  mass 0.5  {back, backward}

;; ---- slot sell.Theme  [event center]  n 7  clusters 8
(And (Member $e0 sell) (Theme $e0 $x1))
;;     c1129  mass 2  {ice cream, ice cone, ice cream cone}
;;     c1156  mass 1  {milk}
;;     c2245  mass 1  {copy}
;;     c2646  mass 1  {thing, things}
;;     c1178  mass 0.5  {roasted}
;;     c1209  mass 0.5  {bean}
;;     c1886  mass 0.5  {cell phone, mobile phone}
;;     c2283  mass 0.5  {new}

;; ---- slot serve.Theme  [event center]  n 7  clusters 4
(And (Member $e0 serve) (Theme $e0 $x1))
;;      c195  mass 3  {Springfield Station}
;;      c176  mass 2  {Springfield}
;;     c1607  mass 1  {revenge}
;;       c79  mass 1  {coffee}

;; ---- slot try.Theme  [event center]  n 7  clusters 7
(And (Member $e0 try) (Theme $e0 $x1))
;;     c2334  mass 1  {burnish}
;;     c2701  mass 1  {pull}
;;     c2711  mass 1  {reach}
;;     c2860  mass 1  {give up}
;;      c431  mass 1  {steal}
;;      c451  mass 1  {abuse}
;;       c68  mass 1  {call}

;; ---- slot turn.Patient  [event center]  n 7  clusters 11
(And (Member $e0 turn) (Patient $e0 $x1))
;;     c2115  mass 1  {war}
;;       c28  mass 1  {russian speech}
;;      c636  mass 1  {road, roads}
;;      c828  mass 1  {Gustavo, Edmundo}
;;     c1712  mass 0.5  {ceiling}
;;     c2331  mass 0.5  {black}
;;      c535  mass 0.5  {gusher}
;;      c539  mass 0.5  {freedom movement}
;;     c1236  mass 0.333  {leaf, leaves}
;;     c2126  mass 0.333  {red}
;;     c2325  mass 0.333  {yellow}

;; ---- slot win.Agent  [event center]  n 7  clusters 4
(And (Member $e0 win) (Agent $e0 $x1))
;;      c710  mass 3  {Wilson, wilson}
;;      c849  mass 2  {James Woods}
;;     c1329  mass 1  {horse}
;;     c2060  mass 1  {away team}

;; ---- slot <unclassed>.Only  [entity center]  n 6  clusters 4
(Only $x0 $x1)
;;     c2745  mass 2  {have}
;;     c2911  mass 2  {find, found}
;;     c1417  mass 1  {solve}
;;     c2880  mass 1  {like}

;; ---- slot appear.Agent  [event center]  n 6  clusters 3
(And (Member $e0 appear) (Agent $e0 $x1))
;;     c1429  mass 3  {person, people}
;;      c872  mass 2  {Brian Packham, Paul Cavanagh, Paul Paul Cavanagh, Philip Hercus}
;;     c1420  mass 1  {sister, sisters}

;; ---- slot bear.Patient  [event center]  n 6  clusters 5
(And (Member $e0 bear) (Patient $e0 $x1))
;;     c1429  mass 3  {person, people}
;;      c692  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c821  mass 1  {Tobias}
;;     c1447  mass 0.5  {man, guy}
;;     c1649  mass 0.5  {poor, poorly}

;; ---- slot build.Instrument  [event center]  n 6  clusters 5
(And (Member $e0 build) (Instrument $e0 $x1))
;;     c1842  mass 2  {barometer}
;;     c2707  mass 2  {help}
;;     c1866  mass 1  {presented in scale, presented, scale}
;;     c1867  mass 0.5  {scale}
;;     c2777  mass 0.5  {presented}

;; ---- slot capture.Theme  [event center]  n 6  clusters 6
(And (Member $e0 capture) (Theme $e0 $x1))
;;     c1307  mass 1  {magpie}
;;     c1489  mass 1  {Valerian}
;;       c15  mass 1  {merchant ship}
;;       c16  mass 1  {british ship}
;;      c209  mass 1  {capital}
;;      c235  mass 1  {algerian city, algerian cities}

;; ---- slot cause.Agent  [event center]  n 6  clusters 6
(And (Member $e0 cause) (Agent $e0 $x1))
;;     c1287  mass 1  {demon, devil}
;;     c1818  mass 1  {storm}
;;     c2646  mass 1  {thing, things}
;;      c519  mass 1  {news}
;;      c630  mass 1  {walk}
;;      c982  mass 1  {tide, tides}

;; ---- slot create.Agent  [event center]  n 6  clusters 4
(And (Member $e0 create) (Agent $e0 $x1))
;;      c110  mass 2  {native american, indigenous american, indigenous americans, native americans}
;;      c117  mass 2  {european american settler, european american settlers}
;;      c529  mass 1  {writer}
;;      c756  mass 1  {Paul}

;; ---- slot enter.Agent  [event center]  n 6  clusters 5
(And (Member $e0 enter) (Agent $e0 $x1))
;;      c952  mass 2  {Issaquah Creek, Lake Sammamish}
;;     c1429  mass 1  {person, people}
;;      c325  mass 1  {muslim, muslims}
;;      c722  mass 1  {Layla}
;;      c836  mass 1  {Martino, Damiano}

;; ---- slot form.Patient  [event center]  n 6  clusters 7
(And (Member $e0 form) (Patient $e0 $x1))
;;     c1063  mass 2  {main songwriting unit, main, songwriting unit}
;;      c475  mass 1  {technetium}
;;      c668  mass 1  {human barricade}
;;     c1064  mass 0.5  {songwriting unit}
;;     c2229  mass 0.5  {complex, complicated}
;;     c2627  mass 0.5  {simple}
;;     c2702  mass 0.5  {main}

;; ---- slot fund.Agent  [event center]  n 6  clusters 3
(And (Member $e0 fund) (Agent $e0 $x1))
;;      c297  mass 3  {JICA}
;;      c576  mass 2  {government}
;;      c242  mass 1  {Government of Uganda}

;; ---- slot get.Agent  [event center]  n 6  clusters 7
(And (Member $e0 get) (Agent $e0 $x1))
;;     c2646  mass 1  {thing, things}
;;      c770  mass 1  {Leonid}
;;      c820  mass 1  {Gabriel}
;;      c827  mass 1  {Diego}
;;      c832  mass 1  {Janos, Lajos}
;;     c1447  mass 0.5  {man, guy}
;;     c1461  mass 0.5  {young}

;; ---- slot get.Result  [event center]  n 6  clusters 6
(And (Member $e0 get) (Result $e0 $x1))
;;     c1645  mass 1  {bad}
;;     c2009  mass 1  {expensive}
;;     c2011  mass 1  {cheap, inexpensive}
;;     c2216  mass 1  {powerful}
;;     c2629  mass 1  {short}
;;     c2723  mass 1  {ready}

;; ---- slot help.Agent  [event center]  n 6  clusters 6
(And (Member $e0 help) (Agent $e0 $x1))
;;     c1784  mass 1  {hothouse condition, hothouse conditions}
;;     c2516  mass 1  {life experience}
;;     c2639  mass 1  {context}
;;      c772  mass 1  {Michael}
;;      c794  mass 1  {Jonas, Jonathan}
;;      c842  mass 1  {Karen}

;; ---- slot receive.Theme  [event center]  n 6  clusters 6
(And (Member $e0 receive) (Theme $e0 $x1))
;;     c1375  mass 2  {work}
;;     c2698  mass 1  {award}
;;     c2853  mass 1  {permit, permitted}
;;     c2937  mass 1  {honorary knighthood}
;;     c2283  mass 0.5  {new}
;;      c613  mass 0.5  {car}

;; ---- slot run.Agent  [event center]  n 6  clusters 5
(And (Member $e0 run) (Agent $e0 $x1))
;;      c858  mass 2  {George Allen, Chuck Robb}
;;      c130  mass 1  {doctor}
;;     c1330  mass 1  {goat}
;;     c1340  mass 1  {squirrel}
;;      c821  mass 1  {Tobias}

;; ---- slot sleep.Experiencer  [event center]  n 6  clusters 4
(And (Member $e0 sleep) (Experiencer $e0 $x1))
;;     c1281  mass 2  {cat, cats}
;;     c1468  mass 2  {child, kid}
;;     c1275  mass 1  {dog}
;;      c752  mass 1  {Baya}

;; ---- slot speak.Theme  [event center]  n 6  clusters 6
(And (Member $e0 speak) (Theme $e0 $x1))
;;      c807  mass 2  {Ashe}
;;     c1526  mass 1  {english}
;;     c2335  mass 1  {polish}
;;       c29  mass 1  {czech}
;;     c1527  mass 0.5  {language}
;;      c561  mass 0.5  {foreign, foreigner}

;; ---- slot start.Agent  [event center]  n 6  clusters 7
(And (Member $e0 start) (Agent $e0 $x1))
;;     c1179  mass 1  {cook}
;;     c1396  mass 1  {school janitor}
;;     c1472  mass 1  {girl}
;;      c750  mass 1  {Skura, Inomaru}
;;      c776  mass 1  {Karl}
;;     c1557  mass 0.5  {crowd, crowd, whole}
;;     c2810  mass 0.5  {whole, entire}

;; ---- slot study.Location  [event center]  n 6  clusters 4
(And (Member $e0 study) (Location $e0 $x1))
;;      c699  mass 2  {Davis Studio}
;;      c701  mass 2  {Julian Ashton Art School}
;;      c191  mass 1  {Munich}
;;      c939  mass 1  {university, college}

;; ---- slot write.CoAgent  [event center]  n 6  clusters 3
(And (Member $e0 write) (CoAgent $e0 $x1))
;;      c724  mass 2  {Laurie Aubanel, Muriel Zazoui}
;;      c726  mass 2  {Bianca Olsen}
;;      c887  mass 2  {Cyril Rambour}

;; ---- slot add.Agent  [event center]  n 5  clusters 4
(And (Member $e0 add) (Agent $e0 $x1))
;;     c2646  mass 2  {thing, things}
;;     c1179  mass 1  {cook}
;;     c1248  mass 1  {plant, plants}
;;      c860  mass 1  {J. Augustus Knapp}

;; ---- slot appear.Location  [event center]  n 5  clusters 4
(And (Member $e0 appear) (Location $e0 $x1))
;;       c82  mass 2  {cafe}
;;     c1512  mass 1  {comedic role}
;;      c303  mass 1  {musical film}
;;        c6  mass 1  {Coronation Street}

;; ---- slot buy.Theme  [event center]  n 5  clusters 7
(And (Member $e0 buy) (Theme $e0 $x1))
;;     c1194  mass 1  {food}
;;     c1738  mass 1  {house, home}
;;     c1892  mass 1  {computer}
;;     c2325  mass 0.5  {yellow}
;;     c2326  mass 0.5  {blue}
;;      c503  mass 0.5  {trouser, trousers}
;;      c506  mass 0.5  {shirt}

;; ---- slot cry.Agent  [event center]  n 5  clusters 5
(And (Member $e0 cry) (Agent $e0 $x1))
;;     c1004  mass 1  {Rima}
;;     c1472  mass 1  {girl}
;;      c750  mass 1  {Skura, Inomaru}
;;      c752  mass 1  {Baya}
;;      c830  mass 1  {Alberto}

;; ---- slot direct.Agent  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Agent $e0 $x1))
;;      c869  mass 2  {Lev L. Spiro}
;;     c1090  mass 1  {conductor}
;;      c717  mass 1  {Claude Lelouch}
;;      c877  mass 1  {Robert Day}

;; ---- slot direct.Patient  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Patient $e0 $x1))
;;     c1918  mass 2  {episode}
;;      c302  mass 1.5  {movie, film}
;;     c2646  mass 1  {thing, things}
;;      c300  mass 0.5  {syrian film, film, syrian film}

;; ---- slot draw.Agent  [event center]  n 5  clusters 3
(And (Member $e0 draw) (Agent $e0 $x1))
;;     c1468  mass 2  {child, kid}
;;      c856  mass 2  {Cowper}
;;     c1568  mass 1  {concert}

;; ---- slot eat.Patient  [event center]  n 5  clusters 4
(And (Member $e0 eat) (Patient $e0 $x1))
;;     c1100  mass 2  {cookie, cookies}
;;     c1169  mass 1  {bread}
;;     c1182  mass 1  {chicken}
;;     c1337  mass 1  {rabbit}

;; ---- slot fly.Agent  [event center]  n 5  clusters 5
(And (Member $e0 fly) (Agent $e0 $x1))
;;     c1000  mass 1  {rocket}
;;     c1304  mass 1  {insect, insects}
;;     c1311  mass 1  {eagle}
;;      c587  mass 1  {plane, aeroplane, airplane}
;;      c698  mass 1  {Superman}

;; ---- slot include.Theme  [event center]  n 5  clusters 5
(And (Member $e0 include) (Theme $e0 $x1))
;;     c1084  mass 1  {marching band, marching bands}
;;      c125  mass 1  {extradition clause}
;;      c672  mass 1  {Armaan Jain}
;;      c673  mass 1  {Ranbir Kapoor}
;;      c674  mass 1  {Nikhil Nanda}

;; ---- slot lead.Agent  [event center]  n 5  clusters 4
(And (Member $e0 lead) (Agent $e0 $x1))
;;     c2646  mass 2  {thing, things}
;;     c1275  mass 1  {dog}
;;     c2237  mass 1  {general, general purpose}
;;      c941  mass 1  {education}

;; ---- slot lead.Goal  [event center]  n 5  clusters 7
(And (Member $e0 lead) (Goal $e0 $x1))
;;     c1738  mass 1  {house, home}
;;     c1957  mass 1  {peace}
;;     c1967  mass 1  {happiness, joy}
;;     c1280  mass 0.5  {cat fight}
;;     c1490  mass 0.5  {glory}
;;     c2204  mass 0.5  {big, large, huge}
;;     c2858  mass 0.5  {lose, lost}

;; ---- slot marry.Agent  [event center]  n 5  clusters 4
(And (Member $e0 marry) (Agent $e0 $x1))
;;      c732  mass 2  {Margaret Fleming}
;;      c742  mass 1  {Nancy}
;;      c782  mass 1  {James of Barrochan}
;;      c889  mass 1  {Steve}

;; ---- slot need.Theme  [event center]  n 5  clusters 5
(And (Member $e0 need) (Theme $e0 $x1))
;;     c1860  mass 1  {paint, painting}
;;     c2142  mass 1  {run}
;;     c2464  mass 1  {generate}
;;     c2498  mass 1  {understand}
;;       c96  mass 1  {go}

;; ---- slot portray.Agent  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Agent $e0 $x1))
;;      c710  mass 2  {Wilson, wilson}
;;      c747  mass 2  {Mie Sonozaki, Soichiro Akizuki}
;;      c849  mass 1  {James Woods}

;; ---- slot portray.Theme  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Theme $e0 $x1))
;;      c755  mass 2  {Kantaro Suga}
;;      c849  mass 2  {James Woods}
;;      c710  mass 1  {Wilson, wilson}

;; ---- slot present.Theme  [event center]  n 5  clusters 4
(And (Member $e0 present) (Theme $e0 $x1))
;;     c1078  mass 2  {song, sing}
;;     c1861  mass 1  {picture, image}
;;     c2167  mass 1  {play}
;;     c2304  mass 1  {golden opportunity}

;; ---- slot provide.Agent  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Agent $e0 $x1))
;;     c1151  mass 1  {kitchen island}
;;     c1556  mass 1  {witness, witnesses}
;;     c2035  mass 1  {organisation}
;;      c389  mass 1  {power station}
;;      c515  mass 1  {media}

;; ---- slot provide.Theme  [event center]  n 5  clusters 7
(And (Member $e0 provide) (Theme $e0 $x1))
;;     c1194  mass 1  {food}
;;     c1523  mass 1  {plurivocality}
;;      c387  mass 1  {electricity}
;;     c1914  mass 0.5  {counter space}
;;     c2027  mass 0.5  {detailed}
;;     c2028  mass 0.5  {description}
;;     c2770  mass 0.5  {extra}

;; ---- slot ready.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 ready) (Experiencer $e0 $x1))
;;     c1173  mass 1  {cake}
;;     c1188  mass 1  {dinner}
;;      c750  mass 1  {Skura, Inomaru}
;;      c770  mass 1  {Leonid}
;;      c866  mass 1  {Yanni}

;; ---- slot sell.Agent  [event center]  n 5  clusters 5
(And (Member $e0 sell) (Agent $e0 $x1))
;;     c1381  mass 2  {company}
;;      c516  mass 1  {newspaper, newspapers}
;;      c810  mass 1  {Mennad}
;;     c1497  mass 0.5  {indie}
;;       c77  mass 0.5  {coffee brand}

;; ---- slot sing.Theme  [event center]  n 5  clusters 2
(And (Member $e0 sing) (Theme $e0 $x1))
;;     c1074  mass 4  {music}
;;     c1078  mass 1  {song, sing}

;; ---- slot sing.To  [event center]  n 5  clusters 3
(And (Member $e0 sing) (To $e0 $x1))
;;     c2380  mass 4  {accompany}
;;     c1074  mass 0.5  {music}
;;     c1652  mass 0.5  {sad}

;; ---- slot sleep.Location  [event center]  n 5  clusters 3
(And (Member $e0 sleep) (Location $e0 $x1))
;;     c1750  mass 3  {couch}
;;     c1410  mass 1  {mat}
;;     c2544  mass 1  {inside}

;; ---- slot stand.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 stand) (Experiencer $e0 $x1))
;;     c2237  mass 1  {general, general purpose}
;;      c827  mass 1  {Diego}
;;      c828  mass 1  {Gustavo, Edmundo}
;;      c830  mass 1  {Alberto}
;;      c936  mass 1  {student}

;; ---- slot start.Experiencer  [event center]  n 5  clusters 4
(And (Member $e0 start) (Experiencer $e0 $x1))
;;      c206  mass 2  {bridge}
;;      c762  mass 1  {Oleg}
;;      c823  mass 1  {Gunter}
;;      c899  mass 1  {tunnel}

;; ---- slot study.Theme  [event center]  n 5  clusters 6
(And (Member $e0 study) (Theme $e0 $x1))
;;      c240  mass 1  {Arabic}
;;     c2762  mass 1  {rate}
;;      c384  mass 1  {mechanical engineering}
;;      c552  mass 1  {canon law}
;;      c150  mass 0.5  {bacterium}
;;     c2283  mass 0.5  {new}

;; ---- slot swim.Agent  [event center]  n 5  clusters 5
(And (Member $e0 swim) (Agent $e0 $x1))
;;     c1269  mass 1.5  {fish}
;;     c1468  mass 1  {child, kid}
;;      c739  mass 1  {Linda}
;;      c942  mass 1  {school}
;;     c2126  mass 0.5  {red}

;; ---- slot travel.Agent  [event center]  n 5  clusters 4
(And (Member $e0 travel) (Agent $e0 $x1))
;;     c1429  mass 2  {person, people}
;;      c570  mass 1  {campaigner}
;;      c775  mass 1  {Matthew}
;;      c797  mass 1  {Roger, Robert}

;; ---- slot turn.Result  [event center]  n 5  clusters 5
(And (Member $e0 turn) (Result $e0 $x1))
;;     c1310  mass 1  {crow}
;;     c2126  mass 1  {red}
;;     c2325  mass 1  {yellow}
;;     c2331  mass 1  {black}
;;      c535  mass 1  {gusher}

;; ---- slot watch.Agent  [event center]  n 5  clusters 5
(And (Member $e0 watch) (Agent $e0 $x1))
;;     c1429  mass 1  {person, people}
;;     c1431  mass 1  {family, families}
;;      c576  mass 1  {government}
;;      c752  mass 1  {Baya}
;;      c933  mass 1  {coach}

;; ---- slot win.Theme  [event center]  n 5  clusters 2
(And (Member $e0 win) (Theme $e0 $x1))
;;      c684  mass 4  {emmy}
;;      c452  mass 1  {race}

;; ---- slot bad.Between  [entity center]  n 4  clusters 2
(And (Member $x0 bad) (Between $x0 $x1))
;;      c291  mass 2  {Poland}
;;      c294  mass 2  {Germany}

;; ---- slot beauty.Possession  [entity center]  n 4  clusters 4
(And (Member $x0 beauty) (Possession $x0 $x1))
;;     c1015  mass 1  {scenery}
;;     c1403  mass 1  {sex, sexually}
;;     c1580  mass 1  {sight}
;;      c954  mass 1  {Lake Towada, Lake Akan}

;; ---- slot family.Possession  [entity center]  n 4  clusters 1
(And (Member $x0 family) (Possession $x0 $x1))
;;     c1429  mass 4  {person, people}

;; ---- slot northern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 northern) (LocatedIn $x0 $x1))
;;      c270  mass 2  {India, Indonesia}
;;      c290  mass 2  {Estonia}

;; ---- slot southern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 southern) (LocatedIn $x0 $x1))
;;      c252  mass 2  {North Africa, Africa}
;;      c270  mass 2  {India, Indonesia}

;; ---- slot accompany.Agent  [event center]  n 4  clusters 2
(And (Member $e0 accompany) (Agent $e0 $x1))
;;     c1420  mass 2  {sister, sisters}
;;     c1429  mass 2  {person, people}

;; ---- slot accompany.Theme  [event center]  n 4  clusters 1
(And (Member $e0 accompany) (Theme $e0 $x1))
;;      c304  mass 4  {silent film}

;; ---- slot active.Time  [event center]  n 4  clusters 2
(And (Member $e0 active) (Time $e0 $x1))
;;     c2083  mass 2  {morning, early morning}
;;     c2105  mass 2  {late afternoon}

;; ---- slot add.Theme  [event center]  n 4  clusters 3
(And (Member $e0 add) (Theme $e0 $x1))
;;     c1857  mass 2  {illustration, illustrations}
;;     c1197  mass 1  {clove, cloves}
;;     c1240  mass 1  {greenery}

;; ---- slot arrive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 arrive) (Agent $e0 $x1))
;;      c595  mass 1  {paris train}
;;      c607  mass 1  {driver}
;;      c784  mass 1  {Donald}
;;       c95  mass 1  {spring}

;; ---- slot avoid.Theme  [event center]  n 4  clusters 4
(And (Member $e0 avoid) (Theme $e0 $x1))
;;     c1639  mass 1  {pitfall, pitfalls}
;;     c2646  mass 1  {thing, things}
;;     c2827  mass 1  {conform}
;;      c408  mass 1  {bankruptcy}

;; ---- slot bad.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 bad) (Experiencer $e0 $x1))
;;     c1645  mass 2  {bad}
;;     c1438  mass 1  {relationship, relationships}
;;     c1837  mass 0.5  {weather}
;;     c2645  mass 0.5  {matter}

;; ---- slot bear.Location  [event center]  n 4  clusters 3
(And (Member $e0 bear) (Location $e0 $x1))
;;      c187  mass 2  {Bromma}
;;      c292  mass 1  {Denmark, Norway}
;;      c972  mass 1  {planet}

;; ---- slot begin.Patient  [event center]  n 4  clusters 4
(And (Member $e0 begin) (Patient $e0 $x1))
;;     c1259  mass 1  {tree, trees}
;;     c2107  mass 1  {night}
;;     c2132  mass 1  {uprising}
;;      c942  mass 1  {school}

;; ---- slot bring.Theme  [event center]  n 4  clusters 4
(And (Member $e0 bring) (Theme $e0 $x1))
;;       c16  mass 1  {british ship}
;;       c21  mass 1  {chinese dumpling}
;;     c2236  mass 1  {advantage}
;;      c794  mass 1  {Jonas, Jonathan}

;; ---- slot capture.Agent  [event center]  n 4  clusters 4
(And (Member $e0 capture) (Agent $e0 $x1))
;;     c1320  mass 1  {falcon}
;;      c285  mass 1  {Spain}
;;      c438  mass 1  {pirate, pirates}
;;      c664  mass 1  {troop}

;; ---- slot cause.Patient  [event center]  n 4  clusters 5
(And (Member $e0 cause) (Patient $e0 $x1))
;;     c1667  mass 1  {damage}
;;       c62  mass 1  {earthquake, earthquakes}
;;       c66  mass 1  {abandonment anxiety}
;;     c1055  mass 0.5  {sound}
;;     c1059  mass 0.5  {creaking, creaking, sound}

;; ---- slot change.Agent  [event center]  n 4  clusters 4
(And (Member $e0 change) (Agent $e0 $x1))
;;     c1236  mass 1  {leaf, leaves}
;;     c1447  mass 1  {man, guy}
;;      c280  mass 1  {French Dahomey}
;;      c708  mass 1  {Cameron}

;; ---- slot close.Experiencer  [event center]  n 4  clusters 2
(And (Member $e0 close) (Experiencer $e0 $x1))
;;       c34  mass 3  {Low German}
;;      c786  mass 1  {Boldi}

;; ---- slot come.Source  [event center]  n 4  clusters 4
(And (Member $e0 come) (Source $e0 $x1))
;;     c1235  mass 1  {garden}
;;     c1746  mass 1  {place, places}
;;     c2147  mass 1  {treeline}
;;      c343  mass 1  {greek}

;; ---- slot connect.Theme  [event center]  n 4  clusters 2
(And (Member $e0 connect) (Theme $e0 $x1))
;;      c167  mass 2  {Tokyo, Nagoya, Osaka}
;;      c961  mass 2  {Kayalar}

;; ---- slot create.Location  [event center]  n 4  clusters 1
(And (Member $e0 create) (Location $e0 $x1))
;;     c1901  mass 4  {post}

;; ---- slot decide.Agent  [event center]  n 4  clusters 3
(And (Member $e0 decide) (Agent $e0 $x1))
;;      c768  mass 2  {Fyodor}
;;      c737  mass 1  {Beth}
;;      c819  mass 1  {Elias}

;; ---- slot design.Agent  [event center]  n 4  clusters 3
(And (Member $e0 design) (Agent $e0 $x1))
;;      c880  mass 2  {Henry L. Taylor, Sherman Howard}
;;       c19  mass 1  {Robert Allan Limited}
;;      c872  mass 1  {Brian Packham, Paul Cavanagh, Paul Paul Cavanagh, Philip Hercus}

;; ---- slot design.Patient  [event center]  n 4  clusters 2
(And (Member $e0 design) (Patient $e0 $x1))
;;     c1956  mass 2  {pacificat, pacificats}
;;     c2646  mass 2  {thing, things}

;; ---- slot die.Patient  [event center]  n 4  clusters 2
(And (Member $e0 die) (Patient $e0 $x1))
;;     c1429  mass 3  {person, people}
;;     c1431  mass 1  {family, families}

;; ---- slot discover.Theme  [event center]  n 4  clusters 5
(And (Member $e0 discover) (Theme $e0 $x1))
;;     c1430  mass 2  {name}
;;       c48  mass 1  {pterosaur egg, pterosaur eggs}
;;     c2275  mass 0.333  {magnet}
;;     c2283  mass 0.333  {new}
;;     c2479  mass 0.333  {type}

;; ---- slot do.Patient  [event center]  n 4  clusters 4
(And (Member $e0 do) (Patient $e0 $x1))
;;     c2646  mass 2  {thing, things}
;;     c1185  mass 1  {dish}
;;     c1508  mass 0.5  {dance}
;;     c2623  mass 0.5  {little, small}

;; ---- slot eat.Agent  [event center]  n 4  clusters 5
(And (Member $e0 eat) (Agent $e0 $x1))
;;     c1313  mass 1  {bird, birds}
;;     c1429  mass 1  {person, people}
;;     c1468  mass 1  {child, kid}
;;     c1275  mass 0.5  {dog}
;;     c2329  mass 0.5  {brown}

;; ---- slot encourage.In  [event center]  n 4  clusters 3
(And (Member $e0 encourage) (In $e0 $x1))
;;     c1411  mass 2  {mathematics}
;;      c364  mass 1  {chess}
;;      c365  mass 1  {chess play}

;; ---- slot enter.Theme  [event center]  n 4  clusters 4
(And (Member $e0 enter) (Theme $e0 $x1))
;;     c1719  mass 1  {cave}
;;      c274  mass 1  {United States, U.S., USA}
;;      c622  mass 1  {park}
;;      c952  mass 1  {Issaquah Creek, Lake Sammamish}

;; ---- slot find.Agent  [event center]  n 4  clusters 3
(And (Member $e0 find) (Agent $e0 $x1))
;;      c617  mass 2  {Couper}
;;      c834  mass 1  {Claudio, Flavio}
;;      c838  mass 1  {Pietro}

;; ---- slot get.Theme  [event center]  n 4  clusters 5
(And (Member $e0 get) (Theme $e0 $x1))
;;     c1195  mass 1  {snack}
;;     c1339  mass 1  {hamster}
;;      c427  mass 1  {arrest}
;;     c2013  mass 0.5  {price, prices}
;;     c2625  mass 0.5  {low}

;; ---- slot give.Theme  [event center]  n 4  clusters 5
(And (Member $e0 give) (Theme $e0 $x1))
;;     c1128  mass 1  {mock champagne}
;;     c1134  mass 1  {chocolate}
;;     c2646  mass 1  {thing, things}
;;     c2234  mass 0.5  {advice, advise}
;;     c2841  mass 0.5  {good}

;; ---- slot good.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 good) (Experiencer $e0 $x1))
;;     c1160  mass 1  {barley bread}
;;     c1837  mass 1  {weather}
;;     c2646  mass 1  {thing, things}
;;      c582  mass 1  {windshield}

;; ---- slot help.Theme  [event center]  n 4  clusters 4
(And (Member $e0 help) (Theme $e0 $x1))
;;     c1429  mass 1  {person, people}
;;     c1472  mass 1  {girl}
;;     c2191  mass 1  {thrive}
;;     c2477  mass 1  {define}

;; ---- slot include.Agent  [event center]  n 4  clusters 2
(And (Member $e0 include) (Agent $e0 $x1))
;;     c1463  mass 3  {nephew, nephews}
;;     c1494  mass 1  {parade}

;; ---- slot increase.Patient  [event center]  n 4  clusters 4
(And (Member $e0 increase) (Patient $e0 $x1))
;;       c11  mass 1  {ukrainian combat loss, ukrainian combat losses}
;;      c391  mass 1  {industrial output}
;;      c453  mass 1  {xenophobia}
;;      c612  mass 1  {motor vehicle, vehicle, motor vehicles, vehicles}

;; ---- slot jump.Agent  [event center]  n 4  clusters 6
(And (Member $e0 jump) (Agent $e0 $x1))
;;     c1328  mass 1  {donkey}
;;     c1333  mass 1  {cow}
;;     c1464  mass 1  {boy}
;;     c1342  mass 0.333  {fox}
;;     c2329  mass 0.333  {brown}
;;     c2803  mass 0.333  {quickly, quick, fast}

;; ---- slot kill.Location  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Location $e0 $x1))
;;      c579  mass 3  {state}
;;     c2705  mass 1  {here}

;; ---- slot kill.Manner  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Manner $e0 $x1))
;;     c2368  mass 2  {indirectly}
;;     c2886  mass 2  {direct, directly}

;; ---- slot lie.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 lie) (Experiencer $e0 $x1))
;;     c1044  mass 1  {tape recorder}
;;     c1885  mass 1  {notebook}
;;     c2747  mass 1  {pen}
;;      c524  mass 1  {book}

;; ---- slot lie.Location  [event center]  n 4  clusters 1
(And (Member $e0 lie) (Location $e0 $x1))
;;     c1884  mass 4  {table}

;; ---- slot look.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 look) (Experiencer $e0 $x1))
;;      c251  mass 1  {Europe, Western Europe}
;;      c644  mass 1  {flag}
;;      c942  mass 1  {school}
;;      c990  mass 1  {island}

;; ---- slot look.Like  [event center]  n 4  clusters 6
(And (Member $e0 look) (Like $e0 $x1))
;;     c1493  mass 1  {paradise}
;;      c424  mass 1  {jail, prison}
;;     c1298  mass 0.5  {spider, spiders}
;;     c2204  mass 0.5  {big, large, huge}
;;     c2926  mass 0.5  {inverted}
;;      c643  mass 0.5  {philippine flag}

;; ---- slot move.Agent  [event center]  n 4  clusters 4
(And (Member $e0 move) (Agent $e0 $x1))
;;     c1391  mass 2  {headquarters}
;;      c803  mass 1  {Sammy}
;;     c1269  mass 0.5  {fish}
;;      c942  mass 0.5  {school}

;; ---- slot perform.Location  [event center]  n 4  clusters 3
(And (Member $e0 perform) (Location $e0 $x1))
;;       c82  mass 2  {cafe}
;;     c1738  mass 1  {house, home}
;;     c2662  mass 1  {public}

;; ---- slot preach.Agent  [event center]  n 4  clusters 1
(And (Member $e0 preach) (Agent $e0 $x1))
;;     c1429  mass 4  {person, people}

;; ---- slot preach.Location  [event center]  n 4  clusters 2
(And (Member $e0 preach) (Location $e0 $x1))
;;      c186  mass 2  {Gareccio}
;;      c284  mass 2  {Italy}

;; ---- slot present.Agent  [event center]  n 4  clusters 3
(And (Member $e0 present) (Agent $e0 $x1))
;;      c817  mass 2  {Horner}
;;     c1381  mass 1  {company}
;;     c2304  mass 1  {golden opportunity}

;; ---- slot receive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 receive) (Agent $e0 $x1))
;;      c123  mass 1  {refugee, refugees}
;;     c2697  mass 1  {win, winner}
;;      c658  mass 1  {General Franks}
;;      c737  mass 1  {Beth}

;; ---- slot replace.Agent  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Agent $e0 $x1))
;;      c880  mass 2  {Henry L. Taylor, Sherman Howard}
;;     c1429  mass 1  {person, people}
;;      c884  mass 1  {Peter Gaussen}

;; ---- slot replace.Theme  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Theme $e0 $x1))
;;      c697  mass 2  {Lex Lex Luthor, Lex Luthor}
;;     c1429  mass 1  {person, people}
;;      c870  mass 1  {O. R. Woodcock, William Ewer}

;; ---- slot require.Theme  [event center]  n 4  clusters 6
(And (Member $e0 require) (Theme $e0 $x1))
;;      c386  mass 1  {repair, repairs}
;;       c71  mass 1  {american phone number}
;;     c1029  mass 0.5  {id card}
;;     c1375  mass 0.5  {work}
;;     c2231  mass 0.5  {hard, harder}
;;     c2906  mass 0.5  {valid}

;; ---- slot specify.In  [event center]  n 4  clusters 2
(And (Member $e0 specify) (In $e0 $x1))
;;     c1680  mass 2  {continuous time}
;;     c1681  mass 2  {discrete time}

;; ---- slot spend.Agent  [event center]  n 4  clusters 3
(And (Member $e0 spend) (Agent $e0 $x1))
;;     c1429  mass 2  {person, people}
;;     c1326  mass 1  {giraffe, giraffes}
;;     c2073  mass 1  {May}

;; ---- slot star.Agent  [event center]  n 4  clusters 1
(And (Member $e0 star) (Agent $e0 $x1))
;;     c2646  mass 4  {thing, things}

;; ---- slot star.Theme  [event center]  n 4  clusters 2
(And (Member $e0 star) (Theme $e0 $x1))
;;      c725  mass 2  {Patricia Kaas}
;;      c850  mass 2  {Jeremy Irons}

;; ---- slot stop.Agent  [event center]  n 4  clusters 5
(And (Member $e0 stop) (Agent $e0 $x1))
;;     c1004  mass 1  {Rima}
;;      c750  mass 1  {Skura, Inomaru}
;;      c866  mass 1  {Yanni}
;;     c1092  mass 0.5  {adaptor}
;;     c1454  mass 0.5  {old}

;; ---- slot stop.Theme  [event center]  n 4  clusters 2
(And (Member $e0 stop) (Theme $e0 $x1))
;;     c1375  mass 2  {work}
;;     c1804  mass 2  {cry}

;; ---- slot support.Theme  [event center]  n 4  clusters 1
(And (Member $e0 support) (Theme $e0 $x1))
;;     c1869  mass 4  {view, views}

;; ---- slot use.Manner  [event center]  n 4  clusters 3
(And (Member $e0 use) (Manner $e0 $x1))
;;     c2377  mass 2  {rarely}
;;     c2266  mass 1  {responsibly}
;;     c2378  mass 1  {colloquially}

;; ---- slot use.To  [event center]  n 4  clusters 4
(And (Member $e0 use) (To $e0 $x1))
;;     c1177  mass 1  {roast}
;;     c2461  mass 1  {make}
;;     c2716  mass 1  {develop}
;;      c947  mass 1  {learn}

;; ---- slot walk.Goal  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Goal $e0 $x1))
;;     c1255  mass 1  {forest}
;;     c2004  mass 1  {store}
;;     c2870  mass 1  {back, backward}
;;      c946  mass 1  {classroom}

;; ---- slot walk.Location  [event center]  n 4  clusters 5
(And (Member $e0 walk) (Location $e0 $x1))
;;     c1714  mass 1  {wood floor}
;;     c1762  mass 1  {hallway}
;;     c2321  mass 1  {dark, darkness}
;;     c1358  mass 0.5  {balloon, balloon, little}
;;     c2623  mass 0.5  {little, small}

;; ---- slot watch.Theme  [event center]  n 4  clusters 4
(And (Member $e0 watch) (Theme $e0 $x1))
;;     c2045  mass 1  {event}
;;     c2534  mass 1  {activity, activities}
;;     c2938  mass 1  {natural hair video}
;;      c302  mass 1  {movie, film}

;; ---- slot win.For  [event center]  n 4  clusters 1
(And (Member $e0 win) (For $e0 $x1))
;;     c1854  mass 4  {portray, portrayal}

;; ---- slot work.Location  [event center]  n 4  clusters 4
(And (Member $e0 work) (Location $e0 $x1))
;;      c251  mass 1  {Europe, Western Europe}
;;      c337  mass 1  {Church of Norway}
;;      c390  mass 1  {factory, factories}
;;      c428  mass 1  {prison kitchen}

;; ---- slot bottom.PartOf  [entity center]  n 3  clusters 2
(And (Member $x0 bottom) (PartOf $x0 $x1))
;;      c510  mass 2  {page}
;;     c1147  mass 1  {stew pot}

;; ---- slot fight.Against  [entity center]  n 3  clusters 3
(And (Member $x0 fight) (Against $x0 $x1))
;;     c2442  mass 1  {dead, die, death}
;;     c2511  mass 1  {natural, nature}
;;      c310  mass 1  {fate}

;; ---- slot thing.LocatedIn  [entity center]  n 3  clusters 2
(And (Member $x0 thing) (LocatedIn $x0 $x1))
;;      c962  mass 2  {hill, mountain}
;;      c501  mass 1  {closet}

;; ---- slot active.Experiencer  [event center]  n 3  clusters 2
(And (Member $e0 active) (Experiencer $e0 $x1))
;;     c2646  mass 2  {thing, things}
;;      c808  mass 1  {Asserson}

;; ---- slot affect.Agent  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Agent $e0 $x1))
;;      c458  mass 3  {cyberattack}

;; ---- slot affect.Location  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Location $e0 $x1))
;;      c559  mass 3  {world}

;; ---- slot affect.Theme  [event center]  n 3  clusters 3
(And (Member $e0 affect) (Theme $e0 $x1))
;;      c135  mass 1  {hospital}
;;     c1381  mass 1  {company}
;;      c404  mass 1  {bank}

;; ---- slot affect.Time  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Time $e0 $x1))
;;     c2802  mass 3  {this year}

;; ---- slot approve.Theme  [event center]  n 3  clusters 3
(And (Member $e0 approve) (Theme $e0 $x1))
;;     c2024  mass 1  {treaty}
;;     c2039  mass 1  {plan}
;;     c2319  mass 1  {Bill, bill}

;; ---- slot attack.Patient  [event center]  n 3  clusters 3
(And (Member $e0 attack) (Patient $e0 $x1))
;;     c1745  mass 1  {building}
;;       c76  mass 1  {consumer rights}
;;      c829  mass 1  {Rodrigo}

;; ---- slot bake.Agent  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Agent $e0 $x1))
;;     c1381  mass 2  {company}
;;      c727  mass 1  {Ella}

;; ---- slot bake.Patient  [event center]  n 3  clusters 3
(And (Member $e0 bake) (Patient $e0 $x1))
;;     c1129  mass 2  {ice cream, ice cone, ice cream cone}
;;     c1115  mass 0.5  {scrumptious}
;;     c1174  mass 0.5  {pie}

;; ---- slot base.On  [event center]  n 3  clusters 3
(And (Member $e0 base) (On $e0 $x1))
;;     c2114  mass 1  {battle, fight}
;;      c341  mass 1  {puritan value}
;;       c39  mass 1  {latin alphabet}

;; ---- slot beautiful.Experiencer  [event center]  n 3  clusters 4
(And (Member $e0 beautiful) (Experiencer $e0 $x1))
;;     c1837  mass 1  {weather}
;;     c1984  mass 1  {beautiful, gorgeous}
;;     c1765  mass 0.5  {room, rooms}
;;      c996  mass 0.5  {moon}

;; ---- slot break_out.Patient  [event center]  n 3  clusters 3
(And (Member $e0 break_out) (Patient $e0 $x1))
;;     c1792  mass 1  {fire}
;;     c1796  mass 1  {forest fire, forest fires}
;;     c2115  mass 1  {war}

;; ---- slot bring.Goal  [event center]  n 3  clusters 3
(And (Member $e0 bring) (Goal $e0 $x1))
;;     c1944  mass 1  {gallows}
;;      c270  mass 1  {India, Indonesia}
;;      c274  mass 1  {United States, U.S., USA}

;; ---- slot buy.Agent  [event center]  n 3  clusters 2
(And (Member $e0 buy) (Agent $e0 $x1))
;;      c753  mass 2  {Keike}
;;      c815  mass 1  {Regis}

;; ---- slot close.Agent  [event center]  n 3  clusters 4
(And (Member $e0 close) (Agent $e0 $x1))
;;      c586  mass 1  {pilot}
;;      c665  mass 1  {guard, guards}
;;     c1326  mass 0.5  {giraffe, giraffes}
;;     c1421  mass 0.5  {woman, female}

;; ---- slot close.Goal  [event center]  n 3  clusters 3
(And (Member $e0 close) (Goal $e0 $x1))
;;       c31  mass 1  {Dutch}
;;       c32  mass 1  {Frisian}
;;       c33  mass 1  {High German}

;; ---- slot close.Patient  [event center]  n 3  clusters 2
(And (Member $e0 close) (Patient $e0 $x1))
;;     c1727  mass 2  {door}
;;     c2004  mass 1  {store}

;; ---- slot come.Goal  [event center]  n 3  clusters 4
(And (Member $e0 come) (Goal $e0 $x1))
;;     c1568  mass 1  {concert}
;;     c2633  mass 1  {conclusion}
;;     c2383  mass 0.5  {settlement, settle}
;;      c565  mass 0.5  {political}

;; ---- slot come.Patient  [event center]  n 3  clusters 3
(And (Member $e0 come) (Patient $e0 $x1))
;;     c1055  mass 1  {sound}
;;     c1294  mass 1  {insect sound, insect sounds}
;;     c1817  mass 1  {typhoon}

;; ---- slot come_back.Agent  [event center]  n 3  clusters 3
(And (Member $e0 come_back) (Agent $e0 $x1))
;;     c1440  mass 1  {Mom, mother, mom}
;;     c1443  mass 1  {father, Dad, dad}
;;     c1464  mass 1  {boy}

;; ---- slot compose.Patient  [event center]  n 3  clusters 3
(And (Member $e0 compose) (Patient $e0 $x1))
;;     c1078  mass 2  {song, sing}
;;     c1088  mass 0.5  {symphony}
;;     c2838  mass 0.5  {great}

;; ---- slot conduct.Agent  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Agent $e0 $x1))
;;      c874  mass 2  {Carl Fenton}
;;      c648  mass 1  {FBI}

;; ---- slot conduct.Theme  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Theme $e0 $x1))
;;     c1089  mass 2  {orchestra}
;;      c920  mass 1  {surveillance}

;; ---- slot cover.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Instrument $e0 $x1))
;;     c1250  mass 1  {weed}
;;     c1829  mass 1  {snow}
;;      c509  mass 1  {paper decoration, paper decorations}

;; ---- slot cover.Patient  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Patient $e0 $x1))
;;     c1760  mass 1  {courtyard}
;;     c2752  mass 1  {top}
;;      c375  mass 1  {shopping arcade}

;; ---- slot define.Theme  [event center]  n 3  clusters 2
(And (Member $e0 define) (Theme $e0 $x1))
;;     c1916  mass 2  {sequence, sequences}
;;     c2646  mass 1  {thing, things}

;; ---- slot die.Location  [event center]  n 3  clusters 2
(And (Member $e0 die) (Location $e0 $x1))
;;      c188  mass 2  {Stockholm}
;;     c1792  mass 1  {fire}

;; ---- slot drink.Patient  [event center]  n 3  clusters 3
(And (Member $e0 drink) (Patient $e0 $x1))
;;       c81  mass 2  {tea}
;;     c1813  mass 0.5  {water}
;;     c2841  mass 0.5  {good}

;; ---- slot drive.Agent  [event center]  n 3  clusters 2
(And (Member $e0 drive) (Agent $e0 $x1))
;;      c603  mass 2  {bus}
;;      c618  mass 1  {van}

;; ---- slot encourage.Agent  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Agent $e0 $x1))
;;      c801  mass 3  {Ralph}

;; ---- slot encourage.Theme  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Theme $e0 $x1))
;;      c790  mass 3  {Maurice}

;; ---- slot endorse.Theme  [event center]  n 3  clusters 1
(And (Member $e0 endorse) (Theme $e0 $x1))
;;     c1869  mass 3  {view, views}

;; ---- slot fall.Source  [event center]  n 3  clusters 3
(And (Member $e0 fall) (Source $e0 $x1))
;;     c1259  mass 1  {tree, trees}
;;     c1756  mass 1  {shelf}
;;     c1839  mass 1  {sky}

;; ---- slot fight.Agent  [event center]  n 3  clusters 2
(And (Member $e0 fight) (Agent $e0 $x1))
;;      c105  mass 2  {kabye person}
;;     c1385  mass 1  {union boss, union bosses}

;; ---- slot fight.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fight) (Theme $e0 $x1))
;;     c2347  mass 1  {freeze, freeze over}
;;      c319  mass 1  {islamic fundamentalism}
;;      c442  mass 1  {terrorism}

;; ---- slot fund.Theme  [event center]  n 3  clusters 2
(And (Member $e0 fund) (Theme $e0 $x1))
;;      c243  mass 2  {Lessos-Kenya, Lessos-Uganda}
;;      c204  mass 1  {border, border section}

;; ---- slot give.Agent  [event center]  n 3  clusters 2
(And (Member $e0 give) (Agent $e0 $x1))
;;      c763  mass 2  {Vladimir}
;;      c779  mass 1  {William}

;; ---- slot go.Manner  [event center]  n 3  clusters 2
(And (Member $e0 go) (Manner $e0 $x1))
;;     c2848  mass 2  {late, later}
;;     c2804  mass 1  {immediately, instantly, right away}

;; ---- slot go.To  [event center]  n 3  clusters 2
(And (Member $e0 go) (To $e0 $x1))
;;     c2169  mass 2  {talk, conversation}
;;     c2778  mass 1  {see}

;; ---- slot grow.Patient  [event center]  n 3  clusters 4
(And (Member $e0 grow) (Patient $e0 $x1))
;;     c1588  mass 1  {beard}
;;      c844  mass 1  {Kalman}
;;     c1055  mass 0.5  {sound}
;;     c2413  mass 0.5  {faint}

;; ---- slot have.In  [event center]  n 3  clusters 2
(And (Member $e0 have) (In $e0 $x1))
;;      c383  mass 2  {fluid mechanics}
;;     c1521  mass 1  {poetry}

;; ---- slot hold.Patient  [event center]  n 3  clusters 4
(And (Member $e0 hold) (Patient $e0 $x1))
;;     c2044  mass 1  {meeting}
;;      c338  mass 1  {prayer, prayers}
;;     c1571  mass 0.5  {ceremony}
;;     c2644  mass 0.5  {mass}

;; ---- slot lead.Theme  [event center]  n 3  clusters 4
(And (Member $e0 lead) (Theme $e0 $x1))
;;     c1331  mass 1  {sheep}
;;     c2061  mass 1  {squad}
;;     c1280  mass 0.5  {cat fight}
;;     c2204  mass 0.5  {big, large, huge}

;; ---- slot learn.Theme  [event center]  n 3  clusters 4
(And (Member $e0 learn) (Theme $e0 $x1))
;;     c1525  mass 1  {vocabulary}
;;     c2314  mass 1  {berber}
;;     c1527  mass 0.5  {language}
;;      c561  mass 0.5  {foreign, foreigner}

;; ---- slot leave.Patient  [event center]  n 3  clusters 5
(And (Member $e0 leave) (Patient $e0 $x1))
;;     c1727  mass 1  {door}
;;     c1723  mass 0.5  {unlocked}
;;     c2336  mass 0.5  {light}
;;     c2885  mass 0.5  {open}
;;     c2901  mass 0.5  {on}

;; ---- slot leave.Result  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Result $e0 $x1))
;;     c1723  mass 1  {unlocked}
;;     c2885  mass 1  {open}
;;     c2901  mass 1  {on}

;; ---- slot leave.Theme  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Theme $e0 $x1))
;;     c1765  mass 1  {room, rooms}
;;      c613  mass 1  {car}
;;      c621  mass 1  {parking lot, parking}

;; ---- slot lose.Agent  [event center]  n 3  clusters 2
(And (Member $e0 lose) (Agent $e0 $x1))
;;      c858  mass 2  {George Allen, Chuck Robb}
;;      c619  mass 1  {tire}

;; ---- slot move.Goal  [event center]  n 3  clusters 2
(And (Member $e0 move) (Goal $e0 $x1))
;;      c174  mass 2  {Baltimore}
;;     c2705  mass 1  {here}

;; ---- slot paint.Patient  [event center]  n 3  clusters 2
(And (Member $e0 paint) (Patient $e0 $x1))
;;     c1014  mass 2  {landscape}
;;     c2728  mass 1  {gate}

;; ---- slot pick_up.Agent  [event center]  n 3  clusters 3
(And (Member $e0 pick_up) (Agent $e0 $x1))
;;      c182  mass 1  {Santiago}
;;     c1876  mass 1  {camera}
;;      c795  mass 1  {Jack, Jay, Jim}

;; ---- slot play.Location  [event center]  n 3  clusters 2
(And (Member $e0 play) (Location $e0 $x1))
;;      c181  mass 2  {Havana}
;;     c1713  mass 1  {floor}

;; ---- slot pull.Theme  [event center]  n 3  clusters 5
(And (Member $e0 pull) (Theme $e0 $x1))
;;      c182  mass 1  {Santiago}
;;      c764  mass 1  {Boris}
;;     c2146  mass 0.333  {line}
;;     c2852  mass 0.333  {long}
;;      c591  mass 0.333  {freight train, freight car}

;; ---- slot read.Agent  [event center]  n 3  clusters 4
(And (Member $e0 read) (Agent $e0 $x1))
;;      c760  mass 1  {Katya}
;;      c792  mass 1  {Thomas}
;;     c1472  mass 0.5  {girl}
;;     c2623  mass 0.5  {little, small}

;; ---- slot read.Theme  [event center]  n 3  clusters 3
(And (Member $e0 read) (Theme $e0 $x1))
;;     c1513  mass 1  {comic}
;;      c309  mass 1  {fairy tale}
;;      c419  mass 1  {economics magazine}

;; ---- slot require.Agent  [event center]  n 3  clusters 3
(And (Member $e0 require) (Agent $e0 $x1))
;;     c1738  mass 1  {house, home}
;;     c2703  mass 1  {master}
;;     c2714  mass 1  {app}

;; ---- slot return.Agent  [event center]  n 3  clusters 2
(And (Member $e0 return) (Agent $e0 $x1))
;;      c671  mass 2  {Glasnow}
;;       c18  mass 1  {fishing boat}

;; ---- slot return.Goal  [event center]  n 3  clusters 2
(And (Member $e0 return) (Goal $e0 $x1))
;;      c178  mass 2  {Altoona}
;;     c1906  mass 1  {port}

;; ---- slot rule.Agent  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Agent $e0 $x1))
;;      c681  mass 2  {Tipu Sultan}
;;      c285  mass 1  {Spain}

;; ---- slot rule.Theme  [event center]  n 3  clusters 4
(And (Member $e0 rule) (Theme $e0 $x1))
;;      c268  mass 1  {Cuba}
;;      c324  mass 1  {muslim house, house, muslim}
;;     c1738  mass 0.5  {house, home}
;;      c325  mass 0.5  {muslim, muslims}

;; ---- slot say.Theme  [event center]  n 3  clusters 2
(And (Member $e0 say) (Theme $e0 $x1))
;;     c2646  mass 2  {thing, things}
;;      c313  mass 1  {funeral prayer}

;; ---- slot season.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 season) (Instrument $e0 $x1))
;;     c1198  mass 1  {lemongrass}
;;     c1206  mass 1  {horse radish}
;;     c1208  mass 1  {ramson}

;; ---- slot see.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 see) (Stimulus $e0 $x1))
;;     c1334  mass 1  {animal, animals}
;;      c738  mass 1  {Jessica}
;;      c995  mass 1  {full moon}

;; ---- slot shoot.Patient  [event center]  n 3  clusters 3
(And (Member $e0 shoot) (Patient $e0 $x1))
;;     c1348  mass 1  {bear}
;;      c715  mass 1  {JFK}
;;      c840  mass 1  {Dan}

;; ---- slot sleep.Agent  [event center]  n 3  clusters 2
(And (Member $e0 sleep) (Agent $e0 $x1))
;;     c1429  mass 2  {person, people}
;;     c1431  mass 1  {family, families}

;; ---- slot solve.Patient  [event center]  n 3  clusters 1
(And (Member $e0 solve) (Patient $e0 $x1))
;;     c2156  mass 3  {problem, problems}

;; ---- slot spend.Theme  [event center]  n 3  clusters 2
(And (Member $e0 spend) (Theme $e0 $x1))
;;      c124  mass 2  {exile}
;;     c2100  mass 1  {day}

;; ---- slot start.Location  [event center]  n 3  clusters 2
(And (Member $e0 start) (Location $e0 $x1))
;;      c293  mass 2  {Sweden}
;;      c292  mass 1  {Denmark, Norway}

;; ---- slot stick.Patient  [event center]  n 3  clusters 3
(And (Member $e0 stick) (Patient $e0 $x1))
;;     c1136  mass 1  {chewing gum}
;;     c1329  mass 1  {horse}
;;      c610  mass 1  {truck}

;; ---- slot succeed.Agent  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Agent $e0 $x1))
;;      c695  mass 1  {Alexander}
;;      c802  mass 1  {Bailey}
;;      c884  mass 1  {Peter Gaussen}

;; ---- slot succeed.Theme  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Theme $e0 $x1))
;;     c1429  mass 1  {person, people}
;;      c732  mass 1  {Margaret Fleming}
;;      c857  mass 1  {Henry Cole}

;; ---- slot take_off.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_off) (Agent $e0 $x1))
;;      c587  mass 2  {plane, aeroplane, airplane}
;;      c840  mass 1  {Dan}

;; ---- slot take_over.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_over) (Agent $e0 $x1))
;;      c711  mass 2  {Watts}
;;     c1243  mass 1  {ivy}

;; ---- slot talk.Recipient  [event center]  n 3  clusters 4
(And (Member $e0 talk) (Recipient $e0 $x1))
;;      c740  mass 1  {Loren}
;;      c932  mass 1  {teacher}
;;     c1558  mass 0.5  {audience}
;;     c2204  mass 0.5  {big, large, huge}

;; ---- slot turn.Goal  [event center]  n 3  clusters 3
(And (Member $e0 turn) (Goal $e0 $x1))
;;     c1518  mass 1  {quagmire}
;;     c2680  mass 1  {report}
;;      c957  mass 1  {river}

;; ---- slot understand.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 understand) (Stimulus $e0 $x1))
;;      c128  mass 1  {public health issue}
;;     c2157  mass 1  {specific issue}
;;     c2642  mass 1  {reason}

;; ---- slot wear.Theme  [event center]  n 3  clusters 3
(And (Member $e0 wear) (Theme $e0 $x1))
;;     c1585  mass 1  {mask}
;;      c507  mass 1  {inaugural gown}
;;      c581  mass 1  {helmet}

;; ---- slot welcome.Agent  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Agent $e0 $x1))
;;     c2706  mass 1  {host}
;;      c392  mass 1  {industrialization}
;;      c544  mass 1  {whig, whigs}

;; ---- slot welcome.Theme  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Theme $e0 $x1))
;;     c1562  mass 1  {guest}
;;      c392  mass 1  {industrialization}
;;      c544  mass 1  {whig, whigs}

;; ---- slot work.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 work) (Experiencer $e0 $x1))
;;     c1094  mass 1  {travel adaptor}
;;     c1895  mass 1  {mouse}
;;     c1902  mass 1  {site}

;; ---- slot work.Manner  [event center]  n 3  clusters 3
(And (Member $e0 work) (Manner $e0 $x1))
;;     c2843  mass 1  {perfectly}
;;     c2848  mass 1  {late, later}
;;     c2888  mass 1  {fine, fair}

;; ==================== word @ cluster cos 0.95: pooled role level (136 head pairs) ====================

;; Agent ~ Experiencer  cosine 0.56  JSD 0.735  n 888 / 261  shared: {person} {thing} {child, kid}
(Agent $e $x)
(Experiencer $e $x)

;; Agent ~ Patient  cosine 0.51  JSD 0.801  n 888 / 455  shared: {person} {thing} {child, kid}
(Agent $e $x)
(Patient $e $x)

;; Patient ~ Theme  cosine 0.50  JSD 0.789  n 455 / 594  shared: {thing} {person} {movie, film}
(Patient $e $x)
(Theme $e $x)

;; Experiencer ~ Patient  cosine 0.49  JSD 0.708  n 261 / 455  shared: {person} {thing} {door}
(Experiencer $e $x)
(Patient $e $x)

;; Agent ~ Theme  cosine 0.41  JSD 0.835  n 888 / 594  shared: {person} {thing} {company}
(Agent $e $x)
(Theme $e $x)

;; Experiencer ~ Theme  cosine 0.39  JSD 0.834  n 261 / 594  shared: {thing} {person} {child, kid}
(Experiencer $e $x)
(Theme $e $x)

;; Agent ~ Recipient  cosine 0.36  JSD 0.833  n 888 / 29  shared: {person} {company} {child, kid}
(Agent $e $x)
(Recipient $e $x)

;; Stimulus ~ Theme  cosine 0.36  JSD 0.89  n 34 / 594  shared: {thing} {child, kid} {music}
(Stimulus $e $x)
(Theme $e $x)

;; Patient ~ Stimulus  cosine 0.25  JSD 0.918  n 455 / 34  shared: {thing} {child, kid} {food}
(Patient $e $x)
(Stimulus $e $x)

;; Experiencer ~ Recipient  cosine 0.23  JSD 0.905  n 261 / 29  shared: {person} {child, kid} {man}
(Experiencer $e $x)
(Recipient $e $x)

;; Holder ~ Theme  cosine 0.21  JSD 0.896  n 48 / 594  shared: {thing} {house} {food}
(Holder $e $x)
(Theme $e $x)

;; Holder ~ Patient  cosine 0.20  JSD 0.871  n 48 / 455  shared: {thing} {movie, film} {room}
(Holder $e $x)
(Patient $e $x)

;; Experiencer ~ Stimulus  cosine 0.19  JSD 0.931  n 261 / 34  shared: {thing} {child, kid}
(Experiencer $e $x)
(Stimulus $e $x)

;; Agent ~ Stimulus  cosine 0.17  JSD 0.919  n 888 / 34  shared: {thing} {child, kid} {Jessica}
(Agent $e $x)
(Stimulus $e $x)

;; Experiencer ~ Result  cosine 0.16  JSD 0.821  n 261 / 43  shared: {bad} {red} {black}
(Experiencer $e $x)
(Result $e $x)

;; Goal ~ Source  cosine 0.16  JSD 0.864  n 93 / 47  shared: {town} {school} {here}
(Goal $e $x)
(Source $e $x)

;; Patient ~ Recipient  cosine 0.16  JSD 0.933  n 455 / 29  shared: {person} {child, kid} {city}
(Patient $e $x)
(Recipient $e $x)

;; Experiencer ~ Holder  cosine 0.15  JSD 0.869  n 261 / 48  shared: {thing} {house} {place}
(Experiencer $e $x)
(Holder $e $x)

;; Theme ~ To  cosine 0.15  JSD 0.923  n 594 / 46  shared: {thing} {talk} {music}
(Theme $e $x)
(To $e $x)

;; Holder ~ Stimulus  cosine 0.14  JSD 0.917  n 48 / 34  shared: {thing} {food}
(Holder $e $x)
(Stimulus $e $x)

;; Location ~ Source  cosine 0.13  JSD 0.906  n 210 / 47  shared: {here} {town} {place}
(Location $e $x)
(Source $e $x)

;; Recipient ~ Theme  cosine 0.12  JSD 0.932  n 29 / 594  shared: {person} {child, kid} {company}
(Recipient $e $x)
(Theme $e $x)

;; Holder ~ Source  cosine 0.11  JSD 0.911  n 48 / 47  shared: {town} {room} {place}
(Holder $e $x)
(Source $e $x)

;; Goal ~ Location  cosine 0.10  JSD 0.897  n 93 / 210  shared: {here} {home} {town}
(Goal $e $x)
(Location $e $x)

;; Stimulus ~ To  cosine 0.10  JSD 0.907  n 34 / 46  shared: {thing} {practice} {music}
(Stimulus $e $x)
(To $e $x)

;; Agent ~ Holder  cosine 0.09  JSD 0.928  n 888 / 48  shared: {thing} {Wilson} {Karen}
(Agent $e $x)
(Holder $e $x)

;; Patient ~ Result  cosine 0.09  JSD 0.895  n 455 / 43  shared: {bad} {black} {red}
(Patient $e $x)
(Result $e $x)

;; Goal ~ Holder  cosine 0.09  JSD 0.923  n 93 / 48  shared: {town} {house} {place}
(Goal $e $x)
(Holder $e $x)

;; Patient ~ To  cosine 0.09  JSD 0.959  n 455 / 46  shared: {thing} {woman}
(Patient $e $x)
(To $e $x)

;; Goal ~ Patient  cosine 0.07  JSD 0.912  n 93 / 455  shared: {tree} {room} {community}
(Goal $e $x)
(Patient $e $x)

;; Patient ~ Source  cosine 0.07  JSD 0.949  n 455 / 47  shared: {tree} {room} {school}
(Patient $e $x)
(Source $e $x)

;; Agent ~ To  cosine 0.06  JSD 0.948  n 888 / 46  shared: {thing} {doctor} {George Allen, Chuck Robb}
(Agent $e $x)
(To $e $x)

;; Experiencer ~ To  cosine 0.06  JSD 0.963  n 261 / 46  shared: {thing} {doctor}
(Experiencer $e $x)
(To $e $x)

;; Holder ~ Location  cosine 0.06  JSD 0.939  n 48 / 210  shared: {town} {place} {house}
(Holder $e $x)
(Location $e $x)

;; Holder ~ To  cosine 0.06  JSD 0.942  n 48 / 46  shared: {thing} {repeat}
(Holder $e $x)
(To $e $x)

;; Experiencer ~ Goal  cosine 0.05  JSD 0.929  n 261 / 93  shared: {school} {house} {place}
(Experiencer $e $x)
(Goal $e $x)

;; Location ~ Patient  cosine 0.05  JSD 0.925  n 210 / 455  shared: {door} {table} {hotel}
(Location $e $x)
(Patient $e $x)

;; Recipient ~ Stimulus  cosine 0.05  JSD 0.957  n 29 / 34  shared: {child, kid}
(Recipient $e $x)
(Stimulus $e $x)

;; For ~ Goal  cosine 0.05  JSD 0.967  n 39 / 93  shared: {bed}
(For $e $x)
(Goal $e $x)

;; Source ~ Theme  cosine 0.04  JSD 0.958  n 47 / 594  shared: {view} {room} {eat}
(Source $e $x)
(Theme $e $x)

;; Instrument ~ Stimulus  cosine 0.04  JSD 0.95  n 34 / 34  shared: {food} {crash}
(Instrument $e $x)
(Stimulus $e $x)

;; Experiencer ~ Location  cosine 0.04  JSD 0.947  n 261 / 210  shared: {Europe, Western Europe} {place} {house}
(Experiencer $e $x)
(Location $e $x)

;; In ~ Stimulus  cosine 0.04  JSD 0.953  n 50 / 34  shared: {action} {poetry}
(In $e $x)
(Stimulus $e $x)

;; Experiencer ~ Source  cosine 0.04  JSD 0.955  n 261 / 47  shared: {place} {school} {room}
(Experiencer $e $x)
(Source $e $x)

;; For ~ Theme  cosine 0.03  JSD 0.968  n 39 / 594  shared: {work} {word} {polish}
(For $e $x)
(Theme $e $x)

;; Goal ~ Manner  cosine 0.03  JSD 0.97  n 93 / 115  shared: {well} {back, backward}
(Goal $e $x)
(Manner $e $x)

;; Holder ~ Result  cosine 0.03  JSD 0.976  n 48 / 43  shared: {bad}
(Holder $e $x)
(Result $e $x)

;; Instrument ~ Patient  cosine 0.03  JSD 0.962  n 34 / 455  shared: {road} {snow} {food}
(Instrument $e $x)
(Patient $e $x)

;; Goal ~ Theme  cosine 0.03  JSD 0.953  n 93 / 594  shared: {house} {room} {new}
(Goal $e $x)
(Theme $e $x)

;; Location ~ Theme  cosine 0.03  JSD 0.952  n 210 / 594  shared: {house} {Gareccio} {group}
(Location $e $x)
(Theme $e $x)

;; Goal ~ In  cosine 0.03  JSD 0.969  n 93 / 50  shared: {way} {field}
(Goal $e $x)
(In $e $x)

;; In ~ Source  cosine 0.02  JSD 0.975  n 50 / 47  shared: {way}
(In $e $x)
(Source $e $x)

;; Experiencer ~ Instrument  cosine 0.02  JSD 0.977  n 261 / 34  shared: {train} {road}
(Experiencer $e $x)
(Instrument $e $x)

;; For ~ Stimulus  cosine 0.02  JSD 0.973  n 39 / 34  shared: {start}
(For $e $x)
(Stimulus $e $x)

;; Holder ~ Instrument  cosine 0.02  JSD 0.975  n 48 / 34  shared: {food}
(Holder $e $x)
(Instrument $e $x)

;; In ~ Theme  cosine 0.02  JSD 0.981  n 50 / 594  shared: {english} {understand} {way}
(In $e $x)
(Theme $e $x)

;; Manner ~ Result  cosine 0.02  JSD 0.97  n 115 / 43  shared: {together} {back, backward}
(Manner $e $x)
(Result $e $x)

;; Result ~ Source  cosine 0.02  JSD 0.978  n 43 / 47  shared: {bat}
(Result $e $x)
(Source $e $x)

;; Agent ~ For  cosine 0.02  JSD 0.975  n 888 / 39  shared: {cook} {bus} {patient}
(Agent $e $x)
(For $e $x)

;; Agent ~ Goal  cosine 0.02  JSD 0.965  n 888 / 93  shared: {school} {community} {campfire}
(Agent $e $x)
(Goal $e $x)

;; Location ~ Recipient  cosine 0.02  JSD 0.978  n 210 / 29  shared: {city} {large}
(Location $e $x)
(Recipient $e $x)

;; Result ~ Theme  cosine 0.02  JSD 0.976  n 43 / 594  shared: {sleep} {king} {inomaru}
(Result $e $x)
(Theme $e $x)

;; In ~ Patient  cosine 0.02  JSD 0.979  n 50 / 455  shared: {weather} {field} {water}
(In $e $x)
(Patient $e $x)

;; Experiencer ~ Time  cosine 0.01  JSD 0.984  n 261 / 107  shared: {night} {day}
(Experiencer $e $x)
(Time $e $x)

;; Goal ~ Instrument  cosine 0.01  JSD 0.983  n 93 / 34  shared: {snow}
(Goal $e $x)
(Instrument $e $x)

;; In ~ Location  cosine 0.01  JSD 0.98  n 50 / 210  shared: {water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; Experiencer ~ In  cosine 0.01  JSD 0.987  n 261 / 50  shared: {weather}
(Experiencer $e $x)
(In $e $x)

;; Goal ~ Recipient  cosine 0.01  JSD 0.982  n 93 / 29  shared: {Loren}
(Goal $e $x)
(Recipient $e $x)

;; In ~ To  cosine 0.01  JSD 0.981  n 50 / 46  shared: {action}
(In $e $x)
(To $e $x)

;; Instrument ~ Theme  cosine 0.01  JSD 0.987  n 34 / 594  shared: {food} {huge}
(Instrument $e $x)
(Theme $e $x)

;; Experiencer ~ For  cosine 0.01  JSD 0.987  n 261 / 39  shared: {word}
(Experiencer $e $x)
(For $e $x)

;; Recipient ~ Source  cosine 0.01  JSD 0.982  n 29 / 47  shared: {local}
(Recipient $e $x)
(Source $e $x)

;; Agent ~ Instrument  cosine 0.01  JSD 0.984  n 888 / 34  shared: {train} {plant} {snow}
(Agent $e $x)
(Instrument $e $x)

;; Agent ~ Location  cosine 0.01  JSD 0.971  n 888 / 210  shared: {school} {house} {fire}
(Agent $e $x)
(Location $e $x)

;; Agent ~ Result  cosine 0.01  JSD 0.982  n 888 / 43  shared: {crow} {red} {sleep}
(Agent $e $x)
(Result $e $x)

;; Manner ~ Patient  cosine 0.01  JSD 0.99  n 115 / 455  shared: {well} {together}
(Manner $e $x)
(Patient $e $x)

;; Recipient ~ Result  cosine 0.01  JSD 0.98  n 29 / 43  shared: {large}
(Recipient $e $x)
(Result $e $x)

;; Patient ~ Time  cosine 0.01  JSD 0.988  n 455 / 107  shared: {night} {hour} {day}
(Patient $e $x)
(Time $e $x)

;; Holder ~ In  cosine 0.01  JSD 0.986  n 48 / 50  shared: {weather}
(Holder $e $x)
(In $e $x)

;; Agent ~ Source  cosine 0.01  JSD 0.991  n 888 / 47  shared: {school} {aeroplane, airplane}
(Agent $e $x)
(Source $e $x)

;; For ~ Patient  cosine 0.01  JSD 0.988  n 39 / 455  shared: {word} {dance} {whole}
(For $e $x)
(Patient $e $x)

;; Goal ~ Result  cosine 0.01  JSD 0.989  n 93 / 43  shared: {back, backward}
(Goal $e $x)
(Result $e $x)

;; Instrument ~ Location  cosine 0.01  JSD 0.989  n 34 / 210  shared: {snow} {huge}
(Instrument $e $x)
(Location $e $x)

;; Source ~ Time  cosine 0.01  JSD 0.986  n 47 / 107  shared: {point}
(Source $e $x)
(Time $e $x)

;; Location ~ To  cosine 0.01  JSD 0.991  n 210 / 46  shared: {shore}
(Location $e $x)
(To $e $x)

;; Theme ~ Time  cosine 0.00  JSD 0.991  n 594 / 107  shared: {morning} {day}
(Theme $e $x)
(Time $e $x)

;; Agent ~ Manner  cosine 0.00  JSD 0.998  n 888 / 115  shared: {quickly, quick}
(Agent $e $x)
(Manner $e $x)

;; Location ~ Result  cosine 0.00  JSD 0.994  n 210 / 43  shared: {large}
(Location $e $x)
(Result $e $x)

;; Manner ~ Time  cosine 0.00  JSD 0.991  n 115 / 107  shared: {late}
(Manner $e $x)
(Time $e $x)

;; Experiencer ~ Manner  cosine 0.00  JSD 0.995  n 261 / 115  shared: {together}
(Experiencer $e $x)
(Manner $e $x)

;; Agent ~ In  cosine 0.00  JSD 0.997  n 888 / 50  shared: {context}
(Agent $e $x)
(In $e $x)

;; Agent ~ Time  cosine 0.00  JSD 0.997  n 888 / 107  shared: {spring}
(Agent $e $x)
(Time $e $x)

;; Location ~ Manner  cosine 0.00  JSD 0.996  n 210 / 115  shared: {early}
(Location $e $x)
(Manner $e $x)

;; For ~ Holder  cosine 0.00  JSD 1.0  n 39 / 48  shared: 
(For $e $x)
(Holder $e $x)

;; For ~ In  cosine 0.00  JSD 1.0  n 39 / 50  shared: 
(For $e $x)
(In $e $x)

;; For ~ Instrument  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Instrument $e $x)

;; For ~ Location  cosine 0.00  JSD 1.0  n 39 / 210  shared: 
(For $e $x)
(Location $e $x)

;; For ~ Manner  cosine 0.00  JSD 1.0  n 39 / 115  shared: 
(For $e $x)
(Manner $e $x)

;; For ~ Recipient  cosine 0.00  JSD 1.0  n 39 / 29  shared: 
(For $e $x)
(Recipient $e $x)

;; For ~ Result  cosine 0.00  JSD 1.0  n 39 / 43  shared: 
(For $e $x)
(Result $e $x)

;; For ~ Source  cosine 0.00  JSD 1.0  n 39 / 47  shared: 
(For $e $x)
(Source $e $x)

;; For ~ Time  cosine 0.00  JSD 1.0  n 39 / 107  shared: 
(For $e $x)
(Time $e $x)

;; For ~ To  cosine 0.00  JSD 1.0  n 39 / 46  shared: 
(For $e $x)
(To $e $x)

;; Goal ~ Stimulus  cosine 0.00  JSD 1.0  n 93 / 34  shared: 
(Goal $e $x)
(Stimulus $e $x)

;; Goal ~ Time  cosine 0.00  JSD 1.0  n 93 / 107  shared: 
(Goal $e $x)
(Time $e $x)

;; Goal ~ To  cosine 0.00  JSD 1.0  n 93 / 46  shared: 
(Goal $e $x)
(To $e $x)

;; Holder ~ Manner  cosine 0.00  JSD 1.0  n 48 / 115  shared: 
(Holder $e $x)
(Manner $e $x)

;; Holder ~ Recipient  cosine 0.00  JSD 1.0  n 48 / 29  shared: 
(Holder $e $x)
(Recipient $e $x)

;; Holder ~ Time  cosine 0.00  JSD 1.0  n 48 / 107  shared: 
(Holder $e $x)
(Time $e $x)

;; In ~ Instrument  cosine 0.00  JSD 1.0  n 50 / 34  shared: 
(In $e $x)
(Instrument $e $x)

;; In ~ Manner  cosine 0.00  JSD 1.0  n 50 / 115  shared: 
(In $e $x)
(Manner $e $x)

;; In ~ Recipient  cosine 0.00  JSD 1.0  n 50 / 29  shared: 
(In $e $x)
(Recipient $e $x)

;; In ~ Result  cosine 0.00  JSD 1.0  n 50 / 43  shared: 
(In $e $x)
(Result $e $x)

;; In ~ Time  cosine 0.00  JSD 1.0  n 50 / 107  shared: 
(In $e $x)
(Time $e $x)

;; Instrument ~ Manner  cosine 0.00  JSD 1.0  n 34 / 115  shared: 
(Instrument $e $x)
(Manner $e $x)

;; Instrument ~ Recipient  cosine 0.00  JSD 1.0  n 34 / 29  shared: 
(Instrument $e $x)
(Recipient $e $x)

;; Instrument ~ Result  cosine 0.00  JSD 1.0  n 34 / 43  shared: 
(Instrument $e $x)
(Result $e $x)

;; Instrument ~ Source  cosine 0.00  JSD 1.0  n 34 / 47  shared: 
(Instrument $e $x)
(Source $e $x)

;; Instrument ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Instrument $e $x)
(Time $e $x)

;; Instrument ~ To  cosine 0.00  JSD 1.0  n 34 / 46  shared: 
(Instrument $e $x)
(To $e $x)

;; Location ~ Stimulus  cosine 0.00  JSD 1.0  n 210 / 34  shared: 
(Location $e $x)
(Stimulus $e $x)

;; Location ~ Time  cosine 0.00  JSD 1.0  n 210 / 107  shared: 
(Location $e $x)
(Time $e $x)

;; Manner ~ Recipient  cosine 0.00  JSD 1.0  n 115 / 29  shared: 
(Manner $e $x)
(Recipient $e $x)

;; Manner ~ Source  cosine 0.00  JSD 1.0  n 115 / 47  shared: 
(Manner $e $x)
(Source $e $x)

;; Manner ~ Stimulus  cosine 0.00  JSD 1.0  n 115 / 34  shared: 
(Manner $e $x)
(Stimulus $e $x)

;; Manner ~ Theme  cosine 0.00  JSD 1.0  n 115 / 594  shared: 
(Manner $e $x)
(Theme $e $x)

;; Manner ~ To  cosine 0.00  JSD 1.0  n 115 / 46  shared: 
(Manner $e $x)
(To $e $x)

;; Recipient ~ Time  cosine 0.00  JSD 1.0  n 29 / 107  shared: 
(Recipient $e $x)
(Time $e $x)

;; Recipient ~ To  cosine 0.00  JSD 1.0  n 29 / 46  shared: 
(Recipient $e $x)
(To $e $x)

;; Result ~ Stimulus  cosine 0.00  JSD 1.0  n 43 / 34  shared: 
(Result $e $x)
(Stimulus $e $x)

;; Result ~ Time  cosine 0.00  JSD 1.0  n 43 / 107  shared: 
(Result $e $x)
(Time $e $x)

;; Result ~ To  cosine 0.00  JSD 1.0  n 43 / 46  shared: 
(Result $e $x)
(To $e $x)

;; Source ~ Stimulus  cosine 0.00  JSD 1.0  n 47 / 34  shared: 
(Source $e $x)
(Stimulus $e $x)

;; Source ~ To  cosine 0.00  JSD 1.0  n 47 / 46  shared: 
(Source $e $x)
(To $e $x)

;; Stimulus ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Stimulus $e $x)
(Time $e $x)

;; Time ~ To  cosine 0.00  JSD 1.0  n 107 / 46  shared: 
(Time $e $x)
(To $e $x)

;; ==================== word @ cluster cos 0.95: slot pairs (2 event-center signals) ====================

;; [same role, different class]  accompany.Agent ~ appear.Agent  cosine 0.76  JSD 0.23  n 4 / 6  shared: {sister} {person}
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000050 tierC-000259
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; [different class and role]  die.Patient ~ sleep.Agent  cosine 0.99  JSD 0.006  n 4 / 3  shared: {person} {family}
;;   A e.g. tierB-001967 tierC-000199   B e.g. tierC-000041 tierC-000042
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 sleep) (Agent $e0 $x1))

;; ==================== word @ cluster cos 0.95: compared slots with their distributions (269 slots, n >= 3) ====================

;; ---- slot <unclassed>.LocatedIn  [entity center]  n 46  clusters 41
(LocatedIn $x0 $x1)
;;     c3026  mass 3  {here}
;;     c1053  mass 2  {class}
;;     c1101  mass 2  {Derwent Isle}
;;     c1369  mass 2  {garden}
;;      c247  mass 2  {city}
;;      c254  mass 2  {southern}
;;     c3146  mass 1.5  {full, fully}
;;     c1062  mass 1  {Dianchi Lake, Lake Dianchi}
;;     c1077  mass 1  {Huancavelica}
;;     c1098  mass 1  {sea, ocean}
;;     c1357  mass 1  {village}
;;     c1397  mass 1  {tree}
;;     c1674  mass 1  {country}
;;     c1715  mass 1  {Tatoeba}
;;     c1907  mass 1  {ceiling}
;;     c1908  mass 1  {floor}
;;     c1927  mass 1  {wall}
;;     c1936  mass 1  {house}
;;     c1952  mass 1  {storeroom}
;;     c2105  mass 1  {table}
;;     c2421  mass 1  {play}
;;      c267  mass 1  {Algiers}
;;      c269  mass 1  {El Harrach}
;;      c286  mass 1  {Russian Far East}
;;      c303  mass 1  {Peru}
;;      c307  mass 1  {India}
;;      c310  mass 1  {Japan}
;;      c320  mass 1  {Gaul}
;;      c322  mass 1  {UK}
;;      c343  mass 1  {movie, film}
;;       c39  mass 1  {Loglan}
;;       c40  mass 1  {Lojban}
;;      c462  mass 1  {market}
;;      c625  mass 1  {world}
;;      c696  mass 1  {park}
;;      c708  mass 1  {street}
;;     c1277  mass 0.5  {kitchen sink}
;;     c1509  mass 0.5  {basket}
;;     c1944  mass 0.5  {place}
;;     c2016  mass 0.5  {fountain}
;;     c2373  mass 0.5  {red}

;; ---- slot have.Holder  [event center]  n 44  clusters 40
(And (Member $e0 have) (Holder $e0 $x1))
;;      c868  mass 4  {Kristoffer}
;;      c248  mass 2  {town}
;;     c2962  mass 2  {thing}
;;      c942  mass 2  {Karen}
;;     c1000  mass 1  {homentropic flow}
;;     c1098  mass 1  {sea, ocean}
;;     c1323  mass 1  {food}
;;     c1378  mass 1  {ivy}
;;     c1426  mass 1  {creature}
;;     c1712  mass 1  {sentence}
;;     c1721  mass 1  {word processor}
;;     c1936  mass 1  {house}
;;     c1942  mass 1  {tower}
;;     c1944  mass 1  {place}
;;     c1948  mass 1  {hotel}
;;     c1966  mass 1  {room}
;;     c2317  mass 1  {february}
;;      c264  mass 1  {tuareg, tuaregs}
;;      c267  mass 1  {Algiers}
;;      c300  mass 1  {Morocco}
;;     c3212  mass 1  {decision}
;;      c323  mass 1  {Scotland}
;;     c3275  mass 1  {repeat}
;;      c343  mass 1  {movie, film}
;;      c449  mass 1  {insurance}
;;      c589  mass 1  {library}
;;      c593  mass 1  {writer}
;;      c616  mass 1  {lawyer}
;;      c693  mass 1  {gas station}
;;      c792  mass 1  {Wilson}
;;      c857  mass 1  {Rasputin}
;;      c877  mass 1  {Boldi}
;;      c884  mass 1  {Thomas}
;;      c923  mass 1  {Diego}
;;      c931  mass 1  {Miroslav}
;;      c999  mass 1  {homentropic current}
;;     c1625  mass 0.5  {old}
;;     c1835  mass 0.5  {bad}
;;     c2049  mass 0.5  {weather}
;;      c365  mass 0.5  {mosque}

;; ---- slot have.Theme  [event center]  n 43  clusters 59
(And (Member $e0 have) (Theme $e0 $x1))
;;     c1640  mass 4  {child, kid}
;;     c2996  mass 2  {representation, represent}
;;     c1370  mass 1  {leaf}
;;     c1469  mass 1  {antler, antlers}
;;     c1474  mass 1  {herd}
;;     c1600  mass 1  {friend}
;;     c2254  mass 1  {value}
;;     c2260  mass 1  {reputation}
;;     c2346  mass 1  {day}
;;     c2574  mass 1  {chance}
;;     c2604  mass 1  {color}
;;     c2806  mass 1  {meaning}
;;     c2832  mass 1  {effect}
;;     c2962  mass 1  {thing}
;;     c2977  mass 1  {right}
;;     c2980  mass 1  {thought, think}
;;      c356  mass 1  {cemetery}
;;      c692  mass 1  {gas pump, gas pumps}
;;      c743  mass 1  {guard}
;;       c90  mass 1  {beauty salon, beauty salons}
;;     c1568  mass 0.667  {entropy}
;;     c3152  mass 0.667  {constant}
;;     c3158  mass 0.667  {uniform}
;;     c1019  mass 0.5  {parenthetic}
;;     c1236  mass 0.5  {taste}
;;     c1260  mass 0.5  {conical}
;;     c1369  mass 0.5  {garden}
;;     c1408  mass 0.5  {predictable}
;;     c1589  mass 0.5  {personality}
;;     c1762  mass 0.5  {soul piercing}
;;     c1787  mass 0.5  {nasty}
;;     c1805  mass 0.5  {eerie}
;;     c1807  mass 0.5  {weird}
;;     c1811  mass 0.5  {dream}
;;     c1904  mass 0.5  {roof}
;;     c1975  mass 0.5  {curtain, curtains}
;;     c2053  mass 0.5  {atmosphere}
;;     c2083  mass 0.5  {plot}
;;     c2175  mass 0.5  {homely}
;;     c2188  mass 0.5  {feeling}
;;     c2204  mass 0.5  {intriguing}
;;     c2215  mass 0.5  {beautiful}
;;     c2384  mass 0.5  {stare}
;;     c2487  mass 0.5  {high}
;;     c2488  mass 0.5  {rich}
;;     c2597  mass 0.5  {blue}
;;     c2969  mass 0.5  {purpose}
;;     c3121  mass 0.5  {single}
;;     c3180  mass 0.5  {nice}
;;      c393  mass 0.5  {history}
;;      c447  mass 0.5  {deductible}
;;      c555  mass 0.5  {style}
;;      c630  mass 0.5  {internal politics}
;;     c1724  mass 0.333  {document}
;;     c2256  mass 0.333  {valuable}
;;     c2459  mass 0.333  {wide}
;;     c2482  mass 0.333  {serious}
;;     c2950  mass 0.333  {consequence}
;;      c454  mass 0.333  {bank}

;; ---- slot <unclassed>.Possession  [entity center]  n 30  clusters 23
(Possession $x0 $x1)
;;     c1593  mass 5  {person}
;;      c609  mass 4  {Free Soil Party}
;;      c610  mass 4  {Republican Party}
;;      c423  mass 2  {subsequent game}
;;     c1014  mass 1  {logical phrase}
;;     c1015  mass 1  {logical proposition}
;;     c1120  mass 1  {Jupiter}
;;     c1669  mass 1  {Twilight}
;;     c1674  mass 1  {country}
;;      c188  mass 1  {Yunnan}
;;     c2847  mass 1  {union}
;;     c2962  mass 1  {thing}
;;      c362  mass 1  {sunni community, sunni communities}
;;      c544  mass 1  {islamic ivory}
;;      c732  mass 1  {radical group}
;;      c771  mass 1  {God}
;;      c827  mass 1  {Dora Smith}
;;     c2504  mass 0.5  {generalization}
;;     c2942  mass 0.5  {easy}
;;     c1028  mass 0.25  {community}
;;      c227  mass 0.25  {neighbouring}
;;     c2505  mass 0.25  {other}
;;      c364  mass 0.25  {sunni}

;; ---- slot use.Theme  [event center]  n 23  clusters 23
(And (Member $e0 use) (Theme $e0 $x1))
;;        c3  mass 2  {banach mackey topology}
;;        c4  mass 2  {weak arens space topology}
;;      c106  mass 1  {Laravel}
;;     c1168  mass 1  {jingle}
;;     c1187  mass 1  {auto tune}
;;     c1262  mass 1  {sugar}
;;     c1699  mass 1  {metaphor}
;;     c1710  mass 1  {phrase}
;;     c1712  mass 1  {sentence}
;;     c1720  mass 1  {word}
;;     c1966  mass 1  {room}
;;     c2000  mass 1  {fire}
;;     c2115  mass 1  {machine}
;;     c3127  mass 1  {current}
;;     c3294  mass 1  {public fund}
;;      c519  mass 1  {chemical agent}
;;       c72  mass 1  {Midway}
;;      c731  mass 1  {paramilitary group}
;;      c844  mass 1  {Iga}
;;      c108  mass 0.5  {naming convention}
;;      c110  mass 0.5  {designation convention}
;;     c2281  mass 0.5  {calendar}
;;     c2795  mass 0.5  {various}

;; ---- slot make.Patient  [event center]  n 20  clusters 25
(And (Member $e0 make) (Patient $e0 $x1))
;;     c2799  mass 1.5  {difference}
;;     c1138  mass 1  {travel}
;;     c1245  mass 1  {cup}
;;     c1312  mass 1  {chicken fried steak}
;;     c1766  mass 1  {eye contact}
;;     c2095  mass 1  {cope}
;;     c2240  mass 1  {purchase}
;;     c2462  mass 1  {big}
;;     c2673  mass 1  {claim}
;;      c297  mass 1  {Afghanistan}
;;      c574  mass 1  {paper}
;;       c76  mass 1  {telephone call}
;;      c775  mass 1  {Augustus}
;;      c822  mass 1  {Isabella}
;;     c1155  mass 0.5  {high pitched}
;;     c1171  mass 0.5  {noise}
;;     c1173  mass 0.5  {sound}
;;     c1175  mass 0.5  {clicking}
;;     c1835  mass 0.5  {bad}
;;     c1936  mass 0.5  {house}
;;     c1966  mass 0.5  {room}
;;     c2039  mass 0.5  {snowman}
;;     c2176  mass 0.5  {comfortable}
;;     c2215  mass 0.5  {beautiful}
;;     c2961  mass 0.5  {matter}

;; ---- slot build.Patient  [event center]  n 18  clusters 12
(And (Member $e0 build) (Patient $e0 $x1))
;;     c1948  mass 4  {hotel}
;;     c1966  mass 3  {room}
;;     c2962  mass 2  {thing}
;;     c3079  mass 2  {horn}
;;      c575  mass 2  {paper factory}
;;      c576  mass 2  {paper mill}
;;     c2132  mass 0.5  {network}
;;     c2551  mass 0.5  {new}
;;     c2809  mass 0.5  {original}
;;     c3248  mass 0.5  {well}
;;      c417  mass 0.5  {playground}
;;       c65  mass 0.5  {turing machine}

;; ---- slot make.Agent  [event center]  n 18  clusters 19
(And (Member $e0 make) (Agent $e0 $x1))
;;     c1267  mass 1  {diner}
;;     c1421  mass 1  {cat}
;;     c1618  mass 1  {man}
;;     c1636  mass 1  {boy}
;;     c1975  mass 1  {curtain, curtains}
;;     c2222  mass 1  {artistic beauty}
;;     c2506  mass 1  {practical utility}
;;     c2962  mass 1  {thing}
;;      c729  mass 1  {Taliban}
;;      c775  mass 1  {Augustus}
;;       c80  mass 1  {customer}
;;      c835  mass 1  {Hanako}
;;      c869  mass 1  {James}
;;      c871  mass 1  {David}
;;      c915  mass 1  {Elias}
;;      c935  mass 1  {Damiano}
;;      c937  mass 1  {Lorenzo}
;;     c2035  mass 0.5  {wind}
;;     c2036  mass 0.5  {gusty}

;; ---- slot go.Agent  [event center]  n 15  clusters 14
(And (Member $e0 go) (Agent $e0 $x1))
;;      c821  mass 2  {Katherine}
;;     c1041  mass 1  {pupil}
;;     c1421  mass 1  {cat}
;;     c1607  mass 1  {Mom}
;;     c1640  mass 1  {child, kid}
;;      c818  mass 1  {Olivia}
;;      c825  mass 1  {Linda}
;;      c836  mass 1  {Mariko}
;;      c866  mass 1  {Matthew}
;;      c875  mass 1  {Donald}
;;      c906  mass 1  {Mennad}
;;      c933  mass 1  {Flavio}
;;      c941  mass 1  {Daniel}
;;      c944  mass 1  {Kalman}

;; ---- slot play.Agent  [event center]  n 15  clusters 10
(And (Member $e0 play) (Agent $e0 $x1))
;;     c1640  mass 4  {child, kid}
;;      c748  mass 2  {Boston Red Sox}
;;      c749  mass 2  {Cincinnati Reds}
;;     c1636  mass 1  {boy}
;;      c168  mass 1  {biology}
;;      c375  mass 1  {religion}
;;      c803  mass 1  {Audrey Hepburn}
;;      c804  mass 1  {Audrey Heppurn}
;;      c837  mass 1  {Yumi}
;;      c885  mass 1  {Tony}

;; ---- slot build.Agent  [event center]  n 14  clusters 5
(And (Member $e0 build) (Agent $e0 $x1))
;;     c1537  mass 8  {company}
;;     c1593  mass 2  {person}
;;      c970  mass 2  {O. R. Woodcock}
;;     c1028  mass 1  {community}
;;      c263  mass 1  {mozabite, mozabites}

;; ---- slot find.Location  [event center]  n 14  clusters 10
(And (Member $e0 find) (Location $e0 $x1))
;;     c1065  mass 2  {tributary, tributaries}
;;      c188  mass 2  {Yunnan}
;;      c254  mass 2  {southern}
;;     c2780  mass 2  {bench}
;;     c1062  mass 1  {Dianchi Lake, Lake Dianchi}
;;     c1096  mass 1  {Sahara Desert}
;;     c1678  mass 1  {western}
;;      c219  mass 1  {station}
;;      c283  mass 1  {Europe, Western Europe}
;;      c358  mass 1  {tomb}

;; ---- slot <unclassed>.SubsetOf  [entity center]  n 13  clusters 12
(SubsetOf $x0 $x1)
;;     c1593  mass 2  {person}
;;     c1041  mass 1  {pupil}
;;     c1355  mass 1  {villager}
;;      c138  mass 1  {refugee}
;;     c1447  mass 1  {centipede, centipedes}
;;     c1642  mass 1  {chick}
;;     c1644  mass 1  {girl}
;;     c2110  mass 1  {window}
;;     c2235  mass 1  {shop}
;;      c224  mass 1  {corner}
;;      c586  mass 1  {mayan book, mayan books}
;;      c656  mass 1  {plane}

;; ---- slot start.Theme  [event center]  n 13  clusters 14
(And (Member $e0 start) (Theme $e0 $x1))
;;     c1051  mass 1  {high school}
;;     c1201  mass 1  {chant}
;;     c1778  mass 1  {vomit}
;;     c2013  mass 1  {cry}
;;     c2419  mass 1  {hear}
;;     c2425  mass 1  {talk}
;;     c2559  mass 1  {improve}
;;     c2690  mass 1  {disappear}
;;     c2881  mass 1  {run out}
;;     c3088  mass 1  {roll}
;;     c3105  mass 1  {appear}
;;     c3108  mass 1  {show}
;;       c10  mass 0.5  {light headed}
;;     c2187  mass 0.5  {feel}

;; ---- slot go.Goal  [event center]  n 12  clusters 9
(And (Member $e0 go) (Goal $e0 $x1))
;;     c2341  mass 4  {bed}
;;     c1050  mass 1  {school}
;;      c153  mass 1  {hospital}
;;     c1944  mass 1  {place}
;;     c1971  mass 1  {bathroom}
;;      c713  mass 1  {way}
;;      c826  mass 1  {Loren}
;;       c91  mass 1  {aesthetic salon}
;;       c94  mass 1  {supermarket}

;; ---- slot study.Agent  [event center]  n 12  clusters 9
(And (Member $e0 study) (Agent $e0 $x1))
;;     c1593  mass 3  {person}
;;       c61  mass 2  {scientist}
;;       c52  mass 1  {forensics researcher}
;;      c772  mass 1  {Nicolaus Copernicus}
;;      c823  mass 1  {Beth}
;;      c848  mass 1  {Peter}
;;      c851  mass 1  {Yuri}
;;      c900  mass 1  {Fadil}
;;      c922  mass 1  {Carlos}

;; ---- slot <unclassed>.PartOf  [entity center]  n 11  clusters 11
(PartOf $x0 $x1)
;;      c758  mass 2  {Khurda Road}
;;     c1036  mass 1  {student association}
;;     c1301  mass 1  {cake}
;;     c1378  mass 1  {ivy}
;;     c1385  mass 1  {plant}
;;     c1485  mass 1  {animal}
;;      c188  mass 1  {Yunnan}
;;     c2421  mass 1  {play}
;;      c544  mass 1  {islamic ivory}
;;      c708  mass 0.5  {street}
;;      c710  mass 0.5  {road}

;; ---- slot become.Patient  [event center]  n 11  clusters 16
(And (Member $e0 become) (Patient $e0 $x1))
;;      c122  mass 1  {indigenous}
;;     c1593  mass 1  {person}
;;     c1603  mass 1  {relationship}
;;     c1835  mass 1  {bad}
;;     c2962  mass 1  {thing}
;;      c830  mass 1  {Lady Ashton}
;;     c1082  mass 0.5  {earth}
;;     c1157  mass 0.5  {intense}
;;     c1171  mass 0.5  {noise}
;;     c1592  mass 0.5  {people}
;;      c217  mass 0.5  {lax}
;;     c2272  mass 0.5  {discipline}
;;     c2373  mass 0.5  {red}
;;     c2381  mass 0.5  {revolutionary}
;;      c606  mass 0.5  {conservative}
;;      c831  mass 0.5  {inomaru}

;; ---- slot begin.Agent  [event center]  n 11  clusters 9
(And (Member $e0 begin) (Agent $e0 $x1))
;;      c121  mass 2  {native american, indigenous american, indigenous americans, native americans}
;;      c131  mass 2  {european american settler}
;;     c1734  mass 1  {Mark}
;;     c1738  mass 1  {crowd}
;;     c2378  mass 1  {rebel}
;;      c733  mass 1  {legionnaire}
;;      c824  mass 1  {Jessica}
;;      c870  mass 1  {William}
;;      c871  mass 1  {David}

;; ---- slot begin.Theme  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Theme $e0 $x1))
;;     c2755  mass 4  {create}
;;     c1760  mass 1  {applaud}
;;     c1826  mass 1  {confess}
;;     c2587  mass 1  {bud}
;;     c2753  mass 1  {make}
;;     c3063  mass 1  {hang out}
;;     c3115  mass 1  {distribute}
;;      c501  mass 1  {torture}

;; ---- slot build.Location  [event center]  n 11  clusters 4
(And (Member $e0 build) (Location $e0 $x1))
;;      c289  mass 4  {Kazakhstan}
;;      c184  mass 3  {Eskisehir}
;;      c327  mass 3  {Turkey}
;;      c268  mass 1  {Ghardaia}

;; ---- slot kill.Patient  [event center]  n 11  clusters 5
(And (Member $e0 kill) (Patient $e0 $x1))
;;     c1593  mass 6  {person}
;;      c736  mass 2  {soldier}
;;     c1436  mass 1  {zombie, zombies}
;;     c1478  mass 1  {gazelle}
;;     c1495  mass 1  {fox}

;; ---- slot produce.Patient  [event center]  n 11  clusters 10
(And (Member $e0 produce) (Patient $e0 $x1))
;;      c343  mass 4.833  {movie, film}
;;     c1203  mass 2  {album}
;;      c166  mass 1  {insulin}
;;      c341  mass 0.833  {syrian film, film, syrian film}
;;     c2209  mass 0.5  {mesmerizing}
;;     c2613  mass 0.5  {sheen}
;;     c2190  mass 0.333  {harmless}
;;     c2398  mass 0.333  {trace}
;;     c2580  mass 0.333  {destined}
;;      c517  mass 0.333  {cyanide}

;; ---- slot start.Patient  [event center]  n 11  clusters 14
(And (Member $e0 start) (Patient $e0 $x1))
;;     c1121  mass 1  {Milky Way}
;;     c1416  mass 1  {dog feed}
;;     c1753  mass 1  {concert}
;;        c2  mass 1  {national fibre optic network project}
;;     c2324  mass 1  {watermelon season}
;;     c2698  mass 1  {crack}
;;     c2750  mass 1  {knock}
;;     c2962  mass 1  {thing}
;;      c680  mass 1  {truck}
;;      c599  mass 0.5  {gusher}
;;      c603  mass 0.5  {freedom movement}
;;     c2051  mass 0.333  {sky}
;;     c2520  mass 0.333  {pocket}
;;     c2597  mass 0.333  {blue}

;; ---- slot find.Theme  [event center]  n 10  clusters 6
(And (Member $e0 find) (Theme $e0 $x1))
;;     c2962  mass 4  {thing}
;;      c689  mass 2  {Couper}
;;     c1092  mass 1  {meteorite}
;;      c541  mass 1  {clay figurine, clay figurines}
;;      c573  mass 1  {paper sheet, paper sheets}
;;      c938  mass 1  {Pietro}

;; ---- slot leave.Agent  [event center]  n 10  clusters 10
(And (Member $e0 leave) (Agent $e0 $x1))
;;     c1593  mass 1  {person}
;;       c16  mass 1  {ship}
;;      c656  mass 1  {plane}
;;      c673  mass 1  {bus}
;;      c685  mass 1  {car}
;;      c856  mass 1  {Ivan}
;;      c862  mass 1  {Marcus}
;;      c882  mass 1  {Tom}
;;      c926  mass 1  {Rodrigo}
;;      c964  mass 1  {Brian}

;; ---- slot serve.Agent  [event center]  n 10  clusters 9
(And (Member $e0 serve) (Agent $e0 $x1))
;;      c196  mass 2  {Indooroopilly}
;;     c1593  mass 1.5  {person}
;;     c1609  mass 1  {grandmother}
;;     c1666  mass 1  {Rosewood}
;;      c193  mass 1  {Ipswich}
;;      c194  mass 1  {Ipswich & Rosewood}
;;      c929  mass 1  {Janos}
;;      c968  mass 1  {Yitzhak}
;;      c796  mass 0.5  {president}

;; ---- slot take.Theme  [event center]  n 10  clusters 11
(And (Member $e0 take) (Theme $e0 $x1))
;;     c1591  mass 2  {identity}
;;     c1535  mass 1  {office}
;;     c2071  mass 1  {portrait}
;;     c2475  mass 1  {power}
;;     c2962  mass 1  {thing}
;;     c3089  mass 1  {roller}
;;     c3277  mass 1  {while}
;;     c2480  mass 0.5  {drastic}
;;     c2802  mass 0.5  {measure}
;;     c3229  mass 0.5  {close}
;;     c3272  mass 0.5  {look}

;; ---- slot try.Agent  [event center]  n 10  clusters 11
(And (Member $e0 try) (Agent $e0 $x1))
;;     c1114  mass 1  {alien}
;;     c1472  mass 1  {crocodile}
;;     c1537  mass 1  {company}
;;     c1734  mass 1  {Mark}
;;      c205  mass 1  {Santiago}
;;      c871  mass 1  {David}
;;      c880  mass 1  {Felix}
;;      c894  mass 1  {Bob}
;;      c932  mass 1  {Claudio}
;;     c1618  mass 0.5  {man}
;;     c1632  mass 0.5  {young}

;; ---- slot write.Patient  [event center]  n 10  clusters 8
(And (Member $e0 write) (Patient $e0 $x1))
;;     c1200  mass 2  {song}
;;     c2142  mass 2  {episode}
;;     c1588  mass 1  {character}
;;     c1712  mass 1  {sentence}
;;     c1716  mass 1  {screenplay}
;;     c1717  mass 1  {script}
;;     c2525  mass 1  {letter}
;;      c587  mass 1  {book}

;; ---- slot fall.Patient  [event center]  n 9  clusters 12
(And (Member $e0 fall) (Patient $e0 $x1))
;;     c1041  mass 1  {pupil}
;;     c1258  mass 1  {ice pellet}
;;     c1642  mass 1  {chick}
;;     c1727  mass 1  {hush of anticipation}
;;     c2041  mass 1  {snow}
;;     c2099  mass 1  {scaffolding}
;;      c587  mass 1  {book}
;;     c1393  mass 0.5  {forest}
;;     c2696  mass 0.5  {silent}
;;     c1397  mass 0.333  {tree}
;;     c1868  mass 0.333  {rotten}
;;     c2729  mass 0.333  {dead}

;; ---- slot follow.Agent  [event center]  n 9  clusters 10
(And (Member $e0 follow) (Agent $e0 $x1))
;;     c2584  mass 2  {bhadala}
;;      c367  mass 1  {muslim house, house, muslim}
;;      c710  mass 1  {road}
;;      c776  mass 1  {Alexander}
;;      c898  mass 1  {Bailey}
;;      c902  mass 1  {Sami}
;;     c1441  mass 0.5  {crawling}
;;     c1503  mass 0.5  {beast}
;;     c1936  mass 0.5  {house}
;;      c368  mass 0.5  {muslim, muslims}

;; ---- slot follow.Theme  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Theme $e0 $x1))
;;      c255  mass 2  {region}
;;      c389  mass 2  {tradition}
;;     c1104  mass 1  {shoreline}
;;      c806  mass 1  {Layla}
;;      c817  mass 1  {Margaret Fleming}
;;      c921  mass 1  {Lukas}
;;      c957  mass 1  {Henry Cole}

;; ---- slot hear.Stimulus  [event center]  n 9  clusters 12
(And (Member $e0 hear) (Stimulus $e0 $x1))
;;     c1854  mass 1  {crash}
;;     c2163  mass 1  {shoot, shot}
;;     c2741  mass 1  {bang}
;;     c2750  mass 1  {knock}
;;     c2962  mass 1  {thing}
;;     c3046  mass 1  {start}
;;     c1171  mass 0.833  {noise}
;;     c1163  mass 0.5  {ticking}
;;     c1185  mass 0.5  {upbeat}
;;     c1194  mass 0.5  {music}
;;     c1150  mass 0.333  {barking}
;;     c1152  mass 0.333  {growling}

;; ---- slot kill.Agent  [event center]  n 9  clusters 6
(And (Member $e0 kill) (Agent $e0 $x1))
;;     c2025  mass 4  {hurricane}
;;     c1498  mass 1  {lion}
;;      c165  mass 1  {cancer}
;;     c2000  mass 1  {fire}
;;     c2164  mass 1  {hunter}
;;      c856  mass 1  {Ivan}

;; ---- slot sing.Agent  [event center]  n 9  clusters 8
(And (Member $e0 sing) (Agent $e0 $x1))
;;     c1580  mass 2  {sister}
;;     c1593  mass 2  {person}
;;     c1204  mass 1  {Amateur Barbershop Harmony Society}
;;     c1460  mass 1  {bird}
;;      c765  mass 1  {actress}
;;      c871  mass 1  {David}
;;     c1527  mass 0.5  {professional}
;;     c2310  mass 0.5  {group}

;; ---- slot take.Agent  [event center]  n 9  clusters 8
(And (Member $e0 take) (Agent $e0 $x1))
;;     c1593  mass 2  {person}
;;     c1307  mass 1  {cook}
;;     c2962  mass 1  {thing}
;;      c787  mass 1  {Jerry Rawlings}
;;      c796  mass 1  {president}
;;      c863  mass 1  {Michael}
;;      c925  mass 1  {Gustavo}
;;      c930  mass 1  {Lajos}

;; ---- slot become.Result  [event center]  n 8  clusters 7
(And (Member $e0 become) (Result $e0 $x1))
;;     c1835  mass 2  {bad}
;;      c122  mass 1  {indigenous}
;;     c1819  mass 1  {alarmed}
;;      c217  mass 1  {lax}
;;     c2373  mass 1  {red}
;;      c606  mass 1  {conservative}
;;      c831  mass 1  {inomaru}

;; ---- slot change.Patient  [event center]  n 8  clusters 7
(And (Member $e0 change) (Patient $e0 $x1))
;;     c2049  mass 2  {weather}
;;     c1010  mass 1  {mind}
;;     c1058  mass 1  {course}
;;     c1594  mass 1  {name}
;;     c2018  mass 1  {rain}
;;     c2604  mass 1  {color}
;;     c2962  mass 1  {thing}

;; ---- slot hear.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 hear) (Experiencer $e0 $x1))
;;      c878  mass 2  {Bruno}
;;      c852  mass 1  {Oleg}
;;      c869  mass 1  {James}
;;      c886  mass 1  {Jonas}
;;      c900  mass 1  {Fadil}
;;      c933  mass 1  {Flavio}
;;      c935  mass 1  {Damiano}

;; ---- slot live.Agent  [event center]  n 8  clusters 8
(And (Member $e0 live) (Agent $e0 $x1))
;;     c1493  mass 1  {wolf}
;;      c265  mass 1  {Beja}
;;      c864  mass 1  {Mary, Maria}
;;      c908  mass 1  {Tiziri}
;;      c910  mass 1  {Yidir}
;;      c915  mass 1  {Elias}
;;      c948  mass 1  {Ray Kurtzweil}
;;      c995  mass 1  {Cainan}

;; ---- slot live.Location  [event center]  n 8  clusters 8
(And (Member $e0 live) (Location $e0 $x1))
;;      c333  mass 2  {Norway}
;;     c1936  mass 1.5  {house}
;;      c226  mass 1  {southeastern corner}
;;     c2310  mass 1  {group}
;;      c243  mass 1  {suburb}
;;     c2176  mass 0.5  {comfortable}
;;     c2463  mass 0.5  {large}
;;     c3118  mass 0.5  {isolated}

;; ---- slot need.Experiencer  [event center]  n 8  clusters 8
(And (Member $e0 need) (Experiencer $e0 $x1))
;;     c1331  mass 1  {sauce}
;;      c148  mass 1  {doctor}
;;     c1640  mass 1  {child, kid}
;;      c299  mass 1  {Algeria}
;;     c3050  mass 1  {gate}
;;      c867  mass 1  {Karl}
;;      c936  mass 1  {Martino}
;;      c966  mass 1  {Yanni}

;; ---- slot open.Patient  [event center]  n 8  clusters 4
(And (Member $e0 open) (Patient $e0 $x1))
;;     c1923  mass 4.5  {door}
;;      c611  mass 2  {law, laws}
;;      c454  mass 1  {bank}
;;     c1911  mass 0.5  {vault like}

;; ---- slot play.Theme  [event center]  n 8  clusters 7
(And (Member $e0 play) (Theme $e0 $x1))
;;      c403  mass 2  {tennis}
;;      c805  mass 2  {Holly Golightly}
;;     c1213  mass 1  {harp}
;;     c2141  mass 1  {series}
;;     c2536  mass 1  {role}
;;     c2539  mass 0.5  {crucial}
;;     c2540  mass 0.5  {important}

;; ---- slot produce.Agent  [event center]  n 8  clusters 7
(And (Member $e0 produce) (Agent $e0 $x1))
;;      c976  mass 2  {Colin Richardson}
;;      c986  mass 2  {Harvey Hayutin}
;;      c987  mass 2  {Sy Weintraub}
;;      c167  mass 1  {pancreas}
;;     c2773  mass 0.333  {layer}
;;     c2936  mass 0.333  {thin}
;;      c515  mass 0.333  {oil}

;; ---- slot speak.Agent  [event center]  n 8  clusters 6
(And (Member $e0 speak) (Agent $e0 $x1))
;;      c819  mass 2  {Sophia}
;;      c914  mass 2  {Oates}
;;     c1618  mass 1  {man}
;;      c781  mass 1  {Xavier}
;;      c833  mass 1  {Mie Sonozaki}
;;      c997  mass 1  {Kari Wahlgren}

;; ---- slot talk.Agent  [event center]  n 8  clusters 7
(And (Member $e0 talk) (Agent $e0 $x1))
;;      c821  mass 2  {Katherine}
;;     c1554  mass 1  {school janitor}
;;     c1600  mass 1  {friend}
;;      c594  mass 1  {novelist}
;;      c825  mass 1  {Linda}
;;      c941  mass 1  {Daniel}
;;      c947  mass 1  {Jordan Peterson}

;; ---- slot use.Agent  [event center]  n 8  clusters 7
(And (Member $e0 use) (Agent $e0 $x1))
;;      c111  mass 2  {localized version}
;;     c1007  mass 1  {human brain}
;;     c1202  mass 1  {singer}
;;       c14  mass 1  {ukrainian army}
;;     c1612  mass 1  {Dad}
;;      c262  mass 1  {algerian government}
;;      c791  mass 1  {Churchill}

;; ---- slot walk.Agent  [event center]  n 8  clusters 8
(And (Member $e0 walk) (Agent $e0 $x1))
;;     c1554  mass 1  {school janitor}
;;     c3245  mass 1  {ant}
;;       c80  mass 1  {customer}
;;      c835  mass 1  {Hanako}
;;      c863  mass 1  {Michael}
;;      c880  mass 1  {Felix}
;;      c920  mass 1  {Leon}
;;      c934  mass 1  {Adriano}

;; ---- slot want.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 want) (Experiencer $e0 $x1))
;;      c770  mass 2  {Aslan}
;;     c1329  mass 1  {Pepper}
;;     c1421  mass 1  {cat}
;;      c885  mass 1  {Tony}
;;      c920  mass 1  {Leon}
;;      c924  mass 1  {Edmundo}
;;      c928  mass 1  {Benedito}

;; ---- slot work.Agent  [event center]  n 8  clusters 9
(And (Member $e0 work) (Agent $e0 $x1))
;;     c1555  mass 1  {volunteer}
;;     c1593  mass 1  {person}
;;     c1612  mass 1  {Dad}
;;      c855  mass 1  {Dmitri}
;;      c904  mass 1  {Asserson}
;;      c940  mass 1  {Dan}
;;      c953  mass 1  {Mr. Jones}
;;     c1214  mass 0.5  {adaptor}
;;     c1625  mass 0.5  {old}

;; ---- slot write.Agent  [event center]  n 8  clusters 6
(And (Member $e0 write) (Agent $e0 $x1))
;;     c1593  mass 2.5  {person}
;;      c872  mass 2  {Gilles Thibaut}
;;      c985  mass 2  {Bill Wrubel}
;;     c1534  mass 0.5  {busy}
;;     c1611  mass 0.5  {father}
;;     c1653  mass 0.5  {famous}

;; ---- slot come.Agent  [event center]  n 7  clusters 7
(And (Member $e0 come) (Agent $e0 $x1))
;;     c1043  mass 1  {student}
;;     c1618  mass 1  {man}
;;     c1674  mass 1  {country}
;;     c2342  mass 1  {sleep}
;;     c2401  mass 1  {train}
;;     c2426  mass 1  {discussion}
;;      c673  mass 1  {bus}

;; ---- slot contain.Agent  [event center]  n 7  clusters 6
(And (Member $e0 contain) (Agent $e0 $x1))
;;     c1146  mass 1.5  {deck}
;;     c1147  mass 1.5  {card}
;;     c1148  mass 1  {chest}
;;     c1200  mass 1  {song}
;;     c1217  mass 1  {plasma}
;;      c159  mass 1  {vitamin pill}

;; ---- slot contain.Theme  [event center]  n 7  clusters 9
(And (Member $e0 contain) (Theme $e0 $x1))
;;     c2159  mass 1  {jack}
;;      c534  mass 1  {electrolyte, electrolytes}
;;      c548  mass 1  {gold coin, gold coins}
;;      c783  mass 1  {king}
;;      c784  mass 1  {queen}
;;     c1196  mass 0.5  {lyric}
;;      c158  mass 0.5  {nutrition}
;;     c1867  mass 0.5  {degrading}
;;     c2448  mass 0.5  {abundant}

;; ---- slot create.Patient  [event center]  n 7  clusters 6
(And (Member $e0 create) (Patient $e0 $x1))
;;     c1028  mass 4  {community}
;;       c67  mass 1  {particle accelerator}
;;     c1706  mass 0.5  {language}
;;     c2281  mass 0.5  {calendar}
;;     c2551  mass 0.5  {new}
;;     c2795  mass 0.5  {various}

;; ---- slot form.Agent  [event center]  n 7  clusters 6
(And (Member $e0 form) (Agent $e0 $x1))
;;      c962  mass 2  {Jon Bon Jovi}
;;      c963  mass 2  {Sambora}
;;     c1549  mass 1  {labourer}
;;      c531  mass 1  {technetium}
;;     c2489  mass 0.5  {complex}
;;     c2943  mass 0.5  {simple}

;; ---- slot get.Patient  [event center]  n 7  clusters 12
(And (Member $e0 get) (Patient $e0 $x1))
;;     c1835  mass 1  {bad}
;;      c295  mass 1  {Iran}
;;     c1825  mass 0.5  {excuse}
;;     c2000  mass 0.5  {fire}
;;     c2049  mass 0.5  {weather}
;;     c2245  mass 0.5  {expensive}
;;     c2247  mass 0.5  {cheap}
;;     c2346  mass 0.5  {day}
;;     c2407  mass 0.5  {problem}
;;     c2462  mass 0.5  {big}
;;     c2945  mass 0.5  {short}
;;     c2962  mass 0.5  {thing}

;; ---- slot make.Result  [event center]  n 7  clusters 8
(And (Member $e0 make) (Result $e0 $x1))
;;     c1802  mass 1  {uncomfortable}
;;     c1835  mass 1  {bad}
;;     c1849  mass 1  {hazardous}
;;     c2215  mass 1  {beautiful}
;;     c2603  mass 1  {white}
;;      c783  mass 1  {king}
;;     c1674  mass 0.5  {country}
;;     c3215  mass 0.5  {back, backward}

;; ---- slot sell.Theme  [event center]  n 7  clusters 8
(And (Member $e0 sell) (Theme $e0 $x1))
;;     c1256  mass 2  {ice cream}
;;     c1283  mass 1  {milk}
;;     c2510  mass 1  {copy}
;;     c2962  mass 1  {thing}
;;     c1306  mass 0.5  {roasted}
;;     c1339  mass 0.5  {bean}
;;     c2107  mass 0.5  {cell phone, mobile phone}
;;     c2551  mass 0.5  {new}

;; ---- slot serve.Theme  [event center]  n 7  clusters 4
(And (Member $e0 serve) (Theme $e0 $x1))
;;      c218  mass 3  {Springfield Station}
;;      c199  mass 2  {Springfield}
;;     c1793  mass 1  {revenge}
;;       c86  mass 1  {coffee}

;; ---- slot try.Theme  [event center]  n 7  clusters 7
(And (Member $e0 try) (Theme $e0 $x1))
;;     c2605  mass 1  {burnish}
;;     c3022  mass 1  {pull}
;;     c3032  mass 1  {reach}
;;     c3204  mass 1  {give up}
;;      c482  mass 1  {steal}
;;      c506  mass 1  {abuse}
;;       c75  mass 1  {call}

;; ---- slot turn.Patient  [event center]  n 7  clusters 11
(And (Member $e0 turn) (Patient $e0 $x1))
;;     c2362  mass 1  {war}
;;       c31  mass 1  {russian speech}
;;      c710  mass 1  {road}
;;      c925  mass 1  {Gustavo}
;;     c1907  mass 0.5  {ceiling}
;;     c2602  mass 0.5  {black}
;;      c599  mass 0.5  {gusher}
;;      c603  mass 0.5  {freedom movement}
;;     c1370  mass 0.333  {leaf}
;;     c2373  mass 0.333  {red}
;;     c2596  mass 0.333  {yellow}

;; ---- slot win.Agent  [event center]  n 7  clusters 5
(And (Member $e0 win) (Agent $e0 $x1))
;;      c792  mass 2  {Wilson}
;;      c949  mass 2  {James Woods}
;;     c1480  mass 1  {horse}
;;     c2301  mass 1  {away team}
;;      c793  mass 1  {wilson}

;; ---- slot <unclassed>.Only  [entity center]  n 6  clusters 4
(Only $x0 $x1)
;;     c3069  mass 2  {have}
;;     c3263  mass 2  {find}
;;     c1577  mass 1  {solve}
;;     c3226  mass 1  {like}

;; ---- slot appear.Agent  [event center]  n 6  clusters 3
(And (Member $e0 appear) (Agent $e0 $x1))
;;     c1593  mass 3  {person}
;;      c975  mass 2  {Brian Packham}
;;     c1580  mass 1  {sister}

;; ---- slot bear.Patient  [event center]  n 6  clusters 5
(And (Member $e0 bear) (Patient $e0 $x1))
;;     c1593  mass 3  {person}
;;      c773  mass 1  {Tycho Brahe}
;;      c917  mass 1  {Tobias}
;;     c1618  mass 0.5  {man}
;;     c1839  mass 0.5  {poor}

;; ---- slot build.Instrument  [event center]  n 6  clusters 5
(And (Member $e0 build) (Instrument $e0 $x1))
;;     c2054  mass 2  {barometer}
;;     c3028  mass 2  {help}
;;     c2085  mass 1  {presented in scale, presented, scale}
;;     c2086  mass 0.5  {scale}
;;     c3102  mass 0.5  {presented}

;; ---- slot capture.Theme  [event center]  n 6  clusters 6
(And (Member $e0 capture) (Theme $e0 $x1))
;;     c1454  mass 1  {magpie}
;;     c1663  mass 1  {Valerian}
;;       c17  mass 1  {merchant ship}
;;       c18  mass 1  {british ship}
;;      c235  mass 1  {capital}
;;      c266  mass 1  {algerian city, algerian cities}

;; ---- slot cause.Agent  [event center]  n 6  clusters 6
(And (Member $e0 cause) (Agent $e0 $x1))
;;     c1093  mass 1  {tide}
;;     c1431  mass 1  {demon}
;;     c2028  mass 1  {storm}
;;     c2962  mass 1  {thing}
;;      c582  mass 1  {news}
;;      c704  mass 1  {walk}

;; ---- slot create.Agent  [event center]  n 6  clusters 4
(And (Member $e0 create) (Agent $e0 $x1))
;;      c121  mass 2  {native american, indigenous american, indigenous americans, native americans}
;;      c131  mass 2  {european american settler}
;;      c593  mass 1  {writer}
;;      c846  mass 1  {Paul}

;; ---- slot enter.Agent  [event center]  n 6  clusters 5
(And (Member $e0 enter) (Agent $e0 $x1))
;;     c1061  mass 2  {Lake Sammamish}
;;     c1593  mass 1  {person}
;;      c368  mass 1  {muslim, muslims}
;;      c806  mass 1  {Layla}
;;      c936  mass 1  {Martino}

;; ---- slot form.Patient  [event center]  n 6  clusters 7
(And (Member $e0 form) (Patient $e0 $x1))
;;     c1182  mass 2  {main songwriting unit, main, songwriting unit}
;;      c531  mass 1  {technetium}
;;      c747  mass 1  {human barricade}
;;     c1183  mass 0.5  {songwriting unit}
;;     c2489  mass 0.5  {complex}
;;     c2943  mass 0.5  {simple}
;;     c3023  mass 0.5  {main}

;; ---- slot fund.Agent  [event center]  n 6  clusters 3
(And (Member $e0 fund) (Agent $e0 $x1))
;;      c338  mass 3  {JICA}
;;      c644  mass 2  {government}
;;      c273  mass 1  {Government of Uganda}

;; ---- slot get.Agent  [event center]  n 6  clusters 7
(And (Member $e0 get) (Agent $e0 $x1))
;;     c2962  mass 1  {thing}
;;      c860  mass 1  {Leonid}
;;      c916  mass 1  {Gabriel}
;;      c923  mass 1  {Diego}
;;      c929  mass 1  {Janos}
;;     c1618  mass 0.5  {man}
;;     c1632  mass 0.5  {young}

;; ---- slot get.Result  [event center]  n 6  clusters 6
(And (Member $e0 get) (Result $e0 $x1))
;;     c1835  mass 1  {bad}
;;     c2245  mass 1  {expensive}
;;     c2247  mass 1  {cheap}
;;     c2476  mass 1  {powerful}
;;     c2945  mass 1  {short}
;;     c3044  mass 1  {ready}

;; ---- slot help.Agent  [event center]  n 6  clusters 6
(And (Member $e0 help) (Agent $e0 $x1))
;;     c1990  mass 1  {hothouse condition, hothouse conditions}
;;     c2817  mass 1  {life experience}
;;     c2955  mass 1  {context}
;;      c863  mass 1  {Michael}
;;      c886  mass 1  {Jonas}
;;      c942  mass 1  {Karen}

;; ---- slot receive.Theme  [event center]  n 6  clusters 6
(And (Member $e0 receive) (Theme $e0 $x1))
;;     c1531  mass 2  {work}
;;     c3019  mass 1  {award}
;;     c3193  mass 1  {permit}
;;     c3292  mass 1  {honorary knighthood}
;;     c2551  mass 0.5  {new}
;;      c685  mass 0.5  {car}

;; ---- slot run.Agent  [event center]  n 6  clusters 5
(And (Member $e0 run) (Agent $e0 $x1))
;;      c958  mass 2  {George Allen, Chuck Robb}
;;      c148  mass 1  {doctor}
;;     c1481  mass 1  {goat}
;;     c1492  mass 1  {squirrel}
;;      c917  mass 1  {Tobias}

;; ---- slot sleep.Experiencer  [event center]  n 6  clusters 4
(And (Member $e0 sleep) (Experiencer $e0 $x1))
;;     c1421  mass 2  {cat}
;;     c1640  mass 2  {child, kid}
;;     c1415  mass 1  {dog}
;;      c842  mass 1  {Baya}

;; ---- slot speak.Theme  [event center]  n 6  clusters 6
(And (Member $e0 speak) (Theme $e0 $x1))
;;      c903  mass 2  {Ashe}
;;     c1705  mass 1  {english}
;;     c2606  mass 1  {polish}
;;       c32  mass 1  {czech}
;;     c1706  mass 0.5  {language}
;;      c627  mass 0.5  {foreign}

;; ---- slot start.Agent  [event center]  n 6  clusters 7
(And (Member $e0 start) (Agent $e0 $x1))
;;     c1307  mass 1  {cook}
;;     c1554  mass 1  {school janitor}
;;     c1644  mass 1  {girl}
;;      c840  mass 1  {Skura}
;;      c867  mass 1  {Karl}
;;     c1738  mass 0.5  {crowd}
;;     c3142  mass 0.5  {whole}

;; ---- slot study.Location  [event center]  n 6  clusters 4
(And (Member $e0 study) (Location $e0 $x1))
;;      c780  mass 2  {Davis Studio}
;;      c782  mass 2  {Julian Ashton Art School}
;;     c1047  mass 1  {university}
;;      c214  mass 1  {Munich}

;; ---- slot write.CoAgent  [event center]  n 6  clusters 3
(And (Member $e0 write) (CoAgent $e0 $x1))
;;      c808  mass 2  {Laurie Aubanel}
;;      c811  mass 2  {Bianca Olsen}
;;      c991  mass 2  {Cyril Rambour}

;; ---- slot add.Agent  [event center]  n 5  clusters 4
(And (Member $e0 add) (Agent $e0 $x1))
;;     c2962  mass 2  {thing}
;;     c1307  mass 1  {cook}
;;     c1385  mass 1  {plant}
;;      c960  mass 1  {J. Augustus Knapp}

;; ---- slot appear.Location  [event center]  n 5  clusters 4
(And (Member $e0 appear) (Location $e0 $x1))
;;       c89  mass 2  {cafe}
;;     c1690  mass 1  {comedic role}
;;      c344  mass 1  {musical film}
;;        c7  mass 1  {Coronation Street}

;; ---- slot buy.Theme  [event center]  n 5  clusters 7
(And (Member $e0 buy) (Theme $e0 $x1))
;;     c1323  mass 1  {food}
;;     c1936  mass 1  {house}
;;     c2114  mass 1  {computer}
;;     c2596  mass 0.5  {yellow}
;;     c2597  mass 0.5  {blue}
;;      c563  mass 0.5  {trouser, trousers}
;;      c567  mass 0.5  {shirt}

;; ---- slot cry.Agent  [event center]  n 5  clusters 5
(And (Member $e0 cry) (Agent $e0 $x1))
;;     c1117  mass 1  {Rima}
;;     c1644  mass 1  {girl}
;;      c840  mass 1  {Skura}
;;      c842  mass 1  {Baya}
;;      c927  mass 1  {Alberto}

;; ---- slot direct.Agent  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Agent $e0 $x1))
;;      c969  mass 2  {Lev L. Spiro}
;;     c1212  mass 1  {conductor}
;;      c801  mass 1  {Claude Lelouch}
;;      c980  mass 1  {Robert Day}

;; ---- slot direct.Patient  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Patient $e0 $x1))
;;     c2142  mass 2  {episode}
;;      c343  mass 1.5  {movie, film}
;;     c2962  mass 1  {thing}
;;      c341  mass 0.5  {syrian film, film, syrian film}

;; ---- slot draw.Agent  [event center]  n 5  clusters 3
(And (Member $e0 draw) (Agent $e0 $x1))
;;     c1640  mass 2  {child, kid}
;;      c956  mass 2  {Cowper}
;;     c1753  mass 1  {concert}

;; ---- slot eat.Patient  [event center]  n 5  clusters 4
(And (Member $e0 eat) (Patient $e0 $x1))
;;     c1223  mass 2  {cookie, cookies}
;;     c1297  mass 1  {bread}
;;     c1311  mass 1  {chicken}
;;     c1489  mass 1  {rabbit}

;; ---- slot fly.Agent  [event center]  n 5  clusters 5
(And (Member $e0 fly) (Agent $e0 $x1))
;;     c1113  mass 1  {rocket}
;;     c1450  mass 1  {insect, insects}
;;     c1458  mass 1  {eagle}
;;      c656  mass 1  {plane}
;;      c779  mass 1  {Superman}

;; ---- slot include.Theme  [event center]  n 5  clusters 5
(And (Member $e0 include) (Theme $e0 $x1))
;;     c1206  mass 1  {marching band, marching bands}
;;      c141  mass 1  {extradition clause}
;;      c751  mass 1  {Armaan Jain}
;;      c752  mass 1  {Ranbir Kapoor}
;;      c753  mass 1  {Nikhil Nanda}

;; ---- slot lead.Agent  [event center]  n 5  clusters 4
(And (Member $e0 lead) (Agent $e0 $x1))
;;     c2962  mass 2  {thing}
;;     c1049  mass 1  {education}
;;     c1415  mass 1  {dog}
;;     c2501  mass 1  {general}

;; ---- slot lead.Goal  [event center]  n 5  clusters 7
(And (Member $e0 lead) (Goal $e0 $x1))
;;     c1935  mass 1  {home}
;;     c2184  mass 1  {peace}
;;     c2196  mass 1  {happiness}
;;     c1420  mass 0.5  {cat fight}
;;     c1664  mass 0.5  {glory}
;;     c2462  mass 0.5  {big}
;;     c3202  mass 0.5  {lost}

;; ---- slot marry.Agent  [event center]  n 5  clusters 4
(And (Member $e0 marry) (Agent $e0 $x1))
;;      c817  mass 2  {Margaret Fleming}
;;      c828  mass 1  {Nancy}
;;      c873  mass 1  {James of Barrochan}
;;      c993  mass 1  {Steve}

;; ---- slot need.Theme  [event center]  n 5  clusters 5
(And (Member $e0 need) (Theme $e0 $x1))
;;      c104  mass 1  {go}
;;     c2077  mass 1  {paint}
;;     c2392  mass 1  {run}
;;     c2756  mass 1  {generate}
;;     c2792  mass 1  {understand}

;; ---- slot portray.Agent  [event center]  n 5  clusters 4
(And (Member $e0 portray) (Agent $e0 $x1))
;;      c834  mass 2  {Soichiro Akizuki}
;;      c792  mass 1  {Wilson}
;;      c793  mass 1  {wilson}
;;      c949  mass 1  {James Woods}

;; ---- slot portray.Theme  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Theme $e0 $x1))
;;      c845  mass 2  {Kantaro Suga}
;;      c949  mass 2  {James Woods}
;;      c792  mass 1  {Wilson}

;; ---- slot present.Theme  [event center]  n 5  clusters 4
(And (Member $e0 present) (Theme $e0 $x1))
;;     c1200  mass 2  {song}
;;     c2080  mass 1  {picture}
;;     c2421  mass 1  {play}
;;     c2572  mass 1  {golden opportunity}

;; ---- slot provide.Agent  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Agent $e0 $x1))
;;     c1278  mass 1  {kitchen island}
;;     c1736  mass 1  {witness}
;;     c2274  mass 1  {organisation}
;;      c436  mass 1  {power station}
;;      c578  mass 1  {media}

;; ---- slot provide.Theme  [event center]  n 5  clusters 7
(And (Member $e0 provide) (Theme $e0 $x1))
;;     c1323  mass 1  {food}
;;     c1702  mass 1  {plurivocality}
;;      c434  mass 1  {electricity}
;;     c2137  mass 0.5  {counter space}
;;     c2266  mass 0.5  {detailed}
;;     c2267  mass 0.5  {description}
;;     c3095  mass 0.5  {extra}

;; ---- slot ready.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 ready) (Experiencer $e0 $x1))
;;     c1301  mass 1  {cake}
;;     c1317  mass 1  {dinner}
;;      c840  mass 1  {Skura}
;;      c860  mass 1  {Leonid}
;;      c966  mass 1  {Yanni}

;; ---- slot sell.Agent  [event center]  n 5  clusters 5
(And (Member $e0 sell) (Agent $e0 $x1))
;;     c1537  mass 2  {company}
;;      c579  mass 1  {newspaper, newspapers}
;;      c906  mass 1  {Mennad}
;;     c1671  mass 0.5  {indie}
;;       c84  mass 0.5  {coffee brand}

;; ---- slot sing.Theme  [event center]  n 5  clusters 2
(And (Member $e0 sing) (Theme $e0 $x1))
;;     c1194  mass 4  {music}
;;     c1200  mass 1  {song}

;; ---- slot sing.To  [event center]  n 5  clusters 3
(And (Member $e0 sing) (To $e0 $x1))
;;     c2655  mass 4  {accompany}
;;     c1194  mass 0.5  {music}
;;     c1843  mass 0.5  {sad}

;; ---- slot sleep.Location  [event center]  n 5  clusters 3
(And (Member $e0 sleep) (Location $e0 $x1))
;;     c1949  mass 3  {couch}
;;     c1570  mass 1  {mat}
;;     c2853  mass 1  {inside}

;; ---- slot stand.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 stand) (Experiencer $e0 $x1))
;;     c1043  mass 1  {student}
;;     c2501  mass 1  {general}
;;      c923  mass 1  {Diego}
;;      c924  mass 1  {Edmundo}
;;      c927  mass 1  {Alberto}

;; ---- slot start.Experiencer  [event center]  n 5  clusters 4
(And (Member $e0 start) (Experiencer $e0 $x1))
;;      c232  mass 2  {bridge}
;;     c1004  mass 1  {tunnel}
;;      c852  mass 1  {Oleg}
;;      c919  mass 1  {Gunter}

;; ---- slot study.Theme  [event center]  n 5  clusters 6
(And (Member $e0 study) (Theme $e0 $x1))
;;      c271  mass 1  {Arabic}
;;     c3086  mass 1  {rate}
;;      c430  mass 1  {mechanical engineering}
;;      c617  mass 1  {canon law}
;;      c170  mass 0.5  {bacterium}
;;     c2551  mass 0.5  {new}

;; ---- slot swim.Agent  [event center]  n 5  clusters 5
(And (Member $e0 swim) (Agent $e0 $x1))
;;     c1409  mass 1.5  {fish}
;;     c1050  mass 1  {school}
;;     c1640  mass 1  {child, kid}
;;      c825  mass 1  {Linda}
;;     c2373  mass 0.5  {red}

;; ---- slot travel.Agent  [event center]  n 5  clusters 4
(And (Member $e0 travel) (Agent $e0 $x1))
;;     c1593  mass 2  {person}
;;      c638  mass 1  {campaigner}
;;      c866  mass 1  {Matthew}
;;      c893  mass 1  {Roger}

;; ---- slot turn.Result  [event center]  n 5  clusters 5
(And (Member $e0 turn) (Result $e0 $x1))
;;     c1457  mass 1  {crow}
;;     c2373  mass 1  {red}
;;     c2596  mass 1  {yellow}
;;     c2602  mass 1  {black}
;;      c599  mass 1  {gusher}

;; ---- slot watch.Agent  [event center]  n 5  clusters 5
(And (Member $e0 watch) (Agent $e0 $x1))
;;     c1040  mass 1  {coach}
;;     c1593  mass 1  {person}
;;     c1596  mass 1  {family}
;;      c644  mass 1  {government}
;;      c842  mass 1  {Baya}

;; ---- slot win.Theme  [event center]  n 5  clusters 2
(And (Member $e0 win) (Theme $e0 $x1))
;;      c763  mass 4  {emmy}
;;      c507  mass 1  {race}

;; ---- slot bad.Between  [entity center]  n 4  clusters 2
(And (Member $x0 bad) (Between $x0 $x1))
;;      c331  mass 2  {Poland}
;;      c335  mass 2  {Germany}

;; ---- slot beauty.Possession  [entity center]  n 4  clusters 4
(And (Member $x0 beauty) (Possession $x0 $x1))
;;     c1063  mass 1  {Lake Towada, Lake Akan}
;;     c1128  mass 1  {scenery}
;;     c1562  mass 1  {sex}
;;     c1765  mass 1  {sight}

;; ---- slot family.Possession  [entity center]  n 4  clusters 1
(And (Member $x0 family) (Possession $x0 $x1))
;;     c1593  mass 4  {person}

;; ---- slot northern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 northern) (LocatedIn $x0 $x1))
;;      c307  mass 2  {India}
;;      c330  mass 2  {Estonia}

;; ---- slot southern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 southern) (LocatedIn $x0 $x1))
;;      c285  mass 2  {North Africa}
;;      c307  mass 2  {India}

;; ---- slot accompany.Agent  [event center]  n 4  clusters 2
(And (Member $e0 accompany) (Agent $e0 $x1))
;;     c1580  mass 2  {sister}
;;     c1593  mass 2  {person}

;; ---- slot accompany.Theme  [event center]  n 4  clusters 1
(And (Member $e0 accompany) (Theme $e0 $x1))
;;      c345  mass 4  {silent film}

;; ---- slot active.Time  [event center]  n 4  clusters 2
(And (Member $e0 active) (Time $e0 $x1))
;;     c2325  mass 2  {early morning}
;;     c2351  mass 2  {late afternoon}

;; ---- slot add.Theme  [event center]  n 4  clusters 3
(And (Member $e0 add) (Theme $e0 $x1))
;;     c2073  mass 2  {illustration}
;;     c1326  mass 1  {clove}
;;     c1375  mass 1  {greenery}

;; ---- slot arrive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 arrive) (Agent $e0 $x1))
;;      c103  mass 1  {spring}
;;      c665  mass 1  {paris train}
;;      c677  mass 1  {driver}
;;      c875  mass 1  {Donald}

;; ---- slot avoid.Theme  [event center]  n 4  clusters 4
(And (Member $e0 avoid) (Theme $e0 $x1))
;;     c1828  mass 1  {pitfall}
;;     c2962  mass 1  {thing}
;;     c3161  mass 1  {conform}
;;      c458  mass 1  {bankruptcy}

;; ---- slot bad.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 bad) (Experiencer $e0 $x1))
;;     c1835  mass 2  {bad}
;;     c1603  mass 1  {relationship}
;;     c2049  mass 0.5  {weather}
;;     c2961  mass 0.5  {matter}

;; ---- slot bear.Location  [event center]  n 4  clusters 3
(And (Member $e0 bear) (Location $e0 $x1))
;;      c210  mass 2  {Bromma}
;;     c1083  mass 1  {planet}
;;      c332  mass 1  {Denmark}

;; ---- slot begin.Patient  [event center]  n 4  clusters 4
(And (Member $e0 begin) (Patient $e0 $x1))
;;     c1050  mass 1  {school}
;;     c1397  mass 1  {tree}
;;     c2353  mass 1  {night}
;;     c2382  mass 1  {uprising}

;; ---- slot bring.Theme  [event center]  n 4  clusters 4
(And (Member $e0 bring) (Theme $e0 $x1))
;;       c18  mass 1  {british ship}
;;       c23  mass 1  {chinese dumpling}
;;     c2500  mass 1  {advantage}
;;      c887  mass 1  {Jonathan}

;; ---- slot capture.Agent  [event center]  n 4  clusters 4
(And (Member $e0 capture) (Agent $e0 $x1))
;;     c1468  mass 1  {falcon}
;;      c325  mass 1  {Spain}
;;      c490  mass 1  {pirate}
;;      c742  mass 1  {troop}

;; ---- slot cause.Patient  [event center]  n 4  clusters 5
(And (Member $e0 cause) (Patient $e0 $x1))
;;     c1860  mass 1  {damage}
;;       c68  mass 1  {earthquake}
;;       c73  mass 1  {abandonment anxiety}
;;     c1173  mass 0.5  {sound}
;;     c1177  mass 0.5  {creaking}

;; ---- slot change.Agent  [event center]  n 4  clusters 4
(And (Member $e0 change) (Agent $e0 $x1))
;;     c1370  mass 1  {leaf}
;;     c1618  mass 1  {man}
;;      c319  mass 1  {French Dahomey}
;;      c790  mass 1  {Cameron}

;; ---- slot close.Experiencer  [event center]  n 4  clusters 2
(And (Member $e0 close) (Experiencer $e0 $x1))
;;       c37  mass 3  {Low German}
;;      c877  mass 1  {Boldi}

;; ---- slot come.Source  [event center]  n 4  clusters 4
(And (Member $e0 come) (Source $e0 $x1))
;;     c1369  mass 1  {garden}
;;     c1944  mass 1  {place}
;;     c2397  mass 1  {treeline}
;;      c386  mass 1  {greek}

;; ---- slot connect.Theme  [event center]  n 4  clusters 3
(And (Member $e0 connect) (Theme $e0 $x1))
;;     c1070  mass 2  {Kayalar}
;;      c189  mass 1  {Nagoya, Osaka}
;;      c190  mass 1  {Tokyo}

;; ---- slot create.Location  [event center]  n 4  clusters 1
(And (Member $e0 create) (Location $e0 $x1))
;;     c2124  mass 4  {post}

;; ---- slot decide.Agent  [event center]  n 4  clusters 3
(And (Member $e0 decide) (Agent $e0 $x1))
;;      c858  mass 2  {Fyodor}
;;      c823  mass 1  {Beth}
;;      c915  mass 1  {Elias}

;; ---- slot design.Agent  [event center]  n 4  clusters 3
(And (Member $e0 design) (Agent $e0 $x1))
;;      c983  mass 2  {Henry L. Taylor}
;;       c21  mass 1  {Robert Allan Limited}
;;      c974  mass 1  {Philip Hercus}

;; ---- slot design.Patient  [event center]  n 4  clusters 2
(And (Member $e0 design) (Patient $e0 $x1))
;;     c2183  mass 2  {pacificat, pacificats}
;;     c2962  mass 2  {thing}

;; ---- slot die.Patient  [event center]  n 4  clusters 2
(And (Member $e0 die) (Patient $e0 $x1))
;;     c1593  mass 3  {person}
;;     c1596  mass 1  {family}

;; ---- slot discover.Theme  [event center]  n 4  clusters 5
(And (Member $e0 discover) (Theme $e0 $x1))
;;     c1594  mass 2  {name}
;;       c51  mass 1  {pterosaur egg, pterosaur eggs}
;;     c2542  mass 0.333  {magnet}
;;     c2551  mass 0.333  {new}
;;     c2771  mass 0.333  {type}

;; ---- slot do.Patient  [event center]  n 4  clusters 4
(And (Member $e0 do) (Patient $e0 $x1))
;;     c2962  mass 2  {thing}
;;     c1314  mass 1  {dish}
;;     c1684  mass 0.5  {dance}
;;     c2938  mass 0.5  {little}

;; ---- slot eat.Agent  [event center]  n 4  clusters 5
(And (Member $e0 eat) (Agent $e0 $x1))
;;     c1460  mass 1  {bird}
;;     c1593  mass 1  {person}
;;     c1640  mass 1  {child, kid}
;;     c1415  mass 0.5  {dog}
;;     c2600  mass 0.5  {brown}

;; ---- slot encourage.In  [event center]  n 4  clusters 3
(And (Member $e0 encourage) (In $e0 $x1))
;;     c1571  mass 2  {mathematics}
;;      c409  mass 1  {chess}
;;      c410  mass 1  {chess play}

;; ---- slot enter.Theme  [event center]  n 4  clusters 4
(And (Member $e0 enter) (Theme $e0 $x1))
;;     c1060  mass 1  {Issaquah Creek}
;;     c1914  mass 1  {cave}
;;      c313  mass 1  {United States}
;;      c696  mass 1  {park}

;; ---- slot find.Agent  [event center]  n 4  clusters 3
(And (Member $e0 find) (Agent $e0 $x1))
;;      c689  mass 2  {Couper}
;;      c933  mass 1  {Flavio}
;;      c938  mass 1  {Pietro}

;; ---- slot get.Theme  [event center]  n 4  clusters 5
(And (Member $e0 get) (Theme $e0 $x1))
;;     c1324  mass 1  {snack}
;;     c1491  mass 1  {hamster}
;;      c478  mass 1  {arrest}
;;     c2250  mass 0.5  {price}
;;     c2941  mass 0.5  {low}

;; ---- slot give.Theme  [event center]  n 4  clusters 5
(And (Member $e0 give) (Theme $e0 $x1))
;;     c1254  mass 1  {mock champagne}
;;     c1261  mass 1  {chocolate}
;;     c2962  mass 1  {thing}
;;     c2497  mass 0.5  {advice}
;;     c3179  mass 0.5  {good}

;; ---- slot good.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 good) (Experiencer $e0 $x1))
;;     c1287  mass 1  {barley bread}
;;     c2049  mass 1  {weather}
;;     c2962  mass 1  {thing}
;;      c650  mass 1  {windshield}

;; ---- slot help.Theme  [event center]  n 4  clusters 4
(And (Member $e0 help) (Theme $e0 $x1))
;;     c1593  mass 1  {person}
;;     c1644  mass 1  {girl}
;;     c2447  mass 1  {thrive}
;;     c2769  mass 1  {define}

;; ---- slot include.Agent  [event center]  n 4  clusters 2
(And (Member $e0 include) (Agent $e0 $x1))
;;     c1634  mass 3  {nephew}
;;     c1668  mass 1  {parade}

;; ---- slot increase.Patient  [event center]  n 4  clusters 4
(And (Member $e0 increase) (Patient $e0 $x1))
;;       c13  mass 1  {ukrainian combat loss, ukrainian combat losses}
;;      c439  mass 1  {industrial output}
;;      c508  mass 1  {xenophobia}
;;      c682  mass 1  {motor vehicle, motor vehicles}

;; ---- slot jump.Agent  [event center]  n 4  clusters 6
(And (Member $e0 jump) (Agent $e0 $x1))
;;     c1479  mass 1  {donkey}
;;     c1484  mass 1  {cow}
;;     c1636  mass 1  {boy}
;;     c1495  mass 0.333  {fox}
;;     c2600  mass 0.333  {brown}
;;     c3131  mass 0.333  {quickly, quick}

;; ---- slot kill.Location  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Location $e0 $x1))
;;      c647  mass 3  {state}
;;     c3026  mass 1  {here}

;; ---- slot kill.Manner  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Manner $e0 $x1))
;;     c2641  mass 2  {indirectly}
;;     c3233  mass 2  {direct, directly}

;; ---- slot lie.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 lie) (Experiencer $e0 $x1))
;;     c1160  mass 1  {tape recorder}
;;     c2106  mass 1  {notebook}
;;     c3071  mass 1  {pen}
;;      c587  mass 1  {book}

;; ---- slot lie.Location  [event center]  n 4  clusters 1
(And (Member $e0 lie) (Location $e0 $x1))
;;     c2105  mass 4  {table}

;; ---- slot look.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 look) (Experiencer $e0 $x1))
;;     c1050  mass 1  {school}
;;     c1102  mass 1  {island}
;;      c283  mass 1  {Europe, Western Europe}
;;      c720  mass 1  {flag}

;; ---- slot look.Like  [event center]  n 4  clusters 6
(And (Member $e0 look) (Like $e0 $x1))
;;     c1667  mass 1  {paradise}
;;      c475  mass 1  {prison}
;;     c1443  mass 0.5  {spider}
;;     c2464  mass 0.5  {huge}
;;     c3281  mass 0.5  {inverted}
;;      c719  mass 0.5  {philippine flag}

;; ---- slot move.Agent  [event center]  n 4  clusters 4
(And (Member $e0 move) (Agent $e0 $x1))
;;     c1548  mass 2  {headquarters}
;;      c899  mass 1  {Sammy}
;;     c1050  mass 0.5  {school}
;;     c1409  mass 0.5  {fish}

;; ---- slot perform.Location  [event center]  n 4  clusters 3
(And (Member $e0 perform) (Location $e0 $x1))
;;       c89  mass 2  {cafe}
;;     c1935  mass 1  {home}
;;     c2979  mass 1  {public}

;; ---- slot preach.Agent  [event center]  n 4  clusters 1
(And (Member $e0 preach) (Agent $e0 $x1))
;;     c1593  mass 4  {person}

;; ---- slot preach.Location  [event center]  n 4  clusters 2
(And (Member $e0 preach) (Location $e0 $x1))
;;      c209  mass 2  {Gareccio}
;;      c324  mass 2  {Italy}

;; ---- slot present.Agent  [event center]  n 4  clusters 3
(And (Member $e0 present) (Agent $e0 $x1))
;;      c913  mass 2  {Horner}
;;     c1537  mass 1  {company}
;;     c2572  mass 1  {golden opportunity}

;; ---- slot receive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 receive) (Agent $e0 $x1))
;;      c138  mass 1  {refugee}
;;     c3018  mass 1  {winner}
;;      c735  mass 1  {General Franks}
;;      c823  mass 1  {Beth}

;; ---- slot replace.Agent  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Agent $e0 $x1))
;;      c984  mass 2  {Sherman Howard}
;;     c1593  mass 1  {person}
;;      c988  mass 1  {Peter Gaussen}

;; ---- slot replace.Theme  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Theme $e0 $x1))
;;      c778  mass 2  {Lex Lex Luthor, Lex Luthor}
;;     c1593  mass 1  {person}
;;      c971  mass 1  {William Ewer}

;; ---- slot require.Theme  [event center]  n 4  clusters 6
(And (Member $e0 require) (Theme $e0 $x1))
;;      c432  mass 1  {repair}
;;       c78  mass 1  {american phone number}
;;     c1143  mass 0.5  {id card}
;;     c1531  mass 0.5  {work}
;;     c2492  mass 0.5  {hard}
;;     c3257  mass 0.5  {valid}

;; ---- slot specify.In  [event center]  n 4  clusters 2
(And (Member $e0 specify) (In $e0 $x1))
;;     c1873  mass 2  {continuous time}
;;     c1874  mass 2  {discrete time}

;; ---- slot spend.Agent  [event center]  n 4  clusters 3
(And (Member $e0 spend) (Agent $e0 $x1))
;;     c1593  mass 2  {person}
;;     c1476  mass 1  {giraffe}
;;     c2315  mass 1  {May}

;; ---- slot star.Agent  [event center]  n 4  clusters 1
(And (Member $e0 star) (Agent $e0 $x1))
;;     c2962  mass 4  {thing}

;; ---- slot star.Theme  [event center]  n 4  clusters 2
(And (Member $e0 star) (Theme $e0 $x1))
;;      c810  mass 2  {Patricia Kaas}
;;      c950  mass 2  {Jeremy Irons}

;; ---- slot stop.Agent  [event center]  n 4  clusters 5
(And (Member $e0 stop) (Agent $e0 $x1))
;;     c1117  mass 1  {Rima}
;;      c840  mass 1  {Skura}
;;      c966  mass 1  {Yanni}
;;     c1214  mass 0.5  {adaptor}
;;     c1625  mass 0.5  {old}

;; ---- slot stop.Theme  [event center]  n 4  clusters 2
(And (Member $e0 stop) (Theme $e0 $x1))
;;     c1531  mass 2  {work}
;;     c2013  mass 2  {cry}

;; ---- slot support.Theme  [event center]  n 4  clusters 1
(And (Member $e0 support) (Theme $e0 $x1))
;;     c2089  mass 4  {view}

;; ---- slot use.Manner  [event center]  n 4  clusters 3
(And (Member $e0 use) (Manner $e0 $x1))
;;     c2651  mass 2  {rarely}
;;     c2532  mass 1  {responsibly}
;;     c2652  mass 1  {colloquially}

;; ---- slot use.To  [event center]  n 4  clusters 4
(And (Member $e0 use) (To $e0 $x1))
;;     c1055  mass 1  {learn}
;;     c1305  mass 1  {roast}
;;     c2753  mass 1  {make}
;;     c3037  mass 1  {develop}

;; ---- slot walk.Goal  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Goal $e0 $x1))
;;     c1054  mass 1  {classroom}
;;     c1393  mass 1  {forest}
;;     c2238  mass 1  {store}
;;     c3215  mass 1  {back, backward}

;; ---- slot walk.Location  [event center]  n 4  clusters 5
(And (Member $e0 walk) (Location $e0 $x1))
;;     c1909  mass 1  {wood floor}
;;     c1963  mass 1  {hallway}
;;     c2591  mass 1  {dark}
;;     c1512  mass 0.5  {balloon}
;;     c2938  mass 0.5  {little}

;; ---- slot watch.Theme  [event center]  n 4  clusters 4
(And (Member $e0 watch) (Theme $e0 $x1))
;;     c2284  mass 1  {event}
;;     c2842  mass 1  {activity}
;;     c3293  mass 1  {natural hair video}
;;      c343  mass 1  {movie, film}

;; ---- slot win.For  [event center]  n 4  clusters 2
(And (Member $e0 win) (For $e0 $x1))
;;     c2069  mass 3  {portray}
;;     c2070  mass 1  {portrayal}

;; ---- slot work.Location  [event center]  n 4  clusters 4
(And (Member $e0 work) (Location $e0 $x1))
;;      c283  mass 1  {Europe, Western Europe}
;;      c380  mass 1  {Church of Norway}
;;      c438  mass 1  {factory}
;;      c479  mass 1  {prison kitchen}

;; ---- slot bottom.PartOf  [entity center]  n 3  clusters 2
(And (Member $x0 bottom) (PartOf $x0 $x1))
;;      c571  mass 2  {page}
;;     c1274  mass 1  {stew pot}

;; ---- slot fight.Against  [entity center]  n 3  clusters 3
(And (Member $x0 fight) (Against $x0 $x1))
;;     c2727  mass 1  {death}
;;     c2812  mass 1  {nature}
;;      c351  mass 1  {fate}

;; ---- slot thing.LocatedIn  [entity center]  n 3  clusters 2
(And (Member $x0 thing) (LocatedIn $x0 $x1))
;;     c1071  mass 2  {hill}
;;      c561  mass 1  {closet}

;; ---- slot active.Experiencer  [event center]  n 3  clusters 2
(And (Member $e0 active) (Experiencer $e0 $x1))
;;     c2962  mass 2  {thing}
;;      c904  mass 1  {Asserson}

;; ---- slot affect.Agent  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Agent $e0 $x1))
;;      c513  mass 3  {cyberattack}

;; ---- slot affect.Location  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Location $e0 $x1))
;;      c625  mass 3  {world}

;; ---- slot affect.Theme  [event center]  n 3  clusters 3
(And (Member $e0 affect) (Theme $e0 $x1))
;;      c153  mass 1  {hospital}
;;     c1537  mass 1  {company}
;;      c454  mass 1  {bank}

;; ---- slot affect.Time  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Time $e0 $x1))
;;     c3130  mass 3  {this year}

;; ---- slot approve.Theme  [event center]  n 3  clusters 3
(And (Member $e0 approve) (Theme $e0 $x1))
;;     c2263  mass 1  {treaty}
;;     c2278  mass 1  {plan}
;;     c2589  mass 1  {bill}

;; ---- slot attack.Patient  [event center]  n 3  clusters 3
(And (Member $e0 attack) (Patient $e0 $x1))
;;     c1943  mass 1  {building}
;;       c83  mass 1  {consumer rights}
;;      c926  mass 1  {Rodrigo}

;; ---- slot bake.Agent  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Agent $e0 $x1))
;;     c1537  mass 2  {company}
;;      c812  mass 1  {Ella}

;; ---- slot bake.Patient  [event center]  n 3  clusters 3
(And (Member $e0 bake) (Patient $e0 $x1))
;;     c1255  mass 2  {ice cone, ice cream cone}
;;     c1240  mass 0.5  {scrumptious}
;;     c1302  mass 0.5  {pie}

;; ---- slot base.On  [event center]  n 3  clusters 3
(And (Member $e0 base) (On $e0 $x1))
;;     c2361  mass 1  {fight}
;;      c384  mass 1  {puritan value}
;;       c42  mass 1  {latin alphabet}

;; ---- slot beautiful.Experiencer  [event center]  n 3  clusters 4
(And (Member $e0 beautiful) (Experiencer $e0 $x1))
;;     c2049  mass 1  {weather}
;;     c2215  mass 1  {beautiful}
;;     c1109  mass 0.5  {moon}
;;     c1966  mass 0.5  {room}

;; ---- slot break_out.Patient  [event center]  n 3  clusters 3
(And (Member $e0 break_out) (Patient $e0 $x1))
;;     c2000  mass 1  {fire}
;;     c2004  mass 1  {forest fire, forest fires}
;;     c2362  mass 1  {war}

;; ---- slot bring.Goal  [event center]  n 3  clusters 3
(And (Member $e0 bring) (Goal $e0 $x1))
;;     c2171  mass 1  {gallows}
;;      c308  mass 1  {Indonesia}
;;      c313  mass 1  {United States}

;; ---- slot buy.Agent  [event center]  n 3  clusters 2
(And (Member $e0 buy) (Agent $e0 $x1))
;;      c843  mass 2  {Keike}
;;      c911  mass 1  {Regis}

;; ---- slot close.Agent  [event center]  n 3  clusters 4
(And (Member $e0 close) (Agent $e0 $x1))
;;      c654  mass 1  {pilot}
;;      c743  mass 1  {guard}
;;     c1476  mass 0.5  {giraffe}
;;     c1582  mass 0.5  {female}

;; ---- slot close.Goal  [event center]  n 3  clusters 3
(And (Member $e0 close) (Goal $e0 $x1))
;;       c34  mass 1  {Dutch}
;;       c35  mass 1  {Frisian}
;;       c36  mass 1  {High German}

;; ---- slot close.Patient  [event center]  n 3  clusters 2
(And (Member $e0 close) (Patient $e0 $x1))
;;     c1923  mass 2  {door}
;;     c2238  mass 1  {store}

;; ---- slot come.Goal  [event center]  n 3  clusters 4
(And (Member $e0 come) (Goal $e0 $x1))
;;     c1753  mass 1  {concert}
;;     c2949  mass 1  {conclusion}
;;     c2659  mass 0.5  {settlement}
;;      c632  mass 0.5  {political}

;; ---- slot come.Patient  [event center]  n 3  clusters 3
(And (Member $e0 come) (Patient $e0 $x1))
;;     c1173  mass 1  {sound}
;;     c1439  mass 1  {insect sound, insect sounds}
;;     c2027  mass 1  {typhoon}

;; ---- slot come_back.Agent  [event center]  n 3  clusters 3
(And (Member $e0 come_back) (Agent $e0 $x1))
;;     c1606  mass 1  {mother, mom}
;;     c1610  mass 1  {dad}
;;     c1636  mass 1  {boy}

;; ---- slot compose.Patient  [event center]  n 3  clusters 3
(And (Member $e0 compose) (Patient $e0 $x1))
;;     c1200  mass 2  {song}
;;     c1210  mass 0.5  {symphony}
;;     c3174  mass 0.5  {great}

;; ---- slot conduct.Agent  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Agent $e0 $x1))
;;      c977  mass 2  {Carl Fenton}
;;      c724  mass 1  {FBI}

;; ---- slot conduct.Theme  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Theme $e0 $x1))
;;     c1211  mass 2  {orchestra}
;;     c1026  mass 1  {surveillance}

;; ---- slot cover.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Instrument $e0 $x1))
;;     c1388  mass 1  {weed}
;;     c2041  mass 1  {snow}
;;      c570  mass 1  {paper decoration, paper decorations}

;; ---- slot cover.Patient  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Patient $e0 $x1))
;;     c1961  mass 1  {courtyard}
;;     c3076  mass 1  {top}
;;      c421  mass 1  {shopping arcade}

;; ---- slot define.Theme  [event center]  n 3  clusters 2
(And (Member $e0 define) (Theme $e0 $x1))
;;     c2139  mass 2  {sequence}
;;     c2962  mass 1  {thing}

;; ---- slot die.Location  [event center]  n 3  clusters 2
(And (Member $e0 die) (Location $e0 $x1))
;;      c211  mass 2  {Stockholm}
;;     c2000  mass 1  {fire}

;; ---- slot drink.Patient  [event center]  n 3  clusters 3
(And (Member $e0 drink) (Patient $e0 $x1))
;;       c88  mass 2  {tea}
;;     c2023  mass 0.5  {water}
;;     c3179  mass 0.5  {good}

;; ---- slot drive.Agent  [event center]  n 3  clusters 2
(And (Member $e0 drive) (Agent $e0 $x1))
;;      c673  mass 2  {bus}
;;      c690  mass 1  {van}

;; ---- slot encourage.Agent  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Agent $e0 $x1))
;;      c897  mass 3  {Ralph}

;; ---- slot encourage.Theme  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Theme $e0 $x1))
;;      c881  mass 3  {Maurice}

;; ---- slot endorse.Theme  [event center]  n 3  clusters 1
(And (Member $e0 endorse) (Theme $e0 $x1))
;;     c2089  mass 3  {view}

;; ---- slot fall.Source  [event center]  n 3  clusters 3
(And (Member $e0 fall) (Source $e0 $x1))
;;     c1397  mass 1  {tree}
;;     c1957  mass 1  {shelf}
;;     c2051  mass 1  {sky}

;; ---- slot fight.Agent  [event center]  n 3  clusters 2
(And (Member $e0 fight) (Agent $e0 $x1))
;;      c115  mass 2  {kabye person}
;;     c1541  mass 1  {union boss}

;; ---- slot fight.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fight) (Theme $e0 $x1))
;;     c2618  mass 1  {freeze}
;;      c361  mass 1  {islamic fundamentalism}
;;      c495  mass 1  {terrorism}

;; ---- slot fund.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fund) (Theme $e0 $x1))
;;      c230  mass 1  {border section}
;;      c274  mass 1  {Lessos-Kenya}
;;      c275  mass 1  {Lessos-Uganda}

;; ---- slot give.Agent  [event center]  n 3  clusters 2
(And (Member $e0 give) (Agent $e0 $x1))
;;      c853  mass 2  {Vladimir}
;;      c870  mass 1  {William}

;; ---- slot go.Manner  [event center]  n 3  clusters 2
(And (Member $e0 go) (Manner $e0 $x1))
;;     c3187  mass 2  {late}
;;     c3133  mass 1  {immediately}

;; ---- slot go.To  [event center]  n 3  clusters 2
(And (Member $e0 go) (To $e0 $x1))
;;     c2425  mass 2  {talk}
;;     c3103  mass 1  {see}

;; ---- slot grow.Patient  [event center]  n 3  clusters 4
(And (Member $e0 grow) (Patient $e0 $x1))
;;     c1773  mass 1  {beard}
;;      c944  mass 1  {Kalman}
;;     c1173  mass 0.5  {sound}
;;     c2693  mass 0.5  {faint}

;; ---- slot have.In  [event center]  n 3  clusters 2
(And (Member $e0 have) (In $e0 $x1))
;;      c429  mass 2  {fluid mechanics}
;;     c1700  mass 1  {poetry}

;; ---- slot hold.Patient  [event center]  n 3  clusters 4
(And (Member $e0 hold) (Patient $e0 $x1))
;;     c2283  mass 1  {meeting}
;;      c381  mass 1  {prayer, prayers}
;;     c1756  mass 0.5  {ceremony}
;;     c2960  mass 0.5  {mass}

;; ---- slot lead.Theme  [event center]  n 3  clusters 4
(And (Member $e0 lead) (Theme $e0 $x1))
;;     c1482  mass 1  {sheep}
;;     c2302  mass 1  {squad}
;;     c1420  mass 0.5  {cat fight}
;;     c2462  mass 0.5  {big}

;; ---- slot learn.Theme  [event center]  n 3  clusters 4
(And (Member $e0 learn) (Theme $e0 $x1))
;;     c1704  mass 1  {vocabulary}
;;     c2582  mass 1  {berber}
;;     c1706  mass 0.5  {language}
;;      c627  mass 0.5  {foreign}

;; ---- slot leave.Patient  [event center]  n 3  clusters 5
(And (Member $e0 leave) (Patient $e0 $x1))
;;     c1923  mass 1  {door}
;;     c1918  mass 0.5  {unlocked}
;;     c2607  mass 0.5  {light}
;;     c3232  mass 0.5  {open}
;;     c3249  mass 0.5  {on}

;; ---- slot leave.Result  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Result $e0 $x1))
;;     c1918  mass 1  {unlocked}
;;     c3232  mass 1  {open}
;;     c3249  mass 1  {on}

;; ---- slot leave.Theme  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Theme $e0 $x1))
;;     c1966  mass 1  {room}
;;      c685  mass 1  {car}
;;      c695  mass 1  {parking lot}

;; ---- slot lose.Agent  [event center]  n 3  clusters 2
(And (Member $e0 lose) (Agent $e0 $x1))
;;      c958  mass 2  {George Allen, Chuck Robb}
;;      c691  mass 1  {tire}

;; ---- slot move.Goal  [event center]  n 3  clusters 2
(And (Member $e0 move) (Goal $e0 $x1))
;;      c197  mass 2  {Baltimore}
;;     c3026  mass 1  {here}

;; ---- slot paint.Patient  [event center]  n 3  clusters 2
(And (Member $e0 paint) (Patient $e0 $x1))
;;     c1127  mass 2  {landscape}
;;     c3050  mass 1  {gate}

;; ---- slot pick_up.Agent  [event center]  n 3  clusters 3
(And (Member $e0 pick_up) (Agent $e0 $x1))
;;      c205  mass 1  {Santiago}
;;     c2097  mass 1  {camera}
;;      c889  mass 1  {Jay}

;; ---- slot play.Location  [event center]  n 3  clusters 2
(And (Member $e0 play) (Location $e0 $x1))
;;      c204  mass 2  {Havana}
;;     c1908  mass 1  {floor}

;; ---- slot pull.Theme  [event center]  n 3  clusters 5
(And (Member $e0 pull) (Theme $e0 $x1))
;;      c205  mass 1  {Santiago}
;;      c854  mass 1  {Boris}
;;     c2396  mass 0.333  {line}
;;     c3192  mass 0.333  {long}
;;      c660  mass 0.333  {freight car}

;; ---- slot read.Agent  [event center]  n 3  clusters 4
(And (Member $e0 read) (Agent $e0 $x1))
;;      c850  mass 1  {Katya}
;;      c884  mass 1  {Thomas}
;;     c1644  mass 0.5  {girl}
;;     c2938  mass 0.5  {little}

;; ---- slot read.Theme  [event center]  n 3  clusters 3
(And (Member $e0 read) (Theme $e0 $x1))
;;     c1691  mass 1  {comic}
;;      c350  mass 1  {fairy tale}
;;      c469  mass 1  {economics magazine}

;; ---- slot require.Agent  [event center]  n 3  clusters 3
(And (Member $e0 require) (Agent $e0 $x1))
;;     c1936  mass 1  {house}
;;     c3024  mass 1  {master}
;;     c3035  mass 1  {app}

;; ---- slot return.Agent  [event center]  n 3  clusters 2
(And (Member $e0 return) (Agent $e0 $x1))
;;      c750  mass 2  {Glasnow}
;;       c20  mass 1  {fishing boat}

;; ---- slot return.Goal  [event center]  n 3  clusters 2
(And (Member $e0 return) (Goal $e0 $x1))
;;      c201  mass 2  {Altoona}
;;     c2129  mass 1  {port}

;; ---- slot rule.Agent  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Agent $e0 $x1))
;;      c760  mass 2  {Tipu Sultan}
;;      c325  mass 1  {Spain}

;; ---- slot rule.Theme  [event center]  n 3  clusters 4
(And (Member $e0 rule) (Theme $e0 $x1))
;;      c305  mass 1  {Cuba}
;;      c367  mass 1  {muslim house, house, muslim}
;;     c1936  mass 0.5  {house}
;;      c368  mass 0.5  {muslim, muslims}

;; ---- slot say.Theme  [event center]  n 3  clusters 2
(And (Member $e0 say) (Theme $e0 $x1))
;;     c2962  mass 2  {thing}
;;      c354  mass 1  {funeral prayer}

;; ---- slot season.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 season) (Instrument $e0 $x1))
;;     c1328  mass 1  {lemongrass}
;;     c1336  mass 1  {horse radish}
;;     c1338  mass 1  {ramson}

;; ---- slot see.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 see) (Stimulus $e0 $x1))
;;     c1108  mass 1  {full moon}
;;     c1485  mass 1  {animal}
;;      c824  mass 1  {Jessica}

;; ---- slot shoot.Patient  [event center]  n 3  clusters 3
(And (Member $e0 shoot) (Patient $e0 $x1))
;;     c1502  mass 1  {bear}
;;      c799  mass 1  {JFK}
;;      c940  mass 1  {Dan}

;; ---- slot sleep.Agent  [event center]  n 3  clusters 2
(And (Member $e0 sleep) (Agent $e0 $x1))
;;     c1593  mass 2  {person}
;;     c1596  mass 1  {family}

;; ---- slot solve.Patient  [event center]  n 3  clusters 1
(And (Member $e0 solve) (Patient $e0 $x1))
;;     c2407  mass 3  {problem}

;; ---- slot spend.Theme  [event center]  n 3  clusters 2
(And (Member $e0 spend) (Theme $e0 $x1))
;;      c140  mass 2  {exile}
;;     c2346  mass 1  {day}

;; ---- slot start.Location  [event center]  n 3  clusters 2
(And (Member $e0 start) (Location $e0 $x1))
;;      c334  mass 2  {Sweden}
;;      c332  mass 1  {Denmark}

;; ---- slot stick.Patient  [event center]  n 3  clusters 3
(And (Member $e0 stick) (Patient $e0 $x1))
;;     c1263  mass 1  {chewing gum}
;;     c1480  mass 1  {horse}
;;      c680  mass 1  {truck}

;; ---- slot succeed.Agent  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Agent $e0 $x1))
;;      c776  mass 1  {Alexander}
;;      c898  mass 1  {Bailey}
;;      c988  mass 1  {Peter Gaussen}

;; ---- slot succeed.Theme  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Theme $e0 $x1))
;;     c1593  mass 1  {person}
;;      c817  mass 1  {Margaret Fleming}
;;      c957  mass 1  {Henry Cole}

;; ---- slot take_off.Agent  [event center]  n 3  clusters 3
(And (Member $e0 take_off) (Agent $e0 $x1))
;;      c655  mass 1  {aeroplane, airplane}
;;      c656  mass 1  {plane}
;;      c940  mass 1  {Dan}

;; ---- slot take_over.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_over) (Agent $e0 $x1))
;;      c794  mass 2  {Watts}
;;     c1378  mass 1  {ivy}

;; ---- slot talk.Recipient  [event center]  n 3  clusters 4
(And (Member $e0 talk) (Recipient $e0 $x1))
;;     c1039  mass 1  {teacher}
;;      c826  mass 1  {Loren}
;;     c1740  mass 0.5  {audience}
;;     c2463  mass 0.5  {large}

;; ---- slot turn.Goal  [event center]  n 3  clusters 3
(And (Member $e0 turn) (Goal $e0 $x1))
;;     c1066  mass 1  {river}
;;     c1697  mass 1  {quagmire}
;;     c2998  mass 1  {report}

;; ---- slot understand.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 understand) (Stimulus $e0 $x1))
;;      c145  mass 1  {public health issue}
;;     c2409  mass 1  {specific issue}
;;     c2958  mass 1  {reason}

;; ---- slot wear.Theme  [event center]  n 3  clusters 3
(And (Member $e0 wear) (Theme $e0 $x1))
;;     c1770  mass 1  {mask}
;;      c568  mass 1  {inaugural gown}
;;      c649  mass 1  {helmet}

;; ---- slot welcome.Agent  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Agent $e0 $x1))
;;     c3027  mass 1  {host}
;;      c440  mass 1  {industrialization}
;;      c608  mass 1  {whig, whigs}

;; ---- slot welcome.Theme  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Theme $e0 $x1))
;;     c1745  mass 1  {guest}
;;      c440  mass 1  {industrialization}
;;      c608  mass 1  {whig, whigs}

;; ---- slot work.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 work) (Experiencer $e0 $x1))
;;     c1216  mass 1  {travel adaptor}
;;     c2117  mass 1  {mouse}
;;     c2125  mass 1  {site}

;; ---- slot work.Manner  [event center]  n 3  clusters 3
(And (Member $e0 work) (Manner $e0 $x1))
;;     c3181  mass 1  {perfectly}
;;     c3187  mass 1  {late}
;;     c3236  mass 1  {fine}

;; ==================== word @ cluster cos 1.00: pooled role level (136 head pairs) ====================

;; Agent ~ Experiencer  cosine 0.56  JSD 0.735  n 888 / 261  shared: {person} {thing} {child}
(Agent $e $x)
(Experiencer $e $x)

;; Agent ~ Patient  cosine 0.51  JSD 0.804  n 888 / 455  shared: {person} {thing} {child}
(Agent $e $x)
(Patient $e $x)

;; Patient ~ Theme  cosine 0.50  JSD 0.789  n 455 / 594  shared: {thing} {person} {room}
(Patient $e $x)
(Theme $e $x)

;; Experiencer ~ Patient  cosine 0.49  JSD 0.711  n 261 / 455  shared: {person} {thing} {door}
(Experiencer $e $x)
(Patient $e $x)

;; Agent ~ Theme  cosine 0.41  JSD 0.835  n 888 / 594  shared: {person} {thing} {company}
(Agent $e $x)
(Theme $e $x)

;; Experiencer ~ Theme  cosine 0.39  JSD 0.834  n 261 / 594  shared: {thing} {person} {child}
(Experiencer $e $x)
(Theme $e $x)

;; Stimulus ~ Theme  cosine 0.36  JSD 0.89  n 34 / 594  shared: {thing} {child} {music}
(Stimulus $e $x)
(Theme $e $x)

;; Agent ~ Recipient  cosine 0.32  JSD 0.856  n 888 / 29  shared: {person} {company} {man}
(Agent $e $x)
(Recipient $e $x)

;; Patient ~ Stimulus  cosine 0.25  JSD 0.918  n 455 / 34  shared: {thing} {child} {food}
(Patient $e $x)
(Stimulus $e $x)

;; Holder ~ Theme  cosine 0.21  JSD 0.903  n 48 / 594  shared: {thing} {house} {food}
(Holder $e $x)
(Theme $e $x)

;; Holder ~ Patient  cosine 0.20  JSD 0.873  n 48 / 455  shared: {thing} {movie} {room}
(Holder $e $x)
(Patient $e $x)

;; Experiencer ~ Stimulus  cosine 0.19  JSD 0.931  n 261 / 34  shared: {thing} {child}
(Experiencer $e $x)
(Stimulus $e $x)

;; Agent ~ Stimulus  cosine 0.17  JSD 0.919  n 888 / 34  shared: {thing} {child} {Jessica}
(Agent $e $x)
(Stimulus $e $x)

;; Experiencer ~ Result  cosine 0.16  JSD 0.821  n 261 / 43  shared: {bad} {red} {black}
(Experiencer $e $x)
(Result $e $x)

;; Goal ~ Source  cosine 0.16  JSD 0.864  n 93 / 47  shared: {town} {here} {school}
(Goal $e $x)
(Source $e $x)

;; Experiencer ~ Recipient  cosine 0.15  JSD 0.938  n 261 / 29  shared: {person} {man} {large}
(Experiencer $e $x)
(Recipient $e $x)

;; Theme ~ To  cosine 0.15  JSD 0.923  n 594 / 46  shared: {thing} {talk} {music}
(Theme $e $x)
(To $e $x)

;; Experiencer ~ Holder  cosine 0.15  JSD 0.877  n 261 / 48  shared: {thing} {house} {place}
(Experiencer $e $x)
(Holder $e $x)

;; Patient ~ Recipient  cosine 0.14  JSD 0.942  n 455 / 29  shared: {person} {city} {man}
(Patient $e $x)
(Recipient $e $x)

;; Holder ~ Stimulus  cosine 0.14  JSD 0.917  n 48 / 34  shared: {thing} {food}
(Holder $e $x)
(Stimulus $e $x)

;; Location ~ Source  cosine 0.13  JSD 0.906  n 210 / 47  shared: {here} {town} {place}
(Location $e $x)
(Source $e $x)

;; Holder ~ Source  cosine 0.11  JSD 0.911  n 48 / 47  shared: {town} {room} {place}
(Holder $e $x)
(Source $e $x)

;; Goal ~ Location  cosine 0.10  JSD 0.897  n 93 / 210  shared: {here} {home} {town}
(Goal $e $x)
(Location $e $x)

;; Stimulus ~ To  cosine 0.10  JSD 0.907  n 34 / 46  shared: {thing} {practice} {music}
(Stimulus $e $x)
(To $e $x)

;; Agent ~ Holder  cosine 0.09  JSD 0.928  n 888 / 48  shared: {thing} {Wilson} {Karen}
(Agent $e $x)
(Holder $e $x)

;; Patient ~ Result  cosine 0.09  JSD 0.895  n 455 / 43  shared: {bad} {black} {red}
(Patient $e $x)
(Result $e $x)

;; Recipient ~ Theme  cosine 0.09  JSD 0.948  n 29 / 594  shared: {person} {company} {friend}
(Recipient $e $x)
(Theme $e $x)

;; Patient ~ To  cosine 0.09  JSD 0.959  n 455 / 46  shared: {thing} {woman}
(Patient $e $x)
(To $e $x)

;; Goal ~ Holder  cosine 0.09  JSD 0.923  n 93 / 48  shared: {town} {house} {place}
(Goal $e $x)
(Holder $e $x)

;; Goal ~ Patient  cosine 0.07  JSD 0.912  n 93 / 455  shared: {tree} {room} {community}
(Goal $e $x)
(Patient $e $x)

;; Patient ~ Source  cosine 0.07  JSD 0.949  n 455 / 47  shared: {tree} {room} {school}
(Patient $e $x)
(Source $e $x)

;; Experiencer ~ To  cosine 0.06  JSD 0.963  n 261 / 46  shared: {thing} {doctor}
(Experiencer $e $x)
(To $e $x)

;; Agent ~ To  cosine 0.06  JSD 0.957  n 888 / 46  shared: {thing} {doctor} {woman}
(Agent $e $x)
(To $e $x)

;; Holder ~ To  cosine 0.06  JSD 0.942  n 48 / 46  shared: {thing} {repeat}
(Holder $e $x)
(To $e $x)

;; Holder ~ Location  cosine 0.05  JSD 0.948  n 48 / 210  shared: {town} {place} {house}
(Holder $e $x)
(Location $e $x)

;; Location ~ Patient  cosine 0.05  JSD 0.925  n 210 / 455  shared: {door} {table} {hotel}
(Location $e $x)
(Patient $e $x)

;; Experiencer ~ Goal  cosine 0.05  JSD 0.929  n 261 / 93  shared: {house} {place} {school}
(Experiencer $e $x)
(Goal $e $x)

;; For ~ Goal  cosine 0.05  JSD 0.967  n 39 / 93  shared: {bed}
(For $e $x)
(Goal $e $x)

;; Source ~ Theme  cosine 0.04  JSD 0.958  n 47 / 594  shared: {view} {room} {eat}
(Source $e $x)
(Theme $e $x)

;; Instrument ~ Stimulus  cosine 0.04  JSD 0.95  n 34 / 34  shared: {food} {crash}
(Instrument $e $x)
(Stimulus $e $x)

;; In ~ Stimulus  cosine 0.04  JSD 0.953  n 50 / 34  shared: {action} {poetry}
(In $e $x)
(Stimulus $e $x)

;; Experiencer ~ Source  cosine 0.04  JSD 0.955  n 261 / 47  shared: {place} {room} {school}
(Experiencer $e $x)
(Source $e $x)

;; Experiencer ~ Location  cosine 0.04  JSD 0.948  n 261 / 210  shared: {Europe} {place} {house}
(Experiencer $e $x)
(Location $e $x)

;; For ~ Theme  cosine 0.03  JSD 0.968  n 39 / 594  shared: {work} {polish} {word}
(For $e $x)
(Theme $e $x)

;; Goal ~ Manner  cosine 0.03  JSD 0.97  n 93 / 115  shared: {well} {back}
(Goal $e $x)
(Manner $e $x)

;; Holder ~ Result  cosine 0.03  JSD 0.976  n 48 / 43  shared: {bad}
(Holder $e $x)
(Result $e $x)

;; Instrument ~ Patient  cosine 0.03  JSD 0.962  n 34 / 455  shared: {road} {snow} {food}
(Instrument $e $x)
(Patient $e $x)

;; Goal ~ Theme  cosine 0.03  JSD 0.953  n 93 / 594  shared: {house} {room} {new}
(Goal $e $x)
(Theme $e $x)

;; Location ~ Theme  cosine 0.03  JSD 0.952  n 210 / 594  shared: {house} {Gareccio} {group}
(Location $e $x)
(Theme $e $x)

;; Goal ~ In  cosine 0.03  JSD 0.969  n 93 / 50  shared: {way} {field}
(Goal $e $x)
(In $e $x)

;; In ~ Source  cosine 0.02  JSD 0.975  n 50 / 47  shared: {way}
(In $e $x)
(Source $e $x)

;; Experiencer ~ Instrument  cosine 0.02  JSD 0.977  n 261 / 34  shared: {road} {train}
(Experiencer $e $x)
(Instrument $e $x)

;; For ~ Stimulus  cosine 0.02  JSD 0.973  n 39 / 34  shared: {start}
(For $e $x)
(Stimulus $e $x)

;; Holder ~ Instrument  cosine 0.02  JSD 0.975  n 48 / 34  shared: {food}
(Holder $e $x)
(Instrument $e $x)

;; In ~ Theme  cosine 0.02  JSD 0.981  n 50 / 594  shared: {english} {understand} {way}
(In $e $x)
(Theme $e $x)

;; Result ~ Source  cosine 0.02  JSD 0.978  n 43 / 47  shared: {bat}
(Result $e $x)
(Source $e $x)

;; Agent ~ For  cosine 0.02  JSD 0.975  n 888 / 39  shared: {cook} {bus} {patient}
(Agent $e $x)
(For $e $x)

;; Agent ~ Goal  cosine 0.02  JSD 0.965  n 888 / 93  shared: {school} {campfire} {community}
(Agent $e $x)
(Goal $e $x)

;; Location ~ Recipient  cosine 0.02  JSD 0.978  n 210 / 29  shared: {city} {large}
(Location $e $x)
(Recipient $e $x)

;; Result ~ Theme  cosine 0.02  JSD 0.976  n 43 / 594  shared: {sleep} {inomaru} {king}
(Result $e $x)
(Theme $e $x)

;; In ~ Patient  cosine 0.02  JSD 0.979  n 50 / 455  shared: {weather} {field} {water}
(In $e $x)
(Patient $e $x)

;; Experiencer ~ Time  cosine 0.01  JSD 0.984  n 261 / 107  shared: {night} {day}
(Experiencer $e $x)
(Time $e $x)

;; Goal ~ Instrument  cosine 0.01  JSD 0.983  n 93 / 34  shared: {snow}
(Goal $e $x)
(Instrument $e $x)

;; In ~ Location  cosine 0.01  JSD 0.98  n 50 / 210  shared: {water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; Manner ~ Result  cosine 0.01  JSD 0.98  n 115 / 43  shared: {together}
(Manner $e $x)
(Result $e $x)

;; Experiencer ~ In  cosine 0.01  JSD 0.987  n 261 / 50  shared: {weather}
(Experiencer $e $x)
(In $e $x)

;; Goal ~ Recipient  cosine 0.01  JSD 0.982  n 93 / 29  shared: {Loren}
(Goal $e $x)
(Recipient $e $x)

;; In ~ To  cosine 0.01  JSD 0.981  n 50 / 46  shared: {action}
(In $e $x)
(To $e $x)

;; Instrument ~ Theme  cosine 0.01  JSD 0.987  n 34 / 594  shared: {food} {huge}
(Instrument $e $x)
(Theme $e $x)

;; Experiencer ~ For  cosine 0.01  JSD 0.987  n 261 / 39  shared: {word}
(Experiencer $e $x)
(For $e $x)

;; Recipient ~ Source  cosine 0.01  JSD 0.982  n 29 / 47  shared: {local}
(Recipient $e $x)
(Source $e $x)

;; Agent ~ Instrument  cosine 0.01  JSD 0.984  n 888 / 34  shared: {train} {plant} {road}
(Agent $e $x)
(Instrument $e $x)

;; Agent ~ Location  cosine 0.01  JSD 0.971  n 888 / 210  shared: {France} {fire} {house}
(Agent $e $x)
(Location $e $x)

;; Agent ~ Result  cosine 0.01  JSD 0.982  n 888 / 43  shared: {crow} {red} {sleep}
(Agent $e $x)
(Result $e $x)

;; Manner ~ Patient  cosine 0.01  JSD 0.99  n 115 / 455  shared: {well} {together}
(Manner $e $x)
(Patient $e $x)

;; Recipient ~ Result  cosine 0.01  JSD 0.98  n 29 / 43  shared: {large}
(Recipient $e $x)
(Result $e $x)

;; Patient ~ Time  cosine 0.01  JSD 0.988  n 455 / 107  shared: {night} {hour} {day}
(Patient $e $x)
(Time $e $x)

;; For ~ Patient  cosine 0.01  JSD 0.988  n 39 / 455  shared: {word} {dance} {whole}
(For $e $x)
(Patient $e $x)

;; Holder ~ In  cosine 0.01  JSD 0.986  n 48 / 50  shared: {weather}
(Holder $e $x)
(In $e $x)

;; Instrument ~ Location  cosine 0.01  JSD 0.989  n 34 / 210  shared: {snow} {huge}
(Instrument $e $x)
(Location $e $x)

;; Source ~ Time  cosine 0.01  JSD 0.986  n 47 / 107  shared: {point}
(Source $e $x)
(Time $e $x)

;; Location ~ To  cosine 0.01  JSD 0.991  n 210 / 46  shared: {shore}
(Location $e $x)
(To $e $x)

;; Agent ~ Source  cosine 0.00  JSD 0.995  n 888 / 47  shared: {school}
(Agent $e $x)
(Source $e $x)

;; Theme ~ Time  cosine 0.00  JSD 0.991  n 594 / 107  shared: {morning} {day}
(Theme $e $x)
(Time $e $x)

;; Location ~ Result  cosine 0.00  JSD 0.994  n 210 / 43  shared: {large}
(Location $e $x)
(Result $e $x)

;; Manner ~ Time  cosine 0.00  JSD 0.991  n 115 / 107  shared: {late}
(Manner $e $x)
(Time $e $x)

;; Experiencer ~ Manner  cosine 0.00  JSD 0.995  n 261 / 115  shared: {together}
(Experiencer $e $x)
(Manner $e $x)

;; Agent ~ In  cosine 0.00  JSD 0.997  n 888 / 50  shared: {context}
(Agent $e $x)
(In $e $x)

;; Agent ~ Time  cosine 0.00  JSD 0.997  n 888 / 107  shared: {spring}
(Agent $e $x)
(Time $e $x)

;; Location ~ Manner  cosine 0.00  JSD 0.996  n 210 / 115  shared: {early}
(Location $e $x)
(Manner $e $x)

;; Agent ~ Manner  cosine 0.00  JSD 1.0  n 888 / 115  shared: 
(Agent $e $x)
(Manner $e $x)

;; For ~ Holder  cosine 0.00  JSD 1.0  n 39 / 48  shared: 
(For $e $x)
(Holder $e $x)

;; For ~ In  cosine 0.00  JSD 1.0  n 39 / 50  shared: 
(For $e $x)
(In $e $x)

;; For ~ Instrument  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Instrument $e $x)

;; For ~ Location  cosine 0.00  JSD 1.0  n 39 / 210  shared: 
(For $e $x)
(Location $e $x)

;; For ~ Manner  cosine 0.00  JSD 1.0  n 39 / 115  shared: 
(For $e $x)
(Manner $e $x)

;; For ~ Recipient  cosine 0.00  JSD 1.0  n 39 / 29  shared: 
(For $e $x)
(Recipient $e $x)

;; For ~ Result  cosine 0.00  JSD 1.0  n 39 / 43  shared: 
(For $e $x)
(Result $e $x)

;; For ~ Source  cosine 0.00  JSD 1.0  n 39 / 47  shared: 
(For $e $x)
(Source $e $x)

;; For ~ Time  cosine 0.00  JSD 1.0  n 39 / 107  shared: 
(For $e $x)
(Time $e $x)

;; For ~ To  cosine 0.00  JSD 1.0  n 39 / 46  shared: 
(For $e $x)
(To $e $x)

;; Goal ~ Result  cosine 0.00  JSD 1.0  n 93 / 43  shared: 
(Goal $e $x)
(Result $e $x)

;; Goal ~ Stimulus  cosine 0.00  JSD 1.0  n 93 / 34  shared: 
(Goal $e $x)
(Stimulus $e $x)

;; Goal ~ Time  cosine 0.00  JSD 1.0  n 93 / 107  shared: 
(Goal $e $x)
(Time $e $x)

;; Goal ~ To  cosine 0.00  JSD 1.0  n 93 / 46  shared: 
(Goal $e $x)
(To $e $x)

;; Holder ~ Manner  cosine 0.00  JSD 1.0  n 48 / 115  shared: 
(Holder $e $x)
(Manner $e $x)

;; Holder ~ Recipient  cosine 0.00  JSD 1.0  n 48 / 29  shared: 
(Holder $e $x)
(Recipient $e $x)

;; Holder ~ Time  cosine 0.00  JSD 1.0  n 48 / 107  shared: 
(Holder $e $x)
(Time $e $x)

;; In ~ Instrument  cosine 0.00  JSD 1.0  n 50 / 34  shared: 
(In $e $x)
(Instrument $e $x)

;; In ~ Manner  cosine 0.00  JSD 1.0  n 50 / 115  shared: 
(In $e $x)
(Manner $e $x)

;; In ~ Recipient  cosine 0.00  JSD 1.0  n 50 / 29  shared: 
(In $e $x)
(Recipient $e $x)

;; In ~ Result  cosine 0.00  JSD 1.0  n 50 / 43  shared: 
(In $e $x)
(Result $e $x)

;; In ~ Time  cosine 0.00  JSD 1.0  n 50 / 107  shared: 
(In $e $x)
(Time $e $x)

;; Instrument ~ Manner  cosine 0.00  JSD 1.0  n 34 / 115  shared: 
(Instrument $e $x)
(Manner $e $x)

;; Instrument ~ Recipient  cosine 0.00  JSD 1.0  n 34 / 29  shared: 
(Instrument $e $x)
(Recipient $e $x)

;; Instrument ~ Result  cosine 0.00  JSD 1.0  n 34 / 43  shared: 
(Instrument $e $x)
(Result $e $x)

;; Instrument ~ Source  cosine 0.00  JSD 1.0  n 34 / 47  shared: 
(Instrument $e $x)
(Source $e $x)

;; Instrument ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Instrument $e $x)
(Time $e $x)

;; Instrument ~ To  cosine 0.00  JSD 1.0  n 34 / 46  shared: 
(Instrument $e $x)
(To $e $x)

;; Location ~ Stimulus  cosine 0.00  JSD 1.0  n 210 / 34  shared: 
(Location $e $x)
(Stimulus $e $x)

;; Location ~ Time  cosine 0.00  JSD 1.0  n 210 / 107  shared: 
(Location $e $x)
(Time $e $x)

;; Manner ~ Recipient  cosine 0.00  JSD 1.0  n 115 / 29  shared: 
(Manner $e $x)
(Recipient $e $x)

;; Manner ~ Source  cosine 0.00  JSD 1.0  n 115 / 47  shared: 
(Manner $e $x)
(Source $e $x)

;; Manner ~ Stimulus  cosine 0.00  JSD 1.0  n 115 / 34  shared: 
(Manner $e $x)
(Stimulus $e $x)

;; Manner ~ Theme  cosine 0.00  JSD 1.0  n 115 / 594  shared: 
(Manner $e $x)
(Theme $e $x)

;; Manner ~ To  cosine 0.00  JSD 1.0  n 115 / 46  shared: 
(Manner $e $x)
(To $e $x)

;; Recipient ~ Stimulus  cosine 0.00  JSD 1.0  n 29 / 34  shared: 
(Recipient $e $x)
(Stimulus $e $x)

;; Recipient ~ Time  cosine 0.00  JSD 1.0  n 29 / 107  shared: 
(Recipient $e $x)
(Time $e $x)

;; Recipient ~ To  cosine 0.00  JSD 1.0  n 29 / 46  shared: 
(Recipient $e $x)
(To $e $x)

;; Result ~ Stimulus  cosine 0.00  JSD 1.0  n 43 / 34  shared: 
(Result $e $x)
(Stimulus $e $x)

;; Result ~ Time  cosine 0.00  JSD 1.0  n 43 / 107  shared: 
(Result $e $x)
(Time $e $x)

;; Result ~ To  cosine 0.00  JSD 1.0  n 43 / 46  shared: 
(Result $e $x)
(To $e $x)

;; Source ~ Stimulus  cosine 0.00  JSD 1.0  n 47 / 34  shared: 
(Source $e $x)
(Stimulus $e $x)

;; Source ~ To  cosine 0.00  JSD 1.0  n 47 / 46  shared: 
(Source $e $x)
(To $e $x)

;; Stimulus ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Stimulus $e $x)
(Time $e $x)

;; Time ~ To  cosine 0.00  JSD 1.0  n 107 / 46  shared: 
(Time $e $x)
(To $e $x)

;; ==================== word @ cluster cos 1.00: slot pairs (2 event-center signals) ====================

;; [same role, different class]  accompany.Agent ~ appear.Agent  cosine 0.76  JSD 0.23  n 4 / 6  shared: {person} {sister}
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000050 tierC-000259
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; [different class and role]  die.Patient ~ sleep.Agent  cosine 0.99  JSD 0.006  n 4 / 3  shared: {family} {person}
;;   A e.g. tierB-000838 tierB-001967   B e.g. tierB-001302 tierC-000041
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 sleep) (Agent $e0 $x1))

;; ==================== word @ cluster cos 1.00: compared slots with their distributions (269 slots, n >= 3) ====================

;; ---- slot <unclassed>.LocatedIn  [entity center]  n 46  clusters 41
(LocatedIn $x0 $x1)
;;     c1706  mass 3  {here}
;;     c1563  mass 2  {garden}
;;     c2933  mass 2  {southern}
;;      c891  mass 2  {city}
;;      c896  mass 2  {class}
;;       c94  mass 2  {Derwent Isle}
;;     c1542  mass 1.5  {full}
;;     c1049  mass 1  {country}
;;      c107  mass 1  {El Harrach}
;;      c132  mass 1  {Gaul}
;;     c1449  mass 1  {film}
;;     c1473  mass 1  {floor}
;;      c159  mass 1  {Huancavelica}
;;      c165  mass 1  {India}
;;     c1759  mass 1  {house}
;;      c193  mass 1  {Japan}
;;     c2090  mass 1  {market}
;;     c2288  mass 1  {ocean}
;;     c2374  mass 1  {park}
;;     c2466  mass 1  {play}
;;      c248  mass 1  {Loglan}
;;      c249  mass 1  {Lojban}
;;     c2997  mass 1  {storeroom}
;;     c3006  mass 1  {street}
;;     c3065  mass 1  {table}
;;     c3187  mass 1  {tree}
;;      c321  mass 1  {Peru}
;;     c3271  mass 1  {village}
;;     c3295  mass 1  {wall}
;;     c3372  mass 1  {world}
;;      c350  mass 1  {Russian Far East}
;;      c378  mass 1  {Tatoeba}
;;      c397  mass 1  {UK}
;;        c6  mass 1  {Algiers}
;;      c833  mass 1  {ceiling}
;;       c95  mass 1  {Dianchi Lake}
;;     c1512  mass 0.5  {fountain}
;;     c1926  mass 0.5  {kitchen sink}
;;     c2451  mass 0.5  {place}
;;     c2652  mass 0.5  {red}
;;      c629  mass 0.5  {basket}

;; ---- slot have.Holder  [event center]  n 44  clusters 40
(And (Member $e0 have) (Holder $e0 $x1))
;;      c225  mass 4  {Kristoffer}
;;      c211  mass 2  {Karen}
;;     c3113  mass 2  {thing}
;;     c3161  mass 2  {town}
;;     c1073  mass 1  {creature}
;;     c1136  mass 1  {decision}
;;     c1432  mass 1  {february}
;;     c1487  mass 1  {food}
;;     c1567  mass 1  {gas station}
;;     c1735  mass 1  {homentropic current}
;;     c1736  mass 1  {homentropic flow}
;;     c1753  mass 1  {hotel}
;;     c1759  mass 1  {house}
;;     c1848  mass 1  {insurance}
;;     c1882  mass 1  {ivy}
;;     c1966  mass 1  {lawyer}
;;     c1998  mass 1  {library}
;;     c2194  mass 1  {movie}
;;     c2288  mass 1  {ocean}
;;     c2451  mass 1  {place}
;;     c2676  mass 1  {repeat}
;;     c2737  mass 1  {room}
;;      c281  mass 1  {Miroslav}
;;     c2815  mass 1  {sentence}
;;      c284  mass 1  {Morocco}
;;     c3160  mass 1  {tower}
;;     c3205  mass 1  {tuareg}
;;      c336  mass 1  {Rasputin}
;;     c3366  mass 1  {word processor}
;;     c3383  mass 1  {writer}
;;      c360  mass 1  {Scotland}
;;      c381  mass 1  {Thomas}
;;       c41  mass 1  {Boldi}
;;      c418  mass 1  {Wilson}
;;        c6  mass 1  {Algiers}
;;       c96  mass 1  {Diego}
;;     c2177  mass 0.5  {mosque}
;;     c2298  mass 0.5  {old}
;;     c3315  mass 0.5  {weather}
;;      c598  mass 0.5  {bad}

;; ---- slot have.Theme  [event center]  n 43  clusters 59
(And (Member $e0 have) (Theme $e0 $x1))
;;      c878  mass 4  {child}
;;     c2682  mass 2  {representation}
;;     c1123  mass 1  {day}
;;     c1307  mass 1  {effect}
;;     c1537  mass 1  {friend}
;;     c1565  mass 1  {gas pump}
;;     c1650  mass 1  {guard}
;;     c1704  mass 1  {herd}
;;     c1977  mass 1  {leaf}
;;     c2105  mass 1  {meaning}
;;     c2684  mass 1  {reputation}
;;     c2714  mass 1  {right}
;;     c3113  mass 1  {thing}
;;     c3123  mass 1  {thought}
;;     c3254  mass 1  {value}
;;      c520  mass 1  {antler}
;;      c649  mass 1  {beauty salon}
;;      c840  mass 1  {cemetery}
;;      c851  mass 1  {chance}
;;      c943  mass 1  {color}
;;     c1005  mass 0.667  {constant}
;;     c1349  mass 0.667  {entropy}
;;     c3228  mass 0.667  {uniform}
;;     c1098  mass 0.5  {curtain}
;;     c1140  mass 0.5  {deductible}
;;     c1259  mass 0.5  {dream}
;;     c1305  mass 0.5  {eerie}
;;     c1436  mass 0.5  {feeling}
;;     c1563  mass 0.5  {garden}
;;     c1710  mass 0.5  {high}
;;     c1723  mass 0.5  {history}
;;     c1734  mass 0.5  {homely}
;;     c1854  mass 0.5  {internal politics}
;;     c1860  mass 0.5  {intriguing}
;;     c2217  mass 0.5  {nasty}
;;     c2258  mass 0.5  {nice}
;;     c2371  mass 0.5  {parenthetic}
;;     c2422  mass 0.5  {personality}
;;     c2474  mass 0.5  {plot}
;;     c2528  mass 0.5  {predictable}
;;     c2592  mass 0.5  {purpose}
;;     c2710  mass 0.5  {rich}
;;     c2736  mass 0.5  {roof}
;;     c2881  mass 0.5  {single}
;;     c2927  mass 0.5  {soul piercing}
;;     c2975  mass 0.5  {stare}
;;     c3025  mass 0.5  {style}
;;     c3077  mass 0.5  {taste}
;;     c3323  mass 0.5  {weird}
;;      c563  mass 0.5  {atmosphere}
;;      c644  mass 0.5  {beautiful}
;;      c692  mass 0.5  {blue}
;;      c991  mass 0.5  {conical}
;;     c1243  mass 0.333  {document}
;;     c2820  mass 0.333  {serious}
;;     c3253  mass 0.333  {valuable}
;;     c3337  mass 0.333  {wide}
;;      c616  mass 0.333  {bank}
;;      c997  mass 0.333  {consequence}

;; ---- slot <unclassed>.Possession  [entity center]  n 30  clusters 23
(Possession $x0 $x1)
;;     c2419  mass 5  {person}
;;      c124  mass 4  {Free Soil Party}
;;      c339  mass 4  {Republican Party}
;;     c3026  mass 2  {subsequent game}
;;     c1049  mass 1  {country}
;;      c140  mass 1  {God}
;;     c1873  mass 1  {islamic ivory}
;;     c2043  mass 1  {logical phrase}
;;     c2044  mass 1  {logical proposition}
;;      c208  mass 1  {Jupiter}
;;     c2617  mass 1  {radical group}
;;     c3040  mass 1  {sunni community}
;;     c3113  mass 1  {thing}
;;     c3229  mass 1  {union}
;;      c394  mass 1  {Twilight}
;;      c426  mass 1  {Yunnan}
;;       c99  mass 1  {Dora Smith}
;;     c1295  mass 0.5  {easy}
;;     c1573  mass 0.5  {generalization}
;;     c2236  mass 0.25  {neighbouring}
;;     c2324  mass 0.25  {other}
;;     c3038  mass 0.25  {sunni}
;;      c964  mass 0.25  {community}

;; ---- slot use.Theme  [event center]  n 23  clusters 23
(And (Member $e0 use) (Theme $e0 $x1))
;;     c3313  mass 2  {weak arens space topology}
;;      c613  mass 2  {banach mackey topology}
;;     c1093  mass 1  {current}
;;     c1457  mass 1  {fire}
;;      c163  mass 1  {Iga}
;;     c1890  mass 1  {jingle}
;;     c2061  mass 1  {machine}
;;     c2138  mass 1  {metaphor}
;;      c234  mass 1  {Laravel}
;;     c2368  mass 1  {paramilitary group}
;;     c2428  mass 1  {phrase}
;;     c2579  mass 1  {public fund}
;;     c2737  mass 1  {room}
;;      c278  mass 1  {Midway}
;;     c2815  mass 1  {sentence}
;;     c3033  mass 1  {sugar}
;;     c3365  mass 1  {word}
;;      c584  mass 1  {auto tune}
;;      c869  mass 1  {chemical agent}
;;     c1170  mass 0.5  {designation convention}
;;     c2215  mass 0.5  {naming convention}
;;     c3258  mass 0.5  {various}
;;      c779  mass 0.5  {calendar}

;; ---- slot make.Patient  [event center]  n 20  clusters 25
(And (Member $e0 make) (Patient $e0 $x1))
;;     c1193  mass 1.5  {difference}
;;        c1  mass 1  {Afghanistan}
;;     c1028  mass 1  {cope}
;;     c1092  mass 1  {cup}
;;     c1396  mass 1  {eye contact}
;;      c173  mass 1  {Isabella}
;;     c2357  mass 1  {paper}
;;       c24  mass 1  {Augustus}
;;     c2588  mass 1  {purchase}
;;     c3090  mass 1  {telephone call}
;;     c3182  mass 1  {travel}
;;      c669  mass 1  {big}
;;      c876  mass 1  {chicken fried steak}
;;      c893  mass 1  {claim}
;;     c1711  mass 0.5  {high pitched}
;;     c1759  mass 0.5  {house}
;;     c2100  mass 0.5  {matter}
;;     c2267  mass 0.5  {noise}
;;     c2737  mass 0.5  {room}
;;     c2904  mass 0.5  {snowman}
;;     c2929  mass 0.5  {sound}
;;      c598  mass 0.5  {bad}
;;      c644  mass 0.5  {beautiful}
;;      c906  mass 0.5  {clicking}
;;      c955  mass 0.5  {comfortable}

;; ---- slot build.Patient  [event center]  n 18  clusters 12
(And (Member $e0 build) (Patient $e0 $x1))
;;     c1753  mass 4  {hotel}
;;     c2737  mass 3  {room}
;;     c1743  mass 2  {horn}
;;     c2360  mass 2  {paper factory}
;;     c2361  mass 2  {paper mill}
;;     c3113  mass 2  {thing}
;;     c2241  mass 0.5  {network}
;;     c2243  mass 0.5  {new}
;;     c2321  mass 0.5  {original}
;;     c2468  mass 0.5  {playground}
;;     c3209  mass 0.5  {turing machine}
;;     c3327  mass 0.5  {well}

;; ---- slot make.Agent  [event center]  n 18  clusters 19
(And (Member $e0 make) (Agent $e0 $x1))
;;      c109  mass 1  {Elias}
;;     c1098  mass 1  {curtain}
;;     c1100  mass 1  {customer}
;;     c1201  mass 1  {diner}
;;      c145  mass 1  {Hanako}
;;      c185  mass 1  {James}
;;     c2077  mass 1  {man}
;;       c24  mass 1  {Augustus}
;;      c252  mass 1  {Lorenzo}
;;     c2521  mass 1  {practical utility}
;;     c3113  mass 1  {thing}
;;      c377  mass 1  {Taliban}
;;      c551  mass 1  {artistic beauty}
;;      c715  mass 1  {boy}
;;      c820  mass 1  {cat}
;;       c88  mass 1  {Damiano}
;;       c91  mass 1  {David}
;;     c1656  mass 0.5  {gusty}
;;     c3343  mass 0.5  {wind}

;; ---- slot go.Agent  [event center]  n 15  clusters 14
(And (Member $e0 go) (Agent $e0 $x1))
;;      c215  mass 2  {Katherine}
;;      c120  mass 1  {Flavio}
;;      c209  mass 1  {Kalman}
;;      c247  mass 1  {Linda}
;;     c2586  mass 1  {pupil}
;;      c265  mass 1  {Mariko}
;;      c271  mass 1  {Matthew}
;;      c276  mass 1  {Mennad}
;;      c283  mass 1  {Mom}
;;      c309  mass 1  {Olivia}
;;      c820  mass 1  {cat}
;;      c878  mass 1  {child}
;;       c90  mass 1  {Daniel}
;;       c98  mass 1  {Donald}

;; ---- slot play.Agent  [event center]  n 15  clusters 10
(And (Member $e0 play) (Agent $e0 $x1))
;;      c878  mass 4  {child}
;;       c46  mass 2  {Boston Red Sox}
;;       c74  mass 2  {Cincinnati Reds}
;;       c22  mass 1  {Audrey Hepburn}
;;       c23  mass 1  {Audrey Heppurn}
;;     c2670  mass 1  {religion}
;;      c390  mass 1  {Tony}
;;      c425  mass 1  {Yumi}
;;      c677  mass 1  {biology}
;;      c715  mass 1  {boy}

;; ---- slot build.Agent  [event center]  n 14  clusters 5
(And (Member $e0 build) (Agent $e0 $x1))
;;      c965  mass 8  {company}
;;     c2419  mass 2  {person}
;;      c305  mass 2  {O. R. Woodcock}
;;     c2196  mass 1  {mozabite}
;;      c964  mass 1  {community}

;; ---- slot find.Location  [event center]  n 14  clusters 10
(And (Member $e0 find) (Location $e0 $x1))
;;     c2933  mass 2  {southern}
;;     c3192  mass 2  {tributary}
;;      c426  mass 2  {Yunnan}
;;      c658  mass 2  {bench}
;;      c231  mass 1  {Lake Dianchi}
;;     c2979  mass 1  {station}
;;     c3148  mass 1  {tomb}
;;     c3329  mass 1  {western}
;;      c351  mass 1  {Sahara Desert}
;;      c414  mass 1  {Western Europe}

;; ---- slot <unclassed>.SubsetOf  [entity center]  n 13  clusters 12
(SubsetOf $x0 $x1)
;;     c2419  mass 2  {person}
;;     c1033  mass 1  {corner}
;;     c1585  mass 1  {girl}
;;     c2102  mass 1  {mayan book}
;;     c2454  mass 1  {plane}
;;     c2586  mass 1  {pupil}
;;     c2658  mass 1  {refugee}
;;     c2853  mass 1  {shop}
;;     c3272  mass 1  {villager}
;;     c3344  mass 1  {window}
;;      c842  mass 1  {centipede}
;;      c874  mass 1  {chick}

;; ---- slot start.Theme  [event center]  n 13  clusters 14
(And (Member $e0 start) (Theme $e0 $x1))
;;     c1088  mass 1  {cry}
;;     c1211  mass 1  {disappear}
;;     c1696  mass 1  {hear}
;;     c1714  mass 1  {high school}
;;     c1808  mass 1  {improve}
;;     c2733  mass 1  {roll}
;;     c2754  mass 1  {run out}
;;     c2865  mass 1  {show}
;;     c3073  mass 1  {talk}
;;     c3286  mass 1  {vomit}
;;      c528  mass 1  {appear}
;;      c858  mass 1  {chant}
;;     c1434  mass 0.5  {feel}
;;     c2009  mass 0.5  {light headed}

;; ---- slot go.Goal  [event center]  n 12  clusters 9
(And (Member $e0 go) (Goal $e0 $x1))
;;      c652  mass 4  {bed}
;;     c1748  mass 1  {hospital}
;;     c2451  mass 1  {place}
;;      c251  mass 1  {Loren}
;;     c2788  mass 1  {school}
;;     c3043  mass 1  {supermarket}
;;     c3310  mass 1  {way}
;;      c474  mass 1  {aesthetic salon}
;;      c633  mass 1  {bathroom}

;; ---- slot study.Agent  [event center]  n 12  clusters 9
(And (Member $e0 study) (Agent $e0 $x1))
;;     c2419  mass 3  {person}
;;     c2791  mass 2  {scientist}
;;      c118  mass 1  {Fadil}
;;     c1499  mass 1  {forensics researcher}
;;      c300  mass 1  {Nicolaus Copernicus}
;;      c322  mass 1  {Peter}
;;       c33  mass 1  {Beth}
;;      c427  mass 1  {Yuri}
;;       c64  mass 1  {Carlos}

;; ---- slot <unclassed>.PartOf  [entity center]  n 11  clusters 11
(PartOf $x0 $x1)
;;      c224  mass 2  {Khurda Road}
;;     c1873  mass 1  {islamic ivory}
;;     c1882  mass 1  {ivy}
;;     c2457  mass 1  {plant}
;;     c2466  mass 1  {play}
;;     c3017  mass 1  {student association}
;;      c426  mass 1  {Yunnan}
;;      c509  mass 1  {animal}
;;      c778  mass 1  {cake}
;;     c2721  mass 0.5  {road}
;;     c3006  mass 0.5  {street}

;; ---- slot become.Patient  [event center]  n 11  clusters 16
(And (Member $e0 become) (Patient $e0 $x1))
;;     c1821  mass 1  {indigenous}
;;      c228  mass 1  {Lady Ashton}
;;     c2419  mass 1  {person}
;;     c2666  mass 1  {relationship}
;;     c3113  mass 1  {thing}
;;      c598  mass 1  {bad}
;;     c1212  mass 0.5  {discipline}
;;     c1288  mass 0.5  {earth}
;;     c1837  mass 0.5  {inomaru}
;;     c1849  mass 0.5  {intense}
;;     c1967  mass 0.5  {lax}
;;     c2267  mass 0.5  {noise}
;;     c2410  mass 0.5  {people}
;;     c2652  mass 0.5  {red}
;;     c2706  mass 0.5  {revolutionary}
;;      c999  mass 0.5  {conservative}

;; ---- slot begin.Agent  [event center]  n 11  clusters 10
(And (Member $e0 begin) (Agent $e0 $x1))
;;     c1358  mass 2  {european american settler}
;;     c1084  mass 1  {crowd}
;;     c1822  mass 1  {indigenous american}
;;      c199  mass 1  {Jessica}
;;     c1990  mass 1  {legionnaire}
;;     c2222  mass 1  {native american}
;;     c2640  mass 1  {rebel}
;;      c266  mass 1  {Mark}
;;      c416  mass 1  {William}
;;       c91  mass 1  {David}

;; ---- slot begin.Theme  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Theme $e0 $x1))
;;     c1072  mass 4  {create}
;;     c1229  mass 1  {distribute}
;;     c1672  mass 1  {hang out}
;;     c2074  mass 1  {make}
;;     c3155  mass 1  {torture}
;;      c531  mass 1  {applaud}
;;      c740  mass 1  {bud}
;;      c987  mass 1  {confess}

;; ---- slot build.Location  [event center]  n 11  clusters 4
(And (Member $e0 build) (Location $e0 $x1))
;;      c218  mass 4  {Kazakhstan}
;;      c113  mass 3  {Eskisehir}
;;      c393  mass 3  {Turkey}
;;      c136  mass 1  {Ghardaia}

;; ---- slot kill.Patient  [event center]  n 11  clusters 5
(And (Member $e0 kill) (Patient $e0 $x1))
;;     c2419  mass 6  {person}
;;     c2918  mass 2  {soldier}
;;     c1514  mass 1  {fox}
;;     c1570  mass 1  {gazelle}
;;     c3396  mass 1  {zombie}

;; ---- slot produce.Patient  [event center]  n 11  clusters 11
(And (Member $e0 produce) (Patient $e0 $x1))
;;     c2194  mass 4  {movie}
;;      c488  mass 2  {album}
;;     c1847  mass 1  {insulin}
;;     c1449  mass 0.833  {film}
;;     c3063  mass 0.833  {syrian film}
;;     c2133  mass 0.5  {mesmerizing}
;;     c2841  mass 0.5  {sheen}
;;     c1104  mass 0.333  {cyanide}
;;     c1176  mass 0.333  {destined}
;;     c1682  mass 0.333  {harmless}
;;     c3165  mass 0.333  {trace}

;; ---- slot start.Patient  [event center]  n 11  clusters 14
(And (Member $e0 start) (Patient $e0 $x1))
;;     c1062  mass 1  {crack}
;;     c1245  mass 1  {dog feed}
;;     c1929  mass 1  {knock}
;;     c2220  mass 1  {national fibre optic network project}
;;      c280  mass 1  {Milky Way}
;;     c3113  mass 1  {thing}
;;     c3199  mass 1  {truck}
;;     c3306  mass 1  {watermelon season}
;;      c981  mass 1  {concert}
;;     c1519  mass 0.5  {freedom movement}
;;     c1655  mass 0.5  {gusher}
;;     c2479  mass 0.333  {pocket}
;;     c2890  mass 0.333  {sky}
;;      c692  mass 0.333  {blue}

;; ---- slot find.Theme  [event center]  n 10  clusters 6
(And (Member $e0 find) (Theme $e0 $x1))
;;     c3113  mass 4  {thing}
;;       c81  mass 2  {Couper}
;;     c2139  mass 1  {meteorite}
;;     c2362  mass 1  {paper sheet}
;;      c325  mass 1  {Pietro}
;;      c898  mass 1  {clay figurine}

;; ---- slot leave.Agent  [event center]  n 10  clusters 10
(And (Member $e0 leave) (Agent $e0 $x1))
;;      c179  mass 1  {Ivan}
;;     c2419  mass 1  {person}
;;     c2454  mass 1  {plane}
;;      c261  mass 1  {Marcus}
;;     c2850  mass 1  {ship}
;;      c346  mass 1  {Rodrigo}
;;      c387  mass 1  {Tom}
;;       c50  mass 1  {Brian}
;;      c754  mass 1  {bus}
;;      c801  mass 1  {car}

;; ---- slot serve.Agent  [event center]  n 10  clusters 9
(And (Member $e0 serve) (Agent $e0 $x1))
;;      c167  mass 2  {Indooroopilly}
;;     c2419  mass 1.5  {person}
;;     c1632  mass 1  {grandmother}
;;      c169  mass 1  {Ipswich}
;;      c170  mass 1  {Ipswich & Rosewood}
;;      c192  mass 1  {Janos}
;;      c348  mass 1  {Rosewood}
;;      c424  mass 1  {Yitzhak}
;;     c2538  mass 0.5  {president}

;; ---- slot take.Theme  [event center]  n 10  clusters 11
(And (Member $e0 take) (Theme $e0 $x1))
;;     c1790  mass 2  {identity}
;;     c2291  mass 1  {office}
;;     c2500  mass 1  {portrait}
;;     c2518  mass 1  {power}
;;     c2735  mass 1  {roller}
;;     c3113  mass 1  {thing}
;;     c3333  mass 1  {while}
;;     c1256  mass 0.5  {drastic}
;;     c2048  mass 0.5  {look}
;;     c2108  mass 0.5  {measure}
;;      c911  mass 0.5  {close}

;; ---- slot try.Agent  [event center]  n 10  clusters 11
(And (Member $e0 try) (Agent $e0 $x1))
;;     c1078  mass 1  {crocodile}
;;      c119  mass 1  {Felix}
;;      c266  mass 1  {Mark}
;;      c358  mass 1  {Santiago}
;;       c39  mass 1  {Bob}
;;      c493  mass 1  {alien}
;;       c76  mass 1  {Claudio}
;;       c91  mass 1  {David}
;;      c965  mass 1  {company}
;;     c2077  mass 0.5  {man}
;;     c3394  mass 0.5  {young}

;; ---- slot write.Patient  [event center]  n 10  clusters 8
(And (Member $e0 write) (Patient $e0 $x1))
;;     c1351  mass 2  {episode}
;;     c2923  mass 2  {song}
;;     c1997  mass 1  {letter}
;;     c2795  mass 1  {screenplay}
;;     c2797  mass 1  {script}
;;     c2815  mass 1  {sentence}
;;      c703  mass 1  {book}
;;      c860  mass 1  {character}

;; ---- slot fall.Patient  [event center]  n 9  clusters 12
(And (Member $e0 fall) (Patient $e0 $x1))
;;     c1780  mass 1  {hush of anticipation}
;;     c1786  mass 1  {ice pellet}
;;     c2586  mass 1  {pupil}
;;     c2778  mass 1  {scaffolding}
;;     c2903  mass 1  {snow}
;;      c703  mass 1  {book}
;;      c874  mass 1  {chick}
;;     c1501  mass 0.5  {forest}
;;     c2876  mass 0.5  {silent}
;;     c1127  mass 0.333  {dead}
;;     c2743  mass 0.333  {rotten}
;;     c3187  mass 0.333  {tree}

;; ---- slot follow.Agent  [event center]  n 9  clusters 10
(And (Member $e0 follow) (Agent $e0 $x1))
;;      c666  mass 2  {bhadala}
;;     c2209  mass 1  {muslim house}
;;       c26  mass 1  {Bailey}
;;     c2721  mass 1  {road}
;;      c354  mass 1  {Sami}
;;        c4  mass 1  {Alexander}
;;     c1068  mass 0.5  {crawling}
;;     c1759  mass 0.5  {house}
;;     c2207  mass 0.5  {muslim}
;;      c642  mass 0.5  {beast}

;; ---- slot follow.Theme  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Theme $e0 $x1))
;;     c2661  mass 2  {region}
;;     c3167  mass 2  {tradition}
;;      c149  mass 1  {Henry Cole}
;;      c236  mass 1  {Layla}
;;      c254  mass 1  {Lukas}
;;      c262  mass 1  {Margaret Fleming}
;;     c2860  mass 1  {shoreline}

;; ---- slot hear.Stimulus  [event center]  n 9  clusters 12
(And (Member $e0 hear) (Stimulus $e0 $x1))
;;     c1066  mass 1  {crash}
;;     c1929  mass 1  {knock}
;;     c2863  mass 1  {shot}
;;     c2976  mass 1  {start}
;;     c3113  mass 1  {thing}
;;      c615  mass 1  {bang}
;;     c2267  mass 0.833  {noise}
;;     c2203  mass 0.5  {music}
;;     c3133  mass 0.5  {ticking}
;;     c3239  mass 0.5  {upbeat}
;;     c1648  mass 0.333  {growling}
;;      c621  mass 0.333  {barking}

;; ---- slot kill.Agent  [event center]  n 9  clusters 6
(And (Member $e0 kill) (Agent $e0 $x1))
;;     c1778  mass 4  {hurricane}
;;     c1457  mass 1  {fire}
;;     c1776  mass 1  {hunter}
;;      c179  mass 1  {Ivan}
;;     c2018  mass 1  {lion}
;;      c793  mass 1  {cancer}

;; ---- slot sing.Agent  [event center]  n 9  clusters 8
(And (Member $e0 sing) (Agent $e0 $x1))
;;     c2419  mass 2  {person}
;;     c2883  mass 2  {sister}
;;      c458  mass 1  {actress}
;;      c678  mass 1  {bird}
;;        c9  mass 1  {Amateur Barbershop Harmony Society}
;;       c91  mass 1  {David}
;;     c1644  mass 0.5  {group}
;;     c2558  mass 0.5  {professional}

;; ---- slot take.Agent  [event center]  n 9  clusters 8
(And (Member $e0 take) (Agent $e0 $x1))
;;     c2419  mass 2  {person}
;;     c1022  mass 1  {cook}
;;      c144  mass 1  {Gustavo}
;;      c197  mass 1  {Jerry Rawlings}
;;      c229  mass 1  {Lajos}
;;     c2538  mass 1  {president}
;;      c277  mass 1  {Michael}
;;     c3113  mass 1  {thing}

;; ---- slot become.Result  [event center]  n 8  clusters 7
(And (Member $e0 become) (Result $e0 $x1))
;;      c598  mass 2  {bad}
;;     c1821  mass 1  {indigenous}
;;     c1837  mass 1  {inomaru}
;;     c1967  mass 1  {lax}
;;     c2652  mass 1  {red}
;;      c487  mass 1  {alarmed}
;;      c999  mass 1  {conservative}

;; ---- slot change.Patient  [event center]  n 8  clusters 7
(And (Member $e0 change) (Patient $e0 $x1))
;;     c3315  mass 2  {weather}
;;     c1052  mass 1  {course}
;;     c2148  mass 1  {mind}
;;     c2214  mass 1  {name}
;;     c2622  mass 1  {rain}
;;     c3113  mass 1  {thing}
;;      c943  mass 1  {color}

;; ---- slot hear.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 hear) (Experiencer $e0 $x1))
;;       c54  mass 2  {Bruno}
;;      c118  mass 1  {Fadil}
;;      c120  mass 1  {Flavio}
;;      c185  mass 1  {James}
;;      c204  mass 1  {Jonas}
;;      c308  mass 1  {Oleg}
;;       c88  mass 1  {Damiano}

;; ---- slot live.Agent  [event center]  n 8  clusters 8
(And (Member $e0 live) (Agent $e0 $x1))
;;      c109  mass 1  {Elias}
;;      c269  mass 1  {Mary}
;;       c31  mass 1  {Beja}
;;     c3356  mass 1  {wolf}
;;      c337  mass 1  {Ray Kurtzweil}
;;      c384  mass 1  {Tiziri}
;;      c423  mass 1  {Yidir}
;;       c58  mass 1  {Cainan}

;; ---- slot live.Location  [event center]  n 8  clusters 8
(And (Member $e0 live) (Location $e0 $x1))
;;      c304  mass 2  {Norway}
;;     c1759  mass 1.5  {house}
;;     c1644  mass 1  {group}
;;     c2932  mass 1  {southeastern corner}
;;     c3027  mass 1  {suburb}
;;     c1875  mass 0.5  {isolated}
;;     c1950  mass 0.5  {large}
;;      c955  mass 0.5  {comfortable}

;; ---- slot need.Experiencer  [event center]  n 8  clusters 8
(And (Member $e0 need) (Experiencer $e0 $x1))
;;     c1241  mass 1  {doctor}
;;     c1568  mass 1  {gate}
;;      c213  mass 1  {Karl}
;;      c268  mass 1  {Martino}
;;     c2775  mass 1  {sauce}
;;      c422  mass 1  {Yanni}
;;        c5  mass 1  {Algeria}
;;      c878  mass 1  {child}

;; ---- slot open.Patient  [event center]  n 8  clusters 4
(And (Member $e0 open) (Patient $e0 $x1))
;;     c1248  mass 4.5  {door}
;;     c1962  mass 2  {law}
;;      c616  mass 1  {bank}
;;     c3260  mass 0.5  {vault like}

;; ---- slot play.Theme  [event center]  n 8  clusters 7
(And (Member $e0 play) (Theme $e0 $x1))
;;      c155  mass 2  {Holly Golightly}
;;     c3095  mass 2  {tennis}
;;     c1683  mass 1  {harp}
;;     c2732  mass 1  {role}
;;     c2819  mass 1  {series}
;;     c1086  mass 0.5  {crucial}
;;     c1805  mass 0.5  {important}

;; ---- slot produce.Agent  [event center]  n 8  clusters 7
(And (Member $e0 produce) (Agent $e0 $x1))
;;      c147  mass 2  {Harvey Hayutin}
;;      c376  mass 2  {Sy Weintraub}
;;       c77  mass 2  {Colin Richardson}
;;     c2356  mass 1  {pancreas}
;;     c1970  mass 0.333  {layer}
;;     c2295  mass 0.333  {oil}
;;     c3112  mass 0.333  {thin}

;; ---- slot speak.Agent  [event center]  n 8  clusters 6
(And (Member $e0 speak) (Agent $e0 $x1))
;;      c306  mass 2  {Oates}
;;      c367  mass 2  {Sophia}
;;     c2077  mass 1  {man}
;;      c212  mass 1  {Kari Wahlgren}
;;      c279  mass 1  {Mie Sonozaki}
;;      c420  mass 1  {Xavier}

;; ---- slot talk.Agent  [event center]  n 8  clusters 7
(And (Member $e0 talk) (Agent $e0 $x1))
;;      c215  mass 2  {Katherine}
;;     c1537  mass 1  {friend}
;;      c206  mass 1  {Jordan Peterson}
;;     c2279  mass 1  {novelist}
;;      c247  mass 1  {Linda}
;;     c2789  mass 1  {school janitor}
;;       c90  mass 1  {Daniel}

;; ---- slot use.Agent  [event center]  n 8  clusters 7
(And (Member $e0 use) (Agent $e0 $x1))
;;     c2034  mass 2  {localized version}
;;     c1772  mass 1  {human brain}
;;     c2880  mass 1  {singer}
;;     c3218  mass 1  {ukrainian army}
;;      c491  mass 1  {algerian government}
;;       c73  mass 1  {Churchill}
;;       c87  mass 1  {Dad}

;; ---- slot walk.Agent  [event center]  n 8  clusters 8
(And (Member $e0 walk) (Agent $e0 $x1))
;;        c0  mass 1  {Adriano}
;;     c1100  mass 1  {customer}
;;      c119  mass 1  {Felix}
;;      c145  mass 1  {Hanako}
;;      c237  mass 1  {Leon}
;;      c277  mass 1  {Michael}
;;     c2789  mass 1  {school janitor}
;;      c517  mass 1  {ant}

;; ---- slot want.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 want) (Experiencer $e0 $x1))
;;       c20  mass 2  {Aslan}
;;      c105  mass 1  {Edmundo}
;;      c237  mass 1  {Leon}
;;      c319  mass 1  {Pepper}
;;       c32  mass 1  {Benedito}
;;      c390  mass 1  {Tony}
;;      c820  mass 1  {cat}

;; ---- slot work.Agent  [event center]  n 8  clusters 9
(And (Member $e0 work) (Agent $e0 $x1))
;;       c21  mass 1  {Asserson}
;;     c2419  mass 1  {person}
;;      c286  mass 1  {Mr. Jones}
;;     c3284  mass 1  {volunteer}
;;       c87  mass 1  {Dad}
;;       c89  mass 1  {Dan}
;;       c97  mass 1  {Dmitri}
;;     c2298  mass 0.5  {old}
;;      c461  mass 0.5  {adaptor}

;; ---- slot write.Agent  [event center]  n 8  clusters 6
(And (Member $e0 write) (Agent $e0 $x1))
;;     c2419  mass 2.5  {person}
;;      c137  mass 2  {Gilles Thibaut}
;;       c37  mass 2  {Bill Wrubel}
;;     c1420  mass 0.5  {famous}
;;     c1430  mass 0.5  {father}
;;      c762  mass 0.5  {busy}

;; ---- slot come.Agent  [event center]  n 7  clusters 7
(And (Member $e0 come) (Agent $e0 $x1))
;;     c1049  mass 1  {country}
;;     c1216  mass 1  {discussion}
;;     c2077  mass 1  {man}
;;     c2892  mass 1  {sleep}
;;     c3016  mass 1  {student}
;;     c3174  mass 1  {train}
;;      c754  mass 1  {bus}

;; ---- slot contain.Agent  [event center]  n 7  clusters 6
(And (Member $e0 contain) (Agent $e0 $x1))
;;     c1137  mass 1.5  {deck}
;;      c807  mass 1.5  {card}
;;     c2460  mass 1  {plasma}
;;     c2923  mass 1  {song}
;;     c3281  mass 1  {vitamin pill}
;;      c872  mass 1  {chest}

;; ---- slot contain.Theme  [event center]  n 7  clusters 9
(And (Member $e0 contain) (Theme $e0 $x1))
;;     c1316  mass 1  {electrolyte}
;;     c1615  mass 1  {gold coin}
;;     c1883  mass 1  {jack}
;;     c1921  mass 1  {king}
;;     c2609  mass 1  {queen}
;;     c1147  mass 0.5  {degrading}
;;     c2059  mass 0.5  {lyric}
;;     c2282  mass 0.5  {nutrition}
;;      c438  mass 0.5  {abundant}

;; ---- slot create.Patient  [event center]  n 7  clusters 6
(And (Member $e0 create) (Patient $e0 $x1))
;;      c964  mass 4  {community}
;;     c2378  mass 1  {particle accelerator}
;;     c1946  mass 0.5  {language}
;;     c2243  mass 0.5  {new}
;;     c3258  mass 0.5  {various}
;;      c779  mass 0.5  {calendar}

;; ---- slot form.Agent  [event center]  n 7  clusters 6
(And (Member $e0 form) (Agent $e0 $x1))
;;      c203  mass 2  {Jon Bon Jovi}
;;      c353  mass 2  {Sambora}
;;     c1933  mass 1  {labourer}
;;     c3088  mass 1  {technetium}
;;     c2878  mass 0.5  {simple}
;;      c974  mass 0.5  {complex}

;; ---- slot get.Patient  [event center]  n 7  clusters 12
(And (Member $e0 get) (Patient $e0 $x1))
;;      c171  mass 1  {Iran}
;;      c598  mass 1  {bad}
;;     c1123  mass 0.5  {day}
;;     c1373  mass 0.5  {excuse}
;;     c1384  mass 0.5  {expensive}
;;     c1457  mass 0.5  {fire}
;;     c2550  mass 0.5  {problem}
;;     c2861  mass 0.5  {short}
;;     c3113  mass 0.5  {thing}
;;     c3315  mass 0.5  {weather}
;;      c669  mass 0.5  {big}
;;      c863  mass 0.5  {cheap}

;; ---- slot make.Result  [event center]  n 7  clusters 8
(And (Member $e0 make) (Result $e0 $x1))
;;     c1690  mass 1  {hazardous}
;;     c1921  mass 1  {king}
;;     c3222  mass 1  {uncomfortable}
;;     c3335  mass 1  {white}
;;      c598  mass 1  {bad}
;;      c644  mass 1  {beautiful}
;;     c1049  mass 0.5  {country}
;;      c593  mass 0.5  {backward}

;; ---- slot sell.Theme  [event center]  n 7  clusters 8
(And (Member $e0 sell) (Theme $e0 $x1))
;;     c1784  mass 2  {ice cream}
;;     c1031  mass 1  {copy}
;;     c2146  mass 1  {milk}
;;     c3113  mass 1  {thing}
;;     c2243  mass 0.5  {new}
;;     c2726  mass 0.5  {roasted}
;;      c638  mass 0.5  {bean}
;;      c837  mass 0.5  {cell phone}

;; ---- slot serve.Theme  [event center]  n 7  clusters 4
(And (Member $e0 serve) (Theme $e0 $x1))
;;      c370  mass 3  {Springfield Station}
;;      c369  mass 2  {Springfield}
;;     c2704  mass 1  {revenge}
;;      c929  mass 1  {coffee}

;; ---- slot try.Theme  [event center]  n 7  clusters 7
(And (Member $e0 try) (Theme $e0 $x1))
;;     c1590  mass 1  {give up}
;;     c2582  mass 1  {pull}
;;     c2631  mass 1  {reach}
;;     c2983  mass 1  {steal}
;;      c440  mass 1  {abuse}
;;      c751  mass 1  {burnish}
;;      c782  mass 1  {call}

;; ---- slot turn.Patient  [event center]  n 7  clusters 11
(And (Member $e0 turn) (Patient $e0 $x1))
;;      c144  mass 1  {Gustavo}
;;     c2721  mass 1  {road}
;;     c2760  mass 1  {russian speech}
;;     c3297  mass 1  {war}
;;     c1519  mass 0.5  {freedom movement}
;;     c1655  mass 0.5  {gusher}
;;      c683  mass 0.5  {black}
;;      c833  mass 0.5  {ceiling}
;;     c1977  mass 0.333  {leaf}
;;     c2652  mass 0.333  {red}
;;     c3389  mass 0.333  {yellow}

;; ---- slot win.Agent  [event center]  n 7  clusters 5
(And (Member $e0 win) (Agent $e0 $x1))
;;      c187  mass 2  {James Woods}
;;      c418  mass 2  {Wilson}
;;     c1745  mass 1  {horse}
;;     c3341  mass 1  {wilson}
;;      c589  mass 1  {away team}

;; ---- slot <unclassed>.Only  [entity center]  n 6  clusters 4
(Only $x0 $x1)
;;     c1455  mass 2  {find}
;;     c1688  mass 2  {have}
;;     c2013  mass 1  {like}
;;     c2921  mass 1  {solve}

;; ---- slot appear.Agent  [event center]  n 6  clusters 3
(And (Member $e0 appear) (Agent $e0 $x1))
;;     c2419  mass 3  {person}
;;       c51  mass 2  {Brian Packham}
;;     c2883  mass 1  {sister}

;; ---- slot bear.Patient  [event center]  n 6  clusters 5
(And (Member $e0 bear) (Patient $e0 $x1))
;;     c2419  mass 3  {person}
;;      c385  mass 1  {Tobias}
;;      c395  mass 1  {Tycho Brahe}
;;     c2077  mass 0.5  {man}
;;     c2492  mass 0.5  {poor}

;; ---- slot build.Instrument  [event center]  n 6  clusters 5
(And (Member $e0 build) (Instrument $e0 $x1))
;;     c1703  mass 2  {help}
;;      c625  mass 2  {barometer}
;;     c2536  mass 1  {presented in scale}
;;     c2535  mass 0.5  {presented}
;;     c2779  mass 0.5  {scale}

;; ---- slot capture.Theme  [event center]  n 6  clusters 6
(And (Member $e0 capture) (Theme $e0 $x1))
;;     c2064  mass 1  {magpie}
;;     c2131  mass 1  {merchant ship}
;;      c402  mass 1  {Valerian}
;;      c490  mass 1  {algerian city}
;;      c733  mass 1  {british ship}
;;      c798  mass 1  {capital}

;; ---- slot cause.Agent  [event center]  n 6  clusters 6
(And (Member $e0 cause) (Agent $e0 $x1))
;;     c1156  mass 1  {demon}
;;     c2250  mass 1  {news}
;;     c2999  mass 1  {storm}
;;     c3113  mass 1  {thing}
;;     c3134  mass 1  {tide}
;;     c3294  mass 1  {walk}

;; ---- slot create.Agent  [event center]  n 6  clusters 5
(And (Member $e0 create) (Agent $e0 $x1))
;;     c1358  mass 2  {european american settler}
;;     c1822  mass 1  {indigenous american}
;;     c2222  mass 1  {native american}
;;      c315  mass 1  {Paul}
;;     c3383  mass 1  {writer}

;; ---- slot enter.Agent  [event center]  n 6  clusters 5
(And (Member $e0 enter) (Agent $e0 $x1))
;;      c232  mass 2  {Lake Sammamish}
;;     c2207  mass 1  {muslim}
;;      c236  mass 1  {Layla}
;;     c2419  mass 1  {person}
;;      c268  mass 1  {Martino}

;; ---- slot form.Patient  [event center]  n 6  clusters 7
(And (Member $e0 form) (Patient $e0 $x1))
;;     c2067  mass 2  {main songwriting unit}
;;     c1771  mass 1  {human barricade}
;;     c3088  mass 1  {technetium}
;;     c2065  mass 0.5  {main}
;;     c2878  mass 0.5  {simple}
;;     c2924  mass 0.5  {songwriting unit}
;;      c974  mass 0.5  {complex}

;; ---- slot fund.Agent  [event center]  n 6  clusters 3
(And (Member $e0 fund) (Agent $e0 $x1))
;;      c183  mass 3  {JICA}
;;     c1627  mass 2  {government}
;;      c142  mass 1  {Government of Uganda}

;; ---- slot get.Agent  [event center]  n 6  clusters 7
(And (Member $e0 get) (Agent $e0 $x1))
;;      c130  mass 1  {Gabriel}
;;      c192  mass 1  {Janos}
;;      c238  mass 1  {Leonid}
;;     c3113  mass 1  {thing}
;;       c96  mass 1  {Diego}
;;     c2077  mass 0.5  {man}
;;     c3394  mass 0.5  {young}

;; ---- slot get.Result  [event center]  n 6  clusters 6
(And (Member $e0 get) (Result $e0 $x1))
;;     c1384  mass 1  {expensive}
;;     c2520  mass 1  {powerful}
;;     c2634  mass 1  {ready}
;;     c2861  mass 1  {short}
;;      c598  mass 1  {bad}
;;      c863  mass 1  {cheap}

;; ---- slot help.Agent  [event center]  n 6  clusters 6
(And (Member $e0 help) (Agent $e0 $x1))
;;     c1014  mass 1  {context}
;;     c1754  mass 1  {hothouse condition}
;;     c2004  mass 1  {life experience}
;;      c204  mass 1  {Jonas}
;;      c211  mass 1  {Karen}
;;      c277  mass 1  {Michael}

;; ---- slot receive.Theme  [event center]  n 6  clusters 6
(And (Member $e0 receive) (Theme $e0 $x1))
;;     c3368  mass 2  {work}
;;     c1738  mass 1  {honorary knighthood}
;;     c2416  mass 1  {permit}
;;      c588  mass 1  {award}
;;     c2243  mass 0.5  {new}
;;      c801  mass 0.5  {car}

;; ---- slot run.Agent  [event center]  n 6  clusters 5
(And (Member $e0 run) (Agent $e0 $x1))
;;      c134  mass 2  {George Allen}
;;     c1241  mass 1  {doctor}
;;     c1613  mass 1  {goat}
;;     c2963  mass 1  {squirrel}
;;      c385  mass 1  {Tobias}

;; ---- slot sleep.Experiencer  [event center]  n 6  clusters 4
(And (Member $e0 sleep) (Experiencer $e0 $x1))
;;      c820  mass 2  {cat}
;;      c878  mass 2  {child}
;;     c1244  mass 1  {dog}
;;       c30  mass 1  {Baya}

;; ---- slot speak.Theme  [event center]  n 6  clusters 6
(And (Member $e0 speak) (Theme $e0 $x1))
;;       c19  mass 2  {Ashe}
;;     c1108  mass 1  {czech}
;;     c1338  mass 1  {english}
;;     c2485  mass 1  {polish}
;;     c1494  mass 0.5  {foreign}
;;     c1946  mass 0.5  {language}

;; ---- slot start.Agent  [event center]  n 6  clusters 7
(And (Member $e0 start) (Agent $e0 $x1))
;;     c1022  mass 1  {cook}
;;     c1585  mass 1  {girl}
;;      c213  mass 1  {Karl}
;;     c2789  mass 1  {school janitor}
;;      c365  mass 1  {Skura}
;;     c1084  mass 0.5  {crowd}
;;     c3336  mass 0.5  {whole}

;; ---- slot study.Location  [event center]  n 6  clusters 4
(And (Member $e0 study) (Location $e0 $x1))
;;      c207  mass 2  {Julian Ashton Art School}
;;       c92  mass 2  {Davis Studio}
;;      c289  mass 1  {Munich}
;;     c3232  mass 1  {university}

;; ---- slot write.CoAgent  [event center]  n 6  clusters 3
(And (Member $e0 write) (CoAgent $e0 $x1))
;;      c235  mass 2  {Laurie Aubanel}
;;       c34  mass 2  {Bianca Olsen}
;;       c86  mass 2  {Cyril Rambour}

;; ---- slot add.Agent  [event center]  n 5  clusters 4
(And (Member $e0 add) (Agent $e0 $x1))
;;     c3113  mass 2  {thing}
;;     c1022  mass 1  {cook}
;;      c181  mass 1  {J. Augustus Knapp}
;;     c2457  mass 1  {plant}

;; ---- slot appear.Location  [event center]  n 5  clusters 4
(And (Member $e0 appear) (Location $e0 $x1))
;;      c777  mass 2  {cafe}
;;     c2206  mass 1  {musical film}
;;       c80  mass 1  {Coronation Street}
;;      c954  mass 1  {comedic role}

;; ---- slot buy.Theme  [event center]  n 5  clusters 7
(And (Member $e0 buy) (Theme $e0 $x1))
;;     c1487  mass 1  {food}
;;     c1759  mass 1  {house}
;;      c979  mass 1  {computer}
;;     c2851  mass 0.5  {shirt}
;;     c3196  mass 0.5  {trouser}
;;     c3389  mass 0.5  {yellow}
;;      c692  mass 0.5  {blue}

;; ---- slot cry.Agent  [event center]  n 5  clusters 5
(And (Member $e0 cry) (Agent $e0 $x1))
;;     c1585  mass 1  {girl}
;;        c3  mass 1  {Alberto}
;;       c30  mass 1  {Baya}
;;      c340  mass 1  {Rima}
;;      c365  mass 1  {Skura}

;; ---- slot direct.Agent  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Agent $e0 $x1))
;;      c243  mass 2  {Lev L. Spiro}
;;      c345  mass 1  {Robert Day}
;;       c75  mass 1  {Claude Lelouch}
;;      c986  mass 1  {conductor}

;; ---- slot direct.Patient  [event center]  n 5  clusters 5
(And (Member $e0 direct) (Patient $e0 $x1))
;;     c1351  mass 2  {episode}
;;     c2194  mass 1  {movie}
;;     c3113  mass 1  {thing}
;;     c1449  mass 0.5  {film}
;;     c3063  mass 0.5  {syrian film}

;; ---- slot draw.Agent  [event center]  n 5  clusters 3
(And (Member $e0 draw) (Agent $e0 $x1))
;;       c82  mass 2  {Cowper}
;;      c878  mass 2  {child}
;;      c981  mass 1  {concert}

;; ---- slot eat.Patient  [event center]  n 5  clusters 4
(And (Member $e0 eat) (Patient $e0 $x1))
;;     c1023  mass 2  {cookie}
;;     c2615  mass 1  {rabbit}
;;      c724  mass 1  {bread}
;;      c875  mass 1  {chicken}

;; ---- slot fly.Agent  [event center]  n 5  clusters 5
(And (Member $e0 fly) (Agent $e0 $x1))
;;     c1281  mass 1  {eagle}
;;     c1839  mass 1  {insect}
;;     c2454  mass 1  {plane}
;;     c2730  mass 1  {rocket}
;;      c374  mass 1  {Superman}

;; ---- slot include.Theme  [event center]  n 5  clusters 5
(And (Member $e0 include) (Theme $e0 $x1))
;;     c1394  mass 1  {extradition clause}
;;       c18  mass 1  {Armaan Jain}
;;     c2086  mass 1  {marching band}
;;      c301  mass 1  {Nikhil Nanda}
;;      c335  mass 1  {Ranbir Kapoor}

;; ---- slot lead.Agent  [event center]  n 5  clusters 4
(And (Member $e0 lead) (Agent $e0 $x1))
;;     c3113  mass 2  {thing}
;;     c1244  mass 1  {dog}
;;     c1304  mass 1  {education}
;;     c1571  mass 1  {general}

;; ---- slot lead.Goal  [event center]  n 5  clusters 7
(And (Member $e0 lead) (Goal $e0 $x1))
;;     c1675  mass 1  {happiness}
;;     c1731  mass 1  {home}
;;     c2396  mass 1  {peace}
;;     c1596  mass 0.5  {glory}
;;     c2052  mass 0.5  {lost}
;;      c669  mass 0.5  {big}
;;      c821  mass 0.5  {cat fight}

;; ---- slot marry.Agent  [event center]  n 5  clusters 4
(And (Member $e0 marry) (Agent $e0 $x1))
;;      c262  mass 2  {Margaret Fleming}
;;      c188  mass 1  {James of Barrochan}
;;      c293  mass 1  {Nancy}
;;      c372  mass 1  {Steve}

;; ---- slot need.Theme  [event center]  n 5  clusters 5
(And (Member $e0 need) (Theme $e0 $x1))
;;     c1574  mass 1  {generate}
;;     c1600  mass 1  {go}
;;     c2347  mass 1  {paint}
;;     c2751  mass 1  {run}
;;     c3225  mass 1  {understand}

;; ---- slot portray.Agent  [event center]  n 5  clusters 4
(And (Member $e0 portray) (Agent $e0 $x1))
;;      c366  mass 2  {Soichiro Akizuki}
;;      c187  mass 1  {James Woods}
;;     c3341  mass 1  {wilson}
;;      c418  mass 1  {Wilson}

;; ---- slot portray.Theme  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Theme $e0 $x1))
;;      c187  mass 2  {James Woods}
;;      c210  mass 2  {Kantaro Suga}
;;      c418  mass 1  {Wilson}

;; ---- slot present.Theme  [event center]  n 5  clusters 4
(And (Member $e0 present) (Theme $e0 $x1))
;;     c2923  mass 2  {song}
;;     c1617  mass 1  {golden opportunity}
;;     c2432  mass 1  {picture}
;;     c2466  mass 1  {play}

;; ---- slot provide.Agent  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Agent $e0 $x1))
;;     c1925  mass 1  {kitchen island}
;;     c2112  mass 1  {media}
;;     c2316  mass 1  {organisation}
;;     c2519  mass 1  {power station}
;;     c3354  mass 1  {witness}

;; ---- slot provide.Theme  [event center]  n 5  clusters 7
(And (Member $e0 provide) (Theme $e0 $x1))
;;     c1315  mass 1  {electricity}
;;     c1487  mass 1  {food}
;;     c2478  mass 1  {plurivocality}
;;     c1045  mass 0.5  {counter space}
;;     c1165  mass 0.5  {description}
;;     c1179  mass 0.5  {detailed}
;;     c1393  mass 0.5  {extra}

;; ---- slot ready.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 ready) (Experiencer $e0 $x1))
;;     c1203  mass 1  {dinner}
;;      c238  mass 1  {Leonid}
;;      c365  mass 1  {Skura}
;;      c422  mass 1  {Yanni}
;;      c778  mass 1  {cake}

;; ---- slot sell.Agent  [event center]  n 5  clusters 5
(And (Member $e0 sell) (Agent $e0 $x1))
;;      c965  mass 2  {company}
;;     c2251  mass 1  {newspaper}
;;      c276  mass 1  {Mennad}
;;     c1820  mass 0.5  {indie}
;;      c930  mass 0.5  {coffee brand}

;; ---- slot sing.Theme  [event center]  n 5  clusters 2
(And (Member $e0 sing) (Theme $e0 $x1))
;;     c2203  mass 4  {music}
;;     c2923  mass 1  {song}

;; ---- slot sing.To  [event center]  n 5  clusters 3
(And (Member $e0 sing) (To $e0 $x1))
;;      c443  mass 4  {accompany}
;;     c2203  mass 0.5  {music}
;;     c2763  mass 0.5  {sad}

;; ---- slot sleep.Location  [event center]  n 5  clusters 3
(And (Member $e0 sleep) (Location $e0 $x1))
;;     c1044  mass 3  {couch}
;;     c1843  mass 1  {inside}
;;     c2096  mass 1  {mat}

;; ---- slot stand.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 stand) (Experiencer $e0 $x1))
;;      c105  mass 1  {Edmundo}
;;     c1571  mass 1  {general}
;;        c3  mass 1  {Alberto}
;;     c3016  mass 1  {student}
;;       c96  mass 1  {Diego}

;; ---- slot start.Experiencer  [event center]  n 5  clusters 4
(And (Member $e0 start) (Experiencer $e0 $x1))
;;      c730  mass 2  {bridge}
;;      c143  mass 1  {Gunter}
;;      c308  mass 1  {Oleg}
;;     c3208  mass 1  {tunnel}

;; ---- slot study.Theme  [event center]  n 5  clusters 6
(And (Member $e0 study) (Theme $e0 $x1))
;;       c16  mass 1  {Arabic}
;;     c2111  mass 1  {mechanical engineering}
;;     c2630  mass 1  {rate}
;;      c797  mass 1  {canon law}
;;     c2243  mass 0.5  {new}
;;      c596  mass 0.5  {bacterium}

;; ---- slot swim.Agent  [event center]  n 5  clusters 5
(And (Member $e0 swim) (Agent $e0 $x1))
;;     c1461  mass 1.5  {fish}
;;      c247  mass 1  {Linda}
;;     c2788  mass 1  {school}
;;      c878  mass 1  {child}
;;     c2652  mass 0.5  {red}

;; ---- slot travel.Agent  [event center]  n 5  clusters 4
(And (Member $e0 travel) (Agent $e0 $x1))
;;     c2419  mass 2  {person}
;;      c271  mass 1  {Matthew}
;;      c347  mass 1  {Roger}
;;      c788  mass 1  {campaigner}

;; ---- slot turn.Result  [event center]  n 5  clusters 5
(And (Member $e0 turn) (Result $e0 $x1))
;;     c1083  mass 1  {crow}
;;     c1655  mass 1  {gusher}
;;     c2652  mass 1  {red}
;;     c3389  mass 1  {yellow}
;;      c683  mass 1  {black}

;; ---- slot watch.Agent  [event center]  n 5  clusters 5
(And (Member $e0 watch) (Agent $e0 $x1))
;;     c1416  mass 1  {family}
;;     c1627  mass 1  {government}
;;     c2419  mass 1  {person}
;;       c30  mass 1  {Baya}
;;      c923  mass 1  {coach}

;; ---- slot win.Theme  [event center]  n 5  clusters 2
(And (Member $e0 win) (Theme $e0 $x1))
;;     c1324  mass 4  {emmy}
;;     c2616  mass 1  {race}

;; ---- slot bad.Between  [entity center]  n 4  clusters 2
(And (Member $x0 bad) (Between $x0 $x1))
;;      c135  mass 2  {Germany}
;;      c328  mass 2  {Poland}

;; ---- slot beauty.Possession  [entity center]  n 4  clusters 4
(And (Member $x0 beauty) (Possession $x0 $x1))
;;      c233  mass 1  {Lake Towada}
;;     c2785  mass 1  {scenery}
;;     c2833  mass 1  {sex}
;;     c2872  mass 1  {sight}

;; ---- slot family.Possession  [entity center]  n 4  clusters 1
(And (Member $x0 family) (Possession $x0 $x1))
;;     c2419  mass 4  {person}

;; ---- slot northern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 northern) (LocatedIn $x0 $x1))
;;      c114  mass 2  {Estonia}
;;      c165  mass 2  {India}

;; ---- slot southern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 southern) (LocatedIn $x0 $x1))
;;      c165  mass 2  {India}
;;      c302  mass 2  {North Africa}

;; ---- slot accompany.Agent  [event center]  n 4  clusters 2
(And (Member $e0 accompany) (Agent $e0 $x1))
;;     c2419  mass 2  {person}
;;     c2883  mass 2  {sister}

;; ---- slot accompany.Theme  [event center]  n 4  clusters 1
(And (Member $e0 accompany) (Theme $e0 $x1))
;;     c2877  mass 4  {silent film}

;; ---- slot active.Time  [event center]  n 4  clusters 2
(And (Member $e0 active) (Time $e0 $x1))
;;     c1285  mass 2  {early morning}
;;     c1956  mass 2  {late afternoon}

;; ---- slot add.Theme  [event center]  n 4  clusters 3
(And (Member $e0 add) (Theme $e0 $x1))
;;     c1795  mass 2  {illustration}
;;     c1641  mass 1  {greenery}
;;      c920  mass 1  {clove}

;; ---- slot arrive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 arrive) (Agent $e0 $x1))
;;     c1265  mass 1  {driver}
;;     c2373  mass 1  {paris train}
;;     c2960  mass 1  {spring}
;;       c98  mass 1  {Donald}

;; ---- slot avoid.Theme  [event center]  n 4  clusters 4
(And (Member $e0 avoid) (Theme $e0 $x1))
;;     c2447  mass 1  {pitfall}
;;     c3113  mass 1  {thing}
;;      c619  mass 1  {bankruptcy}
;;      c988  mass 1  {conform}

;; ---- slot bad.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 bad) (Experiencer $e0 $x1))
;;      c598  mass 2  {bad}
;;     c2666  mass 1  {relationship}
;;     c2100  mass 0.5  {matter}
;;     c3315  mass 0.5  {weather}

;; ---- slot bear.Location  [event center]  n 4  clusters 3
(And (Member $e0 bear) (Location $e0 $x1))
;;       c52  mass 2  {Bromma}
;;     c2456  mass 1  {planet}
;;       c93  mass 1  {Denmark}

;; ---- slot begin.Patient  [event center]  n 4  clusters 4
(And (Member $e0 begin) (Patient $e0 $x1))
;;     c2260  mass 1  {night}
;;     c2788  mass 1  {school}
;;     c3187  mass 1  {tree}
;;     c3244  mass 1  {uprising}

;; ---- slot bring.Theme  [event center]  n 4  clusters 4
(And (Member $e0 bring) (Theme $e0 $x1))
;;      c205  mass 1  {Jonathan}
;;      c469  mass 1  {advantage}
;;      c733  mass 1  {british ship}
;;      c884  mass 1  {chinese dumpling}

;; ---- slot capture.Agent  [event center]  n 4  clusters 4
(And (Member $e0 capture) (Agent $e0 $x1))
;;     c1411  mass 1  {falcon}
;;     c2442  mass 1  {pirate}
;;     c3193  mass 1  {troop}
;;      c368  mass 1  {Spain}

;; ---- slot cause.Patient  [event center]  n 4  clusters 5
(And (Member $e0 cause) (Patient $e0 $x1))
;;     c1111  mass 1  {damage}
;;     c1291  mass 1  {earthquake}
;;      c433  mass 1  {abandonment anxiety}
;;     c1070  mass 0.5  {creaking}
;;     c2929  mass 0.5  {sound}

;; ---- slot change.Agent  [event center]  n 4  clusters 4
(And (Member $e0 change) (Agent $e0 $x1))
;;      c125  mass 1  {French Dahomey}
;;     c1977  mass 1  {leaf}
;;     c2077  mass 1  {man}
;;       c60  mass 1  {Cameron}

;; ---- slot close.Experiencer  [event center]  n 4  clusters 2
(And (Member $e0 close) (Experiencer $e0 $x1))
;;      c253  mass 3  {Low German}
;;       c41  mass 1  {Boldi}

;; ---- slot come.Source  [event center]  n 4  clusters 4
(And (Member $e0 come) (Source $e0 $x1))
;;     c1563  mass 1  {garden}
;;     c1638  mass 1  {greek}
;;     c2451  mass 1  {place}
;;     c3188  mass 1  {treeline}

;; ---- slot connect.Theme  [event center]  n 4  clusters 3
(And (Member $e0 connect) (Theme $e0 $x1))
;;      c217  mass 2  {Kayalar}
;;      c292  mass 1  {Nagoya}
;;      c386  mass 1  {Tokyo}

;; ---- slot create.Location  [event center]  n 4  clusters 1
(And (Member $e0 create) (Location $e0 $x1))
;;     c2508  mass 4  {post}

;; ---- slot decide.Agent  [event center]  n 4  clusters 3
(And (Member $e0 decide) (Agent $e0 $x1))
;;      c127  mass 2  {Fyodor}
;;      c109  mass 1  {Elias}
;;       c33  mass 1  {Beth}

;; ---- slot design.Agent  [event center]  n 4  clusters 3
(And (Member $e0 design) (Agent $e0 $x1))
;;      c150  mass 2  {Henry L. Taylor}
;;      c324  mass 1  {Philip Hercus}
;;      c344  mass 1  {Robert Allan Limited}

;; ---- slot design.Patient  [event center]  n 4  clusters 2
(And (Member $e0 design) (Patient $e0 $x1))
;;     c2341  mass 2  {pacificat}
;;     c3113  mass 2  {thing}

;; ---- slot die.Patient  [event center]  n 4  clusters 2
(And (Member $e0 die) (Patient $e0 $x1))
;;     c2419  mass 3  {person}
;;     c1416  mass 1  {family}

;; ---- slot discover.Theme  [event center]  n 4  clusters 5
(And (Member $e0 discover) (Theme $e0 $x1))
;;     c2214  mass 2  {name}
;;     c2576  mass 1  {pterosaur egg}
;;     c2062  mass 0.333  {magnet}
;;     c2243  mass 0.333  {new}
;;     c3215  mass 0.333  {type}

;; ---- slot do.Patient  [event center]  n 4  clusters 4
(And (Member $e0 do) (Patient $e0 $x1))
;;     c3113  mass 2  {thing}
;;     c1218  mass 1  {dish}
;;     c1113  mass 0.5  {dance}
;;     c2027  mass 0.5  {little}

;; ---- slot eat.Agent  [event center]  n 4  clusters 5
(And (Member $e0 eat) (Agent $e0 $x1))
;;     c2419  mass 1  {person}
;;      c678  mass 1  {bird}
;;      c878  mass 1  {child}
;;     c1244  mass 0.5  {dog}
;;      c735  mass 0.5  {brown}

;; ---- slot encourage.In  [event center]  n 4  clusters 3
(And (Member $e0 encourage) (In $e0 $x1))
;;     c2099  mass 2  {mathematics}
;;      c870  mass 1  {chess}
;;      c871  mass 1  {chess play}

;; ---- slot enter.Theme  [event center]  n 4  clusters 4
(And (Member $e0 enter) (Theme $e0 $x1))
;;      c176  mass 1  {Issaquah Creek}
;;     c2374  mass 1  {park}
;;      c401  mass 1  {United States}
;;      c830  mass 1  {cave}

;; ---- slot find.Agent  [event center]  n 4  clusters 3
(And (Member $e0 find) (Agent $e0 $x1))
;;       c81  mass 2  {Couper}
;;      c120  mass 1  {Flavio}
;;      c325  mass 1  {Pietro}

;; ---- slot get.Theme  [event center]  n 4  clusters 5
(And (Member $e0 get) (Theme $e0 $x1))
;;     c1668  mass 1  {hamster}
;;     c2900  mass 1  {snack}
;;      c547  mass 1  {arrest}
;;     c2055  mass 0.5  {low}
;;     c2544  mass 0.5  {price}

;; ---- slot give.Theme  [event center]  n 4  clusters 5
(And (Member $e0 give) (Theme $e0 $x1))
;;     c2159  mass 1  {mock champagne}
;;     c3113  mass 1  {thing}
;;      c885  mass 1  {chocolate}
;;     c1620  mass 0.5  {good}
;;      c470  mass 0.5  {advice}

;; ---- slot good.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 good) (Experiencer $e0 $x1))
;;     c3113  mass 1  {thing}
;;     c3315  mass 1  {weather}
;;     c3346  mass 1  {windshield}
;;      c624  mass 1  {barley bread}

;; ---- slot help.Theme  [event center]  n 4  clusters 4
(And (Member $e0 help) (Theme $e0 $x1))
;;     c1145  mass 1  {define}
;;     c1585  mass 1  {girl}
;;     c2419  mass 1  {person}
;;     c3124  mass 1  {thrive}

;; ---- slot include.Agent  [event center]  n 4  clusters 2
(And (Member $e0 include) (Agent $e0 $x1))
;;     c2237  mass 3  {nephew}
;;     c2364  mass 1  {parade}

;; ---- slot increase.Patient  [event center]  n 4  clusters 4
(And (Member $e0 increase) (Patient $e0 $x1))
;;     c1827  mass 1  {industrial output}
;;     c2183  mass 1  {motor vehicle}
;;     c3219  mass 1  {ukrainian combat loss}
;;     c3386  mass 1  {xenophobia}

;; ---- slot jump.Agent  [event center]  n 4  clusters 6
(And (Member $e0 jump) (Agent $e0 $x1))
;;     c1056  mass 1  {cow}
;;     c1247  mass 1  {donkey}
;;      c715  mass 1  {boy}
;;     c1514  mass 0.333  {fox}
;;     c2613  mass 0.333  {quick}
;;      c735  mass 0.333  {brown}

;; ---- slot kill.Location  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Location $e0 $x1))
;;     c2977  mass 3  {state}
;;     c1706  mass 1  {here}

;; ---- slot kill.Manner  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Manner $e0 $x1))
;;     c1209  mass 2  {directly}
;;     c1825  mass 2  {indirectly}

;; ---- slot lie.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 lie) (Experiencer $e0 $x1))
;;     c2277  mass 1  {notebook}
;;     c2406  mass 1  {pen}
;;     c3075  mass 1  {tape recorder}
;;      c703  mass 1  {book}

;; ---- slot lie.Location  [event center]  n 4  clusters 1
(And (Member $e0 lie) (Location $e0 $x1))
;;     c3065  mass 4  {table}

;; ---- slot look.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 look) (Experiencer $e0 $x1))
;;      c115  mass 1  {Europe}
;;     c1465  mass 1  {flag}
;;     c1874  mass 1  {island}
;;     c2788  mass 1  {school}

;; ---- slot look.Like  [event center]  n 4  clusters 6
(And (Member $e0 look) (Like $e0 $x1))
;;     c2365  mass 1  {paradise}
;;     c2548  mass 1  {prison}
;;     c1766  mass 0.5  {huge}
;;     c1863  mass 0.5  {inverted}
;;     c2424  mass 0.5  {philippine flag}
;;     c2949  mass 0.5  {spider}

;; ---- slot move.Agent  [event center]  n 4  clusters 4
(And (Member $e0 move) (Agent $e0 $x1))
;;     c1692  mass 2  {headquarters}
;;      c355  mass 1  {Sammy}
;;     c1461  mass 0.5  {fish}
;;     c2788  mass 0.5  {school}

;; ---- slot perform.Location  [event center]  n 4  clusters 3
(And (Member $e0 perform) (Location $e0 $x1))
;;      c777  mass 2  {cafe}
;;     c1731  mass 1  {home}
;;     c2578  mass 1  {public}

;; ---- slot preach.Agent  [event center]  n 4  clusters 1
(And (Member $e0 preach) (Agent $e0 $x1))
;;     c2419  mass 4  {person}

;; ---- slot preach.Location  [event center]  n 4  clusters 2
(And (Member $e0 preach) (Location $e0 $x1))
;;      c131  mass 2  {Gareccio}
;;      c178  mass 2  {Italy}

;; ---- slot present.Agent  [event center]  n 4  clusters 3
(And (Member $e0 present) (Agent $e0 $x1))
;;      c158  mass 2  {Horner}
;;     c1617  mass 1  {golden opportunity}
;;      c965  mass 1  {company}

;; ---- slot receive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 receive) (Agent $e0 $x1))
;;      c133  mass 1  {General Franks}
;;     c2658  mass 1  {refugee}
;;       c33  mass 1  {Beth}
;;     c3349  mass 1  {winner}

;; ---- slot replace.Agent  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Agent $e0 $x1))
;;      c363  mass 2  {Sherman Howard}
;;     c2419  mass 1  {person}
;;      c323  mass 1  {Peter Gaussen}

;; ---- slot replace.Theme  [event center]  n 4  clusters 4
(And (Member $e0 replace) (Theme $e0 $x1))
;;     c2419  mass 1  {person}
;;      c244  mass 1  {Lex Lex Luthor}
;;      c245  mass 1  {Lex Luthor}
;;      c417  mass 1  {William Ewer}

;; ---- slot require.Theme  [event center]  n 4  clusters 6
(And (Member $e0 require) (Theme $e0 $x1))
;;     c2674  mass 1  {repair}
;;      c505  mass 1  {american phone number}
;;     c1677  mass 0.5  {hard}
;;     c1787  mass 0.5  {id card}
;;     c3251  mass 0.5  {valid}
;;     c3368  mass 0.5  {work}

;; ---- slot specify.In  [event center]  n 4  clusters 2
(And (Member $e0 specify) (In $e0 $x1))
;;     c1017  mass 2  {continuous time}
;;     c1215  mass 2  {discrete time}

;; ---- slot spend.Agent  [event center]  n 4  clusters 3
(And (Member $e0 spend) (Agent $e0 $x1))
;;     c2419  mass 2  {person}
;;     c1583  mass 1  {giraffe}
;;      c273  mass 1  {May}

;; ---- slot star.Agent  [event center]  n 4  clusters 1
(And (Member $e0 star) (Agent $e0 $x1))
;;     c3113  mass 4  {thing}

;; ---- slot star.Theme  [event center]  n 4  clusters 2
(And (Member $e0 star) (Theme $e0 $x1))
;;      c196  mass 2  {Jeremy Irons}
;;      c314  mass 2  {Patricia Kaas}

;; ---- slot stop.Agent  [event center]  n 4  clusters 5
(And (Member $e0 stop) (Agent $e0 $x1))
;;      c340  mass 1  {Rima}
;;      c365  mass 1  {Skura}
;;      c422  mass 1  {Yanni}
;;     c2298  mass 0.5  {old}
;;      c461  mass 0.5  {adaptor}

;; ---- slot stop.Theme  [event center]  n 4  clusters 2
(And (Member $e0 stop) (Theme $e0 $x1))
;;     c1088  mass 2  {cry}
;;     c3368  mass 2  {work}

;; ---- slot support.Theme  [event center]  n 4  clusters 1
(And (Member $e0 support) (Theme $e0 $x1))
;;     c3269  mass 4  {view}

;; ---- slot use.Manner  [event center]  n 4  clusters 3
(And (Member $e0 use) (Manner $e0 $x1))
;;     c2628  mass 2  {rarely}
;;     c2692  mass 1  {responsibly}
;;      c940  mass 1  {colloquially}

;; ---- slot use.To  [event center]  n 4  clusters 4
(And (Member $e0 use) (To $e0 $x1))
;;     c1180  mass 1  {develop}
;;     c1979  mass 1  {learn}
;;     c2074  mass 1  {make}
;;     c2725  mass 1  {roast}

;; ---- slot walk.Goal  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Goal $e0 $x1))
;;     c1501  mass 1  {forest}
;;     c2995  mass 1  {store}
;;      c591  mass 1  {back}
;;      c897  mass 1  {classroom}

;; ---- slot walk.Location  [event center]  n 4  clusters 5
(And (Member $e0 walk) (Location $e0 $x1))
;;     c1118  mass 1  {dark}
;;     c1665  mass 1  {hallway}
;;     c3362  mass 1  {wood floor}
;;     c2027  mass 0.5  {little}
;;      c610  mass 0.5  {balloon}

;; ---- slot watch.Theme  [event center]  n 4  clusters 4
(And (Member $e0 watch) (Theme $e0 $x1))
;;     c1362  mass 1  {event}
;;     c2194  mass 1  {movie}
;;     c2225  mass 1  {natural hair video}
;;      c456  mass 1  {activity}

;; ---- slot win.For  [event center]  n 4  clusters 2
(And (Member $e0 win) (For $e0 $x1))
;;     c2501  mass 3  {portray}
;;     c2502  mass 1  {portrayal}

;; ---- slot work.Location  [event center]  n 4  clusters 4
(And (Member $e0 work) (Location $e0 $x1))
;;      c115  mass 1  {Europe}
;;     c1403  mass 1  {factory}
;;     c2549  mass 1  {prison kitchen}
;;       c72  mass 1  {Church of Norway}

;; ---- slot bottom.PartOf  [entity center]  n 3  clusters 2
(And (Member $x0 bottom) (PartOf $x0 $x1))
;;     c2346  mass 2  {page}
;;     c2988  mass 1  {stew pot}

;; ---- slot fight.Against  [entity center]  n 3  clusters 3
(And (Member $x0 fight) (Against $x0 $x1))
;;     c1133  mass 1  {death}
;;     c1429  mass 1  {fate}
;;     c2227  mass 1  {nature}

;; ---- slot thing.LocatedIn  [entity center]  n 3  clusters 2
(And (Member $x0 thing) (LocatedIn $x0 $x1))
;;     c1718  mass 2  {hill}
;;      c915  mass 1  {closet}

;; ---- slot active.Experiencer  [event center]  n 3  clusters 2
(And (Member $e0 active) (Experiencer $e0 $x1))
;;     c3113  mass 2  {thing}
;;       c21  mass 1  {Asserson}

;; ---- slot affect.Agent  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Agent $e0 $x1))
;;     c1106  mass 3  {cyberattack}

;; ---- slot affect.Location  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Location $e0 $x1))
;;     c3372  mass 3  {world}

;; ---- slot affect.Theme  [event center]  n 3  clusters 3
(And (Member $e0 affect) (Theme $e0 $x1))
;;     c1748  mass 1  {hospital}
;;      c616  mass 1  {bank}
;;      c965  mass 1  {company}

;; ---- slot affect.Time  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Time $e0 $x1))
;;     c3122  mass 3  {this year}

;; ---- slot approve.Theme  [event center]  n 3  clusters 3
(And (Member $e0 approve) (Theme $e0 $x1))
;;     c2453  mass 1  {plan}
;;     c3186  mass 1  {treaty}
;;      c675  mass 1  {bill}

;; ---- slot attack.Patient  [event center]  n 3  clusters 3
(And (Member $e0 attack) (Patient $e0 $x1))
;;     c1011  mass 1  {consumer rights}
;;      c346  mass 1  {Rodrigo}
;;      c744  mass 1  {building}

;; ---- slot bake.Agent  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Agent $e0 $x1))
;;      c965  mass 2  {company}
;;      c110  mass 1  {Ella}

;; ---- slot bake.Patient  [event center]  n 3  clusters 4
(And (Member $e0 bake) (Patient $e0 $x1))
;;     c1783  mass 1  {ice cone}
;;     c1785  mass 1  {ice cream cone}
;;     c2433  mass 0.5  {pie}
;;     c2798  mass 0.5  {scrumptious}

;; ---- slot base.On  [event center]  n 3  clusters 3
(And (Member $e0 base) (On $e0 $x1))
;;     c1447  mass 1  {fight}
;;     c1960  mass 1  {latin alphabet}
;;     c2590  mass 1  {puritan value}

;; ---- slot beautiful.Experiencer  [event center]  n 3  clusters 4
(And (Member $e0 beautiful) (Experiencer $e0 $x1))
;;     c3315  mass 1  {weather}
;;      c644  mass 1  {beautiful}
;;     c2171  mass 0.5  {moon}
;;     c2737  mass 0.5  {room}

;; ---- slot break_out.Patient  [event center]  n 3  clusters 3
(And (Member $e0 break_out) (Patient $e0 $x1))
;;     c1457  mass 1  {fire}
;;     c1502  mass 1  {forest fire}
;;     c3297  mass 1  {war}

;; ---- slot bring.Goal  [event center]  n 3  clusters 3
(And (Member $e0 bring) (Goal $e0 $x1))
;;     c1558  mass 1  {gallows}
;;      c166  mass 1  {Indonesia}
;;      c401  mass 1  {United States}

;; ---- slot buy.Agent  [event center]  n 3  clusters 2
(And (Member $e0 buy) (Agent $e0 $x1))
;;      c219  mass 2  {Keike}
;;      c338  mass 1  {Regis}

;; ---- slot close.Agent  [event center]  n 3  clusters 4
(And (Member $e0 close) (Agent $e0 $x1))
;;     c1650  mass 1  {guard}
;;     c2437  mass 1  {pilot}
;;     c1437  mass 0.5  {female}
;;     c1583  mass 0.5  {giraffe}

;; ---- slot close.Goal  [event center]  n 3  clusters 3
(And (Member $e0 close) (Goal $e0 $x1))
;;      c102  mass 1  {Dutch}
;;      c126  mass 1  {Frisian}
;;      c154  mass 1  {High German}

;; ---- slot close.Patient  [event center]  n 3  clusters 2
(And (Member $e0 close) (Patient $e0 $x1))
;;     c1248  mass 2  {door}
;;     c2995  mass 1  {store}

;; ---- slot come.Goal  [event center]  n 3  clusters 4
(And (Member $e0 come) (Goal $e0 $x1))
;;      c981  mass 1  {concert}
;;      c983  mass 1  {conclusion}
;;     c2486  mass 0.5  {political}
;;     c2831  mass 0.5  {settlement}

;; ---- slot come.Patient  [event center]  n 3  clusters 3
(And (Member $e0 come) (Patient $e0 $x1))
;;     c1840  mass 1  {insect sound}
;;     c2929  mass 1  {sound}
;;     c3217  mass 1  {typhoon}

;; ---- slot come_back.Agent  [event center]  n 3  clusters 3
(And (Member $e0 come_back) (Agent $e0 $x1))
;;     c1109  mass 1  {dad}
;;     c2169  mass 1  {mom}
;;      c715  mass 1  {boy}

;; ---- slot compose.Patient  [event center]  n 3  clusters 3
(And (Member $e0 compose) (Patient $e0 $x1))
;;     c2923  mass 2  {song}
;;     c1635  mass 0.5  {great}
;;     c3060  mass 0.5  {symphony}

;; ---- slot conduct.Agent  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Agent $e0 $x1))
;;       c63  mass 2  {Carl Fenton}
;;      c116  mass 1  {FBI}

;; ---- slot conduct.Theme  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Theme $e0 $x1))
;;     c2314  mass 2  {orchestra}
;;     c3048  mass 1  {surveillance}

;; ---- slot cover.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Instrument $e0 $x1))
;;     c2358  mass 1  {paper decoration}
;;     c2903  mass 1  {snow}
;;     c3320  mass 1  {weed}

;; ---- slot cover.Patient  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Patient $e0 $x1))
;;     c1053  mass 1  {courtyard}
;;     c2857  mass 1  {shopping arcade}
;;     c3151  mass 1  {top}

;; ---- slot define.Theme  [event center]  n 3  clusters 2
(And (Member $e0 define) (Theme $e0 $x1))
;;     c2817  mass 2  {sequence}
;;     c3113  mass 1  {thing}

;; ---- slot die.Location  [event center]  n 3  clusters 2
(And (Member $e0 die) (Location $e0 $x1))
;;      c373  mass 2  {Stockholm}
;;     c1457  mass 1  {fire}

;; ---- slot drink.Patient  [event center]  n 3  clusters 3
(And (Member $e0 drink) (Patient $e0 $x1))
;;     c3084  mass 2  {tea}
;;     c1620  mass 0.5  {good}
;;     c3304  mass 0.5  {water}

;; ---- slot drive.Agent  [event center]  n 3  clusters 2
(And (Member $e0 drive) (Agent $e0 $x1))
;;      c754  mass 2  {bus}
;;     c3256  mass 1  {van}

;; ---- slot encourage.Agent  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Agent $e0 $x1))
;;      c334  mass 3  {Ralph}

;; ---- slot encourage.Theme  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Theme $e0 $x1))
;;      c272  mass 3  {Maurice}

;; ---- slot endorse.Theme  [event center]  n 3  clusters 1
(And (Member $e0 endorse) (Theme $e0 $x1))
;;     c3269  mass 3  {view}

;; ---- slot fall.Source  [event center]  n 3  clusters 3
(And (Member $e0 fall) (Source $e0 $x1))
;;     c2845  mass 1  {shelf}
;;     c2890  mass 1  {sky}
;;     c3187  mass 1  {tree}

;; ---- slot fight.Agent  [event center]  n 3  clusters 2
(And (Member $e0 fight) (Agent $e0 $x1))
;;     c1904  mass 2  {kabye person}
;;     c3230  mass 1  {union boss}

;; ---- slot fight.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fight) (Theme $e0 $x1))
;;     c1524  mass 1  {freeze}
;;     c1872  mass 1  {islamic fundamentalism}
;;     c3099  mass 1  {terrorism}

;; ---- slot fund.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fund) (Theme $e0 $x1))
;;      c241  mass 1  {Lessos-Kenya}
;;      c242  mass 1  {Lessos-Uganda}
;;      c707  mass 1  {border section}

;; ---- slot give.Agent  [event center]  n 3  clusters 2
(And (Member $e0 give) (Agent $e0 $x1))
;;      c408  mass 2  {Vladimir}
;;      c416  mass 1  {William}

;; ---- slot go.Manner  [event center]  n 3  clusters 2
(And (Member $e0 go) (Manner $e0 $x1))
;;     c1955  mass 2  {late}
;;     c1800  mass 1  {immediately}

;; ---- slot go.To  [event center]  n 3  clusters 2
(And (Member $e0 go) (To $e0 $x1))
;;     c3073  mass 2  {talk}
;;     c2809  mass 1  {see}

;; ---- slot grow.Patient  [event center]  n 3  clusters 4
(And (Member $e0 grow) (Patient $e0 $x1))
;;      c209  mass 1  {Kalman}
;;      c641  mass 1  {beard}
;;     c1406  mass 0.5  {faint}
;;     c2929  mass 0.5  {sound}

;; ---- slot have.In  [event center]  n 3  clusters 2
(And (Member $e0 have) (In $e0 $x1))
;;     c1478  mass 2  {fluid mechanics}
;;     c2480  mass 1  {poetry}

;; ---- slot hold.Patient  [event center]  n 3  clusters 4
(And (Member $e0 hold) (Patient $e0 $x1))
;;     c2119  mass 1  {meeting}
;;     c2525  mass 1  {prayer}
;;     c2093  mass 0.5  {mass}
;;      c847  mass 0.5  {ceremony}

;; ---- slot lead.Theme  [event center]  n 3  clusters 4
(And (Member $e0 lead) (Theme $e0 $x1))
;;     c2842  mass 1  {sheep}
;;     c2961  mass 1  {squad}
;;      c669  mass 0.5  {big}
;;      c821  mass 0.5  {cat fight}

;; ---- slot learn.Theme  [event center]  n 3  clusters 4
(And (Member $e0 learn) (Theme $e0 $x1))
;;     c3282  mass 1  {vocabulary}
;;      c659  mass 1  {berber}
;;     c1494  mass 0.5  {foreign}
;;     c1946  mass 0.5  {language}

;; ---- slot leave.Patient  [event center]  n 3  clusters 5
(And (Member $e0 leave) (Patient $e0 $x1))
;;     c1248  mass 1  {door}
;;     c2008  mass 0.5  {light}
;;     c2302  mass 0.5  {on}
;;     c2308  mass 0.5  {open}
;;     c3234  mass 0.5  {unlocked}

;; ---- slot leave.Result  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Result $e0 $x1))
;;     c2302  mass 1  {on}
;;     c2308  mass 1  {open}
;;     c3234  mass 1  {unlocked}

;; ---- slot leave.Theme  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Theme $e0 $x1))
;;     c2376  mass 1  {parking lot}
;;     c2737  mass 1  {room}
;;      c801  mass 1  {car}

;; ---- slot lose.Agent  [event center]  n 3  clusters 2
(And (Member $e0 lose) (Agent $e0 $x1))
;;      c134  mass 2  {George Allen}
;;     c3141  mass 1  {tire}

;; ---- slot move.Goal  [event center]  n 3  clusters 2
(And (Member $e0 move) (Goal $e0 $x1))
;;       c27  mass 2  {Baltimore}
;;     c1706  mass 1  {here}

;; ---- slot paint.Patient  [event center]  n 3  clusters 2
(And (Member $e0 paint) (Patient $e0 $x1))
;;     c1944  mass 2  {landscape}
;;     c1568  mass 1  {gate}

;; ---- slot pick_up.Agent  [event center]  n 3  clusters 3
(And (Member $e0 pick_up) (Agent $e0 $x1))
;;      c195  mass 1  {Jay}
;;      c358  mass 1  {Santiago}
;;      c787  mass 1  {camera}

;; ---- slot play.Location  [event center]  n 3  clusters 2
(And (Member $e0 play) (Location $e0 $x1))
;;      c148  mass 2  {Havana}
;;     c1473  mass 1  {floor}

;; ---- slot pull.Theme  [event center]  n 3  clusters 5
(And (Member $e0 pull) (Theme $e0 $x1))
;;      c358  mass 1  {Santiago}
;;       c44  mass 1  {Boris}
;;     c1526  mass 0.333  {freight car}
;;     c2016  mass 0.333  {line}
;;     c2046  mass 0.333  {long}

;; ---- slot read.Agent  [event center]  n 3  clusters 4
(And (Member $e0 read) (Agent $e0 $x1))
;;      c216  mass 1  {Katya}
;;      c381  mass 1  {Thomas}
;;     c1585  mass 0.5  {girl}
;;     c2027  mass 0.5  {little}

;; ---- slot read.Theme  [event center]  n 3  clusters 3
(And (Member $e0 read) (Theme $e0 $x1))
;;     c1301  mass 1  {economics magazine}
;;     c1409  mass 1  {fairy tale}
;;      c957  mass 1  {comic}

;; ---- slot require.Agent  [event center]  n 3  clusters 3
(And (Member $e0 require) (Agent $e0 $x1))
;;     c1759  mass 1  {house}
;;     c2095  mass 1  {master}
;;      c526  mass 1  {app}

;; ---- slot return.Agent  [event center]  n 3  clusters 2
(And (Member $e0 return) (Agent $e0 $x1))
;;      c139  mass 2  {Glasnow}
;;     c1464  mass 1  {fishing boat}

;; ---- slot return.Goal  [event center]  n 3  clusters 2
(And (Member $e0 return) (Goal $e0 $x1))
;;        c7  mass 2  {Altoona}
;;     c2499  mass 1  {port}

;; ---- slot rule.Agent  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Agent $e0 $x1))
;;      c383  mass 2  {Tipu Sultan}
;;      c368  mass 1  {Spain}

;; ---- slot rule.Theme  [event center]  n 3  clusters 4
(And (Member $e0 rule) (Theme $e0 $x1))
;;     c2209  mass 1  {muslim house}
;;       c84  mass 1  {Cuba}
;;     c1759  mass 0.5  {house}
;;     c2207  mass 0.5  {muslim}

;; ---- slot say.Theme  [event center]  n 3  clusters 2
(And (Member $e0 say) (Theme $e0 $x1))
;;     c3113  mass 2  {thing}
;;     c1553  mass 1  {funeral prayer}

;; ---- slot season.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 season) (Instrument $e0 $x1))
;;     c1746  mass 1  {horse radish}
;;     c1994  mass 1  {lemongrass}
;;     c2625  mass 1  {ramson}

;; ---- slot see.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 see) (Stimulus $e0 $x1))
;;     c1544  mass 1  {full moon}
;;      c199  mass 1  {Jessica}
;;      c509  mass 1  {animal}

;; ---- slot shoot.Patient  [event center]  n 3  clusters 3
(And (Member $e0 shoot) (Patient $e0 $x1))
;;      c182  mass 1  {JFK}
;;      c640  mass 1  {bear}
;;       c89  mass 1  {Dan}

;; ---- slot sleep.Agent  [event center]  n 3  clusters 2
(And (Member $e0 sleep) (Agent $e0 $x1))
;;     c2419  mass 2  {person}
;;     c1416  mass 1  {family}

;; ---- slot solve.Patient  [event center]  n 3  clusters 1
(And (Member $e0 solve) (Patient $e0 $x1))
;;     c2550  mass 3  {problem}

;; ---- slot spend.Theme  [event center]  n 3  clusters 2
(And (Member $e0 spend) (Theme $e0 $x1))
;;     c1377  mass 2  {exile}
;;     c1123  mass 1  {day}

;; ---- slot start.Location  [event center]  n 3  clusters 2
(And (Member $e0 start) (Location $e0 $x1))
;;      c375  mass 2  {Sweden}
;;       c93  mass 1  {Denmark}

;; ---- slot stick.Patient  [event center]  n 3  clusters 3
(And (Member $e0 stick) (Patient $e0 $x1))
;;     c1745  mass 1  {horse}
;;     c3199  mass 1  {truck}
;;      c873  mass 1  {chewing gum}

;; ---- slot succeed.Agent  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Agent $e0 $x1))
;;       c26  mass 1  {Bailey}
;;      c323  mass 1  {Peter Gaussen}
;;        c4  mass 1  {Alexander}

;; ---- slot succeed.Theme  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Theme $e0 $x1))
;;      c149  mass 1  {Henry Cole}
;;     c2419  mass 1  {person}
;;      c262  mass 1  {Margaret Fleming}

;; ---- slot take_off.Agent  [event center]  n 3  clusters 3
(And (Member $e0 take_off) (Agent $e0 $x1))
;;     c2454  mass 1  {plane}
;;      c486  mass 1  {airplane}
;;       c89  mass 1  {Dan}

;; ---- slot take_over.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_over) (Agent $e0 $x1))
;;      c410  mass 2  {Watts}
;;     c1882  mass 1  {ivy}

;; ---- slot talk.Recipient  [event center]  n 3  clusters 4
(And (Member $e0 talk) (Recipient $e0 $x1))
;;      c251  mass 1  {Loren}
;;     c3086  mass 1  {teacher}
;;     c1950  mass 0.5  {large}
;;      c579  mass 0.5  {audience}

;; ---- slot turn.Goal  [event center]  n 3  clusters 3
(And (Member $e0 turn) (Goal $e0 $x1))
;;     c2607  mass 1  {quagmire}
;;     c2680  mass 1  {report}
;;     c2720  mass 1  {river}

;; ---- slot understand.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 understand) (Stimulus $e0 $x1))
;;     c2580  mass 1  {public health issue}
;;     c2639  mass 1  {reason}
;;     c2943  mass 1  {specific issue}

;; ---- slot wear.Theme  [event center]  n 3  clusters 3
(And (Member $e0 wear) (Theme $e0 $x1))
;;     c1702  mass 1  {helmet}
;;     c1814  mass 1  {inaugural gown}
;;     c2092  mass 1  {mask}

;; ---- slot welcome.Agent  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Agent $e0 $x1))
;;     c1749  mass 1  {host}
;;     c1828  mass 1  {industrialization}
;;     c3331  mass 1  {whig}

;; ---- slot welcome.Theme  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Theme $e0 $x1))
;;     c1653  mass 1  {guest}
;;     c1828  mass 1  {industrialization}
;;     c3331  mass 1  {whig}

;; ---- slot work.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 work) (Experiencer $e0 $x1))
;;     c2190  mass 1  {mouse}
;;     c2887  mass 1  {site}
;;     c3183  mass 1  {travel adaptor}

;; ---- slot work.Manner  [event center]  n 3  clusters 3
(And (Member $e0 work) (Manner $e0 $x1))
;;     c1456  mass 1  {fine}
;;     c1955  mass 1  {late}
;;     c2411  mass 1  {perfectly}

;; ==================== subtree @ cluster cos 0.80: pooled role level (136 head pairs) ====================

;; Agent ~ Experiencer  cosine 0.62  JSD 0.626  n 888 / 261  shared: {person, people} {Gustavo, Alberto, Martino, Pietro, …} {Jessica, Linda, Beth, Katherine, …}
(Agent $e $x)
(Experiencer $e $x)

;; Patient ~ Theme  cosine 0.49  JSD 0.721  n 455 / 594  shared: {thing, things, stuff, practice, thing} {person, people} {song, sing, chant}
(Patient $e $x)
(Theme $e $x)

;; Agent ~ Patient  cosine 0.44  JSD 0.734  n 888 / 455  shared: {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
(Agent $e $x)
(Patient $e $x)

;; Agent ~ Theme  cosine 0.42  JSD 0.725  n 888 / 594  shared: {person, people} {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …}
(Agent $e $x)
(Theme $e $x)

;; Experiencer ~ Patient  cosine 0.38  JSD 0.678  n 261 / 455  shared: {person, people} {thing, things, stuff, practice, thing} {Gustavo, Alberto, Martino, Pietro, …}
(Experiencer $e $x)
(Patient $e $x)

;; Agent ~ Recipient  cosine 0.37  JSD 0.77  n 888 / 29  shared: {person, people} {Jessica, Linda, Beth, Katherine, …} {company, corporation}
(Agent $e $x)
(Recipient $e $x)

;; Stimulus ~ Theme  cosine 0.35  JSD 0.873  n 34 / 594  shared: {thing, things, stuff, practice, thing} {Jessica, Linda, Beth, Katherine, …} {food, eat}
(Stimulus $e $x)
(Theme $e $x)

;; Experiencer ~ Holder  cosine 0.34  JSD 0.738  n 261 / 48  shared: {Gustavo, Alberto, Martino, Pietro, …} {Boris, Ivan, Oleg, Fyodor, …} {Jonas, Roger, Bob, Ralph, …}
(Experiencer $e $x)
(Holder $e $x)

;; Experiencer ~ Theme  cosine 0.33  JSD 0.767  n 261 / 594  shared: {thing, things, stuff, practice, thing} {person, people} {Gustavo, Alberto, Martino, Pietro, …}
(Experiencer $e $x)
(Theme $e $x)

;; Holder ~ Theme  cosine 0.26  JSD 0.82  n 48 / 594  shared: {thing, things, stuff, practice, thing} {Boldi, Bruno, Felix, Maurice, …} {house, home, comfortable, house, houses, …}
(Holder $e $x)
(Theme $e $x)

;; Agent ~ Holder  cosine 0.26  JSD 0.782  n 888 / 48  shared: {Gustavo, Alberto, Martino, Pietro, …} {thing, things, stuff, practice, thing} {Jonas, Roger, Bob, Ralph, …}
(Agent $e $x)
(Holder $e $x)

;; Goal ~ Location  cosine 0.25  JSD 0.802  n 93 / 210  shared: {house, home, comfortable, house, houses, …} {Germany, Denmark, Norway, Sweden} {city, town, cities, town, unknown, …}
(Goal $e $x)
(Location $e $x)

;; Holder ~ Patient  cosine 0.24  JSD 0.814  n 48 / 455  shared: {thing, things, stuff, practice, thing} {movie, film} {room, changing room, rooms}
(Holder $e $x)
(Patient $e $x)

;; Experiencer ~ Recipient  cosine 0.23  JSD 0.852  n 261 / 29  shared: {person, people} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
(Experiencer $e $x)
(Recipient $e $x)

;; Patient ~ Stimulus  cosine 0.23  JSD 0.922  n 455 / 34  shared: {thing, things, stuff, practice, thing} {knock, kick, kick out} {Jessica, Linda, Beth, Katherine, …}
(Patient $e $x)
(Stimulus $e $x)

;; Location ~ Source  cosine 0.18  JSD 0.864  n 210 / 47  shared: {here, host} {city, town, cities, town, unknown, …} {Santiago, Manila, Havana}
(Location $e $x)
(Source $e $x)

;; Agent ~ Stimulus  cosine 0.18  JSD 0.89  n 888 / 34  shared: {Jessica, Linda, Beth, Katherine, …} {thing, things, stuff, practice, thing} {child, children, kid, baby, …}
(Agent $e $x)
(Stimulus $e $x)

;; Theme ~ To  cosine 0.17  JSD 0.896  n 594 / 46  shared: {thing, things, stuff, practice, thing} {talk, conversation, discussion} {computer, machine}
(Theme $e $x)
(To $e $x)

;; Goal ~ Source  cosine 0.16  JSD 0.859  n 93 / 47  shared: {city, town, cities, town, unknown, …} {here, host} {school, university, campus, college, …}
(Goal $e $x)
(Source $e $x)

;; Manner ~ Result  cosine 0.15  JSD 0.897  n 115 / 43  shared: {use, well, direct, do, …} {together, come together} {effective, affect, effect, effectively}
(Manner $e $x)
(Result $e $x)

;; Recipient ~ Theme  cosine 0.15  JSD 0.913  n 29 / 594  shared: {person, people} {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
(Recipient $e $x)
(Theme $e $x)

;; Patient ~ Recipient  cosine 0.15  JSD 0.928  n 455 / 29  shared: {person, people} {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
(Patient $e $x)
(Recipient $e $x)

;; Holder ~ Stimulus  cosine 0.14  JSD 0.892  n 48 / 34  shared: {thing, things, stuff, practice, thing} {author, writer, novelist} {food, eat}
(Holder $e $x)
(Stimulus $e $x)

;; Experiencer ~ Stimulus  cosine 0.13  JSD 0.902  n 261 / 34  shared: {thing, things, stuff, practice, thing} {child, children, kid, baby, …} {Jessica, Linda, Beth, Katherine, …}
(Experiencer $e $x)
(Stimulus $e $x)

;; Goal ~ Holder  cosine 0.13  JSD 0.888  n 93 / 48  shared: {house, home, comfortable, house, houses, …} {city, town, cities, town, unknown, …} {place, places, easy, place, full, place}
(Goal $e $x)
(Holder $e $x)

;; Goal ~ Theme  cosine 0.12  JSD 0.903  n 93 / 594  shared: {house, home, comfortable, house, houses, …} {Jessica, Linda, Beth, Katherine, …} {Baltimore, Boston, San Francisco, Springfield}
(Goal $e $x)
(Theme $e $x)

;; Experiencer ~ Result  cosine 0.11  JSD 0.882  n 261 / 43  shared: {bad, bad, relationship, bad, matter, bad, problem} {indigenous, indigenous, people, native american, indigenous american, …} {unlocked, locked, lock, door, locked}
(Experiencer $e $x)
(Result $e $x)

;; Holder ~ Source  cosine 0.11  JSD 0.895  n 48 / 47  shared: {city, town, cities, town, unknown, …} {place, places, easy, place, full, place} {room, changing room, rooms}
(Holder $e $x)
(Source $e $x)

;; Goal ~ Patient  cosine 0.11  JSD 0.884  n 93 / 455  shared: {house, home, comfortable, house, houses, …} {tree, trees, treetop} {room, changing room, rooms}
(Goal $e $x)
(Patient $e $x)

;; Patient ~ To  cosine 0.11  JSD 0.933  n 455 / 46  shared: {thing, things, stuff, practice, thing} {computer, machine} {bake, bakery, bread}
(Patient $e $x)
(To $e $x)

;; Patient ~ Source  cosine 0.10  JSD 0.916  n 455 / 47  shared: {tree, trees, treetop} {room, changing room, rooms} {city, town, cities, town, unknown, …}
(Patient $e $x)
(Source $e $x)

;; For ~ Theme  cosine 0.10  JSD 0.933  n 39 / 594  shared: {work, job, work through, hard, work} {portray, portrait, portrayal} {ship, british ship, israeli military ship, merchant ship, …}
(For $e $x)
(Theme $e $x)

;; Patient ~ Result  cosine 0.10  JSD 0.918  n 455 / 43  shared: {bad, bad, relationship, bad, matter, bad, problem} {snow, cold, frost, snowstorm, …} {indigenous, indigenous, people, native american, indigenous american, …}
(Patient $e $x)
(Result $e $x)

;; Source ~ Theme  cosine 0.10  JSD 0.903  n 47 / 594  shared: {view, views, common, view, public, view, …} {food, eat} {cave, hole, lair, burrow}
(Source $e $x)
(Theme $e $x)

;; Goal ~ Recipient  cosine 0.10  JSD 0.913  n 93 / 29  shared: {city, town, cities, town, unknown, …} {Jessica, Linda, Beth, Katherine, …} {class, classroom}
(Goal $e $x)
(Recipient $e $x)

;; Recipient ~ Stimulus  cosine 0.09  JSD 0.913  n 29 / 34  shared: {Jessica, Linda, Beth, Katherine, …} {child, children, kid, baby, …}
(Recipient $e $x)
(Stimulus $e $x)

;; Location ~ Patient  cosine 0.09  JSD 0.891  n 210 / 455  shared: {door, back door, door, open, door, unlocked, …} {table} {house, home, comfortable, house, houses, …}
(Location $e $x)
(Patient $e $x)

;; Stimulus ~ To  cosine 0.09  JSD 0.94  n 34 / 46  shared: {thing, things, stuff, practice, thing}
(Stimulus $e $x)
(To $e $x)

;; Holder ~ Location  cosine 0.09  JSD 0.907  n 48 / 210  shared: {city, town, cities, town, unknown, …} {house, home, comfortable, house, houses, …} {place, places, easy, place, full, place}
(Holder $e $x)
(Location $e $x)

;; Experiencer ~ Goal  cosine 0.09  JSD 0.898  n 261 / 93  shared: {house, home, comfortable, house, houses, …} {Jessica, Linda, Beth, Katherine, …} {Algeria, Afghanistan, Iran, Morocco, …}
(Experiencer $e $x)
(Goal $e $x)

;; Goal ~ Result  cosine 0.08  JSD 0.918  n 93 / 43  shared: {sleep, bed} {use, well, direct, do, …} {snow, cold, frost, snowstorm, …}
(Goal $e $x)
(Result $e $x)

;; Agent ~ Goal  cosine 0.07  JSD 0.916  n 888 / 93  shared: {Jessica, Linda, Beth, Katherine, …} {house, home, comfortable, house, houses, …} {sleep, bed}
(Agent $e $x)
(Goal $e $x)

;; Experiencer ~ Location  cosine 0.07  JSD 0.904  n 261 / 210  shared: {house, home, comfortable, house, houses, …} {Europe, Western Europe} {Kazakhstan, North Korea}
(Experiencer $e $x)
(Location $e $x)

;; Agent ~ To  cosine 0.06  JSD 0.937  n 888 / 46  shared: {thing, things, stuff, practice, thing} {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb} {doctor, doctors}
(Agent $e $x)
(To $e $x)

;; Location ~ Theme  cosine 0.06  JSD 0.9  n 210 / 594  shared: {house, home, comfortable, house, houses, …} {city, town, cities, town, unknown, …} {station, Springfield Station}
(Location $e $x)
(Theme $e $x)

;; Holder ~ To  cosine 0.06  JSD 0.936  n 48 / 46  shared: {thing, things, stuff, practice, thing} {repeat, repetition}
(Holder $e $x)
(To $e $x)

;; Goal ~ Manner  cosine 0.05  JSD 0.95  n 93 / 115  shared: {use, well, direct, do, …} {former, back, early, backward, …} {happiness, happy, happily, joy}
(Goal $e $x)
(Manner $e $x)

;; For ~ Goal  cosine 0.05  JSD 0.951  n 39 / 93  shared: {sleep, bed} {happiness, happy, happily, joy}
(For $e $x)
(Goal $e $x)

;; Instrument ~ Source  cosine 0.04  JSD 0.95  n 34 / 47  shared: {road, way, lane, motorway, …} {food, eat}
(Instrument $e $x)
(Source $e $x)

;; Recipient ~ Source  cosine 0.04  JSD 0.962  n 29 / 47  shared: {city, town, cities, town, unknown, …}
(Recipient $e $x)
(Source $e $x)

;; Experiencer ~ In  cosine 0.04  JSD 0.944  n 261 / 50  shared: {weather, bad, weather} {silent, silence, forest, silent} {action, activity, active, act, …}
(Experiencer $e $x)
(In $e $x)

;; Experiencer ~ Source  cosine 0.04  JSD 0.945  n 261 / 47  shared: {place, places, easy, place, full, place} {view, views, common, view, public, view, …} {ceiling, black, ceiling}
(Experiencer $e $x)
(Source $e $x)

;; Experiencer ~ To  cosine 0.04  JSD 0.956  n 261 / 46  shared: {thing, things, stuff, practice, thing} {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb} {doctor, doctors}
(Experiencer $e $x)
(To $e $x)

;; In ~ Patient  cosine 0.04  JSD 0.948  n 50 / 455  shared: {community, society} {weather, bad, weather} {silent, silence, forest, silent}
(In $e $x)
(Patient $e $x)

;; Manner ~ Time  cosine 0.04  JSD 0.906  n 115 / 107  shared: {late, later, let, last, …} {immediately, instantly, next instant, right away} {former, back, early, backward, …}
(Manner $e $x)
(Time $e $x)

;; Instrument ~ Patient  cosine 0.04  JSD 0.955  n 34 / 455  shared: {snow, cold, frost, snowstorm, …} {road, way, lane, motorway, …} {ticket, issue, bug, tickets}
(Instrument $e $x)
(Patient $e $x)

;; Holder ~ Recipient  cosine 0.04  JSD 0.962  n 48 / 29  shared: {city, town, cities, town, unknown, …}
(Holder $e $x)
(Recipient $e $x)

;; Location ~ Manner  cosine 0.03  JSD 0.962  n 210 / 115  shared: {use, well, direct, do, …} {world, international, global, internationally} {dark, darkness, dimly}
(Location $e $x)
(Manner $e $x)

;; Location ~ Recipient  cosine 0.03  JSD 0.964  n 210 / 29  shared: {city, town, cities, town, unknown, …} {local, local level, locals}
(Location $e $x)
(Recipient $e $x)

;; Instrument ~ Theme  cosine 0.03  JSD 0.965  n 34 / 594  shared: {food, eat} {drum, snare, drums} {ticket, issue, bug, tickets}
(Instrument $e $x)
(Theme $e $x)

;; For ~ Result  cosine 0.03  JSD 0.951  n 39 / 43  shared: {beautiful, beauty, gorgeous, pretty} {sleep, bed}
(For $e $x)
(Result $e $x)

;; In ~ Theme  cosine 0.03  JSD 0.965  n 50 / 594  shared: {understand, misunderstand} {truth, fact, true, really, …} {action, activity, active, act, …}
(In $e $x)
(Theme $e $x)

;; Agent ~ Location  cosine 0.03  JSD 0.932  n 888 / 210  shared: {here, host} {Santiago, Manila, Havana} {France, French Dahomey}
(Agent $e $x)
(Location $e $x)

;; Agent ~ Source  cosine 0.03  JSD 0.957  n 888 / 47  shared: {Santiago, Manila, Havana} {plane, flight, aeroplane, airplane, …} {here, host}
(Agent $e $x)
(Source $e $x)

;; In ~ Result  cosine 0.03  JSD 0.97  n 50 / 43  shared: {silent, silence, forest, silent}
(In $e $x)
(Result $e $x)

;; Result ~ Theme  cosine 0.03  JSD 0.965  n 43 / 594  shared: {sleep, bed} {use, well, direct, do, …} {cheap, inexpensive, low, price}
(Result $e $x)
(Theme $e $x)

;; Goal ~ In  cosine 0.03  JSD 0.957  n 93 / 50  shared: {road, way, lane, motorway, …} {community, society} {field, fields}
(Goal $e $x)
(In $e $x)

;; Goal ~ Stimulus  cosine 0.02  JSD 0.975  n 93 / 34  shared: {Jessica, Linda, Beth, Katherine, …}
(Goal $e $x)
(Stimulus $e $x)

;; Manner ~ Theme  cosine 0.02  JSD 0.976  n 115 / 594  shared: {use, well, direct, do, …} {truth, fact, true, really, …} {widespread, widely, wide, attention, widespread, …}
(Manner $e $x)
(Theme $e $x)

;; Goal ~ Instrument  cosine 0.02  JSD 0.966  n 93 / 34  shared: {snow, cold, frost, snowstorm, …} {road, way, lane, motorway, …}
(Goal $e $x)
(Instrument $e $x)

;; Instrument ~ Recipient  cosine 0.02  JSD 0.968  n 34 / 29  shared: {crop, rice crop, corn, crops}
(Instrument $e $x)
(Recipient $e $x)

;; Instrument ~ Stimulus  cosine 0.02  JSD 0.971  n 34 / 34  shared: {food, eat}
(Instrument $e $x)
(Stimulus $e $x)

;; Agent ~ Instrument  cosine 0.02  JSD 0.965  n 888 / 34  shared: {Mark, marker, markers} {snow, cold, frost, snowstorm, …} {train}
(Agent $e $x)
(Instrument $e $x)

;; Source ~ Stimulus  cosine 0.02  JSD 0.975  n 47 / 34  shared: {food, eat}
(Source $e $x)
(Stimulus $e $x)

;; In ~ Location  cosine 0.02  JSD 0.972  n 50 / 210  shared: {mat, mathematics} {water, water source, clear, water, good, water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; Instrument ~ Result  cosine 0.02  JSD 0.974  n 34 / 43  shared: {snow, cold, frost, snowstorm, …}
(Instrument $e $x)
(Result $e $x)

;; Agent ~ Result  cosine 0.02  JSD 0.968  n 888 / 43  shared: {indigenous, indigenous, people, native american, indigenous american, …} {crow, eagle, stork, caw} {snow, cold, frost, snowstorm, …}
(Agent $e $x)
(Result $e $x)

;; Holder ~ Instrument  cosine 0.02  JSD 0.975  n 48 / 34  shared: {food, eat}
(Holder $e $x)
(Instrument $e $x)

;; Agent ~ For  cosine 0.02  JSD 0.966  n 888 / 39  shared: {bus, bus ride} {cook, recipe} {ship, british ship, israeli military ship, merchant ship, …}
(Agent $e $x)
(For $e $x)

;; Experiencer ~ Instrument  cosine 0.02  JSD 0.974  n 261 / 34  shared: {train} {road, way, lane, motorway, …} {crop, rice crop, corn, crops}
(Experiencer $e $x)
(Instrument $e $x)

;; In ~ Stimulus  cosine 0.02  JSD 0.976  n 50 / 34  shared: {poetry}
(In $e $x)
(Stimulus $e $x)

;; Location ~ Result  cosine 0.02  JSD 0.979  n 210 / 43  shared: {use, well, direct, do, …} {snow, cold, frost, snowstorm, …}
(Location $e $x)
(Result $e $x)

;; Location ~ To  cosine 0.02  JSD 0.978  n 210 / 46  shared: {talk, conversation, discussion} {shore, beach, coast, shoreline}
(Location $e $x)
(To $e $x)

;; Result ~ Source  cosine 0.02  JSD 0.978  n 43 / 47  shared: {bat}
(Result $e $x)
(Source $e $x)

;; Experiencer ~ Manner  cosine 0.02  JSD 0.964  n 261 / 115  shared: {widespread, widely, wide, attention, widespread, …} {truth, fact, true, really, …} {poor, man, poor, poorly}
(Experiencer $e $x)
(Manner $e $x)

;; For ~ Manner  cosine 0.02  JSD 0.965  n 39 / 115  shared: {around, ring, round} {happiness, happy, happily, joy}
(For $e $x)
(Manner $e $x)

;; In ~ Instrument  cosine 0.02  JSD 0.976  n 50 / 34  shared: {road, way, lane, motorway, …}
(In $e $x)
(Instrument $e $x)

;; Experiencer ~ Time  cosine 0.01  JSD 0.979  n 261 / 107  shared: {night, tonight, night shift, midnight, …} {day, days, days, short, one day}
(Experiencer $e $x)
(Time $e $x)

;; In ~ Source  cosine 0.01  JSD 0.979  n 50 / 47  shared: {road, way, lane, motorway, …}
(In $e $x)
(Source $e $x)

;; Experiencer ~ For  cosine 0.01  JSD 0.975  n 261 / 39  shared: {happiness, happy, happily, joy} {general, generalization, general purpose, easy, generalization} {nothing, no, almost nothing, empty, …}
(Experiencer $e $x)
(For $e $x)

;; In ~ Manner  cosine 0.01  JSD 0.977  n 50 / 115  shared: {truth, fact, true, really, …}
(In $e $x)
(Manner $e $x)

;; Patient ~ Time  cosine 0.01  JSD 0.97  n 455 / 107  shared: {night, tonight, night shift, midnight, …} {storm, soon, thunder} {hour, hour, late, hours}
(Patient $e $x)
(Time $e $x)

;; For ~ In  cosine 0.01  JSD 0.977  n 39 / 50  shared: {nothing, no, almost nothing, empty, …}
(For $e $x)
(In $e $x)

;; For ~ Patient  cosine 0.01  JSD 0.978  n 39 / 455  shared: {liftoff, lift, lift, other} {ship, british ship, israeli military ship, merchant ship, …} {call, telephone call, call for}
(For $e $x)
(Patient $e $x)

;; Holder ~ In  cosine 0.01  JSD 0.98  n 48 / 50  shared: {weather, bad, weather}
(Holder $e $x)
(In $e $x)

;; Instrument ~ Location  cosine 0.01  JSD 0.98  n 34 / 210  shared: {snow, cold, frost, snowstorm, …} {plant, bushes, plants}
(Instrument $e $x)
(Location $e $x)

;; Agent ~ Manner  cosine 0.01  JSD 0.992  n 888 / 115  shared: {use, well, direct, do, …} {truth, fact, true, really, …}
(Agent $e $x)
(Manner $e $x)

;; Manner ~ Patient  cosine 0.01  JSD 0.986  n 115 / 455  shared: {whole, full, entire, fully, …} {poor, man, poor, poorly} {world, international, global, internationally}
(Manner $e $x)
(Patient $e $x)

;; Manner ~ Stimulus  cosine 0.01  JSD 0.985  n 115 / 34  shared: {difficult, hard, difficulty, harder}
(Manner $e $x)
(Stimulus $e $x)

;; Agent ~ In  cosine 0.01  JSD 0.985  n 888 / 50  shared: {community, society} {life, life experience} {truth, fact, true, really, …}
(Agent $e $x)
(In $e $x)

;; Location ~ Time  cosine 0.01  JSD 0.989  n 210 / 107  shared: {morning, dawn, early morning, morning light, …}
(Location $e $x)
(Time $e $x)

;; Goal ~ Time  cosine 0.00  JSD 0.986  n 93 / 107  shared: {former, back, early, backward, …}
(Goal $e $x)
(Time $e $x)

;; Source ~ Time  cosine 0.00  JSD 0.986  n 47 / 107  shared: {point, point out, indicate, mention}
(Source $e $x)
(Time $e $x)

;; Theme ~ Time  cosine 0.00  JSD 0.989  n 594 / 107  shared: {morning, dawn, early morning, morning light, …} {day, days, days, short, one day}
(Theme $e $x)
(Time $e $x)

;; Agent ~ Time  cosine 0.00  JSD 0.985  n 888 / 107  shared: {hurricane, typhoon, hurricane season} {storm, soon, thunder} {spring}
(Agent $e $x)
(Time $e $x)

;; For ~ Holder  cosine 0.00  JSD 1.0  n 39 / 48  shared: 
(For $e $x)
(Holder $e $x)

;; For ~ Instrument  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Instrument $e $x)

;; For ~ Location  cosine 0.00  JSD 1.0  n 39 / 210  shared: 
(For $e $x)
(Location $e $x)

;; For ~ Recipient  cosine 0.00  JSD 1.0  n 39 / 29  shared: 
(For $e $x)
(Recipient $e $x)

;; For ~ Source  cosine 0.00  JSD 1.0  n 39 / 47  shared: 
(For $e $x)
(Source $e $x)

;; For ~ Stimulus  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Stimulus $e $x)

;; For ~ Time  cosine 0.00  JSD 1.0  n 39 / 107  shared: 
(For $e $x)
(Time $e $x)

;; For ~ To  cosine 0.00  JSD 1.0  n 39 / 46  shared: 
(For $e $x)
(To $e $x)

;; Goal ~ To  cosine 0.00  JSD 1.0  n 93 / 46  shared: 
(Goal $e $x)
(To $e $x)

;; Holder ~ Manner  cosine 0.00  JSD 1.0  n 48 / 115  shared: 
(Holder $e $x)
(Manner $e $x)

;; Holder ~ Result  cosine 0.00  JSD 1.0  n 48 / 43  shared: 
(Holder $e $x)
(Result $e $x)

;; Holder ~ Time  cosine 0.00  JSD 1.0  n 48 / 107  shared: 
(Holder $e $x)
(Time $e $x)

;; In ~ Recipient  cosine 0.00  JSD 1.0  n 50 / 29  shared: 
(In $e $x)
(Recipient $e $x)

;; In ~ Time  cosine 0.00  JSD 1.0  n 50 / 107  shared: 
(In $e $x)
(Time $e $x)

;; In ~ To  cosine 0.00  JSD 1.0  n 50 / 46  shared: 
(In $e $x)
(To $e $x)

;; Instrument ~ Manner  cosine 0.00  JSD 1.0  n 34 / 115  shared: 
(Instrument $e $x)
(Manner $e $x)

;; Instrument ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Instrument $e $x)
(Time $e $x)

;; Instrument ~ To  cosine 0.00  JSD 1.0  n 34 / 46  shared: 
(Instrument $e $x)
(To $e $x)

;; Location ~ Stimulus  cosine 0.00  JSD 1.0  n 210 / 34  shared: 
(Location $e $x)
(Stimulus $e $x)

;; Manner ~ Recipient  cosine 0.00  JSD 1.0  n 115 / 29  shared: 
(Manner $e $x)
(Recipient $e $x)

;; Manner ~ Source  cosine 0.00  JSD 1.0  n 115 / 47  shared: 
(Manner $e $x)
(Source $e $x)

;; Manner ~ To  cosine 0.00  JSD 1.0  n 115 / 46  shared: 
(Manner $e $x)
(To $e $x)

;; Recipient ~ Result  cosine 0.00  JSD 1.0  n 29 / 43  shared: 
(Recipient $e $x)
(Result $e $x)

;; Recipient ~ Time  cosine 0.00  JSD 1.0  n 29 / 107  shared: 
(Recipient $e $x)
(Time $e $x)

;; Recipient ~ To  cosine 0.00  JSD 1.0  n 29 / 46  shared: 
(Recipient $e $x)
(To $e $x)

;; Result ~ Stimulus  cosine 0.00  JSD 1.0  n 43 / 34  shared: 
(Result $e $x)
(Stimulus $e $x)

;; Result ~ Time  cosine 0.00  JSD 1.0  n 43 / 107  shared: 
(Result $e $x)
(Time $e $x)

;; Result ~ To  cosine 0.00  JSD 1.0  n 43 / 46  shared: 
(Result $e $x)
(To $e $x)

;; Source ~ To  cosine 0.00  JSD 1.0  n 47 / 46  shared: 
(Source $e $x)
(To $e $x)

;; Stimulus ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Stimulus $e $x)
(Time $e $x)

;; Time ~ To  cosine 0.00  JSD 1.0  n 107 / 46  shared: 
(Time $e $x)
(To $e $x)

;; ==================== subtree @ cluster cos 0.80: slot pairs (3 event-center signals) ====================

;; [same role, different class]  accompany.Agent ~ appear.Agent  cosine 0.76  JSD 0.23  n 4 / 6  shared: {sister, sisters} {person, people}
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000050 tierC-000259
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; [same role, different class]  appear.Agent ~ replace.Agent  cosine 0.76  JSD 0.251  n 6 / 4  shared: {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …} {person, people}
;;   A e.g. tierC-000259 tierC-000260   B e.g. tierC-000359 tierC-000360
(And (Member $e0 appear) (Agent $e0 $x1))
(And (Member $e0 replace) (Agent $e0 $x1))

;; [different class and role]  die.Patient ~ sleep.Agent  cosine 0.99  JSD 0.006  n 4 / 3  shared: {person, people} {family, family business, families}
;;   A e.g. tierB-001967 tierC-000199   B e.g. tierC-000041 tierC-000042
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 sleep) (Agent $e0 $x1))

;; ==================== subtree @ cluster cos 0.80: compared slots with their distributions (269 slots, n >= 3) ====================

;; ---- slot <unclassed>.LocatedIn  [entity center]  n 46  clusters 38
(LocatedIn $x0 $x1)
;;     c1678  mass 3  {here, host}
;;      c157  mass 2  {city, town, cities, town, unknown, …}
;;      c159  mass 2  {southern}
;;       c27  mass 2  {Loglan, Lojban}
;;      c596  mass 2  {class, classroom}
;;      c623  mass 2  {island, Derwent Isle}
;;      c777  mass 2  {garden, beautiful, garden}
;;     c1088  mass 1  {ceiling, black, ceiling}
;;     c1089  mass 1  {floor, wood floor}
;;     c1095  mass 1  {wall, cold, wall}
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1103  mass 1  {place, places, easy, place, full, place}
;;     c1107  mass 1  {storehouse, storeroom}
;;     c1144  mass 1  {fountain, fountain, full}
;;     c1191  mass 1  {table}
;;     c1372  mass 1  {play}
;;      c165  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}
;;      c166  mass 1  {El Harrach, El Harrach River}
;;      c177  mass 1  {Crimea, Russian Far East, Siberia}
;;      c182  mass 1  {Colombia, Brazil, Cuba, Peru, …}
;;      c183  mass 1  {India, Indonesia}
;;      c184  mass 1  {Japan, China}
;;      c190  mass 1  {Gaul}
;;      c191  mass 1  {England, Scotland, UK}
;;      c202  mass 1  {movie, film}
;;      c282  mass 1  {market}
;;      c393  mass 1  {world, international, global, internationally}
;;      c434  mass 1  {park, parking lot, parking}
;;      c442  mass 1  {street, road, street, entire, street}
;;      c602  mass 1  {lake, Lake Towada, Dianchi Lake, Lake Akan, …}
;;      c610  mass 1  {Huancavelica}
;;      c621  mass 1  {sea, ocean, ocean, vast}
;;      c729  mass 1  {full, kitchen sink}
;;      c771  mass 1  {village, villager, villagers}
;;      c793  mass 1  {tree, trees, treetop}
;;      c843  mass 1  {basket, bask, basket, red}
;;      c943  mass 1  {country, backward, country}
;;      c968  mass 1  {Tatoeba}

;; ---- slot have.Holder  [event center]  n 44  clusters 36
(And (Member $e0 have) (Holder $e0 $x1))
;;      c520  mass 4  {Karl, Kristoffer}
;;      c157  mass 2  {city, town, cities, town, unknown, …}
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;      c539  mass 2  {Karen, Kalman, Kerr, Ken}
;;      c563  mass 2  {homentropic current, homentropic flow}
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1101  mass 1  {castle, tower}
;;     c1103  mass 1  {place, places, easy, place, full, place}
;;     c1104  mass 1  {hotel}
;;     c1116  mass 1  {room, changing room, rooms}
;;     c1157  mass 1  {weather, bad, weather}
;;     c1320  mass 1  {february}
;;      c164  mass 1  {mozabite, tuareg, Beja, mozabites, …}
;;      c165  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}
;;     c1752  mass 1  {decide, decision, choose, option}
;;     c1764  mass 1  {repeat, repetition}
;;      c181  mass 1  {Algeria, Afghanistan, Iran, Morocco, …}
;;      c191  mass 1  {England, Scotland, UK}
;;      c202  mass 1  {movie, film}
;;      c217  mass 1  {mosque, mosque, old}
;;      c273  mass 1  {insurance}
;;      c372  mass 1  {book, library, books}
;;      c374  mass 1  {author, writer, novelist}
;;      c388  mass 1  {lawyer}
;;      c433  mass 1  {gas station, gas pump, gas pumps}
;;      c494  mass 1  {Wilson, wilson}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c525  mass 1  {Boldi, Bruno, Felix, Maurice, …}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c621  mass 1  {sea, ocean, ocean, vast}
;;      c753  mass 1  {food, eat}
;;      c782  mass 1  {Ivy, ivy}
;;      c809  mass 1  {creature, enemy, monster}
;;      c967  mass 1  {sentence, english sentence, sentences}
;;      c971  mass 1  {word, word processor}

;; ---- slot have.Theme  [event center]  n 43  clusters 38
(And (Member $e0 have) (Theme $e0 $x1))
;;      c921  mass 4  {child, children, kid, baby, …}
;;     c1664  mass 2  {representation, refer, represent, refuse, …}
;;      c881  mass 2  {entropy, constant, entropy, uniform}
;;     c1015  mass 1  {nasty, nasty, personality}
;;     c1028  mass 1  {eerie, eerie, feeling}
;;     c1030  mass 1  {dream, dream, weird}
;;     c1086  mass 1  {roof, conical, roof}
;;     c1122  mass 1  {curtain, blue, curtain, curtains}
;;     c1238  mass 1  {homely, atmosphere, homely}
;;     c1281  mass 1  {valuable, worth, value}
;;     c1285  mass 1  {reputation}
;;     c1334  mass 1  {day, days, days, short, one day}
;;     c1455  mass 1  {chance, fortune}
;;     c1469  mass 1  {color}
;;     c1579  mass 1  {mean, meaning, means, meanings}
;;     c1587  mass 1  {effective, affect, effect, effectively}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;     c1649  mass 1  {purpose, purpose, single}
;;     c1654  mass 1  {right}
;;     c1657  mass 1  {consider, thought, consideration, mull over, …}
;;     c1775  mass 1  {consequences, serious, wide}
;;       c19  mass 1  {bank, documents, valuable}
;;      c212  mass 1  {cemetery, cemetery chapel, tomb, cemeteries}
;;      c236  mass 1  {history, history, rich}
;;      c272  mass 1  {deductible, deductible, high}
;;      c396  mass 1  {internal politics, internal politics, intriguing}
;;      c433  mass 1  {gas station, gas pump, gas pumps}
;;      c459  mass 1  {guard, bodyguard, guards}
;;      c576  mass 1  {parenthetic, parenthetic, style}
;;       c63  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;      c704  mass 1  {flavor, taste test, taste, nice, taste, …}
;;      c777  mass 1  {garden, beautiful, garden}
;;      c778  mass 1  {leaf, foliage, leaves}
;;      c798  mass 1  {predictable, plot, predictable}
;;      c830  mass 1  {antler, antlers}
;;      c833  mass 1  {herd, herds}
;;      c902  mass 1  {friend, friends, friend, good}
;;      c995  mass 1  {soul piercing, soul piercing, stare}

;; ---- slot <unclassed>.Possession  [entity center]  n 30  clusters 16
(Possession $x0 $x1)
;;      c385  mass 8  {Free Soil Party, Republican Party}
;;      c897  mass 5  {person, people}
;;      c216  mass 2  {sunni community, sunni, communities, neighbouring, other, sunni, sunni communities}
;;      c256  mass 2  {subsequent game}
;;      c573  mass 2  {logic, logical phrase, logical proposition}
;;      c123  mass 1  {Yunnan, Chongqing}
;;     c1413  mass 1  {general, generalization, general purpose, easy, generalization}
;;     c1592  mass 1  {junction, union, join, jointly}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c344  mass 1  {islamic ivory, ivory}
;;      c454  mass 1  {radical group}
;;      c481  mass 1  {God}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c633  mass 1  {Jupiter}
;;      c939  mass 1  {Twilight}
;;      c943  mass 1  {country, backward, country}

;; ---- slot use.Theme  [event center]  n 23  clusters 21
(And (Member $e0 use) (Theme $e0 $x1))
;;        c3  mass 2  {banach mackey topology}
;;        c4  mass 2  {weak arens space topology}
;;     c1116  mass 1  {room, changing room, rooms}
;;     c1136  mass 1  {fire, flame, burn, scorch, …}
;;     c1195  mass 1  {computer, machine}
;;     c1781  mass 1  {public fund}
;;      c237  mass 1  {calendars, various}
;;      c324  mass 1  {chemical agent}
;;      c453  mass 1  {Wagner Group, paramilitary group}
;;       c51  mass 1  {Midway}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c664  mass 1  {jingle}
;;      c675  mass 1  {auto tune, tune}
;;      c717  mass 1  {sugar}
;;       c75  mass 1  {Laravel}
;;       c76  mass 1  {naming convention, current, naming convention}
;;       c77  mass 1  {designation convention, current, designation convention}
;;      c958  mass 1  {metaphor}
;;      c966  mass 1  {phrase, phrases}
;;      c967  mass 1  {sentence, english sentence, sentences}
;;      c971  mass 1  {word, word processor}

;; ---- slot make.Patient  [event center]  n 20  clusters 20
(And (Member $e0 make) (Patient $e0 $x1))
;;     c1044  mass 1  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1117  mass 1  {beautiful, room}
;;     c1153  mass 1  {snowman, big, snowman}
;;     c1275  mass 1  {buy, purchase}
;;     c1417  mass 1  {copy, copes, copies}
;;     c1510  mass 1  {claim, appeal, claims}
;;     c1576  mass 1  {difference, different, distinction, distinguish, …}
;;     c1577  mass 1  {big, difference}
;;      c181  mass 1  {Algeria, Afghanistan, Iran, Morocco, …}
;;      c364  mass 1  {paper, paper factory, paper mill, paper sheet, …}
;;      c483  mass 1  {Augustus, Appius Claudius Crassus}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;       c54  mass 1  {call, telephone call, call for}
;;      c644  mass 1  {travel}
;;      c654  mass 1  {high pitched, high pitched, noise}
;;      c668  mass 1  {clicking, clicking, sound}
;;      c708  mass 1  {cup, plastic cup}
;;      c746  mass 1  {chicken, chicken fried steak}
;;      c997  mass 1  {eye contact}

;; ---- slot build.Patient  [event center]  n 18  clusters 8
(And (Member $e0 build) (Patient $e0 $x1))
;;     c1104  mass 4  {hotel}
;;      c364  mass 4  {paper, paper factory, paper mill, paper sheet, …}
;;     c1116  mass 3  {room, changing room, rooms}
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;     c1705  mass 2  {head, horn, hat}
;;     c1208  mass 1  {network, wells}
;;      c251  mass 1  {playground, new, playground}
;;       c45  mass 1  {turing machine, original, turing machine}

;; ---- slot make.Agent  [event center]  n 18  clusters 16
(And (Member $e0 make) (Agent $e0 $x1))
;;      c521  mass 2  {David, William, James}
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;     c1122  mass 1  {curtain, blue, curtain, curtains}
;;     c1151  mass 1  {wind, gusty, gusty, winds}
;;     c1265  mass 1  {artistic beauty}
;;     c1415  mass 1  {practical utility}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c452  mass 1  {Hezbollah, Taliban}
;;      c483  mass 1  {Augustus, Appius Claudius Crassus}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}
;;       c57  mass 1  {customer, customers}
;;      c722  mass 1  {restaurant, diner, packed, restaurant}
;;      c806  mass 1  {cat, cats}
;;      c908  mass 1  {man, guy, man, old}
;;      c919  mass 1  {boy, boys}

;; ---- slot go.Agent  [event center]  n 15  clusters 12
(And (Member $e0 go) (Agent $e0 $x1))
;;      c507  mass 4  {Jessica, Linda, Beth, Katherine, …}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c519  mass 1  {Matthew}
;;      c524  mass 1  {Donald, Harvey}
;;      c531  mass 1  {Mennad, Ziri, Lessos, Malaleel, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c538  mass 1  {Dan, Daniel}
;;      c539  mass 1  {Karen, Kalman, Kerr, Ken}
;;      c591  mass 1  {pupil, pupils}
;;      c806  mass 1  {cat, cats}
;;      c904  mass 1  {Mom, mother, grandmother, parent, …}
;;      c921  mass 1  {child, children, kid, baby, …}

;; ---- slot play.Agent  [event center]  n 15  clusters 8
(And (Member $e0 play) (Agent $e0 $x1))
;;      c462  mass 4  {Boston Red Sox, Cincinnati Reds}
;;      c921  mass 4  {child, children, kid, baby, …}
;;      c502  mass 2  {Audrey Hepburn, Audrey Heppurn}
;;      c111  mass 1  {biology}
;;      c222  mass 1  {religion, church, faith}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c919  mass 1  {boy, boys}

;; ---- slot build.Agent  [event center]  n 14  clusters 5
(And (Member $e0 build) (Agent $e0 $x1))
;;      c861  mass 8  {company, corporation}
;;      c555  mass 2  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c897  mass 2  {person, people}
;;      c164  mass 1  {mozabite, tuareg, Beja, mozabites, …}
;;      c582  mass 1  {community, society}

;; ---- slot find.Location  [event center]  n 14  clusters 10
(And (Member $e0 find) (Location $e0 $x1))
;;      c123  mass 2  {Yunnan, Chongqing}
;;     c1565  mass 2  {bench, base}
;;      c159  mass 2  {southern}
;;      c603  mass 2  {river, tributary, tributaries}
;;      c140  mass 1  {station, Springfield Station}
;;      c175  mass 1  {Europe, Western Europe}
;;      c212  mass 1  {cemetery, cemetery chapel, tomb, cemeteries}
;;      c602  mass 1  {lake, Lake Towada, Dianchi Lake, Lake Akan, …}
;;      c620  mass 1  {desert, Sahara Desert}
;;      c945  mass 1  {west, western}

;; ---- slot <unclassed>.SubsetOf  [entity center]  n 13  clusters 12
(SubsetOf $x0 $x1)
;;      c897  mass 2  {person, people}
;;     c1194  mass 1  {system, window, platform, windows}
;;     c1274  mass 1  {store, shop, shopping, shops}
;;      c144  mass 1  {corner, corners}
;;      c371  mass 1  {mayan book, mayan books}
;;      c414  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c591  mass 1  {pupil, pupils}
;;      c771  mass 1  {village, villager, villagers}
;;      c820  mass 1  {dung beetle, insect, centipede, centipedes, …}
;;       c91  mass 1  {refugee, refugees}
;;      c922  mass 1  {chick, chicks}
;;      c923  mass 1  {girl, girls, girl, little}

;; ---- slot start.Theme  [event center]  n 13  clusters 12
(And (Member $e0 start) (Theme $e0 $x1))
;;     c1719  mass 2  {appear, see, display, show, …}
;;     c1007  mass 1  {vomit}
;;     c1142  mass 1  {cry, pray}
;;     c1371  mass 1  {hear, listen}
;;     c1374  mass 1  {talk, conversation, discussion}
;;     c1446  mass 1  {improve}
;;     c1519  mass 1  {disappear, fade, vanish}
;;     c1608  mass 1  {run out, keep away, run away}
;;     c1712  mass 1  {roll, roller, roll over}
;;      c594  mass 1  {school, university, campus, college, …}
;;      c682  mass 1  {song, sing, chant}
;;        c8  mass 1  {light headed, feel, light headed}

;; ---- slot go.Goal  [event center]  n 12  clusters 9
(And (Member $e0 go) (Goal $e0 $x1))
;;     c1331  mass 4  {sleep, bed}
;;      c101  mass 1  {hospital, emergency room}
;;     c1103  mass 1  {place, places, easy, place, full, place}
;;     c1119  mass 1  {bathroom}
;;      c443  mass 1  {road, way, lane, motorway, …}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c594  mass 1  {school, university, campus, college, …}
;;       c63  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;       c66  mass 1  {supermarket}

;; ---- slot study.Agent  [event center]  n 12  clusters 9
(And (Member $e0 study) (Agent $e0 $x1))
;;      c897  mass 3  {person, people}
;;       c43  mass 2  {scientist, scientists}
;;       c38  mass 1  {forensics researcher, forensics researchers}
;;      c482  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c512  mass 1  {Peter, Paul, Paulus}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c529  mass 1  {Fadil, Jamil, Sami}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}

;; ---- slot <unclassed>.PartOf  [entity center]  n 11  clusters 10
(PartOf $x0 $x1)
;;      c470  mass 2  {Khurda Road}
;;      c123  mass 1  {Yunnan, Chongqing}
;;     c1372  mass 1  {play}
;;      c344  mass 1  {islamic ivory, ivory}
;;      c442  mass 1  {street, road, street, entire, street}
;;      c588  mass 1  {student association, student associations}
;;      c741  mass 1  {cake, pastry, pie, hot cake, …}
;;      c782  mass 1  {Ivy, ivy}
;;      c786  mass 1  {plant, bushes, plants}
;;      c837  mass 1  {animal, species, zoo, animals}

;; ---- slot become.Patient  [event center]  n 11  clusters 9
(And (Member $e0 become) (Patient $e0 $x1))
;;     c1044  mass 2  {bad, bad, relationship, bad, matter, bad, problem}
;;       c83  mass 2  {indigenous, indigenous, people, native american, indigenous american, …}
;;     c1293  mass 1  {discipline, discipline, lax}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c383  mass 1  {conservative, conservative, revolutionary}
;;      c508  mass 1  {Lady Ashton}
;;      c509  mass 1  {inomaru, inomaru, person}
;;      c613  mass 1  {earth, red}
;;      c655  mass 1  {intense, intense, noise}

;; ---- slot begin.Agent  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Agent $e0 $x1))
;;      c521  mass 2  {David, William, James}
;;       c83  mass 2  {indigenous, indigenous, people, native american, indigenous american, …}
;;       c86  mass 2  {european american settler, european american settlers, french settler, french settlers}
;;     c1348  mass 1  {rebel, rebels}
;;      c455  mass 1  {legionnaire, legionnaires}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c980  mass 1  {Mark, marker, markers}
;;      c983  mass 1  {crowd, crowd, whole}

;; ---- slot begin.Theme  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Theme $e0 $x1))
;;     c1546  mass 4  {create, construct}
;;     c1038  mass 1  {confess}
;;     c1462  mass 1  {bud, bloom}
;;     c1545  mass 1  {make}
;;     c1698  mass 1  {hang, hang out}
;;     c1722  mass 1  {distribute}
;;      c310  mass 1  {torture}
;;      c993  mass 1  {applaud}

;; ---- slot build.Location  [event center]  n 11  clusters 4
(And (Member $e0 build) (Location $e0 $x1))
;;      c178  mass 4  {Kazakhstan, North Korea}
;;      c122  mass 3  {Eskisehir, Giresun, Istanbul}
;;      c193  mass 3  {Turkey, Cyprus}
;;      c165  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}

;; ---- slot kill.Patient  [event center]  n 11  clusters 6
(And (Member $e0 kill) (Patient $e0 $x1))
;;      c897  mass 6  {person, people}
;;      c457  mass 1  {soldier, guardsman, warrior}
;;      c458  mass 1  {army, soldiers, troop, troops}
;;      c813  mass 1  {zombie, zombies}
;;      c834  mass 1  {gazelle, giraffe, giraffes}
;;      c839  mass 1  {fox, wolf, wild boar, ox, …}

;; ---- slot produce.Patient  [event center]  n 11  clusters 6
(And (Member $e0 produce) (Patient $e0 $x1))
;;      c202  mass 4  {movie, film}
;;      c201  mass 2  {syrian film, film, syrian film, destined, film, syrian film}
;;      c684  mass 2  {album}
;;      c109  mass 1  {insulin}
;;     c1260  mass 1  {mesmerizing, mesmerizing, sheen}
;;      c326  mass 1  {cyanide, harmless, trace}

;; ---- slot start.Patient  [event center]  n 11  clusters 11
(And (Member $e0 start) (Patient $e0 $x1))
;;     c1324  mass 1  {watermelon season}
;;     c1522  mass 1  {crack, cracked}
;;     c1543  mass 1  {knock, kick, kick out}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;        c2  mass 1  {national fibre optic network project}
;;      c349  mass 1  {blue, pockets, sky}
;;      c378  mass 1  {freedom movement, gusher}
;;      c426  mass 1  {truck, wagon}
;;      c634  mass 1  {Milky Way}
;;      c802  mass 1  {dog, dog feed}
;;      c989  mass 1  {concert, concert hall, auditorium}

;; ---- slot find.Theme  [event center]  n 10  clusters 6
(And (Member $e0 find) (Theme $e0 $x1))
;;     c1646  mass 4  {thing, things, stuff, practice, thing}
;;      c430  mass 2  {Couper}
;;      c342  mass 1  {clay figurine, clay figurines}
;;      c364  mass 1  {paper, paper factory, paper mill, paper sheet, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c617  mass 1  {meteorite}

;; ---- slot leave.Agent  [event center]  n 10  clusters 10
(And (Member $e0 leave) (Agent $e0 $x1))
;;       c11  mass 1  {ship, british ship, israeli military ship, merchant ship, …}
;;      c414  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c422  mass 1  {bus, bus ride}
;;      c427  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c517  mass 1  {Michael, Marco, Marcus}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c551  mass 1  {Jon Bon Jovi, Sambora, Brian}
;;      c897  mass 1  {person, people}

;; ---- slot serve.Agent  [event center]  n 10  clusters 8
(And (Member $e0 serve) (Agent $e0 $x1))
;;      c126  mass 2  {Nelson, Ipswich, Ipswich & Rosewood}
;;      c127  mass 2  {Indooroopilly}
;;      c496  mass 1  {president, person, president}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c554  mass 1  {Yair Stern, Lev L. Spiro, Yitzhak}
;;      c897  mass 1  {person, people}
;;      c904  mass 1  {Mom, mother, grandmother, parent, …}
;;      c937  mass 1  {paradise, Rosewood}

;; ---- slot take.Theme  [event center]  n 10  clusters 9
(And (Member $e0 take) (Theme $e0 $x1))
;;      c896  mass 2  {identity, identify}
;;     c1169  mass 1  {portray, portrait, portrayal}
;;     c1401  mass 1  {strong, powerful, force, power}
;;     c1403  mass 1  {drastic, drastic, measures}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;     c1712  mass 1  {roll, roller, roll over}
;;     c1763  mass 1  {close, look}
;;     c1765  mass 1  {while}
;;      c859  mass 1  {office}

;; ---- slot try.Agent  [event center]  n 10  clusters 10
(And (Member $e0 try) (Agent $e0 $x1))
;;      c132  mass 1  {Santiago, Manila, Havana}
;;      c521  mass 1  {David, William, James}
;;      c525  mass 1  {Boldi, Bruno, Felix, Maurice, …}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c628  mass 1  {alien}
;;      c832  mass 1  {crocodile, snake}
;;      c861  mass 1  {company, corporation}
;;      c917  mass 1  {man, young}
;;      c980  mass 1  {Mark, marker, markers}

;; ---- slot write.Patient  [event center]  n 10  clusters 7
(And (Member $e0 write) (Patient $e0 $x1))
;;     c1213  mass 2  {episode}
;;      c682  mass 2  {song, sing, chant}
;;      c969  mass 2  {screenplay, script}
;;     c1426  mass 1  {letter}
;;      c372  mass 1  {book, library, books}
;;      c895  mass 1  {personality, character}
;;      c967  mass 1  {sentence, english sentence, sentences}

;; ---- slot fall.Patient  [event center]  n 9  clusters 9
(And (Member $e0 fall) (Patient $e0 $x1))
;;     c1065  mass 1  {dead, rotten, tree}
;;     c1155  mass 1  {snow, cold, frost, snowstorm, …}
;;     c1186  mass 1  {scaffolding}
;;     c1521  mass 1  {silent, silence, forest, silent}
;;      c372  mass 1  {book, library, books}
;;      c591  mass 1  {pupil, pupils}
;;      c713  mass 1  {ice, ice cream, ice cone, ice cream cone, …}
;;      c922  mass 1  {chick, chicks}
;;      c976  mass 1  {hush of anticipation}

;; ---- slot follow.Agent  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Agent $e0 $x1))
;;     c1461  mass 2  {bhadala, bhadalas}
;;      c218  mass 2  {muslim, muslim house, muslim community, house, muslim, …}
;;      c443  mass 1  {road, way, lane, motorway, …}
;;      c484  mass 1  {Alexander}
;;      c527  mass 1  {Bailey}
;;      c529  mass 1  {Fadil, Jamil, Sami}
;;      c817  mass 1  {crawling, beast, crawling}

;; ---- slot follow.Theme  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Theme $e0 $x1))
;;      c160  mass 2  {region, regional level, regions}
;;      c234  mass 2  {tradition, traditions}
;;      c504  mass 1  {Layla, Liisa}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c535  mass 1  {Leon, Lukas}
;;      c548  mass 1  {Cowper, Henry Cole}
;;      c624  mass 1  {shore, beach, coast, shoreline}

;; ---- slot hear.Stimulus  [event center]  n 9  clusters 9
(And (Member $e0 hear) (Stimulus $e0 $x1))
;;     c1054  mass 1  {accident, crash}
;;     c1229  mass 1  {shoot, hunter, shot}
;;     c1541  mass 1  {break out, bang, break, burst, …}
;;     c1543  mass 1  {knock, kick, kick out}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;     c1688  mass 1  {start, begin}
;;      c651  mass 1  {barking, barking, growling, noises}
;;      c660  mass 1  {noise, ticking}
;;      c673  mass 1  {upbeat, music, upbeat}

;; ---- slot kill.Agent  [event center]  n 9  clusters 6
(And (Member $e0 kill) (Agent $e0 $x1))
;;     c1147  mass 4  {hurricane, typhoon, hurricane season}
;;      c108  mass 1  {cancer}
;;     c1136  mass 1  {fire, flame, burn, scorch, …}
;;     c1229  mass 1  {shoot, hunter, shot}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c840  mass 1  {bear, beast, lion attack, tiger, …}

;; ---- slot sing.Agent  [event center]  n 9  clusters 7
(And (Member $e0 sing) (Agent $e0 $x1))
;;      c891  mass 2  {sister, sisters}
;;      c897  mass 2  {person, people}
;;      c475  mass 1  {actress, actor}
;;      c521  mass 1  {David, William, James}
;;      c685  mass 1  {Amateur Barbershop Harmony Society}
;;      c826  mass 1  {bird, bird dropping, mother bird, birds}
;;      c855  mass 1  {groups, professional}

;; ---- slot take.Agent  [event center]  n 9  clusters 7
(And (Member $e0 take) (Agent $e0 $x1))
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;      c897  mass 2  {person, people}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c491  mass 1  {Jerry Rawlings}
;;      c496  mass 1  {president, person, president}
;;      c517  mass 1  {Michael, Marco, Marcus}
;;      c744  mass 1  {cook, recipe}

;; ---- slot become.Result  [event center]  n 8  clusters 7
(And (Member $e0 become) (Result $e0 $x1))
;;     c1044  mass 2  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1034  mass 1  {alarmed}
;;     c1344  mass 1  {red, rag, rip, rough, …}
;;      c139  mass 1  {lax}
;;      c383  mass 1  {conservative, conservative, revolutionary}
;;      c509  mass 1  {inomaru, inomaru, person}
;;       c83  mass 1  {indigenous, indigenous, people, native american, indigenous american, …}

;; ---- slot change.Patient  [event center]  n 8  clusters 7
(And (Member $e0 change) (Patient $e0 $x1))
;;     c1157  mass 2  {weather, bad, weather}
;;     c1145  mass 1  {rain, rainwater, fresh, rain}
;;     c1469  mass 1  {color}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c569  mass 1  {mind, mental, mental world}
;;      c599  mass 1  {course}
;;      c898  mass 1  {name}

;; ---- slot hear.Experiencer  [event center]  n 8  clusters 6
(And (Member $e0 hear) (Experiencer $e0 $x1))
;;      c525  mass 2  {Boldi, Bruno, Felix, Maurice, …}
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c521  mass 1  {David, William, James}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c529  mass 1  {Fadil, Jamil, Sami}

;; ---- slot live.Agent  [event center]  n 8  clusters 7
(And (Member $e0 live) (Agent $e0 $x1))
;;      c531  mass 2  {Mennad, Ziri, Lessos, Malaleel, …}
;;      c164  mass 1  {mozabite, tuareg, Beja, mozabites, …}
;;      c518  mass 1  {Mary, Hugo, Maria}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}
;;      c542  mass 1  {Ray Kurtzweil}
;;      c559  mass 1  {Cainan}
;;      c839  mass 1  {fox, wolf, wild boar, ox, …}

;; ---- slot live.Location  [event center]  n 8  clusters 6
(And (Member $e0 live) (Location $e0 $x1))
;;     c1099  mass 2  {house, home, comfortable, house, houses, …}
;;      c195  mass 2  {Germany, Denmark, Norway, Sweden}
;;     c1098  mass 1  {cottage, cottage, isolated, house, isolated}
;;     c1315  mass 1  {group}
;;      c145  mass 1  {southeastern corner}
;;      c155  mass 1  {suburb, neighborhood}

;; ---- slot need.Experiencer  [event center]  n 8  clusters 8
(And (Member $e0 need) (Experiencer $e0 $x1))
;;     c1692  mass 1  {gate}
;;      c181  mass 1  {Algeria, Afghanistan, Iran, Morocco, …}
;;      c520  mass 1  {Karl, Kristoffer}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c553  mass 1  {Yanni}
;;      c758  mass 1  {sauce, soup}
;;      c921  mass 1  {child, children, kid, baby, …}
;;       c98  mass 1  {doctor, doctors}

;; ---- slot open.Patient  [event center]  n 8  clusters 4
(And (Member $e0 open) (Patient $e0 $x1))
;;     c1094  mass 4  {door, back door, door, open, door, unlocked, …}
;;      c386  mass 2  {law, legislation, laws, law, new, …}
;;     c1090  mass 1  {vault like, door, vault like}
;;      c276  mass 1  {bank, banking industry}

;; ---- slot play.Theme  [event center]  n 8  clusters 5
(And (Member $e0 play) (Theme $e0 $x1))
;;     c1433  mass 2  {role, crucial, role, important, role}
;;      c245  mass 2  {tennis}
;;      c503  mass 2  {Holly Golightly}
;;     c1212  mass 1  {sequence, series, sequences}
;;      c691  mass 1  {harp}

;; ---- slot produce.Agent  [event center]  n 8  clusters 3
(And (Member $e0 produce) (Agent $e0 $x1))
;;      c555  mass 6  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c110  mass 1  {pancreas}
;;      c320  mass 1  {layer, oil, thin}

;; ---- slot speak.Agent  [event center]  n 8  clusters 6
(And (Member $e0 speak) (Agent $e0 $x1))
;;      c507  mass 2  {Jessica, Linda, Beth, Katherine, …}
;;      c532  mass 2  {Horner, Oates, Wyman, Regis}
;;      c488  mass 1  {Xavier}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c561  mass 1  {Kari Wahlgren}
;;      c907  mass 1  {omen, men, guys}

;; ---- slot talk.Agent  [event center]  n 8  clusters 6
(And (Member $e0 talk) (Agent $e0 $x1))
;;      c507  mass 3  {Jessica, Linda, Beth, Katherine, …}
;;      c374  mass 1  {author, writer, novelist}
;;      c538  mass 1  {Dan, Daniel}
;;      c541  mass 1  {Jordan Peterson}
;;      c873  mass 1  {school janitor}
;;      c902  mass 1  {friend, friends, friend, good}

;; ---- slot use.Agent  [event center]  n 8  clusters 7
(And (Member $e0 use) (Agent $e0 $x1))
;;       c78  mass 2  {localized version, localized versions}
;;       c10  mass 1  {ukrainian army, ukrainian combat loss, ukrainian combat losses}
;;      c163  mass 1  {algerian government}
;;      c493  mass 1  {Cameron, Blair, Churchill}
;;      c568  mass 1  {human brain}
;;      c683  mass 1  {singer}
;;      c905  mass 1  {father, Dad, dad}

;; ---- slot walk.Agent  [event center]  n 8  clusters 8
(And (Member $e0 walk) (Agent $e0 $x1))
;;     c1757  mass 1  {use, well, direct, do, …}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c517  mass 1  {Michael, Marco, Marcus}
;;      c525  mass 1  {Boldi, Bruno, Felix, Maurice, …}
;;      c535  mass 1  {Leon, Lukas}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;       c57  mass 1  {customer, customers}
;;      c873  mass 1  {school janitor}

;; ---- slot want.Experiencer  [event center]  n 8  clusters 6
(And (Member $e0 want) (Experiencer $e0 $x1))
;;      c480  mass 2  {Aslan}
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c535  mass 1  {Leon, Lukas}
;;      c757  mass 1  {chili, Pepper}
;;      c806  mass 1  {cat, cats}

;; ---- slot work.Agent  [event center]  n 8  clusters 8
(And (Member $e0 work) (Agent $e0 $x1))
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c530  mass 1  {Ashe, Asserson}
;;      c538  mass 1  {Dan, Daniel}
;;      c545  mass 1  {Mr. Jones, Mr Johnson}
;;      c692  mass 1  {adaptor, adaptor, old}
;;      c874  mass 1  {volunteer, volunteers}
;;      c897  mass 1  {person, people}
;;      c905  mass 1  {father, Dad, dad}

;; ---- slot write.Agent  [event center]  n 8  clusters 5
(And (Member $e0 write) (Agent $e0 $x1))
;;      c522  mass 2  {Gilles Thibaut, James of Barrochan}
;;      c555  mass 2  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c897  mass 2  {person, people}
;;      c906  mass 1  {busy, father}
;;      c928  mass 1  {famous, person}

;; ---- slot come.Agent  [event center]  n 7  clusters 7
(And (Member $e0 come) (Agent $e0 $x1))
;;     c1331  mass 1  {sleep, bed}
;;     c1361  mass 1  {train}
;;     c1374  mass 1  {talk, conversation, discussion}
;;      c187  mass 1  {countries}
;;      c422  mass 1  {bus, bus ride}
;;      c592  mass 1  {student, students}
;;      c907  mass 1  {omen, men, guys}

;; ---- slot contain.Agent  [event center]  n 7  clusters 5
(And (Member $e0 contain) (Agent $e0 $x1))
;;      c649  mass 3  {card, deck, cards, deck}
;;      c104  mass 1  {vitamin pill}
;;      c650  mass 1  {chest, heart}
;;      c682  mass 1  {song, sing, chant}
;;      c694  mass 1  {plasma}

;; ---- slot contain.Theme  [event center]  n 7  clusters 7
(And (Member $e0 contain) (Theme $e0 $x1))
;;      c118  mass 1  {queens}
;;     c1226  mass 1  {jack, jacks}
;;     c1390  mass 1  {abundant, plenty, abundant, nutrition}
;;      c336  mass 1  {electrolyte, electrolytes}
;;      c347  mass 1  {gold coin, gold, gold coins}
;;      c490  mass 1  {king, royal family, queen, kings}
;;      c681  mass 1  {lyric, degrading, lyric, lyrics}

;; ---- slot create.Patient  [event center]  n 7  clusters 4
(And (Member $e0 create) (Patient $e0 $x1))
;;      c582  mass 4  {community, society}
;;     c1441  mass 1  {new, brand new, language, new, new, product}
;;      c237  mass 1  {calendars, various}
;;       c47  mass 1  {particle accelerator}

;; ---- slot form.Agent  [event center]  n 7  clusters 4
(And (Member $e0 form) (Agent $e0 $x1))
;;      c551  mass 4  {Jon Bon Jovi, Sambora, Brian}
;;     c1408  mass 1  {complex, complex, simple, complicated}
;;      c333  mass 1  {technetium}
;;      c870  mass 1  {labourer, labourers}

;; ---- slot get.Patient  [event center]  n 7  clusters 7
(And (Member $e0 get) (Patient $e0 $x1))
;;     c1044  mass 1  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1136  mass 1  {fire, flame, burn, scorch, …}
;;     c1157  mass 1  {weather, bad, weather}
;;     c1277  mass 1  {expensive, expensive, thing}
;;     c1280  mass 1  {cheap, excuses}
;;     c1334  mass 1  {day, days, days, short, one day}
;;      c181  mass 1  {Algeria, Afghanistan, Iran, Morocco, …}

;; ---- slot make.Result  [event center]  n 7  clusters 7
(And (Member $e0 make) (Result $e0 $x1))
;;     c1025  mass 1  {uncomfortable}
;;     c1044  mass 1  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1051  mass 1  {dangerous, hazardous}
;;     c1262  mass 1  {beautiful, beauty, gorgeous, pretty}
;;     c1468  mass 1  {black, blue, white, brown, …}
;;      c490  mass 1  {king, royal family, queen, kings}
;;      c943  mass 1  {country, backward, country}

;; ---- slot sell.Theme  [event center]  n 7  clusters 6
(And (Member $e0 sell) (Theme $e0 $x1))
;;      c713  mass 2  {ice, ice cream, ice cone, ice cream cone, …}
;;     c1193  mass 1  {cell phone, device, mobile phone, cell phone, new}
;;     c1417  mass 1  {copy, copes, copies}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c732  mass 1  {milk, yogurt}
;;      c764  mass 1  {bean, beans, roasted}

;; ---- slot serve.Theme  [event center]  n 7  clusters 4
(And (Member $e0 serve) (Theme $e0 $x1))
;;      c140  mass 3  {station, Springfield Station}
;;      c128  mass 2  {Baltimore, Boston, San Francisco, Springfield}
;;     c1019  mass 1  {revenge}
;;       c61  mass 1  {coffee, tea, coffee, strong}

;; ---- slot try.Theme  [event center]  n 7  clusters 7
(And (Member $e0 try) (Theme $e0 $x1))
;;     c1470  mass 1  {burnish}
;;     c1675  mass 1  {pull, commit, merge}
;;     c1680  mass 1  {connect, reach, contact}
;;     c1750  mass 1  {lose, give up, lost, fail}
;;      c297  mass 1  {steal}
;;      c312  mass 1  {abuse, violence, violent}
;;       c54  mass 1  {call, telephone call, call for}

;; ---- slot turn.Patient  [event center]  n 7  clusters 7
(And (Member $e0 turn) (Patient $e0 $x1))
;;     c1088  mass 1  {ceiling, black, ceiling}
;;     c1340  mass 1  {war, world war}
;;       c20  mass 1  {russian speech, russian}
;;      c378  mass 1  {freedom movement, gusher}
;;      c443  mass 1  {road, way, lane, motorway, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c779  mass 1  {leaves, red, yellow}

;; ---- slot win.Agent  [event center]  n 7  clusters 4
(And (Member $e0 win) (Agent $e0 $x1))
;;      c494  mass 3  {Wilson, wilson}
;;      c543  mass 2  {James Woods, Jeremy Irons}
;;     c1309  mass 1  {team, first team, away team}
;;      c835  mass 1  {horse, donkey}

;; ---- slot <unclassed>.Only  [entity center]  n 6  clusters 4
(Only $x0 $x1)
;;     c1701  mass 2  {have, possess}
;;     c1760  mass 2  {find, search, found, seek, …}
;;     c1755  mass 1  {follow, like, prefer}
;;      c888  mass 1  {solve}

;; ---- slot appear.Agent  [event center]  n 6  clusters 3
(And (Member $e0 appear) (Agent $e0 $x1))
;;      c897  mass 3  {person, people}
;;      c555  mass 2  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c891  mass 1  {sister, sisters}

;; ---- slot bear.Patient  [event center]  n 6  clusters 4
(And (Member $e0 bear) (Patient $e0 $x1))
;;      c897  mass 3  {person, people}
;;     c1045  mass 1  {poor, man, poor, poorly}
;;      c482  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}

;; ---- slot build.Instrument  [event center]  n 6  clusters 3
(And (Member $e0 build) (Instrument $e0 $x1))
;;     c1160  mass 2  {barometer}
;;     c1178  mass 2  {presented in scale, scale, presented, scale}
;;     c1679  mass 2  {help, assistant, support}

;; ---- slot capture.Theme  [event center]  n 6  clusters 5
(And (Member $e0 capture) (Theme $e0 $x1))
;;       c11  mass 2  {ship, british ship, israeli military ship, merchant ship, …}
;;      c151  mass 1  {capital, provincial capital}
;;      c165  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}
;;      c823  mass 1  {magpie}
;;      c935  mass 1  {Valerian}

;; ---- slot cause.Agent  [event center]  n 6  clusters 6
(And (Member $e0 cause) (Agent $e0 $x1))
;;     c1148  mass 1  {storm, soon, thunder}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c368  mass 1  {news}
;;      c440  mass 1  {walk}
;;      c618  mass 1  {tide, tides}
;;      c810  mass 1  {evil, demon, devil, sadist, …}

;; ---- slot create.Agent  [event center]  n 6  clusters 4
(And (Member $e0 create) (Agent $e0 $x1))
;;       c83  mass 2  {indigenous, indigenous, people, native american, indigenous american, …}
;;       c86  mass 2  {european american settler, european american settlers, french settler, french settlers}
;;      c374  mass 1  {author, writer, novelist}
;;      c512  mass 1  {Peter, Paul, Paulus}

;; ---- slot enter.Agent  [event center]  n 6  clusters 5
(And (Member $e0 enter) (Agent $e0 $x1))
;;      c601  mass 2  {Issaquah Creek, Lake Sammamish}
;;      c218  mass 1  {muslim, muslim house, muslim community, house, muslim, …}
;;      c504  mass 1  {Layla, Liisa}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c897  mass 1  {person, people}

;; ---- slot form.Patient  [event center]  n 6  clusters 4
(And (Member $e0 form) (Patient $e0 $x1))
;;      c672  mass 3  {main songwriting unit, songwriting unit, main, songwriting unit}
;;     c1408  mass 1  {complex, complex, simple, complicated}
;;      c333  mass 1  {technetium}
;;      c461  mass 1  {human barricade}

;; ---- slot fund.Agent  [event center]  n 6  clusters 3
(And (Member $e0 fund) (Agent $e0 $x1))
;;      c198  mass 3  {JICA}
;;      c405  mass 2  {government, govern}
;;      c168  mass 1  {Government of Kenya, Government of Uganda}

;; ---- slot get.Agent  [event center]  n 6  clusters 5
(And (Member $e0 get) (Agent $e0 $x1))
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c516  mass 1  {Leonid}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}
;;      c917  mass 1  {man, young}

;; ---- slot get.Result  [event center]  n 6  clusters 6
(And (Member $e0 get) (Result $e0 $x1))
;;     c1044  mass 1  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1277  mass 1  {expensive, expensive, thing}
;;     c1278  mass 1  {cheap, inexpensive, low, price}
;;     c1401  mass 1  {strong, powerful, force, power}
;;     c1637  mass 1  {short, shortening}
;;     c1687  mass 1  {ready, prepare}

;; ---- slot help.Agent  [event center]  n 6  clusters 6
(And (Member $e0 help) (Agent $e0 $x1))
;;     c1132  mass 1  {hothouse condition, hothouse conditions}
;;     c1583  mass 1  {life, life experience}
;;     c1642  mass 1  {context, condition, situation}
;;      c517  mass 1  {Michael, Marco, Marcus}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c539  mass 1  {Karen, Kalman, Kerr, Ken}

;; ---- slot receive.Theme  [event center]  n 6  clusters 5
(And (Member $e0 receive) (Theme $e0 $x1))
;;      c857  mass 2  {work, job, work through, hard, work}
;;     c1674  mass 1  {win, award, winner}
;;     c1746  mass 1  {permit, permitted}
;;     c1779  mass 1  {honorary knighthood}
;;      c425  mass 1  {car, new, car, shiny}

;; ---- slot run.Agent  [event center]  n 6  clusters 5
(And (Member $e0 run) (Agent $e0 $x1))
;;      c549  mass 2  {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}
;;      c836  mass 1  {cow, goat, sheep, calf}
;;      c838  mass 1  {rabbit, rat, squirrel, hamster}
;;       c98  mass 1  {doctor, doctors}

;; ---- slot sleep.Experiencer  [event center]  n 6  clusters 4
(And (Member $e0 sleep) (Experiencer $e0 $x1))
;;      c806  mass 2  {cat, cats}
;;      c921  mass 2  {child, children, kid, baby, …}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c802  mass 1  {dog, dog feed}

;; ---- slot speak.Theme  [event center]  n 6  clusters 5
(And (Member $e0 speak) (Theme $e0 $x1))
;;      c530  mass 2  {Ashe, Asserson}
;;     c1471  mass 1  {polish}
;;       c21  mass 1  {czech}
;;      c394  mass 1  {foreign, foreign language, foreign, language, foreigner}
;;      c963  mass 1  {language, english}

;; ---- slot start.Agent  [event center]  n 6  clusters 6
(And (Member $e0 start) (Agent $e0 $x1))
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c520  mass 1  {Karl, Kristoffer}
;;      c744  mass 1  {cook, recipe}
;;      c873  mass 1  {school janitor}
;;      c923  mass 1  {girl, girls, girl, little}
;;      c983  mass 1  {crowd, crowd, whole}

;; ---- slot study.Location  [event center]  n 6  clusters 4
(And (Member $e0 study) (Location $e0 $x1))
;;      c487  mass 2  {Davis Studio}
;;      c489  mass 2  {Julian Ashton Art School}
;;      c137  mass 1  {Munich, Prague}
;;      c594  mass 1  {school, university, campus, college, …}

;; ---- slot write.CoAgent  [event center]  n 6  clusters 2
(And (Member $e0 write) (CoAgent $e0 $x1))
;;      c505  mass 4  {Bianca Olsen, Laurie Aubanel, Muriel Zazoui, Patricia Kaas}
;;      c556  mass 2  {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …}

;; ---- slot add.Agent  [event center]  n 5  clusters 4
(And (Member $e0 add) (Agent $e0 $x1))
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;      c549  mass 1  {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb}
;;      c744  mass 1  {cook, recipe}
;;      c786  mass 1  {plant, bushes, plants}

;; ---- slot appear.Location  [event center]  n 5  clusters 4
(And (Member $e0 appear) (Location $e0 $x1))
;;       c62  mass 2  {cafe}
;;      c203  mass 1  {musical film}
;;        c6  mass 1  {Coronation Street}
;;      c952  mass 1  {comedic role}

;; ---- slot buy.Theme  [event center]  n 5  clusters 5
(And (Member $e0 buy) (Theme $e0 $x1))
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1195  mass 1  {computer, machine}
;;      c350  mass 1  {blue, shirt}
;;      c357  mass 1  {trouser, trousers, trouser, yellow}
;;      c753  mass 1  {food, eat}

;; ---- slot cry.Agent  [event center]  n 5  clusters 4
(And (Member $e0 cry) (Agent $e0 $x1))
;;      c510  mass 2  {Baya, Skura, Inomaru, Barako, …}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;      c631  mass 1  {Rima}
;;      c923  mass 1  {girl, girls, girl, little}

;; ---- slot direct.Agent  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Agent $e0 $x1))
;;      c554  mass 2  {Yair Stern, Lev L. Spiro, Yitzhak}
;;      c500  mass 1  {Claude Lelouch}
;;      c555  mass 1  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c690  mass 1  {conductor}

;; ---- slot direct.Patient  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Patient $e0 $x1))
;;     c1213  mass 2  {episode}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c201  mass 1  {syrian film, film, syrian film, destined, film, syrian film}
;;      c202  mass 1  {movie, film}

;; ---- slot draw.Agent  [event center]  n 5  clusters 3
(And (Member $e0 draw) (Agent $e0 $x1))
;;      c548  mass 2  {Cowper, Henry Cole}
;;      c921  mass 2  {child, children, kid, baby, …}
;;      c989  mass 1  {concert, concert hall, auditorium}

;; ---- slot eat.Patient  [event center]  n 5  clusters 4
(And (Member $e0 eat) (Patient $e0 $x1))
;;      c699  mass 2  {cookie, cookie jar, cookies}
;;      c740  mass 1  {bake, bakery, bread}
;;      c746  mass 1  {chicken, chicken fried steak}
;;      c838  mass 1  {rabbit, rat, squirrel, hamster}

;; ---- slot fly.Agent  [event center]  n 5  clusters 5
(And (Member $e0 fly) (Agent $e0 $x1))
;;      c414  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c486  mass 1  {Lex Lex Luthor, Lex Luthor, Superman}
;;      c627  mass 1  {pace, rocket, space mission, space}
;;      c820  mass 1  {dung beetle, insect, centipede, centipedes, …}
;;      c825  mass 1  {crow, eagle, stork, caw}

;; ---- slot include.Theme  [event center]  n 5  clusters 4
(And (Member $e0 include) (Theme $e0 $x1))
;;      c464  mass 2  {Armaan Jain, Ranbir Kapoor}
;;      c465  mass 1  {Nikhil Nanda}
;;      c687  mass 1  {marching band, marching bands}
;;       c93  mass 1  {extradition clause}

;; ---- slot lead.Agent  [event center]  n 5  clusters 4
(And (Member $e0 lead) (Agent $e0 $x1))
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;     c1413  mass 1  {general, generalization, general purpose, easy, generalization}
;;      c594  mass 1  {school, university, campus, college, …}
;;      c802  mass 1  {dog, dog feed}

;; ---- slot lead.Goal  [event center]  n 5  clusters 5
(And (Member $e0 lead) (Goal $e0 $x1))
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1244  mass 1  {pacificat, pacificats, peace}
;;     c1251  mass 1  {happiness, happy, happily, joy}
;;      c805  mass 1  {cat fight, big, cat fight}
;;      c936  mass 1  {glory, glory, lost}

;; ---- slot marry.Agent  [event center]  n 5  clusters 3
(And (Member $e0 marry) (Agent $e0 $x1))
;;      c507  mass 3  {Jessica, Linda, Beth, Katherine, …}
;;      c522  mass 1  {Gilles Thibaut, James of Barrochan}
;;      c557  mass 1  {Steve}

;; ---- slot need.Theme  [event center]  n 5  clusters 5
(And (Member $e0 need) (Theme $e0 $x1))
;;     c1173  mass 1  {paint, painting}
;;     c1356  mass 1  {run, runner, runners}
;;     c1547  mass 1  {generate}
;;     c1573  mass 1  {understand, misunderstand}
;;       c73  mass 1  {go}

;; ---- slot portray.Agent  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Agent $e0 $x1))
;;      c494  mass 2  {Wilson, wilson}
;;      c510  mass 2  {Baya, Skura, Inomaru, Barako, …}
;;      c543  mass 1  {James Woods, Jeremy Irons}

;; ---- slot portray.Theme  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Theme $e0 $x1))
;;      c511  mass 2  {Kantaro Suga}
;;      c543  mass 2  {James Woods, Jeremy Irons}
;;      c494  mass 1  {Wilson, wilson}

;; ---- slot present.Theme  [event center]  n 5  clusters 4
(And (Member $e0 present) (Theme $e0 $x1))
;;      c682  mass 2  {song, sing, chant}
;;     c1174  mass 1  {picture, image}
;;     c1372  mass 1  {play}
;;     c1454  mass 1  {opportunity, golden opportunity}

;; ---- slot provide.Agent  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Agent $e0 $x1))
;;     c1294  mass 1  {organisation, organise}
;;      c266  mass 1  {power station}
;;      c365  mass 1  {mainstream media, media}
;;      c728  mass 1  {kitchen, kitchen island, kitchen sink}
;;      c982  mass 1  {witness, witnesses}

;; ---- slot provide.Theme  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Theme $e0 $x1))
;;     c1211  mass 1  {counter space, counter space, extra}
;;     c1289  mass 1  {description, detailed, descriptions, detailed}
;;      c265  mass 1  {energy, electricity}
;;      c753  mass 1  {food, eat}
;;      c961  mass 1  {plurivocality}

;; ---- slot ready.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 ready) (Experiencer $e0 $x1))
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c516  mass 1  {Leonid}
;;      c553  mass 1  {Yanni}
;;      c741  mass 1  {cake, pastry, pie, hot cake, …}
;;      c750  mass 1  {dinner, dinner table}

;; ---- slot sell.Agent  [event center]  n 5  clusters 4
(And (Member $e0 sell) (Agent $e0 $x1))
;;      c861  mass 2  {company, corporation}
;;      c366  mass 1  {newspaper, newspapers}
;;      c531  mass 1  {Mennad, Ziri, Lessos, Malaleel, …}
;;       c60  mass 1  {coffee brand, coffee brand, indie}

;; ---- slot sing.Theme  [event center]  n 5  clusters 2
(And (Member $e0 sing) (Theme $e0 $x1))
;;      c679  mass 4  {music}
;;      c682  mass 1  {song, sing, chant}

;; ---- slot sing.To  [event center]  n 5  clusters 2
(And (Member $e0 sing) (To $e0 $x1))
;;     c1500  mass 4  {accompany}
;;      c680  mass 1  {music, sad}

;; ---- slot sleep.Location  [event center]  n 5  clusters 3
(And (Member $e0 sleep) (Location $e0 $x1))
;;     c1105  mass 3  {couch}
;;     c1596  mass 1  {contain, inside, into}
;;      c883  mass 1  {mat, mathematics}

;; ---- slot stand.Experiencer  [event center]  n 5  clusters 3
(And (Member $e0 stand) (Experiencer $e0 $x1))
;;      c536  mass 3  {Gustavo, Alberto, Martino, Pietro, …}
;;     c1413  mass 1  {general, generalization, general purpose, easy, generalization}
;;      c592  mass 1  {student, students}

;; ---- slot start.Experiencer  [event center]  n 5  clusters 4
(And (Member $e0 start) (Experiencer $e0 $x1))
;;      c148  mass 2  {bridge}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c534  mass 1  {Gunter}
;;      c566  mass 1  {tunnel}

;; ---- slot study.Theme  [event center]  n 5  clusters 5
(And (Member $e0 study) (Theme $e0 $x1))
;;      c113  mass 1  {bacterium, bacterium, new}
;;      c167  mass 1  {Arabic}
;;     c1710  mass 1  {rate}
;;      c262  mass 1  {mechanical engineering}
;;      c389  mass 1  {canon law}

;; ---- slot swim.Agent  [event center]  n 5  clusters 4
(And (Member $e0 swim) (Agent $e0 $x1))
;;      c800  mass 2  {fish, school}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c799  mass 1  {fish, salmon, fish, red}
;;      c921  mass 1  {child, children, kid, baby, …}

;; ---- slot travel.Agent  [event center]  n 5  clusters 4
(And (Member $e0 travel) (Agent $e0 $x1))
;;      c897  mass 2  {person, people}
;;      c401  mass 1  {campaigner, candidate}
;;      c519  mass 1  {Matthew}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}

;; ---- slot turn.Result  [event center]  n 5  clusters 5
(And (Member $e0 turn) (Result $e0 $x1))
;;     c1344  mass 1  {red, rag, rip, rough, …}
;;     c1467  mass 1  {yellow, orange}
;;     c1468  mass 1  {black, blue, white, brown, …}
;;      c379  mass 1  {gusher}
;;      c825  mass 1  {crow, eagle, stork, caw}

;; ---- slot watch.Agent  [event center]  n 5  clusters 5
(And (Member $e0 watch) (Agent $e0 $x1))
;;      c405  mass 1  {government, govern}
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c590  mass 1  {coach}
;;      c897  mass 1  {person, people}
;;      c899  mass 1  {family, family business, families}

;; ---- slot win.Theme  [event center]  n 5  clusters 2
(And (Member $e0 win) (Theme $e0 $x1))
;;      c474  mass 4  {emmy}
;;      c313  mass 1  {race}

;; ---- slot bad.Between  [entity center]  n 4  clusters 2
(And (Member $x0 bad) (Between $x0 $x1))
;;      c194  mass 2  {Estonia, Poland, Ukraine, Russia}
;;      c195  mass 2  {Germany, Denmark, Norway, Sweden}

;; ---- slot beauty.Possession  [entity center]  n 4  clusters 4
(And (Member $x0 beauty) (Possession $x0 $x1))
;;      c602  mass 1  {lake, Lake Towada, Dianchi Lake, Lake Akan, …}
;;      c638  mass 1  {landscape, scenery, mountain scenery}
;;      c878  mass 1  {sex, sexually}
;;      c996  mass 1  {sight, eye}

;; ---- slot family.Possession  [entity center]  n 4  clusters 1
(And (Member $x0 family) (Possession $x0 $x1))
;;      c897  mass 4  {person, people}

;; ---- slot northern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 northern) (LocatedIn $x0 $x1))
;;      c183  mass 2  {India, Indonesia}
;;      c194  mass 2  {Estonia, Poland, Ukraine, Russia}

;; ---- slot southern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 southern) (LocatedIn $x0 $x1))
;;      c176  mass 2  {North Africa, Africa}
;;      c183  mass 2  {India, Indonesia}

;; ---- slot accompany.Agent  [event center]  n 4  clusters 2
(And (Member $e0 accompany) (Agent $e0 $x1))
;;      c891  mass 2  {sister, sisters}
;;      c897  mass 2  {person, people}

;; ---- slot accompany.Theme  [event center]  n 4  clusters 1
(And (Member $e0 accompany) (Theme $e0 $x1))
;;      c204  mass 4  {silent film}

;; ---- slot active.Time  [event center]  n 4  clusters 2
(And (Member $e0 active) (Time $e0 $x1))
;;     c1325  mass 2  {morning, dawn, early morning, morning light, …}
;;     c1335  mass 2  {evening, late afternoon}

;; ---- slot add.Theme  [event center]  n 4  clusters 3
(And (Member $e0 add) (Theme $e0 $x1))
;;     c1171  mass 2  {illustration, illustrations, illustrate}
;;      c756  mass 1  {clove, lemongrass, cloves}
;;      c780  mass 1  {green, greenery}

;; ---- slot arrive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 arrive) (Agent $e0 $x1))
;;      c418  mass 1  {paris train}
;;      c424  mass 1  {drive, driver}
;;      c524  mass 1  {Donald, Harvey}
;;       c72  mass 1  {spring}

;; ---- slot avoid.Theme  [event center]  n 4  clusters 4
(And (Member $e0 avoid) (Theme $e0 $x1))
;;     c1040  mass 1  {pitfall, pitfalls}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;     c1735  mass 1  {conform, consist, constitute}
;;      c278  mass 1  {bankruptcy}

;; ---- slot bad.Experiencer  [event center]  n 4  clusters 2
(And (Member $e0 bad) (Experiencer $e0 $x1))
;;     c1044  mass 3  {bad, bad, relationship, bad, matter, bad, problem}
;;     c1157  mass 1  {weather, bad, weather}

;; ---- slot bear.Location  [event center]  n 4  clusters 3
(And (Member $e0 bear) (Location $e0 $x1))
;;      c135  mass 2  {Stockholm, Bromma}
;;      c195  mass 1  {Germany, Denmark, Norway, Sweden}
;;      c612  mass 1  {Earth, planet, earth}

;; ---- slot begin.Patient  [event center]  n 4  clusters 4
(And (Member $e0 begin) (Patient $e0 $x1))
;;     c1336  mass 1  {night, tonight, night shift, midnight, …}
;;     c1349  mass 1  {uprising, revolutionary, revolution}
;;      c594  mass 1  {school, university, campus, college, …}
;;      c793  mass 1  {tree, trees, treetop}

;; ---- slot bring.Theme  [event center]  n 4  clusters 4
(And (Member $e0 bring) (Theme $e0 $x1))
;;       c11  mass 1  {ship, british ship, israeli military ship, merchant ship, …}
;;     c1412  mass 1  {advantage}
;;       c15  mass 1  {chinese dumpling}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}

;; ---- slot capture.Agent  [event center]  n 4  clusters 4
(And (Member $e0 capture) (Agent $e0 $x1))
;;      c192  mass 1  {Spain, Italy}
;;      c303  mass 1  {pirate, pirates}
;;      c458  mass 1  {army, soldiers, troop, troops}
;;      c829  mass 1  {falcon}

;; ---- slot cause.Patient  [event center]  n 4  clusters 4
(And (Member $e0 cause) (Patient $e0 $x1))
;;     c1059  mass 1  {wound, damage, injure}
;;       c48  mass 1  {earthquake, earthquakes}
;;       c52  mass 1  {abandonment anxiety}
;;      c669  mass 1  {creaking, crackle, creaking, sound}

;; ---- slot change.Agent  [event center]  n 4  clusters 4
(And (Member $e0 change) (Agent $e0 $x1))
;;      c189  mass 1  {France, French Dahomey}
;;      c493  mass 1  {Cameron, Blair, Churchill}
;;      c778  mass 1  {leaf, foliage, leaves}
;;      c908  mass 1  {man, guy, man, old}

;; ---- slot close.Experiencer  [event center]  n 4  clusters 2
(And (Member $e0 close) (Experiencer $e0 $x1))
;;       c25  mass 3  {Low German}
;;      c525  mass 1  {Boldi, Bruno, Felix, Maurice, …}

;; ---- slot come.Source  [event center]  n 4  clusters 4
(And (Member $e0 come) (Source $e0 $x1))
;;     c1103  mass 1  {place, places, easy, place, full, place}
;;     c1359  mass 1  {treeline}
;;      c232  mass 1  {greek, greek drama}
;;      c777  mass 1  {garden, beautiful, garden}

;; ---- slot connect.Theme  [event center]  n 4  clusters 2
(And (Member $e0 connect) (Theme $e0 $x1))
;;      c124  mass 2  {Tokyo, Nagoya, Narita, Osaka}
;;      c606  mass 2  {Breakheart Hill, Kayalar}

;; ---- slot create.Location  [event center]  n 4  clusters 1
(And (Member $e0 create) (Location $e0 $x1))
;;     c1200  mass 4  {post, blog}

;; ---- slot decide.Agent  [event center]  n 4  clusters 3
(And (Member $e0 decide) (Agent $e0 $x1))
;;      c514  mass 2  {Boris, Ivan, Oleg, Fyodor, …}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c533  mass 1  {Elias, Tobias, Gabor, Gabriel}

;; ---- slot design.Agent  [event center]  n 4  clusters 2
(And (Member $e0 design) (Agent $e0 $x1))
;;      c555  mass 3  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;       c13  mass 1  {Robert Allan Limited}

;; ---- slot design.Patient  [event center]  n 4  clusters 2
(And (Member $e0 design) (Patient $e0 $x1))
;;     c1244  mass 2  {pacificat, pacificats, peace}
;;     c1646  mass 2  {thing, things, stuff, practice, thing}

;; ---- slot die.Patient  [event center]  n 4  clusters 2
(And (Member $e0 die) (Patient $e0 $x1))
;;      c897  mass 3  {person, people}
;;      c899  mass 1  {family, family business, families}

;; ---- slot discover.Theme  [event center]  n 4  clusters 3
(And (Member $e0 discover) (Theme $e0 $x1))
;;      c898  mass 2  {name}
;;     c1437  mass 1  {magnet, magnet, new, type}
;;       c37  mass 1  {pterosaur egg, pterosaur eggs}

;; ---- slot do.Patient  [event center]  n 4  clusters 3
(And (Member $e0 do) (Patient $e0 $x1))
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;      c749  mass 1  {dishes}
;;      c949  mass 1  {dance, dance, little}

;; ---- slot eat.Agent  [event center]  n 4  clusters 4
(And (Member $e0 eat) (Agent $e0 $x1))
;;      c801  mass 1  {brown, dog, brown, dog, lazy}
;;      c826  mass 1  {bird, bird dropping, mother bird, birds}
;;      c897  mass 1  {person, people}
;;      c921  mass 1  {child, children, kid, baby, …}

;; ---- slot encourage.In  [event center]  n 4  clusters 2
(And (Member $e0 encourage) (In $e0 $x1))
;;      c248  mass 2  {chess, chess play}
;;      c883  mass 2  {mat, mathematics}

;; ---- slot enter.Theme  [event center]  n 4  clusters 4
(And (Member $e0 enter) (Theme $e0 $x1))
;;     c1091  mass 1  {cave, hole, lair, burrow}
;;      c186  mass 1  {America, Canada, United States, U.S., …}
;;      c434  mass 1  {park, parking lot, parking}
;;      c601  mass 1  {Issaquah Creek, Lake Sammamish}

;; ---- slot find.Agent  [event center]  n 4  clusters 2
(And (Member $e0 find) (Agent $e0 $x1))
;;      c430  mass 2  {Couper}
;;      c536  mass 2  {Gustavo, Alberto, Martino, Pietro, …}

;; ---- slot get.Theme  [event center]  n 4  clusters 4
(And (Member $e0 get) (Theme $e0 $x1))
;;     c1278  mass 1  {cheap, inexpensive, low, price}
;;      c293  mass 1  {arrest}
;;      c754  mass 1  {snack}
;;      c838  mass 1  {rabbit, rat, squirrel, hamster}

;; ---- slot give.Theme  [event center]  n 4  clusters 4
(And (Member $e0 give) (Theme $e0 $x1))
;;     c1411  mass 1  {advice, advise, advice, good}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c712  mass 1  {mock champagne}
;;      c716  mass 1  {chocolate}

;; ---- slot good.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 good) (Experiencer $e0 $x1))
;;     c1157  mass 1  {weather, bad, weather}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}
;;      c410  mass 1  {windshield}
;;      c734  mass 1  {barley, barley bread}

;; ---- slot help.Theme  [event center]  n 4  clusters 4
(And (Member $e0 help) (Theme $e0 $x1))
;;     c1389  mass 1  {thrive}
;;     c1556  mass 1  {define}
;;      c897  mass 1  {person, people}
;;      c923  mass 1  {girl, girls, girl, little}

;; ---- slot include.Agent  [event center]  n 4  clusters 2
(And (Member $e0 include) (Agent $e0 $x1))
;;      c918  mass 3  {nephew, nephews}
;;      c938  mass 1  {parade}

;; ---- slot increase.Patient  [event center]  n 4  clusters 4
(And (Member $e0 increase) (Patient $e0 $x1))
;;       c10  mass 1  {ukrainian army, ukrainian combat loss, ukrainian combat losses}
;;      c268  mass 1  {industrialization, industrial output}
;;      c314  mass 1  {xenophobia}
;;      c427  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}

;; ---- slot jump.Agent  [event center]  n 4  clusters 4
(And (Member $e0 jump) (Agent $e0 $x1))
;;      c804  mass 1  {brown, fox, quick}
;;      c835  mass 1  {horse, donkey}
;;      c836  mass 1  {cow, goat, sheep, calf}
;;      c919  mass 1  {boy, boys}

;; ---- slot kill.Location  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Location $e0 $x1))
;;      c407  mass 3  {state, nation}
;;     c1678  mass 1  {here, host}

;; ---- slot kill.Manner  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Manner $e0 $x1))
;;     c1491  mass 2  {indirectly}
;;     c1757  mass 2  {use, well, direct, do, …}

;; ---- slot lie.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 lie) (Experiencer $e0 $x1))
;;     c1192  mass 1  {notebook}
;;     c1702  mass 1  {stick, pen}
;;      c372  mass 1  {book, library, books}
;;      c657  mass 1  {tape recorder}

;; ---- slot lie.Location  [event center]  n 4  clusters 1
(And (Member $e0 lie) (Location $e0 $x1))
;;     c1191  mass 4  {table}

;; ---- slot look.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 look) (Experiencer $e0 $x1))
;;      c175  mass 1  {Europe, Western Europe}
;;      c446  mass 1  {flag, philippine flag, inverted, philippine flag}
;;      c594  mass 1  {school, university, campus, college, …}
;;      c623  mass 1  {island, Derwent Isle}

;; ---- slot look.Like  [event center]  n 4  clusters 4
(And (Member $e0 look) (Like $e0 $x1))
;;      c292  mass 1  {imprison, inmate, jail, prison}
;;      c446  mass 1  {flag, philippine flag, inverted, philippine flag}
;;      c819  mass 1  {spider, huge, spider, spider, vegetarian, spiders}
;;      c937  mass 1  {paradise, Rosewood}

;; ---- slot move.Agent  [event center]  n 4  clusters 3
(And (Member $e0 move) (Agent $e0 $x1))
;;      c869  mass 2  {headquarters}
;;      c528  mass 1  {Sammy}
;;      c800  mass 1  {fish, school}

;; ---- slot perform.Location  [event center]  n 4  clusters 3
(And (Member $e0 perform) (Location $e0 $x1))
;;       c62  mass 2  {cafe}
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1656  mass 1  {public}

;; ---- slot preach.Agent  [event center]  n 4  clusters 1
(And (Member $e0 preach) (Agent $e0 $x1))
;;      c897  mass 4  {person, people}

;; ---- slot preach.Location  [event center]  n 4  clusters 2
(And (Member $e0 preach) (Location $e0 $x1))
;;      c134  mass 2  {Gareccio, Bologna}
;;      c192  mass 2  {Spain, Italy}

;; ---- slot present.Agent  [event center]  n 4  clusters 3
(And (Member $e0 present) (Agent $e0 $x1))
;;      c532  mass 2  {Horner, Oates, Wyman, Regis}
;;     c1454  mass 1  {opportunity, golden opportunity}
;;      c861  mass 1  {company, corporation}

;; ---- slot receive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 receive) (Agent $e0 $x1))
;;     c1674  mass 1  {win, award, winner}
;;      c456  mass 1  {General Franks}
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;       c91  mass 1  {refugee, refugees}

;; ---- slot replace.Agent  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Agent $e0 $x1))
;;      c555  mass 2  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c556  mass 1  {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …}
;;      c897  mass 1  {person, people}

;; ---- slot replace.Theme  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Theme $e0 $x1))
;;      c486  mass 2  {Lex Lex Luthor, Lex Luthor, Superman}
;;      c555  mass 1  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c897  mass 1  {person, people}

;; ---- slot require.Theme  [event center]  n 4  clusters 4
(And (Member $e0 require) (Theme $e0 $x1))
;;      c264  mass 1  {repair, repairs}
;;       c55  mass 1  {american phone number}
;;      c648  mass 1  {id card, id card, valid}
;;      c857  mass 1  {work, job, work through, hard, work}

;; ---- slot specify.In  [event center]  n 4  clusters 1
(And (Member $e0 specify) (In $e0 $x1))
;;     c1068  mass 4  {continuous time, discrete time}

;; ---- slot spend.Agent  [event center]  n 4  clusters 3
(And (Member $e0 spend) (Agent $e0 $x1))
;;      c897  mass 2  {person, people}
;;     c1319  mass 1  {May, march}
;;      c834  mass 1  {gazelle, giraffe, giraffes}

;; ---- slot star.Agent  [event center]  n 4  clusters 1
(And (Member $e0 star) (Agent $e0 $x1))
;;     c1646  mass 4  {thing, things, stuff, practice, thing}

;; ---- slot star.Theme  [event center]  n 4  clusters 2
(And (Member $e0 star) (Theme $e0 $x1))
;;      c505  mass 2  {Bianca Olsen, Laurie Aubanel, Muriel Zazoui, Patricia Kaas}
;;      c543  mass 2  {James Woods, Jeremy Irons}

;; ---- slot stop.Agent  [event center]  n 4  clusters 4
(And (Member $e0 stop) (Agent $e0 $x1))
;;      c510  mass 1  {Baya, Skura, Inomaru, Barako, …}
;;      c553  mass 1  {Yanni}
;;      c631  mass 1  {Rima}
;;      c692  mass 1  {adaptor, adaptor, old}

;; ---- slot stop.Theme  [event center]  n 4  clusters 2
(And (Member $e0 stop) (Theme $e0 $x1))
;;     c1142  mass 2  {cry, pray}
;;      c857  mass 2  {work, job, work through, hard, work}

;; ---- slot support.Theme  [event center]  n 4  clusters 1
(And (Member $e0 support) (Theme $e0 $x1))
;;     c1179  mass 4  {view, views, common, view, public, view, …}

;; ---- slot use.Manner  [event center]  n 4  clusters 3
(And (Member $e0 use) (Manner $e0 $x1))
;;     c1497  mass 2  {rarely}
;;     c1431  mass 1  {responsibility, responsibly}
;;     c1498  mass 1  {colloquially}

;; ---- slot use.To  [event center]  n 4  clusters 4
(And (Member $e0 use) (To $e0 $x1))
;;     c1545  mass 1  {make}
;;     c1683  mass 1  {develop}
;;      c597  mass 1  {study, learn}
;;      c743  mass 1  {roast, roasted}

;; ---- slot walk.Goal  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Goal $e0 $x1))
;;     c1274  mass 1  {store, shop, shopping, shops}
;;     c1753  mass 1  {former, back, early, backward, …}
;;      c596  mass 1  {class, classroom}
;;      c791  mass 1  {forest, jungle, natural lowland forest}

;; ---- slot walk.Location  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Location $e0 $x1))
;;     c1089  mass 1  {floor, wood floor}
;;     c1114  mass 1  {hallway}
;;     c1465  mass 1  {dark, darkness, dimly}
;;      c844  mass 1  {balloon, balloon, little}

;; ---- slot watch.Theme  [event center]  n 4  clusters 4
(And (Member $e0 watch) (Theme $e0 $x1))
;;     c1301  mass 1  {event}
;;     c1591  mass 1  {action, activity, active, act, …}
;;     c1780  mass 1  {natural hair video}
;;      c202  mass 1  {movie, film}

;; ---- slot win.For  [event center]  n 4  clusters 1
(And (Member $e0 win) (For $e0 $x1))
;;     c1169  mass 4  {portray, portrait, portrayal}

;; ---- slot work.Location  [event center]  n 4  clusters 4
(And (Member $e0 work) (Location $e0 $x1))
;;      c175  mass 1  {Europe, Western Europe}
;;      c226  mass 1  {Church of Norway}
;;      c267  mass 1  {factory, factories}
;;      c294  mass 1  {prison kitchen}

;; ---- slot bottom.PartOf  [entity center]  n 3  clusters 2
(And (Member $x0 bottom) (PartOf $x0 $x1))
;;      c363  mass 2  {page, sheet}
;;      c726  mass 1  {stew pot}

;; ---- slot fight.Against  [entity center]  n 3  clusters 3
(And (Member $x0 fight) (Against $x0 $x1))
;;     c1536  mass 1  {dead, die, death, die down, …}
;;     c1581  mass 1  {native, natural, nature}
;;      c209  mass 1  {fate}

;; ---- slot thing.LocatedIn  [entity center]  n 3  clusters 2
(And (Member $x0 thing) (LocatedIn $x0 $x1))
;;      c607  mass 2  {hill, mountain, hills, peaks}
;;      c355  mass 1  {closet}

;; ---- slot active.Experiencer  [event center]  n 3  clusters 2
(And (Member $e0 active) (Experiencer $e0 $x1))
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;      c530  mass 1  {Ashe, Asserson}

;; ---- slot affect.Agent  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Agent $e0 $x1))
;;      c319  mass 3  {cyberattack}

;; ---- slot affect.Location  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Location $e0 $x1))
;;      c393  mass 3  {world, international, global, internationally}

;; ---- slot affect.Theme  [event center]  n 3  clusters 3
(And (Member $e0 affect) (Theme $e0 $x1))
;;      c101  mass 1  {hospital, emergency room}
;;      c276  mass 1  {bank, banking industry}
;;      c861  mass 1  {company, corporation}

;; ---- slot affect.Time  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Time $e0 $x1))
;;     c1727  mass 3  {now, today, this year, current, …}

;; ---- slot approve.Theme  [event center]  n 3  clusters 3
(And (Member $e0 approve) (Theme $e0 $x1))
;;     c1287  mass 1  {treaty}
;;     c1297  mass 1  {plan, project}
;;     c1463  mass 1  {Bill, bill}

;; ---- slot attack.Patient  [event center]  n 3  clusters 3
(And (Member $e0 attack) (Patient $e0 $x1))
;;     c1102  mass 1  {building}
;;      c536  mass 1  {Gustavo, Alberto, Martino, Pietro, …}
;;       c59  mass 1  {consumer rights}

;; ---- slot bake.Agent  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Agent $e0 $x1))
;;      c861  mass 2  {company, corporation}
;;      c506  mass 1  {Emily, Ella}

;; ---- slot bake.Patient  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Patient $e0 $x1))
;;      c713  mass 2  {ice, ice cream, ice cone, ice cream cone, …}
;;      c706  mass 1  {pie, scrumptious}

;; ---- slot base.On  [event center]  n 3  clusters 3
(And (Member $e0 base) (On $e0 $x1))
;;     c1339  mass 1  {battle, fight}
;;      c230  mass 1  {puritan value}
;;       c28  mass 1  {esperanto alphabet, latin alphabet}

;; ---- slot beautiful.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 beautiful) (Experiencer $e0 $x1))
;;     c1117  mass 1  {beautiful, room}
;;     c1157  mass 1  {weather, bad, weather}
;;      c626  mass 1  {moon, full moon, beautiful, moon}

;; ---- slot break_out.Patient  [event center]  n 3  clusters 3
(And (Member $e0 break_out) (Patient $e0 $x1))
;;     c1136  mass 1  {fire, flame, burn, scorch, …}
;;     c1137  mass 1  {forest fire, forest fires}
;;     c1340  mass 1  {war, world war}

;; ---- slot bring.Goal  [event center]  n 3  clusters 3
(And (Member $e0 bring) (Goal $e0 $x1))
;;     c1235  mass 1  {gallows}
;;      c183  mass 1  {India, Indonesia}
;;      c186  mass 1  {America, Canada, United States, U.S., …}

;; ---- slot buy.Agent  [event center]  n 3  clusters 2
(And (Member $e0 buy) (Agent $e0 $x1))
;;      c510  mass 2  {Baya, Skura, Inomaru, Barako, …}
;;      c532  mass 1  {Horner, Oates, Wyman, Regis}

;; ---- slot close.Agent  [event center]  n 3  clusters 3
(And (Member $e0 close) (Agent $e0 $x1))
;;      c413  mass 1  {pilot, pilot error, pilot errors}
;;      c459  mass 1  {guard, bodyguard, guards}
;;      c894  mass 1  {female, giraffe}

;; ---- slot close.Goal  [event center]  n 3  clusters 2
(And (Member $e0 close) (Goal $e0 $x1))
;;       c23  mass 2  {Dutch, Frisian}
;;       c24  mass 1  {High German}

;; ---- slot close.Patient  [event center]  n 3  clusters 2
(And (Member $e0 close) (Patient $e0 $x1))
;;     c1094  mass 2  {door, back door, door, open, door, unlocked, …}
;;     c1274  mass 1  {store, shop, shopping, shops}

;; ---- slot come.Goal  [event center]  n 3  clusters 3
(And (Member $e0 come) (Goal $e0 $x1))
;;     c1503  mass 1  {settlement, settle, political, settlement}
;;     c1640  mass 1  {conclusion, consequence}
;;      c989  mass 1  {concert, concert hall, auditorium}

;; ---- slot come.Patient  [event center]  n 3  clusters 3
(And (Member $e0 come) (Patient $e0 $x1))
;;     c1147  mass 1  {hurricane, typhoon, hurricane season}
;;      c667  mass 1  {sound, sound wave}
;;      c816  mass 1  {insect sound, insect sounds}

;; ---- slot come_back.Agent  [event center]  n 3  clusters 3
(And (Member $e0 come_back) (Agent $e0 $x1))
;;      c904  mass 1  {Mom, mother, grandmother, parent, …}
;;      c905  mass 1  {father, Dad, dad}
;;      c919  mass 1  {boy, boys}

;; ---- slot compose.Patient  [event center]  n 3  clusters 2
(And (Member $e0 compose) (Patient $e0 $x1))
;;      c682  mass 2  {song, sing, chant}
;;      c689  mass 1  {orchestra, symphony, great, symphonies}

;; ---- slot conduct.Agent  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Agent $e0 $x1))
;;      c555  mass 2  {Bill Wrubel, Brian Packham, Carl Fenton, Colin Richardson, …}
;;      c449  mass 1  {CIA, FBI}

;; ---- slot conduct.Theme  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Theme $e0 $x1))
;;      c689  mass 2  {orchestra, symphony, great, symphonies}
;;      c580  mass 1  {surveillance}

;; ---- slot cover.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Instrument $e0 $x1))
;;     c1155  mass 1  {snow, cold, frost, snowstorm, …}
;;      c362  mass 1  {paper decoration, paper decorations}
;;      c787  mass 1  {weed}

;; ---- slot cover.Patient  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Patient $e0 $x1))
;;     c1113  mass 1  {courtyard, veranda}
;;     c1704  mass 1  {top, peak}
;;      c254  mass 1  {shopping arcade}

;; ---- slot define.Theme  [event center]  n 3  clusters 2
(And (Member $e0 define) (Theme $e0 $x1))
;;     c1212  mass 2  {sequence, series, sequences}
;;     c1646  mass 1  {thing, things, stuff, practice, thing}

;; ---- slot die.Location  [event center]  n 3  clusters 2
(And (Member $e0 die) (Location $e0 $x1))
;;      c135  mass 2  {Stockholm, Bromma}
;;     c1136  mass 1  {fire, flame, burn, scorch, …}

;; ---- slot drink.Patient  [event center]  n 3  clusters 2
(And (Member $e0 drink) (Patient $e0 $x1))
;;       c61  mass 2  {coffee, tea, coffee, strong}
;;     c1146  mass 1  {water, water source, clear, water, good, water}

;; ---- slot drive.Agent  [event center]  n 3  clusters 2
(And (Member $e0 drive) (Agent $e0 $x1))
;;      c422  mass 2  {bus, bus ride}
;;      c431  mass 1  {van}

;; ---- slot encourage.Agent  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Agent $e0 $x1))
;;      c526  mass 3  {Jonas, Roger, Bob, Ralph, …}

;; ---- slot encourage.Theme  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Theme $e0 $x1))
;;      c525  mass 3  {Boldi, Bruno, Felix, Maurice, …}

;; ---- slot endorse.Theme  [event center]  n 3  clusters 1
(And (Member $e0 endorse) (Theme $e0 $x1))
;;     c1179  mass 3  {view, views, common, view, public, view, …}

;; ---- slot fall.Source  [event center]  n 3  clusters 3
(And (Member $e0 fall) (Source $e0 $x1))
;;     c1110  mass 1  {shelf}
;;     c1158  mass 1  {sky, air, clouds}
;;      c793  mass 1  {tree, trees, treetop}

;; ---- slot fight.Agent  [event center]  n 3  clusters 2
(And (Member $e0 fight) (Agent $e0 $x1))
;;       c80  mass 2  {kabye person, kabye people}
;;      c864  mass 1  {union boss, union bosses}

;; ---- slot fight.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fight) (Theme $e0 $x1))
;;     c1477  mass 1  {freeze, freeze over}
;;      c215  mass 1  {islamic fundamentalism}
;;      c307  mass 1  {terrorism, terrorist activity}

;; ---- slot fund.Theme  [event center]  n 3  clusters 2
(And (Member $e0 fund) (Theme $e0 $x1))
;;      c169  mass 2  {Kenya, Lessos-Kenya, Lessos-Uganda, Uganda}
;;      c147  mass 1  {border, border incident, border section}

;; ---- slot give.Agent  [event center]  n 3  clusters 2
(And (Member $e0 give) (Agent $e0 $x1))
;;      c514  mass 2  {Boris, Ivan, Oleg, Fyodor, …}
;;      c521  mass 1  {David, William, James}

;; ---- slot go.Manner  [event center]  n 3  clusters 2
(And (Member $e0 go) (Manner $e0 $x1))
;;     c1744  mass 2  {late, later, let, last, …}
;;     c1729  mass 1  {immediately, instantly, next instant, right away}

;; ---- slot go.To  [event center]  n 3  clusters 2
(And (Member $e0 go) (To $e0 $x1))
;;     c1374  mass 2  {talk, conversation, discussion}
;;     c1719  mass 1  {appear, see, display, show, …}

;; ---- slot grow.Patient  [event center]  n 3  clusters 3
(And (Member $e0 grow) (Patient $e0 $x1))
;;     c1003  mass 1  {beard}
;;     c1520  mass 1  {faint, faint, sound}
;;      c539  mass 1  {Karen, Kalman, Kerr, Ken}

;; ---- slot have.In  [event center]  n 3  clusters 2
(And (Member $e0 have) (In $e0 $x1))
;;      c261  mass 2  {fluid mechanics}
;;      c959  mass 1  {poetry}

;; ---- slot hold.Patient  [event center]  n 3  clusters 3
(And (Member $e0 hold) (Patient $e0 $x1))
;;     c1300  mass 1  {meeting}
;;      c227  mass 1  {prayer, prayers}
;;      c991  mass 1  {ceremony, ceremony, mass}

;; ---- slot lead.Theme  [event center]  n 3  clusters 3
(And (Member $e0 lead) (Theme $e0 $x1))
;;     c1310  mass 1  {squad}
;;      c805  mass 1  {cat fight, big, cat fight}
;;      c836  mass 1  {cow, goat, sheep, calf}

;; ---- slot learn.Theme  [event center]  n 3  clusters 3
(And (Member $e0 learn) (Theme $e0 $x1))
;;     c1460  mass 1  {berber speaking, berber}
;;      c394  mass 1  {foreign, foreign language, foreign, language, foreigner}
;;      c962  mass 1  {dictionary, vocabulary}

;; ---- slot leave.Patient  [event center]  n 3  clusters 2
(And (Member $e0 leave) (Patient $e0 $x1))
;;     c1094  mass 2  {door, back door, door, open, door, unlocked, …}
;;     c1773  mass 1  {lights, on}

;; ---- slot leave.Result  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Result $e0 $x1))
;;     c1092  mass 1  {unlocked, locked, lock, door, locked}
;;     c1756  mass 1  {open, close, end, closed}
;;     c1757  mass 1  {use, well, direct, do, …}

;; ---- slot leave.Theme  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Theme $e0 $x1))
;;     c1116  mass 1  {room, changing room, rooms}
;;      c427  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}
;;      c434  mass 1  {park, parking lot, parking}

;; ---- slot lose.Agent  [event center]  n 3  clusters 2
(And (Member $e0 lose) (Agent $e0 $x1))
;;      c549  mass 2  {George Allen, J. Augustus Knapp, James David Edgar, Chuck Robb}
;;      c432  mass 1  {tire}

;; ---- slot move.Goal  [event center]  n 3  clusters 2
(And (Member $e0 move) (Goal $e0 $x1))
;;      c128  mass 2  {Baltimore, Boston, San Francisco, Springfield}
;;     c1678  mass 1  {here, host}

;; ---- slot paint.Patient  [event center]  n 3  clusters 2
(And (Member $e0 paint) (Patient $e0 $x1))
;;      c638  mass 2  {landscape, scenery, mountain scenery}
;;     c1692  mass 1  {gate}

;; ---- slot pick_up.Agent  [event center]  n 3  clusters 3
(And (Member $e0 pick_up) (Agent $e0 $x1))
;;     c1184  mass 1  {camera}
;;      c132  mass 1  {Santiago, Manila, Havana}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}

;; ---- slot play.Location  [event center]  n 3  clusters 2
(And (Member $e0 play) (Location $e0 $x1))
;;      c132  mass 2  {Santiago, Manila, Havana}
;;     c1089  mass 1  {floor, wood floor}

;; ---- slot pull.Theme  [event center]  n 3  clusters 3
(And (Member $e0 pull) (Theme $e0 $x1))
;;      c132  mass 1  {Santiago, Manila, Havana}
;;      c417  mass 1  {freight cars, line, long}
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}

;; ---- slot read.Agent  [event center]  n 3  clusters 3
(And (Member $e0 read) (Agent $e0 $x1))
;;      c514  mass 1  {Boris, Ivan, Oleg, Fyodor, …}
;;      c526  mass 1  {Jonas, Roger, Bob, Ralph, …}
;;      c923  mass 1  {girl, girls, girl, little}

;; ---- slot read.Theme  [event center]  n 3  clusters 3
(And (Member $e0 read) (Theme $e0 $x1))
;;      c208  mass 1  {fairy tale}
;;      c288  mass 1  {economics magazine}
;;      c953  mass 1  {comic}

;; ---- slot require.Agent  [event center]  n 3  clusters 3
(And (Member $e0 require) (Agent $e0 $x1))
;;     c1099  mass 1  {house, home, comfortable, house, houses, …}
;;     c1676  mass 1  {master, main}
;;     c1682  mass 1  {app, apply}

;; ---- slot return.Agent  [event center]  n 3  clusters 2
(And (Member $e0 return) (Agent $e0 $x1))
;;      c463  mass 2  {Glasnow}
;;       c12  mass 1  {fishing boat}

;; ---- slot return.Goal  [event center]  n 3  clusters 2
(And (Member $e0 return) (Goal $e0 $x1))
;;      c129  mass 2  {Altoona}
;;     c1204  mass 1  {port, old, port}

;; ---- slot rule.Agent  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Agent $e0 $x1))
;;      c471  mass 2  {Arakkal, Tipu Sultan}
;;      c192  mass 1  {Spain, Italy}

;; ---- slot rule.Theme  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Theme $e0 $x1))
;;      c218  mass 2  {muslim, muslim house, muslim community, house, muslim, …}
;;      c182  mass 1  {Colombia, Brazil, Cuba, Peru, …}

;; ---- slot say.Theme  [event center]  n 3  clusters 2
(And (Member $e0 say) (Theme $e0 $x1))
;;     c1646  mass 2  {thing, things, stuff, practice, thing}
;;      c211  mass 1  {funeral prayer, funeral}

;; ---- slot season.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 season) (Instrument $e0 $x1))
;;      c756  mass 1  {clove, lemongrass, cloves}
;;      c761  mass 1  {horse radish}
;;      c763  mass 1  {ramson}

;; ---- slot see.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 see) (Stimulus $e0 $x1))
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c626  mass 1  {moon, full moon, beautiful, moon}
;;      c837  mass 1  {animal, species, zoo, animals}

;; ---- slot shoot.Patient  [event center]  n 3  clusters 3
(And (Member $e0 shoot) (Patient $e0 $x1))
;;      c498  mass 1  {JFK}
;;      c538  mass 1  {Dan, Daniel}
;;      c840  mass 1  {bear, beast, lion attack, tiger, …}

;; ---- slot sleep.Agent  [event center]  n 3  clusters 2
(And (Member $e0 sleep) (Agent $e0 $x1))
;;      c897  mass 2  {person, people}
;;      c899  mass 1  {family, family business, families}

;; ---- slot solve.Patient  [event center]  n 3  clusters 1
(And (Member $e0 solve) (Patient $e0 $x1))
;;     c1364  mass 3  {problem, problems}

;; ---- slot spend.Theme  [event center]  n 3  clusters 2
(And (Member $e0 spend) (Theme $e0 $x1))
;;       c92  mass 2  {exile}
;;     c1334  mass 1  {day, days, days, short, one day}

;; ---- slot start.Location  [event center]  n 3  clusters 1
(And (Member $e0 start) (Location $e0 $x1))
;;      c195  mass 3  {Germany, Denmark, Norway, Sweden}

;; ---- slot stick.Patient  [event center]  n 3  clusters 3
(And (Member $e0 stick) (Patient $e0 $x1))
;;      c426  mass 1  {truck, wagon}
;;      c718  mass 1  {chewing gum}
;;      c835  mass 1  {horse, donkey}

;; ---- slot succeed.Agent  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Agent $e0 $x1))
;;      c484  mass 1  {Alexander}
;;      c527  mass 1  {Bailey}
;;      c556  mass 1  {Corentin Rahier, Bruno Simma, Cyril Rambour, Peter Gaussen, …}

;; ---- slot succeed.Theme  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Theme $e0 $x1))
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c548  mass 1  {Cowper, Henry Cole}
;;      c897  mass 1  {person, people}

;; ---- slot take_off.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_off) (Agent $e0 $x1))
;;      c414  mass 2  {plane, flight, aeroplane, airplane, …}
;;      c538  mass 1  {Dan, Daniel}

;; ---- slot take_over.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_over) (Agent $e0 $x1))
;;      c495  mass 2  {Watts}
;;      c782  mass 1  {Ivy, ivy}

;; ---- slot talk.Recipient  [event center]  n 3  clusters 3
(And (Member $e0 talk) (Recipient $e0 $x1))
;;      c507  mass 1  {Jessica, Linda, Beth, Katherine, …}
;;      c589  mass 1  {teacher, professor}
;;      c984  mass 1  {audience, audience, large}

;; ---- slot turn.Goal  [event center]  n 3  clusters 3
(And (Member $e0 turn) (Goal $e0 $x1))
;;     c1665  mass 1  {report}
;;      c603  mass 1  {river, tributary, tributaries}
;;      c956  mass 1  {quagmire}

;; ---- slot understand.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 understand) (Stimulus $e0 $x1))
;;     c1365  mass 1  {specific issue}
;;     c1643  mass 1  {cause, reason, cause, unknown}
;;       c96  mass 1  {public health issue}

;; ---- slot wear.Theme  [event center]  n 3  clusters 3
(And (Member $e0 wear) (Theme $e0 $x1))
;;     c1000  mass 1  {mask}
;;      c360  mass 1  {inaugural gown}
;;      c409  mass 1  {helmet}

;; ---- slot welcome.Agent  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Agent $e0 $x1))
;;     c1678  mass 1  {here, host}
;;      c268  mass 1  {industrialization, industrial output}
;;      c384  mass 1  {whig, whigs}

;; ---- slot welcome.Theme  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Theme $e0 $x1))
;;      c268  mass 1  {industrialization, industrial output}
;;      c384  mass 1  {whig, whigs}
;;      c986  mass 1  {guest, guests}

;; ---- slot work.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 work) (Experiencer $e0 $x1))
;;     c1197  mass 1  {mouse}
;;     c1201  mass 1  {site}
;;      c693  mass 1  {travel adaptor}

;; ---- slot work.Manner  [event center]  n 3  clusters 3
(And (Member $e0 work) (Manner $e0 $x1))
;;     c1741  mass 1  {perfectly}
;;     c1744  mass 1  {late, later, let, last, …}
;;     c1757  mass 1  {use, well, direct, do, …}

;; ==================== subtree @ cluster cos 0.85: pooled role level (136 head pairs) ====================

;; Agent ~ Experiencer  cosine 0.50  JSD 0.691  n 888 / 261  shared: {person, people} {thing, things} {child, children, kid, kids}
(Agent $e $x)
(Experiencer $e $x)

;; Patient ~ Theme  cosine 0.48  JSD 0.785  n 455 / 594  shared: {thing, things} {person, people} {song, sing, chant}
(Patient $e $x)
(Theme $e $x)

;; Agent ~ Patient  cosine 0.47  JSD 0.794  n 888 / 455  shared: {person, people} {thing, things} {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
(Agent $e $x)
(Patient $e $x)

;; Agent ~ Theme  cosine 0.41  JSD 0.783  n 888 / 594  shared: {person, people} {thing, things} {company, corporation}
(Agent $e $x)
(Theme $e $x)

;; Experiencer ~ Patient  cosine 0.39  JSD 0.709  n 261 / 455  shared: {person, people} {thing, things} {door, door, open, door, unlocked}
(Experiencer $e $x)
(Patient $e $x)

;; Agent ~ Recipient  cosine 0.34  JSD 0.816  n 888 / 29  shared: {person, people} {company, corporation} {child, children, kid, kids}
(Agent $e $x)
(Recipient $e $x)

;; Stimulus ~ Theme  cosine 0.34  JSD 0.897  n 34 / 594  shared: {thing, things} {child, children, kid, kids} {food, eat}
(Stimulus $e $x)
(Theme $e $x)

;; Experiencer ~ Theme  cosine 0.30  JSD 0.82  n 261 / 594  shared: {thing, things} {person, people} {child, children, kid, kids}
(Experiencer $e $x)
(Theme $e $x)

;; Patient ~ Stimulus  cosine 0.23  JSD 0.928  n 455 / 34  shared: {thing, things} {child, children, kid, kids} {knock}
(Patient $e $x)
(Stimulus $e $x)

;; Holder ~ Theme  cosine 0.22  JSD 0.876  n 48 / 594  shared: {thing, things} {food, eat} {house, home, houses}
(Holder $e $x)
(Theme $e $x)

;; Experiencer ~ Recipient  cosine 0.20  JSD 0.895  n 261 / 29  shared: {person, people} {child, children, kid, kids} {Margaret Fleming, Martha, Anne, Marie}
(Experiencer $e $x)
(Recipient $e $x)

;; Holder ~ Patient  cosine 0.19  JSD 0.871  n 48 / 455  shared: {thing, things} {movie, film} {room, rooms}
(Holder $e $x)
(Patient $e $x)

;; Experiencer ~ Holder  cosine 0.17  JSD 0.838  n 261 / 48  shared: {Gustavo, Alberto, Diego, Rodrigo, …} {thing, things} {Boris, Ivan, Dmitri, Rasputin}
(Experiencer $e $x)
(Holder $e $x)

;; Agent ~ Stimulus  cosine 0.17  JSD 0.915  n 888 / 34  shared: {thing, things} {child, children, kid, kids} {Jessica, Beth}
(Agent $e $x)
(Stimulus $e $x)

;; Holder ~ Stimulus  cosine 0.15  JSD 0.892  n 48 / 34  shared: {thing, things} {author, writer, novelist} {food, eat}
(Holder $e $x)
(Stimulus $e $x)

;; Agent ~ Holder  cosine 0.15  JSD 0.861  n 888 / 48  shared: {thing, things} {Gustavo, Alberto, Diego, Rodrigo, …} {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
(Agent $e $x)
(Holder $e $x)

;; Patient ~ Recipient  cosine 0.14  JSD 0.941  n 455 / 29  shared: {person, people} {child, children, kid, kids} {city, cities}
(Patient $e $x)
(Recipient $e $x)

;; Goal ~ Source  cosine 0.13  JSD 0.871  n 93 / 47  shared: {town, towns} {here} {school, education}
(Goal $e $x)
(Source $e $x)

;; Recipient ~ Theme  cosine 0.13  JSD 0.916  n 29 / 594  shared: {person, people} {child, children, kid, kids} {Margaret Fleming, Martha, Anne, Marie}
(Recipient $e $x)
(Theme $e $x)

;; Goal ~ Location  cosine 0.13  JSD 0.877  n 93 / 210  shared: {house, home, houses} {here} {Eskisehir, Giresun}
(Goal $e $x)
(Location $e $x)

;; Location ~ Source  cosine 0.12  JSD 0.91  n 210 / 47  shared: {here} {town, towns} {place, places}
(Location $e $x)
(Source $e $x)

;; Goal ~ Holder  cosine 0.12  JSD 0.895  n 93 / 48  shared: {house, home, houses} {town, towns} {place, places}
(Goal $e $x)
(Holder $e $x)

;; Experiencer ~ Stimulus  cosine 0.12  JSD 0.945  n 261 / 34  shared: {thing, things} {child, children, kid, kids}
(Experiencer $e $x)
(Stimulus $e $x)

;; Holder ~ Source  cosine 0.12  JSD 0.895  n 48 / 47  shared: {town, towns} {place, places} {room, rooms}
(Holder $e $x)
(Source $e $x)

;; Theme ~ To  cosine 0.10  JSD 0.933  n 594 / 46  shared: {thing, things} {talk, conversation, discussion} {make}
(Theme $e $x)
(To $e $x)

;; Manner ~ Result  cosine 0.08  JSD 0.905  n 115 / 43  shared: {well, on, there, be} {direct, straight, directly} {together, come together}
(Manner $e $x)
(Result $e $x)

;; Experiencer ~ Goal  cosine 0.08  JSD 0.922  n 261 / 93  shared: {house, home, houses} {place, places} {Linda, Amanda, Loren, Dora Smith, …}
(Experiencer $e $x)
(Goal $e $x)

;; Experiencer ~ Result  cosine 0.08  JSD 0.912  n 261 / 43  shared: {bad, bad, matter, bad, problem} {indigenous, indigenous, people, native american, indigenous american, …} {modern, street}
(Experiencer $e $x)
(Result $e $x)

;; For ~ Theme  cosine 0.07  JSD 0.958  n 39 / 594  shared: {work, job} {portray, portrait, portrayal} {ship, merchant ship, modern ship}
(For $e $x)
(Theme $e $x)

;; Goal ~ Patient  cosine 0.07  JSD 0.921  n 93 / 455  shared: {tree, trees} {house, home, houses} {room, rooms}
(Goal $e $x)
(Patient $e $x)

;; Source ~ Theme  cosine 0.07  JSD 0.937  n 47 / 594  shared: {view, views, common, view, public, view, …} {food, eat} {Tokyo, Nagoya, Narita, Osaka}
(Source $e $x)
(Theme $e $x)

;; Patient ~ Source  cosine 0.06  JSD 0.944  n 455 / 47  shared: {tree, trees} {room, rooms} {cookie, cookie jar, cookies}
(Patient $e $x)
(Source $e $x)

;; Goal ~ Theme  cosine 0.06  JSD 0.946  n 93 / 594  shared: {house, home, houses} {Baltimore, Boston, Springfield} {room, rooms}
(Goal $e $x)
(Theme $e $x)

;; Patient ~ Result  cosine 0.06  JSD 0.943  n 455 / 43  shared: {bad, bad, matter, bad, problem} {indigenous, indigenous, people, native american, indigenous american, …} {cozy, living room, theater, cozy, theater}
(Patient $e $x)
(Result $e $x)

;; Patient ~ To  cosine 0.06  JSD 0.96  n 455 / 46  shared: {thing, things} {bake, bakery, bread} {woman, lady, female, women}
(Patient $e $x)
(To $e $x)

;; Holder ~ Location  cosine 0.06  JSD 0.933  n 48 / 210  shared: {town, towns} {place, places} {house, home, houses}
(Holder $e $x)
(Location $e $x)

;; For ~ Goal  cosine 0.05  JSD 0.951  n 39 / 93  shared: {bed} {happiness, happy, happily, joy}
(For $e $x)
(Goal $e $x)

;; Location ~ Patient  cosine 0.05  JSD 0.919  n 210 / 455  shared: {table} {hotel} {floor, wood floor}
(Location $e $x)
(Patient $e $x)

;; Recipient ~ Stimulus  cosine 0.05  JSD 0.957  n 29 / 34  shared: {child, children, kid, kids}
(Recipient $e $x)
(Stimulus $e $x)

;; Stimulus ~ To  cosine 0.05  JSD 0.961  n 34 / 46  shared: {thing, things}
(Stimulus $e $x)
(To $e $x)

;; Agent ~ To  cosine 0.05  JSD 0.949  n 888 / 46  shared: {thing, things} {doctor, doctors} {George Allen, James David Edgar, Chuck Robb}
(Agent $e $x)
(To $e $x)

;; Experiencer ~ Location  cosine 0.04  JSD 0.94  n 261 / 210  shared: {Europe, Western Europe} {place, places} {village, villager, villagers}
(Experiencer $e $x)
(Location $e $x)

;; Experiencer ~ Source  cosine 0.04  JSD 0.953  n 261 / 47  shared: {place, places} {view, views, common, view, public, view, …} {ceiling, black, ceiling}
(Experiencer $e $x)
(Source $e $x)

;; Holder ~ To  cosine 0.04  JSD 0.949  n 48 / 46  shared: {thing, things} {repeat, repetition}
(Holder $e $x)
(To $e $x)

;; Goal ~ Manner  cosine 0.03  JSD 0.96  n 93 / 115  shared: {well, on, there, be} {happiness, happy, happily, joy} {back, backward, before, past}
(Goal $e $x)
(Manner $e $x)

;; Instrument ~ Patient  cosine 0.03  JSD 0.961  n 34 / 455  shared: {snow, snowstorm, deep, snow} {road, motorway, roads} {blood}
(Instrument $e $x)
(Patient $e $x)

;; Location ~ Theme  cosine 0.03  JSD 0.934  n 210 / 594  shared: {house, home, houses} {Santiago, Havana} {Gareccio, Bologna}
(Location $e $x)
(Theme $e $x)

;; Manner ~ Time  cosine 0.03  JSD 0.93  n 115 / 107  shared: {late, later, last} {immediately, instantly, right away} {back, backward, before, past}
(Manner $e $x)
(Time $e $x)

;; Experiencer ~ To  cosine 0.03  JSD 0.962  n 261 / 46  shared: {thing, things} {George Allen, James David Edgar, Chuck Robb} {doctor, doctors}
(Experiencer $e $x)
(To $e $x)

;; Agent ~ Goal  cosine 0.03  JSD 0.954  n 888 / 93  shared: {Linda, Amanda, Loren, Dora Smith, …} {house, home, houses} {campfire}
(Agent $e $x)
(Goal $e $x)

;; In ~ Result  cosine 0.03  JSD 0.97  n 50 / 43  shared: {silent, silence}
(In $e $x)
(Result $e $x)

;; Goal ~ Recipient  cosine 0.03  JSD 0.973  n 93 / 29  shared: {Linda, Amanda, Loren, Dora Smith, …}
(Goal $e $x)
(Recipient $e $x)

;; Instrument ~ Recipient  cosine 0.02  JSD 0.968  n 34 / 29  shared: {crop, rice crop, corn, crops}
(Instrument $e $x)
(Recipient $e $x)

;; Instrument ~ Stimulus  cosine 0.02  JSD 0.971  n 34 / 34  shared: {food, eat}
(Instrument $e $x)
(Stimulus $e $x)

;; In ~ Theme  cosine 0.02  JSD 0.973  n 50 / 594  shared: {language, english} {understand, misunderstand} {green, greenery}
(In $e $x)
(Theme $e $x)

;; Instrument ~ Theme  cosine 0.02  JSD 0.98  n 34 / 594  shared: {food, eat} {drum, snare, drums}
(Instrument $e $x)
(Theme $e $x)

;; Goal ~ Result  cosine 0.02  JSD 0.969  n 93 / 43  shared: {dead, die, death, die down, …} {well, on, there, be}
(Goal $e $x)
(Result $e $x)

;; In ~ Location  cosine 0.02  JSD 0.972  n 50 / 210  shared: {mat, mathematics} {water, water source, clear, water, good, water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; Instrument ~ Source  cosine 0.02  JSD 0.975  n 34 / 47  shared: {food, eat}
(Instrument $e $x)
(Source $e $x)

;; Source ~ Stimulus  cosine 0.02  JSD 0.975  n 47 / 34  shared: {food, eat}
(Source $e $x)
(Stimulus $e $x)

;; Experiencer ~ Instrument  cosine 0.02  JSD 0.974  n 261 / 34  shared: {train} {road, motorway, roads} {crop, rice crop, corn, crops}
(Experiencer $e $x)
(Instrument $e $x)

;; Location ~ To  cosine 0.02  JSD 0.978  n 210 / 46  shared: {talk, conversation, discussion} {shore, coast, shoreline}
(Location $e $x)
(To $e $x)

;; Agent ~ For  cosine 0.02  JSD 0.969  n 888 / 39  shared: {bus, bus ride} {cook} {ship, merchant ship, modern ship}
(Agent $e $x)
(For $e $x)

;; Goal ~ In  cosine 0.02  JSD 0.971  n 93 / 50  shared: {way, ways} {field, fields}
(Goal $e $x)
(In $e $x)

;; Holder ~ Instrument  cosine 0.02  JSD 0.975  n 48 / 34  shared: {food, eat}
(Holder $e $x)
(Instrument $e $x)

;; Result ~ Theme  cosine 0.02  JSD 0.975  n 43 / 594  shared: {sleep} {cheap, inexpensive, low, price} {powerful, power}
(Result $e $x)
(Theme $e $x)

;; In ~ Manner  cosine 0.02  JSD 0.977  n 50 / 115  shared: {really, real, reality, actual, …}
(In $e $x)
(Manner $e $x)

;; In ~ Stimulus  cosine 0.02  JSD 0.976  n 50 / 34  shared: {poetry}
(In $e $x)
(Stimulus $e $x)

;; Result ~ Source  cosine 0.02  JSD 0.978  n 43 / 47  shared: {bat}
(Result $e $x)
(Source $e $x)

;; In ~ Patient  cosine 0.02  JSD 0.978  n 50 / 455  shared: {weather} {field, fields} {water, water source, clear, water, good, water}
(In $e $x)
(Patient $e $x)

;; In ~ Source  cosine 0.02  JSD 0.979  n 50 / 47  shared: {way, ways}
(In $e $x)
(Source $e $x)

;; Experiencer ~ In  cosine 0.01  JSD 0.981  n 261 / 50  shared: {weather} {nothing, no, empty, zero, …}
(Experiencer $e $x)
(In $e $x)

;; Agent ~ Location  cosine 0.01  JSD 0.962  n 888 / 210  shared: {Santiago, Havana} {sun, sunlight, direct sun} {fire, burn, scorch}
(Agent $e $x)
(Location $e $x)

;; Agent ~ Result  cosine 0.01  JSD 0.978  n 888 / 43  shared: {indigenous, indigenous, people, native american, indigenous american, …} {crow, caw} {cold, frost}
(Agent $e $x)
(Result $e $x)

;; Location ~ Manner  cosine 0.01  JSD 0.988  n 210 / 115  shared: {well, on, there, be}
(Location $e $x)
(Manner $e $x)

;; Location ~ Recipient  cosine 0.01  JSD 0.983  n 210 / 29  shared: {city, cities}
(Location $e $x)
(Recipient $e $x)

;; Goal ~ Instrument  cosine 0.01  JSD 0.983  n 93 / 34  shared: {snow, snowstorm, deep, snow}
(Goal $e $x)
(Instrument $e $x)

;; Patient ~ Time  cosine 0.01  JSD 0.988  n 455 / 107  shared: {night, tonight, midnight} {summer, this summer}
(Patient $e $x)
(Time $e $x)

;; Experiencer ~ For  cosine 0.01  JSD 0.984  n 261 / 39  shared: {happiness, happy, happily, joy} {general, general purpose}
(Experiencer $e $x)
(For $e $x)

;; Experiencer ~ Manner  cosine 0.01  JSD 0.983  n 261 / 115  shared: {widespread, widely, wide, attention, widespread, …} {happiness, happy, happily, joy}
(Experiencer $e $x)
(Manner $e $x)

;; Agent ~ Instrument  cosine 0.01  JSD 0.984  n 888 / 34  shared: {train} {plant, plants} {snow, snowstorm, deep, snow}
(Agent $e $x)
(Instrument $e $x)

;; Agent ~ Source  cosine 0.01  JSD 0.988  n 888 / 47  shared: {plane, flight, aeroplane, airplane, …} {school, education}
(Agent $e $x)
(Source $e $x)

;; Manner ~ Theme  cosine 0.01  JSD 0.989  n 115 / 594  shared: {widespread, widely, wide, attention, widespread, …} {really, real, reality, actual, …}
(Manner $e $x)
(Theme $e $x)

;; Manner ~ Stimulus  cosine 0.01  JSD 0.985  n 115 / 34  shared: {difficult, hard, difficulty, harder}
(Manner $e $x)
(Stimulus $e $x)

;; Instrument ~ Location  cosine 0.01  JSD 0.99  n 34 / 210  shared: {snow, snowstorm, deep, snow}
(Instrument $e $x)
(Location $e $x)

;; For ~ Manner  cosine 0.01  JSD 0.986  n 39 / 115  shared: {happiness, happy, happily, joy}
(For $e $x)
(Manner $e $x)

;; Location ~ Result  cosine 0.01  JSD 0.991  n 210 / 43  shared: {well, on, there, be}
(Location $e $x)
(Result $e $x)

;; Goal ~ Time  cosine 0.01  JSD 0.986  n 93 / 107  shared: {back, backward, before, past}
(Goal $e $x)
(Time $e $x)

;; Source ~ Time  cosine 0.00  JSD 0.986  n 47 / 107  shared: {point, point out}
(Source $e $x)
(Time $e $x)

;; Theme ~ Time  cosine 0.00  JSD 0.995  n 594 / 107  shared: {morning, early morning, this morning}
(Theme $e $x)
(Time $e $x)

;; For ~ Patient  cosine 0.00  JSD 0.994  n 39 / 455  shared: {call, telephone call}
(For $e $x)
(Patient $e $x)

;; Agent ~ Manner  cosine 0.00  JSD 0.997  n 888 / 115  shared: {really, real, reality, actual, …}
(Agent $e $x)
(Manner $e $x)

;; Agent ~ Time  cosine 0.00  JSD 0.991  n 888 / 107  shared: {hurricane, hurricane season} {spring}
(Agent $e $x)
(Time $e $x)

;; Agent ~ In  cosine 0.00  JSD 0.997  n 888 / 50  shared: {really, real, reality, actual, …}
(Agent $e $x)
(In $e $x)

;; Experiencer ~ Time  cosine 0.00  JSD 1.0  n 261 / 107  shared: 
(Experiencer $e $x)
(Time $e $x)

;; For ~ Holder  cosine 0.00  JSD 1.0  n 39 / 48  shared: 
(For $e $x)
(Holder $e $x)

;; For ~ In  cosine 0.00  JSD 1.0  n 39 / 50  shared: 
(For $e $x)
(In $e $x)

;; For ~ Instrument  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Instrument $e $x)

;; For ~ Location  cosine 0.00  JSD 1.0  n 39 / 210  shared: 
(For $e $x)
(Location $e $x)

;; For ~ Recipient  cosine 0.00  JSD 1.0  n 39 / 29  shared: 
(For $e $x)
(Recipient $e $x)

;; For ~ Result  cosine 0.00  JSD 1.0  n 39 / 43  shared: 
(For $e $x)
(Result $e $x)

;; For ~ Source  cosine 0.00  JSD 1.0  n 39 / 47  shared: 
(For $e $x)
(Source $e $x)

;; For ~ Stimulus  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Stimulus $e $x)

;; For ~ Time  cosine 0.00  JSD 1.0  n 39 / 107  shared: 
(For $e $x)
(Time $e $x)

;; For ~ To  cosine 0.00  JSD 1.0  n 39 / 46  shared: 
(For $e $x)
(To $e $x)

;; Goal ~ Stimulus  cosine 0.00  JSD 1.0  n 93 / 34  shared: 
(Goal $e $x)
(Stimulus $e $x)

;; Goal ~ To  cosine 0.00  JSD 1.0  n 93 / 46  shared: 
(Goal $e $x)
(To $e $x)

;; Holder ~ In  cosine 0.00  JSD 1.0  n 48 / 50  shared: 
(Holder $e $x)
(In $e $x)

;; Holder ~ Manner  cosine 0.00  JSD 1.0  n 48 / 115  shared: 
(Holder $e $x)
(Manner $e $x)

;; Holder ~ Recipient  cosine 0.00  JSD 1.0  n 48 / 29  shared: 
(Holder $e $x)
(Recipient $e $x)

;; Holder ~ Result  cosine 0.00  JSD 1.0  n 48 / 43  shared: 
(Holder $e $x)
(Result $e $x)

;; Holder ~ Time  cosine 0.00  JSD 1.0  n 48 / 107  shared: 
(Holder $e $x)
(Time $e $x)

;; In ~ Instrument  cosine 0.00  JSD 1.0  n 50 / 34  shared: 
(In $e $x)
(Instrument $e $x)

;; In ~ Recipient  cosine 0.00  JSD 1.0  n 50 / 29  shared: 
(In $e $x)
(Recipient $e $x)

;; In ~ Time  cosine 0.00  JSD 1.0  n 50 / 107  shared: 
(In $e $x)
(Time $e $x)

;; In ~ To  cosine 0.00  JSD 1.0  n 50 / 46  shared: 
(In $e $x)
(To $e $x)

;; Instrument ~ Manner  cosine 0.00  JSD 1.0  n 34 / 115  shared: 
(Instrument $e $x)
(Manner $e $x)

;; Instrument ~ Result  cosine 0.00  JSD 1.0  n 34 / 43  shared: 
(Instrument $e $x)
(Result $e $x)

;; Instrument ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Instrument $e $x)
(Time $e $x)

;; Instrument ~ To  cosine 0.00  JSD 1.0  n 34 / 46  shared: 
(Instrument $e $x)
(To $e $x)

;; Location ~ Stimulus  cosine 0.00  JSD 1.0  n 210 / 34  shared: 
(Location $e $x)
(Stimulus $e $x)

;; Location ~ Time  cosine 0.00  JSD 1.0  n 210 / 107  shared: 
(Location $e $x)
(Time $e $x)

;; Manner ~ Patient  cosine 0.00  JSD 1.0  n 115 / 455  shared: 
(Manner $e $x)
(Patient $e $x)

;; Manner ~ Recipient  cosine 0.00  JSD 1.0  n 115 / 29  shared: 
(Manner $e $x)
(Recipient $e $x)

;; Manner ~ Source  cosine 0.00  JSD 1.0  n 115 / 47  shared: 
(Manner $e $x)
(Source $e $x)

;; Manner ~ To  cosine 0.00  JSD 1.0  n 115 / 46  shared: 
(Manner $e $x)
(To $e $x)

;; Recipient ~ Result  cosine 0.00  JSD 1.0  n 29 / 43  shared: 
(Recipient $e $x)
(Result $e $x)

;; Recipient ~ Source  cosine 0.00  JSD 1.0  n 29 / 47  shared: 
(Recipient $e $x)
(Source $e $x)

;; Recipient ~ Time  cosine 0.00  JSD 1.0  n 29 / 107  shared: 
(Recipient $e $x)
(Time $e $x)

;; Recipient ~ To  cosine 0.00  JSD 1.0  n 29 / 46  shared: 
(Recipient $e $x)
(To $e $x)

;; Result ~ Stimulus  cosine 0.00  JSD 1.0  n 43 / 34  shared: 
(Result $e $x)
(Stimulus $e $x)

;; Result ~ Time  cosine 0.00  JSD 1.0  n 43 / 107  shared: 
(Result $e $x)
(Time $e $x)

;; Result ~ To  cosine 0.00  JSD 1.0  n 43 / 46  shared: 
(Result $e $x)
(To $e $x)

;; Source ~ To  cosine 0.00  JSD 1.0  n 47 / 46  shared: 
(Source $e $x)
(To $e $x)

;; Stimulus ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Stimulus $e $x)
(Time $e $x)

;; Time ~ To  cosine 0.00  JSD 1.0  n 107 / 46  shared: 
(Time $e $x)
(To $e $x)

;; ==================== subtree @ cluster cos 0.85: slot pairs (3 event-center signals) ====================

;; [same role, different class]  accompany.Agent ~ appear.Agent  cosine 0.76  JSD 0.23  n 4 / 6  shared: {sister, sisters} {person, people}
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000050 tierC-000259
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; [same role, different class]  design.Agent ~ produce.Agent  cosine 0.87  JSD 0.25  n 4 / 8  shared: {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …} {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …}
;;   A e.g. tierC-000184 tierC-000119   B e.g. tierC-000103 tierC-000104
(And (Member $e0 design) (Agent $e0 $x1))
(And (Member $e0 produce) (Agent $e0 $x1))

;; [different class and role]  die.Patient ~ sleep.Agent  cosine 0.99  JSD 0.006  n 4 / 3  shared: {person, people} {family, families}
;;   A e.g. tierB-001967 tierC-000199   B e.g. tierC-000041 tierC-000042
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 sleep) (Agent $e0 $x1))

;; ==================== subtree @ cluster cos 0.85: compared slots with their distributions (269 slots, n >= 3) ====================

;; ---- slot <unclassed>.LocatedIn  [entity center]  n 46  clusters 38
(LocatedIn $x0 $x1)
;;     c2205  mass 3  {here}
;;     c1002  mass 2  {garden}
;;      c184  mass 2  {city, cities}
;;      c189  mass 2  {southern}
;;       c30  mass 2  {Loglan, Lojban}
;;      c769  mass 2  {class}
;;      c807  mass 2  {island, Derwent Isle}
;;     c1021  mass 1  {tree, trees}
;;     c1096  mass 1  {basket, basket, red}
;;     c1222  mass 1  {country}
;;     c1253  mass 1  {Tatoeba}
;;     c1405  mass 1  {ceiling, black, ceiling}
;;     c1406  mass 1  {floor, wood floor}
;;     c1418  mass 1  {wall, cold, wall}
;;     c1425  mass 1  {house, home, houses}
;;     c1434  mass 1  {full, place}
;;     c1438  mass 1  {storehouse, storeroom}
;;     c1486  mass 1  {fountain, fountain, full}
;;     c1542  mass 1  {table}
;;     c1773  mass 1  {play}
;;      c199  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}
;;      c200  mass 1  {El Harrach}
;;      c212  mass 1  {Russian Far East, Siberia}
;;      c222  mass 1  {Colombia, Cuba, Peru, Venezuela}
;;      c224  mass 1  {India, Indonesia}
;;      c225  mass 1  {Japan, China}
;;      c234  mass 1  {Gaul}
;;      c235  mass 1  {England, UK}
;;      c251  mass 1  {movie, film}
;;      c344  mass 1  {market}
;;      c478  mass 1  {world}
;;      c530  mass 1  {park, parking lot, parking}
;;      c539  mass 1  {street, road, street}
;;      c777  mass 1  {Dianchi Lake, Lake Dianchi}
;;      c789  mass 1  {Huancavelica}
;;      c804  mass 1  {sea, ocean}
;;      c936  mass 1  {full, kitchen sink}
;;      c994  mass 1  {village, villager, villagers}

;; ---- slot have.Holder  [event center]  n 44  clusters 38
(And (Member $e0 have) (Holder $e0 $x1))
;;      c650  mass 4  {Kristoffer}
;;      c185  mass 2  {town, towns}
;;     c2154  mass 2  {thing, things}
;;      c693  mass 2  {Karen, Ken}
;;     c1007  mass 1  {Ivy, ivy}
;;     c1040  mass 1  {creature, enemy, monster}
;;     c1251  mass 1  {sentence, sentences}
;;     c1257  mass 1  {word, word processor}
;;     c1425  mass 1  {house, home, houses}
;;     c1430  mass 1  {tower}
;;     c1432  mass 1  {place, places}
;;     c1435  mass 1  {hotel}
;;     c1449  mass 1  {room, rooms}
;;     c1503  mass 1  {bad, weather}
;;     c1703  mass 1  {february}
;;      c197  mass 1  {tuareg, tuaregs}
;;      c199  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}
;;      c220  mass 1  {Algeria, Morocco}
;;     c2328  mass 1  {decide, decision, choose, option}
;;      c236  mass 1  {Scotland}
;;     c2364  mass 1  {repeat, repetition}
;;      c251  mass 1  {movie, film}
;;      c267  mass 1  {mosque, mosque, old}
;;      c332  mass 1  {insurance}
;;      c449  mass 1  {library}
;;      c451  mass 1  {author, writer, novelist}
;;      c470  mass 1  {lawyer}
;;      c529  mass 1  {gas station, gas pump, gas pumps}
;;      c607  mass 1  {Wilson, wilson}
;;      c641  mass 1  {Boris, Ivan, Dmitri, Rasputin}
;;      c658  mass 1  {Boldi, Bruno, Frankie}
;;      c661  mass 1  {Thomas, Tom, Tommy}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c687  mass 1  {Janos, Miroslav, Lajos}
;;      c728  mass 1  {homentropic current}
;;      c729  mass 1  {homentropic flow}
;;      c804  mass 1  {sea, ocean}
;;      c968  mass 1  {food, eat}

;; ---- slot have.Theme  [event center]  n 43  clusters 38
(And (Member $e0 have) (Theme $e0 $x1))
;;     c1196  mass 4  {child, children, kid, kids}
;;     c1142  mass 2  {constant, entropy, uniform}
;;     c2182  mass 2  {representation, represent}
;;     c1001  mass 1  {beautiful, garden}
;;     c1003  mass 1  {leaf, foliage, leaves}
;;     c1028  mass 1  {predictable, plot, predictable}
;;     c1071  mass 1  {antler, antlers}
;;     c1075  mass 1  {herd, herds}
;;     c1167  mass 1  {friend, friends}
;;     c1287  mass 1  {soul piercing, soul piercing, stare}
;;     c1310  mass 1  {nasty, nasty, personality}
;;     c1327  mass 1  {eerie, eerie, feeling}
;;     c1330  mass 1  {dream, dream, weird}
;;     c1403  mass 1  {roof, conical, roof}
;;     c1457  mass 1  {blue, curtain}
;;     c1597  mass 1  {homely, atmosphere, homely}
;;     c1652  mass 1  {value}
;;     c1658  mass 1  {reputation}
;;     c1721  mass 1  {day, days, days, short}
;;     c1876  mass 1  {chance}
;;     c1897  mass 1  {color}
;;     c2047  mass 1  {meaning, meanings}
;;     c2061  mass 1  {effect}
;;     c2154  mass 1  {thing, things}
;;     c2159  mass 1  {purpose, purpose, single}
;;     c2165  mass 1  {right}
;;     c2168  mass 1  {thought, think}
;;       c22  mass 1  {bank, documents, valuable}
;;     c2376  mass 1  {consequences, serious, wide}
;;      c261  mass 1  {cemetery, cemetery chapel, cemeteries}
;;      c291  mass 1  {history, rich}
;;      c331  mass 1  {deductible, deductible, high}
;;      c482  mass 1  {internal politics, internal politics, intriguing}
;;      c529  mass 1  {gas station, gas pump, gas pumps}
;;      c564  mass 1  {guard, bodyguard, guards}
;;       c69  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;      c744  mass 1  {parenthetic, parenthetic, style}
;;      c904  mass 1  {taste test, taste, nice, taste, taste tests}

;; ---- slot <unclassed>.Possession  [entity center]  n 30  clusters 17
(Possession $x0 $x1)
;;     c1161  mass 5  {person, people}
;;      c464  mass 4  {Free Soil Party}
;;      c465  mass 4  {Republican Party}
;;      c266  mass 2  {sunni community, sunni, communities, neighbouring, other, sunni, sunni communities}
;;      c312  mass 2  {subsequent game}
;;      c740  mass 2  {logical phrase, logical proposition}
;;     c1217  mass 1  {Twilight}
;;     c1222  mass 1  {country}
;;      c143  mass 1  {Yunnan}
;;     c1823  mass 1  {generalization, easy, generalization}
;;     c2070  mass 1  {union}
;;     c2154  mass 1  {thing, things}
;;      c414  mass 1  {islamic ivory, ivory}
;;      c557  mass 1  {radical group}
;;      c589  mass 1  {God}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;      c819  mass 1  {Jupiter}

;; ---- slot use.Theme  [event center]  n 23  clusters 21
(And (Member $e0 use) (Theme $e0 $x1))
;;        c3  mass 2  {banach mackey topology}
;;        c4  mass 2  {weak arens space topology}
;;     c1240  mass 1  {metaphor}
;;     c1249  mass 1  {phrase}
;;     c1251  mass 1  {sentence, sentences}
;;     c1257  mass 1  {word, word processor}
;;     c1449  mass 1  {room, rooms}
;;     c1473  mass 1  {fire, burn, scorch}
;;     c1550  mass 1  {machine}
;;     c2382  mass 1  {public fund}
;;      c292  mass 1  {calendars, various}
;;      c392  mass 1  {chemical agent}
;;       c55  mass 1  {Midway}
;;      c556  mass 1  {paramilitary group}
;;      c633  mass 1  {Baya, Iga, Keike}
;;       c83  mass 1  {Laravel}
;;       c84  mass 1  {naming convention, current, naming convention}
;;       c85  mass 1  {designation convention, current, designation convention}
;;      c857  mass 1  {jingle}
;;      c869  mass 1  {auto tune, tune}
;;      c921  mass 1  {sugar}

;; ---- slot make.Patient  [event center]  n 20  clusters 20
(And (Member $e0 make) (Patient $e0 $x1))
;;     c1290  mass 1  {eye contact}
;;     c1347  mass 1  {bad, bad, matter, bad, problem}
;;     c1423  mass 1  {comfortable, house}
;;     c1451  mass 1  {beautiful, room}
;;     c1498  mass 1  {snowman, big, snowman}
;;     c1643  mass 1  {buy, purchase}
;;     c1828  mass 1  {copes}
;;     c1953  mass 1  {claim, claims}
;;     c2043  mass 1  {difference, different, distinction, distinguish, …}
;;     c2044  mass 1  {big, difference}
;;      c219  mass 1  {Afghanistan, Iran, Iraq, Persia}
;;      c437  mass 1  {paper, paper sheet, paper sheets}
;;       c58  mass 1  {call, telephone call}
;;      c592  mass 1  {Augustus}
;;      c626  mass 1  {Katherine, Isabella, Kate}
;;      c833  mass 1  {travel}
;;      c846  mass 1  {high pitched, high pitched, noise}
;;      c861  mass 1  {clicking, clicking, sound}
;;      c910  mass 1  {cup, plastic cup}
;;      c960  mass 1  {chicken fried steak}

;; ---- slot build.Patient  [event center]  n 18  clusters 8
(And (Member $e0 build) (Patient $e0 $x1))
;;     c1435  mass 4  {hotel}
;;      c438  mass 4  {paper factory, paper mill}
;;     c1449  mass 3  {room, rooms}
;;     c2154  mass 2  {thing, things}
;;     c2246  mass 2  {horn}
;;     c1564  mass 1  {network, wells}
;;      c306  mass 1  {playground, new, playground}
;;       c49  mass 1  {turing machine, original, turing machine}

;; ---- slot make.Agent  [event center]  n 18  clusters 17
(And (Member $e0 make) (Agent $e0 $x1))
;;      c689  mass 2  {Martino, Pietro, Lorenzo, Damiano}
;;     c1037  mass 1  {cat, cats}
;;     c1178  mass 1  {man, guy}
;;     c1194  mass 1  {boy, boys}
;;     c1456  mass 1  {curtain, curtains}
;;     c1495  mass 1  {wind, gusty, winds}
;;     c1632  mass 1  {artistic beauty}
;;     c1825  mass 1  {practical utility}
;;     c2154  mass 1  {thing, things}
;;      c554  mass 1  {Taliban}
;;      c592  mass 1  {Augustus}
;;       c62  mass 1  {customer, customers}
;;      c631  mass 1  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c651  mass 1  {William, James}
;;      c652  mass 1  {David}
;;      c679  mass 1  {Elias, Gabriel}
;;      c926  mass 1  {restaurant, diner}

;; ---- slot go.Agent  [event center]  n 15  clusters 14
(And (Member $e0 go) (Agent $e0 $x1))
;;      c626  mass 2  {Katherine, Isabella, Kate}
;;     c1037  mass 1  {cat, cats}
;;     c1171  mass 1  {Mom, mother, mom}
;;     c1196  mass 1  {child, children, kid, kids}
;;      c625  mass 1  {Olivia, Sophia}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;      c631  mass 1  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c648  mass 1  {Matthew}
;;      c656  mass 1  {Donald}
;;      c672  mass 1  {Mennad, Lessos}
;;      c688  mass 1  {Adriano, Claudio, Flavio}
;;      c692  mass 1  {Daniel}
;;      c694  mass 1  {Kalman}
;;      c762  mass 1  {pupil, pupils}

;; ---- slot play.Agent  [event center]  n 15  clusters 9
(And (Member $e0 play) (Agent $e0 $x1))
;;     c1196  mass 4  {child, children, kid, kids}
;;      c567  mass 2  {Boston Red Sox}
;;      c568  mass 2  {Cincinnati Reds}
;;      c616  mass 2  {Audrey Hepburn, Audrey Heppurn}
;;     c1194  mass 1  {boy, boys}
;;      c128  mass 1  {biology}
;;      c274  mass 1  {religion, faith}
;;      c631  mass 1  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c662  mass 1  {Tony}

;; ---- slot build.Agent  [event center]  n 14  clusters 5
(And (Member $e0 build) (Agent $e0 $x1))
;;     c1119  mass 8  {company, corporation}
;;     c1161  mass 2  {person, people}
;;      c716  mass 2  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;;      c196  mass 1  {mozabite, mozabites}
;;      c751  mass 1  {community}

;; ---- slot find.Location  [event center]  n 14  clusters 10
(And (Member $e0 find) (Location $e0 $x1))
;;      c143  mass 2  {Yunnan}
;;      c189  mass 2  {southern}
;;     c2030  mass 2  {bench}
;;      c779  mass 2  {tributary, tributaries}
;;     c1224  mass 1  {west, western}
;;      c165  mass 1  {station}
;;      c210  mass 1  {Europe, Western Europe}
;;      c262  mass 1  {tomb}
;;      c777  mass 1  {Dianchi Lake, Lake Dianchi}
;;      c803  mass 1  {desert, Sahara Desert}

;; ---- slot <unclassed>.SubsetOf  [entity center]  n 13  clusters 12
(SubsetOf $x0 $x1)
;;     c1161  mass 2  {person, people}
;;      c105  mass 1  {refugee, refugees}
;;     c1055  mass 1  {centipede, centipedes, pillar}
;;     c1198  mass 1  {chick, chicks}
;;     c1199  mass 1  {girl, girls}
;;     c1546  mass 1  {window, windows}
;;     c1642  mass 1  {store, shop, shopping, shops}
;;      c169  mass 1  {corner, corners}
;;      c447  mass 1  {mayan book, mayan books}
;;      c504  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c762  mass 1  {pupil, pupils}
;;      c994  mass 1  {village, villager, villagers}

;; ---- slot start.Theme  [event center]  n 13  clusters 13
(And (Member $e0 start) (Theme $e0 $x1))
;;     c1302  mass 1  {vomit}
;;     c1483  mass 1  {cry}
;;     c1772  mass 1  {hear, listen}
;;     c1775  mass 1  {talk, conversation, discussion}
;;     c1863  mass 1  {improve}
;;     c1966  mass 1  {disappear, vanish}
;;     c2093  mass 1  {run out, run away}
;;     c2254  mass 1  {roll, roller, roll over}
;;     c2266  mass 1  {appear, show up}
;;     c2268  mass 1  {show}
;;      c767  mass 1  {high school}
;;        c8  mass 1  {light headed, feel, light headed}
;;      c879  mass 1  {song, sing, chant}

;; ---- slot go.Goal  [event center]  n 12  clusters 9
(And (Member $e0 go) (Goal $e0 $x1))
;;     c1717  mass 4  {bed}
;;      c116  mass 1  {hospital}
;;     c1432  mass 1  {place, places}
;;     c1453  mass 1  {bathroom}
;;      c542  mass 1  {way, ways}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;       c69  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;       c72  mass 1  {supermarket}
;;      c766  mass 1  {school, education}

;; ---- slot study.Agent  [event center]  n 12  clusters 9
(And (Member $e0 study) (Agent $e0 $x1))
;;     c1161  mass 3  {person, people}
;;       c47  mass 2  {scientist, scientists}
;;       c42  mass 1  {forensics researcher, forensics researchers}
;;      c590  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c627  mass 1  {Jessica, Beth}
;;      c636  mass 1  {Peter}
;;      c639  mass 1  {Yuri}
;;      c668  mass 1  {Fadil, Jamil}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}

;; ---- slot <unclassed>.PartOf  [entity center]  n 11  clusters 10
(PartOf $x0 $x1)
;;      c577  mass 2  {Khurda Road}
;;     c1007  mass 1  {Ivy, ivy}
;;     c1012  mass 1  {plant, plants}
;;     c1081  mass 1  {animal, animals}
;;      c143  mass 1  {Yunnan}
;;     c1773  mass 1  {play}
;;      c414  mass 1  {islamic ivory, ivory}
;;      c539  mass 1  {street, road, street}
;;      c759  mass 1  {student association, student associations}
;;      c952  mass 1  {cake, pie}

;; ---- slot become.Patient  [event center]  n 11  clusters 9
(And (Member $e0 become) (Patient $e0 $x1))
;;     c1348  mass 2  {bad, relationship}
;;       c93  mass 2  {indigenous, indigenous, people, native american, indigenous american, …}
;;     c1669  mass 1  {discipline, lax}
;;     c2154  mass 1  {thing, things}
;;      c462  mass 1  {conservative, conservative, revolutionary}
;;      c629  mass 1  {Lady Ashton}
;;      c630  mass 1  {inomaru, inomaru, person}
;;      c794  mass 1  {earth, red}
;;      c848  mass 1  {intense, noise}

;; ---- slot begin.Agent  [event center]  n 11  clusters 9
(And (Member $e0 begin) (Agent $e0 $x1))
;;       c93  mass 2  {indigenous, indigenous, people, native american, indigenous american, …}
;;       c99  mass 2  {european american settler, european american settlers}
;;     c1269  mass 1  {Mark}
;;     c1272  mass 1  {crowd, crowd, whole}
;;     c1742  mass 1  {rebel, rebels}
;;      c558  mass 1  {legionnaire, legionnaires}
;;      c627  mass 1  {Jessica, Beth}
;;      c651  mass 1  {William, James}
;;      c652  mass 1  {David}

;; ---- slot begin.Theme  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Theme $e0 $x1))
;;     c2008  mass 4  {create}
;;     c1285  mass 1  {applaud}
;;     c1340  mass 1  {confess}
;;     c1886  mass 1  {bud}
;;     c2006  mass 1  {make}
;;     c2236  mass 1  {hang out}
;;     c2273  mass 1  {distribute}
;;      c375  mass 1  {torture}

;; ---- slot build.Location  [event center]  n 11  clusters 4
(And (Member $e0 build) (Location $e0 $x1))
;;      c214  mass 4  {Kazakhstan}
;;      c140  mass 3  {Eskisehir, Giresun}
;;      c240  mass 3  {Turkey}
;;      c199  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}

;; ---- slot kill.Patient  [event center]  n 11  clusters 6
(And (Member $e0 kill) (Patient $e0 $x1))
;;     c1161  mass 6  {person, people}
;;     c1046  mass 1  {zombie, zombies}
;;     c1076  mass 1  {gazelle, giraffe, giraffes}
;;     c1087  mass 1  {fox, ox}
;;      c560  mass 1  {soldier, warrior}
;;      c562  mass 1  {army, soldiers, troops}

;; ---- slot produce.Patient  [event center]  n 11  clusters 6
(And (Member $e0 produce) (Patient $e0 $x1))
;;      c251  mass 4  {movie, film}
;;      c250  mass 2  {syrian film, film, syrian film, destined, film, syrian film}
;;      c881  mass 2  {album}
;;      c126  mass 1  {insulin}
;;     c1624  mass 1  {mesmerizing, sheen}
;;      c394  mass 1  {cyanide, harmless, trace}

;; ---- slot start.Patient  [event center]  n 11  clusters 11
(And (Member $e0 start) (Patient $e0 $x1))
;;     c1033  mass 1  {dog, dog feed}
;;     c1280  mass 1  {concert}
;;     c1708  mass 1  {watermelon season}
;;     c1971  mass 1  {crack, cracked}
;;        c2  mass 1  {national fibre optic network project}
;;     c2004  mass 1  {knock}
;;     c2154  mass 1  {thing, things}
;;      c420  mass 1  {blue, pockets, sky}
;;      c455  mass 1  {freedom movement, gusher}
;;      c520  mass 1  {truck}
;;      c820  mass 1  {Milky Way}

;; ---- slot find.Theme  [event center]  n 10  clusters 6
(And (Member $e0 find) (Theme $e0 $x1))
;;     c2154  mass 4  {thing, things}
;;      c526  mass 2  {Couper}
;;      c412  mass 1  {clay figurine, clay figurines}
;;      c437  mass 1  {paper, paper sheet, paper sheets}
;;      c689  mass 1  {Martino, Pietro, Lorenzo, Damiano}
;;      c800  mass 1  {meteorite}

;; ---- slot leave.Agent  [event center]  n 10  clusters 10
(And (Member $e0 leave) (Agent $e0 $x1))
;;     c1161  mass 1  {person, people}
;;       c12  mass 1  {ship, merchant ship, modern ship}
;;      c504  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c515  mass 1  {bus, bus ride}
;;      c522  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}
;;      c641  mass 1  {Boris, Ivan, Dmitri, Rasputin}
;;      c645  mass 1  {Michael, Marco, Marcus}
;;      c661  mass 1  {Thomas, Tom, Tommy}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c711  mass 1  {Brian}

;; ---- slot serve.Agent  [event center]  n 10  clusters 8
(And (Member $e0 serve) (Agent $e0 $x1))
;;      c146  mass 2  {Ipswich, Ipswich & Rosewood}
;;      c148  mass 2  {Indooroopilly}
;;     c1161  mass 1  {person, people}
;;     c1173  mass 1  {grandmother}
;;     c1214  mass 1  {Rosewood}
;;      c609  mass 1  {president, person, president}
;;      c687  mass 1  {Janos, Miroslav, Lajos}
;;      c714  mass 1  {Yair Stern, Yitzhak}

;; ---- slot take.Theme  [event center]  n 10  clusters 9
(And (Member $e0 take) (Theme $e0 $x1))
;;     c1160  mass 2  {identity, identify}
;;     c1117  mass 1  {office}
;;     c1519  mass 1  {portray, portrait, portrayal}
;;     c1807  mass 1  {powerful, power}
;;     c1811  mass 1  {drastic, drastic, measures}
;;     c2154  mass 1  {thing, things}
;;     c2254  mass 1  {roll, roller, roll over}
;;     c2363  mass 1  {close, look}
;;     c2365  mass 1  {while}

;; ---- slot try.Agent  [event center]  n 10  clusters 10
(And (Member $e0 try) (Agent $e0 $x1))
;;     c1073  mass 1  {crocodile}
;;     c1119  mass 1  {company, corporation}
;;     c1192  mass 1  {man, young}
;;     c1269  mass 1  {Mark}
;;      c154  mass 1  {Santiago, Havana}
;;      c652  mass 1  {David}
;;      c659  mass 1  {Felix}
;;      c664  mass 1  {Roger, Bob, Bobby, Robbie, …}
;;      c688  mass 1  {Adriano, Claudio, Flavio}
;;      c814  mass 1  {alien}

;; ---- slot write.Patient  [event center]  n 10  clusters 8
(And (Member $e0 write) (Patient $e0 $x1))
;;     c1570  mass 2  {episode}
;;      c879  mass 2  {song, sing, chant}
;;     c1158  mass 1  {character}
;;     c1251  mass 1  {sentence, sentences}
;;     c1254  mass 1  {screenplay}
;;     c1255  mass 1  {script}
;;     c1839  mass 1  {letter}
;;      c448  mass 1  {book, books}

;; ---- slot fall.Patient  [event center]  n 9  clusters 9
(And (Member $e0 fall) (Patient $e0 $x1))
;;     c1198  mass 1  {chick, chicks}
;;     c1263  mass 1  {hush of anticipation}
;;     c1376  mass 1  {dead, rotten, tree}
;;     c1500  mass 1  {snow, snowstorm, deep, snow}
;;     c1537  mass 1  {scaffolding}
;;     c1970  mass 1  {forest, silent}
;;      c448  mass 1  {book, books}
;;      c762  mass 1  {pupil, pupils}
;;      c917  mass 1  {ice, ice pellet}

;; ---- slot follow.Agent  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Agent $e0 $x1))
;;     c1884  mass 2  {bhadala, bhadalas}
;;      c268  mass 2  {muslim house, house, muslim}
;;     c1050  mass 1  {beast, crawling}
;;      c541  mass 1  {road, motorway, roads}
;;      c593  mass 1  {Alexander}
;;      c666  mass 1  {Bailey}
;;      c669  mass 1  {Sami}

;; ---- slot follow.Theme  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Theme $e0 $x1))
;;      c190  mass 2  {region, regions}
;;      c288  mass 2  {tradition, traditions}
;;      c618  mass 1  {Layla}
;;      c624  mass 1  {Margaret Fleming, Martha, Anne, Marie}
;;      c684  mass 1  {Lukas}
;;      c706  mass 1  {Henry Cole}
;;      c808  mass 1  {shore, coast, shoreline}

;; ---- slot hear.Stimulus  [event center]  n 9  clusters 9
(And (Member $e0 hear) (Stimulus $e0 $x1))
;;     c1362  mass 1  {crash}
;;     c1587  mass 1  {shoot, shot}
;;     c1999  mass 1  {bang, burst}
;;     c2004  mass 1  {knock}
;;     c2154  mass 1  {thing, things}
;;     c2222  mass 1  {start, begin}
;;      c842  mass 1  {barking, growling, noises}
;;      c853  mass 1  {noise, ticking}
;;      c867  mass 1  {upbeat, music, upbeat}

;; ---- slot kill.Agent  [event center]  n 9  clusters 6
(And (Member $e0 kill) (Agent $e0 $x1))
;;     c1489  mass 4  {hurricane, hurricane season}
;;     c1089  mass 1  {tiger, lion, lions}
;;      c125  mass 1  {cancer}
;;     c1473  mass 1  {fire, burn, scorch}
;;     c1588  mass 1  {hunter}
;;      c641  mass 1  {Boris, Ivan, Dmitri, Rasputin}

;; ---- slot sing.Agent  [event center]  n 9  clusters 7
(And (Member $e0 sing) (Agent $e0 $x1))
;;     c1154  mass 2  {sister, sisters}
;;     c1161  mass 2  {person, people}
;;     c1065  mass 1  {bird, bird dropping, birds}
;;     c1111  mass 1  {groups, professional}
;;      c583  mass 1  {actress, actor}
;;      c652  mass 1  {David}
;;      c882  mass 1  {Amateur Barbershop Harmony Society}

;; ---- slot take.Agent  [event center]  n 9  clusters 8
(And (Member $e0 take) (Agent $e0 $x1))
;;     c1161  mass 2  {person, people}
;;     c2154  mass 1  {thing, things}
;;      c602  mass 1  {Jerry Rawlings}
;;      c609  mass 1  {president, person, president}
;;      c645  mass 1  {Michael, Marco, Marcus}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c687  mass 1  {Janos, Miroslav, Lajos}
;;      c956  mass 1  {cook}

;; ---- slot become.Result  [event center]  n 8  clusters 7
(And (Member $e0 become) (Result $e0 $x1))
;;     c1347  mass 2  {bad, bad, matter, bad, problem}
;;     c1335  mass 1  {alarmed}
;;      c163  mass 1  {lax}
;;     c1738  mass 1  {red}
;;      c462  mass 1  {conservative, conservative, revolutionary}
;;      c630  mass 1  {inomaru, inomaru, person}
;;       c93  mass 1  {indigenous, indigenous, people, native american, indigenous american, …}

;; ---- slot change.Patient  [event center]  n 8  clusters 7
(And (Member $e0 change) (Patient $e0 $x1))
;;     c1504  mass 2  {weather}
;;     c1162  mass 1  {name}
;;     c1487  mass 1  {rain, rainwater, fresh, rain}
;;     c1897  mass 1  {color}
;;     c2154  mass 1  {thing, things}
;;      c736  mass 1  {mind, mental, mental world}
;;      c774  mass 1  {course}

;; ---- slot hear.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 hear) (Experiencer $e0 $x1))
;;      c658  mass 2  {Boldi, Bruno, Frankie}
;;      c640  mass 1  {Oleg, Vladimir}
;;      c651  mass 1  {William, James}
;;      c663  mass 1  {Jonas, John, Jonathan, Jack, …}
;;      c668  mass 1  {Fadil, Jamil}
;;      c688  mass 1  {Adriano, Claudio, Flavio}
;;      c689  mass 1  {Martino, Pietro, Lorenzo, Damiano}

;; ---- slot live.Agent  [event center]  n 8  clusters 8
(And (Member $e0 live) (Agent $e0 $x1))
;;     c1086  mass 1  {wolf, wolves}
;;      c198  mass 1  {Beja}
;;      c646  mass 1  {Mary, Maria}
;;      c674  mass 1  {Ziri, Tiziri}
;;      c675  mass 1  {Yidir}
;;      c679  mass 1  {Elias, Gabriel}
;;      c698  mass 1  {Ray Kurtzweil}
;;      c724  mass 1  {Cainan}

;; ---- slot live.Location  [event center]  n 8  clusters 7
(And (Member $e0 live) (Location $e0 $x1))
;;      c243  mass 2  {Denmark, Norway, Sweden}
;;     c1421  mass 1  {cottage, isolated, house, isolated}
;;     c1423  mass 1  {comfortable, house}
;;     c1424  mass 1  {house, large}
;;     c1697  mass 1  {group}
;;      c170  mass 1  {southeastern corner}
;;      c182  mass 1  {suburb}

;; ---- slot need.Experiencer  [event center]  n 8  clusters 8
(And (Member $e0 need) (Experiencer $e0 $x1))
;;      c112  mass 1  {doctor, doctors}
;;     c1196  mass 1  {child, children, kid, kids}
;;      c220  mass 1  {Algeria, Morocco}
;;     c2226  mass 1  {gate}
;;      c649  mass 1  {Karl}
;;      c689  mass 1  {Martino, Pietro, Lorenzo, Damiano}
;;      c713  mass 1  {Yanni}
;;      c975  mass 1  {sauce}

;; ---- slot open.Patient  [event center]  n 8  clusters 4
(And (Member $e0 open) (Patient $e0 $x1))
;;     c1415  mass 4  {door, door, open, door, unlocked}
;;      c466  mass 2  {law, laws, legal}
;;     c1407  mass 1  {vault like, door, vault like}
;;      c336  mass 1  {bank}

;; ---- slot play.Theme  [event center]  n 8  clusters 5
(And (Member $e0 play) (Theme $e0 $x1))
;;     c1847  mass 2  {crucial, role, important, role}
;;      c300  mass 2  {tennis}
;;      c617  mass 2  {Holly Golightly}
;;     c1569  mass 1  {series}
;;      c889  mass 1  {harp}

;; ---- slot produce.Agent  [event center]  n 8  clusters 4
(And (Member $e0 produce) (Agent $e0 $x1))
;;      c718  mass 4  {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …}
;;      c716  mass 2  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;;      c127  mass 1  {pancreas}
;;      c387  mass 1  {layer, oil, thin}

;; ---- slot speak.Agent  [event center]  n 8  clusters 6
(And (Member $e0 speak) (Agent $e0 $x1))
;;      c625  mass 2  {Olivia, Sophia}
;;      c678  mass 2  {Oates}
;;     c1176  mass 1  {omen, men}
;;      c598  mass 1  {Xavier}
;;      c631  mass 1  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c726  mass 1  {Kari Wahlgren}

;; ---- slot talk.Agent  [event center]  n 8  clusters 7
(And (Member $e0 talk) (Agent $e0 $x1))
;;      c626  mass 2  {Katherine, Isabella, Kate}
;;     c1132  mass 1  {school janitor}
;;     c1167  mass 1  {friend, friends}
;;      c451  mass 1  {author, writer, novelist}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;      c692  mass 1  {Daniel}
;;      c697  mass 1  {Jordan Peterson}

;; ---- slot use.Agent  [event center]  n 8  clusters 7
(And (Member $e0 use) (Agent $e0 $x1))
;;       c86  mass 2  {localized version, localized versions}
;;       c11  mass 1  {ukrainian army}
;;     c1174  mass 1  {father, Dad, dad}
;;      c195  mass 1  {algerian government}
;;      c606  mass 1  {Churchill}
;;      c735  mass 1  {human brain}
;;      c880  mass 1  {singer}

;; ---- slot walk.Agent  [event center]  n 8  clusters 8
(And (Member $e0 walk) (Agent $e0 $x1))
;;     c1132  mass 1  {school janitor}
;;     c2347  mass 1  {ad, ant}
;;       c62  mass 1  {customer, customers}
;;      c631  mass 1  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c645  mass 1  {Michael, Marco, Marcus}
;;      c659  mass 1  {Felix}
;;      c683  mass 1  {Leon}
;;      c688  mass 1  {Adriano, Claudio, Flavio}

;; ---- slot want.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 want) (Experiencer $e0 $x1))
;;      c588  mass 2  {Aslan}
;;     c1037  mass 1  {cat, cats}
;;      c662  mass 1  {Tony}
;;      c683  mass 1  {Leon}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c686  mass 1  {Benedito}
;;      c973  mass 1  {Pepper}

;; ---- slot work.Agent  [event center]  n 8  clusters 8
(And (Member $e0 work) (Agent $e0 $x1))
;;     c1133  mass 1  {volunteer, volunteers}
;;     c1161  mass 1  {person, people}
;;     c1174  mass 1  {father, Dad, dad}
;;      c641  mass 1  {Boris, Ivan, Dmitri, Rasputin}
;;      c671  mass 1  {Asserson}
;;      c691  mass 1  {Dan}
;;      c702  mass 1  {Mr. Jones}
;;      c890  mass 1  {adaptor, adaptor, old}

;; ---- slot write.Agent  [event center]  n 8  clusters 5
(And (Member $e0 write) (Agent $e0 $x1))
;;     c1161  mass 2  {person, people}
;;      c653  mass 2  {Gilles Thibaut}
;;      c718  mass 2  {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …}
;;     c1175  mass 1  {busy, father}
;;     c1205  mass 1  {famous, person}

;; ---- slot come.Agent  [event center]  n 7  clusters 7
(And (Member $e0 come) (Agent $e0 $x1))
;;     c1176  mass 1  {omen, men}
;;     c1718  mass 1  {sleep}
;;     c1760  mass 1  {train}
;;     c1775  mass 1  {talk, conversation, discussion}
;;      c230  mass 1  {countries}
;;      c515  mass 1  {bus, bus ride}
;;      c763  mass 1  {student, students}

;; ---- slot contain.Agent  [event center]  n 7  clusters 5
(And (Member $e0 contain) (Agent $e0 $x1))
;;      c838  mass 3  {card, deck, cards, deck}
;;      c120  mass 1  {vitamin pill}
;;      c839  mass 1  {chest}
;;      c879  mass 1  {song, sing, chant}
;;      c892  mass 1  {plasma}

;; ---- slot contain.Theme  [event center]  n 7  clusters 7
(And (Member $e0 contain) (Theme $e0 $x1))
;;      c136  mass 1  {queens}
;;     c1584  mass 1  {jack, jacks}
;;     c1793  mass 1  {abundant, nutrition}
;;      c405  mass 1  {electrolyte, electrolytes}
;;      c417  mass 1  {gold coin, gold, gold coins}
;;      c600  mass 1  {king, queen, kings}
;;      c878  mass 1  {degrading, lyric}

;; ---- slot create.Patient  [event center]  n 7  clusters 4
(And (Member $e0 create) (Patient $e0 $x1))
;;      c751  mass 4  {community}
;;     c1858  mass 1  {language, new}
;;      c292  mass 1  {calendars, various}
;;       c51  mass 1  {particle accelerator}

;; ---- slot form.Agent  [event center]  n 7  clusters 4
(And (Member $e0 form) (Agent $e0 $x1))
;;      c710  mass 4  {Jon Bon Jovi, Sambora}
;;     c1129  mass 1  {labourer, labourers}
;;     c1817  mass 1  {complex, complex, simple, complicated}
;;      c402  mass 1  {technetium}

;; ---- slot get.Patient  [event center]  n 7  clusters 7
(And (Member $e0 get) (Patient $e0 $x1))
;;     c1347  mass 1  {bad, bad, matter, bad, problem}
;;     c1475  mass 1  {big, fire}
;;     c1503  mass 1  {bad, weather}
;;     c1647  mass 1  {expensive, expensive, thing}
;;     c1651  mass 1  {cheap, excuses}
;;     c1721  mass 1  {day, days, days, short}
;;      c219  mass 1  {Afghanistan, Iran, Iraq, Persia}

;; ---- slot make.Result  [event center]  n 7  clusters 7
(And (Member $e0 make) (Result $e0 $x1))
;;     c1221  mass 1  {backward, country}
;;     c1324  mass 1  {uncomfortable}
;;     c1347  mass 1  {bad, bad, matter, bad, problem}
;;     c1357  mass 1  {dangerous, hazardous}
;;     c1628  mass 1  {beautiful, gorgeous, pretty}
;;     c1896  mass 1  {black, white}
;;      c600  mass 1  {king, queen, kings}

;; ---- slot sell.Theme  [event center]  n 7  clusters 6
(And (Member $e0 sell) (Theme $e0 $x1))
;;      c916  mass 2  {ice cream, ice cone, ice cream cone}
;;     c1544  mass 1  {cell phone, mobile phone, cell phone, new}
;;     c1827  mass 1  {copy, copies}
;;     c2154  mass 1  {thing, things}
;;      c939  mass 1  {milk}
;;      c984  mass 1  {beans, roasted}

;; ---- slot serve.Theme  [event center]  n 7  clusters 4
(And (Member $e0 serve) (Theme $e0 $x1))
;;      c164  mass 3  {Springfield Station}
;;      c149  mass 2  {Baltimore, Boston, Springfield}
;;     c1315  mass 1  {revenge}
;;       c66  mass 1  {coffee, coffee, strong}

;; ---- slot try.Theme  [event center]  n 7  clusters 7
(And (Member $e0 try) (Theme $e0 $x1))
;;     c1898  mass 1  {burnish}
;;     c2202  mass 1  {pull}
;;     c2210  mass 1  {reach}
;;     c2323  mass 1  {give up}
;;      c361  mass 1  {steal}
;;      c379  mass 1  {abuse}
;;       c58  mass 1  {call, telephone call}

;; ---- slot turn.Patient  [event center]  n 7  clusters 7
(And (Member $e0 turn) (Patient $e0 $x1))
;;     c1004  mass 1  {leaves, red, yellow}
;;     c1405  mass 1  {ceiling, black, ceiling}
;;     c1731  mass 1  {war, world war}
;;       c23  mass 1  {russian speech, russian}
;;      c455  mass 1  {freedom movement, gusher}
;;      c541  mass 1  {road, motorway, roads}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}

;; ---- slot win.Agent  [event center]  n 7  clusters 4
(And (Member $e0 win) (Agent $e0 $x1))
;;      c607  mass 3  {Wilson, wilson}
;;      c699  mass 2  {James Woods, Jeremy Irons}
;;     c1078  mass 1  {horse}
;;     c1690  mass 1  {away team}

;; ---- slot <unclassed>.Only  [entity center]  n 6  clusters 4
(Only $x0 $x1)
;;     c2239  mass 2  {have, possess}
;;     c2357  mass 2  {find, found}
;;     c1151  mass 1  {solve}
;;     c2334  mass 1  {like, prefer}

;; ---- slot appear.Agent  [event center]  n 6  clusters 3
(And (Member $e0 appear) (Agent $e0 $x1))
;;     c1161  mass 3  {person, people}
;;      c716  mass 2  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;;     c1154  mass 1  {sister, sisters}

;; ---- slot bear.Patient  [event center]  n 6  clusters 4
(And (Member $e0 bear) (Patient $e0 $x1))
;;     c1161  mass 3  {person, people}
;;     c1350  mass 1  {man, poor}
;;      c590  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c680  mass 1  {Tobias}

;; ---- slot build.Instrument  [event center]  n 6  clusters 3
(And (Member $e0 build) (Instrument $e0 $x1))
;;     c1509  mass 2  {barometer}
;;     c1529  mass 2  {presented in scale, scale, presented, scale}
;;     c2207  mass 2  {help, support}

;; ---- slot capture.Theme  [event center]  n 6  clusters 6
(And (Member $e0 capture) (Theme $e0 $x1))
;;     c1060  mass 1  {magpie}
;;       c12  mass 1  {ship, merchant ship, modern ship}
;;     c1212  mass 1  {Valerian}
;;       c13  mass 1  {british ship}
;;      c177  mass 1  {capital, provincial capital}
;;      c199  mass 1  {Algiers, algerian city, Ghardaia, algerian cities}

;; ---- slot cause.Agent  [event center]  n 6  clusters 6
(And (Member $e0 cause) (Agent $e0 $x1))
;;     c1042  mass 1  {demon, devil}
;;     c1491  mass 1  {storm, thunder}
;;     c2154  mass 1  {thing, things}
;;      c443  mass 1  {news}
;;      c537  mass 1  {walk}
;;      c801  mass 1  {tide, tides}

;; ---- slot create.Agent  [event center]  n 6  clusters 4
(And (Member $e0 create) (Agent $e0 $x1))
;;       c93  mass 2  {indigenous, indigenous, people, native american, indigenous american, …}
;;       c99  mass 2  {european american settler, european american settlers}
;;      c451  mass 1  {author, writer, novelist}
;;      c635  mass 1  {Paul, Paulus}

;; ---- slot enter.Agent  [event center]  n 6  clusters 5
(And (Member $e0 enter) (Agent $e0 $x1))
;;      c776  mass 2  {Issaquah Creek, Lake Sammamish}
;;     c1161  mass 1  {person, people}
;;      c269  mass 1  {muslim, muslim community, muslims}
;;      c618  mass 1  {Layla}
;;      c689  mass 1  {Martino, Pietro, Lorenzo, Damiano}

;; ---- slot form.Patient  [event center]  n 6  clusters 4
(And (Member $e0 form) (Patient $e0 $x1))
;;      c866  mass 3  {main songwriting unit, songwriting unit, main, songwriting unit}
;;     c1817  mass 1  {complex, complex, simple, complicated}
;;      c402  mass 1  {technetium}
;;      c566  mass 1  {human barricade}

;; ---- slot fund.Agent  [event center]  n 6  clusters 3
(And (Member $e0 fund) (Agent $e0 $x1))
;;      c247  mass 3  {JICA}
;;      c493  mass 2  {government, govern}
;;      c203  mass 1  {Government of Kenya, Government of Uganda}

;; ---- slot get.Agent  [event center]  n 6  clusters 6
(And (Member $e0 get) (Agent $e0 $x1))
;;     c1192  mass 1  {man, young}
;;     c2154  mass 1  {thing, things}
;;      c644  mass 1  {Leonid}
;;      c679  mass 1  {Elias, Gabriel}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c687  mass 1  {Janos, Miroslav, Lajos}

;; ---- slot get.Result  [event center]  n 6  clusters 6
(And (Member $e0 get) (Result $e0 $x1))
;;     c1347  mass 1  {bad, bad, matter, bad, problem}
;;     c1647  mass 1  {expensive, expensive, thing}
;;     c1648  mass 1  {cheap, inexpensive, low, price}
;;     c1807  mass 1  {powerful, power}
;;     c2140  mass 1  {short, shortening}
;;     c2221  mass 1  {ready}

;; ---- slot help.Agent  [event center]  n 6  clusters 6
(And (Member $e0 help) (Agent $e0 $x1))
;;     c1468  mass 1  {hothouse condition, hothouse conditions}
;;     c2053  mass 1  {life experience}
;;     c2149  mass 1  {context}
;;      c645  mass 1  {Michael, Marco, Marcus}
;;      c663  mass 1  {Jonas, John, Jonathan, Jack, …}
;;      c693  mass 1  {Karen, Ken}

;; ---- slot receive.Theme  [event center]  n 6  clusters 5
(And (Member $e0 receive) (Theme $e0 $x1))
;;     c1113  mass 2  {work, job}
;;     c2199  mass 1  {award}
;;     c2317  mass 1  {permit, permitted}
;;     c2380  mass 1  {honorary knighthood}
;;      c518  mass 1  {car, new}

;; ---- slot run.Agent  [event center]  n 6  clusters 5
(And (Member $e0 run) (Agent $e0 $x1))
;;      c707  mass 2  {George Allen, James David Edgar, Chuck Robb}
;;     c1079  mass 1  {goat, sheep}
;;     c1085  mass 1  {squirrel}
;;      c112  mass 1  {doctor, doctors}
;;      c680  mass 1  {Tobias}

;; ---- slot sleep.Experiencer  [event center]  n 6  clusters 4
(And (Member $e0 sleep) (Experiencer $e0 $x1))
;;     c1037  mass 2  {cat, cats}
;;     c1196  mass 2  {child, children, kid, kids}
;;     c1033  mass 1  {dog, dog feed}
;;      c633  mass 1  {Baya, Iga, Keike}

;; ---- slot speak.Theme  [event center]  n 6  clusters 5
(And (Member $e0 speak) (Theme $e0 $x1))
;;      c670  mass 2  {Ashe}
;;     c1245  mass 1  {language, english}
;;     c1899  mass 1  {polish}
;;       c24  mass 1  {czech}
;;      c479  mass 1  {foreign language, foreign, language}

;; ---- slot start.Agent  [event center]  n 6  clusters 6
(And (Member $e0 start) (Agent $e0 $x1))
;;     c1132  mass 1  {school janitor}
;;     c1199  mass 1  {girl, girls}
;;     c1272  mass 1  {crowd, crowd, whole}
;;      c632  mass 1  {Skura, Inomaru, Barako}
;;      c649  mass 1  {Karl}
;;      c956  mass 1  {cook}

;; ---- slot study.Location  [event center]  n 6  clusters 4
(And (Member $e0 study) (Location $e0 $x1))
;;      c597  mass 2  {Davis Studio}
;;      c599  mass 2  {Julian Ashton Art School}
;;      c160  mass 1  {Munich}
;;      c765  mass 1  {university, campus, college}

;; ---- slot write.CoAgent  [event center]  n 6  clusters 3
(And (Member $e0 write) (CoAgent $e0 $x1))
;;      c620  mass 2  {Laurie Aubanel, Muriel Zazoui, Patricia Kaas}
;;      c621  mass 2  {Bianca Olsen}
;;      c720  mass 2  {Cyril Rambour}

;; ---- slot add.Agent  [event center]  n 5  clusters 4
(And (Member $e0 add) (Agent $e0 $x1))
;;     c2154  mass 2  {thing, things}
;;     c1012  mass 1  {plant, plants}
;;      c708  mass 1  {J. Augustus Knapp}
;;      c956  mass 1  {cook}

;; ---- slot appear.Location  [event center]  n 5  clusters 4
(And (Member $e0 appear) (Location $e0 $x1))
;;       c68  mass 2  {cafe}
;;     c1233  mass 1  {comedic role}
;;      c252  mass 1  {musical film}
;;        c6  mass 1  {Coronation Street}

;; ---- slot buy.Theme  [event center]  n 5  clusters 5
(And (Member $e0 buy) (Theme $e0 $x1))
;;     c1425  mass 1  {house, home, houses}
;;     c1549  mass 1  {computer}
;;      c421  mass 1  {blue, shirt}
;;      c429  mass 1  {trouser, yellow}
;;      c968  mass 1  {food, eat}

;; ---- slot cry.Agent  [event center]  n 5  clusters 5
(And (Member $e0 cry) (Agent $e0 $x1))
;;     c1199  mass 1  {girl, girls}
;;      c632  mass 1  {Skura, Inomaru, Barako}
;;      c633  mass 1  {Baya, Iga, Keike}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}
;;      c817  mass 1  {Rima}

;; ---- slot direct.Agent  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Agent $e0 $x1))
;;      c715  mass 2  {Lev L. Spiro}
;;      c614  mass 1  {Claude Lelouch}
;;      c717  mass 1  {Jason Suecof, Nick De Caro, Robert Day, Matt Brown, …}
;;      c888  mass 1  {conductor}

;; ---- slot direct.Patient  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Patient $e0 $x1))
;;     c1570  mass 2  {episode}
;;     c2154  mass 1  {thing, things}
;;      c250  mass 1  {syrian film, film, syrian film, destined, film, syrian film}
;;      c251  mass 1  {movie, film}

;; ---- slot draw.Agent  [event center]  n 5  clusters 3
(And (Member $e0 draw) (Agent $e0 $x1))
;;     c1196  mass 2  {child, children, kid, kids}
;;      c705  mass 2  {Cowper}
;;     c1280  mass 1  {concert}

;; ---- slot eat.Patient  [event center]  n 5  clusters 4
(And (Member $e0 eat) (Patient $e0 $x1))
;;      c897  mass 2  {cookie, cookie jar, cookies}
;;     c1084  mass 1  {rabbit, rat, hamster}
;;      c950  mass 1  {bake, bakery, bread}
;;      c959  mass 1  {chicken}

;; ---- slot fly.Agent  [event center]  n 5  clusters 5
(And (Member $e0 fly) (Agent $e0 $x1))
;;     c1057  mass 1  {insect, insects}
;;     c1063  mass 1  {eagle}
;;      c504  mass 1  {plane, flight, aeroplane, airplane, …}
;;      c596  mass 1  {Superman}
;;      c813  mass 1  {pace, rocket, space mission, space}

;; ---- slot include.Theme  [event center]  n 5  clusters 5
(And (Member $e0 include) (Theme $e0 $x1))
;;      c107  mass 1  {extradition clause}
;;      c570  mass 1  {Armaan Jain}
;;      c571  mass 1  {Ranbir Kapoor}
;;      c572  mass 1  {Nikhil Nanda}
;;      c884  mass 1  {marching band, marching bands}

;; ---- slot lead.Agent  [event center]  n 5  clusters 4
(And (Member $e0 lead) (Agent $e0 $x1))
;;     c2154  mass 2  {thing, things}
;;     c1033  mass 1  {dog, dog feed}
;;     c1822  mass 1  {general, general purpose}
;;      c766  mass 1  {school, education}

;; ---- slot lead.Goal  [event center]  n 5  clusters 5
(And (Member $e0 lead) (Goal $e0 $x1))
;;     c1036  mass 1  {cat fight, big, cat fight}
;;     c1213  mass 1  {glory, glory, lost}
;;     c1425  mass 1  {house, home, houses}
;;     c1605  mass 1  {pacificat, pacificats, peace}
;;     c1613  mass 1  {happiness, happy, happily, joy}

;; ---- slot marry.Agent  [event center]  n 5  clusters 4
(And (Member $e0 marry) (Agent $e0 $x1))
;;      c624  mass 2  {Margaret Fleming, Martha, Anne, Marie}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;      c654  mass 1  {James of Barrochan}
;;      c722  mass 1  {Steve}

;; ---- slot need.Theme  [event center]  n 5  clusters 5
(And (Member $e0 need) (Theme $e0 $x1))
;;     c1523  mass 1  {paint, painting}
;;     c1753  mass 1  {run, runner}
;;     c2009  mass 1  {generate}
;;     c2039  mass 1  {understand, misunderstand}
;;       c81  mass 1  {go}

;; ---- slot portray.Agent  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Agent $e0 $x1))
;;      c607  mass 2  {Wilson, wilson}
;;      c631  mass 2  {Hanako, Mie Sonozaki, Soichiro Akizuki, Mariko, …}
;;      c699  mass 1  {James Woods, Jeremy Irons}

;; ---- slot portray.Theme  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Theme $e0 $x1))
;;      c634  mass 2  {Kantaro Suga}
;;      c699  mass 2  {James Woods, Jeremy Irons}
;;      c607  mass 1  {Wilson, wilson}

;; ---- slot present.Theme  [event center]  n 5  clusters 4
(And (Member $e0 present) (Theme $e0 $x1))
;;      c879  mass 2  {song, sing, chant}
;;     c1524  mass 1  {picture, image}
;;     c1773  mass 1  {play}
;;     c1874  mass 1  {golden opportunity}

;; ---- slot provide.Agent  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Agent $e0 $x1))
;;     c1271  mass 1  {witness, witnesses}
;;     c1670  mass 1  {organisation}
;;      c324  mass 1  {power station}
;;      c440  mass 1  {media}
;;      c935  mass 1  {kitchen island}

;; ---- slot provide.Theme  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Theme $e0 $x1))
;;     c1243  mass 1  {plurivocality}
;;     c1567  mass 1  {counter space, counter space, extra}
;;     c1662  mass 1  {descriptions, detailed}
;;      c322  mass 1  {electricity}
;;      c968  mass 1  {food, eat}

;; ---- slot ready.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 ready) (Experiencer $e0 $x1))
;;      c632  mass 1  {Skura, Inomaru, Barako}
;;      c644  mass 1  {Leonid}
;;      c713  mass 1  {Yanni}
;;      c952  mass 1  {cake, pie}
;;      c964  mass 1  {dinner, dinner table}

;; ---- slot sell.Agent  [event center]  n 5  clusters 4
(And (Member $e0 sell) (Agent $e0 $x1))
;;     c1119  mass 2  {company, corporation}
;;      c441  mass 1  {newspaper, newspapers}
;;       c65  mass 1  {coffee brand, coffee brand, indie}
;;      c672  mass 1  {Mennad, Lessos}

;; ---- slot sing.Theme  [event center]  n 5  clusters 2
(And (Member $e0 sing) (Theme $e0 $x1))
;;      c875  mass 4  {music}
;;      c879  mass 1  {song, sing, chant}

;; ---- slot sing.To  [event center]  n 5  clusters 2
(And (Member $e0 sing) (To $e0 $x1))
;;     c1937  mass 4  {accompany}
;;      c876  mass 1  {music, sad}

;; ---- slot sleep.Location  [event center]  n 5  clusters 3
(And (Member $e0 sleep) (Location $e0 $x1))
;;     c1436  mass 3  {couch}
;;     c1145  mass 1  {mat, mathematics}
;;     c2075  mass 1  {inside, into}

;; ---- slot stand.Experiencer  [event center]  n 5  clusters 3
(And (Member $e0 stand) (Experiencer $e0 $x1))
;;      c685  mass 3  {Gustavo, Alberto, Diego, Rodrigo, …}
;;     c1822  mass 1  {general, general purpose}
;;      c763  mass 1  {student, students}

;; ---- slot start.Experiencer  [event center]  n 5  clusters 4
(And (Member $e0 start) (Experiencer $e0 $x1))
;;      c174  mass 2  {bridge}
;;      c640  mass 1  {Oleg, Vladimir}
;;      c682  mass 1  {Gunter}
;;      c732  mass 1  {tunnel}

;; ---- slot study.Theme  [event center]  n 5  clusters 5
(And (Member $e0 study) (Theme $e0 $x1))
;;      c130  mass 1  {bacterium, bacterium, new}
;;      c202  mass 1  {Arabic}
;;     c2252  mass 1  {rate}
;;      c319  mass 1  {mechanical engineering}
;;      c471  mass 1  {canon law}

;; ---- slot swim.Agent  [event center]  n 5  clusters 4
(And (Member $e0 swim) (Agent $e0 $x1))
;;     c1031  mass 2  {fish, school}
;;     c1030  mass 1  {fish, red}
;;     c1196  mass 1  {child, children, kid, kids}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}

;; ---- slot travel.Agent  [event center]  n 5  clusters 4
(And (Member $e0 travel) (Agent $e0 $x1))
;;     c1161  mass 2  {person, people}
;;      c488  mass 1  {campaigner}
;;      c648  mass 1  {Matthew}
;;      c664  mass 1  {Roger, Bob, Bobby, Robbie, …}

;; ---- slot turn.Result  [event center]  n 5  clusters 5
(And (Member $e0 turn) (Result $e0 $x1))
;;     c1062  mass 1  {crow, caw}
;;     c1738  mass 1  {red}
;;     c1892  mass 1  {yellow, orange}
;;     c1896  mass 1  {black, white}
;;      c456  mass 1  {gusher}

;; ---- slot watch.Agent  [event center]  n 5  clusters 5
(And (Member $e0 watch) (Agent $e0 $x1))
;;     c1161  mass 1  {person, people}
;;     c1163  mass 1  {family, families}
;;      c493  mass 1  {government, govern}
;;      c633  mass 1  {Baya, Iga, Keike}
;;      c761  mass 1  {coach}

;; ---- slot win.Theme  [event center]  n 5  clusters 2
(And (Member $e0 win) (Theme $e0 $x1))
;;      c582  mass 4  {emmy}
;;      c380  mass 1  {race}

;; ---- slot bad.Between  [entity center]  n 4  clusters 2
(And (Member $x0 bad) (Between $x0 $x1))
;;      c242  mass 2  {Estonia, Poland}
;;      c244  mass 2  {Germany}

;; ---- slot beauty.Possession  [entity center]  n 4  clusters 4
(And (Member $x0 beauty) (Possession $x0 $x1))
;;     c1139  mass 1  {sex, sexually}
;;     c1289  mass 1  {sight}
;;      c778  mass 1  {lake, Lake Towada, Lake Akan}
;;      c825  mass 1  {landscape, scenery}

;; ---- slot family.Possession  [entity center]  n 4  clusters 1
(And (Member $x0 family) (Possession $x0 $x1))
;;     c1161  mass 4  {person, people}

;; ---- slot northern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 northern) (LocatedIn $x0 $x1))
;;      c224  mass 2  {India, Indonesia}
;;      c242  mass 2  {Estonia, Poland}

;; ---- slot southern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 southern) (LocatedIn $x0 $x1))
;;      c211  mass 2  {North Africa, Africa}
;;      c224  mass 2  {India, Indonesia}

;; ---- slot accompany.Agent  [event center]  n 4  clusters 2
(And (Member $e0 accompany) (Agent $e0 $x1))
;;     c1154  mass 2  {sister, sisters}
;;     c1161  mass 2  {person, people}

;; ---- slot accompany.Theme  [event center]  n 4  clusters 1
(And (Member $e0 accompany) (Theme $e0 $x1))
;;      c253  mass 4  {silent film}

;; ---- slot active.Time  [event center]  n 4  clusters 2
(And (Member $e0 active) (Time $e0 $x1))
;;     c1709  mass 2  {morning, early morning, this morning}
;;     c1723  mass 2  {evening, late afternoon}

;; ---- slot add.Theme  [event center]  n 4  clusters 3
(And (Member $e0 add) (Theme $e0 $x1))
;;     c1521  mass 2  {illustration, illustrations, illustrate}
;;     c1005  mass 1  {green, greenery}
;;      c971  mass 1  {clove, cloves}

;; ---- slot arrive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 arrive) (Agent $e0 $x1))
;;      c509  mass 1  {paris train}
;;      c517  mass 1  {drive, driver}
;;      c656  mass 1  {Donald}
;;       c80  mass 1  {spring}

;; ---- slot avoid.Theme  [event center]  n 4  clusters 4
(And (Member $e0 avoid) (Theme $e0 $x1))
;;     c1342  mass 1  {pitfall, pitfalls}
;;     c2154  mass 1  {thing, things}
;;     c2299  mass 1  {conform}
;;      c340  mass 1  {bankruptcy}

;; ---- slot bad.Experiencer  [event center]  n 4  clusters 3
(And (Member $e0 bad) (Experiencer $e0 $x1))
;;     c1348  mass 2  {bad, relationship}
;;     c1347  mass 1  {bad, bad, matter, bad, problem}
;;     c1503  mass 1  {bad, weather}

;; ---- slot bear.Location  [event center]  n 4  clusters 3
(And (Member $e0 bear) (Location $e0 $x1))
;;      c158  mass 2  {Stockholm, Bromma}
;;      c243  mass 1  {Denmark, Norway, Sweden}
;;      c793  mass 1  {Earth, planet, earth}

;; ---- slot begin.Patient  [event center]  n 4  clusters 4
(And (Member $e0 begin) (Patient $e0 $x1))
;;     c1021  mass 1  {tree, trees}
;;     c1724  mass 1  {night, tonight, midnight}
;;     c1744  mass 1  {uprising}
;;      c766  mass 1  {school, education}

;; ---- slot bring.Theme  [event center]  n 4  clusters 4
(And (Member $e0 bring) (Theme $e0 $x1))
;;       c13  mass 1  {british ship}
;;       c18  mass 1  {chinese dumpling}
;;     c1821  mass 1  {advantage}
;;      c663  mass 1  {Jonas, John, Jonathan, Jack, …}

;; ---- slot capture.Agent  [event center]  n 4  clusters 4
(And (Member $e0 capture) (Agent $e0 $x1))
;;     c1070  mass 1  {falcon}
;;      c238  mass 1  {Spain}
;;      c367  mass 1  {pirate, pirates}
;;      c562  mass 1  {army, soldiers, troops}

;; ---- slot cause.Patient  [event center]  n 4  clusters 4
(And (Member $e0 cause) (Patient $e0 $x1))
;;     c1367  mass 1  {damage}
;;       c52  mass 1  {earthquake, earthquakes}
;;       c56  mass 1  {abandonment anxiety}
;;      c862  mass 1  {creaking, creaking, sound}

;; ---- slot change.Agent  [event center]  n 4  clusters 4
(And (Member $e0 change) (Agent $e0 $x1))
;;     c1003  mass 1  {leaf, foliage, leaves}
;;     c1178  mass 1  {man, guy}
;;      c233  mass 1  {French Dahomey}
;;      c605  mass 1  {Cameron}

;; ---- slot close.Experiencer  [event center]  n 4  clusters 2
(And (Member $e0 close) (Experiencer $e0 $x1))
;;       c28  mass 3  {Low German}
;;      c658  mass 1  {Boldi, Bruno, Frankie}

;; ---- slot come.Source  [event center]  n 4  clusters 4
(And (Member $e0 come) (Source $e0 $x1))
;;     c1002  mass 1  {garden}
;;     c1432  mass 1  {place, places}
;;     c1757  mass 1  {treeline}
;;      c285  mass 1  {greek}

;; ---- slot connect.Theme  [event center]  n 4  clusters 2
(And (Member $e0 connect) (Theme $e0 $x1))
;;      c144  mass 2  {Tokyo, Nagoya, Narita, Osaka}
;;      c784  mass 2  {Kayalar}

;; ---- slot create.Location  [event center]  n 4  clusters 1
(And (Member $e0 create) (Location $e0 $x1))
;;     c1556  mass 4  {post, blog}

;; ---- slot decide.Agent  [event center]  n 4  clusters 3
(And (Member $e0 decide) (Agent $e0 $x1))
;;      c642  mass 2  {Fyodor}
;;      c627  mass 1  {Jessica, Beth}
;;      c679  mass 1  {Elias, Gabriel}

;; ---- slot design.Agent  [event center]  n 4  clusters 3
(And (Member $e0 design) (Agent $e0 $x1))
;;      c718  mass 2  {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …}
;;       c16  mass 1  {Robert Allan Limited}
;;      c716  mass 1  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}

;; ---- slot design.Patient  [event center]  n 4  clusters 2
(And (Member $e0 design) (Patient $e0 $x1))
;;     c1605  mass 2  {pacificat, pacificats, peace}
;;     c2154  mass 2  {thing, things}

;; ---- slot die.Patient  [event center]  n 4  clusters 2
(And (Member $e0 die) (Patient $e0 $x1))
;;     c1161  mass 3  {person, people}
;;     c1163  mass 1  {family, families}

;; ---- slot discover.Theme  [event center]  n 4  clusters 3
(And (Member $e0 discover) (Theme $e0 $x1))
;;     c1162  mass 2  {name}
;;     c1853  mass 1  {magnet, magnet, new, type}
;;       c41  mass 1  {pterosaur egg, pterosaur eggs}

;; ---- slot do.Patient  [event center]  n 4  clusters 3
(And (Member $e0 do) (Patient $e0 $x1))
;;     c2154  mass 2  {thing, things}
;;     c1230  mass 1  {dance, little}
;;      c963  mass 1  {dishes}

;; ---- slot eat.Agent  [event center]  n 4  clusters 4
(And (Member $e0 eat) (Agent $e0 $x1))
;;     c1032  mass 1  {brown, dog, brown, dog, lazy}
;;     c1065  mass 1  {bird, bird dropping, birds}
;;     c1161  mass 1  {person, people}
;;     c1196  mass 1  {child, children, kid, kids}

;; ---- slot encourage.In  [event center]  n 4  clusters 2
(And (Member $e0 encourage) (In $e0 $x1))
;;     c1145  mass 2  {mat, mathematics}
;;      c303  mass 2  {chess, chess play}

;; ---- slot enter.Theme  [event center]  n 4  clusters 4
(And (Member $e0 enter) (Theme $e0 $x1))
;;     c1410  mass 1  {cave}
;;      c227  mass 1  {United States, U.S., USA}
;;      c530  mass 1  {park, parking lot, parking}
;;      c776  mass 1  {Issaquah Creek, Lake Sammamish}

;; ---- slot find.Agent  [event center]  n 4  clusters 3
(And (Member $e0 find) (Agent $e0 $x1))
;;      c526  mass 2  {Couper}
;;      c688  mass 1  {Adriano, Claudio, Flavio}
;;      c689  mass 1  {Martino, Pietro, Lorenzo, Damiano}

;; ---- slot get.Theme  [event center]  n 4  clusters 4
(And (Member $e0 get) (Theme $e0 $x1))
;;     c1084  mass 1  {rabbit, rat, hamster}
;;     c1648  mass 1  {cheap, inexpensive, low, price}
;;      c357  mass 1  {arrest}
;;      c969  mass 1  {snack}

;; ---- slot give.Theme  [event center]  n 4  clusters 4
(And (Member $e0 give) (Theme $e0 $x1))
;;     c1820  mass 1  {advice, advise, advice, good}
;;     c2154  mass 1  {thing, things}
;;      c915  mass 1  {mock champagne}
;;      c920  mass 1  {chocolate}

;; ---- slot good.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 good) (Experiencer $e0 $x1))
;;     c1504  mass 1  {weather}
;;     c2154  mass 1  {thing, things}
;;      c499  mass 1  {windshield}
;;      c942  mass 1  {barley, barley bread}

;; ---- slot help.Theme  [event center]  n 4  clusters 4
(And (Member $e0 help) (Theme $e0 $x1))
;;     c1161  mass 1  {person, people}
;;     c1199  mass 1  {girl, girls}
;;     c1791  mass 1  {thrive}
;;     c2020  mass 1  {define}

;; ---- slot include.Agent  [event center]  n 4  clusters 2
(And (Member $e0 include) (Agent $e0 $x1))
;;     c1193  mass 3  {nephew, nephews}
;;     c1216  mass 1  {parade}

;; ---- slot increase.Patient  [event center]  n 4  clusters 4
(And (Member $e0 increase) (Patient $e0 $x1))
;;       c10  mass 1  {ukrainian combat loss, ukrainian combat losses}
;;      c326  mass 1  {industrial output}
;;      c381  mass 1  {xenophobia}
;;      c522  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}

;; ---- slot jump.Agent  [event center]  n 4  clusters 4
(And (Member $e0 jump) (Agent $e0 $x1))
;;     c1035  mass 1  {brown, fox, quick}
;;     c1077  mass 1  {donkey}
;;     c1080  mass 1  {cow, calf}
;;     c1194  mass 1  {boy, boys}

;; ---- slot kill.Location  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Location $e0 $x1))
;;      c496  mass 3  {state}
;;     c2205  mass 1  {here}

;; ---- slot kill.Manner  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Manner $e0 $x1))
;;     c1926  mass 2  {indirectly}
;;     c2339  mass 2  {direct, straight, directly}

;; ---- slot lie.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 lie) (Experiencer $e0 $x1))
;;     c1543  mass 1  {notebook}
;;     c2240  mass 1  {pen}
;;      c448  mass 1  {book, books}
;;      c850  mass 1  {tape recorder}

;; ---- slot lie.Location  [event center]  n 4  clusters 1
(And (Member $e0 lie) (Location $e0 $x1))
;;     c1542  mass 4  {table}

;; ---- slot look.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 look) (Experiencer $e0 $x1))
;;      c210  mass 1  {Europe, Western Europe}
;;      c547  mass 1  {flag}
;;      c766  mass 1  {school, education}
;;      c807  mass 1  {island, Derwent Isle}

;; ---- slot look.Like  [event center]  n 4  clusters 4
(And (Member $e0 look) (Like $e0 $x1))
;;     c1053  mass 1  {spider, huge, spider, spiders}
;;     c1215  mass 1  {paradise}
;;      c355  mass 1  {imprison, jail, prison}
;;      c546  mass 1  {philippine flag, inverted, philippine flag}

;; ---- slot move.Agent  [event center]  n 4  clusters 3
(And (Member $e0 move) (Agent $e0 $x1))
;;     c1128  mass 2  {headquarters}
;;     c1031  mass 1  {fish, school}
;;      c667  mass 1  {Sammy}

;; ---- slot perform.Location  [event center]  n 4  clusters 3
(And (Member $e0 perform) (Location $e0 $x1))
;;       c68  mass 2  {cafe}
;;     c1425  mass 1  {house, home, houses}
;;     c2167  mass 1  {public}

;; ---- slot preach.Agent  [event center]  n 4  clusters 1
(And (Member $e0 preach) (Agent $e0 $x1))
;;     c1161  mass 4  {person, people}

;; ---- slot preach.Location  [event center]  n 4  clusters 2
(And (Member $e0 preach) (Location $e0 $x1))
;;      c157  mass 2  {Gareccio, Bologna}
;;      c237  mass 2  {Italy}

;; ---- slot present.Agent  [event center]  n 4  clusters 3
(And (Member $e0 present) (Agent $e0 $x1))
;;      c677  mass 2  {Horner}
;;     c1119  mass 1  {company, corporation}
;;     c1874  mass 1  {golden opportunity}

;; ---- slot receive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 receive) (Agent $e0 $x1))
;;      c105  mass 1  {refugee, refugees}
;;     c2198  mass 1  {win, winner}
;;      c559  mass 1  {General Franks}
;;      c627  mass 1  {Jessica, Beth}

;; ---- slot replace.Agent  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Agent $e0 $x1))
;;      c718  mass 2  {Bill Wrubel, Harvey Hayutin, Henry L. Taylor, Sherman Howard, …}
;;     c1161  mass 1  {person, people}
;;      c719  mass 1  {Corentin Rahier, Peter Gaussen, Van Bavel}

;; ---- slot replace.Theme  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Theme $e0 $x1))
;;      c595  mass 2  {Lex Lex Luthor, Lex Luthor}
;;     c1161  mass 1  {person, people}
;;      c716  mass 1  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}

;; ---- slot require.Theme  [event center]  n 4  clusters 4
(And (Member $e0 require) (Theme $e0 $x1))
;;     c1115  mass 1  {hard, work}
;;      c321  mass 1  {repair, repairs}
;;       c60  mass 1  {american phone number}
;;      c837  mass 1  {id card, id card, valid}

;; ---- slot specify.In  [event center]  n 4  clusters 2
(And (Member $e0 specify) (In $e0 $x1))
;;     c1379  mass 2  {continuous time}
;;     c1380  mass 2  {discrete time}

;; ---- slot spend.Agent  [event center]  n 4  clusters 3
(And (Member $e0 spend) (Agent $e0 $x1))
;;     c1161  mass 2  {person, people}
;;     c1076  mass 1  {gazelle, giraffe, giraffes}
;;     c1701  mass 1  {May}

;; ---- slot star.Agent  [event center]  n 4  clusters 1
(And (Member $e0 star) (Agent $e0 $x1))
;;     c2154  mass 4  {thing, things}

;; ---- slot star.Theme  [event center]  n 4  clusters 2
(And (Member $e0 star) (Theme $e0 $x1))
;;      c620  mass 2  {Laurie Aubanel, Muriel Zazoui, Patricia Kaas}
;;      c699  mass 2  {James Woods, Jeremy Irons}

;; ---- slot stop.Agent  [event center]  n 4  clusters 4
(And (Member $e0 stop) (Agent $e0 $x1))
;;      c632  mass 1  {Skura, Inomaru, Barako}
;;      c713  mass 1  {Yanni}
;;      c817  mass 1  {Rima}
;;      c890  mass 1  {adaptor, adaptor, old}

;; ---- slot stop.Theme  [event center]  n 4  clusters 2
(And (Member $e0 stop) (Theme $e0 $x1))
;;     c1113  mass 2  {work, job}
;;     c1483  mass 2  {cry}

;; ---- slot support.Theme  [event center]  n 4  clusters 1
(And (Member $e0 support) (Theme $e0 $x1))
;;     c1530  mass 4  {view, views, common, view, public, view, …}

;; ---- slot use.Manner  [event center]  n 4  clusters 3
(And (Member $e0 use) (Manner $e0 $x1))
;;     c1934  mass 2  {rarely}
;;     c1845  mass 1  {responsibility, responsibly}
;;     c1935  mass 1  {colloquially}

;; ---- slot use.To  [event center]  n 4  clusters 4
(And (Member $e0 use) (To $e0 $x1))
;;     c2006  mass 1  {make}
;;     c2215  mass 1  {develop}
;;      c771  mass 1  {learn}
;;      c955  mass 1  {roast, roasted}

;; ---- slot walk.Goal  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Goal $e0 $x1))
;;     c1018  mass 1  {forest, jungle}
;;     c1642  mass 1  {store, shop, shopping, shops}
;;     c2329  mass 1  {back, backward, before, past}
;;      c770  mass 1  {classroom}

;; ---- slot walk.Location  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Location $e0 $x1))
;;     c1098  mass 1  {balloon, balloon, little}
;;     c1406  mass 1  {floor, wood floor}
;;     c1447  mass 1  {hallway}
;;     c1889  mass 1  {dark, darkness}

;; ---- slot watch.Theme  [event center]  n 4  clusters 4
(And (Member $e0 watch) (Theme $e0 $x1))
;;     c1679  mass 1  {event}
;;     c2066  mass 1  {activity, activities}
;;     c2381  mass 1  {natural hair video}
;;      c251  mass 1  {movie, film}

;; ---- slot win.For  [event center]  n 4  clusters 1
(And (Member $e0 win) (For $e0 $x1))
;;     c1519  mass 4  {portray, portrait, portrayal}

;; ---- slot work.Location  [event center]  n 4  clusters 4
(And (Member $e0 work) (Location $e0 $x1))
;;      c210  mass 1  {Europe, Western Europe}
;;      c279  mass 1  {Church of Norway}
;;      c325  mass 1  {factory, factories}
;;      c358  mass 1  {prison kitchen}

;; ---- slot bottom.PartOf  [entity center]  n 3  clusters 2
(And (Member $x0 bottom) (PartOf $x0 $x1))
;;      c435  mass 2  {page}
;;      c932  mass 1  {stew pot}

;; ---- slot fight.Against  [entity center]  n 3  clusters 3
(And (Member $x0 fight) (Against $x0 $x1))
;;     c1992  mass 1  {dead, die, death, die down, …}
;;     c2049  mass 1  {natural, nature}
;;      c258  mass 1  {fate}

;; ---- slot thing.LocatedIn  [entity center]  n 3  clusters 2
(And (Member $x0 thing) (LocatedIn $x0 $x1))
;;      c785  mass 2  {hill, mountain, hills}
;;      c426  mass 1  {closet}

;; ---- slot active.Experiencer  [event center]  n 3  clusters 2
(And (Member $e0 active) (Experiencer $e0 $x1))
;;     c2154  mass 2  {thing, things}
;;      c671  mass 1  {Asserson}

;; ---- slot affect.Agent  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Agent $e0 $x1))
;;      c386  mass 3  {cyberattack}

;; ---- slot affect.Location  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Location $e0 $x1))
;;      c478  mass 3  {world}

;; ---- slot affect.Theme  [event center]  n 3  clusters 3
(And (Member $e0 affect) (Theme $e0 $x1))
;;     c1119  mass 1  {company, corporation}
;;      c116  mass 1  {hospital}
;;      c336  mass 1  {bank}

;; ---- slot affect.Time  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Time $e0 $x1))
;;     c2282  mass 3  {this year}

;; ---- slot approve.Theme  [event center]  n 3  clusters 3
(And (Member $e0 approve) (Theme $e0 $x1))
;;     c1660  mass 1  {treaty}
;;     c1674  mass 1  {plan}
;;     c1887  mass 1  {Bill, bill}

;; ---- slot attack.Patient  [event center]  n 3  clusters 3
(And (Member $e0 attack) (Patient $e0 $x1))
;;     c1431  mass 1  {building}
;;       c64  mass 1  {consumer rights}
;;      c685  mass 1  {Gustavo, Alberto, Diego, Rodrigo, …}

;; ---- slot bake.Agent  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Agent $e0 $x1))
;;     c1119  mass 2  {company, corporation}
;;      c622  mass 1  {Ella}

;; ---- slot bake.Patient  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Patient $e0 $x1))
;;      c916  mass 2  {ice cream, ice cone, ice cream cone}
;;      c908  mass 1  {pie, scrumptious}

;; ---- slot base.On  [event center]  n 3  clusters 3
(And (Member $e0 base) (On $e0 $x1))
;;     c1730  mass 1  {battle, fight}
;;      c283  mass 1  {puritan value}
;;       c32  mass 1  {latin alphabet}

;; ---- slot beautiful.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 beautiful) (Experiencer $e0 $x1))
;;     c1451  mass 1  {beautiful, room}
;;     c1504  mass 1  {weather}
;;      c812  mass 1  {beautiful, moon}

;; ---- slot break_out.Patient  [event center]  n 3  clusters 3
(And (Member $e0 break_out) (Patient $e0 $x1))
;;     c1473  mass 1  {fire, burn, scorch}
;;     c1476  mass 1  {forest fire, forest fires}
;;     c1731  mass 1  {war, world war}

;; ---- slot bring.Goal  [event center]  n 3  clusters 3
(And (Member $e0 bring) (Goal $e0 $x1))
;;     c1594  mass 1  {gallows}
;;      c224  mass 1  {India, Indonesia}
;;      c227  mass 1  {United States, U.S., USA}

;; ---- slot buy.Agent  [event center]  n 3  clusters 2
(And (Member $e0 buy) (Agent $e0 $x1))
;;      c633  mass 2  {Baya, Iga, Keike}
;;      c676  mass 1  {Wyman, Regis}

;; ---- slot close.Agent  [event center]  n 3  clusters 3
(And (Member $e0 close) (Agent $e0 $x1))
;;     c1157  mass 1  {female, giraffe}
;;      c503  mass 1  {pilot}
;;      c564  mass 1  {guard, bodyguard, guards}

;; ---- slot close.Goal  [event center]  n 3  clusters 2
(And (Member $e0 close) (Goal $e0 $x1))
;;       c26  mass 2  {Dutch, Frisian}
;;       c27  mass 1  {High German}

;; ---- slot close.Patient  [event center]  n 3  clusters 2
(And (Member $e0 close) (Patient $e0 $x1))
;;     c1415  mass 2  {door, door, open, door, unlocked}
;;     c1642  mass 1  {store, shop, shopping, shops}

;; ---- slot come.Goal  [event center]  n 3  clusters 3
(And (Member $e0 come) (Goal $e0 $x1))
;;     c1280  mass 1  {concert}
;;     c1941  mass 1  {political, settlement}
;;     c2143  mass 1  {conclusion}

;; ---- slot come.Patient  [event center]  n 3  clusters 3
(And (Member $e0 come) (Patient $e0 $x1))
;;     c1049  mass 1  {insect sound, insect sounds}
;;     c1490  mass 1  {typhoon}
;;      c860  mass 1  {sound, sound wave}

;; ---- slot come_back.Agent  [event center]  n 3  clusters 3
(And (Member $e0 come_back) (Agent $e0 $x1))
;;     c1171  mass 1  {Mom, mother, mom}
;;     c1174  mass 1  {father, Dad, dad}
;;     c1194  mass 1  {boy, boys}

;; ---- slot compose.Patient  [event center]  n 3  clusters 2
(And (Member $e0 compose) (Patient $e0 $x1))
;;      c879  mass 2  {song, sing, chant}
;;      c886  mass 1  {symphony, great, symphonies}

;; ---- slot conduct.Agent  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Agent $e0 $x1))
;;      c716  mass 2  {Brian Packham, Carl Fenton, Colin Richardson, O. R. Woodcock, …}
;;      c550  mass 1  {CIA, FBI}

;; ---- slot conduct.Theme  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Theme $e0 $x1))
;;      c887  mass 2  {orchestra}
;;      c749  mass 1  {surveillance}

;; ---- slot cover.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Instrument $e0 $x1))
;;     c1014  mass 1  {weed}
;;     c1500  mass 1  {snow, snowstorm, deep, snow}
;;      c434  mass 1  {paper decoration, paper decorations}

;; ---- slot cover.Patient  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Patient $e0 $x1))
;;     c1445  mass 1  {courtyard}
;;     c2244  mass 1  {top, peak}
;;      c310  mass 1  {shopping arcade}

;; ---- slot define.Theme  [event center]  n 3  clusters 2
(And (Member $e0 define) (Theme $e0 $x1))
;;     c1568  mass 2  {sequence, sequences}
;;     c2154  mass 1  {thing, things}

;; ---- slot die.Location  [event center]  n 3  clusters 2
(And (Member $e0 die) (Location $e0 $x1))
;;      c158  mass 2  {Stockholm, Bromma}
;;     c1473  mass 1  {fire, burn, scorch}

;; ---- slot drink.Patient  [event center]  n 3  clusters 2
(And (Member $e0 drink) (Patient $e0 $x1))
;;       c67  mass 2  {tea}
;;     c1488  mass 1  {water, water source, clear, water, good, water}

;; ---- slot drive.Agent  [event center]  n 3  clusters 2
(And (Member $e0 drive) (Agent $e0 $x1))
;;      c515  mass 2  {bus, bus ride}
;;      c527  mass 1  {van}

;; ---- slot encourage.Agent  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Agent $e0 $x1))
;;      c665  mass 3  {Ralph}

;; ---- slot encourage.Theme  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Theme $e0 $x1))
;;      c660  mass 3  {Maurice}

;; ---- slot endorse.Theme  [event center]  n 3  clusters 1
(And (Member $e0 endorse) (Theme $e0 $x1))
;;     c1530  mass 3  {view, views, common, view, public, view, …}

;; ---- slot fall.Source  [event center]  n 3  clusters 3
(And (Member $e0 fall) (Source $e0 $x1))
;;     c1021  mass 1  {tree, trees}
;;     c1441  mass 1  {shelf}
;;     c1506  mass 1  {sky}

;; ---- slot fight.Agent  [event center]  n 3  clusters 2
(And (Member $e0 fight) (Agent $e0 $x1))
;;       c88  mass 2  {kabye person, kabye people}
;;     c1122  mass 1  {union boss, union bosses}

;; ---- slot fight.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fight) (Theme $e0 $x1))
;;     c1908  mass 1  {freeze, freeze over}
;;      c265  mass 1  {islamic fundamentalism}
;;      c371  mass 1  {terrorism, terrorist activity}

;; ---- slot fund.Theme  [event center]  n 3  clusters 2
(And (Member $e0 fund) (Theme $e0 $x1))
;;      c204  mass 2  {Kenya, Lessos-Kenya, Lessos-Uganda, Uganda}
;;      c172  mass 1  {border, border section}

;; ---- slot give.Agent  [event center]  n 3  clusters 2
(And (Member $e0 give) (Agent $e0 $x1))
;;      c640  mass 2  {Oleg, Vladimir}
;;      c651  mass 1  {William, James}

;; ---- slot go.Manner  [event center]  n 3  clusters 2
(And (Member $e0 go) (Manner $e0 $x1))
;;     c2314  mass 2  {late, later, last}
;;     c2284  mass 1  {immediately, instantly, right away}

;; ---- slot go.To  [event center]  n 3  clusters 2
(And (Member $e0 go) (To $e0 $x1))
;;     c1775  mass 2  {talk, conversation, discussion}
;;     c2265  mass 1  {see, visible}

;; ---- slot grow.Patient  [event center]  n 3  clusters 3
(And (Member $e0 grow) (Patient $e0 $x1))
;;     c1297  mass 1  {beard}
;;     c1968  mass 1  {faint, faint, sound}
;;      c694  mass 1  {Kalman}

;; ---- slot have.In  [event center]  n 3  clusters 2
(And (Member $e0 have) (In $e0 $x1))
;;      c318  mass 2  {fluid mechanics}
;;     c1241  mass 1  {poetry}

;; ---- slot hold.Patient  [event center]  n 3  clusters 3
(And (Member $e0 hold) (Patient $e0 $x1))
;;     c1283  mass 1  {ceremony, ceremony, mass}
;;     c1678  mass 1  {meeting}
;;      c280  mass 1  {prayer, prayers}

;; ---- slot lead.Theme  [event center]  n 3  clusters 3
(And (Member $e0 lead) (Theme $e0 $x1))
;;     c1036  mass 1  {cat fight, big, cat fight}
;;     c1079  mass 1  {goat, sheep}
;;     c1691  mass 1  {squad}

;; ---- slot learn.Theme  [event center]  n 3  clusters 3
(And (Member $e0 learn) (Theme $e0 $x1))
;;     c1244  mass 1  {dictionary, vocabulary}
;;     c1883  mass 1  {berber speaking, berber}
;;      c479  mass 1  {foreign language, foreign, language}

;; ---- slot leave.Patient  [event center]  n 3  clusters 2
(And (Member $e0 leave) (Patient $e0 $x1))
;;     c1415  mass 2  {door, door, open, door, unlocked}
;;     c2374  mass 1  {lights, on}

;; ---- slot leave.Result  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Result $e0 $x1))
;;     c1413  mass 1  {unlocked}
;;     c2338  mass 1  {open}
;;     c2348  mass 1  {well, on, there, be}

;; ---- slot leave.Theme  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Theme $e0 $x1))
;;     c1449  mass 1  {room, rooms}
;;      c522  mass 1  {car, motor vehicle, vehicle, motor vehicles, …}
;;      c530  mass 1  {park, parking lot, parking}

;; ---- slot lose.Agent  [event center]  n 3  clusters 2
(And (Member $e0 lose) (Agent $e0 $x1))
;;      c707  mass 2  {George Allen, James David Edgar, Chuck Robb}
;;      c528  mass 1  {tire}

;; ---- slot move.Goal  [event center]  n 3  clusters 2
(And (Member $e0 move) (Goal $e0 $x1))
;;      c149  mass 2  {Baltimore, Boston, Springfield}
;;     c2205  mass 1  {here}

;; ---- slot paint.Patient  [event center]  n 3  clusters 2
(And (Member $e0 paint) (Patient $e0 $x1))
;;      c825  mass 2  {landscape, scenery}
;;     c2226  mass 1  {gate}

;; ---- slot pick_up.Agent  [event center]  n 3  clusters 3
(And (Member $e0 pick_up) (Agent $e0 $x1))
;;     c1535  mass 1  {camera}
;;      c154  mass 1  {Santiago, Havana}
;;      c663  mass 1  {Jonas, John, Jonathan, Jack, …}

;; ---- slot play.Location  [event center]  n 3  clusters 2
(And (Member $e0 play) (Location $e0 $x1))
;;      c154  mass 2  {Santiago, Havana}
;;     c1406  mass 1  {floor, wood floor}

;; ---- slot pull.Theme  [event center]  n 3  clusters 3
(And (Member $e0 pull) (Theme $e0 $x1))
;;      c154  mass 1  {Santiago, Havana}
;;      c508  mass 1  {freight cars, line, long}
;;      c641  mass 1  {Boris, Ivan, Dmitri, Rasputin}

;; ---- slot read.Agent  [event center]  n 3  clusters 3
(And (Member $e0 read) (Agent $e0 $x1))
;;     c1200  mass 1  {girl, little}
;;      c638  mass 1  {Katya}
;;      c661  mass 1  {Thomas, Tom, Tommy}

;; ---- slot read.Theme  [event center]  n 3  clusters 3
(And (Member $e0 read) (Theme $e0 $x1))
;;     c1234  mass 1  {comic}
;;      c257  mass 1  {fairy tale}
;;      c351  mass 1  {economics magazine}

;; ---- slot require.Agent  [event center]  n 3  clusters 3
(And (Member $e0 require) (Agent $e0 $x1))
;;     c1425  mass 1  {house, home, houses}
;;     c2203  mass 1  {master, main}
;;     c2213  mass 1  {app}

;; ---- slot return.Agent  [event center]  n 3  clusters 2
(And (Member $e0 return) (Agent $e0 $x1))
;;      c569  mass 2  {Glasnow}
;;       c15  mass 1  {fishing boat}

;; ---- slot return.Goal  [event center]  n 3  clusters 2
(And (Member $e0 return) (Goal $e0 $x1))
;;      c151  mass 2  {Altoona}
;;     c1560  mass 1  {port, old, port}

;; ---- slot rule.Agent  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Agent $e0 $x1))
;;      c579  mass 2  {Tipu Sultan}
;;      c238  mass 1  {Spain}

;; ---- slot rule.Theme  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Theme $e0 $x1))
;;      c268  mass 2  {muslim house, house, muslim}
;;      c222  mass 1  {Colombia, Cuba, Peru, Venezuela}

;; ---- slot say.Theme  [event center]  n 3  clusters 2
(And (Member $e0 say) (Theme $e0 $x1))
;;     c2154  mass 2  {thing, things}
;;      c260  mass 1  {funeral prayer, funeral}

;; ---- slot season.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 season) (Instrument $e0 $x1))
;;      c972  mass 1  {lemongrass}
;;      c980  mass 1  {horse radish}
;;      c982  mass 1  {ramson}

;; ---- slot see.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 see) (Stimulus $e0 $x1))
;;     c1081  mass 1  {animal, animals}
;;      c627  mass 1  {Jessica, Beth}
;;      c811  mass 1  {moon, full moon}

;; ---- slot shoot.Patient  [event center]  n 3  clusters 3
(And (Member $e0 shoot) (Patient $e0 $x1))
;;     c1091  mass 1  {bear}
;;      c612  mass 1  {JFK}
;;      c691  mass 1  {Dan}

;; ---- slot sleep.Agent  [event center]  n 3  clusters 2
(And (Member $e0 sleep) (Agent $e0 $x1))
;;     c1161  mass 2  {person, people}
;;     c1163  mass 1  {family, families}

;; ---- slot solve.Patient  [event center]  n 3  clusters 1
(And (Member $e0 solve) (Patient $e0 $x1))
;;     c1764  mass 3  {problem, problems}

;; ---- slot spend.Theme  [event center]  n 3  clusters 2
(And (Member $e0 spend) (Theme $e0 $x1))
;;      c106  mass 2  {exile}
;;     c1721  mass 1  {day, days, days, short}

;; ---- slot start.Location  [event center]  n 3  clusters 1
(And (Member $e0 start) (Location $e0 $x1))
;;      c243  mass 3  {Denmark, Norway, Sweden}

;; ---- slot stick.Patient  [event center]  n 3  clusters 3
(And (Member $e0 stick) (Patient $e0 $x1))
;;     c1078  mass 1  {horse}
;;      c520  mass 1  {truck}
;;      c922  mass 1  {chewing gum}

;; ---- slot succeed.Agent  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Agent $e0 $x1))
;;      c593  mass 1  {Alexander}
;;      c666  mass 1  {Bailey}
;;      c719  mass 1  {Corentin Rahier, Peter Gaussen, Van Bavel}

;; ---- slot succeed.Theme  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Theme $e0 $x1))
;;     c1161  mass 1  {person, people}
;;      c624  mass 1  {Margaret Fleming, Martha, Anne, Marie}
;;      c706  mass 1  {Henry Cole}

;; ---- slot take_off.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_off) (Agent $e0 $x1))
;;      c504  mass 2  {plane, flight, aeroplane, airplane, …}
;;      c691  mass 1  {Dan}

;; ---- slot take_over.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_over) (Agent $e0 $x1))
;;      c608  mass 2  {Watts}
;;     c1007  mass 1  {Ivy, ivy}

;; ---- slot talk.Recipient  [event center]  n 3  clusters 3
(And (Member $e0 talk) (Recipient $e0 $x1))
;;     c1273  mass 1  {audience, audience, large}
;;      c628  mass 1  {Linda, Amanda, Loren, Dora Smith, …}
;;      c760  mass 1  {teacher, professor}

;; ---- slot turn.Goal  [event center]  n 3  clusters 3
(And (Member $e0 turn) (Goal $e0 $x1))
;;     c1238  mass 1  {quagmire}
;;     c2184  mass 1  {report}
;;      c780  mass 1  {river}

;; ---- slot understand.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 understand) (Stimulus $e0 $x1))
;;      c110  mass 1  {public health issue}
;;     c1765  mass 1  {specific issue}
;;     c2151  mass 1  {reason}

;; ---- slot wear.Theme  [event center]  n 3  clusters 3
(And (Member $e0 wear) (Theme $e0 $x1))
;;     c1294  mass 1  {mask}
;;      c432  mass 1  {inaugural gown}
;;      c498  mass 1  {helmet}

;; ---- slot welcome.Agent  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Agent $e0 $x1))
;;     c2206  mass 1  {host}
;;      c327  mass 1  {industrialization}
;;      c463  mass 1  {whig, whigs}

;; ---- slot welcome.Theme  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Theme $e0 $x1))
;;     c1275  mass 1  {guest, guests}
;;      c327  mass 1  {industrialization}
;;      c463  mass 1  {whig, whigs}

;; ---- slot work.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 work) (Experiencer $e0 $x1))
;;     c1552  mass 1  {mouse}
;;     c1557  mass 1  {site}
;;      c891  mass 1  {travel adaptor}

;; ---- slot work.Manner  [event center]  n 3  clusters 3
(And (Member $e0 work) (Manner $e0 $x1))
;;     c2309  mass 1  {perfectly}
;;     c2314  mass 1  {late, later, last}
;;     c2340  mass 1  {fine, fair, flat}

;; ==================== subtree @ cluster cos 0.90: pooled role level (136 head pairs) ====================

;; Agent ~ Patient  cosine 0.48  JSD 0.822  n 888 / 455  shared: {person, people} {thing, things} {children, kids}
(Agent $e $x)
(Patient $e $x)

;; Patient ~ Theme  cosine 0.48  JSD 0.812  n 455 / 594  shared: {thing, things} {person, people} {song, sing}
(Patient $e $x)
(Theme $e $x)

;; Agent ~ Experiencer  cosine 0.43  JSD 0.765  n 888 / 261  shared: {person, people} {thing, things} {children, kids}
(Agent $e $x)
(Experiencer $e $x)

;; Agent ~ Theme  cosine 0.40  JSD 0.839  n 888 / 594  shared: {person, people} {thing, things} {company}
(Agent $e $x)
(Theme $e $x)

;; Experiencer ~ Patient  cosine 0.36  JSD 0.753  n 261 / 455  shared: {person, people} {thing, things} {indigenous, indigenous, people}
(Experiencer $e $x)
(Patient $e $x)

;; Agent ~ Recipient  cosine 0.33  JSD 0.845  n 888 / 29  shared: {person, people} {company} {children, kids}
(Agent $e $x)
(Recipient $e $x)

;; Stimulus ~ Theme  cosine 0.32  JSD 0.912  n 34 / 594  shared: {thing, things} {food} {question, questions, ask}
(Stimulus $e $x)
(Theme $e $x)

;; Experiencer ~ Theme  cosine 0.25  JSD 0.894  n 261 / 594  shared: {thing, things} {person, people} {children, kids}
(Experiencer $e $x)
(Theme $e $x)

;; Patient ~ Stimulus  cosine 0.23  JSD 0.933  n 455 / 34  shared: {thing, things} {food} {knock}
(Patient $e $x)
(Stimulus $e $x)

;; Holder ~ Theme  cosine 0.21  JSD 0.896  n 48 / 594  shared: {thing, things} {food} {house, home}
(Holder $e $x)
(Theme $e $x)

;; Holder ~ Patient  cosine 0.19  JSD 0.89  n 48 / 455  shared: {thing, things} {movie, film} {room, rooms}
(Holder $e $x)
(Patient $e $x)

;; Experiencer ~ Recipient  cosine 0.16  JSD 0.932  n 261 / 29  shared: {person, people} {children, kids}
(Experiencer $e $x)
(Recipient $e $x)

;; Agent ~ Stimulus  cosine 0.15  JSD 0.936  n 888 / 34  shared: {thing, things} {Jessica} {child, kid}
(Agent $e $x)
(Stimulus $e $x)

;; Patient ~ Recipient  cosine 0.14  JSD 0.941  n 455 / 29  shared: {person, people} {children, kids} {city, cities}
(Patient $e $x)
(Recipient $e $x)

;; Holder ~ Stimulus  cosine 0.13  JSD 0.917  n 48 / 34  shared: {thing, things} {food}
(Holder $e $x)
(Stimulus $e $x)

;; Goal ~ Holder  cosine 0.12  JSD 0.895  n 93 / 48  shared: {house, home} {town} {place, places}
(Goal $e $x)
(Holder $e $x)

;; Recipient ~ Theme  cosine 0.12  JSD 0.932  n 29 / 594  shared: {person, people} {children, kids} {company}
(Recipient $e $x)
(Theme $e $x)

;; Goal ~ Source  cosine 0.12  JSD 0.879  n 93 / 47  shared: {town} {here} {school}
(Goal $e $x)
(Source $e $x)

;; Location ~ Source  cosine 0.11  JSD 0.923  n 210 / 47  shared: {here} {place, places} {town}
(Location $e $x)
(Source $e $x)

;; Theme ~ To  cosine 0.10  JSD 0.938  n 594 / 46  shared: {thing, things} {talk, conversation} {make}
(Theme $e $x)
(To $e $x)

;; Experiencer ~ Stimulus  cosine 0.10  JSD 0.955  n 261 / 34  shared: {thing, things} {child, kid}
(Experiencer $e $x)
(Stimulus $e $x)

;; Agent ~ Holder  cosine 0.10  JSD 0.926  n 888 / 48  shared: {thing, things} {Wilson, wilson} {Karen}
(Agent $e $x)
(Holder $e $x)

;; Experiencer ~ Holder  cosine 0.10  JSD 0.91  n 261 / 48  shared: {thing, things} {place, places} {bad, weather}
(Experiencer $e $x)
(Holder $e $x)

;; Goal ~ Location  cosine 0.09  JSD 0.912  n 93 / 210  shared: {house, home} {here} {town}
(Goal $e $x)
(Location $e $x)

;; Holder ~ Source  cosine 0.07  JSD 0.929  n 48 / 47  shared: {town} {place, places} {room, rooms}
(Holder $e $x)
(Source $e $x)

;; Goal ~ Patient  cosine 0.07  JSD 0.93  n 93 / 455  shared: {tree, trees} {house, home} {room, rooms}
(Goal $e $x)
(Patient $e $x)

;; Holder ~ Location  cosine 0.05  JSD 0.942  n 48 / 210  shared: {town} {place, places} {house, home}
(Holder $e $x)
(Location $e $x)

;; Patient ~ To  cosine 0.05  JSD 0.972  n 455 / 46  shared: {thing, things}
(Patient $e $x)
(To $e $x)

;; For ~ Goal  cosine 0.05  JSD 0.951  n 39 / 93  shared: {bed} {happiness, joy}
(For $e $x)
(Goal $e $x)

;; Stimulus ~ To  cosine 0.05  JSD 0.961  n 34 / 46  shared: {thing, things}
(Stimulus $e $x)
(To $e $x)

;; Goal ~ Theme  cosine 0.05  JSD 0.954  n 93 / 594  shared: {house, home} {room, rooms} {big, cat fight}
(Goal $e $x)
(Theme $e $x)

;; Patient ~ Source  cosine 0.05  JSD 0.963  n 455 / 47  shared: {tree, trees} {room, rooms} {school}
(Patient $e $x)
(Source $e $x)

;; Agent ~ To  cosine 0.04  JSD 0.958  n 888 / 46  shared: {thing, things} {George Allen, Chuck Robb} {doctor}
(Agent $e $x)
(To $e $x)

;; Location ~ Patient  cosine 0.04  JSD 0.933  n 210 / 455  shared: {table} {hotel} {world}
(Location $e $x)
(Patient $e $x)

;; Holder ~ To  cosine 0.04  JSD 0.949  n 48 / 46  shared: {thing, things} {repeat, repetition}
(Holder $e $x)
(To $e $x)

;; Manner ~ Time  cosine 0.04  JSD 0.951  n 115 / 107  shared: {late, later} {immediately, instantly, right away}
(Manner $e $x)
(Time $e $x)

;; Experiencer ~ Goal  cosine 0.04  JSD 0.953  n 261 / 93  shared: {place, places} {school} {sauce}
(Experiencer $e $x)
(Goal $e $x)

;; Experiencer ~ Result  cosine 0.03  JSD 0.964  n 261 / 43  shared: {indigenous, indigenous, people} {modern, street} {cozy, living room, theater, cozy, theater}
(Experiencer $e $x)
(Result $e $x)

;; Goal ~ Manner  cosine 0.03  JSD 0.97  n 93 / 115  shared: {well} {back, backward}
(Goal $e $x)
(Manner $e $x)

;; In ~ Result  cosine 0.03  JSD 0.97  n 50 / 43  shared: {silent, silence}
(In $e $x)
(Result $e $x)

;; Instrument ~ Patient  cosine 0.03  JSD 0.964  n 34 / 455  shared: {snow} {road, roads} {food}
(Instrument $e $x)
(Patient $e $x)

;; Experiencer ~ Location  cosine 0.03  JSD 0.963  n 261 / 210  shared: {Europe, Western Europe} {place, places} {site}
(Experiencer $e $x)
(Location $e $x)

;; Location ~ Theme  cosine 0.03  JSD 0.95  n 210 / 594  shared: {house, home} {Gareccio} {group}
(Location $e $x)
(Theme $e $x)

;; Experiencer ~ To  cosine 0.03  JSD 0.974  n 261 / 46  shared: {thing, things} {doctor}
(Experiencer $e $x)
(To $e $x)

;; For ~ Theme  cosine 0.03  JSD 0.976  n 39 / 594  shared: {work} {polish} {call}
(For $e $x)
(Theme $e $x)

;; Instrument ~ Stimulus  cosine 0.02  JSD 0.971  n 34 / 34  shared: {food}
(Instrument $e $x)
(Stimulus $e $x)

;; Location ~ To  cosine 0.02  JSD 0.978  n 210 / 46  shared: {talk, conversation} {shore, shoreline}
(Location $e $x)
(To $e $x)

;; Manner ~ Result  cosine 0.02  JSD 0.966  n 115 / 43  shared: {together} {effective, effectively}
(Manner $e $x)
(Result $e $x)

;; Source ~ Theme  cosine 0.02  JSD 0.976  n 47 / 594  shared: {room, rooms} {eat} {mosquito}
(Source $e $x)
(Theme $e $x)

;; Experiencer ~ Source  cosine 0.02  JSD 0.98  n 261 / 47  shared: {place, places} {school}
(Experiencer $e $x)
(Source $e $x)

;; In ~ Theme  cosine 0.02  JSD 0.977  n 50 / 594  shared: {english} {understand} {reality, real life}
(In $e $x)
(Theme $e $x)

;; Goal ~ In  cosine 0.02  JSD 0.971  n 93 / 50  shared: {field, fields} {way, ways}
(Goal $e $x)
(In $e $x)

;; Holder ~ Instrument  cosine 0.02  JSD 0.975  n 48 / 34  shared: {food}
(Holder $e $x)
(Instrument $e $x)

;; In ~ Stimulus  cosine 0.02  JSD 0.976  n 50 / 34  shared: {poetry}
(In $e $x)
(Stimulus $e $x)

;; Result ~ Source  cosine 0.02  JSD 0.978  n 43 / 47  shared: {bat}
(Result $e $x)
(Source $e $x)

;; Agent ~ For  cosine 0.02  JSD 0.975  n 888 / 39  shared: {cook} {bus} {patient}
(Agent $e $x)
(For $e $x)

;; In ~ Source  cosine 0.02  JSD 0.979  n 50 / 47  shared: {way, ways}
(In $e $x)
(Source $e $x)

;; Agent ~ Goal  cosine 0.01  JSD 0.974  n 888 / 93  shared: {house, home} {campfire} {community}
(Agent $e $x)
(Goal $e $x)

;; Location ~ Recipient  cosine 0.01  JSD 0.983  n 210 / 29  shared: {city, cities}
(Location $e $x)
(Recipient $e $x)

;; Patient ~ Result  cosine 0.01  JSD 0.983  n 455 / 43  shared: {indigenous, indigenous, people} {cozy, living room, theater, cozy, theater}
(Patient $e $x)
(Result $e $x)

;; Experiencer ~ Instrument  cosine 0.01  JSD 0.983  n 261 / 34  shared: {train} {road, roads}
(Experiencer $e $x)
(Instrument $e $x)

;; Goal ~ Recipient  cosine 0.01  JSD 0.982  n 93 / 29  shared: {Loren}
(Goal $e $x)
(Recipient $e $x)

;; In ~ Patient  cosine 0.01  JSD 0.983  n 50 / 455  shared: {field, fields} {weather}
(In $e $x)
(Patient $e $x)

;; Experiencer ~ For  cosine 0.01  JSD 0.984  n 261 / 39  shared: {happiness, joy} {general, general purpose}
(Experiencer $e $x)
(For $e $x)

;; Goal ~ Instrument  cosine 0.01  JSD 0.983  n 93 / 34  shared: {snow}
(Goal $e $x)
(Instrument $e $x)

;; Experiencer ~ In  cosine 0.01  JSD 0.988  n 261 / 50  shared: {weather}
(Experiencer $e $x)
(In $e $x)

;; Goal ~ Result  cosine 0.01  JSD 0.985  n 93 / 43  shared: {dead, die, death}
(Goal $e $x)
(Result $e $x)

;; In ~ Location  cosine 0.01  JSD 0.983  n 50 / 210  shared: {water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; Instrument ~ Theme  cosine 0.01  JSD 0.99  n 34 / 594  shared: {food}
(Instrument $e $x)
(Theme $e $x)

;; Agent ~ Instrument  cosine 0.01  JSD 0.984  n 888 / 34  shared: {train} {plant, plants} {snow}
(Agent $e $x)
(Instrument $e $x)

;; Result ~ Theme  cosine 0.01  JSD 0.988  n 43 / 594  shared: {sleep} {inomaru}
(Result $e $x)
(Theme $e $x)

;; Agent ~ Location  cosine 0.01  JSD 0.977  n 888 / 210  shared: {fire} {sun, sunlight} {France}
(Agent $e $x)
(Location $e $x)

;; Patient ~ Time  cosine 0.01  JSD 0.993  n 455 / 107  shared: {night}
(Patient $e $x)
(Time $e $x)

;; Agent ~ Result  cosine 0.01  JSD 0.988  n 888 / 43  shared: {crow} {indigenous, indigenous, people} {sleep}
(Agent $e $x)
(Result $e $x)

;; Agent ~ Source  cosine 0.01  JSD 0.991  n 888 / 47  shared: {plane, aeroplane, airplane}
(Agent $e $x)
(Source $e $x)

;; Source ~ Time  cosine 0.01  JSD 0.986  n 47 / 107  shared: {point}
(Source $e $x)
(Time $e $x)

;; Theme ~ Time  cosine 0.01  JSD 0.995  n 594 / 107  shared: {morning, early morning}
(Theme $e $x)
(Time $e $x)

;; Agent ~ In  cosine 0.00  JSD 0.997  n 888 / 50  shared: {reality, real life}
(Agent $e $x)
(In $e $x)

;; Agent ~ Time  cosine 0.00  JSD 0.997  n 888 / 107  shared: {spring}
(Agent $e $x)
(Time $e $x)

;; Agent ~ Manner  cosine 0.00  JSD 1.0  n 888 / 115  shared: 
(Agent $e $x)
(Manner $e $x)

;; Experiencer ~ Manner  cosine 0.00  JSD 1.0  n 261 / 115  shared: 
(Experiencer $e $x)
(Manner $e $x)

;; Experiencer ~ Time  cosine 0.00  JSD 1.0  n 261 / 107  shared: 
(Experiencer $e $x)
(Time $e $x)

;; For ~ Holder  cosine 0.00  JSD 1.0  n 39 / 48  shared: 
(For $e $x)
(Holder $e $x)

;; For ~ In  cosine 0.00  JSD 1.0  n 39 / 50  shared: 
(For $e $x)
(In $e $x)

;; For ~ Instrument  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Instrument $e $x)

;; For ~ Location  cosine 0.00  JSD 1.0  n 39 / 210  shared: 
(For $e $x)
(Location $e $x)

;; For ~ Manner  cosine 0.00  JSD 1.0  n 39 / 115  shared: 
(For $e $x)
(Manner $e $x)

;; For ~ Patient  cosine 0.00  JSD 1.0  n 39 / 455  shared: 
(For $e $x)
(Patient $e $x)

;; For ~ Recipient  cosine 0.00  JSD 1.0  n 39 / 29  shared: 
(For $e $x)
(Recipient $e $x)

;; For ~ Result  cosine 0.00  JSD 1.0  n 39 / 43  shared: 
(For $e $x)
(Result $e $x)

;; For ~ Source  cosine 0.00  JSD 1.0  n 39 / 47  shared: 
(For $e $x)
(Source $e $x)

;; For ~ Stimulus  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Stimulus $e $x)

;; For ~ Time  cosine 0.00  JSD 1.0  n 39 / 107  shared: 
(For $e $x)
(Time $e $x)

;; For ~ To  cosine 0.00  JSD 1.0  n 39 / 46  shared: 
(For $e $x)
(To $e $x)

;; Goal ~ Stimulus  cosine 0.00  JSD 1.0  n 93 / 34  shared: 
(Goal $e $x)
(Stimulus $e $x)

;; Goal ~ Time  cosine 0.00  JSD 1.0  n 93 / 107  shared: 
(Goal $e $x)
(Time $e $x)

;; Goal ~ To  cosine 0.00  JSD 1.0  n 93 / 46  shared: 
(Goal $e $x)
(To $e $x)

;; Holder ~ In  cosine 0.00  JSD 1.0  n 48 / 50  shared: 
(Holder $e $x)
(In $e $x)

;; Holder ~ Manner  cosine 0.00  JSD 1.0  n 48 / 115  shared: 
(Holder $e $x)
(Manner $e $x)

;; Holder ~ Recipient  cosine 0.00  JSD 1.0  n 48 / 29  shared: 
(Holder $e $x)
(Recipient $e $x)

;; Holder ~ Result  cosine 0.00  JSD 1.0  n 48 / 43  shared: 
(Holder $e $x)
(Result $e $x)

;; Holder ~ Time  cosine 0.00  JSD 1.0  n 48 / 107  shared: 
(Holder $e $x)
(Time $e $x)

;; In ~ Instrument  cosine 0.00  JSD 1.0  n 50 / 34  shared: 
(In $e $x)
(Instrument $e $x)

;; In ~ Manner  cosine 0.00  JSD 1.0  n 50 / 115  shared: 
(In $e $x)
(Manner $e $x)

;; In ~ Recipient  cosine 0.00  JSD 1.0  n 50 / 29  shared: 
(In $e $x)
(Recipient $e $x)

;; In ~ Time  cosine 0.00  JSD 1.0  n 50 / 107  shared: 
(In $e $x)
(Time $e $x)

;; In ~ To  cosine 0.00  JSD 1.0  n 50 / 46  shared: 
(In $e $x)
(To $e $x)

;; Instrument ~ Location  cosine 0.00  JSD 1.0  n 34 / 210  shared: 
(Instrument $e $x)
(Location $e $x)

;; Instrument ~ Manner  cosine 0.00  JSD 1.0  n 34 / 115  shared: 
(Instrument $e $x)
(Manner $e $x)

;; Instrument ~ Recipient  cosine 0.00  JSD 1.0  n 34 / 29  shared: 
(Instrument $e $x)
(Recipient $e $x)

;; Instrument ~ Result  cosine 0.00  JSD 1.0  n 34 / 43  shared: 
(Instrument $e $x)
(Result $e $x)

;; Instrument ~ Source  cosine 0.00  JSD 1.0  n 34 / 47  shared: 
(Instrument $e $x)
(Source $e $x)

;; Instrument ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Instrument $e $x)
(Time $e $x)

;; Instrument ~ To  cosine 0.00  JSD 1.0  n 34 / 46  shared: 
(Instrument $e $x)
(To $e $x)

;; Location ~ Manner  cosine 0.00  JSD 1.0  n 210 / 115  shared: 
(Location $e $x)
(Manner $e $x)

;; Location ~ Result  cosine 0.00  JSD 1.0  n 210 / 43  shared: 
(Location $e $x)
(Result $e $x)

;; Location ~ Stimulus  cosine 0.00  JSD 1.0  n 210 / 34  shared: 
(Location $e $x)
(Stimulus $e $x)

;; Location ~ Time  cosine 0.00  JSD 1.0  n 210 / 107  shared: 
(Location $e $x)
(Time $e $x)

;; Manner ~ Patient  cosine 0.00  JSD 1.0  n 115 / 455  shared: 
(Manner $e $x)
(Patient $e $x)

;; Manner ~ Recipient  cosine 0.00  JSD 1.0  n 115 / 29  shared: 
(Manner $e $x)
(Recipient $e $x)

;; Manner ~ Source  cosine 0.00  JSD 1.0  n 115 / 47  shared: 
(Manner $e $x)
(Source $e $x)

;; Manner ~ Stimulus  cosine 0.00  JSD 1.0  n 115 / 34  shared: 
(Manner $e $x)
(Stimulus $e $x)

;; Manner ~ Theme  cosine 0.00  JSD 1.0  n 115 / 594  shared: 
(Manner $e $x)
(Theme $e $x)

;; Manner ~ To  cosine 0.00  JSD 1.0  n 115 / 46  shared: 
(Manner $e $x)
(To $e $x)

;; Recipient ~ Result  cosine 0.00  JSD 1.0  n 29 / 43  shared: 
(Recipient $e $x)
(Result $e $x)

;; Recipient ~ Source  cosine 0.00  JSD 1.0  n 29 / 47  shared: 
(Recipient $e $x)
(Source $e $x)

;; Recipient ~ Stimulus  cosine 0.00  JSD 1.0  n 29 / 34  shared: 
(Recipient $e $x)
(Stimulus $e $x)

;; Recipient ~ Time  cosine 0.00  JSD 1.0  n 29 / 107  shared: 
(Recipient $e $x)
(Time $e $x)

;; Recipient ~ To  cosine 0.00  JSD 1.0  n 29 / 46  shared: 
(Recipient $e $x)
(To $e $x)

;; Result ~ Stimulus  cosine 0.00  JSD 1.0  n 43 / 34  shared: 
(Result $e $x)
(Stimulus $e $x)

;; Result ~ Time  cosine 0.00  JSD 1.0  n 43 / 107  shared: 
(Result $e $x)
(Time $e $x)

;; Result ~ To  cosine 0.00  JSD 1.0  n 43 / 46  shared: 
(Result $e $x)
(To $e $x)

;; Source ~ Stimulus  cosine 0.00  JSD 1.0  n 47 / 34  shared: 
(Source $e $x)
(Stimulus $e $x)

;; Source ~ To  cosine 0.00  JSD 1.0  n 47 / 46  shared: 
(Source $e $x)
(To $e $x)

;; Stimulus ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Stimulus $e $x)
(Time $e $x)

;; Time ~ To  cosine 0.00  JSD 1.0  n 107 / 46  shared: 
(Time $e $x)
(To $e $x)

;; ==================== subtree @ cluster cos 0.90: slot pairs (2 event-center signals) ====================

;; [same role, different class]  accompany.Agent ~ appear.Agent  cosine 0.76  JSD 0.23  n 4 / 6  shared: {sister, sisters} {person, people}
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000050 tierC-000259
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; [different class and role]  die.Patient ~ sleep.Agent  cosine 0.99  JSD 0.006  n 4 / 3  shared: {person, people} {family, families}
;;   A e.g. tierB-001967 tierC-000199   B e.g. tierC-000041 tierC-000042
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 sleep) (Agent $e0 $x1))

;; ==================== subtree @ cluster cos 0.90: compared slots with their distributions (269 slots, n >= 3) ====================

;; ---- slot <unclassed>.LocatedIn  [entity center]  n 46  clusters 39
(LocatedIn $x0 $x1)
;;     c2705  mass 3  {here}
;;     c1235  mass 2  {garden}
;;      c219  mass 2  {city, cities}
;;      c225  mass 2  {southern}
;;      c945  mass 2  {class}
;;      c989  mass 2  {Derwent Isle}
;;     c1152  mass 1  {full, kitchen sink}
;;     c1225  mass 1  {village}
;;     c1259  mass 1  {tree, trees}
;;     c1356  mass 1  {basket, red}
;;     c1500  mass 1  {country}
;;     c1536  mass 1  {Tatoeba}
;;     c1712  mass 1  {ceiling}
;;     c1713  mass 1  {floor}
;;     c1731  mass 1  {wall}
;;     c1738  mass 1  {house, home}
;;     c1748  mass 1  {full, place}
;;     c1753  mass 1  {storeroom}
;;     c1807  mass 1  {fountain, fountain, full}
;;     c1884  mass 1  {table}
;;     c2167  mass 1  {play}
;;      c236  mass 1  {Algiers}
;;      c238  mass 1  {El Harrach}
;;      c253  mass 1  {Russian Far East, Siberia}
;;      c266  mass 1  {Colombia, Peru}
;;      c270  mass 1  {India, Indonesia}
;;      c272  mass 1  {Japan}
;;      c281  mass 1  {Gaul}
;;      c282  mass 1  {England, UK}
;;      c302  mass 1  {movie, film}
;;       c36  mass 1  {Loglan}
;;       c37  mass 1  {Lojban}
;;      c412  mass 1  {market}
;;      c559  mass 1  {world}
;;      c622  mass 1  {park}
;;      c634  mass 1  {street}
;;      c953  mass 1  {Dianchi Lake, Lake Dianchi}
;;      c967  mass 1  {Huancavelica}
;;      c986  mass 1  {sea, ocean}

;; ---- slot have.Holder  [event center]  n 44  clusters 38
(And (Member $e0 have) (Holder $e0 $x1))
;;      c777  mass 4  {Kristoffer}
;;      c220  mass 2  {town}
;;     c2646  mass 2  {thing, things}
;;      c842  mass 2  {Karen}
;;     c1194  mass 1  {food}
;;     c1243  mass 1  {ivy}
;;     c1284  mass 1  {creature, monster}
;;     c1533  mass 1  {sentence}
;;     c1542  mass 1  {word processor}
;;     c1738  mass 1  {house, home}
;;     c1744  mass 1  {tower}
;;     c1746  mass 1  {place, places}
;;     c1749  mass 1  {hotel}
;;     c1765  mass 1  {room, rooms}
;;     c1836  mass 1  {bad, weather}
;;     c2075  mass 1  {february}
;;      c233  mass 1  {tuareg, tuaregs}
;;      c236  mass 1  {Algiers}
;;      c264  mass 1  {Algeria, Morocco}
;;      c283  mass 1  {Scotland}
;;     c2867  mass 1  {decide, decision}
;;     c2921  mass 1  {repeat, repetition}
;;      c302  mass 1  {movie, film}
;;      c323  mass 1  {mosque, old}
;;      c400  mass 1  {insurance}
;;      c526  mass 1  {library}
;;      c529  mass 1  {writer}
;;      c551  mass 1  {lawyer}
;;      c620  mass 1  {gas station, gas pump, gas pumps}
;;      c710  mass 1  {Wilson, wilson}
;;      c767  mass 1  {Rasputin}
;;      c786  mass 1  {Boldi}
;;      c792  mass 1  {Thomas}
;;      c827  mass 1  {Diego}
;;      c833  mass 1  {Miroslav}
;;      c895  mass 1  {homentropic current}
;;      c896  mass 1  {homentropic flow}
;;      c986  mass 1  {sea, ocean}

;; ---- slot have.Theme  [event center]  n 43  clusters 38
(And (Member $e0 have) (Theme $e0 $x1))
;;     c1467  mass 4  {children, kids}
;;     c1407  mass 2  {constant, entropy, uniform}
;;     c2678  mass 2  {representation, represent}
;;     c1111  mass 1  {taste, nice, taste}
;;     c1234  mass 1  {beautiful, garden}
;;     c1236  mass 1  {leaf, leaves}
;;     c1267  mass 1  {plot, predictable}
;;     c1321  mass 1  {antler, antlers}
;;     c1325  mass 1  {herd, herds}
;;     c1436  mass 1  {friends}
;;     c1578  mass 1  {soul piercing, stare}
;;     c1602  mass 1  {nasty, personality}
;;     c1620  mass 1  {eerie, feeling}
;;     c1625  mass 1  {dream, weird}
;;     c1708  mass 1  {conical, roof}
;;     c1773  mass 1  {blue, curtain}
;;     c1947  mass 1  {atmosphere, homely}
;;     c2016  mass 1  {value}
;;     c2022  mass 1  {reputation}
;;     c2101  mass 1  {days}
;;     c2306  mass 1  {chance}
;;     c2333  mass 1  {color}
;;     c2508  mass 1  {meanings}
;;     c2526  mass 1  {effect}
;;       c26  mass 1  {bank, documents, valuable}
;;     c2646  mass 1  {thing, things}
;;     c2653  mass 1  {purpose, single}
;;     c2660  mass 1  {right}
;;     c2663  mass 1  {thought, think}
;;     c2933  mass 1  {consequences, serious, wide}
;;      c314  mass 1  {cemetery, cemeteries}
;;      c350  mass 1  {history, rich}
;;      c399  mass 1  {deductible, high}
;;      c564  mass 1  {internal politics, intriguing}
;;      c620  mass 1  {gas station, gas pump, gas pumps}
;;      c665  mass 1  {guard, guards}
;;       c83  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;      c915  mass 1  {parenthetic, style}

;; ---- slot <unclassed>.Possession  [entity center]  n 30  clusters 18
(Possession $x0 $x1)
;;     c1429  mass 5  {person, people}
;;      c545  mass 4  {Free Soil Party}
;;      c546  mass 4  {Republican Party}
;;      c320  mass 2  {sunni community, communities, neighbouring, other, sunni, sunni communities}
;;      c377  mass 2  {subsequent game}
;;     c1007  mass 1  {Jupiter}
;;     c1495  mass 1  {Twilight}
;;     c1500  mass 1  {country}
;;      c166  mass 1  {Yunnan}
;;     c2238  mass 1  {easy, generalization}
;;     c2539  mass 1  {union}
;;     c2646  mass 1  {thing, things}
;;      c488  mass 1  {islamic ivory}
;;      c656  mass 1  {radical group}
;;      c691  mass 1  {God}
;;      c741  mass 1  {Dora Smith}
;;      c909  mass 1  {logical phrase}
;;      c910  mass 1  {logical proposition}

;; ---- slot use.Theme  [event center]  n 23  clusters 21
(And (Member $e0 use) (Theme $e0 $x1))
;;        c3  mass 2  {banach mackey topology}
;;        c4  mass 2  {weak arens space topology}
;;      c100  mass 1  {current, designation convention}
;;     c1052  mass 1  {jingle}
;;     c1068  mass 1  {auto tune, tune}
;;     c1135  mass 1  {sugar}
;;     c1520  mass 1  {metaphor}
;;     c1531  mass 1  {phrase}
;;     c1533  mass 1  {sentence}
;;     c1541  mass 1  {word}
;;     c1765  mass 1  {room, rooms}
;;     c1792  mass 1  {fire}
;;     c1893  mass 1  {machine}
;;     c2939  mass 1  {public fund}
;;      c351  mass 1  {calendars, various}
;;      c464  mass 1  {chemical agent}
;;       c65  mass 1  {Midway}
;;      c655  mass 1  {paramilitary group}
;;      c754  mass 1  {Iga}
;;       c98  mass 1  {Laravel}
;;       c99  mass 1  {naming convention, current, naming convention}

;; ---- slot make.Patient  [event center]  n 20  clusters 20
(And (Member $e0 make) (Patient $e0 $x1))
;;     c1025  mass 1  {travel}
;;     c1040  mass 1  {high pitched, high pitched, noise}
;;     c1058  mass 1  {clicking, sound}
;;     c1120  mass 1  {cup}
;;     c1183  mass 1  {chicken fried steak}
;;     c1581  mass 1  {eye contact}
;;     c1647  mass 1  {bad, matter}
;;     c1736  mass 1  {comfortable, house}
;;     c1767  mass 1  {beautiful, room}
;;     c1826  mass 1  {big, snowman}
;;     c2005  mass 1  {buy, purchase}
;;     c2246  mass 1  {copes}
;;     c2396  mass 1  {claim, claims}
;;     c2503  mass 1  {difference, different, differ}
;;     c2504  mass 1  {big, difference}
;;      c262  mass 1  {Afghanistan}
;;      c512  mass 1  {paper, paper sheet, paper sheets}
;;       c69  mass 1  {telephone call}
;;      c694  mass 1  {Augustus}
;;      c736  mass 1  {Isabella}

;; ---- slot build.Patient  [event center]  n 18  clusters 8
(And (Member $e0 build) (Patient $e0 $x1))
;;     c1749  mass 4  {hotel}
;;      c513  mass 4  {paper factory, paper mill}
;;     c1765  mass 3  {room, rooms}
;;     c2646  mass 2  {thing, things}
;;     c2755  mass 2  {horn}
;;     c1910  mass 1  {network, wells}
;;      c371  mass 1  {playground, new, playground}
;;       c58  mass 1  {original, turing machine}

;; ---- slot make.Agent  [event center]  n 18  clusters 18
(And (Member $e0 make) (Agent $e0 $x1))
;;     c1140  mass 1  {diner}
;;     c1281  mass 1  {cat, cats}
;;     c1447  mass 1  {man, guy}
;;     c1465  mass 1  {boys}
;;     c1772  mass 1  {curtain, curtains}
;;     c1823  mass 1  {wind, gusty, winds}
;;     c1990  mass 1  {artistic beauty}
;;     c2241  mass 1  {practical utility}
;;     c2646  mass 1  {thing, things}
;;      c653  mass 1  {Taliban}
;;      c694  mass 1  {Augustus}
;;       c73  mass 1  {customer}
;;      c748  mass 1  {Hanako, Mariko, Yumi}
;;      c778  mass 1  {James}
;;      c780  mass 1  {David}
;;      c819  mass 1  {Elias}
;;      c836  mass 1  {Martino, Damiano}
;;      c837  mass 1  {Lorenzo}

;; ---- slot go.Agent  [event center]  n 15  clusters 14
(And (Member $e0 go) (Agent $e0 $x1))
;;      c735  mass 2  {Katherine, Kate}
;;     c1281  mass 1  {cat, cats}
;;     c1440  mass 1  {Mom, mother, mom}
;;     c1467  mass 1  {children, kids}
;;      c733  mass 1  {Olivia}
;;      c739  mass 1  {Linda}
;;      c748  mass 1  {Hanako, Mariko, Yumi}
;;      c775  mass 1  {Matthew}
;;      c784  mass 1  {Donald}
;;      c810  mass 1  {Mennad}
;;      c834  mass 1  {Claudio, Flavio}
;;      c841  mass 1  {Daniel}
;;      c844  mass 1  {Kalman}
;;      c935  mass 1  {pupils}

;; ---- slot play.Agent  [event center]  n 15  clusters 11
(And (Member $e0 play) (Agent $e0 $x1))
;;     c1467  mass 3  {children, kids}
;;      c669  mass 2  {Boston Red Sox}
;;      c670  mass 2  {Cincinnati Reds}
;;     c1465  mass 1  {boys}
;;     c1468  mass 1  {child, kid}
;;      c148  mass 1  {biology}
;;      c332  mass 1  {religion}
;;      c719  mass 1  {Audrey Hepburn}
;;      c720  mass 1  {Audrey Heppurn}
;;      c748  mass 1  {Hanako, Mariko, Yumi}
;;      c793  mass 1  {Tony}

;; ---- slot build.Agent  [event center]  n 14  clusters 5
(And (Member $e0 build) (Agent $e0 $x1))
;;     c1381  mass 8  {company}
;;     c1429  mass 2  {person, people}
;;      c870  mass 2  {O. R. Woodcock, William Ewer}
;;      c232  mass 1  {mozabite, mozabites}
;;      c922  mass 1  {community}

;; ---- slot find.Location  [event center]  n 14  clusters 10
(And (Member $e0 find) (Location $e0 $x1))
;;      c166  mass 2  {Yunnan}
;;      c225  mass 2  {southern}
;;     c2487  mass 2  {bench}
;;      c956  mass 2  {tributary, tributaries}
;;     c1502  mass 1  {west, western}
;;      c196  mass 1  {station}
;;      c251  mass 1  {Europe, Western Europe}
;;      c316  mass 1  {tomb}
;;      c953  mass 1  {Dianchi Lake, Lake Dianchi}
;;      c984  mass 1  {Sahara Desert}

;; ---- slot <unclassed>.SubsetOf  [entity center]  n 13  clusters 12
(SubsetOf $x0 $x1)
;;     c1429  mass 2  {person, people}
;;     c1224  mass 1  {villager, villagers}
;;      c123  mass 1  {refugee, refugees}
;;     c1301  mass 1  {centipede, centipedes}
;;     c1471  mass 1  {chicks}
;;     c1473  mass 1  {girls}
;;     c1889  mass 1  {window, windows}
;;      c200  mass 1  {corner, corners}
;;     c2002  mass 1  {shop, shops}
;;      c523  mass 1  {mayan book, mayan books}
;;      c588  mass 1  {planes}
;;      c935  mass 1  {pupils}

;; ---- slot start.Theme  [event center]  n 13  clusters 13
(And (Member $e0 start) (Theme $e0 $x1))
;;     c1079  mass 1  {chant}
;;     c1593  mass 1  {vomit}
;;     c1804  mass 1  {cry}
;;     c2165  mass 1  {hear}
;;     c2169  mass 1  {talk, conversation}
;;     c2291  mass 1  {improve}
;;     c2411  mass 1  {disappear, vanish}
;;     c2571  mass 1  {run out}
;;     c2764  mass 1  {roll, roller}
;;     c2780  mass 1  {appear, show up}
;;     c2782  mass 1  {show}
;;        c8  mass 1  {light headed, feel, light headed}
;;      c943  mass 1  {high school}

;; ---- slot go.Goal  [event center]  n 12  clusters 9
(And (Member $e0 go) (Goal $e0 $x1))
;;     c2095  mass 4  {bed}
;;      c135  mass 1  {hospital}
;;     c1746  mass 1  {place, places}
;;     c1769  mass 1  {bathroom}
;;      c638  mass 1  {way, ways}
;;      c740  mass 1  {Loren}
;;       c83  mass 1  {aesthetic salon, beauty salon, beauty salons}
;;       c86  mass 1  {supermarket}
;;      c942  mass 1  {school}

;; ---- slot study.Agent  [event center]  n 12  clusters 9
(And (Member $e0 study) (Agent $e0 $x1))
;;     c1429  mass 3  {person, people}
;;       c56  mass 2  {scientists}
;;       c49  mass 1  {forensics researcher, forensics researchers}
;;      c692  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c737  mass 1  {Beth}
;;      c758  mass 1  {Peter}
;;      c761  mass 1  {Yuri}
;;      c804  mass 1  {Fadil}
;;      c826  mass 1  {Carlos}

;; ---- slot <unclassed>.PartOf  [entity center]  n 11  clusters 10
(PartOf $x0 $x1)
;;      c679  mass 2  {Khurda Road}
;;     c1173  mass 1  {cake}
;;     c1243  mass 1  {ivy}
;;     c1248  mass 1  {plant, plants}
;;     c1334  mass 1  {animal, animals}
;;      c166  mass 1  {Yunnan}
;;     c2167  mass 1  {play}
;;      c488  mass 1  {islamic ivory}
;;      c633  mass 1  {road, street}
;;      c930  mass 1  {student association, student associations}

;; ---- slot become.Patient  [event center]  n 11  clusters 9
(And (Member $e0 become) (Patient $e0 $x1))
;;      c111  mass 2  {indigenous, indigenous, people}
;;     c1648  mass 2  {bad, relationship}
;;     c1042  mass 1  {intense, noise}
;;     c2034  mass 1  {discipline, lax}
;;     c2646  mass 1  {thing, things}
;;      c543  mass 1  {conservative, revolutionary}
;;      c744  mass 1  {Lady Ashton}
;;      c746  mass 1  {inomaru, person}
;;      c973  mass 1  {earth, red}

;; ---- slot begin.Agent  [event center]  n 11  clusters 9
(And (Member $e0 begin) (Agent $e0 $x1))
;;      c110  mass 2  {native american, indigenous american, indigenous americans, native americans}
;;      c117  mass 2  {european american settler, european american settlers}
;;     c1554  mass 1  {Mark}
;;     c1557  mass 1  {crowd, crowd, whole}
;;     c2130  mass 1  {rebel, rebels}
;;      c657  mass 1  {legionnaire, legionnaires}
;;      c738  mass 1  {Jessica}
;;      c779  mass 1  {William}
;;      c780  mass 1  {David}

;; ---- slot begin.Theme  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Theme $e0 $x1))
;;     c2463  mass 4  {create}
;;     c1575  mass 1  {applaud}
;;     c1637  mass 1  {confess}
;;     c2318  mass 1  {bud}
;;     c2461  mass 1  {make}
;;     c2740  mass 1  {hang out}
;;     c2789  mass 1  {distribute}
;;      c447  mass 1  {torture}

;; ---- slot build.Location  [event center]  n 11  clusters 4
(And (Member $e0 build) (Location $e0 $x1))
;;      c255  mass 4  {Kazakhstan}
;;      c162  mass 3  {Eskisehir}
;;      c287  mass 3  {Turkey}
;;      c237  mass 1  {Ghardaia}

;; ---- slot kill.Patient  [event center]  n 11  clusters 6
(And (Member $e0 kill) (Patient $e0 $x1))
;;     c1429  mass 6  {person, people}
;;     c1291  mass 1  {zombie, zombies}
;;     c1327  mass 1  {gazelle}
;;     c1342  mass 1  {fox}
;;      c659  mass 1  {soldier}
;;      c662  mass 1  {soldiers, troops}

;; ---- slot produce.Patient  [event center]  n 11  clusters 7
(And (Member $e0 produce) (Patient $e0 $x1))
;;      c302  mass 4  {movie, film}
;;     c1081  mass 2  {album}
;;      c146  mass 1  {insulin}
;;     c1979  mass 1  {mesmerizing, sheen}
;;      c300  mass 1  {syrian film, film, syrian film}
;;      c301  mass 1  {destined, film, syrian film}
;;      c466  mass 1  {cyanide, harmless, trace}

;; ---- slot start.Patient  [event center]  n 11  clusters 11
(And (Member $e0 start) (Patient $e0 $x1))
;;     c1008  mass 1  {Milky Way}
;;     c1276  mass 1  {dog feed}
;;     c1568  mass 1  {concert}
;;        c2  mass 1  {national fibre optic network project}
;;     c2082  mass 1  {watermelon season}
;;     c2417  mass 1  {crack, cracked}
;;     c2458  mass 1  {knock}
;;     c2646  mass 1  {thing, things}
;;      c495  mass 1  {blue, pockets, sky}
;;      c534  mass 1  {freedom movement, gusher}
;;      c610  mass 1  {truck}

;; ---- slot find.Theme  [event center]  n 10  clusters 6
(And (Member $e0 find) (Theme $e0 $x1))
;;     c2646  mass 4  {thing, things}
;;      c617  mass 2  {Couper}
;;      c485  mass 1  {clay figurine, clay figurines}
;;      c512  mass 1  {paper, paper sheet, paper sheets}
;;      c838  mass 1  {Pietro}
;;      c981  mass 1  {meteorite}

;; ---- slot leave.Agent  [event center]  n 10  clusters 10
(And (Member $e0 leave) (Agent $e0 $x1))
;;       c14  mass 1  {ship}
;;     c1429  mass 1  {person, people}
;;      c587  mass 1  {plane, aeroplane, airplane}
;;      c603  mass 1  {bus}
;;      c613  mass 1  {car}
;;      c766  mass 1  {Ivan}
;;      c771  mass 1  {Marco, Marcus}
;;      c791  mass 1  {Tom, Tommy}
;;      c829  mass 1  {Rodrigo}
;;      c864  mass 1  {Brian}

;; ---- slot serve.Agent  [event center]  n 10  clusters 9
(And (Member $e0 serve) (Agent $e0 $x1))
;;      c173  mass 2  {Indooroopilly}
;;     c1429  mass 1  {person, people}
;;     c1442  mass 1  {grandmother}
;;     c1492  mass 1  {Rosewood}
;;      c170  mass 1  {Ipswich}
;;      c171  mass 1  {Ipswich & Rosewood}
;;      c712  mass 1  {president, person, president}
;;      c832  mass 1  {Janos, Lajos}
;;      c868  mass 1  {Yitzhak}

;; ---- slot take.Theme  [event center]  n 10  clusters 9
(And (Member $e0 take) (Theme $e0 $x1))
;;     c1428  mass 2  {identity, identify}
;;     c1379  mass 1  {office}
;;     c1855  mass 1  {portrait}
;;     c2215  mass 1  {power}
;;     c2221  mass 1  {drastic, measures}
;;     c2646  mass 1  {thing, things}
;;     c2764  mass 1  {roll, roller}
;;     c2920  mass 1  {close, look}
;;     c2922  mass 1  {while}

;; ---- slot try.Agent  [event center]  n 10  clusters 10
(And (Member $e0 try) (Agent $e0 $x1))
;;     c1001  mass 1  {alien}
;;     c1323  mass 1  {crocodile}
;;     c1381  mass 1  {company}
;;     c1462  mass 1  {man, young}
;;     c1554  mass 1  {Mark}
;;      c182  mass 1  {Santiago}
;;      c780  mass 1  {David}
;;      c789  mass 1  {Felix}
;;      c798  mass 1  {Bob}
;;      c834  mass 1  {Claudio, Flavio}

;; ---- slot write.Patient  [event center]  n 10  clusters 8
(And (Member $e0 write) (Patient $e0 $x1))
;;     c1078  mass 2  {song, sing}
;;     c1918  mass 2  {episode}
;;     c1426  mass 1  {character}
;;     c1533  mass 1  {sentence}
;;     c1537  mass 1  {screenplay}
;;     c1538  mass 1  {script}
;;     c2259  mass 1  {letter}
;;      c524  mass 1  {book}

;; ---- slot fall.Patient  [event center]  n 9  clusters 9
(And (Member $e0 fall) (Patient $e0 $x1))
;;     c1131  mass 1  {ice pellet}
;;     c1471  mass 1  {chicks}
;;     c1548  mass 1  {hush of anticipation}
;;     c1676  mass 1  {dead, rotten, tree}
;;     c1829  mass 1  {snow}
;;     c1878  mass 1  {scaffolding}
;;     c2416  mass 1  {forest, silent}
;;      c525  mass 1  {books}
;;      c935  mass 1  {pupils}

;; ---- slot follow.Agent  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Agent $e0 $x1))
;;     c2316  mass 2  {bhadala, bhadalas}
;;      c324  mass 2  {muslim house, house, muslim}
;;     c1295  mass 1  {beast, crawling}
;;      c636  mass 1  {road, roads}
;;      c695  mass 1  {Alexander}
;;      c802  mass 1  {Bailey}
;;      c806  mass 1  {Sami}

;; ---- slot follow.Theme  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Theme $e0 $x1))
;;      c226  mass 2  {region, regions}
;;      c346  mass 2  {tradition, traditions}
;;      c722  mass 1  {Layla}
;;      c732  mass 1  {Margaret Fleming}
;;      c825  mass 1  {Lukas}
;;      c857  mass 1  {Henry Cole}
;;      c991  mass 1  {shore, shoreline}

;; ---- slot hear.Stimulus  [event center]  n 9  clusters 9
(And (Member $e0 hear) (Stimulus $e0 $x1))
;;     c1036  mass 1  {barking, growling, noises}
;;     c1048  mass 1  {noise, ticking}
;;     c1065  mass 1  {music, upbeat}
;;     c1662  mass 1  {crash}
;;     c1937  mass 1  {shoot, shot}
;;     c2451  mass 1  {bang}
;;     c2458  mass 1  {knock}
;;     c2646  mass 1  {thing, things}
;;     c2724  mass 1  {start, begin}

;; ---- slot kill.Agent  [event center]  n 9  clusters 6
(And (Member $e0 kill) (Agent $e0 $x1))
;;     c1815  mass 4  {hurricane}
;;     c1345  mass 1  {lion, lions}
;;      c145  mass 1  {cancer}
;;     c1792  mass 1  {fire}
;;     c1938  mass 1  {hunter}
;;      c766  mass 1  {Ivan}

;; ---- slot sing.Agent  [event center]  n 9  clusters 7
(And (Member $e0 sing) (Agent $e0 $x1))
;;     c1420  mass 2  {sister, sisters}
;;     c1429  mass 2  {person, people}
;;     c1082  mass 1  {Amateur Barbershop Harmony Society}
;;     c1313  mass 1  {bird, birds}
;;     c1372  mass 1  {groups, professional}
;;      c685  mass 1  {actress, actor}
;;      c780  mass 1  {David}

;; ---- slot take.Agent  [event center]  n 9  clusters 8
(And (Member $e0 take) (Agent $e0 $x1))
;;     c1429  mass 2  {person, people}
;;     c1179  mass 1  {cook}
;;     c2646  mass 1  {thing, things}
;;      c705  mass 1  {Jerry Rawlings}
;;      c712  mass 1  {president, person, president}
;;      c772  mass 1  {Michael}
;;      c828  mass 1  {Gustavo, Edmundo}
;;      c832  mass 1  {Janos, Lajos}

;; ---- slot become.Result  [event center]  n 8  clusters 7
(And (Member $e0 become) (Result $e0 $x1))
;;     c1645  mass 2  {bad}
;;      c111  mass 1  {indigenous, indigenous, people}
;;     c1631  mass 1  {alarmed}
;;      c194  mass 1  {lax}
;;     c2126  mass 1  {red}
;;      c542  mass 1  {conservative}
;;      c745  mass 1  {inomaru}

;; ---- slot change.Patient  [event center]  n 8  clusters 7
(And (Member $e0 change) (Patient $e0 $x1))
;;     c1837  mass 2  {weather}
;;     c1430  mass 1  {name}
;;     c1808  mass 1  {rain}
;;     c2333  mass 1  {color}
;;     c2646  mass 1  {thing, things}
;;      c905  mass 1  {mind}
;;      c950  mass 1  {course}

;; ---- slot hear.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 hear) (Experiencer $e0 $x1))
;;      c787  mass 2  {Bruno}
;;      c762  mass 1  {Oleg}
;;      c778  mass 1  {James}
;;      c794  mass 1  {Jonas, Jonathan}
;;      c804  mass 1  {Fadil}
;;      c834  mass 1  {Claudio, Flavio}
;;      c836  mass 1  {Martino, Damiano}

;; ---- slot live.Agent  [event center]  n 8  clusters 8
(And (Member $e0 live) (Agent $e0 $x1))
;;     c1341  mass 1  {wolf, wolves}
;;      c234  mass 1  {Beja}
;;      c773  mass 1  {Mary, Maria}
;;      c812  mass 1  {Tiziri}
;;      c814  mass 1  {Yidir}
;;      c819  mass 1  {Elias}
;;      c848  mass 1  {Ray Kurtzweil}
;;      c891  mass 1  {Cainan}

;; ---- slot live.Location  [event center]  n 8  clusters 7
(And (Member $e0 live) (Location $e0 $x1))
;;      c292  mass 2  {Denmark, Norway}
;;     c1734  mass 1  {cottage, isolated, house, isolated}
;;     c1736  mass 1  {comfortable, house}
;;     c1737  mass 1  {house, large}
;;      c201  mass 1  {southeastern corner}
;;     c2069  mass 1  {group}
;;      c216  mass 1  {suburb}

;; ---- slot need.Experiencer  [event center]  n 8  clusters 8
(And (Member $e0 need) (Experiencer $e0 $x1))
;;     c1201  mass 1  {sauce}
;;      c130  mass 1  {doctor}
;;     c1467  mass 1  {children, kids}
;;      c264  mass 1  {Algeria, Morocco}
;;     c2728  mass 1  {gate}
;;      c776  mass 1  {Karl}
;;      c836  mass 1  {Martino, Damiano}
;;      c866  mass 1  {Yanni}

;; ---- slot open.Patient  [event center]  n 8  clusters 4
(And (Member $e0 open) (Patient $e0 $x1))
;;     c1727  mass 4  {door}
;;      c547  mass 2  {law, laws, legal}
;;     c1715  mass 1  {door, vault like}
;;      c404  mass 1  {bank}

;; ---- slot play.Theme  [event center]  n 8  clusters 5
(And (Member $e0 play) (Theme $e0 $x1))
;;     c2268  mass 2  {crucial, role, important, role}
;;      c359  mass 2  {tennis}
;;      c721  mass 2  {Holly Golightly}
;;     c1091  mass 1  {harp}
;;     c1917  mass 1  {series}

;; ---- slot produce.Agent  [event center]  n 8  clusters 5
(And (Member $e0 produce) (Agent $e0 $x1))
;;      c873  mass 2  {Colin Richardson}
;;      c882  mass 2  {Harvey Hayutin}
;;      c883  mass 2  {Sy Weintraub}
;;      c147  mass 1  {pancreas}
;;      c459  mass 1  {layer, oil, thin}

;; ---- slot speak.Agent  [event center]  n 8  clusters 6
(And (Member $e0 speak) (Agent $e0 $x1))
;;      c734  mass 2  {Sophia}
;;      c818  mass 2  {Oates}
;;     c1445  mass 1  {omen, men}
;;      c700  mass 1  {Xavier}
;;      c747  mass 1  {Mie Sonozaki, Soichiro Akizuki}
;;      c893  mass 1  {Kari Wahlgren}

;; ---- slot talk.Agent  [event center]  n 8  clusters 7
(And (Member $e0 talk) (Agent $e0 $x1))
;;      c735  mass 2  {Katherine, Kate}
;;     c1396  mass 1  {school janitor}
;;     c1436  mass 1  {friends}
;;      c530  mass 1  {novelist}
;;      c739  mass 1  {Linda}
;;      c841  mass 1  {Daniel}
;;      c847  mass 1  {Jordan Peterson}

;; ---- slot use.Agent  [event center]  n 8  clusters 7
(And (Member $e0 use) (Agent $e0 $x1))
;;      c102  mass 2  {localized version, localized versions}
;;     c1080  mass 1  {singer}
;;       c12  mass 1  {ukrainian army}
;;     c1443  mass 1  {father, Dad, dad}
;;      c231  mass 1  {algerian government}
;;      c709  mass 1  {Churchill}
;;      c902  mass 1  {human brain}

;; ---- slot walk.Agent  [event center]  n 8  clusters 8
(And (Member $e0 walk) (Agent $e0 $x1))
;;     c1396  mass 1  {school janitor}
;;     c2897  mass 1  {ant}
;;       c74  mass 1  {customers}
;;      c748  mass 1  {Hanako, Mariko, Yumi}
;;      c772  mass 1  {Michael}
;;      c789  mass 1  {Felix}
;;      c824  mass 1  {Leon}
;;      c835  mass 1  {Adriano}

;; ---- slot want.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 want) (Experiencer $e0 $x1))
;;      c690  mass 2  {Aslan}
;;     c1199  mass 1  {Pepper}
;;     c1281  mass 1  {cat, cats}
;;      c793  mass 1  {Tony}
;;      c824  mass 1  {Leon}
;;      c828  mass 1  {Gustavo, Edmundo}
;;      c831  mass 1  {Benedito}

;; ---- slot work.Agent  [event center]  n 8  clusters 8
(And (Member $e0 work) (Agent $e0 $x1))
;;     c1093  mass 1  {adaptor, old}
;;     c1397  mass 1  {volunteer, volunteers}
;;     c1429  mass 1  {person, people}
;;     c1443  mass 1  {father, Dad, dad}
;;      c765  mass 1  {Dmitri}
;;      c808  mass 1  {Asserson}
;;      c840  mass 1  {Dan}
;;      c853  mass 1  {Mr. Jones}

;; ---- slot write.Agent  [event center]  n 8  clusters 5
(And (Member $e0 write) (Agent $e0 $x1))
;;     c1429  mass 2  {person, people}
;;      c781  mass 2  {Gilles Thibaut}
;;      c881  mass 2  {Bill Wrubel}
;;     c1444  mass 1  {busy, father}
;;     c1482  mass 1  {famous, person}

;; ---- slot come.Agent  [event center]  n 7  clusters 7
(And (Member $e0 come) (Agent $e0 $x1))
;;     c1445  mass 1  {omen, men}
;;     c2096  mass 1  {sleep}
;;     c2151  mass 1  {train}
;;     c2170  mass 1  {discussion}
;;      c277  mass 1  {countries}
;;      c603  mass 1  {bus}
;;      c937  mass 1  {students}

;; ---- slot contain.Agent  [event center]  n 7  clusters 5
(And (Member $e0 contain) (Agent $e0 $x1))
;;     c1031  mass 3  {deck, cards, deck}
;;     c1033  mass 1  {chest}
;;     c1078  mass 1  {song, sing}
;;     c1095  mass 1  {plasma}
;;      c139  mass 1  {vitamin pill}

;; ---- slot contain.Theme  [event center]  n 7  clusters 7
(And (Member $e0 contain) (Theme $e0 $x1))
;;     c1077  mass 1  {degrading, lyric}
;;      c158  mass 1  {queens}
;;     c1934  mass 1  {jacks}
;;     c2194  mass 1  {abundant, nutrition}
;;      c478  mass 1  {electrolyte, electrolytes}
;;      c492  mass 1  {gold coin, gold, gold coins}
;;      c703  mass 1  {kings}

;; ---- slot create.Patient  [event center]  n 7  clusters 4
(And (Member $e0 create) (Patient $e0 $x1))
;;      c922  mass 4  {community}
;;     c2285  mass 1  {language, new}
;;      c351  mass 1  {calendars, various}
;;       c61  mass 1  {particle accelerator}

;; ---- slot form.Agent  [event center]  n 7  clusters 5
(And (Member $e0 form) (Agent $e0 $x1))
;;      c862  mass 2  {Jon Bon Jovi}
;;      c863  mass 2  {Sambora}
;;     c1392  mass 1  {labourer, labourers}
;;     c2230  mass 1  {complex, simple}
;;      c475  mass 1  {technetium}

;; ---- slot get.Patient  [event center]  n 7  clusters 7
(And (Member $e0 get) (Patient $e0 $x1))
;;     c1646  mass 1  {bad, problem}
;;     c1795  mass 1  {big, fire}
;;     c1836  mass 1  {bad, weather}
;;     c2010  mass 1  {expensive, thing}
;;     c2015  mass 1  {cheap, excuses}
;;     c2102  mass 1  {days, short}
;;      c261  mass 1  {Iran, Iraq}

;; ---- slot make.Result  [event center]  n 7  clusters 7
(And (Member $e0 make) (Result $e0 $x1))
;;     c1499  mass 1  {backward, country}
;;     c1616  mass 1  {uncomfortable}
;;     c1645  mass 1  {bad}
;;     c1657  mass 1  {dangerous, hazardous}
;;     c1984  mass 1  {beautiful, gorgeous}
;;     c2332  mass 1  {white}
;;      c702  mass 1  {king, queen}

;; ---- slot sell.Theme  [event center]  n 7  clusters 6
(And (Member $e0 sell) (Theme $e0 $x1))
;;     c1129  mass 2  {ice cream, ice cone, ice cream cone}
;;     c1156  mass 1  {milk}
;;     c1210  mass 1  {beans, roasted}
;;     c1887  mass 1  {cell phone, new}
;;     c2244  mass 1  {copies}
;;     c2646  mass 1  {thing, things}

;; ---- slot serve.Theme  [event center]  n 7  clusters 4
(And (Member $e0 serve) (Theme $e0 $x1))
;;      c195  mass 3  {Springfield Station}
;;      c176  mass 2  {Springfield}
;;     c1607  mass 1  {revenge}
;;       c79  mass 1  {coffee}

;; ---- slot try.Theme  [event center]  n 7  clusters 7
(And (Member $e0 try) (Theme $e0 $x1))
;;     c2334  mass 1  {burnish}
;;     c2701  mass 1  {pull}
;;     c2711  mass 1  {reach}
;;     c2860  mass 1  {give up}
;;      c431  mass 1  {steal}
;;      c451  mass 1  {abuse}
;;       c68  mass 1  {call}

;; ---- slot turn.Patient  [event center]  n 7  clusters 7
(And (Member $e0 turn) (Patient $e0 $x1))
;;     c1238  mass 1  {leaves, red, yellow}
;;     c1711  mass 1  {black, ceiling}
;;     c2115  mass 1  {war}
;;       c28  mass 1  {russian speech}
;;      c534  mass 1  {freedom movement, gusher}
;;      c636  mass 1  {road, roads}
;;      c828  mass 1  {Gustavo, Edmundo}

;; ---- slot win.Agent  [event center]  n 7  clusters 4
(And (Member $e0 win) (Agent $e0 $x1))
;;      c710  mass 3  {Wilson, wilson}
;;      c849  mass 2  {James Woods}
;;     c1329  mass 1  {horse}
;;     c2060  mass 1  {away team}

;; ---- slot <unclassed>.Only  [entity center]  n 6  clusters 4
(Only $x0 $x1)
;;     c2745  mass 2  {have}
;;     c2911  mass 2  {find, found}
;;     c1417  mass 1  {solve}
;;     c2880  mass 1  {like}

;; ---- slot appear.Agent  [event center]  n 6  clusters 3
(And (Member $e0 appear) (Agent $e0 $x1))
;;     c1429  mass 3  {person, people}
;;      c872  mass 2  {Brian Packham, Paul Cavanagh, Paul Paul Cavanagh, Philip Hercus}
;;     c1420  mass 1  {sister, sisters}

;; ---- slot bear.Patient  [event center]  n 6  clusters 4
(And (Member $e0 bear) (Patient $e0 $x1))
;;     c1429  mass 3  {person, people}
;;     c1650  mass 1  {man, poor}
;;      c692  mass 1  {Nicolaus Copernicus, Tycho Brahe}
;;      c821  mass 1  {Tobias}

;; ---- slot build.Instrument  [event center]  n 6  clusters 3
(And (Member $e0 build) (Instrument $e0 $x1))
;;     c1842  mass 2  {barometer}
;;     c1866  mass 2  {presented in scale, presented, scale}
;;     c2707  mass 2  {help}

;; ---- slot capture.Theme  [event center]  n 6  clusters 6
(And (Member $e0 capture) (Theme $e0 $x1))
;;     c1307  mass 1  {magpie}
;;     c1489  mass 1  {Valerian}
;;       c15  mass 1  {merchant ship}
;;       c16  mass 1  {british ship}
;;      c209  mass 1  {capital}
;;      c235  mass 1  {algerian city, algerian cities}

;; ---- slot cause.Agent  [event center]  n 6  clusters 6
(And (Member $e0 cause) (Agent $e0 $x1))
;;     c1287  mass 1  {demon, devil}
;;     c1818  mass 1  {storm}
;;     c2646  mass 1  {thing, things}
;;      c519  mass 1  {news}
;;      c630  mass 1  {walk}
;;      c982  mass 1  {tide, tides}

;; ---- slot create.Agent  [event center]  n 6  clusters 4
(And (Member $e0 create) (Agent $e0 $x1))
;;      c110  mass 2  {native american, indigenous american, indigenous americans, native americans}
;;      c117  mass 2  {european american settler, european american settlers}
;;      c529  mass 1  {writer}
;;      c756  mass 1  {Paul}

;; ---- slot enter.Agent  [event center]  n 6  clusters 5
(And (Member $e0 enter) (Agent $e0 $x1))
;;      c952  mass 2  {Issaquah Creek, Lake Sammamish}
;;     c1429  mass 1  {person, people}
;;      c325  mass 1  {muslim, muslims}
;;      c722  mass 1  {Layla}
;;      c836  mass 1  {Martino, Damiano}

;; ---- slot form.Patient  [event center]  n 6  clusters 4
(And (Member $e0 form) (Patient $e0 $x1))
;;     c1063  mass 3  {main songwriting unit, main, songwriting unit}
;;     c2230  mass 1  {complex, simple}
;;      c475  mass 1  {technetium}
;;      c668  mass 1  {human barricade}

;; ---- slot fund.Agent  [event center]  n 6  clusters 3
(And (Member $e0 fund) (Agent $e0 $x1))
;;      c297  mass 3  {JICA}
;;      c576  mass 2  {government}
;;      c242  mass 1  {Government of Uganda}

;; ---- slot get.Agent  [event center]  n 6  clusters 6
(And (Member $e0 get) (Agent $e0 $x1))
;;     c1462  mass 1  {man, young}
;;     c2646  mass 1  {thing, things}
;;      c770  mass 1  {Leonid}
;;      c820  mass 1  {Gabriel}
;;      c827  mass 1  {Diego}
;;      c832  mass 1  {Janos, Lajos}

;; ---- slot get.Result  [event center]  n 6  clusters 6
(And (Member $e0 get) (Result $e0 $x1))
;;     c1645  mass 1  {bad}
;;     c2009  mass 1  {expensive}
;;     c2011  mass 1  {cheap, inexpensive}
;;     c2216  mass 1  {powerful}
;;     c2629  mass 1  {short}
;;     c2723  mass 1  {ready}

;; ---- slot help.Agent  [event center]  n 6  clusters 6
(And (Member $e0 help) (Agent $e0 $x1))
;;     c1784  mass 1  {hothouse condition, hothouse conditions}
;;     c2516  mass 1  {life experience}
;;     c2639  mass 1  {context}
;;      c772  mass 1  {Michael}
;;      c794  mass 1  {Jonas, Jonathan}
;;      c842  mass 1  {Karen}

;; ---- slot receive.Theme  [event center]  n 6  clusters 5
(And (Member $e0 receive) (Theme $e0 $x1))
;;     c1375  mass 2  {work}
;;     c2698  mass 1  {award}
;;     c2853  mass 1  {permit, permitted}
;;     c2937  mass 1  {honorary knighthood}
;;      c608  mass 1  {car, new}

;; ---- slot run.Agent  [event center]  n 6  clusters 5
(And (Member $e0 run) (Agent $e0 $x1))
;;      c858  mass 2  {George Allen, Chuck Robb}
;;      c130  mass 1  {doctor}
;;     c1330  mass 1  {goat}
;;     c1340  mass 1  {squirrel}
;;      c821  mass 1  {Tobias}

;; ---- slot sleep.Experiencer  [event center]  n 6  clusters 5
(And (Member $e0 sleep) (Experiencer $e0 $x1))
;;     c1281  mass 2  {cat, cats}
;;     c1275  mass 1  {dog}
;;     c1467  mass 1  {children, kids}
;;     c1468  mass 1  {child, kid}
;;      c752  mass 1  {Baya}

;; ---- slot speak.Theme  [event center]  n 6  clusters 5
(And (Member $e0 speak) (Theme $e0 $x1))
;;      c807  mass 2  {Ashe}
;;     c1526  mass 1  {english}
;;     c2335  mass 1  {polish}
;;       c29  mass 1  {czech}
;;      c560  mass 1  {foreign language, foreign, language}

;; ---- slot start.Agent  [event center]  n 6  clusters 6
(And (Member $e0 start) (Agent $e0 $x1))
;;     c1179  mass 1  {cook}
;;     c1396  mass 1  {school janitor}
;;     c1473  mass 1  {girls}
;;     c1557  mass 1  {crowd, crowd, whole}
;;      c750  mass 1  {Skura, Inomaru}
;;      c776  mass 1  {Karl}

;; ---- slot study.Location  [event center]  n 6  clusters 4
(And (Member $e0 study) (Location $e0 $x1))
;;      c699  mass 2  {Davis Studio}
;;      c701  mass 2  {Julian Ashton Art School}
;;      c191  mass 1  {Munich}
;;      c939  mass 1  {university, college}

;; ---- slot write.CoAgent  [event center]  n 6  clusters 3
(And (Member $e0 write) (CoAgent $e0 $x1))
;;      c724  mass 2  {Laurie Aubanel, Muriel Zazoui}
;;      c726  mass 2  {Bianca Olsen}
;;      c887  mass 2  {Cyril Rambour}

;; ---- slot add.Agent  [event center]  n 5  clusters 4
(And (Member $e0 add) (Agent $e0 $x1))
;;     c2646  mass 2  {thing, things}
;;     c1179  mass 1  {cook}
;;     c1248  mass 1  {plant, plants}
;;      c860  mass 1  {J. Augustus Knapp}

;; ---- slot appear.Location  [event center]  n 5  clusters 4
(And (Member $e0 appear) (Location $e0 $x1))
;;       c82  mass 2  {cafe}
;;     c1512  mass 1  {comedic role}
;;      c303  mass 1  {musical film}
;;        c6  mass 1  {Coronation Street}

;; ---- slot buy.Theme  [event center]  n 5  clusters 5
(And (Member $e0 buy) (Theme $e0 $x1))
;;     c1194  mass 1  {food}
;;     c1738  mass 1  {house, home}
;;     c1892  mass 1  {computer}
;;      c496  mass 1  {blue, shirt}
;;      c504  mass 1  {trouser, yellow}

;; ---- slot cry.Agent  [event center]  n 5  clusters 5
(And (Member $e0 cry) (Agent $e0 $x1))
;;     c1004  mass 1  {Rima}
;;     c1473  mass 1  {girls}
;;      c750  mass 1  {Skura, Inomaru}
;;      c752  mass 1  {Baya}
;;      c830  mass 1  {Alberto}

;; ---- slot direct.Agent  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Agent $e0 $x1))
;;      c869  mass 2  {Lev L. Spiro}
;;     c1090  mass 1  {conductor}
;;      c717  mass 1  {Claude Lelouch}
;;      c877  mass 1  {Robert Day}

;; ---- slot direct.Patient  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Patient $e0 $x1))
;;     c1918  mass 2  {episode}
;;     c2646  mass 1  {thing, things}
;;      c300  mass 1  {syrian film, film, syrian film}
;;      c302  mass 1  {movie, film}

;; ---- slot draw.Agent  [event center]  n 5  clusters 4
(And (Member $e0 draw) (Agent $e0 $x1))
;;      c856  mass 2  {Cowper}
;;     c1467  mass 1  {children, kids}
;;     c1468  mass 1  {child, kid}
;;     c1568  mass 1  {concert}

;; ---- slot eat.Patient  [event center]  n 5  clusters 4
(And (Member $e0 eat) (Patient $e0 $x1))
;;     c1100  mass 2  {cookie, cookies}
;;     c1169  mass 1  {bread}
;;     c1182  mass 1  {chicken}
;;     c1337  mass 1  {rabbit}

;; ---- slot fly.Agent  [event center]  n 5  clusters 5
(And (Member $e0 fly) (Agent $e0 $x1))
;;     c1000  mass 1  {rocket}
;;     c1304  mass 1  {insect, insects}
;;     c1311  mass 1  {eagle}
;;      c587  mass 1  {plane, aeroplane, airplane}
;;      c698  mass 1  {Superman}

;; ---- slot include.Theme  [event center]  n 5  clusters 5
(And (Member $e0 include) (Theme $e0 $x1))
;;     c1084  mass 1  {marching band, marching bands}
;;      c125  mass 1  {extradition clause}
;;      c672  mass 1  {Armaan Jain}
;;      c673  mass 1  {Ranbir Kapoor}
;;      c674  mass 1  {Nikhil Nanda}

;; ---- slot lead.Agent  [event center]  n 5  clusters 4
(And (Member $e0 lead) (Agent $e0 $x1))
;;     c2646  mass 2  {thing, things}
;;     c1275  mass 1  {dog}
;;     c2237  mass 1  {general, general purpose}
;;      c941  mass 1  {education}

;; ---- slot lead.Goal  [event center]  n 5  clusters 5
(And (Member $e0 lead) (Goal $e0 $x1))
;;     c1279  mass 1  {big, cat fight}
;;     c1491  mass 1  {glory, lost}
;;     c1738  mass 1  {house, home}
;;     c1957  mass 1  {peace}
;;     c1967  mass 1  {happiness, joy}

;; ---- slot marry.Agent  [event center]  n 5  clusters 4
(And (Member $e0 marry) (Agent $e0 $x1))
;;      c732  mass 2  {Margaret Fleming}
;;      c742  mass 1  {Nancy}
;;      c782  mass 1  {James of Barrochan}
;;      c889  mass 1  {Steve}

;; ---- slot need.Theme  [event center]  n 5  clusters 5
(And (Member $e0 need) (Theme $e0 $x1))
;;     c1860  mass 1  {paint, painting}
;;     c2142  mass 1  {run}
;;     c2464  mass 1  {generate}
;;     c2498  mass 1  {understand}
;;       c96  mass 1  {go}

;; ---- slot portray.Agent  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Agent $e0 $x1))
;;      c710  mass 2  {Wilson, wilson}
;;      c747  mass 2  {Mie Sonozaki, Soichiro Akizuki}
;;      c849  mass 1  {James Woods}

;; ---- slot portray.Theme  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Theme $e0 $x1))
;;      c755  mass 2  {Kantaro Suga}
;;      c849  mass 2  {James Woods}
;;      c710  mass 1  {Wilson, wilson}

;; ---- slot present.Theme  [event center]  n 5  clusters 4
(And (Member $e0 present) (Theme $e0 $x1))
;;     c1078  mass 2  {song, sing}
;;     c1861  mass 1  {picture, image}
;;     c2167  mass 1  {play}
;;     c2304  mass 1  {golden opportunity}

;; ---- slot provide.Agent  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Agent $e0 $x1))
;;     c1151  mass 1  {kitchen island}
;;     c1556  mass 1  {witness, witnesses}
;;     c2035  mass 1  {organisation}
;;      c389  mass 1  {power station}
;;      c515  mass 1  {media}

;; ---- slot provide.Theme  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Theme $e0 $x1))
;;     c1194  mass 1  {food}
;;     c1523  mass 1  {plurivocality}
;;     c1915  mass 1  {counter space, extra}
;;     c2026  mass 1  {descriptions, detailed}
;;      c387  mass 1  {electricity}

;; ---- slot ready.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 ready) (Experiencer $e0 $x1))
;;     c1173  mass 1  {cake}
;;     c1188  mass 1  {dinner}
;;      c750  mass 1  {Skura, Inomaru}
;;      c770  mass 1  {Leonid}
;;      c866  mass 1  {Yanni}

;; ---- slot sell.Agent  [event center]  n 5  clusters 4
(And (Member $e0 sell) (Agent $e0 $x1))
;;     c1381  mass 2  {company}
;;      c516  mass 1  {newspaper, newspapers}
;;       c78  mass 1  {coffee brand, indie}
;;      c810  mass 1  {Mennad}

;; ---- slot sing.Theme  [event center]  n 5  clusters 2
(And (Member $e0 sing) (Theme $e0 $x1))
;;     c1074  mass 4  {music}
;;     c1078  mass 1  {song, sing}

;; ---- slot sing.To  [event center]  n 5  clusters 2
(And (Member $e0 sing) (To $e0 $x1))
;;     c2380  mass 4  {accompany}
;;     c1075  mass 1  {music, sad}

;; ---- slot sleep.Location  [event center]  n 5  clusters 3
(And (Member $e0 sleep) (Location $e0 $x1))
;;     c1750  mass 3  {couch}
;;     c1410  mass 1  {mat}
;;     c2544  mass 1  {inside}

;; ---- slot stand.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 stand) (Experiencer $e0 $x1))
;;     c2237  mass 1  {general, general purpose}
;;      c827  mass 1  {Diego}
;;      c828  mass 1  {Gustavo, Edmundo}
;;      c830  mass 1  {Alberto}
;;      c937  mass 1  {students}

;; ---- slot start.Experiencer  [event center]  n 5  clusters 4
(And (Member $e0 start) (Experiencer $e0 $x1))
;;      c206  mass 2  {bridge}
;;      c762  mass 1  {Oleg}
;;      c823  mass 1  {Gunter}
;;      c899  mass 1  {tunnel}

;; ---- slot study.Theme  [event center]  n 5  clusters 5
(And (Member $e0 study) (Theme $e0 $x1))
;;      c151  mass 1  {bacterium, new}
;;      c240  mass 1  {Arabic}
;;     c2762  mass 1  {rate}
;;      c384  mass 1  {mechanical engineering}
;;      c552  mass 1  {canon law}

;; ---- slot swim.Agent  [event center]  n 5  clusters 4
(And (Member $e0 swim) (Agent $e0 $x1))
;;     c1272  mass 2  {fish, school}
;;     c1271  mass 1  {fish, red}
;;     c1467  mass 1  {children, kids}
;;      c739  mass 1  {Linda}

;; ---- slot travel.Agent  [event center]  n 5  clusters 4
(And (Member $e0 travel) (Agent $e0 $x1))
;;     c1429  mass 2  {person, people}
;;      c570  mass 1  {campaigner}
;;      c775  mass 1  {Matthew}
;;      c797  mass 1  {Roger, Robert}

;; ---- slot turn.Result  [event center]  n 5  clusters 5
(And (Member $e0 turn) (Result $e0 $x1))
;;     c1310  mass 1  {crow}
;;     c2126  mass 1  {red}
;;     c2325  mass 1  {yellow}
;;     c2331  mass 1  {black}
;;      c535  mass 1  {gusher}

;; ---- slot watch.Agent  [event center]  n 5  clusters 5
(And (Member $e0 watch) (Agent $e0 $x1))
;;     c1429  mass 1  {person, people}
;;     c1431  mass 1  {family, families}
;;      c576  mass 1  {government}
;;      c752  mass 1  {Baya}
;;      c933  mass 1  {coach}

;; ---- slot win.Theme  [event center]  n 5  clusters 2
(And (Member $e0 win) (Theme $e0 $x1))
;;      c684  mass 4  {emmy}
;;      c452  mass 1  {race}

;; ---- slot bad.Between  [entity center]  n 4  clusters 2
(And (Member $x0 bad) (Between $x0 $x1))
;;      c291  mass 2  {Poland}
;;      c294  mass 2  {Germany}

;; ---- slot beauty.Possession  [entity center]  n 4  clusters 4
(And (Member $x0 beauty) (Possession $x0 $x1))
;;     c1015  mass 1  {scenery}
;;     c1403  mass 1  {sex, sexually}
;;     c1580  mass 1  {sight}
;;      c954  mass 1  {Lake Towada, Lake Akan}

;; ---- slot family.Possession  [entity center]  n 4  clusters 1
(And (Member $x0 family) (Possession $x0 $x1))
;;     c1429  mass 4  {person, people}

;; ---- slot northern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 northern) (LocatedIn $x0 $x1))
;;      c270  mass 2  {India, Indonesia}
;;      c290  mass 2  {Estonia}

;; ---- slot southern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 southern) (LocatedIn $x0 $x1))
;;      c252  mass 2  {North Africa, Africa}
;;      c270  mass 2  {India, Indonesia}

;; ---- slot accompany.Agent  [event center]  n 4  clusters 2
(And (Member $e0 accompany) (Agent $e0 $x1))
;;     c1420  mass 2  {sister, sisters}
;;     c1429  mass 2  {person, people}

;; ---- slot accompany.Theme  [event center]  n 4  clusters 1
(And (Member $e0 accompany) (Theme $e0 $x1))
;;      c304  mass 4  {silent film}

;; ---- slot active.Time  [event center]  n 4  clusters 2
(And (Member $e0 active) (Time $e0 $x1))
;;     c2083  mass 2  {morning, early morning}
;;     c2105  mass 2  {late afternoon}

;; ---- slot add.Theme  [event center]  n 4  clusters 3
(And (Member $e0 add) (Theme $e0 $x1))
;;     c1857  mass 2  {illustration, illustrations}
;;     c1197  mass 1  {clove, cloves}
;;     c1240  mass 1  {greenery}

;; ---- slot arrive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 arrive) (Agent $e0 $x1))
;;      c595  mass 1  {paris train}
;;      c607  mass 1  {driver}
;;      c784  mass 1  {Donald}
;;       c95  mass 1  {spring}

;; ---- slot avoid.Theme  [event center]  n 4  clusters 4
(And (Member $e0 avoid) (Theme $e0 $x1))
;;     c1639  mass 1  {pitfall, pitfalls}
;;     c2646  mass 1  {thing, things}
;;     c2827  mass 1  {conform}
;;      c408  mass 1  {bankruptcy}

;; ---- slot bad.Experiencer  [event center]  n 4  clusters 3
(And (Member $e0 bad) (Experiencer $e0 $x1))
;;     c1648  mass 2  {bad, relationship}
;;     c1647  mass 1  {bad, matter}
;;     c1836  mass 1  {bad, weather}

;; ---- slot bear.Location  [event center]  n 4  clusters 3
(And (Member $e0 bear) (Location $e0 $x1))
;;      c187  mass 2  {Bromma}
;;      c292  mass 1  {Denmark, Norway}
;;      c972  mass 1  {planet}

;; ---- slot begin.Patient  [event center]  n 4  clusters 4
(And (Member $e0 begin) (Patient $e0 $x1))
;;     c1259  mass 1  {tree, trees}
;;     c2107  mass 1  {night}
;;     c2132  mass 1  {uprising}
;;      c942  mass 1  {school}

;; ---- slot bring.Theme  [event center]  n 4  clusters 4
(And (Member $e0 bring) (Theme $e0 $x1))
;;       c16  mass 1  {british ship}
;;       c21  mass 1  {chinese dumpling}
;;     c2236  mass 1  {advantage}
;;      c794  mass 1  {Jonas, Jonathan}

;; ---- slot capture.Agent  [event center]  n 4  clusters 4
(And (Member $e0 capture) (Agent $e0 $x1))
;;     c1320  mass 1  {falcon}
;;      c285  mass 1  {Spain}
;;      c438  mass 1  {pirate, pirates}
;;      c662  mass 1  {soldiers, troops}

;; ---- slot cause.Patient  [event center]  n 4  clusters 4
(And (Member $e0 cause) (Patient $e0 $x1))
;;     c1059  mass 1  {creaking, creaking, sound}
;;     c1667  mass 1  {damage}
;;       c62  mass 1  {earthquake, earthquakes}
;;       c66  mass 1  {abandonment anxiety}

;; ---- slot change.Agent  [event center]  n 4  clusters 4
(And (Member $e0 change) (Agent $e0 $x1))
;;     c1236  mass 1  {leaf, leaves}
;;     c1447  mass 1  {man, guy}
;;      c280  mass 1  {French Dahomey}
;;      c708  mass 1  {Cameron}

;; ---- slot close.Experiencer  [event center]  n 4  clusters 2
(And (Member $e0 close) (Experiencer $e0 $x1))
;;       c34  mass 3  {Low German}
;;      c786  mass 1  {Boldi}

;; ---- slot come.Source  [event center]  n 4  clusters 4
(And (Member $e0 come) (Source $e0 $x1))
;;     c1235  mass 1  {garden}
;;     c1746  mass 1  {place, places}
;;     c2147  mass 1  {treeline}
;;      c343  mass 1  {greek}

;; ---- slot connect.Theme  [event center]  n 4  clusters 2
(And (Member $e0 connect) (Theme $e0 $x1))
;;      c167  mass 2  {Tokyo, Nagoya, Osaka}
;;      c961  mass 2  {Kayalar}

;; ---- slot create.Location  [event center]  n 4  clusters 1
(And (Member $e0 create) (Location $e0 $x1))
;;     c1901  mass 4  {post}

;; ---- slot decide.Agent  [event center]  n 4  clusters 3
(And (Member $e0 decide) (Agent $e0 $x1))
;;      c768  mass 2  {Fyodor}
;;      c737  mass 1  {Beth}
;;      c819  mass 1  {Elias}

;; ---- slot design.Agent  [event center]  n 4  clusters 3
(And (Member $e0 design) (Agent $e0 $x1))
;;      c880  mass 2  {Henry L. Taylor, Sherman Howard}
;;       c19  mass 1  {Robert Allan Limited}
;;      c872  mass 1  {Brian Packham, Paul Cavanagh, Paul Paul Cavanagh, Philip Hercus}

;; ---- slot design.Patient  [event center]  n 4  clusters 2
(And (Member $e0 design) (Patient $e0 $x1))
;;     c1956  mass 2  {pacificat, pacificats}
;;     c2646  mass 2  {thing, things}

;; ---- slot die.Patient  [event center]  n 4  clusters 2
(And (Member $e0 die) (Patient $e0 $x1))
;;     c1429  mass 3  {person, people}
;;     c1431  mass 1  {family, families}

;; ---- slot discover.Theme  [event center]  n 4  clusters 3
(And (Member $e0 discover) (Theme $e0 $x1))
;;     c1430  mass 2  {name}
;;     c2276  mass 1  {magnet, new, type}
;;       c48  mass 1  {pterosaur egg, pterosaur eggs}

;; ---- slot do.Patient  [event center]  n 4  clusters 3
(And (Member $e0 do) (Patient $e0 $x1))
;;     c2646  mass 2  {thing, things}
;;     c1187  mass 1  {dishes}
;;     c1509  mass 1  {dance, little}

;; ---- slot eat.Agent  [event center]  n 4  clusters 4
(And (Member $e0 eat) (Agent $e0 $x1))
;;     c1273  mass 1  {brown, dog}
;;     c1313  mass 1  {bird, birds}
;;     c1429  mass 1  {person, people}
;;     c1467  mass 1  {children, kids}

;; ---- slot encourage.In  [event center]  n 4  clusters 3
(And (Member $e0 encourage) (In $e0 $x1))
;;     c1411  mass 2  {mathematics}
;;      c364  mass 1  {chess}
;;      c365  mass 1  {chess play}

;; ---- slot enter.Theme  [event center]  n 4  clusters 4
(And (Member $e0 enter) (Theme $e0 $x1))
;;     c1719  mass 1  {cave}
;;      c274  mass 1  {United States, U.S., USA}
;;      c622  mass 1  {park}
;;      c952  mass 1  {Issaquah Creek, Lake Sammamish}

;; ---- slot find.Agent  [event center]  n 4  clusters 3
(And (Member $e0 find) (Agent $e0 $x1))
;;      c617  mass 2  {Couper}
;;      c834  mass 1  {Claudio, Flavio}
;;      c838  mass 1  {Pietro}

;; ---- slot get.Theme  [event center]  n 4  clusters 4
(And (Member $e0 get) (Theme $e0 $x1))
;;     c1195  mass 1  {snack}
;;     c1339  mass 1  {hamster}
;;     c2012  mass 1  {low, price}
;;      c427  mass 1  {arrest}

;; ---- slot give.Theme  [event center]  n 4  clusters 4
(And (Member $e0 give) (Theme $e0 $x1))
;;     c1128  mass 1  {mock champagne}
;;     c1134  mass 1  {chocolate}
;;     c2235  mass 1  {advice, good}
;;     c2646  mass 1  {thing, things}

;; ---- slot good.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 good) (Experiencer $e0 $x1))
;;     c1160  mass 1  {barley bread}
;;     c1837  mass 1  {weather}
;;     c2646  mass 1  {thing, things}
;;      c582  mass 1  {windshield}

;; ---- slot help.Theme  [event center]  n 4  clusters 4
(And (Member $e0 help) (Theme $e0 $x1))
;;     c1429  mass 1  {person, people}
;;     c1472  mass 1  {girl}
;;     c2191  mass 1  {thrive}
;;     c2477  mass 1  {define}

;; ---- slot include.Agent  [event center]  n 4  clusters 2
(And (Member $e0 include) (Agent $e0 $x1))
;;     c1463  mass 3  {nephew, nephews}
;;     c1494  mass 1  {parade}

;; ---- slot increase.Patient  [event center]  n 4  clusters 4
(And (Member $e0 increase) (Patient $e0 $x1))
;;       c11  mass 1  {ukrainian combat loss, ukrainian combat losses}
;;      c391  mass 1  {industrial output}
;;      c453  mass 1  {xenophobia}
;;      c612  mass 1  {motor vehicle, vehicle, motor vehicles, vehicles}

;; ---- slot jump.Agent  [event center]  n 4  clusters 4
(And (Member $e0 jump) (Agent $e0 $x1))
;;     c1278  mass 1  {brown, fox, quick}
;;     c1328  mass 1  {donkey}
;;     c1333  mass 1  {cow}
;;     c1465  mass 1  {boys}

;; ---- slot kill.Location  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Location $e0 $x1))
;;      c579  mass 3  {state}
;;     c2705  mass 1  {here}

;; ---- slot kill.Manner  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Manner $e0 $x1))
;;     c2368  mass 2  {indirectly}
;;     c2886  mass 2  {direct, directly}

;; ---- slot lie.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 lie) (Experiencer $e0 $x1))
;;     c1044  mass 1  {tape recorder}
;;     c1885  mass 1  {notebook}
;;     c2747  mass 1  {pen}
;;      c524  mass 1  {book}

;; ---- slot lie.Location  [event center]  n 4  clusters 1
(And (Member $e0 lie) (Location $e0 $x1))
;;     c1884  mass 4  {table}

;; ---- slot look.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 look) (Experiencer $e0 $x1))
;;      c251  mass 1  {Europe, Western Europe}
;;      c644  mass 1  {flag}
;;      c942  mass 1  {school}
;;      c990  mass 1  {island}

;; ---- slot look.Like  [event center]  n 4  clusters 4
(And (Member $e0 look) (Like $e0 $x1))
;;     c1299  mass 1  {huge, spider}
;;     c1493  mass 1  {paradise}
;;      c424  mass 1  {jail, prison}
;;      c642  mass 1  {inverted, philippine flag}

;; ---- slot move.Agent  [event center]  n 4  clusters 3
(And (Member $e0 move) (Agent $e0 $x1))
;;     c1391  mass 2  {headquarters}
;;     c1272  mass 1  {fish, school}
;;      c803  mass 1  {Sammy}

;; ---- slot perform.Location  [event center]  n 4  clusters 3
(And (Member $e0 perform) (Location $e0 $x1))
;;       c82  mass 2  {cafe}
;;     c1738  mass 1  {house, home}
;;     c2662  mass 1  {public}

;; ---- slot preach.Agent  [event center]  n 4  clusters 1
(And (Member $e0 preach) (Agent $e0 $x1))
;;     c1429  mass 4  {person, people}

;; ---- slot preach.Location  [event center]  n 4  clusters 2
(And (Member $e0 preach) (Location $e0 $x1))
;;      c186  mass 2  {Gareccio}
;;      c284  mass 2  {Italy}

;; ---- slot present.Agent  [event center]  n 4  clusters 3
(And (Member $e0 present) (Agent $e0 $x1))
;;      c817  mass 2  {Horner}
;;     c1381  mass 1  {company}
;;     c2304  mass 1  {golden opportunity}

;; ---- slot receive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 receive) (Agent $e0 $x1))
;;      c123  mass 1  {refugee, refugees}
;;     c2697  mass 1  {win, winner}
;;      c658  mass 1  {General Franks}
;;      c737  mass 1  {Beth}

;; ---- slot replace.Agent  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Agent $e0 $x1))
;;      c880  mass 2  {Henry L. Taylor, Sherman Howard}
;;     c1429  mass 1  {person, people}
;;      c884  mass 1  {Peter Gaussen}

;; ---- slot replace.Theme  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Theme $e0 $x1))
;;      c697  mass 2  {Lex Lex Luthor, Lex Luthor}
;;     c1429  mass 1  {person, people}
;;      c870  mass 1  {O. R. Woodcock, William Ewer}

;; ---- slot require.Theme  [event center]  n 4  clusters 4
(And (Member $e0 require) (Theme $e0 $x1))
;;     c1030  mass 1  {id card, valid}
;;     c1377  mass 1  {hard, work}
;;      c386  mass 1  {repair, repairs}
;;       c71  mass 1  {american phone number}

;; ---- slot specify.In  [event center]  n 4  clusters 2
(And (Member $e0 specify) (In $e0 $x1))
;;     c1680  mass 2  {continuous time}
;;     c1681  mass 2  {discrete time}

;; ---- slot spend.Agent  [event center]  n 4  clusters 3
(And (Member $e0 spend) (Agent $e0 $x1))
;;     c1429  mass 2  {person, people}
;;     c1326  mass 1  {giraffe, giraffes}
;;     c2073  mass 1  {May}

;; ---- slot star.Agent  [event center]  n 4  clusters 1
(And (Member $e0 star) (Agent $e0 $x1))
;;     c2646  mass 4  {thing, things}

;; ---- slot star.Theme  [event center]  n 4  clusters 2
(And (Member $e0 star) (Theme $e0 $x1))
;;      c725  mass 2  {Patricia Kaas}
;;      c850  mass 2  {Jeremy Irons}

;; ---- slot stop.Agent  [event center]  n 4  clusters 4
(And (Member $e0 stop) (Agent $e0 $x1))
;;     c1004  mass 1  {Rima}
;;     c1093  mass 1  {adaptor, old}
;;      c750  mass 1  {Skura, Inomaru}
;;      c866  mass 1  {Yanni}

;; ---- slot stop.Theme  [event center]  n 4  clusters 2
(And (Member $e0 stop) (Theme $e0 $x1))
;;     c1375  mass 2  {work}
;;     c1804  mass 2  {cry}

;; ---- slot support.Theme  [event center]  n 4  clusters 1
(And (Member $e0 support) (Theme $e0 $x1))
;;     c1869  mass 4  {view, views}

;; ---- slot use.Manner  [event center]  n 4  clusters 3
(And (Member $e0 use) (Manner $e0 $x1))
;;     c2377  mass 2  {rarely}
;;     c2266  mass 1  {responsibly}
;;     c2378  mass 1  {colloquially}

;; ---- slot use.To  [event center]  n 4  clusters 4
(And (Member $e0 use) (To $e0 $x1))
;;     c1177  mass 1  {roast}
;;     c2461  mass 1  {make}
;;     c2716  mass 1  {develop}
;;      c947  mass 1  {learn}

;; ---- slot walk.Goal  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Goal $e0 $x1))
;;     c1255  mass 1  {forest}
;;     c2004  mass 1  {store}
;;     c2870  mass 1  {back, backward}
;;      c946  mass 1  {classroom}

;; ---- slot walk.Location  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Location $e0 $x1))
;;     c1358  mass 1  {balloon, balloon, little}
;;     c1714  mass 1  {wood floor}
;;     c1762  mass 1  {hallway}
;;     c2321  mass 1  {dark, darkness}

;; ---- slot watch.Theme  [event center]  n 4  clusters 4
(And (Member $e0 watch) (Theme $e0 $x1))
;;     c2045  mass 1  {event}
;;     c2534  mass 1  {activity, activities}
;;     c2938  mass 1  {natural hair video}
;;      c302  mass 1  {movie, film}

;; ---- slot win.For  [event center]  n 4  clusters 1
(And (Member $e0 win) (For $e0 $x1))
;;     c1854  mass 4  {portray, portrayal}

;; ---- slot work.Location  [event center]  n 4  clusters 4
(And (Member $e0 work) (Location $e0 $x1))
;;      c251  mass 1  {Europe, Western Europe}
;;      c337  mass 1  {Church of Norway}
;;      c390  mass 1  {factory, factories}
;;      c428  mass 1  {prison kitchen}

;; ---- slot bottom.PartOf  [entity center]  n 3  clusters 2
(And (Member $x0 bottom) (PartOf $x0 $x1))
;;      c510  mass 2  {page}
;;     c1147  mass 1  {stew pot}

;; ---- slot fight.Against  [entity center]  n 3  clusters 3
(And (Member $x0 fight) (Against $x0 $x1))
;;     c2442  mass 1  {dead, die, death}
;;     c2511  mass 1  {natural, nature}
;;      c310  mass 1  {fate}

;; ---- slot thing.LocatedIn  [entity center]  n 3  clusters 2
(And (Member $x0 thing) (LocatedIn $x0 $x1))
;;      c963  mass 2  {hills}
;;      c501  mass 1  {closet}

;; ---- slot active.Experiencer  [event center]  n 3  clusters 2
(And (Member $e0 active) (Experiencer $e0 $x1))
;;     c2646  mass 2  {thing, things}
;;      c808  mass 1  {Asserson}

;; ---- slot affect.Agent  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Agent $e0 $x1))
;;      c458  mass 3  {cyberattack}

;; ---- slot affect.Location  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Location $e0 $x1))
;;      c559  mass 3  {world}

;; ---- slot affect.Theme  [event center]  n 3  clusters 3
(And (Member $e0 affect) (Theme $e0 $x1))
;;      c135  mass 1  {hospital}
;;     c1381  mass 1  {company}
;;      c404  mass 1  {bank}

;; ---- slot affect.Time  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Time $e0 $x1))
;;     c2802  mass 3  {this year}

;; ---- slot approve.Theme  [event center]  n 3  clusters 3
(And (Member $e0 approve) (Theme $e0 $x1))
;;     c2024  mass 1  {treaty}
;;     c2039  mass 1  {plan}
;;     c2319  mass 1  {Bill, bill}

;; ---- slot attack.Patient  [event center]  n 3  clusters 3
(And (Member $e0 attack) (Patient $e0 $x1))
;;     c1745  mass 1  {building}
;;       c76  mass 1  {consumer rights}
;;      c829  mass 1  {Rodrigo}

;; ---- slot bake.Agent  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Agent $e0 $x1))
;;     c1381  mass 2  {company}
;;      c727  mass 1  {Ella}

;; ---- slot bake.Patient  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Patient $e0 $x1))
;;     c1129  mass 2  {ice cream, ice cone, ice cream cone}
;;     c1117  mass 1  {pie, scrumptious}

;; ---- slot base.On  [event center]  n 3  clusters 3
(And (Member $e0 base) (On $e0 $x1))
;;     c2114  mass 1  {battle, fight}
;;      c341  mass 1  {puritan value}
;;       c39  mass 1  {latin alphabet}

;; ---- slot beautiful.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 beautiful) (Experiencer $e0 $x1))
;;     c1767  mass 1  {beautiful, room}
;;     c1837  mass 1  {weather}
;;      c997  mass 1  {beautiful, moon}

;; ---- slot break_out.Patient  [event center]  n 3  clusters 3
(And (Member $e0 break_out) (Patient $e0 $x1))
;;     c1792  mass 1  {fire}
;;     c1796  mass 1  {forest fire, forest fires}
;;     c2115  mass 1  {war}

;; ---- slot bring.Goal  [event center]  n 3  clusters 3
(And (Member $e0 bring) (Goal $e0 $x1))
;;     c1944  mass 1  {gallows}
;;      c270  mass 1  {India, Indonesia}
;;      c274  mass 1  {United States, U.S., USA}

;; ---- slot buy.Agent  [event center]  n 3  clusters 2
(And (Member $e0 buy) (Agent $e0 $x1))
;;      c753  mass 2  {Keike}
;;      c815  mass 1  {Regis}

;; ---- slot close.Agent  [event center]  n 3  clusters 3
(And (Member $e0 close) (Agent $e0 $x1))
;;     c1425  mass 1  {female, giraffe}
;;      c586  mass 1  {pilot}
;;      c665  mass 1  {guard, guards}

;; ---- slot close.Goal  [event center]  n 3  clusters 3
(And (Member $e0 close) (Goal $e0 $x1))
;;       c31  mass 1  {Dutch}
;;       c32  mass 1  {Frisian}
;;       c33  mass 1  {High German}

;; ---- slot close.Patient  [event center]  n 3  clusters 2
(And (Member $e0 close) (Patient $e0 $x1))
;;     c1727  mass 2  {door}
;;     c2004  mass 1  {store}

;; ---- slot come.Goal  [event center]  n 3  clusters 3
(And (Member $e0 come) (Goal $e0 $x1))
;;     c1568  mass 1  {concert}
;;     c2384  mass 1  {political, settlement}
;;     c2633  mass 1  {conclusion}

;; ---- slot come.Patient  [event center]  n 3  clusters 3
(And (Member $e0 come) (Patient $e0 $x1))
;;     c1055  mass 1  {sound}
;;     c1294  mass 1  {insect sound, insect sounds}
;;     c1817  mass 1  {typhoon}

;; ---- slot come_back.Agent  [event center]  n 3  clusters 3
(And (Member $e0 come_back) (Agent $e0 $x1))
;;     c1440  mass 1  {Mom, mother, mom}
;;     c1443  mass 1  {father, Dad, dad}
;;     c1464  mass 1  {boy}

;; ---- slot compose.Patient  [event center]  n 3  clusters 2
(And (Member $e0 compose) (Patient $e0 $x1))
;;     c1078  mass 2  {song, sing}
;;     c1087  mass 1  {great, symphonies}

;; ---- slot conduct.Agent  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Agent $e0 $x1))
;;      c874  mass 2  {Carl Fenton}
;;      c648  mass 1  {FBI}

;; ---- slot conduct.Theme  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Theme $e0 $x1))
;;     c1089  mass 2  {orchestra}
;;      c920  mass 1  {surveillance}

;; ---- slot cover.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Instrument $e0 $x1))
;;     c1250  mass 1  {weed}
;;     c1829  mass 1  {snow}
;;      c509  mass 1  {paper decoration, paper decorations}

;; ---- slot cover.Patient  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Patient $e0 $x1))
;;     c1760  mass 1  {courtyard}
;;     c2752  mass 1  {top}
;;      c375  mass 1  {shopping arcade}

;; ---- slot define.Theme  [event center]  n 3  clusters 2
(And (Member $e0 define) (Theme $e0 $x1))
;;     c1916  mass 2  {sequence, sequences}
;;     c2646  mass 1  {thing, things}

;; ---- slot die.Location  [event center]  n 3  clusters 2
(And (Member $e0 die) (Location $e0 $x1))
;;      c188  mass 2  {Stockholm}
;;     c1792  mass 1  {fire}

;; ---- slot drink.Patient  [event center]  n 3  clusters 2
(And (Member $e0 drink) (Patient $e0 $x1))
;;       c81  mass 2  {tea}
;;     c1812  mass 1  {good, water}

;; ---- slot drive.Agent  [event center]  n 3  clusters 2
(And (Member $e0 drive) (Agent $e0 $x1))
;;      c603  mass 2  {bus}
;;      c618  mass 1  {van}

;; ---- slot encourage.Agent  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Agent $e0 $x1))
;;      c801  mass 3  {Ralph}

;; ---- slot encourage.Theme  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Theme $e0 $x1))
;;      c790  mass 3  {Maurice}

;; ---- slot endorse.Theme  [event center]  n 3  clusters 1
(And (Member $e0 endorse) (Theme $e0 $x1))
;;     c1869  mass 3  {view, views}

;; ---- slot fall.Source  [event center]  n 3  clusters 3
(And (Member $e0 fall) (Source $e0 $x1))
;;     c1259  mass 1  {tree, trees}
;;     c1756  mass 1  {shelf}
;;     c1839  mass 1  {sky}

;; ---- slot fight.Agent  [event center]  n 3  clusters 2
(And (Member $e0 fight) (Agent $e0 $x1))
;;      c104  mass 2  {kabye people}
;;     c1385  mass 1  {union boss, union bosses}

;; ---- slot fight.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fight) (Theme $e0 $x1))
;;     c2347  mass 1  {freeze, freeze over}
;;      c319  mass 1  {islamic fundamentalism}
;;      c442  mass 1  {terrorism}

;; ---- slot fund.Theme  [event center]  n 3  clusters 2
(And (Member $e0 fund) (Theme $e0 $x1))
;;      c243  mass 2  {Lessos-Kenya, Lessos-Uganda}
;;      c204  mass 1  {border, border section}

;; ---- slot give.Agent  [event center]  n 3  clusters 2
(And (Member $e0 give) (Agent $e0 $x1))
;;      c763  mass 2  {Vladimir}
;;      c779  mass 1  {William}

;; ---- slot go.Manner  [event center]  n 3  clusters 2
(And (Member $e0 go) (Manner $e0 $x1))
;;     c2848  mass 2  {late, later}
;;     c2804  mass 1  {immediately, instantly, right away}

;; ---- slot go.To  [event center]  n 3  clusters 2
(And (Member $e0 go) (To $e0 $x1))
;;     c2169  mass 2  {talk, conversation}
;;     c2778  mass 1  {see}

;; ---- slot grow.Patient  [event center]  n 3  clusters 3
(And (Member $e0 grow) (Patient $e0 $x1))
;;     c1588  mass 1  {beard}
;;     c2414  mass 1  {faint, sound}
;;      c844  mass 1  {Kalman}

;; ---- slot have.In  [event center]  n 3  clusters 2
(And (Member $e0 have) (In $e0 $x1))
;;      c383  mass 2  {fluid mechanics}
;;     c1521  mass 1  {poetry}

;; ---- slot hold.Patient  [event center]  n 3  clusters 3
(And (Member $e0 hold) (Patient $e0 $x1))
;;     c1572  mass 1  {ceremony, mass}
;;     c2044  mass 1  {meeting}
;;      c338  mass 1  {prayer, prayers}

;; ---- slot lead.Theme  [event center]  n 3  clusters 3
(And (Member $e0 lead) (Theme $e0 $x1))
;;     c1279  mass 1  {big, cat fight}
;;     c1331  mass 1  {sheep}
;;     c2061  mass 1  {squad}

;; ---- slot learn.Theme  [event center]  n 3  clusters 3
(And (Member $e0 learn) (Theme $e0 $x1))
;;     c1525  mass 1  {vocabulary}
;;     c2314  mass 1  {berber}
;;      c560  mass 1  {foreign language, foreign, language}

;; ---- slot leave.Patient  [event center]  n 3  clusters 2
(And (Member $e0 leave) (Patient $e0 $x1))
;;     c1726  mass 2  {door, open, door, unlocked}
;;     c2931  mass 1  {lights, on}

;; ---- slot leave.Result  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Result $e0 $x1))
;;     c1723  mass 1  {unlocked}
;;     c2885  mass 1  {open}
;;     c2901  mass 1  {on}

;; ---- slot leave.Theme  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Theme $e0 $x1))
;;     c1765  mass 1  {room, rooms}
;;      c613  mass 1  {car}
;;      c621  mass 1  {parking lot, parking}

;; ---- slot lose.Agent  [event center]  n 3  clusters 2
(And (Member $e0 lose) (Agent $e0 $x1))
;;      c858  mass 2  {George Allen, Chuck Robb}
;;      c619  mass 1  {tire}

;; ---- slot move.Goal  [event center]  n 3  clusters 2
(And (Member $e0 move) (Goal $e0 $x1))
;;      c174  mass 2  {Baltimore}
;;     c2705  mass 1  {here}

;; ---- slot paint.Patient  [event center]  n 3  clusters 2
(And (Member $e0 paint) (Patient $e0 $x1))
;;     c1014  mass 2  {landscape}
;;     c2728  mass 1  {gate}

;; ---- slot pick_up.Agent  [event center]  n 3  clusters 3
(And (Member $e0 pick_up) (Agent $e0 $x1))
;;      c182  mass 1  {Santiago}
;;     c1876  mass 1  {camera}
;;      c795  mass 1  {Jack, Jay, Jim}

;; ---- slot play.Location  [event center]  n 3  clusters 2
(And (Member $e0 play) (Location $e0 $x1))
;;      c181  mass 2  {Havana}
;;     c1713  mass 1  {floor}

;; ---- slot pull.Theme  [event center]  n 3  clusters 3
(And (Member $e0 pull) (Theme $e0 $x1))
;;      c182  mass 1  {Santiago}
;;      c594  mass 1  {freight cars, line, long}
;;      c764  mass 1  {Boris}

;; ---- slot read.Agent  [event center]  n 3  clusters 3
(And (Member $e0 read) (Agent $e0 $x1))
;;     c1474  mass 1  {girl, little}
;;      c760  mass 1  {Katya}
;;      c792  mass 1  {Thomas}

;; ---- slot read.Theme  [event center]  n 3  clusters 3
(And (Member $e0 read) (Theme $e0 $x1))
;;     c1513  mass 1  {comic}
;;      c309  mass 1  {fairy tale}
;;      c419  mass 1  {economics magazine}

;; ---- slot require.Agent  [event center]  n 3  clusters 3
(And (Member $e0 require) (Agent $e0 $x1))
;;     c1738  mass 1  {house, home}
;;     c2703  mass 1  {master}
;;     c2714  mass 1  {app}

;; ---- slot return.Agent  [event center]  n 3  clusters 2
(And (Member $e0 return) (Agent $e0 $x1))
;;      c671  mass 2  {Glasnow}
;;       c18  mass 1  {fishing boat}

;; ---- slot return.Goal  [event center]  n 3  clusters 2
(And (Member $e0 return) (Goal $e0 $x1))
;;      c178  mass 2  {Altoona}
;;     c1906  mass 1  {port}

;; ---- slot rule.Agent  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Agent $e0 $x1))
;;      c681  mass 2  {Tipu Sultan}
;;      c285  mass 1  {Spain}

;; ---- slot rule.Theme  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Theme $e0 $x1))
;;      c324  mass 2  {muslim house, house, muslim}
;;      c268  mass 1  {Cuba}

;; ---- slot say.Theme  [event center]  n 3  clusters 2
(And (Member $e0 say) (Theme $e0 $x1))
;;     c2646  mass 2  {thing, things}
;;      c313  mass 1  {funeral prayer}

;; ---- slot season.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 season) (Instrument $e0 $x1))
;;     c1198  mass 1  {lemongrass}
;;     c1206  mass 1  {horse radish}
;;     c1208  mass 1  {ramson}

;; ---- slot see.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 see) (Stimulus $e0 $x1))
;;     c1334  mass 1  {animal, animals}
;;      c738  mass 1  {Jessica}
;;      c995  mass 1  {full moon}

;; ---- slot shoot.Patient  [event center]  n 3  clusters 3
(And (Member $e0 shoot) (Patient $e0 $x1))
;;     c1348  mass 1  {bear}
;;      c715  mass 1  {JFK}
;;      c840  mass 1  {Dan}

;; ---- slot sleep.Agent  [event center]  n 3  clusters 2
(And (Member $e0 sleep) (Agent $e0 $x1))
;;     c1429  mass 2  {person, people}
;;     c1431  mass 1  {family, families}

;; ---- slot solve.Patient  [event center]  n 3  clusters 1
(And (Member $e0 solve) (Patient $e0 $x1))
;;     c2156  mass 3  {problem, problems}

;; ---- slot spend.Theme  [event center]  n 3  clusters 2
(And (Member $e0 spend) (Theme $e0 $x1))
;;      c124  mass 2  {exile}
;;     c2100  mass 1  {day}

;; ---- slot start.Location  [event center]  n 3  clusters 2
(And (Member $e0 start) (Location $e0 $x1))
;;      c293  mass 2  {Sweden}
;;      c292  mass 1  {Denmark, Norway}

;; ---- slot stick.Patient  [event center]  n 3  clusters 3
(And (Member $e0 stick) (Patient $e0 $x1))
;;     c1136  mass 1  {chewing gum}
;;     c1329  mass 1  {horse}
;;      c610  mass 1  {truck}

;; ---- slot succeed.Agent  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Agent $e0 $x1))
;;      c695  mass 1  {Alexander}
;;      c802  mass 1  {Bailey}
;;      c884  mass 1  {Peter Gaussen}

;; ---- slot succeed.Theme  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Theme $e0 $x1))
;;     c1429  mass 1  {person, people}
;;      c732  mass 1  {Margaret Fleming}
;;      c857  mass 1  {Henry Cole}

;; ---- slot take_off.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_off) (Agent $e0 $x1))
;;      c587  mass 2  {plane, aeroplane, airplane}
;;      c840  mass 1  {Dan}

;; ---- slot take_over.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_over) (Agent $e0 $x1))
;;      c711  mass 2  {Watts}
;;     c1243  mass 1  {ivy}

;; ---- slot talk.Recipient  [event center]  n 3  clusters 3
(And (Member $e0 talk) (Recipient $e0 $x1))
;;     c1559  mass 1  {audience, large}
;;      c740  mass 1  {Loren}
;;      c932  mass 1  {teacher}

;; ---- slot turn.Goal  [event center]  n 3  clusters 3
(And (Member $e0 turn) (Goal $e0 $x1))
;;     c1518  mass 1  {quagmire}
;;     c2680  mass 1  {report}
;;      c957  mass 1  {river}

;; ---- slot understand.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 understand) (Stimulus $e0 $x1))
;;      c128  mass 1  {public health issue}
;;     c2157  mass 1  {specific issue}
;;     c2642  mass 1  {reason}

;; ---- slot wear.Theme  [event center]  n 3  clusters 3
(And (Member $e0 wear) (Theme $e0 $x1))
;;     c1585  mass 1  {mask}
;;      c507  mass 1  {inaugural gown}
;;      c581  mass 1  {helmet}

;; ---- slot welcome.Agent  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Agent $e0 $x1))
;;     c2706  mass 1  {host}
;;      c392  mass 1  {industrialization}
;;      c544  mass 1  {whig, whigs}

;; ---- slot welcome.Theme  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Theme $e0 $x1))
;;     c1563  mass 1  {guests}
;;      c392  mass 1  {industrialization}
;;      c544  mass 1  {whig, whigs}

;; ---- slot work.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 work) (Experiencer $e0 $x1))
;;     c1094  mass 1  {travel adaptor}
;;     c1895  mass 1  {mouse}
;;     c1902  mass 1  {site}

;; ---- slot work.Manner  [event center]  n 3  clusters 3
(And (Member $e0 work) (Manner $e0 $x1))
;;     c2843  mass 1  {perfectly}
;;     c2848  mass 1  {late, later}
;;     c2888  mass 1  {fine, fair}

;; ==================== subtree @ cluster cos 0.95: pooled role level (136 head pairs) ====================

;; Patient ~ Theme  cosine 0.38  JSD 0.827  n 455 / 594  shared: {thing} {person} {people}
(Patient $e $x)
(Theme $e $x)

;; Agent ~ Theme  cosine 0.36  JSD 0.857  n 888 / 594  shared: {person} {thing} {company}
(Agent $e $x)
(Theme $e $x)

;; Agent ~ Patient  cosine 0.35  JSD 0.841  n 888 / 455  shared: {person} {thing} {people}
(Agent $e $x)
(Patient $e $x)

;; Agent ~ Recipient  cosine 0.33  JSD 0.852  n 888 / 29  shared: {person} {company} {children, kids}
(Agent $e $x)
(Recipient $e $x)

;; Agent ~ Experiencer  cosine 0.30  JSD 0.785  n 888 / 261  shared: {person} {thing} {people}
(Agent $e $x)
(Experiencer $e $x)

;; Experiencer ~ Patient  cosine 0.29  JSD 0.772  n 261 / 455  shared: {thing} {people} {person}
(Experiencer $e $x)
(Patient $e $x)

;; Stimulus ~ Theme  cosine 0.29  JSD 0.921  n 34 / 594  shared: {thing} {food} {questions}
(Stimulus $e $x)
(Theme $e $x)

;; Patient ~ Stimulus  cosine 0.20  JSD 0.942  n 455 / 34  shared: {thing} {food} {knock}
(Patient $e $x)
(Stimulus $e $x)

;; Experiencer ~ Theme  cosine 0.19  JSD 0.91  n 261 / 594  shared: {thing} {person} {people}
(Experiencer $e $x)
(Theme $e $x)

;; Holder ~ Theme  cosine 0.18  JSD 0.913  n 48 / 594  shared: {thing} {food} {house}
(Holder $e $x)
(Theme $e $x)

;; Holder ~ Patient  cosine 0.18  JSD 0.895  n 48 / 455  shared: {thing} {movie, film} {room}
(Holder $e $x)
(Patient $e $x)

;; Agent ~ Stimulus  cosine 0.17  JSD 0.937  n 888 / 34  shared: {thing} {Jessica} {child, kid}
(Agent $e $x)
(Stimulus $e $x)

;; Holder ~ Stimulus  cosine 0.14  JSD 0.917  n 48 / 34  shared: {thing} {food}
(Holder $e $x)
(Stimulus $e $x)

;; Recipient ~ Theme  cosine 0.11  JSD 0.941  n 29 / 594  shared: {person} {children, kids} {company}
(Recipient $e $x)
(Theme $e $x)

;; Experiencer ~ Stimulus  cosine 0.11  JSD 0.955  n 261 / 34  shared: {thing} {child, kid}
(Experiencer $e $x)
(Stimulus $e $x)

;; Goal ~ Source  cosine 0.11  JSD 0.894  n 93 / 47  shared: {school} {town} {here}
(Goal $e $x)
(Source $e $x)

;; Location ~ Source  cosine 0.10  JSD 0.928  n 210 / 47  shared: {here} {town} {school}
(Location $e $x)
(Source $e $x)

;; Agent ~ Holder  cosine 0.10  JSD 0.933  n 888 / 48  shared: {thing} {Wilson} {Karen}
(Agent $e $x)
(Holder $e $x)

;; Experiencer ~ Holder  cosine 0.10  JSD 0.918  n 261 / 48  shared: {thing} {place} {sea, ocean}
(Experiencer $e $x)
(Holder $e $x)

;; Theme ~ To  cosine 0.09  JSD 0.945  n 594 / 46  shared: {thing} {talk} {make}
(Theme $e $x)
(To $e $x)

;; Experiencer ~ Recipient  cosine 0.09  JSD 0.952  n 261 / 29  shared: {person} {children, kids}
(Experiencer $e $x)
(Recipient $e $x)

;; Goal ~ Location  cosine 0.08  JSD 0.925  n 93 / 210  shared: {here} {home} {town}
(Goal $e $x)
(Location $e $x)

;; Patient ~ Recipient  cosine 0.08  JSD 0.964  n 455 / 29  shared: {person} {children, kids}
(Patient $e $x)
(Recipient $e $x)

;; Goal ~ Holder  cosine 0.07  JSD 0.927  n 93 / 48  shared: {town} {house} {place}
(Goal $e $x)
(Holder $e $x)

;; Goal ~ Patient  cosine 0.06  JSD 0.938  n 93 / 455  shared: {room} {community} {tree}
(Goal $e $x)
(Patient $e $x)

;; Stimulus ~ To  cosine 0.05  JSD 0.961  n 34 / 46  shared: {thing}
(Stimulus $e $x)
(To $e $x)

;; Holder ~ Source  cosine 0.05  JSD 0.95  n 48 / 47  shared: {town} {room}
(Holder $e $x)
(Source $e $x)

;; Agent ~ To  cosine 0.05  JSD 0.962  n 888 / 46  shared: {thing} {George Allen, Chuck Robb} {doctor}
(Agent $e $x)
(To $e $x)

;; Patient ~ To  cosine 0.05  JSD 0.975  n 455 / 46  shared: {thing}
(Patient $e $x)
(To $e $x)

;; For ~ Goal  cosine 0.04  JSD 0.967  n 39 / 93  shared: {bed}
(For $e $x)
(Goal $e $x)

;; Holder ~ Location  cosine 0.04  JSD 0.956  n 48 / 210  shared: {town} {sea, ocean} {place}
(Holder $e $x)
(Location $e $x)

;; Holder ~ To  cosine 0.04  JSD 0.949  n 48 / 46  shared: {thing} {repeat}
(Holder $e $x)
(To $e $x)

;; Location ~ Patient  cosine 0.04  JSD 0.948  n 210 / 455  shared: {table} {hotel} {world}
(Location $e $x)
(Patient $e $x)

;; Patient ~ Source  cosine 0.04  JSD 0.969  n 455 / 47  shared: {room} {tree} {school}
(Patient $e $x)
(Source $e $x)

;; Experiencer ~ Goal  cosine 0.04  JSD 0.953  n 261 / 93  shared: {school} {place} {island}
(Experiencer $e $x)
(Goal $e $x)

;; Goal ~ Manner  cosine 0.03  JSD 0.97  n 93 / 115  shared: {well} {back, backward}
(Goal $e $x)
(Manner $e $x)

;; For ~ Theme  cosine 0.03  JSD 0.976  n 39 / 594  shared: {work} {polish} {call}
(For $e $x)
(Theme $e $x)

;; Experiencer ~ To  cosine 0.03  JSD 0.974  n 261 / 46  shared: {thing} {doctor}
(Experiencer $e $x)
(To $e $x)

;; Goal ~ Theme  cosine 0.03  JSD 0.964  n 93 / 594  shared: {house} {big, cat fight} {hospital}
(Goal $e $x)
(Theme $e $x)

;; Instrument ~ Stimulus  cosine 0.02  JSD 0.971  n 34 / 34  shared: {food}
(Instrument $e $x)
(Stimulus $e $x)

;; Experiencer ~ Location  cosine 0.02  JSD 0.974  n 261 / 210  shared: {Europe, Western Europe} {place} {school}
(Experiencer $e $x)
(Location $e $x)

;; Holder ~ Instrument  cosine 0.02  JSD 0.975  n 48 / 34  shared: {food}
(Holder $e $x)
(Instrument $e $x)

;; In ~ Stimulus  cosine 0.02  JSD 0.976  n 50 / 34  shared: {poetry}
(In $e $x)
(Stimulus $e $x)

;; Instrument ~ Patient  cosine 0.02  JSD 0.979  n 34 / 455  shared: {snow} {food} {blood}
(Instrument $e $x)
(Patient $e $x)

;; Source ~ Theme  cosine 0.02  JSD 0.978  n 47 / 594  shared: {eat} {mosquito} {office}
(Source $e $x)
(Theme $e $x)

;; Agent ~ For  cosine 0.02  JSD 0.978  n 888 / 39  shared: {cook} {bus} {patient}
(Agent $e $x)
(For $e $x)

;; Result ~ Source  cosine 0.02  JSD 0.978  n 43 / 47  shared: {bat}
(Result $e $x)
(Source $e $x)

;; In ~ Theme  cosine 0.02  JSD 0.986  n 50 / 594  shared: {english} {understand} {nothing}
(In $e $x)
(Theme $e $x)

;; Location ~ Theme  cosine 0.02  JSD 0.971  n 210 / 594  shared: {Gareccio} {group} {sea, ocean}
(Location $e $x)
(Theme $e $x)

;; Experiencer ~ Instrument  cosine 0.01  JSD 0.983  n 261 / 34  shared: {train} {road}
(Experiencer $e $x)
(Instrument $e $x)

;; Manner ~ Result  cosine 0.01  JSD 0.98  n 115 / 43  shared: {together}
(Manner $e $x)
(Result $e $x)

;; Experiencer ~ Result  cosine 0.01  JSD 0.984  n 261 / 43  shared: {modern, street} {open}
(Experiencer $e $x)
(Result $e $x)

;; Goal ~ Instrument  cosine 0.01  JSD 0.983  n 93 / 34  shared: {snow}
(Goal $e $x)
(Instrument $e $x)

;; Goal ~ Recipient  cosine 0.01  JSD 0.982  n 93 / 29  shared: {Loren}
(Goal $e $x)
(Recipient $e $x)

;; Experiencer ~ In  cosine 0.01  JSD 0.988  n 261 / 50  shared: {weather}
(Experiencer $e $x)
(In $e $x)

;; Instrument ~ Theme  cosine 0.01  JSD 0.99  n 34 / 594  shared: {food}
(Instrument $e $x)
(Theme $e $x)

;; Agent ~ Goal  cosine 0.01  JSD 0.978  n 888 / 93  shared: {community} {campfire} {concert}
(Agent $e $x)
(Goal $e $x)

;; Agent ~ Instrument  cosine 0.01  JSD 0.984  n 888 / 34  shared: {train} {plants} {snow}
(Agent $e $x)
(Instrument $e $x)

;; In ~ Location  cosine 0.01  JSD 0.983  n 50 / 210  shared: {water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; In ~ Patient  cosine 0.01  JSD 0.987  n 50 / 455  shared: {weather} {field}
(In $e $x)
(Patient $e $x)

;; Result ~ Theme  cosine 0.01  JSD 0.988  n 43 / 594  shared: {sleep} {inomaru}
(Result $e $x)
(Theme $e $x)

;; Patient ~ Time  cosine 0.01  JSD 0.993  n 455 / 107  shared: {night}
(Patient $e $x)
(Time $e $x)

;; Location ~ Recipient  cosine 0.01  JSD 0.99  n 210 / 29  shared: {cities}
(Location $e $x)
(Recipient $e $x)

;; Experiencer ~ Source  cosine 0.01  JSD 0.992  n 261 / 47  shared: {school}
(Experiencer $e $x)
(Source $e $x)

;; Agent ~ Location  cosine 0.01  JSD 0.986  n 888 / 210  shared: {fire} {France} {parade}
(Agent $e $x)
(Location $e $x)

;; Agent ~ Result  cosine 0.01  JSD 0.991  n 888 / 43  shared: {crow} {sleep}
(Agent $e $x)
(Result $e $x)

;; Source ~ Time  cosine 0.01  JSD 0.986  n 47 / 107  shared: {point}
(Source $e $x)
(Time $e $x)

;; Location ~ To  cosine 0.01  JSD 0.991  n 210 / 46  shared: {shore}
(Location $e $x)
(To $e $x)

;; Theme ~ Time  cosine 0.00  JSD 0.995  n 594 / 107  shared: {morning}
(Theme $e $x)
(Time $e $x)

;; Agent ~ Source  cosine 0.00  JSD 0.997  n 888 / 47  shared: {aeroplane, airplane}
(Agent $e $x)
(Source $e $x)

;; Agent ~ Time  cosine 0.00  JSD 0.997  n 888 / 107  shared: {spring}
(Agent $e $x)
(Time $e $x)

;; Agent ~ In  cosine 0.00  JSD 1.0  n 888 / 50  shared: 
(Agent $e $x)
(In $e $x)

;; Agent ~ Manner  cosine 0.00  JSD 1.0  n 888 / 115  shared: 
(Agent $e $x)
(Manner $e $x)

;; Experiencer ~ For  cosine 0.00  JSD 1.0  n 261 / 39  shared: 
(Experiencer $e $x)
(For $e $x)

;; Experiencer ~ Manner  cosine 0.00  JSD 1.0  n 261 / 115  shared: 
(Experiencer $e $x)
(Manner $e $x)

;; Experiencer ~ Time  cosine 0.00  JSD 1.0  n 261 / 107  shared: 
(Experiencer $e $x)
(Time $e $x)

;; For ~ Holder  cosine 0.00  JSD 1.0  n 39 / 48  shared: 
(For $e $x)
(Holder $e $x)

;; For ~ In  cosine 0.00  JSD 1.0  n 39 / 50  shared: 
(For $e $x)
(In $e $x)

;; For ~ Instrument  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Instrument $e $x)

;; For ~ Location  cosine 0.00  JSD 1.0  n 39 / 210  shared: 
(For $e $x)
(Location $e $x)

;; For ~ Manner  cosine 0.00  JSD 1.0  n 39 / 115  shared: 
(For $e $x)
(Manner $e $x)

;; For ~ Patient  cosine 0.00  JSD 1.0  n 39 / 455  shared: 
(For $e $x)
(Patient $e $x)

;; For ~ Recipient  cosine 0.00  JSD 1.0  n 39 / 29  shared: 
(For $e $x)
(Recipient $e $x)

;; For ~ Result  cosine 0.00  JSD 1.0  n 39 / 43  shared: 
(For $e $x)
(Result $e $x)

;; For ~ Source  cosine 0.00  JSD 1.0  n 39 / 47  shared: 
(For $e $x)
(Source $e $x)

;; For ~ Stimulus  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Stimulus $e $x)

;; For ~ Time  cosine 0.00  JSD 1.0  n 39 / 107  shared: 
(For $e $x)
(Time $e $x)

;; For ~ To  cosine 0.00  JSD 1.0  n 39 / 46  shared: 
(For $e $x)
(To $e $x)

;; Goal ~ In  cosine 0.00  JSD 1.0  n 93 / 50  shared: 
(Goal $e $x)
(In $e $x)

;; Goal ~ Result  cosine 0.00  JSD 1.0  n 93 / 43  shared: 
(Goal $e $x)
(Result $e $x)

;; Goal ~ Stimulus  cosine 0.00  JSD 1.0  n 93 / 34  shared: 
(Goal $e $x)
(Stimulus $e $x)

;; Goal ~ Time  cosine 0.00  JSD 1.0  n 93 / 107  shared: 
(Goal $e $x)
(Time $e $x)

;; Goal ~ To  cosine 0.00  JSD 1.0  n 93 / 46  shared: 
(Goal $e $x)
(To $e $x)

;; Holder ~ In  cosine 0.00  JSD 1.0  n 48 / 50  shared: 
(Holder $e $x)
(In $e $x)

;; Holder ~ Manner  cosine 0.00  JSD 1.0  n 48 / 115  shared: 
(Holder $e $x)
(Manner $e $x)

;; Holder ~ Recipient  cosine 0.00  JSD 1.0  n 48 / 29  shared: 
(Holder $e $x)
(Recipient $e $x)

;; Holder ~ Result  cosine 0.00  JSD 1.0  n 48 / 43  shared: 
(Holder $e $x)
(Result $e $x)

;; Holder ~ Time  cosine 0.00  JSD 1.0  n 48 / 107  shared: 
(Holder $e $x)
(Time $e $x)

;; In ~ Instrument  cosine 0.00  JSD 1.0  n 50 / 34  shared: 
(In $e $x)
(Instrument $e $x)

;; In ~ Manner  cosine 0.00  JSD 1.0  n 50 / 115  shared: 
(In $e $x)
(Manner $e $x)

;; In ~ Recipient  cosine 0.00  JSD 1.0  n 50 / 29  shared: 
(In $e $x)
(Recipient $e $x)

;; In ~ Result  cosine 0.00  JSD 1.0  n 50 / 43  shared: 
(In $e $x)
(Result $e $x)

;; In ~ Source  cosine 0.00  JSD 1.0  n 50 / 47  shared: 
(In $e $x)
(Source $e $x)

;; In ~ Time  cosine 0.00  JSD 1.0  n 50 / 107  shared: 
(In $e $x)
(Time $e $x)

;; In ~ To  cosine 0.00  JSD 1.0  n 50 / 46  shared: 
(In $e $x)
(To $e $x)

;; Instrument ~ Location  cosine 0.00  JSD 1.0  n 34 / 210  shared: 
(Instrument $e $x)
(Location $e $x)

;; Instrument ~ Manner  cosine 0.00  JSD 1.0  n 34 / 115  shared: 
(Instrument $e $x)
(Manner $e $x)

;; Instrument ~ Recipient  cosine 0.00  JSD 1.0  n 34 / 29  shared: 
(Instrument $e $x)
(Recipient $e $x)

;; Instrument ~ Result  cosine 0.00  JSD 1.0  n 34 / 43  shared: 
(Instrument $e $x)
(Result $e $x)

;; Instrument ~ Source  cosine 0.00  JSD 1.0  n 34 / 47  shared: 
(Instrument $e $x)
(Source $e $x)

;; Instrument ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Instrument $e $x)
(Time $e $x)

;; Instrument ~ To  cosine 0.00  JSD 1.0  n 34 / 46  shared: 
(Instrument $e $x)
(To $e $x)

;; Location ~ Manner  cosine 0.00  JSD 1.0  n 210 / 115  shared: 
(Location $e $x)
(Manner $e $x)

;; Location ~ Result  cosine 0.00  JSD 1.0  n 210 / 43  shared: 
(Location $e $x)
(Result $e $x)

;; Location ~ Stimulus  cosine 0.00  JSD 1.0  n 210 / 34  shared: 
(Location $e $x)
(Stimulus $e $x)

;; Location ~ Time  cosine 0.00  JSD 1.0  n 210 / 107  shared: 
(Location $e $x)
(Time $e $x)

;; Manner ~ Patient  cosine 0.00  JSD 1.0  n 115 / 455  shared: 
(Manner $e $x)
(Patient $e $x)

;; Manner ~ Recipient  cosine 0.00  JSD 1.0  n 115 / 29  shared: 
(Manner $e $x)
(Recipient $e $x)

;; Manner ~ Source  cosine 0.00  JSD 1.0  n 115 / 47  shared: 
(Manner $e $x)
(Source $e $x)

;; Manner ~ Stimulus  cosine 0.00  JSD 1.0  n 115 / 34  shared: 
(Manner $e $x)
(Stimulus $e $x)

;; Manner ~ Theme  cosine 0.00  JSD 1.0  n 115 / 594  shared: 
(Manner $e $x)
(Theme $e $x)

;; Manner ~ Time  cosine 0.00  JSD 1.0  n 115 / 107  shared: 
(Manner $e $x)
(Time $e $x)

;; Manner ~ To  cosine 0.00  JSD 1.0  n 115 / 46  shared: 
(Manner $e $x)
(To $e $x)

;; Patient ~ Result  cosine 0.00  JSD 1.0  n 455 / 43  shared: 
(Patient $e $x)
(Result $e $x)

;; Recipient ~ Result  cosine 0.00  JSD 1.0  n 29 / 43  shared: 
(Recipient $e $x)
(Result $e $x)

;; Recipient ~ Source  cosine 0.00  JSD 1.0  n 29 / 47  shared: 
(Recipient $e $x)
(Source $e $x)

;; Recipient ~ Stimulus  cosine 0.00  JSD 1.0  n 29 / 34  shared: 
(Recipient $e $x)
(Stimulus $e $x)

;; Recipient ~ Time  cosine 0.00  JSD 1.0  n 29 / 107  shared: 
(Recipient $e $x)
(Time $e $x)

;; Recipient ~ To  cosine 0.00  JSD 1.0  n 29 / 46  shared: 
(Recipient $e $x)
(To $e $x)

;; Result ~ Stimulus  cosine 0.00  JSD 1.0  n 43 / 34  shared: 
(Result $e $x)
(Stimulus $e $x)

;; Result ~ Time  cosine 0.00  JSD 1.0  n 43 / 107  shared: 
(Result $e $x)
(Time $e $x)

;; Result ~ To  cosine 0.00  JSD 1.0  n 43 / 46  shared: 
(Result $e $x)
(To $e $x)

;; Source ~ Stimulus  cosine 0.00  JSD 1.0  n 47 / 34  shared: 
(Source $e $x)
(Stimulus $e $x)

;; Source ~ To  cosine 0.00  JSD 1.0  n 47 / 46  shared: 
(Source $e $x)
(To $e $x)

;; Stimulus ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Stimulus $e $x)
(Time $e $x)

;; Time ~ To  cosine 0.00  JSD 1.0  n 107 / 46  shared: 
(Time $e $x)
(To $e $x)

;; ==================== subtree @ cluster cos 0.95: slot pairs (1 event-center signals) ====================

;; [same role, different class]  accompany.Agent ~ appear.Agent  cosine 0.76  JSD 0.23  n 4 / 6  shared: {sisters} {person}
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000050 tierC-000259
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; ==================== subtree @ cluster cos 0.95: compared slots with their distributions (269 slots, n >= 3) ====================

;; ---- slot <unclassed>.LocatedIn  [entity center]  n 46  clusters 39
(LocatedIn $x0 $x1)
;;     c3026  mass 3  {here}
;;     c1053  mass 2  {class}
;;     c1101  mass 2  {Derwent Isle}
;;     c1369  mass 2  {garden}
;;      c247  mass 2  {city}
;;      c254  mass 2  {southern}
;;     c1062  mass 1  {Dianchi Lake, Lake Dianchi}
;;     c1077  mass 1  {Huancavelica}
;;     c1098  mass 1  {sea, ocean}
;;     c1279  mass 1  {full, kitchen sink}
;;     c1357  mass 1  {village}
;;     c1397  mass 1  {tree}
;;     c1510  mass 1  {basket, red}
;;     c1674  mass 1  {country}
;;     c1715  mass 1  {Tatoeba}
;;     c1907  mass 1  {ceiling}
;;     c1908  mass 1  {floor}
;;     c1927  mass 1  {wall}
;;     c1936  mass 1  {house}
;;     c1947  mass 1  {full, place}
;;     c1952  mass 1  {storeroom}
;;     c2017  mass 1  {fountain, full}
;;     c2105  mass 1  {table}
;;     c2421  mass 1  {play}
;;      c267  mass 1  {Algiers}
;;      c269  mass 1  {El Harrach}
;;      c286  mass 1  {Russian Far East}
;;      c303  mass 1  {Peru}
;;      c307  mass 1  {India}
;;      c310  mass 1  {Japan}
;;      c320  mass 1  {Gaul}
;;      c322  mass 1  {UK}
;;      c343  mass 1  {movie, film}
;;       c39  mass 1  {Loglan}
;;       c40  mass 1  {Lojban}
;;      c462  mass 1  {market}
;;      c625  mass 1  {world}
;;      c696  mass 1  {park}
;;      c708  mass 1  {street}

;; ---- slot have.Holder  [event center]  n 44  clusters 38
(And (Member $e0 have) (Holder $e0 $x1))
;;      c868  mass 4  {Kristoffer}
;;      c248  mass 2  {town}
;;     c2962  mass 2  {thing}
;;      c942  mass 2  {Karen}
;;     c1000  mass 1  {homentropic flow}
;;     c1098  mass 1  {sea, ocean}
;;     c1323  mass 1  {food}
;;     c1378  mass 1  {ivy}
;;     c1426  mass 1  {creature}
;;     c1712  mass 1  {sentence}
;;     c1721  mass 1  {word processor}
;;     c1936  mass 1  {house}
;;     c1942  mass 1  {tower}
;;     c1944  mass 1  {place}
;;     c1948  mass 1  {hotel}
;;     c1966  mass 1  {room}
;;     c2048  mass 1  {bad, weather}
;;     c2317  mass 1  {february}
;;      c264  mass 1  {tuareg, tuaregs}
;;      c267  mass 1  {Algiers}
;;      c300  mass 1  {Morocco}
;;     c3212  mass 1  {decision}
;;      c323  mass 1  {Scotland}
;;     c3275  mass 1  {repeat}
;;      c343  mass 1  {movie, film}
;;      c366  mass 1  {mosque, old}
;;      c449  mass 1  {insurance}
;;      c589  mass 1  {library}
;;      c593  mass 1  {writer}
;;      c616  mass 1  {lawyer}
;;      c693  mass 1  {gas station}
;;      c792  mass 1  {Wilson}
;;      c857  mass 1  {Rasputin}
;;      c877  mass 1  {Boldi}
;;      c884  mass 1  {Thomas}
;;      c923  mass 1  {Diego}
;;      c931  mass 1  {Miroslav}
;;      c999  mass 1  {homentropic current}

;; ---- slot have.Theme  [event center]  n 43  clusters 38
(And (Member $e0 have) (Theme $e0 $x1))
;;     c1639  mass 4  {children, kids}
;;     c1567  mass 2  {constant, entropy, uniform}
;;     c2996  mass 2  {representation, represent}
;;     c1020  mass 1  {parenthetic, style}
;;     c1235  mass 1  {nice, taste}
;;     c1368  mass 1  {beautiful, garden}
;;     c1371  mass 1  {leaves}
;;     c1407  mass 1  {plot, predictable}
;;     c1469  mass 1  {antler, antlers}
;;     c1475  mass 1  {herds}
;;     c1601  mass 1  {friends}
;;     c1763  mass 1  {soul piercing, stare}
;;     c1788  mass 1  {nasty, personality}
;;     c1806  mass 1  {eerie, feeling}
;;     c1812  mass 1  {dream, weird}
;;     c1903  mass 1  {conical, roof}
;;     c1976  mass 1  {blue, curtain}
;;     c2174  mass 1  {atmosphere, homely}
;;     c2254  mass 1  {value}
;;     c2260  mass 1  {reputation}
;;     c2347  mass 1  {days}
;;     c2574  mass 1  {chance}
;;     c2604  mass 1  {color}
;;     c2807  mass 1  {meanings}
;;     c2832  mass 1  {effect}
;;       c29  mass 1  {bank, documents, valuable}
;;     c2963  mass 1  {things}
;;     c2970  mass 1  {purpose, single}
;;     c2977  mass 1  {right}
;;     c2980  mass 1  {thought, think}
;;     c3288  mass 1  {consequences, serious, wide}
;;      c355  mass 1  {cemeteries}
;;      c394  mass 1  {history, rich}
;;      c448  mass 1  {deductible, high}
;;      c631  mass 1  {internal politics, intriguing}
;;      c692  mass 1  {gas pump, gas pumps}
;;      c744  mass 1  {guards}
;;       c90  mass 1  {beauty salon, beauty salons}

;; ---- slot <unclassed>.Possession  [entity center]  n 30  clusters 19
(Possession $x0 $x1)
;;     c1593  mass 5  {person}
;;      c609  mass 4  {Free Soil Party}
;;      c610  mass 4  {Republican Party}
;;      c423  mass 2  {subsequent game}
;;     c1014  mass 1  {logical phrase}
;;     c1015  mass 1  {logical proposition}
;;     c1120  mass 1  {Jupiter}
;;     c1669  mass 1  {Twilight}
;;     c1674  mass 1  {country}
;;      c188  mass 1  {Yunnan}
;;     c2503  mass 1  {easy, generalization}
;;     c2847  mass 1  {union}
;;     c2962  mass 1  {thing}
;;      c362  mass 1  {sunni community, sunni communities}
;;      c363  mass 1  {communities, neighbouring, other, sunni}
;;      c544  mass 1  {islamic ivory}
;;      c732  mass 1  {radical group}
;;      c771  mass 1  {God}
;;      c827  mass 1  {Dora Smith}

;; ---- slot use.Theme  [event center]  n 23  clusters 21
(And (Member $e0 use) (Theme $e0 $x1))
;;        c3  mass 2  {banach mackey topology}
;;        c4  mass 2  {weak arens space topology}
;;      c106  mass 1  {Laravel}
;;      c107  mass 1  {current, naming convention}
;;      c109  mass 1  {current, designation convention}
;;     c1168  mass 1  {jingle}
;;     c1187  mass 1  {auto tune}
;;     c1262  mass 1  {sugar}
;;     c1699  mass 1  {metaphor}
;;     c1710  mass 1  {phrase}
;;     c1712  mass 1  {sentence}
;;     c1720  mass 1  {word}
;;     c1967  mass 1  {rooms}
;;     c2000  mass 1  {fire}
;;     c2115  mass 1  {machine}
;;     c3294  mass 1  {public fund}
;;      c395  mass 1  {calendars, various}
;;      c519  mass 1  {chemical agent}
;;       c72  mass 1  {Midway}
;;      c731  mass 1  {paramilitary group}
;;      c844  mass 1  {Iga}

;; ---- slot make.Patient  [event center]  n 20  clusters 20
(And (Member $e0 make) (Patient $e0 $x1))
;;     c1138  mass 1  {travel}
;;     c1156  mass 1  {high pitched, noise}
;;     c1176  mass 1  {clicking, sound}
;;     c1245  mass 1  {cup}
;;     c1312  mass 1  {chicken fried steak}
;;     c1766  mass 1  {eye contact}
;;     c1837  mass 1  {bad, matter}
;;     c1933  mass 1  {comfortable, house}
;;     c1969  mass 1  {beautiful, room}
;;     c2038  mass 1  {big, snowman}
;;     c2240  mass 1  {purchase}
;;     c2511  mass 1  {copes}
;;     c2674  mass 1  {claims}
;;     c2799  mass 1  {difference}
;;     c2801  mass 1  {big, difference}
;;      c297  mass 1  {Afghanistan}
;;      c574  mass 1  {paper}
;;       c76  mass 1  {telephone call}
;;      c775  mass 1  {Augustus}
;;      c822  mass 1  {Isabella}

;; ---- slot build.Patient  [event center]  n 18  clusters 9
(And (Member $e0 build) (Patient $e0 $x1))
;;     c1948  mass 4  {hotel}
;;     c1966  mass 3  {room}
;;     c2962  mass 2  {thing}
;;     c3079  mass 2  {horn}
;;      c575  mass 2  {paper factory}
;;      c576  mass 2  {paper mill}
;;     c2133  mass 1  {network, wells}
;;      c416  mass 1  {new, playground}
;;       c64  mass 1  {original, turing machine}

;; ---- slot make.Agent  [event center]  n 18  clusters 18
(And (Member $e0 make) (Agent $e0 $x1))
;;     c1267  mass 1  {diner}
;;     c1421  mass 1  {cat}
;;     c1618  mass 1  {man}
;;     c1637  mass 1  {boys}
;;     c1975  mass 1  {curtain, curtains}
;;     c2034  mass 1  {gusty, winds}
;;     c2222  mass 1  {artistic beauty}
;;     c2506  mass 1  {practical utility}
;;     c2962  mass 1  {thing}
;;      c729  mass 1  {Taliban}
;;      c775  mass 1  {Augustus}
;;       c80  mass 1  {customer}
;;      c835  mass 1  {Hanako}
;;      c869  mass 1  {James}
;;      c871  mass 1  {David}
;;      c915  mass 1  {Elias}
;;      c935  mass 1  {Damiano}
;;      c937  mass 1  {Lorenzo}

;; ---- slot go.Agent  [event center]  n 15  clusters 14
(And (Member $e0 go) (Agent $e0 $x1))
;;      c821  mass 2  {Katherine}
;;     c1042  mass 1  {pupils}
;;     c1421  mass 1  {cat}
;;     c1607  mass 1  {Mom}
;;     c1639  mass 1  {children, kids}
;;      c818  mass 1  {Olivia}
;;      c825  mass 1  {Linda}
;;      c836  mass 1  {Mariko}
;;      c866  mass 1  {Matthew}
;;      c875  mass 1  {Donald}
;;      c906  mass 1  {Mennad}
;;      c933  mass 1  {Flavio}
;;      c941  mass 1  {Daniel}
;;      c944  mass 1  {Kalman}

;; ---- slot play.Agent  [event center]  n 15  clusters 11
(And (Member $e0 play) (Agent $e0 $x1))
;;     c1639  mass 3  {children, kids}
;;      c748  mass 2  {Boston Red Sox}
;;      c749  mass 2  {Cincinnati Reds}
;;     c1637  mass 1  {boys}
;;     c1640  mass 1  {child, kid}
;;      c168  mass 1  {biology}
;;      c375  mass 1  {religion}
;;      c803  mass 1  {Audrey Hepburn}
;;      c804  mass 1  {Audrey Heppurn}
;;      c837  mass 1  {Yumi}
;;      c885  mass 1  {Tony}

;; ---- slot build.Agent  [event center]  n 14  clusters 5
(And (Member $e0 build) (Agent $e0 $x1))
;;     c1537  mass 8  {company}
;;     c1593  mass 2  {person}
;;      c970  mass 2  {O. R. Woodcock}
;;     c1028  mass 1  {community}
;;      c263  mass 1  {mozabite, mozabites}

;; ---- slot find.Location  [event center]  n 14  clusters 10
(And (Member $e0 find) (Location $e0 $x1))
;;     c1065  mass 2  {tributary, tributaries}
;;      c188  mass 2  {Yunnan}
;;      c254  mass 2  {southern}
;;     c2780  mass 2  {bench}
;;     c1062  mass 1  {Dianchi Lake, Lake Dianchi}
;;     c1096  mass 1  {Sahara Desert}
;;     c1678  mass 1  {western}
;;      c219  mass 1  {station}
;;      c283  mass 1  {Europe, Western Europe}
;;      c358  mass 1  {tomb}

;; ---- slot <unclassed>.SubsetOf  [entity center]  n 13  clusters 12
(SubsetOf $x0 $x1)
;;     c1592  mass 2  {people}
;;     c1042  mass 1  {pupils}
;;     c1356  mass 1  {villagers}
;;      c139  mass 1  {refugees}
;;     c1447  mass 1  {centipede, centipedes}
;;     c1643  mass 1  {chicks}
;;     c1645  mass 1  {girls}
;;     c2111  mass 1  {windows}
;;     c2236  mass 1  {shops}
;;      c225  mass 1  {corners}
;;      c586  mass 1  {mayan book, mayan books}
;;      c657  mass 1  {planes}

;; ---- slot start.Theme  [event center]  n 13  clusters 13
(And (Member $e0 start) (Theme $e0 $x1))
;;     c1051  mass 1  {high school}
;;     c1201  mass 1  {chant}
;;     c1778  mass 1  {vomit}
;;     c2013  mass 1  {cry}
;;     c2419  mass 1  {hear}
;;     c2425  mass 1  {talk}
;;     c2559  mass 1  {improve}
;;     c2690  mass 1  {disappear}
;;     c2881  mass 1  {run out}
;;     c3088  mass 1  {roll}
;;     c3105  mass 1  {appear}
;;     c3108  mass 1  {show}
;;        c9  mass 1  {feel, light headed}

;; ---- slot go.Goal  [event center]  n 12  clusters 9
(And (Member $e0 go) (Goal $e0 $x1))
;;     c2341  mass 4  {bed}
;;     c1050  mass 1  {school}
;;      c153  mass 1  {hospital}
;;     c1944  mass 1  {place}
;;     c1971  mass 1  {bathroom}
;;      c713  mass 1  {way}
;;      c826  mass 1  {Loren}
;;       c91  mass 1  {aesthetic salon}
;;       c94  mass 1  {supermarket}

;; ---- slot study.Agent  [event center]  n 12  clusters 9
(And (Member $e0 study) (Agent $e0 $x1))
;;     c1593  mass 3  {person}
;;       c62  mass 2  {scientists}
;;       c53  mass 1  {forensics researchers}
;;      c772  mass 1  {Nicolaus Copernicus}
;;      c823  mass 1  {Beth}
;;      c848  mass 1  {Peter}
;;      c851  mass 1  {Yuri}
;;      c900  mass 1  {Fadil}
;;      c922  mass 1  {Carlos}

;; ---- slot <unclassed>.PartOf  [entity center]  n 11  clusters 10
(PartOf $x0 $x1)
;;      c758  mass 2  {Khurda Road}
;;     c1037  mass 1  {student associations}
;;     c1301  mass 1  {cake}
;;     c1378  mass 1  {ivy}
;;     c1385  mass 1  {plant}
;;     c1485  mass 1  {animal}
;;      c188  mass 1  {Yunnan}
;;     c2421  mass 1  {play}
;;      c544  mass 1  {islamic ivory}
;;      c707  mass 1  {road, street}

;; ---- slot become.Patient  [event center]  n 11  clusters 9
(And (Member $e0 become) (Patient $e0 $x1))
;;      c123  mass 2  {indigenous, people}
;;     c1838  mass 2  {bad, relationship}
;;     c1084  mass 1  {earth, red}
;;     c1158  mass 1  {intense, noise}
;;     c2273  mass 1  {discipline, lax}
;;     c2962  mass 1  {thing}
;;      c607  mass 1  {conservative, revolutionary}
;;      c830  mass 1  {Lady Ashton}
;;      c832  mass 1  {inomaru, person}

;; ---- slot begin.Agent  [event center]  n 11  clusters 9
(And (Member $e0 begin) (Agent $e0 $x1))
;;      c121  mass 2  {native american, indigenous american, indigenous americans, native americans}
;;      c132  mass 2  {european american settlers}
;;     c1734  mass 1  {Mark}
;;     c1738  mass 1  {crowd}
;;     c2379  mass 1  {rebels}
;;      c734  mass 1  {legionnaires}
;;      c824  mass 1  {Jessica}
;;      c870  mass 1  {William}
;;      c871  mass 1  {David}

;; ---- slot begin.Theme  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Theme $e0 $x1))
;;     c2755  mass 4  {create}
;;     c1760  mass 1  {applaud}
;;     c1826  mass 1  {confess}
;;     c2587  mass 1  {bud}
;;     c2753  mass 1  {make}
;;     c3063  mass 1  {hang out}
;;     c3115  mass 1  {distribute}
;;      c501  mass 1  {torture}

;; ---- slot build.Location  [event center]  n 11  clusters 4
(And (Member $e0 build) (Location $e0 $x1))
;;      c289  mass 4  {Kazakhstan}
;;      c184  mass 3  {Eskisehir}
;;      c327  mass 3  {Turkey}
;;      c268  mass 1  {Ghardaia}

;; ---- slot kill.Patient  [event center]  n 11  clusters 7
(And (Member $e0 kill) (Patient $e0 $x1))
;;     c1592  mass 4  {people}
;;     c1593  mass 2  {person}
;;     c1436  mass 1  {zombie, zombies}
;;     c1478  mass 1  {gazelle}
;;     c1495  mass 1  {fox}
;;      c736  mass 1  {soldier}
;;      c739  mass 1  {soldiers}

;; ---- slot produce.Patient  [event center]  n 11  clusters 7
(And (Member $e0 produce) (Patient $e0 $x1))
;;      c343  mass 4  {movie, film}
;;     c1203  mass 2  {album}
;;      c166  mass 1  {insulin}
;;     c2210  mass 1  {mesmerizing, sheen}
;;      c341  mass 1  {syrian film, film, syrian film}
;;      c342  mass 1  {destined, film, syrian film}
;;      c521  mass 1  {cyanide, harmless, trace}

;; ---- slot start.Patient  [event center]  n 11  clusters 11
(And (Member $e0 start) (Patient $e0 $x1))
;;     c1121  mass 1  {Milky Way}
;;     c1416  mass 1  {dog feed}
;;     c1753  mass 1  {concert}
;;        c2  mass 1  {national fibre optic network project}
;;     c2324  mass 1  {watermelon season}
;;     c2698  mass 1  {crack}
;;     c2750  mass 1  {knock}
;;     c2963  mass 1  {things}
;;      c552  mass 1  {blue, pockets, sky}
;;      c598  mass 1  {freedom movement, gusher}
;;      c680  mass 1  {truck}

;; ---- slot find.Theme  [event center]  n 10  clusters 6
(And (Member $e0 find) (Theme $e0 $x1))
;;     c2962  mass 4  {thing}
;;      c689  mass 2  {Couper}
;;     c1092  mass 1  {meteorite}
;;      c541  mass 1  {clay figurine, clay figurines}
;;      c573  mass 1  {paper sheet, paper sheets}
;;      c938  mass 1  {Pietro}

;; ---- slot leave.Agent  [event center]  n 10  clusters 10
(And (Member $e0 leave) (Agent $e0 $x1))
;;     c1593  mass 1  {person}
;;       c16  mass 1  {ship}
;;      c656  mass 1  {plane}
;;      c673  mass 1  {bus}
;;      c685  mass 1  {car}
;;      c856  mass 1  {Ivan}
;;      c862  mass 1  {Marcus}
;;      c882  mass 1  {Tom}
;;      c926  mass 1  {Rodrigo}
;;      c964  mass 1  {Brian}

;; ---- slot serve.Agent  [event center]  n 10  clusters 9
(And (Member $e0 serve) (Agent $e0 $x1))
;;      c196  mass 2  {Indooroopilly}
;;     c1593  mass 1  {person}
;;     c1609  mass 1  {grandmother}
;;     c1666  mass 1  {Rosewood}
;;      c193  mass 1  {Ipswich}
;;      c194  mass 1  {Ipswich & Rosewood}
;;      c795  mass 1  {person, president}
;;      c929  mass 1  {Janos}
;;      c968  mass 1  {Yitzhak}

;; ---- slot take.Theme  [event center]  n 10  clusters 9
(And (Member $e0 take) (Theme $e0 $x1))
;;     c1591  mass 2  {identity}
;;     c1535  mass 1  {office}
;;     c2071  mass 1  {portrait}
;;     c2475  mass 1  {power}
;;     c2481  mass 1  {drastic, measures}
;;     c2962  mass 1  {thing}
;;     c3089  mass 1  {roller}
;;     c3274  mass 1  {close, look}
;;     c3277  mass 1  {while}

;; ---- slot try.Agent  [event center]  n 10  clusters 10
(And (Member $e0 try) (Agent $e0 $x1))
;;     c1114  mass 1  {alien}
;;     c1472  mass 1  {crocodile}
;;     c1537  mass 1  {company}
;;     c1633  mass 1  {man, young}
;;     c1734  mass 1  {Mark}
;;      c205  mass 1  {Santiago}
;;      c871  mass 1  {David}
;;      c880  mass 1  {Felix}
;;      c894  mass 1  {Bob}
;;      c932  mass 1  {Claudio}

;; ---- slot write.Patient  [event center]  n 10  clusters 8
(And (Member $e0 write) (Patient $e0 $x1))
;;     c1200  mass 2  {song}
;;     c2142  mass 2  {episode}
;;     c1588  mass 1  {character}
;;     c1712  mass 1  {sentence}
;;     c1716  mass 1  {screenplay}
;;     c1717  mass 1  {script}
;;     c2525  mass 1  {letter}
;;      c587  mass 1  {book}

;; ---- slot fall.Patient  [event center]  n 9  clusters 9
(And (Member $e0 fall) (Patient $e0 $x1))
;;     c1042  mass 1  {pupils}
;;     c1258  mass 1  {ice pellet}
;;     c1643  mass 1  {chicks}
;;     c1727  mass 1  {hush of anticipation}
;;     c1869  mass 1  {dead, rotten, tree}
;;     c2041  mass 1  {snow}
;;     c2099  mass 1  {scaffolding}
;;     c2697  mass 1  {forest, silent}
;;      c588  mass 1  {books}

;; ---- slot follow.Agent  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Agent $e0 $x1))
;;     c2585  mass 2  {bhadalas}
;;      c367  mass 2  {muslim house, house, muslim}
;;     c1440  mass 1  {beast, crawling}
;;      c710  mass 1  {road}
;;      c776  mass 1  {Alexander}
;;      c898  mass 1  {Bailey}
;;      c902  mass 1  {Sami}

;; ---- slot follow.Theme  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Theme $e0 $x1))
;;      c255  mass 2  {region}
;;      c390  mass 2  {traditions}
;;     c1104  mass 1  {shoreline}
;;      c806  mass 1  {Layla}
;;      c817  mass 1  {Margaret Fleming}
;;      c921  mass 1  {Lukas}
;;      c957  mass 1  {Henry Cole}

;; ---- slot hear.Stimulus  [event center]  n 9  clusters 9
(And (Member $e0 hear) (Stimulus $e0 $x1))
;;     c1151  mass 1  {barking, growling, noises}
;;     c1164  mass 1  {noise, ticking}
;;     c1184  mass 1  {music, upbeat}
;;     c1854  mass 1  {crash}
;;     c2163  mass 1  {shoot, shot}
;;     c2741  mass 1  {bang}
;;     c2750  mass 1  {knock}
;;     c2962  mass 1  {thing}
;;     c3046  mass 1  {start}

;; ---- slot kill.Agent  [event center]  n 9  clusters 6
(And (Member $e0 kill) (Agent $e0 $x1))
;;     c2025  mass 4  {hurricane}
;;     c1499  mass 1  {lions}
;;      c165  mass 1  {cancer}
;;     c2000  mass 1  {fire}
;;     c2164  mass 1  {hunter}
;;      c856  mass 1  {Ivan}

;; ---- slot sing.Agent  [event center]  n 9  clusters 7
(And (Member $e0 sing) (Agent $e0 $x1))
;;     c1581  mass 2  {sisters}
;;     c1593  mass 2  {person}
;;     c1204  mass 1  {Amateur Barbershop Harmony Society}
;;     c1461  mass 1  {birds}
;;     c1528  mass 1  {groups, professional}
;;      c765  mass 1  {actress}
;;      c871  mass 1  {David}

;; ---- slot take.Agent  [event center]  n 9  clusters 8
(And (Member $e0 take) (Agent $e0 $x1))
;;     c1593  mass 2  {person}
;;     c1307  mass 1  {cook}
;;     c2962  mass 1  {thing}
;;      c787  mass 1  {Jerry Rawlings}
;;      c796  mass 1  {president}
;;      c863  mass 1  {Michael}
;;      c925  mass 1  {Gustavo}
;;      c930  mass 1  {Lajos}

;; ---- slot become.Result  [event center]  n 8  clusters 7
(And (Member $e0 become) (Result $e0 $x1))
;;     c1835  mass 2  {bad}
;;      c122  mass 1  {indigenous}
;;     c1819  mass 1  {alarmed}
;;      c217  mass 1  {lax}
;;     c2373  mass 1  {red}
;;      c606  mass 1  {conservative}
;;      c831  mass 1  {inomaru}

;; ---- slot change.Patient  [event center]  n 8  clusters 7
(And (Member $e0 change) (Patient $e0 $x1))
;;     c2049  mass 2  {weather}
;;     c1010  mass 1  {mind}
;;     c1058  mass 1  {course}
;;     c1594  mass 1  {name}
;;     c2018  mass 1  {rain}
;;     c2604  mass 1  {color}
;;     c2962  mass 1  {thing}

;; ---- slot hear.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 hear) (Experiencer $e0 $x1))
;;      c878  mass 2  {Bruno}
;;      c852  mass 1  {Oleg}
;;      c869  mass 1  {James}
;;      c886  mass 1  {Jonas}
;;      c900  mass 1  {Fadil}
;;      c933  mass 1  {Flavio}
;;      c935  mass 1  {Damiano}

;; ---- slot live.Agent  [event center]  n 8  clusters 8
(And (Member $e0 live) (Agent $e0 $x1))
;;     c1494  mass 1  {wolves}
;;      c265  mass 1  {Beja}
;;      c864  mass 1  {Mary, Maria}
;;      c908  mass 1  {Tiziri}
;;      c910  mass 1  {Yidir}
;;      c915  mass 1  {Elias}
;;      c948  mass 1  {Ray Kurtzweil}
;;      c995  mass 1  {Cainan}

;; ---- slot live.Location  [event center]  n 8  clusters 7
(And (Member $e0 live) (Location $e0 $x1))
;;      c333  mass 2  {Norway}
;;     c1931  mass 1  {house, isolated}
;;     c1933  mass 1  {comfortable, house}
;;     c1934  mass 1  {house, large}
;;      c226  mass 1  {southeastern corner}
;;     c2310  mass 1  {group}
;;      c243  mass 1  {suburb}

;; ---- slot need.Experiencer  [event center]  n 8  clusters 8
(And (Member $e0 need) (Experiencer $e0 $x1))
;;     c1331  mass 1  {sauce}
;;      c148  mass 1  {doctor}
;;     c1639  mass 1  {children, kids}
;;      c299  mass 1  {Algeria}
;;     c3050  mass 1  {gate}
;;      c867  mass 1  {Karl}
;;      c936  mass 1  {Martino}
;;      c966  mass 1  {Yanni}

;; ---- slot open.Patient  [event center]  n 8  clusters 4
(And (Member $e0 open) (Patient $e0 $x1))
;;     c1923  mass 4  {door}
;;      c611  mass 2  {law, laws}
;;     c1910  mass 1  {door, vault like}
;;      c454  mass 1  {bank}

;; ---- slot play.Theme  [event center]  n 8  clusters 6
(And (Member $e0 play) (Theme $e0 $x1))
;;      c403  mass 2  {tennis}
;;      c805  mass 2  {Holly Golightly}
;;     c1213  mass 1  {harp}
;;     c2141  mass 1  {series}
;;     c2534  mass 1  {crucial, role}
;;     c2535  mass 1  {important, role}

;; ---- slot produce.Agent  [event center]  n 8  clusters 5
(And (Member $e0 produce) (Agent $e0 $x1))
;;      c976  mass 2  {Colin Richardson}
;;      c986  mass 2  {Harvey Hayutin}
;;      c987  mass 2  {Sy Weintraub}
;;      c167  mass 1  {pancreas}
;;      c514  mass 1  {layer, oil, thin}

;; ---- slot speak.Agent  [event center]  n 8  clusters 6
(And (Member $e0 speak) (Agent $e0 $x1))
;;      c819  mass 2  {Sophia}
;;      c914  mass 2  {Oates}
;;     c1614  mass 1  {men}
;;      c781  mass 1  {Xavier}
;;      c833  mass 1  {Mie Sonozaki}
;;      c997  mass 1  {Kari Wahlgren}

;; ---- slot talk.Agent  [event center]  n 8  clusters 7
(And (Member $e0 talk) (Agent $e0 $x1))
;;      c821  mass 2  {Katherine}
;;     c1554  mass 1  {school janitor}
;;     c1601  mass 1  {friends}
;;      c594  mass 1  {novelist}
;;      c825  mass 1  {Linda}
;;      c941  mass 1  {Daniel}
;;      c947  mass 1  {Jordan Peterson}

;; ---- slot use.Agent  [event center]  n 8  clusters 7
(And (Member $e0 use) (Agent $e0 $x1))
;;      c112  mass 2  {localized versions}
;;     c1007  mass 1  {human brain}
;;     c1202  mass 1  {singer}
;;       c14  mass 1  {ukrainian army}
;;     c1612  mass 1  {Dad}
;;      c262  mass 1  {algerian government}
;;      c791  mass 1  {Churchill}

;; ---- slot walk.Agent  [event center]  n 8  clusters 8
(And (Member $e0 walk) (Agent $e0 $x1))
;;     c1554  mass 1  {school janitor}
;;     c3245  mass 1  {ant}
;;       c81  mass 1  {customers}
;;      c835  mass 1  {Hanako}
;;      c863  mass 1  {Michael}
;;      c880  mass 1  {Felix}
;;      c920  mass 1  {Leon}
;;      c934  mass 1  {Adriano}

;; ---- slot want.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 want) (Experiencer $e0 $x1))
;;      c770  mass 2  {Aslan}
;;     c1329  mass 1  {Pepper}
;;     c1421  mass 1  {cat}
;;      c885  mass 1  {Tony}
;;      c920  mass 1  {Leon}
;;      c924  mass 1  {Edmundo}
;;      c928  mass 1  {Benedito}

;; ---- slot work.Agent  [event center]  n 8  clusters 8
(And (Member $e0 work) (Agent $e0 $x1))
;;     c1215  mass 1  {adaptor, old}
;;     c1556  mass 1  {volunteers}
;;     c1593  mass 1  {person}
;;     c1612  mass 1  {Dad}
;;      c855  mass 1  {Dmitri}
;;      c904  mass 1  {Asserson}
;;      c940  mass 1  {Dan}
;;      c953  mass 1  {Mr. Jones}

;; ---- slot write.Agent  [event center]  n 8  clusters 5
(And (Member $e0 write) (Agent $e0 $x1))
;;     c1593  mass 2  {person}
;;      c872  mass 2  {Gilles Thibaut}
;;      c985  mass 2  {Bill Wrubel}
;;     c1613  mass 1  {busy, father}
;;     c1654  mass 1  {famous, person}

;; ---- slot come.Agent  [event center]  n 7  clusters 7
(And (Member $e0 come) (Agent $e0 $x1))
;;     c1044  mass 1  {students}
;;     c1614  mass 1  {men}
;;     c2342  mass 1  {sleep}
;;     c2401  mass 1  {train}
;;     c2426  mass 1  {discussion}
;;      c316  mass 1  {countries}
;;      c673  mass 1  {bus}

;; ---- slot contain.Agent  [event center]  n 7  clusters 5
(And (Member $e0 contain) (Agent $e0 $x1))
;;     c1145  mass 3  {cards, deck}
;;     c1148  mass 1  {chest}
;;     c1200  mass 1  {song}
;;     c1217  mass 1  {plasma}
;;      c159  mass 1  {vitamin pill}

;; ---- slot contain.Theme  [event center]  n 7  clusters 7
(And (Member $e0 contain) (Theme $e0 $x1))
;;     c1198  mass 1  {degrading, lyric}
;;      c178  mass 1  {queens}
;;     c2160  mass 1  {jacks}
;;     c2450  mass 1  {abundant, nutrition}
;;      c534  mass 1  {electrolyte, electrolytes}
;;      c548  mass 1  {gold coin, gold coins}
;;      c785  mass 1  {kings}

;; ---- slot create.Patient  [event center]  n 7  clusters 4
(And (Member $e0 create) (Patient $e0 $x1))
;;     c1028  mass 4  {community}
;;     c2553  mass 1  {language, new}
;;      c395  mass 1  {calendars, various}
;;       c67  mass 1  {particle accelerator}

;; ---- slot form.Agent  [event center]  n 7  clusters 5
(And (Member $e0 form) (Agent $e0 $x1))
;;      c962  mass 2  {Jon Bon Jovi}
;;      c963  mass 2  {Sambora}
;;     c1550  mass 1  {labourers}
;;     c2491  mass 1  {complex, simple}
;;      c531  mass 1  {technetium}

;; ---- slot get.Patient  [event center]  n 7  clusters 7
(And (Member $e0 get) (Patient $e0 $x1))
;;     c1836  mass 1  {bad, problem}
;;     c2003  mass 1  {big, fire}
;;     c2048  mass 1  {bad, weather}
;;     c2246  mass 1  {expensive, thing}
;;     c2253  mass 1  {cheap, excuses}
;;     c2348  mass 1  {days, short}
;;      c295  mass 1  {Iran}

;; ---- slot make.Result  [event center]  n 7  clusters 7
(And (Member $e0 make) (Result $e0 $x1))
;;     c1673  mass 1  {backward, country}
;;     c1802  mass 1  {uncomfortable}
;;     c1835  mass 1  {bad}
;;     c1849  mass 1  {hazardous}
;;     c2215  mass 1  {beautiful}
;;     c2603  mass 1  {white}
;;      c783  mass 1  {king}

;; ---- slot sell.Theme  [event center]  n 7  clusters 6
(And (Member $e0 sell) (Theme $e0 $x1))
;;     c1256  mass 2  {ice cream}
;;     c1283  mass 1  {milk}
;;     c1340  mass 1  {beans, roasted}
;;     c2108  mass 1  {cell phone, new}
;;     c2509  mass 1  {copies}
;;     c2962  mass 1  {thing}

;; ---- slot serve.Theme  [event center]  n 7  clusters 4
(And (Member $e0 serve) (Theme $e0 $x1))
;;      c218  mass 3  {Springfield Station}
;;      c199  mass 2  {Springfield}
;;     c1793  mass 1  {revenge}
;;       c86  mass 1  {coffee}

;; ---- slot try.Theme  [event center]  n 7  clusters 7
(And (Member $e0 try) (Theme $e0 $x1))
;;     c2605  mass 1  {burnish}
;;     c3022  mass 1  {pull}
;;     c3032  mass 1  {reach}
;;     c3204  mass 1  {give up}
;;      c482  mass 1  {steal}
;;      c506  mass 1  {abuse}
;;       c75  mass 1  {call}

;; ---- slot turn.Patient  [event center]  n 7  clusters 7
(And (Member $e0 turn) (Patient $e0 $x1))
;;     c1373  mass 1  {leaves, red, yellow}
;;     c1906  mass 1  {black, ceiling}
;;     c2362  mass 1  {war}
;;       c31  mass 1  {russian speech}
;;      c598  mass 1  {freedom movement, gusher}
;;      c711  mass 1  {roads}
;;      c925  mass 1  {Gustavo}

;; ---- slot win.Agent  [event center]  n 7  clusters 5
(And (Member $e0 win) (Agent $e0 $x1))
;;      c792  mass 2  {Wilson}
;;      c949  mass 2  {James Woods}
;;     c1480  mass 1  {horse}
;;     c2301  mass 1  {away team}
;;      c793  mass 1  {wilson}

;; ---- slot <unclassed>.Only  [entity center]  n 6  clusters 4
(Only $x0 $x1)
;;     c3069  mass 2  {have}
;;     c3263  mass 2  {find}
;;     c1577  mass 1  {solve}
;;     c3226  mass 1  {like}

;; ---- slot appear.Agent  [event center]  n 6  clusters 3
(And (Member $e0 appear) (Agent $e0 $x1))
;;     c1593  mass 3  {person}
;;      c975  mass 2  {Brian Packham}
;;     c1581  mass 1  {sisters}

;; ---- slot bear.Patient  [event center]  n 6  clusters 4
(And (Member $e0 bear) (Patient $e0 $x1))
;;     c1593  mass 3  {person}
;;     c1841  mass 1  {man, poor}
;;      c773  mass 1  {Tycho Brahe}
;;      c917  mass 1  {Tobias}

;; ---- slot build.Instrument  [event center]  n 6  clusters 3
(And (Member $e0 build) (Instrument $e0 $x1))
;;     c2054  mass 2  {barometer}
;;     c2085  mass 2  {presented in scale, presented, scale}
;;     c3028  mass 2  {help}

;; ---- slot capture.Theme  [event center]  n 6  clusters 6
(And (Member $e0 capture) (Theme $e0 $x1))
;;     c1454  mass 1  {magpie}
;;     c1663  mass 1  {Valerian}
;;       c17  mass 1  {merchant ship}
;;       c18  mass 1  {british ship}
;;      c235  mass 1  {capital}
;;      c266  mass 1  {algerian city, algerian cities}

;; ---- slot cause.Agent  [event center]  n 6  clusters 6
(And (Member $e0 cause) (Agent $e0 $x1))
;;     c1094  mass 1  {tides}
;;     c1431  mass 1  {demon}
;;     c2028  mass 1  {storm}
;;     c2963  mass 1  {things}
;;      c582  mass 1  {news}
;;      c704  mass 1  {walk}

;; ---- slot create.Agent  [event center]  n 6  clusters 4
(And (Member $e0 create) (Agent $e0 $x1))
;;      c121  mass 2  {native american, indigenous american, indigenous americans, native americans}
;;      c132  mass 2  {european american settlers}
;;      c593  mass 1  {writer}
;;      c846  mass 1  {Paul}

;; ---- slot enter.Agent  [event center]  n 6  clusters 5
(And (Member $e0 enter) (Agent $e0 $x1))
;;     c1061  mass 2  {Lake Sammamish}
;;     c1592  mass 1  {people}
;;      c368  mass 1  {muslim, muslims}
;;      c806  mass 1  {Layla}
;;      c936  mass 1  {Martino}

;; ---- slot form.Patient  [event center]  n 6  clusters 4
(And (Member $e0 form) (Patient $e0 $x1))
;;     c1182  mass 3  {main songwriting unit, main, songwriting unit}
;;     c2491  mass 1  {complex, simple}
;;      c531  mass 1  {technetium}
;;      c747  mass 1  {human barricade}

;; ---- slot fund.Agent  [event center]  n 6  clusters 3
(And (Member $e0 fund) (Agent $e0 $x1))
;;      c338  mass 3  {JICA}
;;      c644  mass 2  {government}
;;      c273  mass 1  {Government of Uganda}

;; ---- slot get.Agent  [event center]  n 6  clusters 6
(And (Member $e0 get) (Agent $e0 $x1))
;;     c1633  mass 1  {man, young}
;;     c2962  mass 1  {thing}
;;      c860  mass 1  {Leonid}
;;      c916  mass 1  {Gabriel}
;;      c923  mass 1  {Diego}
;;      c929  mass 1  {Janos}

;; ---- slot get.Result  [event center]  n 6  clusters 6
(And (Member $e0 get) (Result $e0 $x1))
;;     c1835  mass 1  {bad}
;;     c2245  mass 1  {expensive}
;;     c2247  mass 1  {cheap}
;;     c2476  mass 1  {powerful}
;;     c2945  mass 1  {short}
;;     c3044  mass 1  {ready}

;; ---- slot help.Agent  [event center]  n 6  clusters 6
(And (Member $e0 help) (Agent $e0 $x1))
;;     c1990  mass 1  {hothouse condition, hothouse conditions}
;;     c2817  mass 1  {life experience}
;;     c2955  mass 1  {context}
;;      c863  mass 1  {Michael}
;;      c886  mass 1  {Jonas}
;;      c942  mass 1  {Karen}

;; ---- slot receive.Theme  [event center]  n 6  clusters 5
(And (Member $e0 receive) (Theme $e0 $x1))
;;     c1531  mass 2  {work}
;;     c3019  mass 1  {award}
;;     c3193  mass 1  {permit}
;;     c3292  mass 1  {honorary knighthood}
;;      c678  mass 1  {car, new}

;; ---- slot run.Agent  [event center]  n 6  clusters 5
(And (Member $e0 run) (Agent $e0 $x1))
;;      c958  mass 2  {George Allen, Chuck Robb}
;;      c148  mass 1  {doctor}
;;     c1481  mass 1  {goat}
;;     c1492  mass 1  {squirrel}
;;      c917  mass 1  {Tobias}

;; ---- slot sleep.Experiencer  [event center]  n 6  clusters 5
(And (Member $e0 sleep) (Experiencer $e0 $x1))
;;     c1421  mass 2  {cat}
;;     c1415  mass 1  {dog}
;;     c1639  mass 1  {children, kids}
;;     c1640  mass 1  {child, kid}
;;      c842  mass 1  {Baya}

;; ---- slot speak.Theme  [event center]  n 6  clusters 5
(And (Member $e0 speak) (Theme $e0 $x1))
;;      c903  mass 2  {Ashe}
;;     c1705  mass 1  {english}
;;     c2606  mass 1  {polish}
;;       c32  mass 1  {czech}
;;      c626  mass 1  {foreign language, foreign, language}

;; ---- slot start.Agent  [event center]  n 6  clusters 6
(And (Member $e0 start) (Agent $e0 $x1))
;;     c1307  mass 1  {cook}
;;     c1554  mass 1  {school janitor}
;;     c1645  mass 1  {girls}
;;     c1739  mass 1  {crowd, whole}
;;      c840  mass 1  {Skura}
;;      c867  mass 1  {Karl}

;; ---- slot study.Location  [event center]  n 6  clusters 4
(And (Member $e0 study) (Location $e0 $x1))
;;      c780  mass 2  {Davis Studio}
;;      c782  mass 2  {Julian Ashton Art School}
;;     c1047  mass 1  {university}
;;      c214  mass 1  {Munich}

;; ---- slot write.CoAgent  [event center]  n 6  clusters 3
(And (Member $e0 write) (CoAgent $e0 $x1))
;;      c808  mass 2  {Laurie Aubanel}
;;      c811  mass 2  {Bianca Olsen}
;;      c991  mass 2  {Cyril Rambour}

;; ---- slot add.Agent  [event center]  n 5  clusters 4
(And (Member $e0 add) (Agent $e0 $x1))
;;     c2962  mass 2  {thing}
;;     c1307  mass 1  {cook}
;;     c1386  mass 1  {plants}
;;      c960  mass 1  {J. Augustus Knapp}

;; ---- slot appear.Location  [event center]  n 5  clusters 4
(And (Member $e0 appear) (Location $e0 $x1))
;;       c89  mass 2  {cafe}
;;     c1690  mass 1  {comedic role}
;;      c344  mass 1  {musical film}
;;        c7  mass 1  {Coronation Street}

;; ---- slot buy.Theme  [event center]  n 5  clusters 5
(And (Member $e0 buy) (Theme $e0 $x1))
;;     c1323  mass 1  {food}
;;     c1936  mass 1  {house}
;;     c2114  mass 1  {computer}
;;      c553  mass 1  {blue, shirt}
;;      c564  mass 1  {trouser, yellow}

;; ---- slot cry.Agent  [event center]  n 5  clusters 5
(And (Member $e0 cry) (Agent $e0 $x1))
;;     c1117  mass 1  {Rima}
;;     c1645  mass 1  {girls}
;;      c840  mass 1  {Skura}
;;      c842  mass 1  {Baya}
;;      c927  mass 1  {Alberto}

;; ---- slot direct.Agent  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Agent $e0 $x1))
;;      c969  mass 2  {Lev L. Spiro}
;;     c1212  mass 1  {conductor}
;;      c801  mass 1  {Claude Lelouch}
;;      c980  mass 1  {Robert Day}

;; ---- slot direct.Patient  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Patient $e0 $x1))
;;     c2142  mass 2  {episode}
;;     c2962  mass 1  {thing}
;;      c341  mass 1  {syrian film, film, syrian film}
;;      c343  mass 1  {movie, film}

;; ---- slot draw.Agent  [event center]  n 5  clusters 4
(And (Member $e0 draw) (Agent $e0 $x1))
;;      c956  mass 2  {Cowper}
;;     c1639  mass 1  {children, kids}
;;     c1640  mass 1  {child, kid}
;;     c1753  mass 1  {concert}

;; ---- slot eat.Patient  [event center]  n 5  clusters 4
(And (Member $e0 eat) (Patient $e0 $x1))
;;     c1223  mass 2  {cookie, cookies}
;;     c1297  mass 1  {bread}
;;     c1311  mass 1  {chicken}
;;     c1489  mass 1  {rabbit}

;; ---- slot fly.Agent  [event center]  n 5  clusters 5
(And (Member $e0 fly) (Agent $e0 $x1))
;;     c1113  mass 1  {rocket}
;;     c1450  mass 1  {insect, insects}
;;     c1458  mass 1  {eagle}
;;      c656  mass 1  {plane}
;;      c779  mass 1  {Superman}

;; ---- slot include.Theme  [event center]  n 5  clusters 5
(And (Member $e0 include) (Theme $e0 $x1))
;;     c1206  mass 1  {marching band, marching bands}
;;      c141  mass 1  {extradition clause}
;;      c751  mass 1  {Armaan Jain}
;;      c752  mass 1  {Ranbir Kapoor}
;;      c753  mass 1  {Nikhil Nanda}

;; ---- slot lead.Agent  [event center]  n 5  clusters 4
(And (Member $e0 lead) (Agent $e0 $x1))
;;     c2962  mass 2  {thing}
;;     c1049  mass 1  {education}
;;     c1415  mass 1  {dog}
;;     c2501  mass 1  {general}

;; ---- slot lead.Goal  [event center]  n 5  clusters 5
(And (Member $e0 lead) (Goal $e0 $x1))
;;     c1419  mass 1  {big, cat fight}
;;     c1665  mass 1  {glory, lost}
;;     c1935  mass 1  {home}
;;     c2184  mass 1  {peace}
;;     c2196  mass 1  {happiness}

;; ---- slot marry.Agent  [event center]  n 5  clusters 4
(And (Member $e0 marry) (Agent $e0 $x1))
;;      c817  mass 2  {Margaret Fleming}
;;      c828  mass 1  {Nancy}
;;      c873  mass 1  {James of Barrochan}
;;      c993  mass 1  {Steve}

;; ---- slot need.Theme  [event center]  n 5  clusters 5
(And (Member $e0 need) (Theme $e0 $x1))
;;      c104  mass 1  {go}
;;     c2077  mass 1  {paint}
;;     c2392  mass 1  {run}
;;     c2756  mass 1  {generate}
;;     c2792  mass 1  {understand}

;; ---- slot portray.Agent  [event center]  n 5  clusters 4
(And (Member $e0 portray) (Agent $e0 $x1))
;;      c834  mass 2  {Soichiro Akizuki}
;;      c792  mass 1  {Wilson}
;;      c793  mass 1  {wilson}
;;      c949  mass 1  {James Woods}

;; ---- slot portray.Theme  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Theme $e0 $x1))
;;      c845  mass 2  {Kantaro Suga}
;;      c949  mass 2  {James Woods}
;;      c792  mass 1  {Wilson}

;; ---- slot present.Theme  [event center]  n 5  clusters 4
(And (Member $e0 present) (Theme $e0 $x1))
;;     c1200  mass 2  {song}
;;     c2080  mass 1  {picture}
;;     c2421  mass 1  {play}
;;     c2572  mass 1  {golden opportunity}

;; ---- slot provide.Agent  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Agent $e0 $x1))
;;     c1278  mass 1  {kitchen island}
;;     c1737  mass 1  {witnesses}
;;     c2274  mass 1  {organisation}
;;      c436  mass 1  {power station}
;;      c578  mass 1  {media}

;; ---- slot provide.Theme  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Theme $e0 $x1))
;;     c1323  mass 1  {food}
;;     c1702  mass 1  {plurivocality}
;;     c2138  mass 1  {counter space, extra}
;;     c2265  mass 1  {descriptions, detailed}
;;      c434  mass 1  {electricity}

;; ---- slot ready.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 ready) (Experiencer $e0 $x1))
;;     c1301  mass 1  {cake}
;;     c1317  mass 1  {dinner}
;;      c840  mass 1  {Skura}
;;      c860  mass 1  {Leonid}
;;      c966  mass 1  {Yanni}

;; ---- slot sell.Agent  [event center]  n 5  clusters 4
(And (Member $e0 sell) (Agent $e0 $x1))
;;     c1537  mass 2  {company}
;;      c579  mass 1  {newspaper, newspapers}
;;       c85  mass 1  {coffee brand, indie}
;;      c906  mass 1  {Mennad}

;; ---- slot sing.Theme  [event center]  n 5  clusters 2
(And (Member $e0 sing) (Theme $e0 $x1))
;;     c1194  mass 4  {music}
;;     c1200  mass 1  {song}

;; ---- slot sing.To  [event center]  n 5  clusters 2
(And (Member $e0 sing) (To $e0 $x1))
;;     c2655  mass 4  {accompany}
;;     c1195  mass 1  {music, sad}

;; ---- slot sleep.Location  [event center]  n 5  clusters 3
(And (Member $e0 sleep) (Location $e0 $x1))
;;     c1949  mass 3  {couch}
;;     c1570  mass 1  {mat}
;;     c2853  mass 1  {inside}

;; ---- slot stand.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 stand) (Experiencer $e0 $x1))
;;     c1044  mass 1  {students}
;;     c2501  mass 1  {general}
;;      c923  mass 1  {Diego}
;;      c924  mass 1  {Edmundo}
;;      c927  mass 1  {Alberto}

;; ---- slot start.Experiencer  [event center]  n 5  clusters 4
(And (Member $e0 start) (Experiencer $e0 $x1))
;;      c232  mass 2  {bridge}
;;     c1004  mass 1  {tunnel}
;;      c852  mass 1  {Oleg}
;;      c919  mass 1  {Gunter}

;; ---- slot study.Theme  [event center]  n 5  clusters 5
(And (Member $e0 study) (Theme $e0 $x1))
;;      c171  mass 1  {bacterium, new}
;;      c271  mass 1  {Arabic}
;;     c3086  mass 1  {rate}
;;      c430  mass 1  {mechanical engineering}
;;      c617  mass 1  {canon law}

;; ---- slot swim.Agent  [event center]  n 5  clusters 4
(And (Member $e0 swim) (Agent $e0 $x1))
;;     c1412  mass 2  {fish, school}
;;     c1411  mass 1  {fish, red}
;;     c1639  mass 1  {children, kids}
;;      c825  mass 1  {Linda}

;; ---- slot travel.Agent  [event center]  n 5  clusters 4
(And (Member $e0 travel) (Agent $e0 $x1))
;;     c1592  mass 2  {people}
;;      c638  mass 1  {campaigner}
;;      c866  mass 1  {Matthew}
;;      c893  mass 1  {Roger}

;; ---- slot turn.Result  [event center]  n 5  clusters 5
(And (Member $e0 turn) (Result $e0 $x1))
;;     c1457  mass 1  {crow}
;;     c2373  mass 1  {red}
;;     c2596  mass 1  {yellow}
;;     c2602  mass 1  {black}
;;      c599  mass 1  {gusher}

;; ---- slot watch.Agent  [event center]  n 5  clusters 5
(And (Member $e0 watch) (Agent $e0 $x1))
;;     c1040  mass 1  {coach}
;;     c1592  mass 1  {people}
;;     c1596  mass 1  {family}
;;      c644  mass 1  {government}
;;      c842  mass 1  {Baya}

;; ---- slot win.Theme  [event center]  n 5  clusters 2
(And (Member $e0 win) (Theme $e0 $x1))
;;      c763  mass 4  {emmy}
;;      c507  mass 1  {race}

;; ---- slot bad.Between  [entity center]  n 4  clusters 2
(And (Member $x0 bad) (Between $x0 $x1))
;;      c331  mass 2  {Poland}
;;      c335  mass 2  {Germany}

;; ---- slot beauty.Possession  [entity center]  n 4  clusters 4
(And (Member $x0 beauty) (Possession $x0 $x1))
;;     c1063  mass 1  {Lake Towada, Lake Akan}
;;     c1128  mass 1  {scenery}
;;     c1562  mass 1  {sex}
;;     c1765  mass 1  {sight}

;; ---- slot family.Possession  [entity center]  n 4  clusters 1
(And (Member $x0 family) (Possession $x0 $x1))
;;     c1593  mass 4  {person}

;; ---- slot northern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 northern) (LocatedIn $x0 $x1))
;;      c307  mass 2  {India}
;;      c330  mass 2  {Estonia}

;; ---- slot southern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 southern) (LocatedIn $x0 $x1))
;;      c285  mass 2  {North Africa}
;;      c307  mass 2  {India}

;; ---- slot accompany.Agent  [event center]  n 4  clusters 2
(And (Member $e0 accompany) (Agent $e0 $x1))
;;     c1581  mass 2  {sisters}
;;     c1593  mass 2  {person}

;; ---- slot accompany.Theme  [event center]  n 4  clusters 1
(And (Member $e0 accompany) (Theme $e0 $x1))
;;      c345  mass 4  {silent film}

;; ---- slot active.Time  [event center]  n 4  clusters 2
(And (Member $e0 active) (Time $e0 $x1))
;;     c2325  mass 2  {early morning}
;;     c2351  mass 2  {late afternoon}

;; ---- slot add.Theme  [event center]  n 4  clusters 3
(And (Member $e0 add) (Theme $e0 $x1))
;;     c2074  mass 2  {illustrations}
;;     c1327  mass 1  {cloves}
;;     c1375  mass 1  {greenery}

;; ---- slot arrive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 arrive) (Agent $e0 $x1))
;;      c103  mass 1  {spring}
;;      c665  mass 1  {paris train}
;;      c677  mass 1  {driver}
;;      c875  mass 1  {Donald}

;; ---- slot avoid.Theme  [event center]  n 4  clusters 4
(And (Member $e0 avoid) (Theme $e0 $x1))
;;     c1829  mass 1  {pitfalls}
;;     c2962  mass 1  {thing}
;;     c3161  mass 1  {conform}
;;      c458  mass 1  {bankruptcy}

;; ---- slot bad.Experiencer  [event center]  n 4  clusters 3
(And (Member $e0 bad) (Experiencer $e0 $x1))
;;     c1838  mass 2  {bad, relationship}
;;     c1837  mass 1  {bad, matter}
;;     c2048  mass 1  {bad, weather}

;; ---- slot bear.Location  [event center]  n 4  clusters 3
(And (Member $e0 bear) (Location $e0 $x1))
;;      c210  mass 2  {Bromma}
;;     c1083  mass 1  {planet}
;;      c332  mass 1  {Denmark}

;; ---- slot begin.Patient  [event center]  n 4  clusters 4
(And (Member $e0 begin) (Patient $e0 $x1))
;;     c1050  mass 1  {school}
;;     c1398  mass 1  {trees}
;;     c2353  mass 1  {night}
;;     c2382  mass 1  {uprising}

;; ---- slot bring.Theme  [event center]  n 4  clusters 4
(And (Member $e0 bring) (Theme $e0 $x1))
;;       c18  mass 1  {british ship}
;;       c23  mass 1  {chinese dumpling}
;;     c2500  mass 1  {advantage}
;;      c887  mass 1  {Jonathan}

;; ---- slot capture.Agent  [event center]  n 4  clusters 4
(And (Member $e0 capture) (Agent $e0 $x1))
;;     c1468  mass 1  {falcon}
;;      c325  mass 1  {Spain}
;;      c491  mass 1  {pirates}
;;      c740  mass 1  {troops}

;; ---- slot cause.Patient  [event center]  n 4  clusters 4
(And (Member $e0 cause) (Patient $e0 $x1))
;;     c1178  mass 1  {creaking, sound}
;;     c1860  mass 1  {damage}
;;       c69  mass 1  {earthquakes}
;;       c73  mass 1  {abandonment anxiety}

;; ---- slot change.Agent  [event center]  n 4  clusters 4
(And (Member $e0 change) (Agent $e0 $x1))
;;     c1371  mass 1  {leaves}
;;     c1618  mass 1  {man}
;;      c319  mass 1  {French Dahomey}
;;      c790  mass 1  {Cameron}

;; ---- slot close.Experiencer  [event center]  n 4  clusters 2
(And (Member $e0 close) (Experiencer $e0 $x1))
;;       c37  mass 3  {Low German}
;;      c877  mass 1  {Boldi}

;; ---- slot come.Source  [event center]  n 4  clusters 4
(And (Member $e0 come) (Source $e0 $x1))
;;     c1369  mass 1  {garden}
;;     c1945  mass 1  {places}
;;     c2397  mass 1  {treeline}
;;      c386  mass 1  {greek}

;; ---- slot connect.Theme  [event center]  n 4  clusters 3
(And (Member $e0 connect) (Theme $e0 $x1))
;;     c1070  mass 2  {Kayalar}
;;      c189  mass 1  {Nagoya, Osaka}
;;      c190  mass 1  {Tokyo}

;; ---- slot create.Location  [event center]  n 4  clusters 1
(And (Member $e0 create) (Location $e0 $x1))
;;     c2124  mass 4  {post}

;; ---- slot decide.Agent  [event center]  n 4  clusters 3
(And (Member $e0 decide) (Agent $e0 $x1))
;;      c858  mass 2  {Fyodor}
;;      c823  mass 1  {Beth}
;;      c915  mass 1  {Elias}

;; ---- slot design.Agent  [event center]  n 4  clusters 3
(And (Member $e0 design) (Agent $e0 $x1))
;;      c983  mass 2  {Henry L. Taylor}
;;       c21  mass 1  {Robert Allan Limited}
;;      c974  mass 1  {Philip Hercus}

;; ---- slot design.Patient  [event center]  n 4  clusters 2
(And (Member $e0 design) (Patient $e0 $x1))
;;     c2183  mass 2  {pacificat, pacificats}
;;     c2962  mass 2  {thing}

;; ---- slot die.Patient  [event center]  n 4  clusters 3
(And (Member $e0 die) (Patient $e0 $x1))
;;     c1593  mass 2  {person}
;;     c1592  mass 1  {people}
;;     c1595  mass 1  {families}

;; ---- slot discover.Theme  [event center]  n 4  clusters 3
(And (Member $e0 discover) (Theme $e0 $x1))
;;     c1594  mass 2  {name}
;;     c2543  mass 1  {magnet, new, type}
;;       c51  mass 1  {pterosaur egg, pterosaur eggs}

;; ---- slot do.Patient  [event center]  n 4  clusters 4
(And (Member $e0 do) (Patient $e0 $x1))
;;     c1316  mass 1  {dishes}
;;     c1685  mass 1  {dance, little}
;;     c2962  mass 1  {thing}
;;     c2963  mass 1  {things}

;; ---- slot eat.Agent  [event center]  n 4  clusters 4
(And (Member $e0 eat) (Agent $e0 $x1))
;;     c1413  mass 1  {brown, dog}
;;     c1461  mass 1  {birds}
;;     c1593  mass 1  {person}
;;     c1639  mass 1  {children, kids}

;; ---- slot encourage.In  [event center]  n 4  clusters 3
(And (Member $e0 encourage) (In $e0 $x1))
;;     c1571  mass 2  {mathematics}
;;      c409  mass 1  {chess}
;;      c410  mass 1  {chess play}

;; ---- slot enter.Theme  [event center]  n 4  clusters 4
(And (Member $e0 enter) (Theme $e0 $x1))
;;     c1060  mass 1  {Issaquah Creek}
;;     c1914  mass 1  {cave}
;;      c313  mass 1  {United States}
;;      c696  mass 1  {park}

;; ---- slot find.Agent  [event center]  n 4  clusters 3
(And (Member $e0 find) (Agent $e0 $x1))
;;      c689  mass 2  {Couper}
;;      c933  mass 1  {Flavio}
;;      c938  mass 1  {Pietro}

;; ---- slot get.Theme  [event center]  n 4  clusters 4
(And (Member $e0 get) (Theme $e0 $x1))
;;     c1324  mass 1  {snack}
;;     c1491  mass 1  {hamster}
;;     c2249  mass 1  {low, price}
;;      c478  mass 1  {arrest}

;; ---- slot give.Theme  [event center]  n 4  clusters 4
(And (Member $e0 give) (Theme $e0 $x1))
;;     c1254  mass 1  {mock champagne}
;;     c1261  mass 1  {chocolate}
;;     c2499  mass 1  {advice, good}
;;     c2962  mass 1  {thing}

;; ---- slot good.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 good) (Experiencer $e0 $x1))
;;     c1287  mass 1  {barley bread}
;;     c2049  mass 1  {weather}
;;     c2962  mass 1  {thing}
;;      c650  mass 1  {windshield}

;; ---- slot help.Theme  [event center]  n 4  clusters 4
(And (Member $e0 help) (Theme $e0 $x1))
;;     c1592  mass 1  {people}
;;     c1644  mass 1  {girl}
;;     c2447  mass 1  {thrive}
;;     c2769  mass 1  {define}

;; ---- slot include.Agent  [event center]  n 4  clusters 2
(And (Member $e0 include) (Agent $e0 $x1))
;;     c1635  mass 3  {nephews}
;;     c1668  mass 1  {parade}

;; ---- slot increase.Patient  [event center]  n 4  clusters 4
(And (Member $e0 increase) (Patient $e0 $x1))
;;       c13  mass 1  {ukrainian combat loss, ukrainian combat losses}
;;      c439  mass 1  {industrial output}
;;      c508  mass 1  {xenophobia}
;;      c682  mass 1  {motor vehicle, motor vehicles}

;; ---- slot jump.Agent  [event center]  n 4  clusters 4
(And (Member $e0 jump) (Agent $e0 $x1))
;;     c1418  mass 1  {brown, fox, quick}
;;     c1479  mass 1  {donkey}
;;     c1484  mass 1  {cow}
;;     c1637  mass 1  {boys}

;; ---- slot kill.Location  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Location $e0 $x1))
;;      c647  mass 3  {state}
;;     c3026  mass 1  {here}

;; ---- slot kill.Manner  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Manner $e0 $x1))
;;     c2641  mass 2  {indirectly}
;;     c3233  mass 2  {direct, directly}

;; ---- slot lie.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 lie) (Experiencer $e0 $x1))
;;     c1160  mass 1  {tape recorder}
;;     c2106  mass 1  {notebook}
;;     c3071  mass 1  {pen}
;;      c587  mass 1  {book}

;; ---- slot lie.Location  [event center]  n 4  clusters 1
(And (Member $e0 lie) (Location $e0 $x1))
;;     c2105  mass 4  {table}

;; ---- slot look.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 look) (Experiencer $e0 $x1))
;;     c1050  mass 1  {school}
;;     c1102  mass 1  {island}
;;      c283  mass 1  {Europe, Western Europe}
;;      c720  mass 1  {flag}

;; ---- slot look.Like  [event center]  n 4  clusters 4
(And (Member $e0 look) (Like $e0 $x1))
;;     c1445  mass 1  {huge, spider}
;;     c1667  mass 1  {paradise}
;;      c475  mass 1  {prison}
;;      c718  mass 1  {inverted, philippine flag}

;; ---- slot move.Agent  [event center]  n 4  clusters 3
(And (Member $e0 move) (Agent $e0 $x1))
;;     c1548  mass 2  {headquarters}
;;     c1412  mass 1  {fish, school}
;;      c899  mass 1  {Sammy}

;; ---- slot perform.Location  [event center]  n 4  clusters 3
(And (Member $e0 perform) (Location $e0 $x1))
;;       c89  mass 2  {cafe}
;;     c1935  mass 1  {home}
;;     c2979  mass 1  {public}

;; ---- slot preach.Agent  [event center]  n 4  clusters 1
(And (Member $e0 preach) (Agent $e0 $x1))
;;     c1593  mass 4  {person}

;; ---- slot preach.Location  [event center]  n 4  clusters 2
(And (Member $e0 preach) (Location $e0 $x1))
;;      c209  mass 2  {Gareccio}
;;      c324  mass 2  {Italy}

;; ---- slot present.Agent  [event center]  n 4  clusters 3
(And (Member $e0 present) (Agent $e0 $x1))
;;      c913  mass 2  {Horner}
;;     c1537  mass 1  {company}
;;     c2572  mass 1  {golden opportunity}

;; ---- slot receive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 receive) (Agent $e0 $x1))
;;      c139  mass 1  {refugees}
;;     c3018  mass 1  {winner}
;;      c735  mass 1  {General Franks}
;;      c823  mass 1  {Beth}

;; ---- slot replace.Agent  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Agent $e0 $x1))
;;      c984  mass 2  {Sherman Howard}
;;     c1593  mass 1  {person}
;;      c988  mass 1  {Peter Gaussen}

;; ---- slot replace.Theme  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Theme $e0 $x1))
;;      c778  mass 2  {Lex Lex Luthor, Lex Luthor}
;;     c1593  mass 1  {person}
;;      c971  mass 1  {William Ewer}

;; ---- slot require.Theme  [event center]  n 4  clusters 4
(And (Member $e0 require) (Theme $e0 $x1))
;;     c1144  mass 1  {id card, valid}
;;     c1533  mass 1  {hard, work}
;;      c433  mass 1  {repairs}
;;       c78  mass 1  {american phone number}

;; ---- slot specify.In  [event center]  n 4  clusters 2
(And (Member $e0 specify) (In $e0 $x1))
;;     c1873  mass 2  {continuous time}
;;     c1874  mass 2  {discrete time}

;; ---- slot spend.Agent  [event center]  n 4  clusters 3
(And (Member $e0 spend) (Agent $e0 $x1))
;;     c1593  mass 2  {person}
;;     c1477  mass 1  {giraffes}
;;     c2315  mass 1  {May}

;; ---- slot star.Agent  [event center]  n 4  clusters 1
(And (Member $e0 star) (Agent $e0 $x1))
;;     c2962  mass 4  {thing}

;; ---- slot star.Theme  [event center]  n 4  clusters 2
(And (Member $e0 star) (Theme $e0 $x1))
;;      c810  mass 2  {Patricia Kaas}
;;      c950  mass 2  {Jeremy Irons}

;; ---- slot stop.Agent  [event center]  n 4  clusters 4
(And (Member $e0 stop) (Agent $e0 $x1))
;;     c1117  mass 1  {Rima}
;;     c1215  mass 1  {adaptor, old}
;;      c840  mass 1  {Skura}
;;      c966  mass 1  {Yanni}

;; ---- slot stop.Theme  [event center]  n 4  clusters 2
(And (Member $e0 stop) (Theme $e0 $x1))
;;     c1531  mass 2  {work}
;;     c2013  mass 2  {cry}

;; ---- slot support.Theme  [event center]  n 4  clusters 1
(And (Member $e0 support) (Theme $e0 $x1))
;;     c2090  mass 4  {views}

;; ---- slot use.Manner  [event center]  n 4  clusters 3
(And (Member $e0 use) (Manner $e0 $x1))
;;     c2651  mass 2  {rarely}
;;     c2532  mass 1  {responsibly}
;;     c2652  mass 1  {colloquially}

;; ---- slot use.To  [event center]  n 4  clusters 4
(And (Member $e0 use) (To $e0 $x1))
;;     c1055  mass 1  {learn}
;;     c1305  mass 1  {roast}
;;     c2753  mass 1  {make}
;;     c3037  mass 1  {develop}

;; ---- slot walk.Goal  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Goal $e0 $x1))
;;     c1054  mass 1  {classroom}
;;     c1393  mass 1  {forest}
;;     c2238  mass 1  {store}
;;     c3215  mass 1  {back, backward}

;; ---- slot walk.Location  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Location $e0 $x1))
;;     c1513  mass 1  {balloon, little}
;;     c1909  mass 1  {wood floor}
;;     c1963  mass 1  {hallway}
;;     c2591  mass 1  {dark}

;; ---- slot watch.Theme  [event center]  n 4  clusters 4
(And (Member $e0 watch) (Theme $e0 $x1))
;;     c2284  mass 1  {event}
;;     c2841  mass 1  {activities}
;;     c3293  mass 1  {natural hair video}
;;      c343  mass 1  {movie, film}

;; ---- slot win.For  [event center]  n 4  clusters 2
(And (Member $e0 win) (For $e0 $x1))
;;     c2069  mass 3  {portray}
;;     c2070  mass 1  {portrayal}

;; ---- slot work.Location  [event center]  n 4  clusters 4
(And (Member $e0 work) (Location $e0 $x1))
;;      c283  mass 1  {Europe, Western Europe}
;;      c380  mass 1  {Church of Norway}
;;      c438  mass 1  {factory}
;;      c479  mass 1  {prison kitchen}

;; ---- slot bottom.PartOf  [entity center]  n 3  clusters 2
(And (Member $x0 bottom) (PartOf $x0 $x1))
;;      c571  mass 2  {page}
;;     c1274  mass 1  {stew pot}

;; ---- slot fight.Against  [entity center]  n 3  clusters 3
(And (Member $x0 fight) (Against $x0 $x1))
;;     c2727  mass 1  {death}
;;     c2812  mass 1  {nature}
;;      c351  mass 1  {fate}

;; ---- slot thing.LocatedIn  [entity center]  n 3  clusters 2
(And (Member $x0 thing) (LocatedIn $x0 $x1))
;;     c1073  mass 2  {hills}
;;      c561  mass 1  {closet}

;; ---- slot active.Experiencer  [event center]  n 3  clusters 2
(And (Member $e0 active) (Experiencer $e0 $x1))
;;     c2962  mass 2  {thing}
;;      c904  mass 1  {Asserson}

;; ---- slot affect.Agent  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Agent $e0 $x1))
;;      c513  mass 3  {cyberattack}

;; ---- slot affect.Location  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Location $e0 $x1))
;;      c625  mass 3  {world}

;; ---- slot affect.Theme  [event center]  n 3  clusters 3
(And (Member $e0 affect) (Theme $e0 $x1))
;;      c153  mass 1  {hospital}
;;     c1537  mass 1  {company}
;;      c454  mass 1  {bank}

;; ---- slot affect.Time  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Time $e0 $x1))
;;     c3130  mass 3  {this year}

;; ---- slot approve.Theme  [event center]  n 3  clusters 3
(And (Member $e0 approve) (Theme $e0 $x1))
;;     c2263  mass 1  {treaty}
;;     c2278  mass 1  {plan}
;;     c2589  mass 1  {bill}

;; ---- slot attack.Patient  [event center]  n 3  clusters 3
(And (Member $e0 attack) (Patient $e0 $x1))
;;     c1943  mass 1  {building}
;;       c83  mass 1  {consumer rights}
;;      c926  mass 1  {Rodrigo}

;; ---- slot bake.Agent  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Agent $e0 $x1))
;;     c1537  mass 2  {company}
;;      c812  mass 1  {Ella}

;; ---- slot bake.Patient  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Patient $e0 $x1))
;;     c1255  mass 2  {ice cone, ice cream cone}
;;     c1242  mass 1  {pie, scrumptious}

;; ---- slot base.On  [event center]  n 3  clusters 3
(And (Member $e0 base) (On $e0 $x1))
;;     c2361  mass 1  {fight}
;;      c384  mass 1  {puritan value}
;;       c42  mass 1  {latin alphabet}

;; ---- slot beautiful.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 beautiful) (Experiencer $e0 $x1))
;;     c1110  mass 1  {beautiful, moon}
;;     c1969  mass 1  {beautiful, room}
;;     c2049  mass 1  {weather}

;; ---- slot break_out.Patient  [event center]  n 3  clusters 3
(And (Member $e0 break_out) (Patient $e0 $x1))
;;     c2000  mass 1  {fire}
;;     c2004  mass 1  {forest fire, forest fires}
;;     c2362  mass 1  {war}

;; ---- slot bring.Goal  [event center]  n 3  clusters 3
(And (Member $e0 bring) (Goal $e0 $x1))
;;     c2171  mass 1  {gallows}
;;      c308  mass 1  {Indonesia}
;;      c313  mass 1  {United States}

;; ---- slot buy.Agent  [event center]  n 3  clusters 2
(And (Member $e0 buy) (Agent $e0 $x1))
;;      c843  mass 2  {Keike}
;;      c911  mass 1  {Regis}

;; ---- slot close.Agent  [event center]  n 3  clusters 3
(And (Member $e0 close) (Agent $e0 $x1))
;;     c1587  mass 1  {female, giraffe}
;;      c654  mass 1  {pilot}
;;      c743  mass 1  {guard}

;; ---- slot close.Goal  [event center]  n 3  clusters 3
(And (Member $e0 close) (Goal $e0 $x1))
;;       c34  mass 1  {Dutch}
;;       c35  mass 1  {Frisian}
;;       c36  mass 1  {High German}

;; ---- slot close.Patient  [event center]  n 3  clusters 2
(And (Member $e0 close) (Patient $e0 $x1))
;;     c1923  mass 2  {door}
;;     c2238  mass 1  {store}

;; ---- slot come.Goal  [event center]  n 3  clusters 3
(And (Member $e0 come) (Goal $e0 $x1))
;;     c1753  mass 1  {concert}
;;     c2660  mass 1  {political, settlement}
;;     c2949  mass 1  {conclusion}

;; ---- slot come.Patient  [event center]  n 3  clusters 3
(And (Member $e0 come) (Patient $e0 $x1))
;;     c1173  mass 1  {sound}
;;     c1439  mass 1  {insect sound, insect sounds}
;;     c2027  mass 1  {typhoon}

;; ---- slot come_back.Agent  [event center]  n 3  clusters 3
(And (Member $e0 come_back) (Agent $e0 $x1))
;;     c1606  mass 1  {mother, mom}
;;     c1610  mass 1  {dad}
;;     c1636  mass 1  {boy}

;; ---- slot compose.Patient  [event center]  n 3  clusters 2
(And (Member $e0 compose) (Patient $e0 $x1))
;;     c1200  mass 2  {song}
;;     c1209  mass 1  {great, symphonies}

;; ---- slot conduct.Agent  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Agent $e0 $x1))
;;      c977  mass 2  {Carl Fenton}
;;      c724  mass 1  {FBI}

;; ---- slot conduct.Theme  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Theme $e0 $x1))
;;     c1211  mass 2  {orchestra}
;;     c1026  mass 1  {surveillance}

;; ---- slot cover.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Instrument $e0 $x1))
;;     c1388  mass 1  {weed}
;;     c2041  mass 1  {snow}
;;      c570  mass 1  {paper decoration, paper decorations}

;; ---- slot cover.Patient  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Patient $e0 $x1))
;;     c1961  mass 1  {courtyard}
;;     c3076  mass 1  {top}
;;      c421  mass 1  {shopping arcade}

;; ---- slot define.Theme  [event center]  n 3  clusters 2
(And (Member $e0 define) (Theme $e0 $x1))
;;     c2140  mass 2  {sequences}
;;     c2962  mass 1  {thing}

;; ---- slot die.Location  [event center]  n 3  clusters 2
(And (Member $e0 die) (Location $e0 $x1))
;;      c211  mass 2  {Stockholm}
;;     c2000  mass 1  {fire}

;; ---- slot drink.Patient  [event center]  n 3  clusters 2
(And (Member $e0 drink) (Patient $e0 $x1))
;;       c88  mass 2  {tea}
;;     c2022  mass 1  {good, water}

;; ---- slot drive.Agent  [event center]  n 3  clusters 2
(And (Member $e0 drive) (Agent $e0 $x1))
;;      c673  mass 2  {bus}
;;      c690  mass 1  {van}

;; ---- slot encourage.Agent  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Agent $e0 $x1))
;;      c897  mass 3  {Ralph}

;; ---- slot encourage.Theme  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Theme $e0 $x1))
;;      c881  mass 3  {Maurice}

;; ---- slot endorse.Theme  [event center]  n 3  clusters 1
(And (Member $e0 endorse) (Theme $e0 $x1))
;;     c2090  mass 3  {views}

;; ---- slot fall.Source  [event center]  n 3  clusters 3
(And (Member $e0 fall) (Source $e0 $x1))
;;     c1397  mass 1  {tree}
;;     c1957  mass 1  {shelf}
;;     c2051  mass 1  {sky}

;; ---- slot fight.Agent  [event center]  n 3  clusters 2
(And (Member $e0 fight) (Agent $e0 $x1))
;;      c114  mass 2  {kabye people}
;;     c1542  mass 1  {union bosses}

;; ---- slot fight.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fight) (Theme $e0 $x1))
;;     c2618  mass 1  {freeze}
;;      c361  mass 1  {islamic fundamentalism}
;;      c495  mass 1  {terrorism}

;; ---- slot fund.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fund) (Theme $e0 $x1))
;;      c230  mass 1  {border section}
;;      c274  mass 1  {Lessos-Kenya}
;;      c275  mass 1  {Lessos-Uganda}

;; ---- slot give.Agent  [event center]  n 3  clusters 2
(And (Member $e0 give) (Agent $e0 $x1))
;;      c853  mass 2  {Vladimir}
;;      c870  mass 1  {William}

;; ---- slot go.Manner  [event center]  n 3  clusters 2
(And (Member $e0 go) (Manner $e0 $x1))
;;     c3187  mass 2  {late}
;;     c3133  mass 1  {immediately}

;; ---- slot go.To  [event center]  n 3  clusters 2
(And (Member $e0 go) (To $e0 $x1))
;;     c2425  mass 2  {talk}
;;     c3103  mass 1  {see}

;; ---- slot grow.Patient  [event center]  n 3  clusters 3
(And (Member $e0 grow) (Patient $e0 $x1))
;;     c1773  mass 1  {beard}
;;     c2694  mass 1  {faint, sound}
;;      c944  mass 1  {Kalman}

;; ---- slot have.In  [event center]  n 3  clusters 2
(And (Member $e0 have) (In $e0 $x1))
;;      c429  mass 2  {fluid mechanics}
;;     c1700  mass 1  {poetry}

;; ---- slot hold.Patient  [event center]  n 3  clusters 3
(And (Member $e0 hold) (Patient $e0 $x1))
;;     c1757  mass 1  {ceremony, mass}
;;     c2283  mass 1  {meeting}
;;      c381  mass 1  {prayer, prayers}

;; ---- slot lead.Theme  [event center]  n 3  clusters 3
(And (Member $e0 lead) (Theme $e0 $x1))
;;     c1419  mass 1  {big, cat fight}
;;     c1482  mass 1  {sheep}
;;     c2302  mass 1  {squad}

;; ---- slot learn.Theme  [event center]  n 3  clusters 3
(And (Member $e0 learn) (Theme $e0 $x1))
;;     c1704  mass 1  {vocabulary}
;;     c2582  mass 1  {berber}
;;      c626  mass 1  {foreign language, foreign, language}

;; ---- slot leave.Patient  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Patient $e0 $x1))
;;     c1921  mass 1  {door, open}
;;     c1922  mass 1  {door, unlocked}
;;     c3286  mass 1  {lights, on}

;; ---- slot leave.Result  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Result $e0 $x1))
;;     c1918  mass 1  {unlocked}
;;     c3232  mass 1  {open}
;;     c3249  mass 1  {on}

;; ---- slot leave.Theme  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Theme $e0 $x1))
;;     c1966  mass 1  {room}
;;      c685  mass 1  {car}
;;      c695  mass 1  {parking lot}

;; ---- slot lose.Agent  [event center]  n 3  clusters 2
(And (Member $e0 lose) (Agent $e0 $x1))
;;      c958  mass 2  {George Allen, Chuck Robb}
;;      c691  mass 1  {tire}

;; ---- slot move.Goal  [event center]  n 3  clusters 2
(And (Member $e0 move) (Goal $e0 $x1))
;;      c197  mass 2  {Baltimore}
;;     c3026  mass 1  {here}

;; ---- slot paint.Patient  [event center]  n 3  clusters 2
(And (Member $e0 paint) (Patient $e0 $x1))
;;     c1127  mass 2  {landscape}
;;     c3050  mass 1  {gate}

;; ---- slot pick_up.Agent  [event center]  n 3  clusters 3
(And (Member $e0 pick_up) (Agent $e0 $x1))
;;      c205  mass 1  {Santiago}
;;     c2097  mass 1  {camera}
;;      c889  mass 1  {Jay}

;; ---- slot play.Location  [event center]  n 3  clusters 2
(And (Member $e0 play) (Location $e0 $x1))
;;      c204  mass 2  {Havana}
;;     c1908  mass 1  {floor}

;; ---- slot pull.Theme  [event center]  n 3  clusters 3
(And (Member $e0 pull) (Theme $e0 $x1))
;;      c205  mass 1  {Santiago}
;;      c664  mass 1  {freight cars, line, long}
;;      c854  mass 1  {Boris}

;; ---- slot read.Agent  [event center]  n 3  clusters 3
(And (Member $e0 read) (Agent $e0 $x1))
;;     c1646  mass 1  {girl, little}
;;      c850  mass 1  {Katya}
;;      c884  mass 1  {Thomas}

;; ---- slot read.Theme  [event center]  n 3  clusters 3
(And (Member $e0 read) (Theme $e0 $x1))
;;     c1691  mass 1  {comic}
;;      c350  mass 1  {fairy tale}
;;      c469  mass 1  {economics magazine}

;; ---- slot require.Agent  [event center]  n 3  clusters 3
(And (Member $e0 require) (Agent $e0 $x1))
;;     c1936  mass 1  {house}
;;     c3024  mass 1  {master}
;;     c3035  mass 1  {app}

;; ---- slot return.Agent  [event center]  n 3  clusters 2
(And (Member $e0 return) (Agent $e0 $x1))
;;      c750  mass 2  {Glasnow}
;;       c20  mass 1  {fishing boat}

;; ---- slot return.Goal  [event center]  n 3  clusters 2
(And (Member $e0 return) (Goal $e0 $x1))
;;      c201  mass 2  {Altoona}
;;     c2129  mass 1  {port}

;; ---- slot rule.Agent  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Agent $e0 $x1))
;;      c760  mass 2  {Tipu Sultan}
;;      c325  mass 1  {Spain}

;; ---- slot rule.Theme  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Theme $e0 $x1))
;;      c367  mass 2  {muslim house, house, muslim}
;;      c305  mass 1  {Cuba}

;; ---- slot say.Theme  [event center]  n 3  clusters 2
(And (Member $e0 say) (Theme $e0 $x1))
;;     c2962  mass 2  {thing}
;;      c354  mass 1  {funeral prayer}

;; ---- slot season.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 season) (Instrument $e0 $x1))
;;     c1328  mass 1  {lemongrass}
;;     c1336  mass 1  {horse radish}
;;     c1338  mass 1  {ramson}

;; ---- slot see.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 see) (Stimulus $e0 $x1))
;;     c1108  mass 1  {full moon}
;;     c1486  mass 1  {animals}
;;      c824  mass 1  {Jessica}

;; ---- slot shoot.Patient  [event center]  n 3  clusters 3
(And (Member $e0 shoot) (Patient $e0 $x1))
;;     c1502  mass 1  {bear}
;;      c799  mass 1  {JFK}
;;      c940  mass 1  {Dan}

;; ---- slot sleep.Agent  [event center]  n 3  clusters 2
(And (Member $e0 sleep) (Agent $e0 $x1))
;;     c1593  mass 2  {person}
;;     c1596  mass 1  {family}

;; ---- slot solve.Patient  [event center]  n 3  clusters 2
(And (Member $e0 solve) (Patient $e0 $x1))
;;     c2407  mass 2  {problem}
;;     c2408  mass 1  {problems}

;; ---- slot spend.Theme  [event center]  n 3  clusters 2
(And (Member $e0 spend) (Theme $e0 $x1))
;;      c140  mass 2  {exile}
;;     c2346  mass 1  {day}

;; ---- slot start.Location  [event center]  n 3  clusters 2
(And (Member $e0 start) (Location $e0 $x1))
;;      c334  mass 2  {Sweden}
;;      c332  mass 1  {Denmark}

;; ---- slot stick.Patient  [event center]  n 3  clusters 3
(And (Member $e0 stick) (Patient $e0 $x1))
;;     c1263  mass 1  {chewing gum}
;;     c1480  mass 1  {horse}
;;      c680  mass 1  {truck}

;; ---- slot succeed.Agent  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Agent $e0 $x1))
;;      c776  mass 1  {Alexander}
;;      c898  mass 1  {Bailey}
;;      c988  mass 1  {Peter Gaussen}

;; ---- slot succeed.Theme  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Theme $e0 $x1))
;;     c1593  mass 1  {person}
;;      c817  mass 1  {Margaret Fleming}
;;      c957  mass 1  {Henry Cole}

;; ---- slot take_off.Agent  [event center]  n 3  clusters 3
(And (Member $e0 take_off) (Agent $e0 $x1))
;;      c655  mass 1  {aeroplane, airplane}
;;      c656  mass 1  {plane}
;;      c940  mass 1  {Dan}

;; ---- slot take_over.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_over) (Agent $e0 $x1))
;;      c794  mass 2  {Watts}
;;     c1378  mass 1  {ivy}

;; ---- slot talk.Recipient  [event center]  n 3  clusters 3
(And (Member $e0 talk) (Recipient $e0 $x1))
;;     c1039  mass 1  {teacher}
;;     c1741  mass 1  {audience, large}
;;      c826  mass 1  {Loren}

;; ---- slot turn.Goal  [event center]  n 3  clusters 3
(And (Member $e0 turn) (Goal $e0 $x1))
;;     c1066  mass 1  {river}
;;     c1697  mass 1  {quagmire}
;;     c2998  mass 1  {report}

;; ---- slot understand.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 understand) (Stimulus $e0 $x1))
;;      c145  mass 1  {public health issue}
;;     c2409  mass 1  {specific issue}
;;     c2958  mass 1  {reason}

;; ---- slot wear.Theme  [event center]  n 3  clusters 3
(And (Member $e0 wear) (Theme $e0 $x1))
;;     c1770  mass 1  {mask}
;;      c568  mass 1  {inaugural gown}
;;      c649  mass 1  {helmet}

;; ---- slot welcome.Agent  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Agent $e0 $x1))
;;     c3027  mass 1  {host}
;;      c440  mass 1  {industrialization}
;;      c608  mass 1  {whig, whigs}

;; ---- slot welcome.Theme  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Theme $e0 $x1))
;;     c1746  mass 1  {guests}
;;      c440  mass 1  {industrialization}
;;      c608  mass 1  {whig, whigs}

;; ---- slot work.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 work) (Experiencer $e0 $x1))
;;     c1216  mass 1  {travel adaptor}
;;     c2117  mass 1  {mouse}
;;     c2125  mass 1  {site}

;; ---- slot work.Manner  [event center]  n 3  clusters 3
(And (Member $e0 work) (Manner $e0 $x1))
;;     c3181  mass 1  {perfectly}
;;     c3187  mass 1  {late}
;;     c3236  mass 1  {fine}

;; ==================== subtree @ cluster cos 1.00: pooled role level (136 head pairs) ====================

;; Patient ~ Theme  cosine 0.38  JSD 0.827  n 455 / 594  shared: {thing} {person} {people}
(Patient $e $x)
(Theme $e $x)

;; Agent ~ Theme  cosine 0.36  JSD 0.857  n 888 / 594  shared: {person} {thing} {company}
(Agent $e $x)
(Theme $e $x)

;; Agent ~ Patient  cosine 0.35  JSD 0.845  n 888 / 455  shared: {person} {thing} {people}
(Agent $e $x)
(Patient $e $x)

;; Agent ~ Experiencer  cosine 0.30  JSD 0.785  n 888 / 261  shared: {person} {thing} {people}
(Agent $e $x)
(Experiencer $e $x)

;; Experiencer ~ Patient  cosine 0.29  JSD 0.775  n 261 / 455  shared: {thing} {people} {person}
(Experiencer $e $x)
(Patient $e $x)

;; Agent ~ Recipient  cosine 0.29  JSD 0.872  n 888 / 29  shared: {person} {company} {man}
(Agent $e $x)
(Recipient $e $x)

;; Stimulus ~ Theme  cosine 0.29  JSD 0.921  n 34 / 594  shared: {thing} {food} {questions}
(Stimulus $e $x)
(Theme $e $x)

;; Patient ~ Stimulus  cosine 0.20  JSD 0.942  n 455 / 34  shared: {thing} {food} {knock}
(Patient $e $x)
(Stimulus $e $x)

;; Experiencer ~ Theme  cosine 0.19  JSD 0.91  n 261 / 594  shared: {thing} {person} {people}
(Experiencer $e $x)
(Theme $e $x)

;; Holder ~ Patient  cosine 0.18  JSD 0.895  n 48 / 455  shared: {thing} {movie} {room}
(Holder $e $x)
(Patient $e $x)

;; Holder ~ Theme  cosine 0.18  JSD 0.917  n 48 / 594  shared: {thing} {food} {house}
(Holder $e $x)
(Theme $e $x)

;; Agent ~ Stimulus  cosine 0.17  JSD 0.937  n 888 / 34  shared: {thing} {Jessica} {author}
(Agent $e $x)
(Stimulus $e $x)

;; Holder ~ Stimulus  cosine 0.14  JSD 0.917  n 48 / 34  shared: {thing} {food}
(Holder $e $x)
(Stimulus $e $x)

;; Experiencer ~ Stimulus  cosine 0.11  JSD 0.955  n 261 / 34  shared: {thing} {child}
(Experiencer $e $x)
(Stimulus $e $x)

;; Goal ~ Source  cosine 0.11  JSD 0.894  n 93 / 47  shared: {here} {school} {town}
(Goal $e $x)
(Source $e $x)

;; Location ~ Source  cosine 0.10  JSD 0.928  n 210 / 47  shared: {here} {town} {office}
(Location $e $x)
(Source $e $x)

;; Agent ~ Holder  cosine 0.10  JSD 0.933  n 888 / 48  shared: {thing} {Wilson} {Karen}
(Agent $e $x)
(Holder $e $x)

;; Theme ~ To  cosine 0.09  JSD 0.945  n 594 / 46  shared: {thing} {talk} {make}
(Theme $e $x)
(To $e $x)

;; Experiencer ~ Holder  cosine 0.09  JSD 0.926  n 261 / 48  shared: {thing} {place} {Miroslav}
(Experiencer $e $x)
(Holder $e $x)

;; Goal ~ Location  cosine 0.08  JSD 0.925  n 93 / 210  shared: {here} {home} {town}
(Goal $e $x)
(Location $e $x)

;; Recipient ~ Theme  cosine 0.08  JSD 0.958  n 29 / 594  shared: {person} {company} {friends}
(Recipient $e $x)
(Theme $e $x)

;; Goal ~ Holder  cosine 0.07  JSD 0.927  n 93 / 48  shared: {town} {house} {place}
(Goal $e $x)
(Holder $e $x)

;; Patient ~ Recipient  cosine 0.07  JSD 0.971  n 455 / 29  shared: {person}
(Patient $e $x)
(Recipient $e $x)

;; Goal ~ Patient  cosine 0.06  JSD 0.938  n 93 / 455  shared: {room} {community} {tree}
(Goal $e $x)
(Patient $e $x)

;; Stimulus ~ To  cosine 0.05  JSD 0.961  n 34 / 46  shared: {thing}
(Stimulus $e $x)
(To $e $x)

;; Holder ~ Source  cosine 0.05  JSD 0.95  n 48 / 47  shared: {town} {room}
(Holder $e $x)
(Source $e $x)

;; Experiencer ~ Recipient  cosine 0.05  JSD 0.976  n 261 / 29  shared: {person}
(Experiencer $e $x)
(Recipient $e $x)

;; Patient ~ To  cosine 0.05  JSD 0.975  n 455 / 46  shared: {thing}
(Patient $e $x)
(To $e $x)

;; For ~ Goal  cosine 0.04  JSD 0.967  n 39 / 93  shared: {bed}
(For $e $x)
(Goal $e $x)

;; Holder ~ To  cosine 0.04  JSD 0.949  n 48 / 46  shared: {thing} {repeat}
(Holder $e $x)
(To $e $x)

;; Agent ~ To  cosine 0.04  JSD 0.97  n 888 / 46  shared: {thing} {doctor}
(Agent $e $x)
(To $e $x)

;; Location ~ Patient  cosine 0.04  JSD 0.948  n 210 / 455  shared: {table} {hotel} {world}
(Location $e $x)
(Patient $e $x)

;; Patient ~ Source  cosine 0.04  JSD 0.969  n 455 / 47  shared: {room} {tree} {school}
(Patient $e $x)
(Source $e $x)

;; Experiencer ~ Goal  cosine 0.04  JSD 0.953  n 261 / 93  shared: {place} {school} {happiness}
(Experiencer $e $x)
(Goal $e $x)

;; Holder ~ Location  cosine 0.04  JSD 0.965  n 48 / 210  shared: {town} {hotel} {place}
(Holder $e $x)
(Location $e $x)

;; Goal ~ Manner  cosine 0.03  JSD 0.97  n 93 / 115  shared: {well} {back}
(Goal $e $x)
(Manner $e $x)

;; For ~ Theme  cosine 0.03  JSD 0.976  n 39 / 594  shared: {work} {polish} {call}
(For $e $x)
(Theme $e $x)

;; Experiencer ~ To  cosine 0.03  JSD 0.974  n 261 / 46  shared: {thing} {doctor}
(Experiencer $e $x)
(To $e $x)

;; Goal ~ Theme  cosine 0.03  JSD 0.964  n 93 / 594  shared: {house} {first team} {Islam}
(Goal $e $x)
(Theme $e $x)

;; Instrument ~ Stimulus  cosine 0.02  JSD 0.971  n 34 / 34  shared: {food}
(Instrument $e $x)
(Stimulus $e $x)

;; Instrument ~ Patient  cosine 0.02  JSD 0.979  n 34 / 455  shared: {snow} {food} {blood}
(Instrument $e $x)
(Patient $e $x)

;; Experiencer ~ Location  cosine 0.02  JSD 0.975  n 261 / 210  shared: {Europe} {place} {school}
(Experiencer $e $x)
(Location $e $x)

;; Holder ~ Instrument  cosine 0.02  JSD 0.975  n 48 / 34  shared: {food}
(Holder $e $x)
(Instrument $e $x)

;; In ~ Stimulus  cosine 0.02  JSD 0.976  n 50 / 34  shared: {poetry}
(In $e $x)
(Stimulus $e $x)

;; Source ~ Theme  cosine 0.02  JSD 0.978  n 47 / 594  shared: {eat} {mosquito} {office}
(Source $e $x)
(Theme $e $x)

;; Agent ~ For  cosine 0.02  JSD 0.978  n 888 / 39  shared: {cook} {bus} {patient}
(Agent $e $x)
(For $e $x)

;; Result ~ Source  cosine 0.02  JSD 0.978  n 43 / 47  shared: {bat}
(Result $e $x)
(Source $e $x)

;; In ~ Theme  cosine 0.02  JSD 0.986  n 50 / 594  shared: {english} {understand} {nothing}
(In $e $x)
(Theme $e $x)

;; Location ~ Theme  cosine 0.02  JSD 0.971  n 210 / 594  shared: {Gareccio} {group} {fire}
(Location $e $x)
(Theme $e $x)

;; Experiencer ~ Instrument  cosine 0.01  JSD 0.983  n 261 / 34  shared: {road} {train}
(Experiencer $e $x)
(Instrument $e $x)

;; Manner ~ Result  cosine 0.01  JSD 0.98  n 115 / 43  shared: {together}
(Manner $e $x)
(Result $e $x)

;; Experiencer ~ Result  cosine 0.01  JSD 0.984  n 261 / 43  shared: {modern, street} {open}
(Experiencer $e $x)
(Result $e $x)

;; Goal ~ Instrument  cosine 0.01  JSD 0.983  n 93 / 34  shared: {snow}
(Goal $e $x)
(Instrument $e $x)

;; Goal ~ Recipient  cosine 0.01  JSD 0.982  n 93 / 29  shared: {Loren}
(Goal $e $x)
(Recipient $e $x)

;; Instrument ~ Theme  cosine 0.01  JSD 0.99  n 34 / 594  shared: {food}
(Instrument $e $x)
(Theme $e $x)

;; Experiencer ~ In  cosine 0.01  JSD 0.988  n 261 / 50  shared: {weather}
(Experiencer $e $x)
(In $e $x)

;; Agent ~ Goal  cosine 0.01  JSD 0.978  n 888 / 93  shared: {campfire} {community} {Islam}
(Agent $e $x)
(Goal $e $x)

;; Agent ~ Instrument  cosine 0.01  JSD 0.984  n 888 / 34  shared: {train} {plants} {road}
(Agent $e $x)
(Instrument $e $x)

;; In ~ Location  cosine 0.01  JSD 0.983  n 50 / 210  shared: {water} {Coronation Street}
(In $e $x)
(Location $e $x)

;; In ~ Patient  cosine 0.01  JSD 0.987  n 50 / 455  shared: {weather} {field}
(In $e $x)
(Patient $e $x)

;; Result ~ Theme  cosine 0.01  JSD 0.988  n 43 / 594  shared: {sleep} {inomaru}
(Result $e $x)
(Theme $e $x)

;; Patient ~ Time  cosine 0.01  JSD 0.993  n 455 / 107  shared: {night}
(Patient $e $x)
(Time $e $x)

;; Location ~ Recipient  cosine 0.01  JSD 0.99  n 210 / 29  shared: {cities}
(Location $e $x)
(Recipient $e $x)

;; Experiencer ~ Source  cosine 0.01  JSD 0.992  n 261 / 47  shared: {school}
(Experiencer $e $x)
(Source $e $x)

;; Agent ~ Result  cosine 0.01  JSD 0.991  n 888 / 43  shared: {crow} {sleep}
(Agent $e $x)
(Result $e $x)

;; Source ~ Time  cosine 0.01  JSD 0.986  n 47 / 107  shared: {point}
(Source $e $x)
(Time $e $x)

;; Agent ~ Location  cosine 0.01  JSD 0.988  n 888 / 210  shared: {France} {fire} {hotel}
(Agent $e $x)
(Location $e $x)

;; Location ~ To  cosine 0.01  JSD 0.991  n 210 / 46  shared: {shore}
(Location $e $x)
(To $e $x)

;; Theme ~ Time  cosine 0.00  JSD 0.995  n 594 / 107  shared: {morning}
(Theme $e $x)
(Time $e $x)

;; Agent ~ Time  cosine 0.00  JSD 0.997  n 888 / 107  shared: {spring}
(Agent $e $x)
(Time $e $x)

;; Agent ~ In  cosine 0.00  JSD 1.0  n 888 / 50  shared: 
(Agent $e $x)
(In $e $x)

;; Agent ~ Manner  cosine 0.00  JSD 1.0  n 888 / 115  shared: 
(Agent $e $x)
(Manner $e $x)

;; Agent ~ Source  cosine 0.00  JSD 1.0  n 888 / 47  shared: 
(Agent $e $x)
(Source $e $x)

;; Experiencer ~ For  cosine 0.00  JSD 1.0  n 261 / 39  shared: 
(Experiencer $e $x)
(For $e $x)

;; Experiencer ~ Manner  cosine 0.00  JSD 1.0  n 261 / 115  shared: 
(Experiencer $e $x)
(Manner $e $x)

;; Experiencer ~ Time  cosine 0.00  JSD 1.0  n 261 / 107  shared: 
(Experiencer $e $x)
(Time $e $x)

;; For ~ Holder  cosine 0.00  JSD 1.0  n 39 / 48  shared: 
(For $e $x)
(Holder $e $x)

;; For ~ In  cosine 0.00  JSD 1.0  n 39 / 50  shared: 
(For $e $x)
(In $e $x)

;; For ~ Instrument  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Instrument $e $x)

;; For ~ Location  cosine 0.00  JSD 1.0  n 39 / 210  shared: 
(For $e $x)
(Location $e $x)

;; For ~ Manner  cosine 0.00  JSD 1.0  n 39 / 115  shared: 
(For $e $x)
(Manner $e $x)

;; For ~ Patient  cosine 0.00  JSD 1.0  n 39 / 455  shared: 
(For $e $x)
(Patient $e $x)

;; For ~ Recipient  cosine 0.00  JSD 1.0  n 39 / 29  shared: 
(For $e $x)
(Recipient $e $x)

;; For ~ Result  cosine 0.00  JSD 1.0  n 39 / 43  shared: 
(For $e $x)
(Result $e $x)

;; For ~ Source  cosine 0.00  JSD 1.0  n 39 / 47  shared: 
(For $e $x)
(Source $e $x)

;; For ~ Stimulus  cosine 0.00  JSD 1.0  n 39 / 34  shared: 
(For $e $x)
(Stimulus $e $x)

;; For ~ Time  cosine 0.00  JSD 1.0  n 39 / 107  shared: 
(For $e $x)
(Time $e $x)

;; For ~ To  cosine 0.00  JSD 1.0  n 39 / 46  shared: 
(For $e $x)
(To $e $x)

;; Goal ~ In  cosine 0.00  JSD 1.0  n 93 / 50  shared: 
(Goal $e $x)
(In $e $x)

;; Goal ~ Result  cosine 0.00  JSD 1.0  n 93 / 43  shared: 
(Goal $e $x)
(Result $e $x)

;; Goal ~ Stimulus  cosine 0.00  JSD 1.0  n 93 / 34  shared: 
(Goal $e $x)
(Stimulus $e $x)

;; Goal ~ Time  cosine 0.00  JSD 1.0  n 93 / 107  shared: 
(Goal $e $x)
(Time $e $x)

;; Goal ~ To  cosine 0.00  JSD 1.0  n 93 / 46  shared: 
(Goal $e $x)
(To $e $x)

;; Holder ~ In  cosine 0.00  JSD 1.0  n 48 / 50  shared: 
(Holder $e $x)
(In $e $x)

;; Holder ~ Manner  cosine 0.00  JSD 1.0  n 48 / 115  shared: 
(Holder $e $x)
(Manner $e $x)

;; Holder ~ Recipient  cosine 0.00  JSD 1.0  n 48 / 29  shared: 
(Holder $e $x)
(Recipient $e $x)

;; Holder ~ Result  cosine 0.00  JSD 1.0  n 48 / 43  shared: 
(Holder $e $x)
(Result $e $x)

;; Holder ~ Time  cosine 0.00  JSD 1.0  n 48 / 107  shared: 
(Holder $e $x)
(Time $e $x)

;; In ~ Instrument  cosine 0.00  JSD 1.0  n 50 / 34  shared: 
(In $e $x)
(Instrument $e $x)

;; In ~ Manner  cosine 0.00  JSD 1.0  n 50 / 115  shared: 
(In $e $x)
(Manner $e $x)

;; In ~ Recipient  cosine 0.00  JSD 1.0  n 50 / 29  shared: 
(In $e $x)
(Recipient $e $x)

;; In ~ Result  cosine 0.00  JSD 1.0  n 50 / 43  shared: 
(In $e $x)
(Result $e $x)

;; In ~ Source  cosine 0.00  JSD 1.0  n 50 / 47  shared: 
(In $e $x)
(Source $e $x)

;; In ~ Time  cosine 0.00  JSD 1.0  n 50 / 107  shared: 
(In $e $x)
(Time $e $x)

;; In ~ To  cosine 0.00  JSD 1.0  n 50 / 46  shared: 
(In $e $x)
(To $e $x)

;; Instrument ~ Location  cosine 0.00  JSD 1.0  n 34 / 210  shared: 
(Instrument $e $x)
(Location $e $x)

;; Instrument ~ Manner  cosine 0.00  JSD 1.0  n 34 / 115  shared: 
(Instrument $e $x)
(Manner $e $x)

;; Instrument ~ Recipient  cosine 0.00  JSD 1.0  n 34 / 29  shared: 
(Instrument $e $x)
(Recipient $e $x)

;; Instrument ~ Result  cosine 0.00  JSD 1.0  n 34 / 43  shared: 
(Instrument $e $x)
(Result $e $x)

;; Instrument ~ Source  cosine 0.00  JSD 1.0  n 34 / 47  shared: 
(Instrument $e $x)
(Source $e $x)

;; Instrument ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Instrument $e $x)
(Time $e $x)

;; Instrument ~ To  cosine 0.00  JSD 1.0  n 34 / 46  shared: 
(Instrument $e $x)
(To $e $x)

;; Location ~ Manner  cosine 0.00  JSD 1.0  n 210 / 115  shared: 
(Location $e $x)
(Manner $e $x)

;; Location ~ Result  cosine 0.00  JSD 1.0  n 210 / 43  shared: 
(Location $e $x)
(Result $e $x)

;; Location ~ Stimulus  cosine 0.00  JSD 1.0  n 210 / 34  shared: 
(Location $e $x)
(Stimulus $e $x)

;; Location ~ Time  cosine 0.00  JSD 1.0  n 210 / 107  shared: 
(Location $e $x)
(Time $e $x)

;; Manner ~ Patient  cosine 0.00  JSD 1.0  n 115 / 455  shared: 
(Manner $e $x)
(Patient $e $x)

;; Manner ~ Recipient  cosine 0.00  JSD 1.0  n 115 / 29  shared: 
(Manner $e $x)
(Recipient $e $x)

;; Manner ~ Source  cosine 0.00  JSD 1.0  n 115 / 47  shared: 
(Manner $e $x)
(Source $e $x)

;; Manner ~ Stimulus  cosine 0.00  JSD 1.0  n 115 / 34  shared: 
(Manner $e $x)
(Stimulus $e $x)

;; Manner ~ Theme  cosine 0.00  JSD 1.0  n 115 / 594  shared: 
(Manner $e $x)
(Theme $e $x)

;; Manner ~ Time  cosine 0.00  JSD 1.0  n 115 / 107  shared: 
(Manner $e $x)
(Time $e $x)

;; Manner ~ To  cosine 0.00  JSD 1.0  n 115 / 46  shared: 
(Manner $e $x)
(To $e $x)

;; Patient ~ Result  cosine 0.00  JSD 1.0  n 455 / 43  shared: 
(Patient $e $x)
(Result $e $x)

;; Recipient ~ Result  cosine 0.00  JSD 1.0  n 29 / 43  shared: 
(Recipient $e $x)
(Result $e $x)

;; Recipient ~ Source  cosine 0.00  JSD 1.0  n 29 / 47  shared: 
(Recipient $e $x)
(Source $e $x)

;; Recipient ~ Stimulus  cosine 0.00  JSD 1.0  n 29 / 34  shared: 
(Recipient $e $x)
(Stimulus $e $x)

;; Recipient ~ Time  cosine 0.00  JSD 1.0  n 29 / 107  shared: 
(Recipient $e $x)
(Time $e $x)

;; Recipient ~ To  cosine 0.00  JSD 1.0  n 29 / 46  shared: 
(Recipient $e $x)
(To $e $x)

;; Result ~ Stimulus  cosine 0.00  JSD 1.0  n 43 / 34  shared: 
(Result $e $x)
(Stimulus $e $x)

;; Result ~ Time  cosine 0.00  JSD 1.0  n 43 / 107  shared: 
(Result $e $x)
(Time $e $x)

;; Result ~ To  cosine 0.00  JSD 1.0  n 43 / 46  shared: 
(Result $e $x)
(To $e $x)

;; Source ~ Stimulus  cosine 0.00  JSD 1.0  n 47 / 34  shared: 
(Source $e $x)
(Stimulus $e $x)

;; Source ~ To  cosine 0.00  JSD 1.0  n 47 / 46  shared: 
(Source $e $x)
(To $e $x)

;; Stimulus ~ Time  cosine 0.00  JSD 1.0  n 34 / 107  shared: 
(Stimulus $e $x)
(Time $e $x)

;; Time ~ To  cosine 0.00  JSD 1.0  n 107 / 46  shared: 
(Time $e $x)
(To $e $x)

;; ==================== subtree @ cluster cos 1.00: slot pairs (1 event-center signals) ====================

;; [same role, different class]  accompany.Agent ~ appear.Agent  cosine 0.76  JSD 0.23  n 4 / 6  shared: {person} {sisters}
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000050 tierC-000259
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; ==================== subtree @ cluster cos 1.00: compared slots with their distributions (269 slots, n >= 3) ====================

;; ---- slot <unclassed>.LocatedIn  [entity center]  n 46  clusters 39
(LocatedIn $x0 $x1)
;;     c1706  mass 3  {here}
;;     c1563  mass 2  {garden}
;;     c2933  mass 2  {southern}
;;      c891  mass 2  {city}
;;      c896  mass 2  {class}
;;       c94  mass 2  {Derwent Isle}
;;     c1049  mass 1  {country}
;;      c107  mass 1  {El Harrach}
;;      c132  mass 1  {Gaul}
;;     c1449  mass 1  {film}
;;     c1473  mass 1  {floor}
;;     c1513  mass 1  {fountain, full}
;;     c1547  mass 1  {full, kitchen sink}
;;     c1548  mass 1  {full, place}
;;      c159  mass 1  {Huancavelica}
;;      c165  mass 1  {India}
;;     c1759  mass 1  {house}
;;      c193  mass 1  {Japan}
;;     c2090  mass 1  {market}
;;     c2288  mass 1  {ocean}
;;     c2374  mass 1  {park}
;;     c2466  mass 1  {play}
;;      c248  mass 1  {Loglan}
;;      c249  mass 1  {Lojban}
;;     c2997  mass 1  {storeroom}
;;     c3006  mass 1  {street}
;;     c3065  mass 1  {table}
;;     c3187  mass 1  {tree}
;;      c321  mass 1  {Peru}
;;     c3271  mass 1  {village}
;;     c3295  mass 1  {wall}
;;     c3372  mass 1  {world}
;;      c350  mass 1  {Russian Far East}
;;      c378  mass 1  {Tatoeba}
;;      c397  mass 1  {UK}
;;        c6  mass 1  {Algiers}
;;      c630  mass 1  {basket, red}
;;      c833  mass 1  {ceiling}
;;       c95  mass 1  {Dianchi Lake}

;; ---- slot have.Holder  [event center]  n 44  clusters 38
(And (Member $e0 have) (Holder $e0 $x1))
;;      c225  mass 4  {Kristoffer}
;;      c211  mass 2  {Karen}
;;     c3113  mass 2  {thing}
;;     c3161  mass 2  {town}
;;     c1073  mass 1  {creature}
;;     c1136  mass 1  {decision}
;;     c1432  mass 1  {february}
;;     c1487  mass 1  {food}
;;     c1567  mass 1  {gas station}
;;     c1735  mass 1  {homentropic current}
;;     c1736  mass 1  {homentropic flow}
;;     c1753  mass 1  {hotel}
;;     c1759  mass 1  {house}
;;     c1848  mass 1  {insurance}
;;     c1882  mass 1  {ivy}
;;     c1966  mass 1  {lawyer}
;;     c1998  mass 1  {library}
;;     c2178  mass 1  {mosque, old}
;;     c2194  mass 1  {movie}
;;     c2288  mass 1  {ocean}
;;     c2451  mass 1  {place}
;;     c2676  mass 1  {repeat}
;;     c2737  mass 1  {room}
;;      c281  mass 1  {Miroslav}
;;     c2815  mass 1  {sentence}
;;      c284  mass 1  {Morocco}
;;     c3160  mass 1  {tower}
;;     c3206  mass 1  {tuaregs}
;;      c336  mass 1  {Rasputin}
;;     c3366  mass 1  {word processor}
;;     c3383  mass 1  {writer}
;;      c360  mass 1  {Scotland}
;;      c381  mass 1  {Thomas}
;;       c41  mass 1  {Boldi}
;;      c418  mass 1  {Wilson}
;;        c6  mass 1  {Algiers}
;;      c602  mass 1  {bad, weather}
;;       c96  mass 1  {Diego}

;; ---- slot have.Theme  [event center]  n 43  clusters 38
(And (Member $e0 have) (Theme $e0 $x1))
;;      c880  mass 4  {children}
;;     c1006  mass 2  {constant, entropy, uniform}
;;     c2682  mass 2  {representation}
;;     c1125  mass 1  {days}
;;     c1141  mass 1  {deductible, high}
;;     c1260  mass 1  {dream, weird}
;;     c1306  mass 1  {eerie, feeling}
;;     c1307  mass 1  {effect}
;;     c1539  mass 1  {friends}
;;     c1566  mass 1  {gas pumps}
;;     c1651  mass 1  {guards}
;;     c1705  mass 1  {herds}
;;     c1724  mass 1  {history, rich}
;;     c1855  mass 1  {internal politics, intriguing}
;;     c1985  mass 1  {leaves}
;;     c2106  mass 1  {meanings}
;;     c2218  mass 1  {nasty, personality}
;;     c2259  mass 1  {nice, taste}
;;     c2372  mass 1  {parenthetic, style}
;;     c2475  mass 1  {plot, predictable}
;;     c2593  mass 1  {purpose, single}
;;     c2684  mass 1  {reputation}
;;     c2714  mass 1  {right}
;;     c2928  mass 1  {soul piercing, stare}
;;     c3116  mass 1  {things}
;;     c3123  mass 1  {thought}
;;     c3254  mass 1  {value}
;;      c521  mass 1  {antlers}
;;      c564  mass 1  {atmosphere, homely}
;;      c617  mass 1  {bank, documents, valuable}
;;      c645  mass 1  {beautiful, garden}
;;      c650  mass 1  {beauty salons}
;;      c693  mass 1  {blue, curtain}
;;      c839  mass 1  {cemeteries}
;;      c851  mass 1  {chance}
;;      c943  mass 1  {color}
;;      c992  mass 1  {conical, roof}
;;      c998  mass 1  {consequences, serious, wide}

;; ---- slot <unclassed>.Possession  [entity center]  n 30  clusters 19
(Possession $x0 $x1)
;;     c2419  mass 5  {person}
;;      c124  mass 4  {Free Soil Party}
;;      c339  mass 4  {Republican Party}
;;     c3026  mass 2  {subsequent game}
;;     c1049  mass 1  {country}
;;     c1296  mass 1  {easy, generalization}
;;      c140  mass 1  {God}
;;     c1873  mass 1  {islamic ivory}
;;     c2043  mass 1  {logical phrase}
;;     c2044  mass 1  {logical proposition}
;;      c208  mass 1  {Jupiter}
;;     c2617  mass 1  {radical group}
;;     c3039  mass 1  {sunni communities}
;;     c3113  mass 1  {thing}
;;     c3229  mass 1  {union}
;;      c394  mass 1  {Twilight}
;;      c426  mass 1  {Yunnan}
;;      c963  mass 1  {communities, neighbouring, other, sunni}
;;       c99  mass 1  {Dora Smith}

;; ---- slot use.Theme  [event center]  n 23  clusters 21
(And (Member $e0 use) (Theme $e0 $x1))
;;     c3313  mass 2  {weak arens space topology}
;;      c613  mass 2  {banach mackey topology}
;;     c1094  mass 1  {current, designation convention}
;;     c1095  mass 1  {current, naming convention}
;;     c1457  mass 1  {fire}
;;      c163  mass 1  {Iga}
;;     c1890  mass 1  {jingle}
;;     c2061  mass 1  {machine}
;;     c2138  mass 1  {metaphor}
;;      c234  mass 1  {Laravel}
;;     c2368  mass 1  {paramilitary group}
;;     c2428  mass 1  {phrase}
;;     c2579  mass 1  {public fund}
;;     c2738  mass 1  {rooms}
;;      c278  mass 1  {Midway}
;;     c2815  mass 1  {sentence}
;;     c3033  mass 1  {sugar}
;;     c3365  mass 1  {word}
;;      c584  mass 1  {auto tune}
;;      c780  mass 1  {calendars, various}
;;      c869  mass 1  {chemical agent}

;; ---- slot make.Patient  [event center]  n 20  clusters 20
(And (Member $e0 make) (Patient $e0 $x1))
;;        c1  mass 1  {Afghanistan}
;;     c1029  mass 1  {copes}
;;     c1092  mass 1  {cup}
;;     c1193  mass 1  {difference}
;;     c1396  mass 1  {eye contact}
;;     c1712  mass 1  {high pitched, noise}
;;      c173  mass 1  {Isabella}
;;     c2357  mass 1  {paper}
;;       c24  mass 1  {Augustus}
;;     c2588  mass 1  {purchase}
;;     c3090  mass 1  {telephone call}
;;     c3182  mass 1  {travel}
;;      c599  mass 1  {bad, matter}
;;      c647  mass 1  {beautiful, room}
;;      c671  mass 1  {big, difference}
;;      c673  mass 1  {big, snowman}
;;      c876  mass 1  {chicken fried steak}
;;      c894  mass 1  {claims}
;;      c907  mass 1  {clicking, sound}
;;      c956  mass 1  {comfortable, house}

;; ---- slot build.Patient  [event center]  n 18  clusters 9
(And (Member $e0 build) (Patient $e0 $x1))
;;     c1753  mass 4  {hotel}
;;     c2737  mass 3  {room}
;;     c1743  mass 2  {horn}
;;     c2360  mass 2  {paper factory}
;;     c2361  mass 2  {paper mill}
;;     c3113  mass 2  {thing}
;;     c2242  mass 1  {network, wells}
;;     c2244  mass 1  {new, playground}
;;     c2322  mass 1  {original, turing machine}

;; ---- slot make.Agent  [event center]  n 18  clusters 18
(And (Member $e0 make) (Agent $e0 $x1))
;;      c109  mass 1  {Elias}
;;     c1099  mass 1  {curtains}
;;     c1100  mass 1  {customer}
;;     c1201  mass 1  {diner}
;;      c145  mass 1  {Hanako}
;;     c1657  mass 1  {gusty, winds}
;;      c185  mass 1  {James}
;;     c2077  mass 1  {man}
;;       c24  mass 1  {Augustus}
;;      c252  mass 1  {Lorenzo}
;;     c2521  mass 1  {practical utility}
;;     c3113  mass 1  {thing}
;;      c377  mass 1  {Taliban}
;;      c551  mass 1  {artistic beauty}
;;      c717  mass 1  {boys}
;;      c820  mass 1  {cat}
;;       c88  mass 1  {Damiano}
;;       c91  mass 1  {David}

;; ---- slot go.Agent  [event center]  n 15  clusters 14
(And (Member $e0 go) (Agent $e0 $x1))
;;      c215  mass 2  {Katherine}
;;      c120  mass 1  {Flavio}
;;      c209  mass 1  {Kalman}
;;      c247  mass 1  {Linda}
;;     c2587  mass 1  {pupils}
;;      c265  mass 1  {Mariko}
;;      c271  mass 1  {Matthew}
;;      c276  mass 1  {Mennad}
;;      c283  mass 1  {Mom}
;;      c309  mass 1  {Olivia}
;;      c820  mass 1  {cat}
;;      c880  mass 1  {children}
;;       c90  mass 1  {Daniel}
;;       c98  mass 1  {Donald}

;; ---- slot play.Agent  [event center]  n 15  clusters 11
(And (Member $e0 play) (Agent $e0 $x1))
;;      c880  mass 3  {children}
;;       c46  mass 2  {Boston Red Sox}
;;       c74  mass 2  {Cincinnati Reds}
;;       c22  mass 1  {Audrey Hepburn}
;;       c23  mass 1  {Audrey Heppurn}
;;     c2670  mass 1  {religion}
;;      c390  mass 1  {Tony}
;;      c425  mass 1  {Yumi}
;;      c677  mass 1  {biology}
;;      c717  mass 1  {boys}
;;      c878  mass 1  {child}

;; ---- slot build.Agent  [event center]  n 14  clusters 5
(And (Member $e0 build) (Agent $e0 $x1))
;;      c965  mass 8  {company}
;;     c2419  mass 2  {person}
;;      c305  mass 2  {O. R. Woodcock}
;;     c2197  mass 1  {mozabites}
;;      c964  mass 1  {community}

;; ---- slot find.Location  [event center]  n 14  clusters 10
(And (Member $e0 find) (Location $e0 $x1))
;;     c2933  mass 2  {southern}
;;     c3191  mass 2  {tributaries}
;;      c426  mass 2  {Yunnan}
;;      c658  mass 2  {bench}
;;      c231  mass 1  {Lake Dianchi}
;;     c2979  mass 1  {station}
;;     c3148  mass 1  {tomb}
;;     c3329  mass 1  {western}
;;      c351  mass 1  {Sahara Desert}
;;      c414  mass 1  {Western Europe}

;; ---- slot <unclassed>.SubsetOf  [entity center]  n 13  clusters 12
(SubsetOf $x0 $x1)
;;     c2410  mass 2  {people}
;;     c1034  mass 1  {corners}
;;     c1587  mass 1  {girls}
;;     c2103  mass 1  {mayan books}
;;     c2455  mass 1  {planes}
;;     c2587  mass 1  {pupils}
;;     c2659  mass 1  {refugees}
;;     c2858  mass 1  {shops}
;;     c3273  mass 1  {villagers}
;;     c3345  mass 1  {windows}
;;      c843  mass 1  {centipedes}
;;      c877  mass 1  {chicks}

;; ---- slot start.Theme  [event center]  n 13  clusters 13
(And (Member $e0 start) (Theme $e0 $x1))
;;     c1088  mass 1  {cry}
;;     c1211  mass 1  {disappear}
;;     c1435  mass 1  {feel, light headed}
;;     c1696  mass 1  {hear}
;;     c1714  mass 1  {high school}
;;     c1808  mass 1  {improve}
;;     c2733  mass 1  {roll}
;;     c2754  mass 1  {run out}
;;     c2865  mass 1  {show}
;;     c3073  mass 1  {talk}
;;     c3286  mass 1  {vomit}
;;      c528  mass 1  {appear}
;;      c858  mass 1  {chant}

;; ---- slot go.Goal  [event center]  n 12  clusters 9
(And (Member $e0 go) (Goal $e0 $x1))
;;      c652  mass 4  {bed}
;;     c1748  mass 1  {hospital}
;;     c2451  mass 1  {place}
;;      c251  mass 1  {Loren}
;;     c2788  mass 1  {school}
;;     c3043  mass 1  {supermarket}
;;     c3310  mass 1  {way}
;;      c474  mass 1  {aesthetic salon}
;;      c633  mass 1  {bathroom}

;; ---- slot study.Agent  [event center]  n 12  clusters 9
(And (Member $e0 study) (Agent $e0 $x1))
;;     c2419  mass 3  {person}
;;     c2792  mass 2  {scientists}
;;      c118  mass 1  {Fadil}
;;     c1500  mass 1  {forensics researchers}
;;      c300  mass 1  {Nicolaus Copernicus}
;;      c322  mass 1  {Peter}
;;       c33  mass 1  {Beth}
;;      c427  mass 1  {Yuri}
;;       c64  mass 1  {Carlos}

;; ---- slot <unclassed>.PartOf  [entity center]  n 11  clusters 10
(PartOf $x0 $x1)
;;      c224  mass 2  {Khurda Road}
;;     c1873  mass 1  {islamic ivory}
;;     c1882  mass 1  {ivy}
;;     c2457  mass 1  {plant}
;;     c2466  mass 1  {play}
;;     c2722  mass 1  {road, street}
;;     c3018  mass 1  {student associations}
;;      c426  mass 1  {Yunnan}
;;      c509  mass 1  {animal}
;;      c778  mass 1  {cake}

;; ---- slot become.Patient  [event center]  n 11  clusters 9
(And (Member $e0 become) (Patient $e0 $x1))
;;     c1824  mass 2  {indigenous, people}
;;      c601  mass 2  {bad, relationship}
;;     c1000  mass 1  {conservative, revolutionary}
;;     c1213  mass 1  {discipline, lax}
;;     c1289  mass 1  {earth, red}
;;     c1838  mass 1  {inomaru, person}
;;     c1850  mass 1  {intense, noise}
;;      c228  mass 1  {Lady Ashton}
;;     c3113  mass 1  {thing}

;; ---- slot begin.Agent  [event center]  n 11  clusters 10
(And (Member $e0 begin) (Agent $e0 $x1))
;;     c1359  mass 2  {european american settlers}
;;     c1084  mass 1  {crowd}
;;     c1823  mass 1  {indigenous americans}
;;      c199  mass 1  {Jessica}
;;     c1991  mass 1  {legionnaires}
;;     c2223  mass 1  {native americans}
;;     c2641  mass 1  {rebels}
;;      c266  mass 1  {Mark}
;;      c416  mass 1  {William}
;;       c91  mass 1  {David}

;; ---- slot begin.Theme  [event center]  n 11  clusters 8
(And (Member $e0 begin) (Theme $e0 $x1))
;;     c1072  mass 4  {create}
;;     c1229  mass 1  {distribute}
;;     c1672  mass 1  {hang out}
;;     c2074  mass 1  {make}
;;     c3155  mass 1  {torture}
;;      c531  mass 1  {applaud}
;;      c740  mass 1  {bud}
;;      c987  mass 1  {confess}

;; ---- slot build.Location  [event center]  n 11  clusters 4
(And (Member $e0 build) (Location $e0 $x1))
;;      c218  mass 4  {Kazakhstan}
;;      c113  mass 3  {Eskisehir}
;;      c393  mass 3  {Turkey}
;;      c136  mass 1  {Ghardaia}

;; ---- slot kill.Patient  [event center]  n 11  clusters 7
(And (Member $e0 kill) (Patient $e0 $x1))
;;     c2410  mass 4  {people}
;;     c2419  mass 2  {person}
;;     c1514  mass 1  {fox}
;;     c1570  mass 1  {gazelle}
;;     c2918  mass 1  {soldier}
;;     c2919  mass 1  {soldiers}
;;     c3397  mass 1  {zombies}

;; ---- slot produce.Patient  [event center]  n 11  clusters 7
(And (Member $e0 produce) (Patient $e0 $x1))
;;     c2194  mass 4  {movie}
;;      c488  mass 2  {album}
;;     c1105  mass 1  {cyanide, harmless, trace}
;;     c1177  mass 1  {destined, film, syrian film}
;;     c1450  mass 1  {film, syrian film}
;;     c1847  mass 1  {insulin}
;;     c2134  mass 1  {mesmerizing, sheen}

;; ---- slot start.Patient  [event center]  n 11  clusters 11
(And (Member $e0 start) (Patient $e0 $x1))
;;     c1062  mass 1  {crack}
;;     c1245  mass 1  {dog feed}
;;     c1520  mass 1  {freedom movement, gusher}
;;     c1929  mass 1  {knock}
;;     c2220  mass 1  {national fibre optic network project}
;;      c280  mass 1  {Milky Way}
;;     c3116  mass 1  {things}
;;     c3199  mass 1  {truck}
;;     c3306  mass 1  {watermelon season}
;;      c694  mass 1  {blue, pockets, sky}
;;      c981  mass 1  {concert}

;; ---- slot find.Theme  [event center]  n 10  clusters 6
(And (Member $e0 find) (Theme $e0 $x1))
;;     c3113  mass 4  {thing}
;;       c81  mass 2  {Couper}
;;     c2139  mass 1  {meteorite}
;;     c2363  mass 1  {paper sheets}
;;      c325  mass 1  {Pietro}
;;      c899  mass 1  {clay figurines}

;; ---- slot leave.Agent  [event center]  n 10  clusters 10
(And (Member $e0 leave) (Agent $e0 $x1))
;;      c179  mass 1  {Ivan}
;;     c2419  mass 1  {person}
;;     c2454  mass 1  {plane}
;;      c261  mass 1  {Marcus}
;;     c2850  mass 1  {ship}
;;      c346  mass 1  {Rodrigo}
;;      c387  mass 1  {Tom}
;;       c50  mass 1  {Brian}
;;      c754  mass 1  {bus}
;;      c801  mass 1  {car}

;; ---- slot serve.Agent  [event center]  n 10  clusters 9
(And (Member $e0 serve) (Agent $e0 $x1))
;;      c167  mass 2  {Indooroopilly}
;;     c1632  mass 1  {grandmother}
;;      c169  mass 1  {Ipswich}
;;      c170  mass 1  {Ipswich & Rosewood}
;;      c192  mass 1  {Janos}
;;     c2419  mass 1  {person}
;;     c2420  mass 1  {person, president}
;;      c348  mass 1  {Rosewood}
;;      c424  mass 1  {Yitzhak}

;; ---- slot take.Theme  [event center]  n 10  clusters 9
(And (Member $e0 take) (Theme $e0 $x1))
;;     c1790  mass 2  {identity}
;;     c1257  mass 1  {drastic, measures}
;;     c2291  mass 1  {office}
;;     c2500  mass 1  {portrait}
;;     c2518  mass 1  {power}
;;     c2735  mass 1  {roller}
;;     c3113  mass 1  {thing}
;;     c3333  mass 1  {while}
;;      c912  mass 1  {close, look}

;; ---- slot try.Agent  [event center]  n 10  clusters 10
(And (Member $e0 try) (Agent $e0 $x1))
;;     c1078  mass 1  {crocodile}
;;      c119  mass 1  {Felix}
;;     c2080  mass 1  {man, young}
;;      c266  mass 1  {Mark}
;;      c358  mass 1  {Santiago}
;;       c39  mass 1  {Bob}
;;      c493  mass 1  {alien}
;;       c76  mass 1  {Claudio}
;;       c91  mass 1  {David}
;;      c965  mass 1  {company}

;; ---- slot write.Patient  [event center]  n 10  clusters 8
(And (Member $e0 write) (Patient $e0 $x1))
;;     c1351  mass 2  {episode}
;;     c2923  mass 2  {song}
;;     c1997  mass 1  {letter}
;;     c2795  mass 1  {screenplay}
;;     c2797  mass 1  {script}
;;     c2815  mass 1  {sentence}
;;      c703  mass 1  {book}
;;      c860  mass 1  {character}

;; ---- slot fall.Patient  [event center]  n 9  clusters 9
(And (Member $e0 fall) (Patient $e0 $x1))
;;     c1128  mass 1  {dead, rotten, tree}
;;     c1504  mass 1  {forest, silent}
;;     c1780  mass 1  {hush of anticipation}
;;     c1786  mass 1  {ice pellet}
;;     c2587  mass 1  {pupils}
;;     c2778  mass 1  {scaffolding}
;;     c2903  mass 1  {snow}
;;      c704  mass 1  {books}
;;      c877  mass 1  {chicks}

;; ---- slot follow.Agent  [event center]  n 9  clusters 8
(And (Member $e0 follow) (Agent $e0 $x1))
;;      c667  mass 2  {bhadalas}
;;     c1762  mass 1  {house, muslim}
;;     c2209  mass 1  {muslim house}
;;       c26  mass 1  {Bailey}
;;     c2721  mass 1  {road}
;;      c354  mass 1  {Sami}
;;        c4  mass 1  {Alexander}
;;      c643  mass 1  {beast, crawling}

;; ---- slot follow.Theme  [event center]  n 9  clusters 7
(And (Member $e0 follow) (Theme $e0 $x1))
;;     c2661  mass 2  {region}
;;     c3170  mass 2  {traditions}
;;      c149  mass 1  {Henry Cole}
;;      c236  mass 1  {Layla}
;;      c254  mass 1  {Lukas}
;;      c262  mass 1  {Margaret Fleming}
;;     c2860  mass 1  {shoreline}

;; ---- slot hear.Stimulus  [event center]  n 9  clusters 9
(And (Member $e0 hear) (Stimulus $e0 $x1))
;;     c1066  mass 1  {crash}
;;     c1929  mass 1  {knock}
;;     c2205  mass 1  {music, upbeat}
;;     c2268  mass 1  {noise, ticking}
;;     c2863  mass 1  {shot}
;;     c2976  mass 1  {start}
;;     c3113  mass 1  {thing}
;;      c615  mass 1  {bang}
;;      c622  mass 1  {barking, growling, noises}

;; ---- slot kill.Agent  [event center]  n 9  clusters 6
(And (Member $e0 kill) (Agent $e0 $x1))
;;     c1778  mass 4  {hurricane}
;;     c1457  mass 1  {fire}
;;     c1776  mass 1  {hunter}
;;      c179  mass 1  {Ivan}
;;     c2020  mass 1  {lions}
;;      c793  mass 1  {cancer}

;; ---- slot sing.Agent  [event center]  n 9  clusters 7
(And (Member $e0 sing) (Agent $e0 $x1))
;;     c2419  mass 2  {person}
;;     c2884  mass 2  {sisters}
;;     c1645  mass 1  {groups, professional}
;;      c458  mass 1  {actress}
;;      c680  mass 1  {birds}
;;        c9  mass 1  {Amateur Barbershop Harmony Society}
;;       c91  mass 1  {David}

;; ---- slot take.Agent  [event center]  n 9  clusters 8
(And (Member $e0 take) (Agent $e0 $x1))
;;     c2419  mass 2  {person}
;;     c1022  mass 1  {cook}
;;      c144  mass 1  {Gustavo}
;;      c197  mass 1  {Jerry Rawlings}
;;      c229  mass 1  {Lajos}
;;     c2538  mass 1  {president}
;;      c277  mass 1  {Michael}
;;     c3113  mass 1  {thing}

;; ---- slot become.Result  [event center]  n 8  clusters 7
(And (Member $e0 become) (Result $e0 $x1))
;;      c598  mass 2  {bad}
;;     c1821  mass 1  {indigenous}
;;     c1837  mass 1  {inomaru}
;;     c1967  mass 1  {lax}
;;     c2652  mass 1  {red}
;;      c487  mass 1  {alarmed}
;;      c999  mass 1  {conservative}

;; ---- slot change.Patient  [event center]  n 8  clusters 7
(And (Member $e0 change) (Patient $e0 $x1))
;;     c3315  mass 2  {weather}
;;     c1052  mass 1  {course}
;;     c2148  mass 1  {mind}
;;     c2214  mass 1  {name}
;;     c2622  mass 1  {rain}
;;     c3113  mass 1  {thing}
;;      c943  mass 1  {color}

;; ---- slot hear.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 hear) (Experiencer $e0 $x1))
;;       c54  mass 2  {Bruno}
;;      c118  mass 1  {Fadil}
;;      c120  mass 1  {Flavio}
;;      c185  mass 1  {James}
;;      c204  mass 1  {Jonas}
;;      c308  mass 1  {Oleg}
;;       c88  mass 1  {Damiano}

;; ---- slot live.Agent  [event center]  n 8  clusters 8
(And (Member $e0 live) (Agent $e0 $x1))
;;      c109  mass 1  {Elias}
;;      c269  mass 1  {Mary}
;;       c31  mass 1  {Beja}
;;     c3357  mass 1  {wolves}
;;      c337  mass 1  {Ray Kurtzweil}
;;      c384  mass 1  {Tiziri}
;;      c423  mass 1  {Yidir}
;;       c58  mass 1  {Cainan}

;; ---- slot live.Location  [event center]  n 8  clusters 7
(And (Member $e0 live) (Location $e0 $x1))
;;      c304  mass 2  {Norway}
;;     c1644  mass 1  {group}
;;     c1760  mass 1  {house, isolated}
;;     c1761  mass 1  {house, large}
;;     c2932  mass 1  {southeastern corner}
;;     c3027  mass 1  {suburb}
;;      c956  mass 1  {comfortable, house}

;; ---- slot need.Experiencer  [event center]  n 8  clusters 8
(And (Member $e0 need) (Experiencer $e0 $x1))
;;     c1241  mass 1  {doctor}
;;     c1568  mass 1  {gate}
;;      c213  mass 1  {Karl}
;;      c268  mass 1  {Martino}
;;     c2775  mass 1  {sauce}
;;      c422  mass 1  {Yanni}
;;        c5  mass 1  {Algeria}
;;      c880  mass 1  {children}

;; ---- slot open.Patient  [event center]  n 8  clusters 4
(And (Member $e0 open) (Patient $e0 $x1))
;;     c1248  mass 4  {door}
;;     c1965  mass 2  {laws}
;;     c1252  mass 1  {door, vault like}
;;      c616  mass 1  {bank}

;; ---- slot play.Theme  [event center]  n 8  clusters 6
(And (Member $e0 play) (Theme $e0 $x1))
;;      c155  mass 2  {Holly Golightly}
;;     c3095  mass 2  {tennis}
;;     c1087  mass 1  {crucial, role}
;;     c1683  mass 1  {harp}
;;     c1806  mass 1  {important, role}
;;     c2819  mass 1  {series}

;; ---- slot produce.Agent  [event center]  n 8  clusters 5
(And (Member $e0 produce) (Agent $e0 $x1))
;;      c147  mass 2  {Harvey Hayutin}
;;      c376  mass 2  {Sy Weintraub}
;;       c77  mass 2  {Colin Richardson}
;;     c1971  mass 1  {layer, oil, thin}
;;     c2356  mass 1  {pancreas}

;; ---- slot speak.Agent  [event center]  n 8  clusters 6
(And (Member $e0 speak) (Agent $e0 $x1))
;;      c306  mass 2  {Oates}
;;      c367  mass 2  {Sophia}
;;      c212  mass 1  {Kari Wahlgren}
;;     c2125  mass 1  {men}
;;      c279  mass 1  {Mie Sonozaki}
;;      c420  mass 1  {Xavier}

;; ---- slot talk.Agent  [event center]  n 8  clusters 7
(And (Member $e0 talk) (Agent $e0 $x1))
;;      c215  mass 2  {Katherine}
;;     c1539  mass 1  {friends}
;;      c206  mass 1  {Jordan Peterson}
;;     c2279  mass 1  {novelist}
;;      c247  mass 1  {Linda}
;;     c2789  mass 1  {school janitor}
;;       c90  mass 1  {Daniel}

;; ---- slot use.Agent  [event center]  n 8  clusters 7
(And (Member $e0 use) (Agent $e0 $x1))
;;     c2035  mass 2  {localized versions}
;;     c1772  mass 1  {human brain}
;;     c2880  mass 1  {singer}
;;     c3218  mass 1  {ukrainian army}
;;      c491  mass 1  {algerian government}
;;       c73  mass 1  {Churchill}
;;       c87  mass 1  {Dad}

;; ---- slot walk.Agent  [event center]  n 8  clusters 8
(And (Member $e0 walk) (Agent $e0 $x1))
;;        c0  mass 1  {Adriano}
;;     c1102  mass 1  {customers}
;;      c119  mass 1  {Felix}
;;      c145  mass 1  {Hanako}
;;      c237  mass 1  {Leon}
;;      c277  mass 1  {Michael}
;;     c2789  mass 1  {school janitor}
;;      c517  mass 1  {ant}

;; ---- slot want.Experiencer  [event center]  n 8  clusters 7
(And (Member $e0 want) (Experiencer $e0 $x1))
;;       c20  mass 2  {Aslan}
;;      c105  mass 1  {Edmundo}
;;      c237  mass 1  {Leon}
;;      c319  mass 1  {Pepper}
;;       c32  mass 1  {Benedito}
;;      c390  mass 1  {Tony}
;;      c820  mass 1  {cat}

;; ---- slot work.Agent  [event center]  n 8  clusters 8
(And (Member $e0 work) (Agent $e0 $x1))
;;       c21  mass 1  {Asserson}
;;     c2419  mass 1  {person}
;;      c286  mass 1  {Mr. Jones}
;;     c3285  mass 1  {volunteers}
;;      c462  mass 1  {adaptor, old}
;;       c87  mass 1  {Dad}
;;       c89  mass 1  {Dan}
;;       c97  mass 1  {Dmitri}

;; ---- slot write.Agent  [event center]  n 8  clusters 5
(And (Member $e0 write) (Agent $e0 $x1))
;;      c137  mass 2  {Gilles Thibaut}
;;     c2419  mass 2  {person}
;;       c37  mass 2  {Bill Wrubel}
;;     c1421  mass 1  {famous, person}
;;      c763  mass 1  {busy, father}

;; ---- slot come.Agent  [event center]  n 7  clusters 7
(And (Member $e0 come) (Agent $e0 $x1))
;;     c1048  mass 1  {countries}
;;     c1216  mass 1  {discussion}
;;     c2125  mass 1  {men}
;;     c2892  mass 1  {sleep}
;;     c3020  mass 1  {students}
;;     c3174  mass 1  {train}
;;      c754  mass 1  {bus}

;; ---- slot contain.Agent  [event center]  n 7  clusters 5
(And (Member $e0 contain) (Agent $e0 $x1))
;;      c808  mass 3  {cards, deck}
;;     c2460  mass 1  {plasma}
;;     c2923  mass 1  {song}
;;     c3281  mass 1  {vitamin pill}
;;      c872  mass 1  {chest}

;; ---- slot contain.Theme  [event center]  n 7  clusters 7
(And (Member $e0 contain) (Theme $e0 $x1))
;;     c1148  mass 1  {degrading, lyric}
;;     c1317  mass 1  {electrolytes}
;;     c1616  mass 1  {gold coins}
;;     c1886  mass 1  {jacks}
;;     c1922  mass 1  {kings}
;;     c2610  mass 1  {queens}
;;      c439  mass 1  {abundant, nutrition}

;; ---- slot create.Patient  [event center]  n 7  clusters 4
(And (Member $e0 create) (Patient $e0 $x1))
;;      c964  mass 4  {community}
;;     c1947  mass 1  {language, new}
;;     c2378  mass 1  {particle accelerator}
;;      c780  mass 1  {calendars, various}

;; ---- slot form.Agent  [event center]  n 7  clusters 5
(And (Member $e0 form) (Agent $e0 $x1))
;;      c203  mass 2  {Jon Bon Jovi}
;;      c353  mass 2  {Sambora}
;;     c1934  mass 1  {labourers}
;;     c3088  mass 1  {technetium}
;;      c975  mass 1  {complex, simple}

;; ---- slot get.Patient  [event center]  n 7  clusters 7
(And (Member $e0 get) (Patient $e0 $x1))
;;     c1126  mass 1  {days, short}
;;     c1385  mass 1  {expensive, thing}
;;      c171  mass 1  {Iran}
;;      c600  mass 1  {bad, problem}
;;      c602  mass 1  {bad, weather}
;;      c672  mass 1  {big, fire}
;;      c864  mass 1  {cheap, excuses}

;; ---- slot make.Result  [event center]  n 7  clusters 7
(And (Member $e0 make) (Result $e0 $x1))
;;     c1690  mass 1  {hazardous}
;;     c1921  mass 1  {king}
;;     c3222  mass 1  {uncomfortable}
;;     c3335  mass 1  {white}
;;      c594  mass 1  {backward, country}
;;      c598  mass 1  {bad}
;;      c644  mass 1  {beautiful}

;; ---- slot sell.Theme  [event center]  n 7  clusters 6
(And (Member $e0 sell) (Theme $e0 $x1))
;;     c1784  mass 2  {ice cream}
;;     c1030  mass 1  {copies}
;;     c2146  mass 1  {milk}
;;     c3113  mass 1  {thing}
;;      c639  mass 1  {beans, roasted}
;;      c838  mass 1  {cell phone, new}

;; ---- slot serve.Theme  [event center]  n 7  clusters 4
(And (Member $e0 serve) (Theme $e0 $x1))
;;      c370  mass 3  {Springfield Station}
;;      c369  mass 2  {Springfield}
;;     c2704  mass 1  {revenge}
;;      c929  mass 1  {coffee}

;; ---- slot try.Theme  [event center]  n 7  clusters 7
(And (Member $e0 try) (Theme $e0 $x1))
;;     c1590  mass 1  {give up}
;;     c2582  mass 1  {pull}
;;     c2631  mass 1  {reach}
;;     c2983  mass 1  {steal}
;;      c440  mass 1  {abuse}
;;      c751  mass 1  {burnish}
;;      c782  mass 1  {call}

;; ---- slot turn.Patient  [event center]  n 7  clusters 7
(And (Member $e0 turn) (Patient $e0 $x1))
;;      c144  mass 1  {Gustavo}
;;     c1520  mass 1  {freedom movement, gusher}
;;     c1986  mass 1  {leaves, red, yellow}
;;     c2723  mass 1  {roads}
;;     c2760  mass 1  {russian speech}
;;     c3297  mass 1  {war}
;;      c685  mass 1  {black, ceiling}

;; ---- slot win.Agent  [event center]  n 7  clusters 5
(And (Member $e0 win) (Agent $e0 $x1))
;;      c187  mass 2  {James Woods}
;;      c418  mass 2  {Wilson}
;;     c1745  mass 1  {horse}
;;     c3341  mass 1  {wilson}
;;      c589  mass 1  {away team}

;; ---- slot <unclassed>.Only  [entity center]  n 6  clusters 4
(Only $x0 $x1)
;;     c1455  mass 2  {find}
;;     c1688  mass 2  {have}
;;     c2013  mass 1  {like}
;;     c2921  mass 1  {solve}

;; ---- slot appear.Agent  [event center]  n 6  clusters 3
(And (Member $e0 appear) (Agent $e0 $x1))
;;     c2419  mass 3  {person}
;;       c51  mass 2  {Brian Packham}
;;     c2884  mass 1  {sisters}

;; ---- slot bear.Patient  [event center]  n 6  clusters 4
(And (Member $e0 bear) (Patient $e0 $x1))
;;     c2419  mass 3  {person}
;;     c2079  mass 1  {man, poor}
;;      c385  mass 1  {Tobias}
;;      c395  mass 1  {Tycho Brahe}

;; ---- slot build.Instrument  [event center]  n 6  clusters 4
(And (Member $e0 build) (Instrument $e0 $x1))
;;     c1703  mass 2  {help}
;;      c625  mass 2  {barometer}
;;     c2536  mass 1  {presented in scale}
;;     c2537  mass 1  {presented, scale}

;; ---- slot capture.Theme  [event center]  n 6  clusters 6
(And (Member $e0 capture) (Theme $e0 $x1))
;;     c2064  mass 1  {magpie}
;;     c2131  mass 1  {merchant ship}
;;      c402  mass 1  {Valerian}
;;      c489  mass 1  {algerian cities}
;;      c733  mass 1  {british ship}
;;      c798  mass 1  {capital}

;; ---- slot cause.Agent  [event center]  n 6  clusters 6
(And (Member $e0 cause) (Agent $e0 $x1))
;;     c1156  mass 1  {demon}
;;     c2250  mass 1  {news}
;;     c2999  mass 1  {storm}
;;     c3116  mass 1  {things}
;;     c3135  mass 1  {tides}
;;     c3294  mass 1  {walk}

;; ---- slot create.Agent  [event center]  n 6  clusters 5
(And (Member $e0 create) (Agent $e0 $x1))
;;     c1359  mass 2  {european american settlers}
;;     c1823  mass 1  {indigenous americans}
;;     c2223  mass 1  {native americans}
;;      c315  mass 1  {Paul}
;;     c3383  mass 1  {writer}

;; ---- slot enter.Agent  [event center]  n 6  clusters 5
(And (Member $e0 enter) (Agent $e0 $x1))
;;      c232  mass 2  {Lake Sammamish}
;;     c2210  mass 1  {muslims}
;;      c236  mass 1  {Layla}
;;     c2410  mass 1  {people}
;;      c268  mass 1  {Martino}

;; ---- slot form.Patient  [event center]  n 6  clusters 5
(And (Member $e0 form) (Patient $e0 $x1))
;;     c2067  mass 2  {main songwriting unit}
;;     c1771  mass 1  {human barricade}
;;     c2069  mass 1  {main, songwriting unit}
;;     c3088  mass 1  {technetium}
;;      c975  mass 1  {complex, simple}

;; ---- slot fund.Agent  [event center]  n 6  clusters 3
(And (Member $e0 fund) (Agent $e0 $x1))
;;      c183  mass 3  {JICA}
;;     c1627  mass 2  {government}
;;      c142  mass 1  {Government of Uganda}

;; ---- slot get.Agent  [event center]  n 6  clusters 6
(And (Member $e0 get) (Agent $e0 $x1))
;;      c130  mass 1  {Gabriel}
;;      c192  mass 1  {Janos}
;;     c2080  mass 1  {man, young}
;;      c238  mass 1  {Leonid}
;;     c3113  mass 1  {thing}
;;       c96  mass 1  {Diego}

;; ---- slot get.Result  [event center]  n 6  clusters 6
(And (Member $e0 get) (Result $e0 $x1))
;;     c1384  mass 1  {expensive}
;;     c2520  mass 1  {powerful}
;;     c2634  mass 1  {ready}
;;     c2861  mass 1  {short}
;;      c598  mass 1  {bad}
;;      c863  mass 1  {cheap}

;; ---- slot help.Agent  [event center]  n 6  clusters 6
(And (Member $e0 help) (Agent $e0 $x1))
;;     c1014  mass 1  {context}
;;     c1755  mass 1  {hothouse conditions}
;;     c2004  mass 1  {life experience}
;;      c204  mass 1  {Jonas}
;;      c211  mass 1  {Karen}
;;      c277  mass 1  {Michael}

;; ---- slot receive.Theme  [event center]  n 6  clusters 5
(And (Member $e0 receive) (Theme $e0 $x1))
;;     c3368  mass 2  {work}
;;     c1738  mass 1  {honorary knighthood}
;;     c2416  mass 1  {permit}
;;      c588  mass 1  {award}
;;      c804  mass 1  {car, new}

;; ---- slot run.Agent  [event center]  n 6  clusters 5
(And (Member $e0 run) (Agent $e0 $x1))
;;      c134  mass 2  {George Allen}
;;     c1241  mass 1  {doctor}
;;     c1613  mass 1  {goat}
;;     c2963  mass 1  {squirrel}
;;      c385  mass 1  {Tobias}

;; ---- slot sleep.Experiencer  [event center]  n 6  clusters 5
(And (Member $e0 sleep) (Experiencer $e0 $x1))
;;      c820  mass 2  {cat}
;;     c1244  mass 1  {dog}
;;       c30  mass 1  {Baya}
;;      c878  mass 1  {child}
;;      c880  mass 1  {children}

;; ---- slot speak.Theme  [event center]  n 6  clusters 5
(And (Member $e0 speak) (Theme $e0 $x1))
;;       c19  mass 2  {Ashe}
;;     c1108  mass 1  {czech}
;;     c1338  mass 1  {english}
;;     c1497  mass 1  {foreign, language}
;;     c2485  mass 1  {polish}

;; ---- slot start.Agent  [event center]  n 6  clusters 6
(And (Member $e0 start) (Agent $e0 $x1))
;;     c1022  mass 1  {cook}
;;     c1085  mass 1  {crowd, whole}
;;     c1587  mass 1  {girls}
;;      c213  mass 1  {Karl}
;;     c2789  mass 1  {school janitor}
;;      c365  mass 1  {Skura}

;; ---- slot study.Location  [event center]  n 6  clusters 4
(And (Member $e0 study) (Location $e0 $x1))
;;      c207  mass 2  {Julian Ashton Art School}
;;       c92  mass 2  {Davis Studio}
;;      c289  mass 1  {Munich}
;;     c3232  mass 1  {university}

;; ---- slot write.CoAgent  [event center]  n 6  clusters 3
(And (Member $e0 write) (CoAgent $e0 $x1))
;;      c235  mass 2  {Laurie Aubanel}
;;       c34  mass 2  {Bianca Olsen}
;;       c86  mass 2  {Cyril Rambour}

;; ---- slot add.Agent  [event center]  n 5  clusters 4
(And (Member $e0 add) (Agent $e0 $x1))
;;     c3113  mass 2  {thing}
;;     c1022  mass 1  {cook}
;;      c181  mass 1  {J. Augustus Knapp}
;;     c2459  mass 1  {plants}

;; ---- slot appear.Location  [event center]  n 5  clusters 4
(And (Member $e0 appear) (Location $e0 $x1))
;;      c777  mass 2  {cafe}
;;     c2206  mass 1  {musical film}
;;       c80  mass 1  {Coronation Street}
;;      c954  mass 1  {comedic role}

;; ---- slot buy.Theme  [event center]  n 5  clusters 5
(And (Member $e0 buy) (Theme $e0 $x1))
;;     c1487  mass 1  {food}
;;     c1759  mass 1  {house}
;;     c3197  mass 1  {trouser, yellow}
;;      c695  mass 1  {blue, shirt}
;;      c979  mass 1  {computer}

;; ---- slot cry.Agent  [event center]  n 5  clusters 5
(And (Member $e0 cry) (Agent $e0 $x1))
;;     c1587  mass 1  {girls}
;;        c3  mass 1  {Alberto}
;;       c30  mass 1  {Baya}
;;      c340  mass 1  {Rima}
;;      c365  mass 1  {Skura}

;; ---- slot direct.Agent  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Agent $e0 $x1))
;;      c243  mass 2  {Lev L. Spiro}
;;      c345  mass 1  {Robert Day}
;;       c75  mass 1  {Claude Lelouch}
;;      c986  mass 1  {conductor}

;; ---- slot direct.Patient  [event center]  n 5  clusters 4
(And (Member $e0 direct) (Patient $e0 $x1))
;;     c1351  mass 2  {episode}
;;     c1450  mass 1  {film, syrian film}
;;     c2194  mass 1  {movie}
;;     c3113  mass 1  {thing}

;; ---- slot draw.Agent  [event center]  n 5  clusters 4
(And (Member $e0 draw) (Agent $e0 $x1))
;;       c82  mass 2  {Cowper}
;;      c878  mass 1  {child}
;;      c880  mass 1  {children}
;;      c981  mass 1  {concert}

;; ---- slot eat.Patient  [event center]  n 5  clusters 5
(And (Member $e0 eat) (Patient $e0 $x1))
;;     c1023  mass 1  {cookie}
;;     c1025  mass 1  {cookies}
;;     c2615  mass 1  {rabbit}
;;      c724  mass 1  {bread}
;;      c875  mass 1  {chicken}

;; ---- slot fly.Agent  [event center]  n 5  clusters 5
(And (Member $e0 fly) (Agent $e0 $x1))
;;     c1281  mass 1  {eagle}
;;     c1842  mass 1  {insects}
;;     c2454  mass 1  {plane}
;;     c2730  mass 1  {rocket}
;;      c374  mass 1  {Superman}

;; ---- slot include.Theme  [event center]  n 5  clusters 5
(And (Member $e0 include) (Theme $e0 $x1))
;;     c1394  mass 1  {extradition clause}
;;       c18  mass 1  {Armaan Jain}
;;     c2087  mass 1  {marching bands}
;;      c301  mass 1  {Nikhil Nanda}
;;      c335  mass 1  {Ranbir Kapoor}

;; ---- slot lead.Agent  [event center]  n 5  clusters 4
(And (Member $e0 lead) (Agent $e0 $x1))
;;     c3113  mass 2  {thing}
;;     c1244  mass 1  {dog}
;;     c1304  mass 1  {education}
;;     c1571  mass 1  {general}

;; ---- slot lead.Goal  [event center]  n 5  clusters 5
(And (Member $e0 lead) (Goal $e0 $x1))
;;     c1597  mass 1  {glory, lost}
;;     c1675  mass 1  {happiness}
;;     c1731  mass 1  {home}
;;     c2396  mass 1  {peace}
;;      c670  mass 1  {big, cat fight}

;; ---- slot marry.Agent  [event center]  n 5  clusters 4
(And (Member $e0 marry) (Agent $e0 $x1))
;;      c262  mass 2  {Margaret Fleming}
;;      c188  mass 1  {James of Barrochan}
;;      c293  mass 1  {Nancy}
;;      c372  mass 1  {Steve}

;; ---- slot need.Theme  [event center]  n 5  clusters 5
(And (Member $e0 need) (Theme $e0 $x1))
;;     c1574  mass 1  {generate}
;;     c1600  mass 1  {go}
;;     c2347  mass 1  {paint}
;;     c2751  mass 1  {run}
;;     c3225  mass 1  {understand}

;; ---- slot portray.Agent  [event center]  n 5  clusters 4
(And (Member $e0 portray) (Agent $e0 $x1))
;;      c366  mass 2  {Soichiro Akizuki}
;;      c187  mass 1  {James Woods}
;;     c3341  mass 1  {wilson}
;;      c418  mass 1  {Wilson}

;; ---- slot portray.Theme  [event center]  n 5  clusters 3
(And (Member $e0 portray) (Theme $e0 $x1))
;;      c187  mass 2  {James Woods}
;;      c210  mass 2  {Kantaro Suga}
;;      c418  mass 1  {Wilson}

;; ---- slot present.Theme  [event center]  n 5  clusters 4
(And (Member $e0 present) (Theme $e0 $x1))
;;     c2923  mass 2  {song}
;;     c1617  mass 1  {golden opportunity}
;;     c2432  mass 1  {picture}
;;     c2466  mass 1  {play}

;; ---- slot provide.Agent  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Agent $e0 $x1))
;;     c1925  mass 1  {kitchen island}
;;     c2112  mass 1  {media}
;;     c2316  mass 1  {organisation}
;;     c2519  mass 1  {power station}
;;     c3355  mass 1  {witnesses}

;; ---- slot provide.Theme  [event center]  n 5  clusters 5
(And (Member $e0 provide) (Theme $e0 $x1))
;;     c1046  mass 1  {counter space, extra}
;;     c1166  mass 1  {descriptions, detailed}
;;     c1315  mass 1  {electricity}
;;     c1487  mass 1  {food}
;;     c2478  mass 1  {plurivocality}

;; ---- slot ready.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 ready) (Experiencer $e0 $x1))
;;     c1203  mass 1  {dinner}
;;      c238  mass 1  {Leonid}
;;      c365  mass 1  {Skura}
;;      c422  mass 1  {Yanni}
;;      c778  mass 1  {cake}

;; ---- slot sell.Agent  [event center]  n 5  clusters 4
(And (Member $e0 sell) (Agent $e0 $x1))
;;      c965  mass 2  {company}
;;     c2251  mass 1  {newspaper}
;;      c276  mass 1  {Mennad}
;;      c931  mass 1  {coffee brand, indie}

;; ---- slot sing.Theme  [event center]  n 5  clusters 2
(And (Member $e0 sing) (Theme $e0 $x1))
;;     c2203  mass 4  {music}
;;     c2923  mass 1  {song}

;; ---- slot sing.To  [event center]  n 5  clusters 2
(And (Member $e0 sing) (To $e0 $x1))
;;      c443  mass 4  {accompany}
;;     c2204  mass 1  {music, sad}

;; ---- slot sleep.Location  [event center]  n 5  clusters 3
(And (Member $e0 sleep) (Location $e0 $x1))
;;     c1044  mass 3  {couch}
;;     c1843  mass 1  {inside}
;;     c2096  mass 1  {mat}

;; ---- slot stand.Experiencer  [event center]  n 5  clusters 5
(And (Member $e0 stand) (Experiencer $e0 $x1))
;;      c105  mass 1  {Edmundo}
;;     c1571  mass 1  {general}
;;        c3  mass 1  {Alberto}
;;     c3020  mass 1  {students}
;;       c96  mass 1  {Diego}

;; ---- slot start.Experiencer  [event center]  n 5  clusters 4
(And (Member $e0 start) (Experiencer $e0 $x1))
;;      c730  mass 2  {bridge}
;;      c143  mass 1  {Gunter}
;;      c308  mass 1  {Oleg}
;;     c3208  mass 1  {tunnel}

;; ---- slot study.Theme  [event center]  n 5  clusters 5
(And (Member $e0 study) (Theme $e0 $x1))
;;       c16  mass 1  {Arabic}
;;     c2111  mass 1  {mechanical engineering}
;;     c2630  mass 1  {rate}
;;      c597  mass 1  {bacterium, new}
;;      c797  mass 1  {canon law}

;; ---- slot swim.Agent  [event center]  n 5  clusters 4
(And (Member $e0 swim) (Agent $e0 $x1))
;;     c1463  mass 2  {fish, school}
;;     c1462  mass 1  {fish, red}
;;      c247  mass 1  {Linda}
;;      c880  mass 1  {children}

;; ---- slot travel.Agent  [event center]  n 5  clusters 4
(And (Member $e0 travel) (Agent $e0 $x1))
;;     c2410  mass 2  {people}
;;      c271  mass 1  {Matthew}
;;      c347  mass 1  {Roger}
;;      c788  mass 1  {campaigner}

;; ---- slot turn.Result  [event center]  n 5  clusters 5
(And (Member $e0 turn) (Result $e0 $x1))
;;     c1083  mass 1  {crow}
;;     c1655  mass 1  {gusher}
;;     c2652  mass 1  {red}
;;     c3389  mass 1  {yellow}
;;      c683  mass 1  {black}

;; ---- slot watch.Agent  [event center]  n 5  clusters 5
(And (Member $e0 watch) (Agent $e0 $x1))
;;     c1416  mass 1  {family}
;;     c1627  mass 1  {government}
;;     c2410  mass 1  {people}
;;       c30  mass 1  {Baya}
;;      c923  mass 1  {coach}

;; ---- slot win.Theme  [event center]  n 5  clusters 2
(And (Member $e0 win) (Theme $e0 $x1))
;;     c1324  mass 4  {emmy}
;;     c2616  mass 1  {race}

;; ---- slot bad.Between  [entity center]  n 4  clusters 2
(And (Member $x0 bad) (Between $x0 $x1))
;;      c135  mass 2  {Germany}
;;      c328  mass 2  {Poland}

;; ---- slot beauty.Possession  [entity center]  n 4  clusters 4
(And (Member $x0 beauty) (Possession $x0 $x1))
;;      c233  mass 1  {Lake Towada}
;;     c2785  mass 1  {scenery}
;;     c2833  mass 1  {sex}
;;     c2872  mass 1  {sight}

;; ---- slot family.Possession  [entity center]  n 4  clusters 1
(And (Member $x0 family) (Possession $x0 $x1))
;;     c2419  mass 4  {person}

;; ---- slot northern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 northern) (LocatedIn $x0 $x1))
;;      c114  mass 2  {Estonia}
;;      c165  mass 2  {India}

;; ---- slot southern.LocatedIn  [entity center]  n 4  clusters 2
(And (Member $x0 southern) (LocatedIn $x0 $x1))
;;      c165  mass 2  {India}
;;      c302  mass 2  {North Africa}

;; ---- slot accompany.Agent  [event center]  n 4  clusters 2
(And (Member $e0 accompany) (Agent $e0 $x1))
;;     c2419  mass 2  {person}
;;     c2884  mass 2  {sisters}

;; ---- slot accompany.Theme  [event center]  n 4  clusters 1
(And (Member $e0 accompany) (Theme $e0 $x1))
;;     c2877  mass 4  {silent film}

;; ---- slot active.Time  [event center]  n 4  clusters 2
(And (Member $e0 active) (Time $e0 $x1))
;;     c1285  mass 2  {early morning}
;;     c1956  mass 2  {late afternoon}

;; ---- slot add.Theme  [event center]  n 4  clusters 3
(And (Member $e0 add) (Theme $e0 $x1))
;;     c1796  mass 2  {illustrations}
;;     c1641  mass 1  {greenery}
;;      c921  mass 1  {cloves}

;; ---- slot arrive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 arrive) (Agent $e0 $x1))
;;     c1265  mass 1  {driver}
;;     c2373  mass 1  {paris train}
;;     c2960  mass 1  {spring}
;;       c98  mass 1  {Donald}

;; ---- slot avoid.Theme  [event center]  n 4  clusters 4
(And (Member $e0 avoid) (Theme $e0 $x1))
;;     c2448  mass 1  {pitfalls}
;;     c3113  mass 1  {thing}
;;      c619  mass 1  {bankruptcy}
;;      c988  mass 1  {conform}

;; ---- slot bad.Experiencer  [event center]  n 4  clusters 3
(And (Member $e0 bad) (Experiencer $e0 $x1))
;;      c601  mass 2  {bad, relationship}
;;      c599  mass 1  {bad, matter}
;;      c602  mass 1  {bad, weather}

;; ---- slot bear.Location  [event center]  n 4  clusters 3
(And (Member $e0 bear) (Location $e0 $x1))
;;       c52  mass 2  {Bromma}
;;     c2456  mass 1  {planet}
;;       c93  mass 1  {Denmark}

;; ---- slot begin.Patient  [event center]  n 4  clusters 4
(And (Member $e0 begin) (Patient $e0 $x1))
;;     c2260  mass 1  {night}
;;     c2788  mass 1  {school}
;;     c3189  mass 1  {trees}
;;     c3244  mass 1  {uprising}

;; ---- slot bring.Theme  [event center]  n 4  clusters 4
(And (Member $e0 bring) (Theme $e0 $x1))
;;      c205  mass 1  {Jonathan}
;;      c469  mass 1  {advantage}
;;      c733  mass 1  {british ship}
;;      c884  mass 1  {chinese dumpling}

;; ---- slot capture.Agent  [event center]  n 4  clusters 4
(And (Member $e0 capture) (Agent $e0 $x1))
;;     c1411  mass 1  {falcon}
;;     c2444  mass 1  {pirates}
;;     c3194  mass 1  {troops}
;;      c368  mass 1  {Spain}

;; ---- slot cause.Patient  [event center]  n 4  clusters 4
(And (Member $e0 cause) (Patient $e0 $x1))
;;     c1071  mass 1  {creaking, sound}
;;     c1111  mass 1  {damage}
;;     c1292  mass 1  {earthquakes}
;;      c433  mass 1  {abandonment anxiety}

;; ---- slot change.Agent  [event center]  n 4  clusters 4
(And (Member $e0 change) (Agent $e0 $x1))
;;      c125  mass 1  {French Dahomey}
;;     c1985  mass 1  {leaves}
;;     c2077  mass 1  {man}
;;       c60  mass 1  {Cameron}

;; ---- slot close.Experiencer  [event center]  n 4  clusters 2
(And (Member $e0 close) (Experiencer $e0 $x1))
;;      c253  mass 3  {Low German}
;;       c41  mass 1  {Boldi}

;; ---- slot come.Source  [event center]  n 4  clusters 4
(And (Member $e0 come) (Source $e0 $x1))
;;     c1563  mass 1  {garden}
;;     c1638  mass 1  {greek}
;;     c2452  mass 1  {places}
;;     c3188  mass 1  {treeline}

;; ---- slot connect.Theme  [event center]  n 4  clusters 3
(And (Member $e0 connect) (Theme $e0 $x1))
;;      c217  mass 2  {Kayalar}
;;      c292  mass 1  {Nagoya}
;;      c386  mass 1  {Tokyo}

;; ---- slot create.Location  [event center]  n 4  clusters 1
(And (Member $e0 create) (Location $e0 $x1))
;;     c2508  mass 4  {post}

;; ---- slot decide.Agent  [event center]  n 4  clusters 3
(And (Member $e0 decide) (Agent $e0 $x1))
;;      c127  mass 2  {Fyodor}
;;      c109  mass 1  {Elias}
;;       c33  mass 1  {Beth}

;; ---- slot design.Agent  [event center]  n 4  clusters 3
(And (Member $e0 design) (Agent $e0 $x1))
;;      c150  mass 2  {Henry L. Taylor}
;;      c324  mass 1  {Philip Hercus}
;;      c344  mass 1  {Robert Allan Limited}

;; ---- slot design.Patient  [event center]  n 4  clusters 2
(And (Member $e0 design) (Patient $e0 $x1))
;;     c2342  mass 2  {pacificats}
;;     c3113  mass 2  {thing}

;; ---- slot die.Patient  [event center]  n 4  clusters 3
(And (Member $e0 die) (Patient $e0 $x1))
;;     c2419  mass 2  {person}
;;     c1415  mass 1  {families}
;;     c2410  mass 1  {people}

;; ---- slot discover.Theme  [event center]  n 4  clusters 3
(And (Member $e0 discover) (Theme $e0 $x1))
;;     c2214  mass 2  {name}
;;     c2063  mass 1  {magnet, new, type}
;;     c2577  mass 1  {pterosaur eggs}

;; ---- slot do.Patient  [event center]  n 4  clusters 4
(And (Member $e0 do) (Patient $e0 $x1))
;;     c1114  mass 1  {dance, little}
;;     c1219  mass 1  {dishes}
;;     c3113  mass 1  {thing}
;;     c3116  mass 1  {things}

;; ---- slot eat.Agent  [event center]  n 4  clusters 4
(And (Member $e0 eat) (Agent $e0 $x1))
;;     c2419  mass 1  {person}
;;      c680  mass 1  {birds}
;;      c736  mass 1  {brown, dog}
;;      c880  mass 1  {children}

;; ---- slot encourage.In  [event center]  n 4  clusters 3
(And (Member $e0 encourage) (In $e0 $x1))
;;     c2099  mass 2  {mathematics}
;;      c870  mass 1  {chess}
;;      c871  mass 1  {chess play}

;; ---- slot enter.Theme  [event center]  n 4  clusters 4
(And (Member $e0 enter) (Theme $e0 $x1))
;;      c176  mass 1  {Issaquah Creek}
;;     c2374  mass 1  {park}
;;      c401  mass 1  {United States}
;;      c830  mass 1  {cave}

;; ---- slot find.Agent  [event center]  n 4  clusters 3
(And (Member $e0 find) (Agent $e0 $x1))
;;       c81  mass 2  {Couper}
;;      c120  mass 1  {Flavio}
;;      c325  mass 1  {Pietro}

;; ---- slot get.Theme  [event center]  n 4  clusters 4
(And (Member $e0 get) (Theme $e0 $x1))
;;     c1668  mass 1  {hamster}
;;     c2056  mass 1  {low, price}
;;     c2900  mass 1  {snack}
;;      c547  mass 1  {arrest}

;; ---- slot give.Theme  [event center]  n 4  clusters 4
(And (Member $e0 give) (Theme $e0 $x1))
;;     c2159  mass 1  {mock champagne}
;;     c3113  mass 1  {thing}
;;      c471  mass 1  {advice, good}
;;      c885  mass 1  {chocolate}

;; ---- slot good.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 good) (Experiencer $e0 $x1))
;;     c3113  mass 1  {thing}
;;     c3315  mass 1  {weather}
;;     c3346  mass 1  {windshield}
;;      c624  mass 1  {barley bread}

;; ---- slot help.Theme  [event center]  n 4  clusters 4
(And (Member $e0 help) (Theme $e0 $x1))
;;     c1145  mass 1  {define}
;;     c1585  mass 1  {girl}
;;     c2410  mass 1  {people}
;;     c3124  mass 1  {thrive}

;; ---- slot include.Agent  [event center]  n 4  clusters 2
(And (Member $e0 include) (Agent $e0 $x1))
;;     c2238  mass 3  {nephews}
;;     c2364  mass 1  {parade}

;; ---- slot increase.Patient  [event center]  n 4  clusters 4
(And (Member $e0 increase) (Patient $e0 $x1))
;;     c1827  mass 1  {industrial output}
;;     c2184  mass 1  {motor vehicles}
;;     c3220  mass 1  {ukrainian combat losses}
;;     c3386  mass 1  {xenophobia}

;; ---- slot jump.Agent  [event center]  n 4  clusters 4
(And (Member $e0 jump) (Agent $e0 $x1))
;;     c1056  mass 1  {cow}
;;     c1247  mass 1  {donkey}
;;      c717  mass 1  {boys}
;;      c738  mass 1  {brown, fox, quick}

;; ---- slot kill.Location  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Location $e0 $x1))
;;     c2977  mass 3  {state}
;;     c1706  mass 1  {here}

;; ---- slot kill.Manner  [event center]  n 4  clusters 2
(And (Member $e0 kill) (Manner $e0 $x1))
;;     c1209  mass 2  {directly}
;;     c1825  mass 2  {indirectly}

;; ---- slot lie.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 lie) (Experiencer $e0 $x1))
;;     c2277  mass 1  {notebook}
;;     c2406  mass 1  {pen}
;;     c3075  mass 1  {tape recorder}
;;      c703  mass 1  {book}

;; ---- slot lie.Location  [event center]  n 4  clusters 1
(And (Member $e0 lie) (Location $e0 $x1))
;;     c3065  mass 4  {table}

;; ---- slot look.Experiencer  [event center]  n 4  clusters 4
(And (Member $e0 look) (Experiencer $e0 $x1))
;;      c115  mass 1  {Europe}
;;     c1465  mass 1  {flag}
;;     c1874  mass 1  {island}
;;     c2788  mass 1  {school}

;; ---- slot look.Like  [event center]  n 4  clusters 4
(And (Member $e0 look) (Like $e0 $x1))
;;     c1767  mass 1  {huge, spider}
;;     c1864  mass 1  {inverted, philippine flag}
;;     c2365  mass 1  {paradise}
;;     c2548  mass 1  {prison}

;; ---- slot move.Agent  [event center]  n 4  clusters 3
(And (Member $e0 move) (Agent $e0 $x1))
;;     c1692  mass 2  {headquarters}
;;     c1463  mass 1  {fish, school}
;;      c355  mass 1  {Sammy}

;; ---- slot perform.Location  [event center]  n 4  clusters 3
(And (Member $e0 perform) (Location $e0 $x1))
;;      c777  mass 2  {cafe}
;;     c1731  mass 1  {home}
;;     c2578  mass 1  {public}

;; ---- slot preach.Agent  [event center]  n 4  clusters 1
(And (Member $e0 preach) (Agent $e0 $x1))
;;     c2419  mass 4  {person}

;; ---- slot preach.Location  [event center]  n 4  clusters 2
(And (Member $e0 preach) (Location $e0 $x1))
;;      c131  mass 2  {Gareccio}
;;      c178  mass 2  {Italy}

;; ---- slot present.Agent  [event center]  n 4  clusters 3
(And (Member $e0 present) (Agent $e0 $x1))
;;      c158  mass 2  {Horner}
;;     c1617  mass 1  {golden opportunity}
;;      c965  mass 1  {company}

;; ---- slot receive.Agent  [event center]  n 4  clusters 4
(And (Member $e0 receive) (Agent $e0 $x1))
;;      c133  mass 1  {General Franks}
;;     c2659  mass 1  {refugees}
;;       c33  mass 1  {Beth}
;;     c3349  mass 1  {winner}

;; ---- slot replace.Agent  [event center]  n 4  clusters 3
(And (Member $e0 replace) (Agent $e0 $x1))
;;      c363  mass 2  {Sherman Howard}
;;     c2419  mass 1  {person}
;;      c323  mass 1  {Peter Gaussen}

;; ---- slot replace.Theme  [event center]  n 4  clusters 4
(And (Member $e0 replace) (Theme $e0 $x1))
;;     c2419  mass 1  {person}
;;      c244  mass 1  {Lex Lex Luthor}
;;      c245  mass 1  {Lex Luthor}
;;      c417  mass 1  {William Ewer}

;; ---- slot require.Theme  [event center]  n 4  clusters 4
(And (Member $e0 require) (Theme $e0 $x1))
;;     c1678  mass 1  {hard, work}
;;     c1788  mass 1  {id card, valid}
;;     c2675  mass 1  {repairs}
;;      c505  mass 1  {american phone number}

;; ---- slot specify.In  [event center]  n 4  clusters 2
(And (Member $e0 specify) (In $e0 $x1))
;;     c1017  mass 2  {continuous time}
;;     c1215  mass 2  {discrete time}

;; ---- slot spend.Agent  [event center]  n 4  clusters 3
(And (Member $e0 spend) (Agent $e0 $x1))
;;     c2419  mass 2  {person}
;;     c1584  mass 1  {giraffes}
;;      c273  mass 1  {May}

;; ---- slot star.Agent  [event center]  n 4  clusters 1
(And (Member $e0 star) (Agent $e0 $x1))
;;     c3113  mass 4  {thing}

;; ---- slot star.Theme  [event center]  n 4  clusters 2
(And (Member $e0 star) (Theme $e0 $x1))
;;      c196  mass 2  {Jeremy Irons}
;;      c314  mass 2  {Patricia Kaas}

;; ---- slot stop.Agent  [event center]  n 4  clusters 4
(And (Member $e0 stop) (Agent $e0 $x1))
;;      c340  mass 1  {Rima}
;;      c365  mass 1  {Skura}
;;      c422  mass 1  {Yanni}
;;      c462  mass 1  {adaptor, old}

;; ---- slot stop.Theme  [event center]  n 4  clusters 2
(And (Member $e0 stop) (Theme $e0 $x1))
;;     c1088  mass 2  {cry}
;;     c3368  mass 2  {work}

;; ---- slot support.Theme  [event center]  n 4  clusters 1
(And (Member $e0 support) (Theme $e0 $x1))
;;     c3270  mass 4  {views}

;; ---- slot use.Manner  [event center]  n 4  clusters 3
(And (Member $e0 use) (Manner $e0 $x1))
;;     c2628  mass 2  {rarely}
;;     c2692  mass 1  {responsibly}
;;      c940  mass 1  {colloquially}

;; ---- slot use.To  [event center]  n 4  clusters 4
(And (Member $e0 use) (To $e0 $x1))
;;     c1180  mass 1  {develop}
;;     c1979  mass 1  {learn}
;;     c2074  mass 1  {make}
;;     c2725  mass 1  {roast}

;; ---- slot walk.Goal  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Goal $e0 $x1))
;;     c1501  mass 1  {forest}
;;     c2995  mass 1  {store}
;;      c591  mass 1  {back}
;;      c897  mass 1  {classroom}

;; ---- slot walk.Location  [event center]  n 4  clusters 4
(And (Member $e0 walk) (Location $e0 $x1))
;;     c1118  mass 1  {dark}
;;     c1665  mass 1  {hallway}
;;     c3362  mass 1  {wood floor}
;;      c611  mass 1  {balloon, little}

;; ---- slot watch.Theme  [event center]  n 4  clusters 4
(And (Member $e0 watch) (Theme $e0 $x1))
;;     c1362  mass 1  {event}
;;     c2194  mass 1  {movie}
;;     c2225  mass 1  {natural hair video}
;;      c455  mass 1  {activities}

;; ---- slot win.For  [event center]  n 4  clusters 2
(And (Member $e0 win) (For $e0 $x1))
;;     c2501  mass 3  {portray}
;;     c2502  mass 1  {portrayal}

;; ---- slot work.Location  [event center]  n 4  clusters 4
(And (Member $e0 work) (Location $e0 $x1))
;;      c115  mass 1  {Europe}
;;     c1403  mass 1  {factory}
;;     c2549  mass 1  {prison kitchen}
;;       c72  mass 1  {Church of Norway}

;; ---- slot bottom.PartOf  [entity center]  n 3  clusters 2
(And (Member $x0 bottom) (PartOf $x0 $x1))
;;     c2346  mass 2  {page}
;;     c2988  mass 1  {stew pot}

;; ---- slot fight.Against  [entity center]  n 3  clusters 3
(And (Member $x0 fight) (Against $x0 $x1))
;;     c1133  mass 1  {death}
;;     c1429  mass 1  {fate}
;;     c2227  mass 1  {nature}

;; ---- slot thing.LocatedIn  [entity center]  n 3  clusters 2
(And (Member $x0 thing) (LocatedIn $x0 $x1))
;;     c1719  mass 2  {hills}
;;      c915  mass 1  {closet}

;; ---- slot active.Experiencer  [event center]  n 3  clusters 2
(And (Member $e0 active) (Experiencer $e0 $x1))
;;     c3113  mass 2  {thing}
;;       c21  mass 1  {Asserson}

;; ---- slot affect.Agent  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Agent $e0 $x1))
;;     c1106  mass 3  {cyberattack}

;; ---- slot affect.Location  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Location $e0 $x1))
;;     c3372  mass 3  {world}

;; ---- slot affect.Theme  [event center]  n 3  clusters 3
(And (Member $e0 affect) (Theme $e0 $x1))
;;     c1748  mass 1  {hospital}
;;      c616  mass 1  {bank}
;;      c965  mass 1  {company}

;; ---- slot affect.Time  [event center]  n 3  clusters 1
(And (Member $e0 affect) (Time $e0 $x1))
;;     c3122  mass 3  {this year}

;; ---- slot approve.Theme  [event center]  n 3  clusters 3
(And (Member $e0 approve) (Theme $e0 $x1))
;;     c2453  mass 1  {plan}
;;     c3186  mass 1  {treaty}
;;      c675  mass 1  {bill}

;; ---- slot attack.Patient  [event center]  n 3  clusters 3
(And (Member $e0 attack) (Patient $e0 $x1))
;;     c1011  mass 1  {consumer rights}
;;      c346  mass 1  {Rodrigo}
;;      c744  mass 1  {building}

;; ---- slot bake.Agent  [event center]  n 3  clusters 2
(And (Member $e0 bake) (Agent $e0 $x1))
;;      c965  mass 2  {company}
;;      c110  mass 1  {Ella}

;; ---- slot bake.Patient  [event center]  n 3  clusters 3
(And (Member $e0 bake) (Patient $e0 $x1))
;;     c1783  mass 1  {ice cone}
;;     c1785  mass 1  {ice cream cone}
;;     c2434  mass 1  {pie, scrumptious}

;; ---- slot base.On  [event center]  n 3  clusters 3
(And (Member $e0 base) (On $e0 $x1))
;;     c1447  mass 1  {fight}
;;     c1960  mass 1  {latin alphabet}
;;     c2590  mass 1  {puritan value}

;; ---- slot beautiful.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 beautiful) (Experiencer $e0 $x1))
;;     c3315  mass 1  {weather}
;;      c646  mass 1  {beautiful, moon}
;;      c647  mass 1  {beautiful, room}

;; ---- slot break_out.Patient  [event center]  n 3  clusters 3
(And (Member $e0 break_out) (Patient $e0 $x1))
;;     c1457  mass 1  {fire}
;;     c1503  mass 1  {forest fires}
;;     c3297  mass 1  {war}

;; ---- slot bring.Goal  [event center]  n 3  clusters 3
(And (Member $e0 bring) (Goal $e0 $x1))
;;     c1558  mass 1  {gallows}
;;      c166  mass 1  {Indonesia}
;;      c401  mass 1  {United States}

;; ---- slot buy.Agent  [event center]  n 3  clusters 2
(And (Member $e0 buy) (Agent $e0 $x1))
;;      c219  mass 2  {Keike}
;;      c338  mass 1  {Regis}

;; ---- slot close.Agent  [event center]  n 3  clusters 3
(And (Member $e0 close) (Agent $e0 $x1))
;;     c1438  mass 1  {female, giraffe}
;;     c1650  mass 1  {guard}
;;     c2437  mass 1  {pilot}

;; ---- slot close.Goal  [event center]  n 3  clusters 3
(And (Member $e0 close) (Goal $e0 $x1))
;;      c102  mass 1  {Dutch}
;;      c126  mass 1  {Frisian}
;;      c154  mass 1  {High German}

;; ---- slot close.Patient  [event center]  n 3  clusters 2
(And (Member $e0 close) (Patient $e0 $x1))
;;     c1248  mass 2  {door}
;;     c2995  mass 1  {store}

;; ---- slot come.Goal  [event center]  n 3  clusters 3
(And (Member $e0 come) (Goal $e0 $x1))
;;     c2489  mass 1  {political, settlement}
;;      c981  mass 1  {concert}
;;      c983  mass 1  {conclusion}

;; ---- slot come.Patient  [event center]  n 3  clusters 3
(And (Member $e0 come) (Patient $e0 $x1))
;;     c1841  mass 1  {insect sounds}
;;     c2929  mass 1  {sound}
;;     c3217  mass 1  {typhoon}

;; ---- slot come_back.Agent  [event center]  n 3  clusters 3
(And (Member $e0 come_back) (Agent $e0 $x1))
;;     c1109  mass 1  {dad}
;;     c2169  mass 1  {mom}
;;      c715  mass 1  {boy}

;; ---- slot compose.Patient  [event center]  n 3  clusters 2
(And (Member $e0 compose) (Patient $e0 $x1))
;;     c2923  mass 2  {song}
;;     c1637  mass 1  {great, symphonies}

;; ---- slot conduct.Agent  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Agent $e0 $x1))
;;       c63  mass 2  {Carl Fenton}
;;      c116  mass 1  {FBI}

;; ---- slot conduct.Theme  [event center]  n 3  clusters 2
(And (Member $e0 conduct) (Theme $e0 $x1))
;;     c2314  mass 2  {orchestra}
;;     c3048  mass 1  {surveillance}

;; ---- slot cover.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Instrument $e0 $x1))
;;     c2359  mass 1  {paper decorations}
;;     c2903  mass 1  {snow}
;;     c3320  mass 1  {weed}

;; ---- slot cover.Patient  [event center]  n 3  clusters 3
(And (Member $e0 cover) (Patient $e0 $x1))
;;     c1053  mass 1  {courtyard}
;;     c2857  mass 1  {shopping arcade}
;;     c3151  mass 1  {top}

;; ---- slot define.Theme  [event center]  n 3  clusters 2
(And (Member $e0 define) (Theme $e0 $x1))
;;     c2818  mass 2  {sequences}
;;     c3113  mass 1  {thing}

;; ---- slot die.Location  [event center]  n 3  clusters 2
(And (Member $e0 die) (Location $e0 $x1))
;;      c373  mass 2  {Stockholm}
;;     c1457  mass 1  {fire}

;; ---- slot drink.Patient  [event center]  n 3  clusters 2
(And (Member $e0 drink) (Patient $e0 $x1))
;;     c3084  mass 2  {tea}
;;     c1623  mass 1  {good, water}

;; ---- slot drive.Agent  [event center]  n 3  clusters 2
(And (Member $e0 drive) (Agent $e0 $x1))
;;      c754  mass 2  {bus}
;;     c3256  mass 1  {van}

;; ---- slot encourage.Agent  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Agent $e0 $x1))
;;      c334  mass 3  {Ralph}

;; ---- slot encourage.Theme  [event center]  n 3  clusters 1
(And (Member $e0 encourage) (Theme $e0 $x1))
;;      c272  mass 3  {Maurice}

;; ---- slot endorse.Theme  [event center]  n 3  clusters 1
(And (Member $e0 endorse) (Theme $e0 $x1))
;;     c3270  mass 3  {views}

;; ---- slot fall.Source  [event center]  n 3  clusters 3
(And (Member $e0 fall) (Source $e0 $x1))
;;     c2845  mass 1  {shelf}
;;     c2890  mass 1  {sky}
;;     c3187  mass 1  {tree}

;; ---- slot fight.Agent  [event center]  n 3  clusters 2
(And (Member $e0 fight) (Agent $e0 $x1))
;;     c1903  mass 2  {kabye people}
;;     c3231  mass 1  {union bosses}

;; ---- slot fight.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fight) (Theme $e0 $x1))
;;     c1524  mass 1  {freeze}
;;     c1872  mass 1  {islamic fundamentalism}
;;     c3099  mass 1  {terrorism}

;; ---- slot fund.Theme  [event center]  n 3  clusters 3
(And (Member $e0 fund) (Theme $e0 $x1))
;;      c241  mass 1  {Lessos-Kenya}
;;      c242  mass 1  {Lessos-Uganda}
;;      c707  mass 1  {border section}

;; ---- slot give.Agent  [event center]  n 3  clusters 2
(And (Member $e0 give) (Agent $e0 $x1))
;;      c408  mass 2  {Vladimir}
;;      c416  mass 1  {William}

;; ---- slot go.Manner  [event center]  n 3  clusters 2
(And (Member $e0 go) (Manner $e0 $x1))
;;     c1955  mass 2  {late}
;;     c1800  mass 1  {immediately}

;; ---- slot go.To  [event center]  n 3  clusters 2
(And (Member $e0 go) (To $e0 $x1))
;;     c3073  mass 2  {talk}
;;     c2809  mass 1  {see}

;; ---- slot grow.Patient  [event center]  n 3  clusters 3
(And (Member $e0 grow) (Patient $e0 $x1))
;;     c1407  mass 1  {faint, sound}
;;      c209  mass 1  {Kalman}
;;      c641  mass 1  {beard}

;; ---- slot have.In  [event center]  n 3  clusters 2
(And (Member $e0 have) (In $e0 $x1))
;;     c1478  mass 2  {fluid mechanics}
;;     c2480  mass 1  {poetry}

;; ---- slot hold.Patient  [event center]  n 3  clusters 3
(And (Member $e0 hold) (Patient $e0 $x1))
;;     c2119  mass 1  {meeting}
;;     c2526  mass 1  {prayers}
;;      c848  mass 1  {ceremony, mass}

;; ---- slot lead.Theme  [event center]  n 3  clusters 3
(And (Member $e0 lead) (Theme $e0 $x1))
;;     c2842  mass 1  {sheep}
;;     c2961  mass 1  {squad}
;;      c670  mass 1  {big, cat fight}

;; ---- slot learn.Theme  [event center]  n 3  clusters 3
(And (Member $e0 learn) (Theme $e0 $x1))
;;     c1497  mass 1  {foreign, language}
;;     c3282  mass 1  {vocabulary}
;;      c659  mass 1  {berber}

;; ---- slot leave.Patient  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Patient $e0 $x1))
;;     c1250  mass 1  {door, open}
;;     c1251  mass 1  {door, unlocked}
;;     c2012  mass 1  {lights, on}

;; ---- slot leave.Result  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Result $e0 $x1))
;;     c2302  mass 1  {on}
;;     c2308  mass 1  {open}
;;     c3234  mass 1  {unlocked}

;; ---- slot leave.Theme  [event center]  n 3  clusters 3
(And (Member $e0 leave) (Theme $e0 $x1))
;;     c2376  mass 1  {parking lot}
;;     c2737  mass 1  {room}
;;      c801  mass 1  {car}

;; ---- slot lose.Agent  [event center]  n 3  clusters 2
(And (Member $e0 lose) (Agent $e0 $x1))
;;      c134  mass 2  {George Allen}
;;     c3141  mass 1  {tire}

;; ---- slot move.Goal  [event center]  n 3  clusters 2
(And (Member $e0 move) (Goal $e0 $x1))
;;       c27  mass 2  {Baltimore}
;;     c1706  mass 1  {here}

;; ---- slot paint.Patient  [event center]  n 3  clusters 2
(And (Member $e0 paint) (Patient $e0 $x1))
;;     c1944  mass 2  {landscape}
;;     c1568  mass 1  {gate}

;; ---- slot pick_up.Agent  [event center]  n 3  clusters 3
(And (Member $e0 pick_up) (Agent $e0 $x1))
;;      c195  mass 1  {Jay}
;;      c358  mass 1  {Santiago}
;;      c787  mass 1  {camera}

;; ---- slot play.Location  [event center]  n 3  clusters 2
(And (Member $e0 play) (Location $e0 $x1))
;;      c148  mass 2  {Havana}
;;     c1473  mass 1  {floor}

;; ---- slot pull.Theme  [event center]  n 3  clusters 3
(And (Member $e0 pull) (Theme $e0 $x1))
;;     c1527  mass 1  {freight cars, line, long}
;;      c358  mass 1  {Santiago}
;;       c44  mass 1  {Boris}

;; ---- slot read.Agent  [event center]  n 3  clusters 3
(And (Member $e0 read) (Agent $e0 $x1))
;;     c1586  mass 1  {girl, little}
;;      c216  mass 1  {Katya}
;;      c381  mass 1  {Thomas}

;; ---- slot read.Theme  [event center]  n 3  clusters 3
(And (Member $e0 read) (Theme $e0 $x1))
;;     c1301  mass 1  {economics magazine}
;;     c1409  mass 1  {fairy tale}
;;      c957  mass 1  {comic}

;; ---- slot require.Agent  [event center]  n 3  clusters 3
(And (Member $e0 require) (Agent $e0 $x1))
;;     c1759  mass 1  {house}
;;     c2095  mass 1  {master}
;;      c526  mass 1  {app}

;; ---- slot return.Agent  [event center]  n 3  clusters 2
(And (Member $e0 return) (Agent $e0 $x1))
;;      c139  mass 2  {Glasnow}
;;     c1464  mass 1  {fishing boat}

;; ---- slot return.Goal  [event center]  n 3  clusters 2
(And (Member $e0 return) (Goal $e0 $x1))
;;        c7  mass 2  {Altoona}
;;     c2499  mass 1  {port}

;; ---- slot rule.Agent  [event center]  n 3  clusters 2
(And (Member $e0 rule) (Agent $e0 $x1))
;;      c383  mass 2  {Tipu Sultan}
;;      c368  mass 1  {Spain}

;; ---- slot rule.Theme  [event center]  n 3  clusters 3
(And (Member $e0 rule) (Theme $e0 $x1))
;;     c1762  mass 1  {house, muslim}
;;     c2209  mass 1  {muslim house}
;;       c84  mass 1  {Cuba}

;; ---- slot say.Theme  [event center]  n 3  clusters 2
(And (Member $e0 say) (Theme $e0 $x1))
;;     c3113  mass 2  {thing}
;;     c1553  mass 1  {funeral prayer}

;; ---- slot season.Instrument  [event center]  n 3  clusters 3
(And (Member $e0 season) (Instrument $e0 $x1))
;;     c1746  mass 1  {horse radish}
;;     c1994  mass 1  {lemongrass}
;;     c2625  mass 1  {ramson}

;; ---- slot see.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 see) (Stimulus $e0 $x1))
;;     c1544  mass 1  {full moon}
;;      c199  mass 1  {Jessica}
;;      c510  mass 1  {animals}

;; ---- slot shoot.Patient  [event center]  n 3  clusters 3
(And (Member $e0 shoot) (Patient $e0 $x1))
;;      c182  mass 1  {JFK}
;;      c640  mass 1  {bear}
;;       c89  mass 1  {Dan}

;; ---- slot sleep.Agent  [event center]  n 3  clusters 2
(And (Member $e0 sleep) (Agent $e0 $x1))
;;     c2419  mass 2  {person}
;;     c1416  mass 1  {family}

;; ---- slot solve.Patient  [event center]  n 3  clusters 2
(And (Member $e0 solve) (Patient $e0 $x1))
;;     c2550  mass 2  {problem}
;;     c2551  mass 1  {problems}

;; ---- slot spend.Theme  [event center]  n 3  clusters 2
(And (Member $e0 spend) (Theme $e0 $x1))
;;     c1377  mass 2  {exile}
;;     c1123  mass 1  {day}

;; ---- slot start.Location  [event center]  n 3  clusters 2
(And (Member $e0 start) (Location $e0 $x1))
;;      c375  mass 2  {Sweden}
;;       c93  mass 1  {Denmark}

;; ---- slot stick.Patient  [event center]  n 3  clusters 3
(And (Member $e0 stick) (Patient $e0 $x1))
;;     c1745  mass 1  {horse}
;;     c3199  mass 1  {truck}
;;      c873  mass 1  {chewing gum}

;; ---- slot succeed.Agent  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Agent $e0 $x1))
;;       c26  mass 1  {Bailey}
;;      c323  mass 1  {Peter Gaussen}
;;        c4  mass 1  {Alexander}

;; ---- slot succeed.Theme  [event center]  n 3  clusters 3
(And (Member $e0 succeed) (Theme $e0 $x1))
;;      c149  mass 1  {Henry Cole}
;;     c2419  mass 1  {person}
;;      c262  mass 1  {Margaret Fleming}

;; ---- slot take_off.Agent  [event center]  n 3  clusters 3
(And (Member $e0 take_off) (Agent $e0 $x1))
;;     c2454  mass 1  {plane}
;;      c486  mass 1  {airplane}
;;       c89  mass 1  {Dan}

;; ---- slot take_over.Agent  [event center]  n 3  clusters 2
(And (Member $e0 take_over) (Agent $e0 $x1))
;;      c410  mass 2  {Watts}
;;     c1882  mass 1  {ivy}

;; ---- slot talk.Recipient  [event center]  n 3  clusters 3
(And (Member $e0 talk) (Recipient $e0 $x1))
;;      c251  mass 1  {Loren}
;;     c3086  mass 1  {teacher}
;;      c580  mass 1  {audience, large}

;; ---- slot turn.Goal  [event center]  n 3  clusters 3
(And (Member $e0 turn) (Goal $e0 $x1))
;;     c2607  mass 1  {quagmire}
;;     c2680  mass 1  {report}
;;     c2720  mass 1  {river}

;; ---- slot understand.Stimulus  [event center]  n 3  clusters 3
(And (Member $e0 understand) (Stimulus $e0 $x1))
;;     c2580  mass 1  {public health issue}
;;     c2639  mass 1  {reason}
;;     c2943  mass 1  {specific issue}

;; ---- slot wear.Theme  [event center]  n 3  clusters 3
(And (Member $e0 wear) (Theme $e0 $x1))
;;     c1702  mass 1  {helmet}
;;     c1814  mass 1  {inaugural gown}
;;     c2092  mass 1  {mask}

;; ---- slot welcome.Agent  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Agent $e0 $x1))
;;     c1749  mass 1  {host}
;;     c1828  mass 1  {industrialization}
;;     c3332  mass 1  {whigs}

;; ---- slot welcome.Theme  [event center]  n 3  clusters 3
(And (Member $e0 welcome) (Theme $e0 $x1))
;;     c1654  mass 1  {guests}
;;     c1828  mass 1  {industrialization}
;;     c3332  mass 1  {whigs}

;; ---- slot work.Experiencer  [event center]  n 3  clusters 3
(And (Member $e0 work) (Experiencer $e0 $x1))
;;     c2190  mass 1  {mouse}
;;     c2887  mass 1  {site}
;;     c3183  mass 1  {travel adaptor}

;; ---- slot work.Manner  [event center]  n 3  clusters 3
(And (Member $e0 work) (Manner $e0 $x1))
;;     c1456  mass 1  {fine}
;;     c1955  mass 1  {late}
;;     c2411  mass 1  {perfectly}
