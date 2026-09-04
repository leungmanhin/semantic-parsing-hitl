;; FUSE-NF §4.3.2 role-filler distributions — readable MeTTa RENDERING (never loaded:
;; a slot valuation is a conjunctive query over variables, not an assertion).
;; 526 event-role slots + 582 other slots from valuations_slots.jsonl (the §4.3.1 valuation
;; export); weighting ppmi, min_n 3, cos 0.5; pinned prompt 2ed18b93,
;; D.3 table 59 verbs. A slot = center class × head, one line per filler:
;; $e0/$x0 = the event/entity center, $e1/$x1/$f1 = a skolem filler (its own kind picks the
;; letter), a bare symbol = a constant filler, <num>/<str>/<term:X> = literal wildcards as in
;; patterns2.metta. Sorted by slot n desc. slots*.jsonl / flip_eligible.jsonl are the record of truth.

;; ==================== event-role slots (526) ====================

;; ---- slot work.Agent  [event center; head role]  n 17  docs<= 17  distinct 10  eventive 0
(And (Member $e0 work) (Agent $e0 ana))    ;; n 3 docs 3  e.g. tierA-000311 tierA-000312
(And (Member $e0 work) (Agent $e0 $x1) (Member $x1 biologist))    ;; n 3 docs 3  e.g. tierA-000319 tierA-000320
(And (Member $e0 work) (Agent $e0 dara))    ;; n 3 docs 3  e.g. tierA-000323 tierA-000324
(And (Member $e0 work) (Agent $e0 $x1) (Member $x1 welder))    ;; n 2 docs 2  e.g. tierA-000315 tierA-000316
(And (Member $e0 work) (Agent $e0 asserson))    ;; n 1 docs 1  e.g. tierC-000079
(And (Member $e0 work) (Agent $e0 bo))    ;; n 1 docs 1  e.g. tierA-000312
(And (Member $e0 work) (Agent $e0 $x1) (Member $x1 fitter))    ;; n 1 docs 1  e.g. tierA-000316
(And (Member $e0 work) (Agent $e0 jones))    ;; n 1 docs 1  e.g. tierC-000304
(And (Member $e0 work) (Agent $e0 nils))    ;; n 1 docs 1  e.g. tierA-000324
(And (Member $e0 work) (Agent $e0 $x1) (Member $x1 ranger))    ;; n 1 docs 1  e.g. tierA-000320

;; ---- slot build.Location  [event center; head role]  n 14  docs<= 12  distinct 3  eventive 0
(And (Member $e0 build) (Location $e0 turkey))    ;; n 6 docs 4  e.g. tierC-000045 tierC-000046
(And (Member $e0 build) (Location $e0 eskisehir))    ;; n 4 docs 4  e.g. tierC-000045 tierC-000046
(And (Member $e0 build) (Location $e0 kazakhstan))    ;; n 4 docs 4  e.g. tierC-000045 tierC-000046

;; ---- slot build.Patient  [event center; head role]  n 14  docs<= 14  distinct 6  eventive 0
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 hotel))    ;; n 4 docs 4  e.g. tierC-000045 tierC-000046
(And (Member $e0 build) (Patient $e0 $x1))    ;; n 2 docs 2  e.g. tierC-000119 tierC-000120
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 horn))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 paper_factory))    ;; n 2 docs 2  e.g. tierC-000045 tierC-000292
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 paper_mill))    ;; n 2 docs 2  e.g. tierC-000046 tierC-000291
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 room))    ;; n 2 docs 2  e.g. tierC-000213 tierC-000214

;; ---- slot buy.Agent  [event center; head role]  n 14  docs<= 15  distinct 8  eventive 0
(And (Member $e0 buy) (Agent $e0 $x1) (Member $x1 depot))    ;; n 3 docs 3  e.g. tierA-000001 tierA-000005
(And (Member $e0 buy) (Agent $e0 $x1) (Member $x1 pottery_studio))    ;; n 3 docs 3  e.g. tierA-000022 tierA-000026
(And (Member $e0 buy) (Agent $e0 $x1) (Member $x1 school))    ;; n 3 docs 3  e.g. tierA-000008 tierA-000012
(And (Member $e0 buy) (Agent $e0 $x1) (Member $x1 chef))    ;; n 2 docs 2  e.g. tierA-000015 tierA-000019
(And (Member $e0 buy) (Agent $e0 $x1) (Member $x1 forklift))    ;; n 1 docs 1  e.g. tierA-000006
(And (Member $e0 buy) (Agent $e0 $x1) (Member $x1 kiln))    ;; n 1 docs 1  e.g. tierA-000027
(And (Member $e0 buy) (Agent $e0 $x1) (Member $x1 crate))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000021
(And (Member $e0 buy) (Agent $e0 $x1) (Member $x1 lemon))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000021

;; ---- slot buy.Theme  [event center; head role]  n 14  docs<= 16  distinct 8  eventive 0
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 forklift))    ;; n 3 docs 3  e.g. tierA-000001 tierA-000005
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 kiln))    ;; n 3 docs 3  e.g. tierA-000022 tierA-000026
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 projector))    ;; n 3 docs 3  e.g. tierA-000008 tierA-000012
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 chef))    ;; n 1 docs 1  e.g. tierA-000021
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 crate))    ;; n 2 (mass 1) docs 2  e.g. tierA-000015 tierA-000019
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 depot))    ;; n 1 docs 1  e.g. tierA-000006
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 lemon))    ;; n 2 (mass 1) docs 2  e.g. tierA-000015 tierA-000019
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 pottery_studio))    ;; n 1 docs 1  e.g. tierA-000027

;; ---- slot work.Location  [event center; head role]  n 13  docs<= 10  distinct 5  eventive 0
(And (Member $e0 work) (Location $e0 $x1) (Member $x1 ledger))    ;; n 4 docs 3  e.g. tierA-000323 tierA-000324
(And (Member $e0 work) (Location $e0 $x1) (Member $x1 survey))    ;; n 4 docs 3  e.g. tierA-000319 tierA-000320
(And (Member $e0 work) (Location $e0 $x1) (Member $x1 frame))    ;; n 3 docs 2  e.g. tierA-000315 tierA-000316
(And (Member $e0 work) (Location $e0 church_of_norway))    ;; n 1 docs 1  e.g. tierC-000079
(And (Member $e0 work) (Location $e0 $x1) (Member $x1 mural))    ;; n 1 docs 1  e.g. tierA-000313

;; ---- slot build.Agent  [event center; head role]  n 12  docs<= 8  distinct 3  eventive 0
(And (Member $e0 build) (Agent $e0 $x1) (Member $x1 company))    ;; n 8 docs 4  e.g. tierC-000045 tierC-000046
(And (Member $e0 build) (Agent $e0 o_r_woodcock))    ;; n 2 docs 2  e.g. tierC-000119 tierC-000120
(And (Member $e0 build) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072

;; ---- slot find.Location  [event center; head role]  n 12  docs<= 12  distinct 8  eventive 1
(And (Member $e0 find) (Location $e0 $x1) (Member $x1 bench))    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244
(And (Member $e0 find) (Location $e0 $x1) (Member $x1 southern))    ;; n 2 docs 2  e.g. tierC-000279 tierC-000280
(And (Member $e0 find) (Location $e0 yunnan))    ;; n 2 docs 2  e.g. tierC-000313 tierC-000314
(And (Member $e0 find) (Location $e0 china))    ;; n 1 docs 1  e.g. tierC-000314
(And (Member $e0 find) (Location $e0 dianchi_lake))    ;; n 1 docs 1  e.g. tierC-000314
(And (Member $e0 find) (Location $e0 $x1) (Member $x1 tributary))    ;; n 1 docs 1  e.g. tierC-000314
(And (Member $e0 find) (Location $e0 $e1) (Member $e1 tributary))    ;; n 1 docs 1  e.g. tierC-000313
(And (Member $e0 find) (Location $e0 $x1) (Member $x1 western))    ;; n 1 docs 1  e.g. tierC-000279
(And (Member $e0 find) (Location $e0 western_europe))    ;; n 1 docs 1  e.g. tierC-000280

;; ---- slot give.Agent  [event center; head role]  n 12  docs<= 12  distinct 7  eventive 0
(And (Member $e0 give) (Agent $e0 $x1) (Member $x1 school))    ;; n 3 docs 3  e.g. tierA-000276 tierA-000278
(And (Member $e0 give) (Agent $e0 $x1) (Member $x1 trainer))    ;; n 3 docs 3  e.g. tierA-000261 tierA-000263
(And (Member $e0 give) (Agent $e0 $x1) (Member $x1 foreman))    ;; n 2 docs 2  e.g. tierA-000271 tierA-000273
(And (Member $e0 give) (Agent $e0 $x1) (Member $x1 clerk))    ;; n 1 docs 1  e.g. tierA-000208
(And (Member $e0 give) (Agent $e0 $x1) (Member $x1 driver))    ;; n 1 docs 1  e.g. tierA-000274
(And (Member $e0 give) (Agent $e0 $x1) (Member $x1 pilot))    ;; n 1 docs 1  e.g. tierA-000213
(And (Member $e0 give) (Agent $e0 $x1) (Member $x1 vet))    ;; n 1 docs 1  e.g. tierA-000218

;; ---- slot give.Recipient  [event center; head role]  n 12  docs<= 12  distinct 7  eventive 0
(And (Member $e0 give) (Recipient $e0 $x1) (Member $x1 recruit))    ;; n 3 docs 3  e.g. tierA-000261 tierA-000263
(And (Member $e0 give) (Recipient $e0 $x1) (Member $x1 winner))    ;; n 3 docs 3  e.g. tierA-000276 tierA-000278
(And (Member $e0 give) (Recipient $e0 $x1) (Member $x1 driver))    ;; n 2 docs 2  e.g. tierA-000271 tierA-000273
(And (Member $e0 give) (Recipient $e0 $x1) (Member $x1 caller))    ;; n 1 docs 1  e.g. tierA-000218
(And (Member $e0 give) (Recipient $e0 $x1) (Member $x1 foreman))    ;; n 1 docs 1  e.g. tierA-000274
(And (Member $e0 give) (Recipient $e0 $x1) (Member $x1 query))    ;; n 1 docs 1  e.g. tierA-000208
(And (Member $e0 give) (Recipient $e0 $x1) (Member $x1 tower))    ;; n 1 docs 1  e.g. tierA-000213

;; ---- slot give.Theme  [event center; head role]  n 12  docs<= 12  distinct 4  eventive 0
(And (Member $e0 give) (Theme $e0 $x1) (Member $x1 answer))    ;; n 3 docs 3  e.g. tierA-000208 tierA-000213
(And (Member $e0 give) (Theme $e0 $x1) (Member $x1 manifest))    ;; n 3 docs 3  e.g. tierA-000271 tierA-000273
(And (Member $e0 give) (Theme $e0 $x1) (Member $x1 medal))    ;; n 3 docs 3  e.g. tierA-000276 tierA-000278
(And (Member $e0 give) (Theme $e0 $x1) (Member $x1 whistle))    ;; n 3 docs 3  e.g. tierA-000261 tierA-000263

;; ---- slot decide.Agent  [event center; head role]  n 11  docs<= 11  distinct 6  eventive 0
(And (Member $e0 decide) (Agent $e0 $x1) (Member $x1 board))    ;; n 3 docs 3  e.g. tierA-000201 tierA-000204
(And (Member $e0 decide) (Agent $e0 $x1) (Member $x1 judge))    ;; n 3 docs 3  e.g. tierA-000190 tierA-000193
(And (Member $e0 decide) (Agent $e0 $x1) (Member $x1 committee))    ;; n 2 docs 2  e.g. tierA-000185 tierA-000189
(And (Member $e0 decide) (Agent $e0 $x1) (Member $x1 case))    ;; n 1 docs 1  e.g. tierA-000195
(And (Member $e0 decide) (Agent $e0 $x1) (Member $x1 family))    ;; n 1 docs 1  e.g. tierA-000196
(And (Member $e0 decide) (Agent $e0 north))    ;; n 1 docs 1  e.g. tierA-000199

;; ---- slot decide.Theme  [event center; head role]  n 11  docs<= 13  distinct 6  eventive 0
(And (Member $e0 decide) (Theme $e0 $x1) (Member $x1 budget))    ;; n 3 docs 3  e.g. tierA-000201 tierA-000204
(And (Member $e0 decide) (Theme $e0 $x1) (Member $x1 case))    ;; n 3 docs 3  e.g. tierA-000190 tierA-000193
(And (Member $e0 decide) (Theme $e0 <term:And>))    ;; n 2 docs 2  e.g. tierA-000196 tierA-000199
(And (Member $e0 decide) (Theme $e0 $x1) (Member $x1 judge))    ;; n 1 docs 1  e.g. tierA-000195
(And (Member $e0 decide) (Theme $e0 $x1) (Member $x1 new))    ;; n 2 (mass 1) docs 2  e.g. tierA-000185 tierA-000189
(And (Member $e0 decide) (Theme $e0 $x1) (Member $x1 roof))    ;; n 2 (mass 1) docs 2  e.g. tierA-000185 tierA-000189

;; ---- slot destroy.Patient  [event center; head role]  n 11  docs<= 11  distinct 5  eventive 0
(And (Member $e0 destroy) (Patient $e0 $x1) (Member $x1 archive))    ;; n 3 docs 3  e.g. tierA-000227 tierA-000228
(And (Member $e0 destroy) (Patient $e0 $x1) (Member $x1 footbridge))    ;; n 3 docs 3  e.g. tierA-000232 tierA-000233
(And (Member $e0 destroy) (Patient $e0 $x1) (Member $x1 greenhouse))    ;; n 3 docs 3  e.g. tierA-000222 tierA-000223
(And (Member $e0 destroy) (Patient $e0 $x1) (Member $x1 fire))    ;; n 1 docs 1  e.g. tierA-000230
(And (Member $e0 destroy) (Patient $e0 $x1) (Member $x1 storm))    ;; n 1 docs 1  e.g. tierA-000226

;; ---- slot answer.Agent  [event center; head role]  n 10  docs<= 10  distinct 5  eventive 0
(And (Member $e0 answer) (Agent $e0 $x1) (Member $x1 clerk))    ;; n 3 docs 3  e.g. tierA-000207 tierA-000209
(And (Member $e0 answer) (Agent $e0 $x1) (Member $x1 pilot))    ;; n 3 docs 3  e.g. tierA-000212 tierA-000214
(And (Member $e0 answer) (Agent $e0 $x1) (Member $x1 vet))    ;; n 2 docs 2  e.g. tierA-000217 tierA-000219
(And (Member $e0 answer) (Agent $e0 $x1) (Member $x1 caller))    ;; n 1 docs 1  e.g. tierA-000221
(And (Member $e0 answer) (Agent $e0 $x1) (Member $x1 query))    ;; n 1 docs 1  e.g. tierA-000210

;; ---- slot answer.Theme  [event center; head role]  n 10  docs<= 10  distinct 5  eventive 0
(And (Member $e0 answer) (Theme $e0 $x1) (Member $x1 query))    ;; n 3 docs 3  e.g. tierA-000207 tierA-000209
(And (Member $e0 answer) (Theme $e0 $x1) (Member $x1 tower))    ;; n 3 docs 3  e.g. tierA-000212 tierA-000214
(And (Member $e0 answer) (Theme $e0 $x1) (Member $x1 caller))    ;; n 2 docs 2  e.g. tierA-000217 tierA-000219
(And (Member $e0 answer) (Theme $e0 $x1) (Member $x1 clerk))    ;; n 1 docs 1  e.g. tierA-000210
(And (Member $e0 answer) (Theme $e0 $x1) (Member $x1 vet))    ;; n 1 docs 1  e.g. tierA-000221

;; ---- slot have.Holder  [event center; head role]  n 10  docs<= 10  distinct 5  eventive 0
(And (Member $e0 have) (Holder $e0 kristoffer))    ;; n 4 docs 4  e.g. tierC-000181 tierC-000182
(And (Member $e0 have) (Holder $e0 $x1))    ;; n 2 docs 2  e.g. tierC-000271 tierC-000272
(And (Member $e0 have) (Holder $e0 karen))    ;; n 2 docs 2  e.g. tierC-000182 tierC-000239
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 homentropic_current))    ;; n 1 docs 1  e.g. tierC-000154
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 homentropic_flow))    ;; n 1 docs 1  e.g. tierC-000153

;; ---- slot lend.Agent  [event center; head role]  n 10  docs<= 10  distinct 5  eventive 0
(And (Member $e0 lend) (Agent $e0 $x1) (Member $x1 museum))    ;; n 3 docs 3  e.g. tierA-000306 tierA-000308
(And (Member $e0 lend) (Agent $e0 $x1) (Member $x1 neighbour))    ;; n 3 docs 3  e.g. tierA-000296 tierA-000298
(And (Member $e0 lend) (Agent $e0 $x1) (Member $x1 depot))    ;; n 2 docs 2  e.g. tierA-000301 tierA-000303
(And (Member $e0 lend) (Agent $e0 $x1) (Member $x1 crew))    ;; n 1 docs 1  e.g. tierA-000304
(And (Member $e0 lend) (Agent $e0 ravi))    ;; n 1 docs 1  e.g. tierA-000300

;; ---- slot lend.Recipient  [event center; head role]  n 10  docs<= 10  distinct 5  eventive 0
(And (Member $e0 lend) (Recipient $e0 $x1) (Member $x1 gallery))    ;; n 3 docs 3  e.g. tierA-000306 tierA-000308
(And (Member $e0 lend) (Recipient $e0 ravi))    ;; n 3 docs 3  e.g. tierA-000296 tierA-000298
(And (Member $e0 lend) (Recipient $e0 $x1) (Member $x1 crew))    ;; n 2 docs 2  e.g. tierA-000301 tierA-000303
(And (Member $e0 lend) (Recipient $e0 $x1) (Member $x1 depot))    ;; n 1 docs 1  e.g. tierA-000304
(And (Member $e0 lend) (Recipient $e0 $x1) (Member $x1 neighbour))    ;; n 1 docs 1  e.g. tierA-000300

;; ---- slot lend.Theme  [event center; head role]  n 10  docs<= 10  distinct 3  eventive 0
(And (Member $e0 lend) (Theme $e0 $x1) (Member $x1 ladder))    ;; n 4 docs 4  e.g. tierA-000296 tierA-000298
(And (Member $e0 lend) (Theme $e0 $x1) (Member $x1 generator))    ;; n 3 docs 3  e.g. tierA-000301 tierA-000303
(And (Member $e0 lend) (Theme $e0 $x1) (Member $x1 painting))    ;; n 3 docs 3  e.g. tierA-000306 tierA-000308

;; ---- slot require.Theme  [event center; head role]  n 10  docs<= 10  distinct 3  eventive 0
(And (Member $e0 require) (Theme $e0 $x1) (Member $x1 egg))    ;; n 4 docs 4  e.g. tierA-000084 tierA-000086
(And (Member $e0 require) (Theme $e0 $x1) (Member $x1 countersignature))    ;; n 3 docs 3  e.g. tierA-000089 tierA-000091
(And (Member $e0 require) (Theme $e0 monthly_servicing))    ;; n 3 docs 3  e.g. tierA-000094 tierA-000096

;; ---- slot teach.Agent  [event center; head role]  n 10  docs<= 10  distinct 5  eventive 0
(And (Member $e0 teach) (Agent $e0 $x1) (Member $x1 elder))    ;; n 3 docs 3  e.g. tierA-000291 tierA-000293
(And (Member $e0 teach) (Agent $e0 $x1) (Member $x1 potter))    ;; n 3 docs 3  e.g. tierA-000281 tierA-000283
(And (Member $e0 teach) (Agent $e0 $x1) (Member $x1 coach))    ;; n 2 docs 2  e.g. tierA-000286 tierA-000288
(And (Member $e0 teach) (Agent $e0 $x1) (Member $x1 apprentice))    ;; n 1 docs 1  e.g. tierA-000285
(And (Member $e0 teach) (Agent $e0 $x1) (Member $x1 squad))    ;; n 1 docs 1  e.g. tierA-000289

;; ---- slot teach.Recipient  [event center; head role]  n 10  docs<= 10  distinct 5  eventive 0
(And (Member $e0 teach) (Recipient $e0 $x1) (Member $x1 apprentice))    ;; n 3 docs 3  e.g. tierA-000281 tierA-000283
(And (Member $e0 teach) (Recipient $e0 $x1) (Member $x1 child))    ;; n 3 docs 3  e.g. tierA-000291 tierA-000293
(And (Member $e0 teach) (Recipient $e0 $x1) (Member $x1 squad))    ;; n 2 docs 2  e.g. tierA-000286 tierA-000288
(And (Member $e0 teach) (Recipient $e0 $x1) (Member $x1 coach))    ;; n 1 docs 1  e.g. tierA-000289
(And (Member $e0 teach) (Recipient $e0 $x1) (Member $x1 potter))    ;; n 1 docs 1  e.g. tierA-000285

;; ---- slot teach.Theme  [event center; head role]  n 10  docs<= 10  distinct 3  eventive 0
(And (Member $e0 teach) (Theme $e0 glazing))    ;; n 4 docs 4  e.g. tierA-000281 tierA-000283
(And (Member $e0 teach) (Theme $e0 $x1) (Member $x1 drill))    ;; n 3 docs 3  e.g. tierA-000286 tierA-000288
(And (Member $e0 teach) (Theme $e0 $x1) (Member $x1 song))    ;; n 3 docs 3  e.g. tierA-000291 tierA-000293

;; ---- slot cancel.Agent  [event center; head role]  n 9  docs<= 9  distinct 4  eventive 0
(And (Member $e0 cancel) (Agent $e0 $x1) (Member $x1 council))    ;; n 3 docs 3  e.g. tierA-000148 tierA-000150
(And (Member $e0 cancel) (Agent $e0 $x1) (Member $x1 tutor))    ;; n 3 docs 3  e.g. tierA-000153 tierA-000155
(And (Member $e0 cancel) (Agent $e0 $x1) (Member $x1 airline))    ;; n 2 docs 2  e.g. tierA-000143 tierA-000145
(And (Member $e0 cancel) (Agent $e0 $x1) (Member $x1 physician))    ;; n 1 docs 1  e.g. tierA-000388

;; ---- slot discover.Theme  [event center; head role]  n 9  docs<= 12  distinct 5  eventive 0
(And (Member $e0 discover) (Theme $e0 $x1) (Member $x1 wreck))    ;; n 3 docs 3  e.g. tierA-000133 tierA-000135
(And (Member $e0 discover) (Theme $e0 $x1) (Member $x1 name))    ;; n 2 docs 2  e.g. tierC-000111 tierC-000112
(And (Member $e0 discover) (Theme $e0 $x1) (Member $x1 file))    ;; n 3 (mass 1.5) docs 3  e.g. tierA-000138 tierA-000140
(And (Member $e0 discover) (Theme $e0 $x1) (Member $x1 missing))    ;; n 3 (mass 1.5) docs 3  e.g. tierA-000138 tierA-000140
(And (Member $e0 discover) (Theme $e0 $x1) (Member $x1 diver))    ;; n 1 docs 1  e.g. tierA-000136

;; ---- slot have.Theme  [event center; head role]  n 8  docs<= 12  distinct 5  eventive 0
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 child))    ;; n 4 docs 4  e.g. tierC-000181 tierC-000182
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 representation))    ;; n 2 docs 2  e.g. tierC-000271 tierC-000272
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 constant))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000153 tierC-000154
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 entropy))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000153 tierC-000154
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 uniform))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000153 tierC-000154

;; ---- slot abandon.Agent  [event center; head role]  n 8  docs<= 8  distinct 3  eventive 0
(And (Member $e0 abandon) (Agent $e0 $x1) (Member $x1 climber))    ;; n 3 docs 3  e.g. tierA-000109 tierA-000111
(And (Member $e0 abandon) (Agent $e0 $x1) (Member $x1 firm))    ;; n 3 docs 3  e.g. tierA-000104 tierA-000106
(And (Member $e0 abandon) (Agent $e0 $x1) (Member $x1 rescue_team))    ;; n 2 docs 2  e.g. tierA-000099 tierA-000101

;; ---- slot abandon.Theme  [event center; head role]  n 8  docs<= 8  distinct 3  eventive 0
(And (Member $e0 abandon) (Theme $e0 $x1) (Member $x1 north_route))    ;; n 3 docs 3  e.g. tierA-000109 tierA-000111
(And (Member $e0 abandon) (Theme $e0 $x1) (Member $x1 tender))    ;; n 3 docs 3  e.g. tierA-000104 tierA-000106
(And (Member $e0 abandon) (Theme $e0 $x1) (Member $x1 search))    ;; n 2 docs 2  e.g. tierA-000099 tierA-000101

;; ---- slot appear.Agent  [event center; head role]  n 8  docs<= 6  distinct 3  eventive 0
(And (Member $e0 appear) (Agent $e0 $x1) (Member $x1 person))    ;; n 5 docs 3  e.g. tierC-000049 tierC-000050
(And (Member $e0 appear) (Agent $e0 brian_packham))    ;; n 2 docs 2  e.g. tierC-000259 tierC-000260
(And (Member $e0 appear) (Agent $e0 $x1) (Member $x1 sister))    ;; n 1 docs 1  e.g. tierC-000128

;; ---- slot appear.Location  [event center; head role]  n 8  docs<= 7  distinct 5  eventive 0
(And (Member $e0 appear) (Location $e0 cafe))    ;; n 2 docs 1  e.g. tierC-000128
(And (Member $e0 appear) (Location $e0 comedic_role))    ;; n 2 docs 2  e.g. tierC-000049 tierC-000050
(And (Member $e0 appear) (Location $e0 coronation_street))    ;; n 2 docs 2  e.g. tierC-000259 tierC-000260
(And (Member $e0 appear) (Location $e0 music_film))    ;; n 1 docs 1  e.g. tierC-000049
(And (Member $e0 appear) (Location $e0 musical_film))    ;; n 1 docs 1  e.g. tierC-000050

;; ---- slot decision.Theme  [event center; head role]  n 8  docs<= 10  distinct 5  eventive 0
(And (Member $e0 decision) (Theme $e0 <term:And>))    ;; n 2 docs 2  e.g. tierA-000197 tierA-000198
(And (Member $e0 decision) (Theme $e0 $x1) (Member $x1 budget))    ;; n 2 docs 2  e.g. tierA-000202 tierA-000203
(And (Member $e0 decision) (Theme $e0 $x1) (Member $x1 case))    ;; n 2 docs 2  e.g. tierA-000191 tierA-000192
(And (Member $e0 decision) (Theme $e0 $x1) (Member $x1 new))    ;; n 2 (mass 1) docs 2  e.g. tierA-000186 tierA-000187
(And (Member $e0 decision) (Theme $e0 $x1) (Member $x1 roof))    ;; n 2 (mass 1) docs 2  e.g. tierA-000186 tierA-000187

;; ---- slot destroy.Agent  [event center; head role]  n 8  docs<= 8  distinct 5  eventive 0
(And (Member $e0 destroy) (Agent $e0 $x1) (Member $x1 fire))    ;; n 2 docs 2  e.g. tierA-000227 tierA-000229
(And (Member $e0 destroy) (Agent $e0 $x1) (Member $x1 flood))    ;; n 2 docs 2  e.g. tierA-000232 tierA-000234
(And (Member $e0 destroy) (Agent $e0 $x1) (Member $x1 storm))    ;; n 2 docs 2  e.g. tierA-000222 tierA-000224
(And (Member $e0 destroy) (Agent $e0 $x1) (Member $x1 archive))    ;; n 1 docs 1  e.g. tierA-000230
(And (Member $e0 destroy) (Agent $e0 $x1) (Member $x1 greenhouse))    ;; n 1 docs 1  e.g. tierA-000226

;; ---- slot include.Theme  [event center; head role]  n 8  docs<= 8  distinct 4  eventive 0
(And (Member $e0 include) (Theme $e0 armaan_jain))    ;; n 2 docs 2  e.g. tierC-000139 tierC-000140
(And (Member $e0 include) (Theme $e0 des_moines))    ;; n 2 docs 2  e.g. tierC-000189 tierC-000190
(And (Member $e0 include) (Theme $e0 nikhil_nanda))    ;; n 2 docs 2  e.g. tierC-000139 tierC-000140
(And (Member $e0 include) (Theme $e0 ranbir_kapoor))    ;; n 2 docs 2  e.g. tierC-000139 tierC-000140

;; ---- slot reject.Agent  [event center; head role]  n 8  docs<= 8  distinct 5  eventive 0
(And (Member $e0 reject) (Agent $e0 $x1) (Member $x1 bank))    ;; n 2 docs 2  e.g. tierA-000163 tierA-000165
(And (Member $e0 reject) (Agent $e0 $x1) (Member $x1 editor))    ;; n 2 docs 2  e.g. tierA-000158 tierA-000160
(And (Member $e0 reject) (Agent $e0 $x1) (Member $x1 panel))    ;; n 2 docs 2  e.g. tierA-000168 tierA-000170
(And (Member $e0 reject) (Agent $e0 $x1) (Member $x1 loan_application))    ;; n 1 docs 1  e.g. tierA-000166
(And (Member $e0 reject) (Agent $e0 $x1) (Member $x1 manuscript))    ;; n 1 docs 1  e.g. tierA-000162

;; ---- slot reject.Theme  [event center; head role]  n 8  docs<= 8  distinct 5  eventive 0
(And (Member $e0 reject) (Theme $e0 $x1) (Member $x1 loan_application))    ;; n 2 docs 2  e.g. tierA-000163 tierA-000165
(And (Member $e0 reject) (Theme $e0 $x1) (Member $x1 manuscript))    ;; n 2 docs 2  e.g. tierA-000158 tierA-000160
(And (Member $e0 reject) (Theme $e0 $x1) (Member $x1 proposal))    ;; n 2 docs 2  e.g. tierA-000168 tierA-000170
(And (Member $e0 reject) (Theme $e0 $x1) (Member $x1 bank))    ;; n 1 docs 1  e.g. tierA-000166
(And (Member $e0 reject) (Theme $e0 $x1) (Member $x1 editor))    ;; n 1 docs 1  e.g. tierA-000162

;; ---- slot repair.Agent  [event center; head role]  n 8  docs<= 10  distinct 8  eventive 0
(And (Member $e0 repair) (Agent $e0 $x1) (Member $x1 electrician))    ;; n 2 docs 2  e.g. tierA-000035 tierA-000038
(And (Member $e0 repair) (Agent $e0 $x1) (Member $x1 mechanic))    ;; n 2 docs 2  e.g. tierA-000029 tierA-000032
(And (Member $e0 repair) (Agent $e0 $x1) (Member $x1 crew))    ;; n 1 docs 1  e.g. tierA-000049
(And (Member $e0 repair) (Agent $e0 $x1) (Member $x1 yard_floodlight))    ;; n 1 docs 1  e.g. tierA-000039
(And (Member $e0 repair) (Agent $e0 $x1) (Member $x1 cracked))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000051
(And (Member $e0 repair) (Agent $e0 $x1) (Member $x1 feed_pipe))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000051
(And (Member $e0 repair) (Agent $e0 $x1) (Member $x1 gearbox))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000034
(And (Member $e0 repair) (Agent $e0 $x1) (Member $x1 seized))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000034

;; ---- slot repair.Patient  [event center; head role]  n 8  docs<= 11  distinct 8  eventive 0
(And (Member $e0 repair) (Patient $e0 $x1) (Member $x1 yard_floodlight))    ;; n 2 docs 2  e.g. tierA-000035 tierA-000038
(And (Member $e0 repair) (Patient $e0 $x1) (Member $x1 crew))    ;; n 1 docs 1  e.g. tierA-000051
(And (Member $e0 repair) (Patient $e0 $x1) (Member $x1 electrician))    ;; n 1 docs 1  e.g. tierA-000039
(And (Member $e0 repair) (Patient $e0 $x1) (Member $x1 gearbox))    ;; n 2 (mass 1) docs 2  e.g. tierA-000029 tierA-000032
(And (Member $e0 repair) (Patient $e0 $x1) (Member $x1 mechanic))    ;; n 1 docs 1  e.g. tierA-000034
(And (Member $e0 repair) (Patient $e0 $x1) (Member $x1 seized))    ;; n 2 (mass 1) docs 2  e.g. tierA-000029 tierA-000032
(And (Member $e0 repair) (Patient $e0 $x1) (Member $x1 cracked))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000049
(And (Member $e0 repair) (Patient $e0 $x1) (Member $x1 feed_pipe))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000049

;; ---- slot require.Holder  [event center; head role]  n 8  docs<= 8  distinct 3  eventive 0
(And (Member $e0 require) (Holder $e0 $x1) (Member $x1 permit))    ;; n 3 docs 3  e.g. tierA-000089 tierA-000091
(And (Member $e0 require) (Holder $e0 $x1) (Member $x1 recipe))    ;; n 3 docs 3  e.g. tierA-000086 tierA-000087
(And (Member $e0 require) (Holder $e0 $x1) (Member $x1 lathe))    ;; n 2 docs 2  e.g. tierA-000094 tierA-000096

;; ---- slot serve.Agent  [event center; head role]  n 8  docs<= 8  distinct 4  eventive 0
(And (Member $e0 serve) (Agent $e0 indooroopilly))    ;; n 2 docs 2  e.g. tierC-000185 tierC-000186
(And (Member $e0 serve) (Agent $e0 ipswich))    ;; n 2 docs 2  e.g. tierC-000185 tierC-000186
(And (Member $e0 serve) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000053 tierC-000054
(And (Member $e0 serve) (Agent $e0 rosewood))    ;; n 2 docs 2  e.g. tierC-000185 tierC-000186

;; ---- slot sing.Agent  [event center; head role]  n 8  docs<= 8  distinct 5  eventive 0
(And (Member $e0 sing) (Agent $e0 barbershop_harmony_society))    ;; n 2 docs 2  e.g. tierC-000329 tierC-000330
(And (Member $e0 sing) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000127 tierC-000128
(And (Member $e0 sing) (Agent $e0 $x1) (Member $x1 sister))    ;; n 2 docs 2  e.g. tierC-000127 tierC-000128
(And (Member $e0 sing) (Agent $e0 $x1) (Member $x1 occupational_group))    ;; n 1 docs 1  e.g. tierC-000329
(And (Member $e0 sing) (Agent $e0 $x1) (Member $x1 professional_group))    ;; n 1 docs 1  e.g. tierC-000330

;; ---- slot study.Location  [event center; head role]  n 8  docs<= 8  distinct 4  eventive 0
(And (Member $e0 study) (Location $e0 davis_studio))    ;; n 2 docs 2  e.g. tierC-000253 tierC-000254
(And (Member $e0 study) (Location $e0 julian_ashton_art_school))    ;; n 2 docs 2  e.g. tierC-000253 tierC-000254
(And (Member $e0 study) (Location $e0 melbourne))    ;; n 2 docs 2  e.g. tierC-000253 tierC-000254
(And (Member $e0 study) (Location $e0 sydney))    ;; n 2 docs 2  e.g. tierC-000253 tierC-000254

;; ---- slot produce.Patient  [event center; head role]  n 8  docs<= 9  distinct 5  eventive 0
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 movie))    ;; n 4 docs 2  e.g. tierC-000091 tierC-000092
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 album))    ;; n 2 docs 2  e.g. tierC-000103 tierC-000104
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 film))    ;; n 2 (mass 0.833) docs 2  e.g. tierC-000009 tierC-000010
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 syrian))    ;; n 2 (mass 0.833) docs 2  e.g. tierC-000009 tierC-000010
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 destined))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000009

;; ---- slot be.Experiencer  [event center; head role]  n 7  docs<= 5  distinct 4  eventive 0
(And (Member $e0 be) (Experiencer $e0 paniqui))    ;; n 4 docs 2  e.g. tierC-000347 tierC-000348
(And (Member $e0 be) (Experiencer $e0 alema_nature_reserve))    ;; n 1 docs 1  e.g. tierC-000212
(And (Member $e0 be) (Experiencer $e0 ellerslie_rugby_park))    ;; n 1 docs 1  e.g. tierC-000215
(And (Member $e0 be) (Experiencer $e0 $x1) (Member $x1 tunnel))    ;; n 1 docs 1  e.g. tierC-000126

;; ---- slot begin.Patient  [event center; head role]  n 7  docs<= 7  distinct 4  eventive 0
(And (Member $e0 begin) (Patient $e0 $x1) (Member $x1 apple_harvest))    ;; n 2 docs 2  e.g. tierA-000067 tierA-000070
(And (Member $e0 begin) (Patient $e0 $x1) (Member $x1 dress_rehearsal))    ;; n 2 docs 2  e.g. tierA-000062 tierA-000066
(And (Member $e0 begin) (Patient $e0 $x1) (Member $x1 shoreline_survey))    ;; n 2 docs 2  e.g. tierA-000052 tierA-000055
(And (Member $e0 begin) (Patient $e0 $x1) (Member $x1 hearing))    ;; n 1 docs 1  e.g. tierA-000057

;; ---- slot cancel.Patient  [event center; head role]  n 7  docs<= 7  distinct 3  eventive 0
(And (Member $e0 cancel) (Patient $e0 $x1) (Member $x1 afternoon_session))    ;; n 3 docs 3  e.g. tierA-000153 tierA-000155
(And (Member $e0 cancel) (Patient $e0 $x1) (Member $x1 summer_fair))    ;; n 3 docs 3  e.g. tierA-000148 tierA-000150
(And (Member $e0 cancel) (Patient $e0 $x1) (Member $x1 evening_flight))    ;; n 1 docs 1  e.g. tierA-000145

;; ---- slot discover.Agent  [event center; head role]  n 7  docs<= 7  distinct 3  eventive 0
(And (Member $e0 discover) (Agent $e0 $x1) (Member $x1 diver))    ;; n 3 docs 3  e.g. tierA-000133 tierA-000135
(And (Member $e0 discover) (Agent $e0 $x1) (Member $x1 intern))    ;; n 3 docs 3  e.g. tierA-000138 tierA-000140
(And (Member $e0 discover) (Agent $e0 $x1) (Member $x1 wreck))    ;; n 1 docs 1  e.g. tierA-000136

;; ---- slot locate.Experiencer  [event center; head role]  n 7  docs<= 7  distinct 4  eventive 0
(And (Member $e0 locate) (Experiencer $e0 $x1))    ;; n 2 docs 2  e.g. tierC-000343 tierC-000344
(And (Member $e0 locate) (Experiencer $e0 $x1) (Member $x1 park))    ;; n 2 docs 2  e.g. tierC-000003 tierC-000004
(And (Member $e0 locate) (Experiencer $e0 wine_country))    ;; n 2 docs 2  e.g. tierC-000307 tierC-000308
(And (Member $e0 locate) (Experiencer $e0 ellerslie_rugby_park))    ;; n 1 docs 1  e.g. tierC-000216

;; ---- slot locate.Location  [event center; head role]  n 7  docs<= 7  distinct 4  eventive 0
(And (Member $e0 locate) (Location $e0 cloverdale))    ;; n 2 docs 2  e.g. tierC-000307 tierC-000308
(And (Member $e0 locate) (Location $e0 $x1) (Member $x1 foot))    ;; n 2 docs 2  e.g. tierC-000003 tierC-000004
(And (Member $e0 locate) (Location $e0 $x1) (Member $x1 hill))    ;; n 2 docs 2  e.g. tierC-000343 tierC-000344
(And (Member $e0 locate) (Location $e0 richford))    ;; n 1 docs 1  e.g. tierC-000216

;; ---- slot postpone.Agent  [event center; head role]  n 7  docs<= 7  distinct 3  eventive 0
(And (Member $e0 postpone) (Agent $e0 $x1) (Member $x1 club))    ;; n 3 docs 3  e.g. tierA-000123 tierA-000125
(And (Member $e0 postpone) (Agent $e0 $x1) (Member $x1 board))    ;; n 2 docs 2  e.g. tierA-000114 tierA-000116
(And (Member $e0 postpone) (Agent $e0 $x1) (Member $x1 ferry))    ;; n 2 docs 2  e.g. tierA-000119 tierA-000122

;; ---- slot postpone.Theme  [event center; head role]  n 7  docs<= 7  distinct 3  eventive 0
(And (Member $e0 postpone) (Theme $e0 $x1) (Member $x1 tournament))    ;; n 3 docs 3  e.g. tierA-000123 tierA-000125
(And (Member $e0 postpone) (Theme $e0 $x1) (Member $x1 departure))    ;; n 2 docs 2  e.g. tierA-000119 tierA-000122
(And (Member $e0 postpone) (Theme $e0 $x1) (Member $x1 vote))    ;; n 2 docs 2  e.g. tierA-000114 tierA-000116

;; ---- slot work.CoAgent  [event center; head role]  n 7  docs<= 7  distinct 4  eventive 0
(And (Member $e0 work) (CoAgent $e0 bo))    ;; n 2 docs 2  e.g. tierA-000311 tierA-000313
(And (Member $e0 work) (CoAgent $e0 nils))    ;; n 2 docs 2  e.g. tierA-000323 tierA-000325
(And (Member $e0 work) (CoAgent $e0 $x1) (Member $x1 ranger))    ;; n 2 docs 2  e.g. tierA-000319 tierA-000322
(And (Member $e0 work) (CoAgent $e0 $x1) (Member $x1 fitter))    ;; n 1 docs 1  e.g. tierA-000315

;; ---- slot arrive.Agent  [event center; head role]  n 6  docs<= 6  distinct 3  eventive 0
(And (Member $e0 arrive) (Agent $e0 $x1) (Member $x1 freight))    ;; n 3 docs 3  e.g. tierA-000237 tierA-000238
(And (Member $e0 arrive) (Agent $e0 $x1) (Member $x1 delegation))    ;; n 2 docs 2  e.g. tierA-000241 tierA-000243
(And (Member $e0 arrive) (Agent $e0 $x1) (Member $x1 soil_sample))    ;; n 1 docs 1  e.g. tierA-000245

;; ---- slot become.Patient  [event center; head role]  n 6  docs<= 10  distinct 7  eventive 1
(And (Member $e0 become) (Patient $e0 $x1))    ;; n 2 docs 2  e.g. tierC-000237 tierC-000238
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 bad))    ;; n 2 (mass 1) docs 2  e.g. tierC-000241 tierC-000242
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 relationship))    ;; n 2 (mass 1) docs 2  e.g. tierC-000241 tierC-000242
(And (Member $e0 become) (Patient $e0 $e1) (Member $e1 discipline))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000158
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 indigenous))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001
(And (Member $e0 become) (Patient $e0 $e1) (Member $e1 lax))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000158
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 people))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001

;; ---- slot begin.Time  [event center; head role]  n 6  docs<= 6  distinct 4  eventive 0
(And (Member $e0 begin) (Time $e0 <term:Month>))    ;; n 2 docs 2  e.g. tierA-000067 tierA-000070
(And (Member $e0 begin) (Time $e0 dawn))    ;; n 2 docs 2  e.g. tierA-000052 tierA-000055
(And (Member $e0 begin) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierA-000057
(And (Member $e0 begin) (Time $e0 morning))    ;; n 1 docs 1  e.g. tierA-000057

;; ---- slot build.Instrument  [event center; head role]  n 6  docs<= 8  distinct 5  eventive 2
(And (Member $e0 build) (Instrument $e0 $x1) (Member $x1 barometer))    ;; n 2 docs 2  e.g. tierC-000213 tierC-000214
(And (Member $e0 build) (Instrument $e0 $e1) (Member $e1 help))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072
(And (Member $e0 build) (Instrument $e0 $x1) (Member $x1 scale))    ;; n 2 (mass 1) docs 2  e.g. tierC-000213 tierC-000214
(And (Member $e0 build) (Instrument $e0 $x1) (Member $x1 present))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000214
(And (Member $e0 build) (Instrument $e0 $x1) (Member $x1 present_in))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000213

;; ---- slot design.Agent  [event center; head role]  n 6  docs<= 6  distinct 3  eventive 0
(And (Member $e0 design) (Agent $e0 henry_l_taylor))    ;; n 2 docs 2  e.g. tierC-000119 tierC-000120
(And (Member $e0 design) (Agent $e0 philip_hercus))    ;; n 2 docs 2  e.g. tierC-000183 tierC-000184
(And (Member $e0 design) (Agent $e0 robert_allan_limited))    ;; n 2 docs 2  e.g. tierC-000183 tierC-000184

;; ---- slot design.Patient  [event center; head role]  n 6  docs<= 4  distinct 2  eventive 0
(And (Member $e0 design) (Patient $e0 $x1) (Member $x1 pacificat))    ;; n 4 docs 2  e.g. tierC-000183 tierC-000184
(And (Member $e0 design) (Patient $e0 $x1))    ;; n 2 docs 2  e.g. tierC-000119 tierC-000120

;; ---- slot discover.Location  [event center; head role]  n 6  docs<= 6  distinct 2  eventive 0
(And (Member $e0 discover) (Location $e0 $x1) (Member $x1 point))    ;; n 4 docs 4  e.g. tierA-000133 tierA-000135
(And (Member $e0 discover) (Location $e0 japan))    ;; n 2 docs 2  e.g. tierC-000111 tierC-000112

;; ---- slot find.Theme  [event center; head role]  n 6  docs<= 6  distinct 2  eventive 0
(And (Member $e0 find) (Theme $e0 $x1))    ;; n 4 docs 4  e.g. tierC-000279 tierC-000280
(And (Member $e0 find) (Theme $e0 couper))    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244

;; ---- slot form.Agent  [event center; head role]  n 6  docs<= 7  distinct 5  eventive 0
(And (Member $e0 form) (Agent $e0 jon_bon_jovi))    ;; n 2 docs 2  e.g. tierC-000179 tierC-000180
(And (Member $e0 form) (Agent $e0 sambora))    ;; n 2 docs 2  e.g. tierC-000179 tierC-000180
(And (Member $e0 form) (Agent $e0 technetium))    ;; n 1 docs 1  e.g. tierC-000163
(And (Member $e0 form) (Agent $e0 $x1) (Member $x1 complex))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000164
(And (Member $e0 form) (Agent $e0 $x1) (Member $x1 simple))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000164

;; ---- slot fund.Agent  [event center; head role]  n 6  docs<= 6  distinct 2  eventive 0
(And (Member $e0 fund) (Agent $e0 $x1) (Member $x1 government))    ;; n 3 docs 3  e.g. tierC-000217 tierC-000218
(And (Member $e0 fund) (Agent $e0 jica))    ;; n 3 docs 3  e.g. tierC-000217 tierC-000218

;; ---- slot include.Agent  [event center; head role]  n 6  docs<= 2  distinct 1  eventive 0
(And (Member $e0 include) (Agent $e0 $x1) (Member $x1 nephew))    ;; n 6 docs 2  e.g. tierC-000139 tierC-000140

;; ---- slot portray.Agent  [event center; head role]  n 6  docs<= 6  distinct 3  eventive 0
(And (Member $e0 portray) (Agent $e0 james_woods))    ;; n 2 docs 2  e.g. tierC-000301 tierC-000302
(And (Member $e0 portray) (Agent $e0 soichiro_akizuki))    ;; n 2 docs 2  e.g. tierC-000247 tierC-000248
(And (Member $e0 portray) (Agent $e0 wilson))    ;; n 1 docs 1  e.g. tierC-000278
(And (Member $e0 portray) (Agent $e0 $x1) (Member $x1 wilson))    ;; n 1 docs 1  e.g. tierC-000277

;; ---- slot portray.Theme  [event center; head role]  n 6  docs<= 6  distinct 3  eventive 0
(And (Member $e0 portray) (Theme $e0 james_woods))    ;; n 2 docs 2  e.g. tierC-000277 tierC-000278
(And (Member $e0 portray) (Theme $e0 kantaro_suga))    ;; n 2 docs 2  e.g. tierC-000247 tierC-000248
(And (Member $e0 portray) (Theme $e0 wilson))    ;; n 1 docs 1  e.g. tierC-000301
(And (Member $e0 portray) (Theme $e0 $x1) (Member $x1 wilson))    ;; n 1 docs 1  e.g. tierC-000302

;; ---- slot produce.Agent  [event center; head role]  n 6  docs<= 6  distinct 3  eventive 0
(And (Member $e0 produce) (Agent $e0 colin_richardson))    ;; n 2 docs 2  e.g. tierC-000103 tierC-000104
(And (Member $e0 produce) (Agent $e0 harvey_hayutin))    ;; n 2 docs 2  e.g. tierC-000091 tierC-000092
(And (Member $e0 produce) (Agent $e0 sy_weintraub))    ;; n 2 docs 2  e.g. tierC-000091 tierC-000092

;; ---- slot sell.Theme  [event center; head role]  n 6  docs<= 7  distinct 6  eventive 0
(And (Member $e0 sell) (Theme $e0 ice_cream))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 forklift))    ;; n 1 docs 1  e.g. tierA-000004
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 kiln))    ;; n 1 docs 1  e.g. tierA-000025
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 projector))    ;; n 1 docs 1  e.g. tierA-000011
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 crate))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000018
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 lemon))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000018

;; ---- slot serve.Theme  [event center; head role]  n 6  docs<= 2  distinct 1  eventive 0
(And (Member $e0 serve) (Theme $e0 $x1) (Member $x1 station))    ;; n 6 docs 2  e.g. tierC-000185 tierC-000186

;; ---- slot use.Theme  [event center; head role]  n 6  docs<= 8  distinct 5  eventive 0
(And (Member $e0 use) (Theme $e0 banach_mackey_topology))    ;; n 2 docs 2  e.g. tierC-000005 tierC-000006
(And (Member $e0 use) (Theme $e0 weak_arens_space_topology))    ;; n 2 docs 2  e.g. tierC-000005 tierC-000006
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 current))    ;; n 2 (mass 1) docs 2  e.g. tierC-000173 tierC-000174
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 designation_convention))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000174
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 naming_convention))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000173

;; ---- slot write.Agent  [event center; head role]  n 6  docs<= 6  distinct 3  eventive 0
(And (Member $e0 write) (Agent $e0 bill_wrubel))    ;; n 2 docs 2  e.g. tierC-000297 tierC-000298
(And (Member $e0 write) (Agent $e0 gilles_thibaut))    ;; n 2 docs 2  e.g. tierC-000131 tierC-000132
(And (Member $e0 write) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000089 tierC-000090

;; ---- slot write.CoAgent  [event center; head role]  n 6  docs<= 6  distinct 3  eventive 0
(And (Member $e0 write) (CoAgent $e0 bianca_olsen))    ;; n 2 docs 2  e.g. tierC-000089 tierC-000090
(And (Member $e0 write) (CoAgent $e0 cyril_rambour))    ;; n 2 docs 2  e.g. tierC-000089 tierC-000090
(And (Member $e0 write) (CoAgent $e0 laurie_aubanel))    ;; n 2 docs 2  e.g. tierC-000089 tierC-000090

;; ---- slot write.Patient  [event center; head role]  n 6  docs<= 6  distinct 4  eventive 0
(And (Member $e0 write) (Patient $e0 $x1) (Member $x1 episode))    ;; n 2 docs 2  e.g. tierC-000297 tierC-000298
(And (Member $e0 write) (Patient $e0 $x1) (Member $x1 song))    ;; n 2 docs 2  e.g. tierC-000131 tierC-000132
(And (Member $e0 write) (Patient $e0 $x1) (Member $x1 screenplay))    ;; n 1 docs 1  e.g. tierC-000090
(And (Member $e0 write) (Patient $e0 $x1) (Member $x1 script))    ;; n 1 docs 1  e.g. tierC-000089

;; ---- slot arrive.Time  [event center; head role]  n 5  docs<= 5  distinct 2  eventive 0
(And (Member $e0 arrive) (Time $e0 <term:Hour>))    ;; n 3 docs 3  e.g. tierA-000237 tierA-000238
(And (Member $e0 arrive) (Time $e0 <term:Weekday>))    ;; n 2 docs 2  e.g. tierA-000241 tierA-000243

;; ---- slot borrow.Theme  [event center; head role]  n 5  docs<= 5  distinct 4  eventive 0
(And (Member $e0 borrow) (Theme $e0 $x1) (Member $x1 inomaru))    ;; n 2 docs 2  e.g. tierC-000237 tierC-000238
(And (Member $e0 borrow) (Theme $e0 $x1) (Member $x1 generator))    ;; n 1 docs 1  e.g. tierA-000302
(And (Member $e0 borrow) (Theme $e0 $x1) (Member $x1 ladder))    ;; n 1 docs 1  e.g. tierA-000297
(And (Member $e0 borrow) (Theme $e0 $x1) (Member $x1 painting))    ;; n 1 docs 1  e.g. tierA-000307

;; ---- slot die.Patient  [event center; head role]  n 5  docs<= 6  distinct 4  eventive 0
(And (Member $e0 die) (Patient $e0 $x1) (Member $x1 founder))    ;; n 2 docs 2  e.g. tierA-000253 tierA-000255
(And (Member $e0 die) (Patient $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000199 tierC-000200
(And (Member $e0 die) (Patient $e0 $x1) (Member $x1 elm))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000257
(And (Member $e0 die) (Patient $e0 $x1) (Member $x1 last))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000257

;; ---- slot direct.Patient  [event center; head role]  n 5  docs<= 6  distinct 5  eventive 0
(And (Member $e0 direct) (Patient $e0 $x1) (Member $x1 episode))    ;; n 2 docs 2  e.g. tierC-000297 tierC-000298
(And (Member $e0 direct) (Patient $e0 $x1))    ;; n 1 docs 1  e.g. tierC-000138
(And (Member $e0 direct) (Patient $e0 $x1) (Member $x1 movie))    ;; n 1 docs 1  e.g. tierC-000091
(And (Member $e0 direct) (Patient $e0 $x1) (Member $x1 film))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000010
(And (Member $e0 direct) (Patient $e0 $x1) (Member $x1 syrian))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000010

;; ---- slot receive.Theme  [event center; head role]  n 5  docs<= 5  distinct 4  eventive 0
(And (Member $e0 receive) (Theme $e0 $x1) (Member $x1 work))    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236
(And (Member $e0 receive) (Theme $e0 $x1) (Member $x1 manifest))    ;; n 1 docs 1  e.g. tierA-000272
(And (Member $e0 receive) (Theme $e0 $x1) (Member $x1 medal))    ;; n 1 docs 1  e.g. tierA-000277
(And (Member $e0 receive) (Theme $e0 $x1) (Member $x1 whistle))    ;; n 1 docs 1  e.g. tierA-000262

;; ---- slot take.Agent  [event center; head role]  n 5  docs<= 5  distinct 4  eventive 0
(And (Member $e0 take) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072
(And (Member $e0 take) (Agent $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierA-000182
(And (Member $e0 take) (Agent $e0 $x1) (Member $x1 nurse))    ;; n 1 docs 1  e.g. tierA-000178
(And (Member $e0 take) (Agent $e0 $x1) (Member $x1 shepherd))    ;; n 1 docs 1  e.g. tierA-000174

;; ---- slot walk.Agent  [event center; head role]  n 5  docs<= 5  distinct 5  eventive 0
(And (Member $e0 walk) (Agent $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierA-000181
(And (Member $e0 walk) (Agent $e0 $x1) (Member $x1 nurse))    ;; n 1 docs 1  e.g. tierA-000177
(And (Member $e0 walk) (Agent $e0 $x1) (Member $x1 pier))    ;; n 1 docs 1  e.g. tierA-000183
(And (Member $e0 walk) (Agent $e0 $x1) (Member $x1 shepherd))    ;; n 1 docs 1  e.g. tierA-000173
(And (Member $e0 walk) (Agent $e0 $x1) (Member $x1 ward))    ;; n 1 docs 1  e.g. tierA-000180

;; ---- slot walk.Location  [event center; head role]  n 5  docs<= 5  distinct 3  eventive 0
(And (Member $e0 walk) (Location $e0 $x1) (Member $x1 ridge))    ;; n 2 docs 2  e.g. tierA-000173 tierA-000174
(And (Member $e0 walk) (Location $e0 $x1) (Member $x1 ward))    ;; n 2 docs 2  e.g. tierA-000177 tierA-000178
(And (Member $e0 walk) (Location $e0 $x1) (Member $x1 nurse))    ;; n 1 docs 1  e.g. tierA-000180

;; ---- slot accompany.Agent  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 accompany) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000127 tierC-000128
(And (Member $e0 accompany) (Agent $e0 $x1) (Member $x1 sister))    ;; n 2 docs 2  e.g. tierC-000127 tierC-000128

;; ---- slot accompany.Theme  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 accompany) (Theme $e0 silent_film))    ;; n 4 docs 2  e.g. tierC-000127 tierC-000128

;; ---- slot acquire.Agent  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 acquire) (Agent $e0 $x1) (Member $x1 chef))    ;; n 1 docs 1  e.g. tierA-000017
(And (Member $e0 acquire) (Agent $e0 $x1) (Member $x1 depot))    ;; n 1 docs 1  e.g. tierA-000003
(And (Member $e0 acquire) (Agent $e0 $x1) (Member $x1 pottery_studio))    ;; n 1 docs 1  e.g. tierA-000024
(And (Member $e0 acquire) (Agent $e0 $x1) (Member $x1 school))    ;; n 1 docs 1  e.g. tierA-000010

;; ---- slot acquire.Theme  [event center; head role]  n 4  docs<= 5  distinct 5  eventive 0
(And (Member $e0 acquire) (Theme $e0 $x1) (Member $x1 forklift))    ;; n 1 docs 1  e.g. tierA-000003
(And (Member $e0 acquire) (Theme $e0 $x1) (Member $x1 kiln))    ;; n 1 docs 1  e.g. tierA-000024
(And (Member $e0 acquire) (Theme $e0 $x1) (Member $x1 projector))    ;; n 1 docs 1  e.g. tierA-000010
(And (Member $e0 acquire) (Theme $e0 $x1) (Member $x1 crate))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000017
(And (Member $e0 acquire) (Theme $e0 $x1) (Member $x1 lemon))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000017

;; ---- slot active.Time  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 active) (Time $e0 early_morning))    ;; n 2 docs 2  e.g. tierC-000201 tierC-000202
(And (Member $e0 active) (Time $e0 late_afternoon))    ;; n 2 docs 2  e.g. tierC-000201 tierC-000202

;; ---- slot allow.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 allow) (Agent $e0 $x1) (Member $x1 licence))    ;; n 2 docs 2  e.g. tierA-000076 tierA-000078
(And (Member $e0 allow) (Agent $e0 $x1) (Member $x1 curator))    ;; n 1 docs 1  e.g. tierA-000080
(And (Member $e0 allow) (Agent $e0 $x1) (Member $x1 warden))    ;; n 1 docs 1  e.g. tierA-000075

;; ---- slot allow.Theme  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 allow) (Theme $e0 night_delivery))    ;; n 2 docs 2  e.g. tierA-000076 tierA-000078
(And (Member $e0 allow) (Theme $e0 photography))    ;; n 1 docs 1  e.g. tierA-000080
(And (Member $e0 allow) (Theme $e0 visitor))    ;; n 1 docs 1  e.g. tierA-000075

;; ---- slot attract.Source  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 attract) (Source $e0 mainstream_media))    ;; n 1 docs 1  e.g. tierC-000177
(And (Member $e0 attract) (Source $e0 $x1) (Member $x1 mainstream_media))    ;; n 1 docs 1  e.g. tierC-000178
(And (Member $e0 attract) (Source $e0 social_media))    ;; n 1 docs 1  e.g. tierC-000177
(And (Member $e0 attract) (Source $e0 $x1) (Member $x1 social_media))    ;; n 1 docs 1  e.g. tierC-000178

;; ---- slot be.Location  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 be) (Location $e0 denmark))    ;; n 1 docs 1  e.g. tierC-000126
(And (Member $e0 be) (Location $e0 harju_county))    ;; n 1 docs 1  e.g. tierC-000212
(And (Member $e0 be) (Location $e0 $x1) (Member $x1 north))    ;; n 1 docs 1  e.g. tierC-000212
(And (Member $e0 be) (Location $e0 richford))    ;; n 1 docs 1  e.g. tierC-000215

;; ---- slot be.Source  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 be) (Source $e0 tarlac_city))    ;; n 2 docs 2  e.g. tierC-000347 tierC-000348
(And (Member $e0 be) (Source $e0 manila))    ;; n 1 docs 1  e.g. tierC-000348
(And (Member $e0 be) (Source $e0 $x1) (Member $x1 provincial_capital))    ;; n 1 docs 1  e.g. tierC-000347

;; ---- slot begin.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 begin) (Agent $e0 $x1) (Member $x1 european_american_settler))    ;; n 2 docs 2  e.g. tierC-000025 tierC-000026
(And (Member $e0 begin) (Agent $e0 $x1) (Member $x1 indigenous_american))    ;; n 1 docs 1  e.g. tierC-000025
(And (Member $e0 begin) (Agent $e0 $x1) (Member $x1 native_american))    ;; n 1 docs 1  e.g. tierC-000026

;; ---- slot begin.Theme  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 4
(And (Member $e0 begin) (Theme $e0 $e1) (Member $e1 create))    ;; n 4 docs 2  e.g. tierC-000025 tierC-000026

;; ---- slot block.Agent  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 block) (Agent $e0 $x1) (Member $x1 automobile))    ;; n 3 docs 3  e.g. tierA-000390 tierA-000392
(And (Member $e0 block) (Agent $e0 $x1) (Member $x1 car))    ;; n 1 docs 1  e.g. tierA-000391

;; ---- slot block.Theme  [event center; head role]  n 4  docs<= 4  distinct 1  eventive 0
(And (Member $e0 block) (Theme $e0 $x1) (Member $x1 lane))    ;; n 4 docs 4  e.g. tierA-000390 tierA-000391

;; ---- slot celebrated.Location  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 celebrated) (Location $e0 popular_culture))    ;; n 2 docs 2  e.g. tierC-000013 tierC-000014
(And (Member $e0 celebrated) (Location $e0 traditional_chinese_drama))    ;; n 1 docs 1  e.g. tierC-000013
(And (Member $e0 celebrated) (Location $e0 $x1) (Member $x1 traditional_chinese_drama))    ;; n 1 docs 1  e.g. tierC-000014

;; ---- slot commence.Patient  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 commence) (Patient $e0 $x1) (Member $x1 apple_harvest))    ;; n 1 docs 1  e.g. tierA-000069
(And (Member $e0 commence) (Patient $e0 $x1) (Member $x1 dress_rehearsal))    ;; n 1 docs 1  e.g. tierA-000064
(And (Member $e0 commence) (Patient $e0 $x1) (Member $x1 hearing))    ;; n 1 docs 1  e.g. tierA-000059
(And (Member $e0 commence) (Patient $e0 $x1) (Member $x1 shoreline_survey))    ;; n 1 docs 1  e.g. tierA-000054

;; ---- slot commence.Time  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 commence) (Time $e0 <term:Month>))    ;; n 1 docs 1  e.g. tierA-000069
(And (Member $e0 commence) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierA-000059
(And (Member $e0 commence) (Time $e0 dawn))    ;; n 1 docs 1  e.g. tierA-000054
(And (Member $e0 commence) (Time $e0 morning))    ;; n 1 docs 1  e.g. tierA-000059

;; ---- slot consider.Theme  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 consider) (Theme $e0 <term:Member>))    ;; n 4 docs 2  e.g. tierC-000233 tierC-000234

;; ---- slot create.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 create) (Agent $e0 $x1) (Member $x1 european_american_settler))    ;; n 2 docs 2  e.g. tierC-000025 tierC-000026
(And (Member $e0 create) (Agent $e0 $x1) (Member $x1 indigenous_american))    ;; n 1 docs 1  e.g. tierC-000025
(And (Member $e0 create) (Agent $e0 $x1) (Member $x1 native_american))    ;; n 1 docs 1  e.g. tierC-000026

;; ---- slot create.Location  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 create) (Location $e0 $x1) (Member $x1 post))    ;; n 4 docs 2  e.g. tierC-000025 tierC-000026

;; ---- slot create.Patient  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 create) (Patient $e0 $x1) (Member $x1 community))    ;; n 4 docs 2  e.g. tierC-000025 tierC-000026

;; ---- slot define.Manner  [event center; head role]  n 4  docs<= 8  distinct 4  eventive 0
(And (Member $e0 define) (Manner $e0 $x1) (Member $x1 random))    ;; n 3 (mass 1.5) docs 3  e.g. tierC-000145 tierC-000146
(And (Member $e0 define) (Manner $e0 $x1) (Member $x1 way))    ;; n 3 (mass 1.5) docs 3  e.g. tierC-000146 tierC-000261
(And (Member $e0 define) (Manner $e0 $x1) (Member $x1 accidental))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000262
(And (Member $e0 define) (Manner $e0 $x1) (Member $x1 manner))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000145

;; ---- slot define.Theme  [event center; head role]  n 4  docs<= 8  distinct 3  eventive 0
(And (Member $e0 define) (Theme $e0 $x1) (Member $x1 sequence))    ;; n 4 (mass 2) docs 4  e.g. tierC-000145 tierC-000146
(And (Member $e0 define) (Theme $e0 $x1) (Member $x1 algorithmically_equivalent))    ;; n 2 (mass 1) docs 2  e.g. tierC-000145 tierC-000146
(And (Member $e0 define) (Theme $e0 $x1) (Member $x1 equivalent))    ;; n 2 (mass 1) docs 2  e.g. tierC-000261 tierC-000262

;; ---- slot direct.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 direct) (Agent $e0 lev_l_spiro))    ;; n 2 docs 2  e.g. tierC-000297 tierC-000298
(And (Member $e0 direct) (Agent $e0 claude_lelouch))    ;; n 1 docs 1  e.g. tierC-000138
(And (Member $e0 direct) (Agent $e0 robert_day))    ;; n 1 docs 1  e.g. tierC-000091

;; ---- slot encourage.Agent  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 encourage) (Agent $e0 ralph))    ;; n 4 docs 2  e.g. tierC-000107 tierC-000108

;; ---- slot encourage.In  [event center; head oblique]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 encourage) (In $e0 mathematics))    ;; n 2 docs 2  e.g. tierC-000107 tierC-000108
(And (Member $e0 encourage) (In $e0 chess))    ;; n 1 docs 1  e.g. tierC-000108
(And (Member $e0 encourage) (In $e0 chess_play))    ;; n 1 docs 1  e.g. tierC-000107

;; ---- slot encourage.Theme  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 encourage) (Theme $e0 maurice))    ;; n 4 docs 2  e.g. tierC-000107 tierC-000108

;; ---- slot end.Time  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 end) (Time $e0 <term:Month>))    ;; n 1 docs 1  e.g. tierA-000071
(And (Member $e0 end) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierA-000060
(And (Member $e0 end) (Time $e0 dawn))    ;; n 1 docs 1  e.g. tierA-000056
(And (Member $e0 end) (Time $e0 morning))    ;; n 1 docs 1  e.g. tierA-000060

;; ---- slot error.Location  [event center; head role]  n 4  docs<= 4  distinct 1  eventive 0
(And (Member $e0 error) (Location $e0 $x1) (Member $x1 ledger))    ;; n 4 docs 4  e.g. tierA-000128 tierA-000129

;; ---- slot follow.Agent  [event center; head role]  n 4  docs<= 6  distinct 4  eventive 0
(And (Member $e0 follow) (Agent $e0 alexander))    ;; n 1 docs 1  e.g. tierC-000076
(And (Member $e0 follow) (Agent $e0 bailey))    ;; n 1 docs 1  e.g. tierC-000337
(And (Member $e0 follow) (Agent $e0 $x1) (Member $x1 house))    ;; n 2 (mass 1) docs 2  e.g. tierC-000095 tierC-000096
(And (Member $e0 follow) (Agent $e0 $x1) (Member $x1 muslim))    ;; n 2 (mass 1) docs 2  e.g. tierC-000095 tierC-000096

;; ---- slot follow.Theme  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 follow) (Theme $e0 $x1) (Member $x1 region))    ;; n 2 docs 2  e.g. tierC-000095 tierC-000096
(And (Member $e0 follow) (Theme $e0 henry_cole))    ;; n 1 docs 1  e.g. tierC-000337
(And (Member $e0 follow) (Theme $e0 margaret))    ;; n 1 docs 1  e.g. tierC-000076

;; ---- slot form.Patient  [event center; head role]  n 4  docs<= 5  distinct 4  eventive 0
(And (Member $e0 form) (Patient $e0 $x1) (Member $x1 main_songwriting_unit))    ;; n 2 docs 2  e.g. tierC-000179 tierC-000180
(And (Member $e0 form) (Patient $e0 technetium))    ;; n 1 docs 1  e.g. tierC-000164
(And (Member $e0 form) (Patient $e0 $x1) (Member $x1 complex))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000163
(And (Member $e0 form) (Patient $e0 $x1) (Member $x1 simple))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000163

;; ---- slot have.Location  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 have) (Location $e0 local_level))    ;; n 2 docs 2  e.g. tierC-000271 tierC-000272
(And (Member $e0 have) (Location $e0 regional_level))    ;; n 2 docs 2  e.g. tierC-000271 tierC-000272

;; ---- slot influence.Theme  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 influence) (Theme $e0 chinese_dumpling))    ;; n 2 docs 2  e.g. tierC-000351 tierC-000352
(And (Member $e0 influence) (Theme $e0 $x1) (Member $x1 religion))    ;; n 2 docs 2  e.g. tierC-000257 tierC-000258

;; ---- slot kill.Agent  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 kill) (Agent $e0 $x1) (Member $x1 hurricane))    ;; n 4 docs 2  e.g. tierC-000353 tierC-000354

;; ---- slot kill.Location  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 kill) (Location $e0 $x1) (Member $x1 state))    ;; n 4 docs 2  e.g. tierC-000353 tierC-000354

;; ---- slot kill.Manner  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 kill) (Manner $e0 directly))    ;; n 2 docs 2  e.g. tierC-000353 tierC-000354
(And (Member $e0 kill) (Manner $e0 indirectly))    ;; n 2 docs 2  e.g. tierC-000353 tierC-000354

;; ---- slot kill.Patient  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 kill) (Patient $e0 $x1) (Member $x1 person))    ;; n 4 docs 2  e.g. tierC-000353 tierC-000354

;; ---- slot make.Agent  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 board))    ;; n 1 docs 1  e.g. tierA-000202
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 committee))    ;; n 1 docs 1  e.g. tierA-000186
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 family))    ;; n 1 docs 1  e.g. tierA-000197
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 judge))    ;; n 1 docs 1  e.g. tierA-000191

;; ---- slot make.Patient  [event center; head role]  n 4  docs<= 4  distinct 1  eventive 4
(And (Member $e0 make) (Patient $e0 $e1) (Member $e1 decision))    ;; n 4 docs 4  e.g. tierA-000186 tierA-000191

;; ---- slot move.Goal  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 move) (Goal $e0 baltimore))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198
(And (Member $e0 move) (Goal $e0 germany))    ;; n 2 docs 2  e.g. tierC-000121 tierC-000122

;; ---- slot nation.Location  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 nation) (Location $e0 bengal))    ;; n 2 docs 2  e.g. tierC-000299 tierC-000300
(And (Member $e0 nation) (Location $e0 south_asia))    ;; n 2 docs 2  e.g. tierC-000299 tierC-000300

;; ---- slot order.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 order) (Agent $e0 $x1) (Member $x1 physician))    ;; n 2 docs 2  e.g. tierA-000385 tierA-000387
(And (Member $e0 order) (Agent $e0 $x1) (Member $x1 doctor))    ;; n 1 docs 1  e.g. tierA-000386
(And (Member $e0 order) (Agent $e0 $x1) (Member $x1 scan))    ;; n 1 docs 1  e.g. tierA-000389

;; ---- slot order.Theme  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 order) (Theme $e0 $x1) (Member $x1 scan))    ;; n 3 docs 3  e.g. tierA-000385 tierA-000386
(And (Member $e0 order) (Theme $e0 $x1) (Member $x1 physician))    ;; n 1 docs 1  e.g. tierA-000389

;; ---- slot play.Agent  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 play) (Agent $e0 audrey_hepburn))    ;; n 1 docs 1  e.g. tierC-000228
(And (Member $e0 play) (Agent $e0 audrey_heppurn))    ;; n 1 docs 1  e.g. tierC-000227
(And (Member $e0 play) (Agent $e0 boston_red_sox))    ;; n 1 docs 1  e.g. tierC-000229
(And (Member $e0 play) (Agent $e0 cincinnati_reds))    ;; n 1 docs 1  e.g. tierC-000229

;; ---- slot play.Theme  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 1
(And (Member $e0 play) (Theme $e0 holly_golightly))    ;; n 2 docs 2  e.g. tierC-000227 tierC-000228
(And (Member $e0 play) (Theme $e0 $x1) (Member $x1 series))    ;; n 1 docs 1  e.g. tierC-000229
(And (Member $e0 play) (Theme $e0 $e1) (Member $e1 series))    ;; n 1 docs 1  e.g. tierC-000230

;; ---- slot preach.Location  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 preach) (Location $e0 gareccio))    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048
(And (Member $e0 preach) (Location $e0 italy))    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot purchase.Agent  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 purchase) (Agent $e0 $x1) (Member $x1 chef))    ;; n 1 docs 1  e.g. tierA-000016
(And (Member $e0 purchase) (Agent $e0 $x1) (Member $x1 depot))    ;; n 1 docs 1  e.g. tierA-000002
(And (Member $e0 purchase) (Agent $e0 $x1) (Member $x1 pottery_studio))    ;; n 1 docs 1  e.g. tierA-000023
(And (Member $e0 purchase) (Agent $e0 $x1) (Member $x1 school))    ;; n 1 docs 1  e.g. tierA-000009

;; ---- slot purchase.Theme  [event center; head role]  n 4  docs<= 5  distinct 5  eventive 0
(And (Member $e0 purchase) (Theme $e0 $x1) (Member $x1 forklift))    ;; n 1 docs 1  e.g. tierA-000002
(And (Member $e0 purchase) (Theme $e0 $x1) (Member $x1 kiln))    ;; n 1 docs 1  e.g. tierA-000023
(And (Member $e0 purchase) (Theme $e0 $x1) (Member $x1 projector))    ;; n 1 docs 1  e.g. tierA-000009
(And (Member $e0 purchase) (Theme $e0 $x1) (Member $x1 crate))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000016
(And (Member $e0 purchase) (Theme $e0 $x1) (Member $x1 lemon))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000016

;; ---- slot reach.Agent  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 reach) (Agent $e0 $x1) (Member $x1 board))    ;; n 1 docs 1  e.g. tierA-000203
(And (Member $e0 reach) (Agent $e0 $x1) (Member $x1 committee))    ;; n 1 docs 1  e.g. tierA-000187
(And (Member $e0 reach) (Agent $e0 $x1) (Member $x1 family))    ;; n 1 docs 1  e.g. tierA-000198
(And (Member $e0 reach) (Agent $e0 $x1) (Member $x1 judge))    ;; n 1 docs 1  e.g. tierA-000192

;; ---- slot reach.Theme  [event center; head role]  n 4  docs<= 4  distinct 1  eventive 4
(And (Member $e0 reach) (Theme $e0 $e1) (Member $e1 decision))    ;; n 4 docs 4  e.g. tierA-000187 tierA-000192

;; ---- slot replace.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 replace) (Agent $e0 sherman_howard))    ;; n 2 docs 2  e.g. tierC-000359 tierC-000360
(And (Member $e0 replace) (Agent $e0 $x1) (Member $x1 governor))    ;; n 1 docs 1  e.g. tierC-000100
(And (Member $e0 replace) (Agent $e0 peter_gaussen))    ;; n 1 docs 1  e.g. tierC-000099

;; ---- slot replace.Theme  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 replace) (Theme $e0 $x1) (Member $x1 governor))    ;; n 1 docs 1  e.g. tierC-000099
(And (Member $e0 replace) (Theme $e0 lex_lex_luthor))    ;; n 1 docs 1  e.g. tierC-000360
(And (Member $e0 replace) (Theme $e0 lex_luthor))    ;; n 1 docs 1  e.g. tierC-000359
(And (Member $e0 replace) (Theme $e0 william_ewer))    ;; n 1 docs 1  e.g. tierC-000100

;; ---- slot sell.Recipient  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 sell) (Recipient $e0 $x1) (Member $x1 chef))    ;; n 1 docs 1  e.g. tierA-000018
(And (Member $e0 sell) (Recipient $e0 $x1) (Member $x1 depot))    ;; n 1 docs 1  e.g. tierA-000004
(And (Member $e0 sell) (Recipient $e0 $x1) (Member $x1 pottery_studio))    ;; n 1 docs 1  e.g. tierA-000025
(And (Member $e0 sell) (Recipient $e0 $x1) (Member $x1 school))    ;; n 1 docs 1  e.g. tierA-000011

;; ---- slot sign.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 sign) (Agent $e0 $x1) (Member $x1 physician))    ;; n 2 docs 2  e.g. tierA-000375 tierA-000377
(And (Member $e0 sign) (Agent $e0 $x1) (Member $x1 chart))    ;; n 1 docs 1  e.g. tierA-000378
(And (Member $e0 sign) (Agent $e0 $x1) (Member $x1 doctor))    ;; n 1 docs 1  e.g. tierA-000376

;; ---- slot sign.Patient  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 sign) (Patient $e0 $x1) (Member $x1 chart))    ;; n 3 docs 3  e.g. tierA-000375 tierA-000376
(And (Member $e0 sign) (Patient $e0 $x1) (Member $x1 physician))    ;; n 1 docs 1  e.g. tierA-000378

;; ---- slot sing.Manner  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 sing) (Manner $e0 a_cappella))    ;; n 4 docs 2  e.g. tierC-000329 tierC-000330

;; ---- slot sing.Theme  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 sing) (Theme $e0 music))    ;; n 4 docs 2  e.g. tierC-000127 tierC-000128

;; ---- slot speak.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 speak) (Agent $e0 oates))    ;; n 2 docs 2  e.g. tierC-000023 tierC-000024
(And (Member $e0 speak) (Agent $e0 kari_wahlgren))    ;; n 1 docs 1  e.g. tierC-000094
(And (Member $e0 speak) (Agent $e0 mie_sonozaki))    ;; n 1 docs 1  e.g. tierC-000094

;; ---- slot specify.Manner  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 specify) (Manner $e0 continuous_time))    ;; n 2 docs 2  e.g. tierC-000267 tierC-000268
(And (Member $e0 specify) (Manner $e0 discrete_time))    ;; n 2 docs 2  e.g. tierC-000267 tierC-000268

;; ---- slot star.Agent  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 star) (Agent $e0 $x1))    ;; n 4 docs 2  e.g. tierC-000137 tierC-000138

;; ---- slot star.Theme  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 star) (Theme $e0 jeremy_irons))    ;; n 2 docs 2  e.g. tierC-000137 tierC-000138
(And (Member $e0 star) (Theme $e0 patricia_kaas))    ;; n 2 docs 2  e.g. tierC-000137 tierC-000138

;; ---- slot start.Patient  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 apple_harvest))    ;; n 1 docs 1  e.g. tierA-000068
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 dress_rehearsal))    ;; n 1 docs 1  e.g. tierA-000063
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 hearing))    ;; n 1 docs 1  e.g. tierA-000058
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 shoreline_survey))    ;; n 1 docs 1  e.g. tierA-000053

;; ---- slot start.Time  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 start) (Time $e0 <term:Month>))    ;; n 1 docs 1  e.g. tierA-000068
(And (Member $e0 start) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierA-000058
(And (Member $e0 start) (Time $e0 dawn))    ;; n 1 docs 1  e.g. tierA-000053
(And (Member $e0 start) (Time $e0 morning))    ;; n 1 docs 1  e.g. tierA-000058

;; ---- slot study.Agent  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 study) (Agent $e0 $x1) (Member $x1 person))    ;; n 4 docs 2  e.g. tierC-000253 tierC-000254

;; ---- slot take.Theme  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 2
(And (Member $e0 take) (Theme $e0 $x1) (Member $x1 identity))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072
(And (Member $e0 take) (Theme $e0 $e1) (Member $e1 walk))    ;; n 2 docs 2  e.g. tierA-000174 tierA-000178

;; ---- slot use.Manner  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 use) (Manner $e0 rare))    ;; n 4 docs 2  e.g. tierC-000005 tierC-000006

;; ---- slot win.Agent  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 win) (Agent $e0 james_woods))    ;; n 2 docs 2  e.g. tierC-000301 tierC-000302
(And (Member $e0 win) (Agent $e0 wilson))    ;; n 1 docs 1  e.g. tierC-000278
(And (Member $e0 win) (Agent $e0 $x1) (Member $x1 wilson))    ;; n 1 docs 1  e.g. tierC-000277

;; ---- slot win.For  [event center; head oblique]  n 4  docs<= 4  distinct 1  eventive 4
(And (Member $e0 win) (For $e0 $e1) (Member $e1 portray))    ;; n 4 docs 4  e.g. tierC-000277 tierC-000278

;; ---- slot win.Theme  [event center; head role]  n 4  docs<= 4  distinct 1  eventive 0
(And (Member $e0 win) (Theme $e0 $x1) (Member $x1 emmy))    ;; n 4 docs 4  e.g. tierC-000277 tierC-000278

;; ---- slot add.Agent  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 add) (Agent $e0 $x1))    ;; n 2 docs 2  e.g. tierC-000227 tierC-000228
(And (Member $e0 add) (Agent $e0 j_augustus_knapp))    ;; n 1 docs 1  e.g. tierC-000231

;; ---- slot bear.Patient  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 bear) (Patient $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000199 tierC-000200
(And (Member $e0 bear) (Patient $e0 leonor_rodrigues))    ;; n 1 docs 1  e.g. tierC-000358

;; ---- slot borrow.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 borrow) (Agent $e0 $x1) (Member $x1 crew))    ;; n 1 docs 1  e.g. tierA-000302
(And (Member $e0 borrow) (Agent $e0 $x1) (Member $x1 gallery))    ;; n 1 docs 1  e.g. tierA-000307
(And (Member $e0 borrow) (Agent $e0 ravi))    ;; n 1 docs 1  e.g. tierA-000297

;; ---- slot borrow.Source  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 borrow) (Source $e0 $x1) (Member $x1 depot))    ;; n 1 docs 1  e.g. tierA-000302
(And (Member $e0 borrow) (Source $e0 $x1) (Member $x1 museum))    ;; n 1 docs 1  e.g. tierA-000307
(And (Member $e0 borrow) (Source $e0 $x1) (Member $x1 neighbour))    ;; n 1 docs 1  e.g. tierA-000297

;; ---- slot buy.Beneficiary  [event center; head role]  n 3  docs<= 3  distinct 1  eventive 0
(And (Member $e0 buy) (Beneficiary $e0 $x1) (Member $x1 hall))    ;; n 3 docs 3  e.g. tierA-000008 tierA-000012

;; ---- slot call_off.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 call_off) (Agent $e0 $x1) (Member $x1 airline))    ;; n 1 docs 1  e.g. tierA-000144
(And (Member $e0 call_off) (Agent $e0 $x1) (Member $x1 council))    ;; n 1 docs 1  e.g. tierA-000149
(And (Member $e0 call_off) (Agent $e0 $x1) (Member $x1 tutor))    ;; n 1 docs 1  e.g. tierA-000154

;; ---- slot cause.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 cause) (Agent $e0 $x1) (Member $x1 fire))    ;; n 1 docs 1  e.g. tierA-000228
(And (Member $e0 cause) (Agent $e0 $x1) (Member $x1 flood))    ;; n 1 docs 1  e.g. tierA-000233
(And (Member $e0 cause) (Agent $e0 $x1) (Member $x1 storm))    ;; n 1 docs 1  e.g. tierA-000223

;; ---- slot cause.Theme  [event center; head role]  n 3  docs<= 3  distinct 1  eventive 3
(And (Member $e0 cause) (Theme $e0 $e1) (Member $e1 destroy))    ;; n 3 docs 3  e.g. tierA-000223 tierA-000228

;; ---- slot discover.Experiencer  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 discover) (Experiencer $e0 $x1) (Member $x1 auditor))    ;; n 2 docs 2  e.g. tierA-000128 tierA-000130
(And (Member $e0 discover) (Experiencer $e0 $x1) (Member $x1 error))    ;; n 1 docs 1  e.g. tierA-000132

;; ---- slot discover.Stimulus  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 3
(And (Member $e0 discover) (Stimulus $e0 $e1) (Member $e1 error))    ;; n 2 docs 2  e.g. tierA-000128 tierA-000130
(And (Member $e0 discover) (Stimulus $e0 $e1) (Member $e1 auditor))    ;; n 1 docs 1  e.g. tierA-000132

;; ---- slot end.Patient  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 end) (Patient $e0 $x1) (Member $x1 apple_harvest))    ;; n 1 docs 1  e.g. tierA-000071
(And (Member $e0 end) (Patient $e0 $x1) (Member $x1 hearing))    ;; n 1 docs 1  e.g. tierA-000060
(And (Member $e0 end) (Patient $e0 $x1) (Member $x1 shoreline_survey))    ;; n 1 docs 1  e.g. tierA-000056

;; ---- slot examine.Agent  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 examine) (Agent $e0 $x1) (Member $x1 physician))    ;; n 2 docs 2  e.g. tierA-000380 tierA-000382
(And (Member $e0 examine) (Agent $e0 $x1) (Member $x1 doctor))    ;; n 1 docs 1  e.g. tierA-000381

;; ---- slot examine.Theme  [event center; head role]  n 3  docs<= 3  distinct 1  eventive 0
(And (Member $e0 examine) (Theme $e0 $x1) (Member $x1 sample))    ;; n 3 docs 3  e.g. tierA-000380 tierA-000381

;; ---- slot fund.Theme  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 fund) (Theme $e0 $x1) (Member $x1 lessos_kenya_border_section))    ;; n 2 docs 2  e.g. tierC-000217 tierC-000218
(And (Member $e0 fund) (Theme $e0 $x1) (Member $x1 border_section))    ;; n 1 docs 1  e.g. tierC-000245

;; ---- slot give_up.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 give_up) (Agent $e0 $x1) (Member $x1 climber))    ;; n 1 docs 1  e.g. tierA-000110
(And (Member $e0 give_up) (Agent $e0 $x1) (Member $x1 firm))    ;; n 1 docs 1  e.g. tierA-000105
(And (Member $e0 give_up) (Agent $e0 $x1) (Member $x1 rescue_team))    ;; n 1 docs 1  e.g. tierA-000100

;; ---- slot give_up.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 give_up) (Theme $e0 $x1) (Member $x1 north_route))    ;; n 1 docs 1  e.g. tierA-000110
(And (Member $e0 give_up) (Theme $e0 $x1) (Member $x1 search))    ;; n 1 docs 1  e.g. tierA-000100
(And (Member $e0 give_up) (Theme $e0 $x1) (Member $x1 tender))    ;; n 1 docs 1  e.g. tierA-000105

;; ---- slot influence.Agent  [event center; head role]  n 3  docs<= 4  distinct 3  eventive 0
(And (Member $e0 influence) (Agent $e0 $x1) (Member $x1 indonesian_immigrant))    ;; n 2 docs 2  e.g. tierC-000351 tierC-000352
(And (Member $e0 influence) (Agent $e0 $x1) (Member $x1 balance))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000257
(And (Member $e0 influence) (Agent $e0 $x1) (Member $x1 international))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000257

;; ---- slot learn.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 learn) (Agent $e0 $x1) (Member $x1 apprentice))    ;; n 1 docs 1  e.g. tierA-000282
(And (Member $e0 learn) (Agent $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierA-000292
(And (Member $e0 learn) (Agent $e0 $x1) (Member $x1 squad))    ;; n 1 docs 1  e.g. tierA-000287

;; ---- slot learn.Source  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 learn) (Source $e0 $x1) (Member $x1 coach))    ;; n 1 docs 1  e.g. tierA-000287
(And (Member $e0 learn) (Source $e0 $x1) (Member $x1 elder))    ;; n 1 docs 1  e.g. tierA-000292
(And (Member $e0 learn) (Source $e0 $x1) (Member $x1 potter))    ;; n 1 docs 1  e.g. tierA-000282

;; ---- slot learn.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 learn) (Theme $e0 $x1) (Member $x1 drill))    ;; n 1 docs 1  e.g. tierA-000287
(And (Member $e0 learn) (Theme $e0 glazing))    ;; n 1 docs 1  e.g. tierA-000282
(And (Member $e0 learn) (Theme $e0 $x1) (Member $x1 song))    ;; n 1 docs 1  e.g. tierA-000292

;; ---- slot market.Beneficiary  [event center; head role]  n 3  docs<= 2  distinct 1  eventive 0
(And (Member $e0 market) (Beneficiary $e0 shop))    ;; n 3 docs 2  e.g. tierC-000321 tierC-000322

;; ---- slot market.Location  [event center; head role]  n 3  docs<= 4  distinct 2  eventive 0
(And (Member $e0 market) (Location $e0 $x1) (Member $x1 block))    ;; n 3 (mass 1.5) docs 2  e.g. tierC-000321 tierC-000322
(And (Member $e0 market) (Location $e0 $x1) (Member $x1 pakistani))    ;; n 3 (mass 1.5) docs 2  e.g. tierC-000321 tierC-000322

;; ---- slot need.Holder  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 need) (Holder $e0 $x1) (Member $x1 lathe))    ;; n 1 docs 1  e.g. tierA-000095
(And (Member $e0 need) (Holder $e0 $x1) (Member $x1 permit))    ;; n 1 docs 1  e.g. tierA-000090
(And (Member $e0 need) (Holder $e0 $x1) (Member $x1 recipe))    ;; n 1 docs 1  e.g. tierA-000085

;; ---- slot need.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 need) (Theme $e0 $x1) (Member $x1 countersignature))    ;; n 1 docs 1  e.g. tierA-000090
(And (Member $e0 need) (Theme $e0 $x1) (Member $x1 egg))    ;; n 1 docs 1  e.g. tierA-000085
(And (Member $e0 need) (Theme $e0 monthly_servicing))    ;; n 1 docs 1  e.g. tierA-000095

;; ---- slot permit.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 permit) (Agent $e0 $x1) (Member $x1 curator))    ;; n 1 docs 1  e.g. tierA-000081
(And (Member $e0 permit) (Agent $e0 $x1) (Member $x1 licence))    ;; n 1 docs 1  e.g. tierA-000077
(And (Member $e0 permit) (Agent $e0 $x1) (Member $x1 warden))    ;; n 1 docs 1  e.g. tierA-000073

;; ---- slot permit.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 permit) (Theme $e0 night_delivery))    ;; n 1 docs 1  e.g. tierA-000077
(And (Member $e0 permit) (Theme $e0 photography))    ;; n 1 docs 1  e.g. tierA-000081
(And (Member $e0 permit) (Theme $e0 visitor))    ;; n 1 docs 1  e.g. tierA-000073

;; ---- slot put_off.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 put_off) (Agent $e0 $x1) (Member $x1 board))    ;; n 1 docs 1  e.g. tierA-000115
(And (Member $e0 put_off) (Agent $e0 $x1) (Member $x1 club))    ;; n 1 docs 1  e.g. tierA-000124
(And (Member $e0 put_off) (Agent $e0 $x1) (Member $x1 ferry))    ;; n 1 docs 1  e.g. tierA-000120

;; ---- slot put_off.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 put_off) (Theme $e0 $x1) (Member $x1 departure))    ;; n 1 docs 1  e.g. tierA-000120
(And (Member $e0 put_off) (Theme $e0 $x1) (Member $x1 tournament))    ;; n 1 docs 1  e.g. tierA-000124
(And (Member $e0 put_off) (Theme $e0 $x1) (Member $x1 vote))    ;; n 1 docs 1  e.g. tierA-000115

;; ---- slot receive.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 receive) (Agent $e0 $x1) (Member $x1 driver))    ;; n 1 docs 1  e.g. tierA-000272
(And (Member $e0 receive) (Agent $e0 $x1) (Member $x1 recruit))    ;; n 1 docs 1  e.g. tierA-000262
(And (Member $e0 receive) (Agent $e0 $x1) (Member $x1 winner))    ;; n 1 docs 1  e.g. tierA-000277

;; ---- slot receive.Source  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 receive) (Source $e0 $x1) (Member $x1 foreman))    ;; n 1 docs 1  e.g. tierA-000272
(And (Member $e0 receive) (Source $e0 $x1) (Member $x1 school))    ;; n 1 docs 1  e.g. tierA-000277
(And (Member $e0 receive) (Source $e0 $x1) (Member $x1 trainer))    ;; n 1 docs 1  e.g. tierA-000262

;; ---- slot start.Experiencer  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 start) (Experiencer $e0 $x1) (Member $x1 bridge))    ;; n 2 docs 2  e.g. tierC-000125 tierC-000126
(And (Member $e0 start) (Experiencer $e0 $x1) (Member $x1 tunnel))    ;; n 1 docs 1  e.g. tierC-000125

;; ---- slot start.Location  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 start) (Location $e0 sweden))    ;; n 2 docs 2  e.g. tierC-000125 tierC-000126
(And (Member $e0 start) (Location $e0 denmark))    ;; n 1 docs 1  e.g. tierC-000125

;; ---- slot succeed.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 succeed) (Agent $e0 alexander))    ;; n 1 docs 1  e.g. tierC-000075
(And (Member $e0 succeed) (Agent $e0 bailey))    ;; n 1 docs 1  e.g. tierC-000338
(And (Member $e0 succeed) (Agent $e0 peter_gaussen))    ;; n 1 docs 1  e.g. tierC-000100

;; ---- slot succeed.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 succeed) (Theme $e0 $x1) (Member $x1 governor))    ;; n 1 docs 1  e.g. tierC-000100
(And (Member $e0 succeed) (Theme $e0 henry_cole))    ;; n 1 docs 1  e.g. tierC-000338
(And (Member $e0 succeed) (Theme $e0 margaret))    ;; n 1 docs 1  e.g. tierC-000075

;; ---- slot turn_down.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 turn_down) (Agent $e0 $x1) (Member $x1 bank))    ;; n 1 docs 1  e.g. tierA-000164
(And (Member $e0 turn_down) (Agent $e0 $x1) (Member $x1 editor))    ;; n 1 docs 1  e.g. tierA-000159
(And (Member $e0 turn_down) (Agent $e0 $x1) (Member $x1 panel))    ;; n 1 docs 1  e.g. tierA-000169

;; ---- slot turn_down.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 turn_down) (Theme $e0 $x1) (Member $x1 loan_application))    ;; n 1 docs 1  e.g. tierA-000164
(And (Member $e0 turn_down) (Theme $e0 $x1) (Member $x1 manuscript))    ;; n 1 docs 1  e.g. tierA-000159
(And (Member $e0 turn_down) (Theme $e0 $x1) (Member $x1 proposal))    ;; n 1 docs 1  e.g. tierA-000169

;; ---- slot wait.Experiencer  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 wait) (Experiencer $e0 $x1) (Member $x1 automobile))    ;; n 2 docs 2  e.g. tierA-000395 tierA-000397
(And (Member $e0 wait) (Experiencer $e0 $x1) (Member $x1 car))    ;; n 1 docs 1  e.g. tierA-000396

;; ---- slot wait.Location  [event center; head role]  n 3  docs<= 3  distinct 1  eventive 0
(And (Member $e0 wait) (Location $e0 $x1) (Member $x1 gate))    ;; n 3 docs 3  e.g. tierA-000395 tierA-000396

;; ---- slot walk.Goal  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 walk) (Goal $e0 $x1) (Member $x1 pier))    ;; n 2 docs 2  e.g. tierA-000181 tierA-000182
(And (Member $e0 walk) (Goal $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierA-000183

;; ---- slot work.Theme  [event center; head role]  n 3  docs<= 2  distinct 1  eventive 0
(And (Member $e0 work) (Theme $e0 $x1) (Member $x1 mural))    ;; n 3 docs 2  e.g. tierA-000311 tierA-000312

;; ---- slot diverse.Experiencer  [event center; head role]  n 2  docs<= 6  distinct 3  eventive 0
(And (Member $e0 diverse) (Experiencer $e0 $x1) (Member $x1 diverse))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288
(And (Member $e0 diverse) (Experiencer $e0 $x1) (Member $x1 established))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288
(And (Member $e0 diverse) (Experiencer $e0 $x1) (Member $x1 genre))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot established.Experiencer  [event center; head role]  n 2  docs<= 6  distinct 3  eventive 0
(And (Member $e0 established) (Experiencer $e0 $x1) (Member $x1 diverse))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288
(And (Member $e0 established) (Experiencer $e0 $x1) (Member $x1 established))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288
(And (Member $e0 established) (Experiencer $e0 $x1) (Member $x1 genre))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot <unclassed>.DueTo  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(DueTo $e0 autosomal_dominant_disease)    ;; n 2 docs 2  e.g. tierC-000149 tierC-000150

;; ---- slot accept.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 accept) (Agent $e0 $x1) (Member $x1 editor))    ;; n 1 docs 1  e.g. tierA-000161
(And (Member $e0 accept) (Agent $e0 $x1) (Member $x1 panel))    ;; n 1 docs 1  e.g. tierA-000172

;; ---- slot accept.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 accept) (Theme $e0 $x1) (Member $x1 manuscript))    ;; n 1 docs 1  e.g. tierA-000161
(And (Member $e0 accept) (Theme $e0 $x1) (Member $x1 proposal))    ;; n 1 docs 1  e.g. tierA-000172

;; ---- slot add.Goal  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 add) (Goal $e0 $x1) (Member $x1 personality))    ;; n 2 docs 2  e.g. tierC-000227 tierC-000228

;; ---- slot add.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 add) (Theme $e0 $x1) (Member $x1 illustration))    ;; n 2 docs 2  e.g. tierC-000231 tierC-000232

;; ---- slot administrator.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 administrator) (Experiencer $e0 thomas_fothergill))    ;; n 2 docs 2  e.g. tierC-000085 tierC-000086

;; ---- slot administrator.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 administrator) (Location $e0 university_of_oxford))    ;; n 2 docs 2  e.g. tierC-000085 tierC-000086

;; ---- slot advance.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 advance) (Agent $e0 $x1) (Member $x1 board))    ;; n 1 docs 1  e.g. tierA-000117
(And (Member $e0 advance) (Agent $e0 $x1) (Member $x1 club))    ;; n 1 docs 1  e.g. tierA-000127

;; ---- slot advance.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 advance) (Theme $e0 $x1) (Member $x1 tournament))    ;; n 1 docs 1  e.g. tierA-000127
(And (Member $e0 advance) (Theme $e0 $x1) (Member $x1 vote))    ;; n 1 docs 1  e.g. tierA-000117

;; ---- slot appear.As  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 appear) (As $e0 peter))    ;; n 2 docs 2  e.g. tierC-000259 tierC-000260

;; ---- slot appear.Time  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 appear) (Time $e0 later_in_life))    ;; n 2 docs 2  e.g. tierC-000049 tierC-000050

;; ---- slot arrange.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 arrange) (Agent $e0 nick_de_caro))    ;; n 2 docs 2  e.g. tierC-000349 tierC-000350

;; ---- slot arrange.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 arrange) (Theme $e0 $x1) (Member $x1 session))    ;; n 2 docs 2  e.g. tierC-000349 tierC-000350

;; ---- slot arrival.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 arrival) (Agent $e0 $x1) (Member $x1 delegation))    ;; n 1 docs 1  e.g. tierA-000242
(And (Member $e0 arrival) (Agent $e0 $x1) (Member $x1 soil_sample))    ;; n 1 docs 1  e.g. tierA-000246

;; ---- slot assistant.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 assistant) (Experiencer $e0 bruno_simma))    ;; n 2 docs 2  e.g. tierC-000151 tierC-000152

;; ---- slot assistant.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 assistant) (Location $e0 lagrand_case))    ;; n 2 docs 2  e.g. tierC-000151 tierC-000152

;; ---- slot attract.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 attract) (Agent $e0 $x1) (Member $x1 story))    ;; n 2 docs 2  e.g. tierC-000177 tierC-000178

;; ---- slot attract.Theme  [event center; head role]  n 2  docs<= 4  distinct 2  eventive 0
(And (Member $e0 attract) (Theme $e0 $x1) (Member $x1 attention))    ;; n 2 (mass 1) docs 2  e.g. tierC-000177 tierC-000178
(And (Member $e0 attract) (Theme $e0 $x1) (Member $x1 widespread))    ;; n 2 (mass 1) docs 2  e.g. tierC-000177 tierC-000178

;; ---- slot avoid.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 avoid) (Agent $e0 $x1) (Member $x1 automobile))    ;; n 1 docs 1  e.g. tierA-000401
(And (Member $e0 avoid) (Agent $e0 $x1) (Member $x1 father))    ;; n 1 docs 1  e.g. tierC-000124

;; ---- slot bad.Experiencer  [event center; head role]  n 2  docs<= 4  distinct 2  eventive 0
(And (Member $e0 bad) (Experiencer $e0 $x1) (Member $x1 bad))    ;; n 2 (mass 1) docs 2  e.g. tierC-000241 tierC-000242
(And (Member $e0 bad) (Experiencer $e0 $x1) (Member $x1 relationship))    ;; n 2 (mass 1) docs 2  e.g. tierC-000241 tierC-000242

;; ---- slot bake.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 bake) (Agent $e0 company))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot bake.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 bake) (Patient $e0 ice_cone))    ;; n 1 docs 1  e.g. tierC-000198
(And (Member $e0 bake) (Patient $e0 ice_cream_cone))    ;; n 1 docs 1  e.g. tierC-000197

;; ---- slot barako.Source  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 barako) (Source $e0 batangas))    ;; n 2 docs 2  e.g. tierC-000203 tierC-000204

;; ---- slot bear.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 bear) (Location $e0 bromma))    ;; n 2 docs 2  e.g. tierC-000199 tierC-000200

;; ---- slot become.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 become) (Theme $e0 $x1) (Member $x1 inomaru))    ;; n 2 docs 2  e.g. tierC-000237 tierC-000238

;; ---- slot become.Time  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 become) (Time $e0 now))    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242

;; ---- slot believe.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 believe) (Theme $e0 <term:And>))    ;; n 2 docs 2  e.g. tierC-000061 tierC-000062

;; ---- slot break_into.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 break_into) (Agent $e0 kerr))    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244

;; ---- slot break_into.Goal  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 break_into) (Goal $e0 $x1) (Member $x1 first_team))    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244

;; ---- slot break_into.Time  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 break_into) (Time $e0 $x1) (Member $x1 season))    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244

;; ---- slot bring.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 bring) (Agent $e0 $x1) (Member $x1 indonesian_immigrant))    ;; n 2 docs 2  e.g. tierC-000351 tierC-000352

;; ---- slot bring.Goal  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 bring) (Goal $e0 indonesia))    ;; n 2 docs 2  e.g. tierC-000351 tierC-000352

;; ---- slot bring.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 bring) (Theme $e0 chinese_dumpling))    ;; n 2 docs 2  e.g. tierC-000351 tierC-000352

;; ---- slot call_off.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 call_off) (Patient $e0 $x1) (Member $x1 afternoon_session))    ;; n 1 docs 1  e.g. tierA-000154
(And (Member $e0 call_off) (Patient $e0 $x1) (Member $x1 summer_fair))    ;; n 1 docs 1  e.g. tierA-000149

;; ---- slot cancel.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 cancel) (Theme $e0 $x1) (Member $x1 evening_flight))    ;; n 1 docs 1  e.g. tierA-000143
(And (Member $e0 cancel) (Theme $e0 $x1) (Member $x1 scan))    ;; n 1 docs 1  e.g. tierA-000388

;; ---- slot celebrate.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 celebrate) (Patient $e0 $x1) (Member $x1 mela))    ;; n 2 docs 2  e.g. tierC-000133 tierC-000134

;; ---- slot celebrated.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 celebrated) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000013 tierC-000014

;; ---- slot change.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 change) (Agent $e0 cameron))    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012

;; ---- slot change.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 change) (Patient $e0 $x1) (Member $x1 mind))    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012

;; ---- slot clarify.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 clarify) (Agent $e0 $x1) (Member $x1 task))    ;; n 2 docs 2  e.g. tierC-000021 tierC-000022

;; ---- slot clarify.Theme  [event center; head role]  n 2  docs<= 4  distinct 2  eventive 0
(And (Member $e0 clarify) (Theme $e0 $x1) (Member $x1 empirical))    ;; n 2 (mass 1) docs 2  e.g. tierC-000021 tierC-000022
(And (Member $e0 clarify) (Theme $e0 $x1) (Member $x1 relationship))    ;; n 2 (mass 1) docs 2  e.g. tierC-000021 tierC-000022

;; ---- slot common.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 common) (Location $e0 northern_india))    ;; n 1 docs 1  e.g. tierC-000136
(And (Member $e0 common) (Location $e0 $x1) (Member $x1 part))    ;; n 1 docs 1  e.g. tierC-000136

;; ---- slot compete.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 compete) (Agent $e0 $x1) (Member $x1 biologist))    ;; n 1 docs 1  e.g. tierA-000321
(And (Member $e0 compete) (Agent $e0 $x1) (Member $x1 welder))    ;; n 1 docs 1  e.g. tierA-000318

;; ---- slot compete.CoAgent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 compete) (CoAgent $e0 $x1) (Member $x1 fitter))    ;; n 1 docs 1  e.g. tierA-000318
(And (Member $e0 compete) (CoAgent $e0 $x1) (Member $x1 ranger))    ;; n 1 docs 1  e.g. tierA-000321

;; ---- slot compete.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 compete) (Location $e0 $x1) (Member $x1 frame))    ;; n 1 docs 1  e.g. tierA-000318
(And (Member $e0 compete) (Location $e0 $x1) (Member $x1 survey))    ;; n 1 docs 1  e.g. tierA-000321

;; ---- slot compose.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 compose) (Patient $e0 $x1) (Member $x1 song))    ;; n 2 docs 2  e.g. tierC-000131 tierC-000132

;; ---- slot conduct.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 conduct) (Agent $e0 carl_fenton))    ;; n 2 docs 2  e.g. tierC-000341 tierC-000342

;; ---- slot conduct.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 conduct) (Theme $e0 $x1) (Member $x1 orchestra))    ;; n 2 docs 2  e.g. tierC-000341 tierC-000342

;; ---- slot confirm.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 confirm) (Agent $e0 $x1) (Member $x1 airline))    ;; n 1 docs 1  e.g. tierA-000146
(And (Member $e0 confirm) (Agent $e0 $x1) (Member $x1 tutor))    ;; n 1 docs 1  e.g. tierA-000157

;; ---- slot confirm.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 confirm) (Theme $e0 $x1) (Member $x1 afternoon_session))    ;; n 1 docs 1  e.g. tierA-000157
(And (Member $e0 confirm) (Theme $e0 $x1) (Member $x1 evening_flight))    ;; n 1 docs 1  e.g. tierA-000146

;; ---- slot contact.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 contact) (Agent $e0 $x1) (Member $x1 family))    ;; n 2 docs 2  e.g. tierC-000017 tierC-000018

;; ---- slot contact.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 contact) (Theme $e0 corentin_rahier))    ;; n 2 docs 2  e.g. tierC-000017 tierC-000018

;; ---- slot continue.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 continue) (Agent $e0 $x1) (Member $x1 climber))    ;; n 1 docs 1  e.g. tierA-000113
(And (Member $e0 continue) (Agent $e0 $x1) (Member $x1 rescue_team))    ;; n 1 docs 1  e.g. tierA-000102

;; ---- slot continue.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 continue) (Theme $e0 $x1) (Member $x1 north_route))    ;; n 1 docs 1  e.g. tierA-000113
(And (Member $e0 continue) (Theme $e0 $x1) (Member $x1 search))    ;; n 1 docs 1  e.g. tierA-000102

;; ---- slot corruption.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 corruption) (Location $e0 persia))    ;; n 2 docs 2  e.g. tierC-000157 tierC-000158

;; ---- slot cross.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 cross) (Agent $e0 $x1) (Member $x1 automobile))    ;; n 1 docs 1  e.g. tierA-000399
(And (Member $e0 cross) (Agent $e0 $x1) (Member $x1 car))    ;; n 1 docs 1  e.g. tierA-000400

;; ---- slot cross.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 cross) (Theme $e0 $x1) (Member $x1 bridge))    ;; n 2 docs 2  e.g. tierA-000399 tierA-000400

;; ---- slot curse.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 curse) (Agent $e0 $x1) (Member $x1 father))    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot curse.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 curse) (Theme $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot depart.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 depart) (Agent $e0 $x1) (Member $x1 delegation))    ;; n 1 docs 1  e.g. tierA-000244
(And (Member $e0 depart) (Agent $e0 $x1) (Member $x1 soil_sample))    ;; n 1 docs 1  e.g. tierA-000247

;; ---- slot die.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 die) (Location $e0 stockholm))    ;; n 2 docs 2  e.g. tierC-000199 tierC-000200

;; ---- slot discipline.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 discipline) (Location $e0 $x1) (Member $x1 army))    ;; n 2 docs 2  e.g. tierC-000157 tierC-000158

;; ---- slot diverse.Time  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 diverse) (Time $e0 today))    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot double.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 double) (Agent $e0 paul_cavanagh))    ;; n 1 docs 1  e.g. tierC-000055
(And (Member $e0 double) (Agent $e0 paul_paul_cavanagh))    ;; n 1 docs 1  e.g. tierC-000056

;; ---- slot double.Beneficiary  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 double) (Beneficiary $e0 nelson))    ;; n 2 docs 2  e.g. tierC-000055 tierC-000056

;; ---- slot draw.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 draw) (Agent $e0 cowper))    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot draw.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 draw) (Patient $e0 $x1) (Member $x1 pencil_portrait))    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot endorse.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 endorse) (Agent $e0 $x1))    ;; n 2 docs 2  e.g. tierC-000159 tierC-000355

;; ---- slot endorse.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 endorse) (Theme $e0 $x1) (Member $x1 view))    ;; n 2 docs 2  e.g. tierC-000159 tierC-000355

;; ---- slot enter.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 enter) (Agent $e0 lake_sammamish))    ;; n 2 docs 2  e.g. tierC-000063 tierC-000064

;; ---- slot enter.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 enter) (Theme $e0 issaquah_creek))    ;; n 1 docs 1  e.g. tierC-000064
(And (Member $e0 enter) (Theme $e0 $x1) (Member $x1 issaquah_creek_park))    ;; n 1 docs 1  e.g. tierC-000063

;; ---- slot established.Time  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 established) (Time $e0 today))    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot exceed.In  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 exceed) (In $e0 quality))    ;; n 1 docs 1  e.g. tierC-000194
(And (Member $e0 exceed) (In $e0 stability))    ;; n 1 docs 1  e.g. tierC-000194

;; ---- slot exhibit.Manner  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 exhibit) (Manner $e0 widely))    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236

;; ---- slot exhibit.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 exhibit) (Theme $e0 $x1) (Member $x1 work))    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236

;; ---- slot expand.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 expand) (Agent $e0 company))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot extract.Theme  [event center; head role]  n 2  docs<= 4  distinct 3  eventive 0
(And (Member $e0 extract) (Theme $e0 $x1) (Member $x1 liquid))    ;; n 2 (mass 1) docs 2  e.g. tierC-000333 tierC-000334
(And (Member $e0 extract) (Theme $e0 $x1) (Member $x1 immiscible))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000333
(And (Member $e0 extract) (Theme $e0 $x1) (Member $x1 nonmixable))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000334

;; ---- slot finance.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 finance) (Agent $e0 $x1) (Member $x1 government))    ;; n 1 docs 1  e.g. tierC-000246
(And (Member $e0 finance) (Agent $e0 jica))    ;; n 1 docs 1  e.g. tierC-000246

;; ---- slot find.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 find) (Agent $e0 couper))    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244

;; ---- slot find_out.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 find_out) (Agent $e0 $x1) (Member $x1 diver))    ;; n 1 docs 1  e.g. tierA-000134
(And (Member $e0 find_out) (Agent $e0 $x1) (Member $x1 intern))    ;; n 1 docs 1  e.g. tierA-000139

;; ---- slot find_out.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 find_out) (Theme $e0 $x1) (Member $x1 wreck))    ;; n 1 docs 1  e.g. tierA-000134
(And (Member $e0 find_out) (Theme $e0 $x1) (Member $x1 file))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000139
(And (Member $e0 find_out) (Theme $e0 $x1) (Member $x1 missing))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000139

;; ---- slot fix.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 fix) (Agent $e0 $x1) (Member $x1 electrician))    ;; n 1 docs 1  e.g. tierA-000036
(And (Member $e0 fix) (Agent $e0 $x1) (Member $x1 mechanic))    ;; n 1 docs 1  e.g. tierA-000030

;; ---- slot fix.Patient  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 fix) (Patient $e0 $x1) (Member $x1 yard_floodlight))    ;; n 1 docs 1  e.g. tierA-000036
(And (Member $e0 fix) (Patient $e0 $x1) (Member $x1 gearbox))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000030
(And (Member $e0 fix) (Patient $e0 $x1) (Member $x1 seized))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000030

;; ---- slot forbid.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 forbid) (Agent $e0 $x1) (Member $x1 curator))    ;; n 1 docs 1  e.g. tierA-000083
(And (Member $e0 forbid) (Agent $e0 $x1) (Member $x1 warden))    ;; n 1 docs 1  e.g. tierA-000074

;; ---- slot forbid.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 forbid) (Theme $e0 photography))    ;; n 1 docs 1  e.g. tierA-000083
(And (Member $e0 forbid) (Theme $e0 visitor))    ;; n 1 docs 1  e.g. tierA-000074

;; ---- slot go.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 go) (Agent $e0 katherine))    ;; n 2 docs 2  e.g. tierC-000209 tierC-000210

;; ---- slot have.CoAgent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 have) (CoAgent $e0 karen))    ;; n 2 docs 2  e.g. tierC-000181 tierC-000240

;; ---- slot have.In  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 have) (In $e0 fluid_mechanics))    ;; n 2 docs 2  e.g. tierC-000153 tierC-000154

;; ---- slot help.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 help) (Agent $e0 karen))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072

;; ---- slot hold.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hold) (Patient $e0 $x1) (Member $x1 mass_ceremony))    ;; n 1 docs 1  e.g. tierC-000283
(And (Member $e0 hold) (Patient $e0 prayer))    ;; n 1 docs 1  e.g. tierC-000284

;; ---- slot hope.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 hope) (Experiencer $e0 blair))    ;; n 2 docs 2  e.g. tierC-000029 tierC-000030

;; ---- slot hope.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 hope) (Theme $e0 <term:And>))    ;; n 2 docs 2  e.g. tierC-000029 tierC-000030

;; ---- slot illegal.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 illegal) (Experiencer $e0 prostitution))    ;; n 2 docs 2  e.g. tierC-000039 tierC-000040

;; ---- slot illegal.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 illegal) (Location $e0 canada))    ;; n 2 docs 2  e.g. tierC-000039 tierC-000040

;; ---- slot implore.Agent  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 implore) (Agent $e0 celestia))    ;; n 2 docs 1  e.g. tierC-000043

;; ---- slot implore.Recipient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 implore) (Recipient $e0 $x1) (Member $x1 friend))    ;; n 1 docs 1  e.g. tierC-000043
(And (Member $e0 implore) (Recipient $e0 twilight))    ;; n 1 docs 1  e.g. tierC-000043

;; ---- slot implore.Theme  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 implore) (Theme $e0 <term:And>))    ;; n 2 docs 1  e.g. tierC-000043

;; ---- slot include.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 include) (Location $e0 warren_co_metro_area))    ;; n 2 docs 2  e.g. tierC-000189 tierC-000190

;; ---- slot influence.Manner  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 influence) (Manner $e0 direct))    ;; n 2 docs 2  e.g. tierC-000257 tierC-000258

;; ---- slot inherit.Agent  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 inherit) (Agent $e0 islam))    ;; n 1 docs 1  e.g. tierC-000113
(And (Member $e0 inherit) (Agent $e0 $x1) (Member $x1 byzantine))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000114
(And (Member $e0 inherit) (Agent $e0 $x1) (Member $x1 tradition))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000114

;; ---- slot inherit.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 inherit) (Theme $e0 islam))    ;; n 1 docs 1  e.g. tierC-000114
(And (Member $e0 inherit) (Theme $e0 $x1) (Member $x1 byzantine))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000113
(And (Member $e0 inherit) (Theme $e0 $x1) (Member $x1 tradition))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000113

;; ---- slot invite.Agent  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 invite) (Agent $e0 celestia))    ;; n 2 docs 1  e.g. tierC-000044

;; ---- slot invite.Recipient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 invite) (Recipient $e0 $x1) (Member $x1 friend))    ;; n 1 docs 1  e.g. tierC-000044
(And (Member $e0 invite) (Recipient $e0 twilight))    ;; n 1 docs 1  e.g. tierC-000044

;; ---- slot invite.Theme  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 invite) (Theme $e0 <term:And>))    ;; n 2 docs 1  e.g. tierC-000044

;; ---- slot job.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 job) (Location $e0 seychelles))    ;; n 2 docs 2  e.g. tierC-000303 tierC-000304

;; ---- slot join.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 join) (Agent $e0 wyman))    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot join.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 join) (Theme $e0 $x1) (Member $x1 group))    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot kick_the_bucket.Patient  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 kick_the_bucket) (Patient $e0 $x1) (Member $x1 founder))    ;; n 1 docs 1  e.g. tierA-000254
(And (Member $e0 kick_the_bucket) (Patient $e0 $x1) (Member $x1 elm))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000258
(And (Member $e0 kick_the_bucket) (Patient $e0 $x1) (Member $x1 last))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000258

;; ---- slot kidnap.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 kidnap) (Theme $e0 bobby))    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot lead.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 lead) (Experiencer $e0 $x1))    ;; n 2 docs 2  e.g. tierC-000019 tierC-000020

;; ---- slot lead.Goal  [event center; head role]  n 2  docs<= 4  distinct 2  eventive 0
(And (Member $e0 lead) (Goal $e0 $x1) (Member $x1 big))    ;; n 2 (mass 1) docs 2  e.g. tierC-000019 tierC-000020
(And (Member $e0 lead) (Goal $e0 $x1) (Member $x1 cat_fight))    ;; n 2 (mass 1) docs 2  e.g. tierC-000019 tierC-000020

;; ---- slot locate.SouthOf  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 locate) (SouthOf $e0 queens_quay))    ;; n 2 docs 2  e.g. tierC-000003 tierC-000004

;; ---- slot lose.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 lose) (Agent $e0 george_allen))    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162

;; ---- slot lose.Goal  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 lose) (Goal $e0 chuck_robb))    ;; n 1 docs 1  e.g. tierC-000162
(And (Member $e0 lose) (Goal $e0 robb))    ;; n 1 docs 1  e.g. tierC-000161

;; ---- slot lure.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 lure) (Agent $e0 roger))    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot lure.Goal  [event center; head role]  n 2  docs<= 4  distinct 2  eventive 0
(And (Member $e0 lure) (Goal $e0 $x1) (Member $x1 cottage))    ;; n 2 (mass 1) docs 2  e.g. tierC-000269 tierC-000270
(And (Member $e0 lure) (Goal $e0 $x1) (Member $x1 isolated))    ;; n 2 (mass 1) docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot lure.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 lure) (Theme $e0 frankie))    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot marry.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 marry) (Agent $e0 margaret))    ;; n 2 docs 2  e.g. tierC-000075 tierC-000076

;; ---- slot marry.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 marry) (Theme $e0 james))    ;; n 2 docs 2  e.g. tierC-000075 tierC-000076

;; ---- slot mend.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 mend) (Agent $e0 $x1) (Member $x1 electrician))    ;; n 1 docs 1  e.g. tierA-000037
(And (Member $e0 mend) (Agent $e0 $x1) (Member $x1 mechanic))    ;; n 1 docs 1  e.g. tierA-000031

;; ---- slot mend.Patient  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 mend) (Patient $e0 $x1) (Member $x1 yard_floodlight))    ;; n 1 docs 1  e.g. tierA-000037
(And (Member $e0 mend) (Patient $e0 $x1) (Member $x1 gearbox))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000031
(And (Member $e0 mend) (Patient $e0 $x1) (Member $x1 seized))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000031

;; ---- slot move.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 move) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000121 tierC-000122

;; ---- slot move.CoAgent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 move) (CoAgent $e0 $x1) (Member $x1 family))    ;; n 2 docs 2  e.g. tierC-000121 tierC-000122

;; ---- slot move.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 move) (Patient $e0 $x1) (Member $x1 headquarters))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot nation.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 nation) (Experiencer $e0 vanga_kingdom))    ;; n 2 docs 2  e.g. tierC-000299 tierC-000300

;; ---- slot offer.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 offer) (Agent $e0 aslan))    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312

;; ---- slot offer.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 offer) (Theme $e0 <term:And>))    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312

;; ---- slot open.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 open) (Patient $e0 $x1) (Member $x1 law))    ;; n 2 docs 2  e.g. tierC-000285 tierC-000286

;; ---- slot organise.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 organise) (Location $e0 $x1) (Member $x1 village))    ;; n 2 docs 2  e.g. tierC-000133 tierC-000134

;; ---- slot organise.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 organise) (Patient $e0 janmashtmi_festival))    ;; n 2 docs 2  e.g. tierC-000133 tierC-000134

;; ---- slot outperform.In  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 outperform) (In $e0 quality))    ;; n 1 docs 1  e.g. tierC-000193
(And (Member $e0 outperform) (In $e0 stability))    ;; n 1 docs 1  e.g. tierC-000193

;; ---- slot paint.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 paint) (Agent $e0 cowper))    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot paint.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 paint) (Patient $e0 landscape))    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot perform.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 perform) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000127
(And (Member $e0 perform) (Agent $e0 $x1) (Member $x1 sister))    ;; n 1 docs 1  e.g. tierC-000127

;; ---- slot perform.Location  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 perform) (Location $e0 cafe))    ;; n 2 docs 1  e.g. tierC-000127

;; ---- slot play.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 play) (Location $e0 havana))    ;; n 2 docs 2  e.g. tierC-000229 tierC-000230

;; ---- slot preach.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 preach) (Agent $e0 $x1) (Member $x1 man))    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot present.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 present) (Agent $e0 horner))    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012

;; ---- slot present.Recipient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 present) (Recipient $e0 cameron))    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012

;; ---- slot present.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 present) (Theme $e0 $x1) (Member $x1 song))    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012

;; ---- slot print.Manner  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 print) (Manner $e0 commercial))    ;; n 2 docs 2  e.g. tierC-000231 tierC-000232

;; ---- slot print.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 print) (Patient $e0 $x1))    ;; n 2 docs 2  e.g. tierC-000231 tierC-000232

;; ---- slot receive.Manner  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 receive) (Manner $e0 well))    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236

;; ---- slot recreational_sport.Experiencer  [event center; head role]  n 2  docs<= 4  distinct 3  eventive 0
(And (Member $e0 recreational_sport) (Experiencer $e0 $x1) (Member $x1 recreational_sport))    ;; n 2 (mass 1) docs 2  e.g. tierC-000147 tierC-000148
(And (Member $e0 recreational_sport) (Experiencer $e0 $x1) (Member $x1 competitive_activity))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000148
(And (Member $e0 recreational_sport) (Experiencer $e0 $x1) (Member $x1 sporting_activity))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000147

;; ---- slot recreational_sport.Time  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 recreational_sport) (Time $e0 modern_times))    ;; n 2 docs 2  e.g. tierC-000147 tierC-000148

;; ---- slot refer.As  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 refer) (As $e0 pedo_transfer_function))    ;; n 1 docs 1  e.g. tierC-000205
(And (Member $e0 refer) (As $e0 pedotransfer_function))    ;; n 1 docs 1  e.g. tierC-000206

;; ---- slot refer.Location  [event center; head role]  n 2  docs<= 4  distinct 2  eventive 0
(And (Member $e0 refer) (Location $e0 $x1) (Member $x1 context))    ;; n 2 (mass 1) docs 2  e.g. tierC-000205 tierC-000206
(And (Member $e0 refer) (Location $e0 $x1) (Member $x1 non_spatial))    ;; n 2 (mass 1) docs 2  e.g. tierC-000205 tierC-000206

;; ---- slot reflect.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 reflect) (Agent $e0 $x1) (Member $x1 aspect))    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114

;; ---- slot reflect.Theme  [event center; head role]  n 2  docs<= 4  distinct 2  eventive 0
(And (Member $e0 reflect) (Theme $e0 $x1) (Member $x1 byzantine))    ;; n 2 (mass 1) docs 2  e.g. tierC-000113 tierC-000114
(And (Member $e0 reflect) (Theme $e0 $x1) (Member $x1 tradition))    ;; n 2 (mass 1) docs 2  e.g. tierC-000113 tierC-000114

;; ---- slot region.Goal  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 region) (Goal $e0 virginia))    ;; n 2 docs 2  e.g. tierC-000223 tierC-000224

;; ---- slot region.Source  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 region) (Source $e0 new_jersey))    ;; n 2 docs 2  e.g. tierC-000223 tierC-000224

;; ---- slot replace.As  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 replace) (As $e0 scott_wells))    ;; n 2 docs 2  e.g. tierC-000359 tierC-000360

;; ---- slot represent.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 represent) (Agent $e0 eeaa))    ;; n 2 docs 2  e.g. tierC-000007 tierC-000008

;; ---- slot represent.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 represent) (Location $e0 executive_level))    ;; n 1 docs 1  e.g. tierC-000008
(And (Member $e0 represent) (Location $e0 $x1) (Member $x1 executive_level))    ;; n 1 docs 1  e.g. tierC-000007

;; ---- slot represent.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 represent) (Theme $e0 $x1) (Member $x1 central_arm))    ;; n 2 docs 2  e.g. tierC-000007 tierC-000008

;; ---- slot return.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 return) (Agent $e0 glasnow))    ;; n 2 docs 2  e.g. tierC-000255 tierC-000256

;; ---- slot return.Goal  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 return) (Goal $e0 altoona))    ;; n 2 docs 2  e.g. tierC-000255 tierC-000256

;; ---- slot rule.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 rule) (Agent $e0 tipu_sultan))    ;; n 2 docs 2  e.g. tierC-000095 tierC-000096

;; ---- slot rule.Theme  [event center; head role]  n 2  docs<= 4  distinct 2  eventive 0
(And (Member $e0 rule) (Theme $e0 $x1) (Member $x1 house))    ;; n 2 (mass 1) docs 2  e.g. tierC-000095 tierC-000096
(And (Member $e0 rule) (Theme $e0 $x1) (Member $x1 muslim))    ;; n 2 (mass 1) docs 2  e.g. tierC-000095 tierC-000096

;; ---- slot run.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 run) (Agent $e0 george_allen))    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162

;; ---- slot run.For  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 run) (For $e0 $x1) (Member $x1 term))    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162

;; ---- slot save.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 save) (Agent $e0 $x1) (Member $x1 fire))    ;; n 1 docs 1  e.g. tierA-000231
(And (Member $e0 save) (Agent $e0 $x1) (Member $x1 flood))    ;; n 1 docs 1  e.g. tierA-000235

;; ---- slot save.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 save) (Theme $e0 $x1) (Member $x1 archive))    ;; n 1 docs 1  e.g. tierA-000231
(And (Member $e0 save) (Theme $e0 $x1) (Member $x1 footbridge))    ;; n 1 docs 1  e.g. tierA-000235

;; ---- slot seduce.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 seduce) (Agent $e0 emily))    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot seduce.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 seduce) (Location $e0 $x1) (Member $x1 couch))    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot seduce.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 seduce) (Theme $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot select.For  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 select) (For $e0 $e1) (Member $e1 job))    ;; n 2 docs 2  e.g. tierC-000303 tierC-000304

;; ---- slot select.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 select) (Theme $e0 jones))    ;; n 2 docs 2  e.g. tierC-000303 tierC-000304

;; ---- slot sell.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 sell) (Agent $e0 company))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot series.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 series) (Agent $e0 boston_red_sox))    ;; n 1 docs 1  e.g. tierC-000230
(And (Member $e0 series) (Agent $e0 cincinnati_reds))    ;; n 1 docs 1  e.g. tierC-000230

;; ---- slot serve.As  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 serve) (As $e0 $x1) (Member $x1 president))    ;; n 2 docs 2  e.g. tierC-000053 tierC-000054

;; ---- slot shake.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 shake) (Patient $e0 $x1) (Member $x1 solvent))    ;; n 2 docs 2  e.g. tierC-000333 tierC-000334

;; ---- slot ship.Goal  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 ship) (Goal $e0 san_francisco))    ;; n 2 docs 2  e.g. tierC-000203 tierC-000204

;; ---- slot ship.Source  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 ship) (Source $e0 manila))    ;; n 2 docs 2  e.g. tierC-000203 tierC-000204

;; ---- slot ship.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 ship) (Theme $e0 $e1) (Member $e1 barako))    ;; n 2 docs 2  e.g. tierC-000203 tierC-000204

;; ---- slot situate.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 situate) (Location $e0 harju_county))    ;; n 1 docs 1  e.g. tierC-000211
(And (Member $e0 situate) (Location $e0 $x1) (Member $x1 north))    ;; n 1 docs 1  e.g. tierC-000211

;; ---- slot sleep.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 sleep) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot sleep.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 sleep) (Location $e0 $x1) (Member $x1 couch))    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot speak.Manner  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 speak) (Manner $e0 english))    ;; n 1 docs 1  e.g. tierC-000094
(And (Member $e0 speak) (Manner $e0 japanese))    ;; n 1 docs 1  e.g. tierC-000094

;; ---- slot speak.Recipient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 speak) (Recipient $e0 harvey))    ;; n 2 docs 2  e.g. tierC-000023 tierC-000024

;; ---- slot speak.Theme  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 speak) (Theme $e0 ashe))    ;; n 2 docs 1  e.g. tierC-000094

;; ---- slot speaker.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 speaker) (Experiencer $e0 james_david_edgar))    ;; n 1 docs 1  e.g. tierC-000078
(And (Member $e0 speaker) (Experiencer $e0 thomas_bain))    ;; n 1 docs 1  e.g. tierC-000078

;; ---- slot specify.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 specify) (Theme $e0 $x1) (Member $x1 model))    ;; n 2 docs 2  e.g. tierC-000267 tierC-000268

;; ---- slot spend.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 spend) (Agent $e0 $x1) (Member $x1 man))    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot spend.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 spend) (Location $e0 france))    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot spend.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 spend) (Patient $e0 $x1) (Member $x1 exile))    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot spokesman.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 spokesman) (Experiencer $e0 james_david_edgar))    ;; n 1 docs 1  e.g. tierC-000077
(And (Member $e0 spokesman) (Experiencer $e0 thomas_bain))    ;; n 1 docs 1  e.g. tierC-000077

;; ---- slot stab.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 stab) (Agent $e0 $x1) (Member $x1 father))    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot stab.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 stab) (Patient $e0 appius_claudius_crassus))    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot suggest.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 suggest) (Agent $e0 corentin_rahier))    ;; n 1 docs 1  e.g. tierC-000017
(And (Member $e0 suggest) (Agent $e0 muriel_zazoui))    ;; n 1 docs 1  e.g. tierC-000018

;; ---- slot suggest.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 suggest) (Theme $e0 corentin_rahier))    ;; n 1 docs 1  e.g. tierC-000018
(And (Member $e0 suggest) (Theme $e0 muriel_zazoui))    ;; n 1 docs 1  e.g. tierC-000017

;; ---- slot support.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 support) (Agent $e0 $x1))    ;; n 2 docs 2  e.g. tierC-000160 tierC-000356

;; ---- slot support.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 support) (Theme $e0 $x1) (Member $x1 view))    ;; n 2 docs 2  e.g. tierC-000160 tierC-000356

;; ---- slot take.Instrument  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 take) (Instrument $e0 $e1) (Member $e1 help))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072

;; ---- slot take_over.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 take_over) (Agent $e0 watts))    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot take_over.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 take_over) (Theme $e0 $x1) (Member $x1 drum))    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot talk.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 talk) (Agent $e0 katherine))    ;; n 2 docs 2  e.g. tierC-000209 tierC-000210

;; ---- slot tell.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 tell) (Agent $e0 tommy))    ;; n 2 docs 2  e.g. tierC-000035 tierC-000036

;; ---- slot tell.Recipient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 tell) (Recipient $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000035 tierC-000036

;; ---- slot tell.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 tell) (Theme $e0 <term:Question>))    ;; n 2 docs 2  e.g. tierC-000035 tierC-000036

;; ---- slot use.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 use) (Agent $e0 $x1) (Member $x1 localized_version))    ;; n 2 docs 2  e.g. tierC-000173 tierC-000174

;; ---- slot usual.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 usual) (Location $e0 northern_india))    ;; n 1 docs 1  e.g. tierC-000135
(And (Member $e0 usual) (Location $e0 $x1) (Member $x1 part))    ;; n 1 docs 1  e.g. tierC-000135

;; ---- slot voice.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 voice) (Agent $e0 kari_wahlgren))    ;; n 1 docs 1  e.g. tierC-000093
(And (Member $e0 voice) (Agent $e0 mie_sonozaki))    ;; n 1 docs 1  e.g. tierC-000093

;; ---- slot voice.Manner  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 voice) (Manner $e0 english))    ;; n 1 docs 1  e.g. tierC-000093
(And (Member $e0 voice) (Manner $e0 japanese))    ;; n 1 docs 1  e.g. tierC-000093

;; ---- slot voice.Theme  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 voice) (Theme $e0 ashe))    ;; n 2 docs 1  e.g. tierC-000093

;; ---- slot want.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 want) (Experiencer $e0 aslan))    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312

;; ---- slot want.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 want) (Theme $e0 <term:And>))    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312

;; ---- slot welcome.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 welcome) (Agent $e0 $x1) (Member $x1 industrialization))    ;; n 1 docs 1  e.g. tierC-000087
(And (Member $e0 welcome) (Agent $e0 $x1) (Member $x1 whig))    ;; n 1 docs 1  e.g. tierC-000088

;; ---- slot welcome.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 welcome) (Theme $e0 industrialization))    ;; n 1 docs 1  e.g. tierC-000088
(And (Member $e0 welcome) (Theme $e0 $x1) (Member $x1 whig))    ;; n 1 docs 1  e.g. tierC-000087

;; ---- slot widespread.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 widespread) (Experiencer $e0 $x1))    ;; n 2 docs 2  e.g. tierC-000097 tierC-000098

;; ---- slot widespread.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 widespread) (Location $e0 europe))    ;; n 2 docs 2  e.g. tierC-000097 tierC-000098

;; ---- slot nominate.Theme  [event center; head role]  n 2  docs<= 5  distinct 3  eventive 0
(And (Member $e0 nominate) (Theme $e0 $x1) (Member $x1 film))    ;; n 2 (mass 0.833) docs 2  e.g. tierC-000009 tierC-000010
(And (Member $e0 nominate) (Theme $e0 $x1) (Member $x1 syrian))    ;; n 2 (mass 0.833) docs 2  e.g. tierC-000009 tierC-000010
(And (Member $e0 nominate) (Theme $e0 $x1) (Member $x1 destined))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000009

;; ---- slot <unclassed>.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(Location $e0 lake_dianchi)    ;; n 1 docs 1  e.g. tierC-000313

;; ---- slot acquire.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 acquire) (Beneficiary $e0 $x1) (Member $x1 hall))    ;; n 1 docs 1  e.g. tierA-000010

;; ---- slot active.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 active) (Experiencer $e0 asserson))    ;; n 1 docs 1  e.g. tierC-000080

;; ---- slot active.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 active) (Location $e0 church_of_norway))    ;; n 1 docs 1  e.g. tierC-000080

;; ---- slot address.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 address) (Agent $e0 claude_lelouch))    ;; n 1 docs 1  e.g. tierC-000137

;; ---- slot address.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 address) (Patient $e0 $x1))    ;; n 1 docs 1  e.g. tierC-000137

;; ---- slot allow.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 allow) (Location $e0 $x1) (Member $x1 hall))    ;; n 1 docs 1  e.g. tierA-000080

;; ---- slot allow.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 allow) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierA-000075

;; ---- slot arrival.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 arrival) (Instrument $e0 post))    ;; n 1 docs 1  e.g. tierA-000246

;; ---- slot arrival.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 arrival) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierA-000242

;; ---- slot arrive.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 arrive) (Instrument $e0 post))    ;; n 1 docs 1  e.g. tierA-000245

;; ---- slot auditor.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 auditor) (Location $e0 $x1) (Member $x1 ledger))    ;; n 1 docs 1  e.g. tierA-000132

;; ---- slot avoid.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 avoid) (Patient $e0 $x1) (Member $x1 event))    ;; n 1 docs 1  e.g. tierC-000124

;; ---- slot avoid.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 avoid) (Theme $e0 $x1) (Member $x1 bridge))    ;; n 1 docs 1  e.g. tierA-000401

;; ---- slot believe.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 believe) (Experiencer $e0 $x1) (Member $x1 method))    ;; n 1 docs 1  e.g. tierC-000062

;; ---- slot break.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 break) (Agent $e0 $x1) (Member $x1 electrician))    ;; n 1 docs 1  e.g. tierA-000040

;; ---- slot break.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 break) (Patient $e0 $x1) (Member $x1 yard_floodlight))    ;; n 1 docs 1  e.g. tierA-000040

;; ---- slot call_off.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 call_off) (Theme $e0 $x1) (Member $x1 evening_flight))    ;; n 1 docs 1  e.g. tierA-000144

;; ---- slot cease.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 cease) (Patient $e0 $x1) (Member $x1 indigenous))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001
(And (Member $e0 cease) (Patient $e0 $x1) (Member $x1 people))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001

;; ---- slot chapel.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 chapel) (Location $e0 derwent_isle))    ;; n 1 docs 1  e.g. tierC-000116

;; ---- slot common.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 common) (Experiencer $e0 $x1) (Member $x1 common))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000136
(And (Member $e0 common) (Experiencer $e0 $x1) (Member $x1 view))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000136

;; ---- slot competitive_activity.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 competitive_activity) (Experiencer $e0 $x1) (Member $x1 competitive_activity))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000148
(And (Member $e0 competitive_activity) (Experiencer $e0 $x1) (Member $x1 recreational_sport))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000148

;; ---- slot competitive_activity.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 competitive_activity) (Time $e0 modern_times))    ;; n 1 docs 1  e.g. tierC-000148

;; ---- slot compose.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 compose) (Agent $e0 gilles_thibaut))    ;; n 1 docs 1  e.g. tierC-000132

;; ---- slot conduct.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 conduct) (Patient $e0 $x1) (Member $x1 mass_ceremony))    ;; n 1 docs 1  e.g. tierC-000284

;; ---- slot conduct.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 conduct) (Time $e0 that_night))    ;; n 1 docs 1  e.g. tierC-000284

;; ---- slot depart.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 depart) (Instrument $e0 post))    ;; n 1 docs 1  e.g. tierA-000247

;; ---- slot depart.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 depart) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierA-000244

;; ---- slot destined.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 destined) (Goal $e0 oscar))    ;; n 1 docs 1  e.g. tierC-000009

;; ---- slot develop.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 develop) (Agent $e0 bruce_botnick))    ;; n 1 docs 1  e.g. tierC-000349

;; ---- slot develop.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 develop) (Theme $e0 $x1) (Member $x1 session))    ;; n 1 docs 1  e.g. tierC-000349

;; ---- slot die.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 die) (Time $e0 that_autumn))    ;; n 1 docs 1  e.g. tierA-000257

;; ---- slot direct.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 direct) (Goal $e0 oscar))    ;; n 1 docs 1  e.g. tierC-000010

;; ---- slot dissolve.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dissolve) (Agent $e0 $x1) (Member $x1 governor))    ;; n 1 docs 1  e.g. tierC-000099

;; ---- slot dissolve.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dissolve) (Patient $e0 william_ewer))    ;; n 1 docs 1  e.g. tierC-000099

;; ---- slot engineer.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 engineer) (Agent $e0 bruce_botnick))    ;; n 1 docs 1  e.g. tierC-000350

;; ---- slot engineer.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 engineer) (Theme $e0 $x1) (Member $x1 session))    ;; n 1 docs 1  e.g. tierC-000350

;; ---- slot enter.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 enter) (Location $e0 $x1) (Member $x1 park))    ;; n 1 docs 1  e.g. tierC-000064

;; ---- slot establish.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 establish) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000175

;; ---- slot establish.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 establish) (Patient $e0 schererville))    ;; n 1 docs 1  e.g. tierC-000175

;; ---- slot exceed.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 exceed) (Agent $e0 quadratic_placement))    ;; n 1 docs 1  e.g. tierC-000194

;; ---- slot exceed.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 exceed) (Theme $e0 combinatorial_solution))    ;; n 1 docs 1  e.g. tierC-000194

;; ---- slot exceed.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 exceed) (Time $e0 later))    ;; n 1 docs 1  e.g. tierC-000194

;; ---- slot finance.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 finance) (Theme $e0 $x1) (Member $x1 border_section))    ;; n 1 docs 1  e.g. tierC-000246

;; ---- slot find_out.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 find_out) (Experiencer $e0 $x1) (Member $x1 auditor))    ;; n 1 docs 1  e.g. tierA-000129

;; ---- slot find_out.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 find_out) (Location $e0 $x1) (Member $x1 point))    ;; n 1 docs 1  e.g. tierA-000134

;; ---- slot find_out.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 find_out) (Stimulus $e0 $e1) (Member $e1 error))    ;; n 1 docs 1  e.g. tierA-000129

;; ---- slot forbid.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 forbid) (Location $e0 $x1) (Member $x1 hall))    ;; n 1 docs 1  e.g. tierA-000083

;; ---- slot forbid.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 forbid) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierA-000074

;; ---- slot force.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 force) (Agent $e0 jessica))    ;; n 1 docs 1  e.g. tierC-000041

;; ---- slot force.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 force) (Theme $e0 $e1) (Member $e1 sleep))    ;; n 1 docs 1  e.g. tierC-000041

;; ---- slot form.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 form) (Beneficiary $e0 $x1) (Member $x1 band))    ;; n 1 docs 1  e.g. tierC-000179

;; ---- slot found.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 found) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000176

;; ---- slot found.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 found) (Patient $e0 schererville))    ;; n 1 docs 1  e.g. tierC-000176

;; ---- slot french.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 french) (Experiencer $e0 $x1) (Member $x1 indigenous))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001
(And (Member $e0 french) (Experiencer $e0 $x1) (Member $x1 people))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001

;; ---- slot give_on.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 give_on) (Location $e0 japan))    ;; n 1 docs 1  e.g. tierC-000111

;; ---- slot give_on.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 give_on) (Manner $e0 first))    ;; n 1 docs 1  e.g. tierC-000111

;; ---- slot give_up.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 give_up) (Location $e0 japan))    ;; n 1 docs 1  e.g. tierC-000112

;; ---- slot give_up.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 give_up) (Manner $e0 first))    ;; n 1 docs 1  e.g. tierC-000112

;; ---- slot go.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go) (Goal $e0 loren))    ;; n 1 docs 1  e.g. tierC-000210

;; ---- slot hold.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hold) (Time $e0 that_night))    ;; n 1 docs 1  e.g. tierC-000283

;; ---- slot hope.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hope) (Time $e0 next))    ;; n 1 docs 1  e.g. tierC-000030

;; ---- slot house.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 house) (Location $e0 derwent_isle))    ;; n 1 docs 1  e.g. tierC-000116

;; ---- slot ignore.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ignore) (Agent $e0 $x1) (Member $x1 physician))    ;; n 1 docs 1  e.g. tierA-000384

;; ---- slot ignore.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ignore) (Theme $e0 $x1) (Member $x1 sample))    ;; n 1 docs 1  e.g. tierA-000384

;; ---- slot indigenous.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 indigenous) (Experiencer $e0 $x1) (Member $x1 indigenous))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001
(And (Member $e0 indigenous) (Experiencer $e0 $x1) (Member $x1 people))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001

;; ---- slot influence.Source  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 influence) (Source $e0 $x1) (Member $x1 balance))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000258
(And (Member $e0 influence) (Source $e0 $x1) (Member $x1 international))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000258

;; ---- slot kick_the_bucket.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kick_the_bucket) (Time $e0 that_autumn))    ;; n 1 docs 1  e.g. tierA-000258

;; ---- slot lax.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 1
(And (Member $e0 lax) (Experiencer $e0 $e1) (Member $e1 discipline))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000158
(And (Member $e0 lax) (Experiencer $e0 $e1) (Member $e1 lax))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000158

;; ---- slot leave.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 leave) (Agent $e0 $x1) (Member $x1 automobile))    ;; n 1 docs 1  e.g. tierA-000398

;; ---- slot leave.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 leave) (Theme $e0 $x1) (Member $x1 gate))    ;; n 1 docs 1  e.g. tierA-000398

;; ---- slot low.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 low) (Location $e0 $x1) (Member $x1 city))    ;; n 1 docs 1  e.g. tierC-000070

;; ---- slot merge.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 merge) (Agent $e0 jason_suecof))    ;; n 1 docs 1  e.g. tierC-000104

;; ---- slot merge.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 merge) (Patient $e0 $x1) (Member $x1 album))    ;; n 1 docs 1  e.g. tierC-000104

;; ---- slot mix.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mix) (Agent $e0 jason_suecof))    ;; n 1 docs 1  e.g. tierC-000103

;; ---- slot mix.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mix) (Patient $e0 $x1) (Member $x1 album))    ;; n 1 docs 1  e.g. tierC-000103

;; ---- slot oblige.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 oblige) (Agent $e0 jessica))    ;; n 1 docs 1  e.g. tierC-000042

;; ---- slot oblige.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 oblige) (Theme $e0 $e1) (Member $e1 sleep))    ;; n 1 docs 1  e.g. tierC-000042

;; ---- slot outperform.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 outperform) (Agent $e0 quadratic_placement))    ;; n 1 docs 1  e.g. tierC-000193

;; ---- slot outperform.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 outperform) (Theme $e0 combinatorial_solution))    ;; n 1 docs 1  e.g. tierC-000193

;; ---- slot outperform.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 outperform) (Time $e0 later))    ;; n 1 docs 1  e.g. tierC-000193

;; ---- slot permit.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 permit) (Location $e0 $x1) (Member $x1 hall))    ;; n 1 docs 1  e.g. tierA-000081

;; ---- slot permit.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 permit) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierA-000073

;; ---- slot post.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 post) (Location $e0 $x1) (Member $x1 city))    ;; n 1 docs 1  e.g. tierC-000069

;; ---- slot pray.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pray) (Patient $e0 prayer))    ;; n 1 docs 1  e.g. tierC-000283

;; ---- slot prevent.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 prevent) (Agent $e0 $x1) (Member $x1 father))    ;; n 1 docs 1  e.g. tierC-000123

;; ---- slot prevent.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 prevent) (Patient $e0 $x1) (Member $x1 event))    ;; n 1 docs 1  e.g. tierC-000123

;; ---- slot purchase.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 purchase) (Beneficiary $e0 $x1) (Member $x1 hall))    ;; n 1 docs 1  e.g. tierA-000009

;; ---- slot refer.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 refer) (Goal $e0 $x1) (Member $x1 predictive_function))    ;; n 1 docs 1  e.g. tierC-000205

;; ---- slot refer.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 refer) (Theme $e0 $x1) (Member $x1 predictive_function))    ;; n 1 docs 1  e.g. tierC-000206

;; ---- slot remain.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 remain) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000121

;; ---- slot remain.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 remain) (Location $e0 japan))    ;; n 1 docs 1  e.g. tierC-000121

;; ---- slot require.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 require) (Agent $e0 $x1) (Member $x1 recipe))    ;; n 1 docs 1  e.g. tierA-000084

;; ---- slot require.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 require) (Experiencer $e0 $x1) (Member $x1 lathe))    ;; n 1 docs 1  e.g. tierA-000098

;; ---- slot select.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 select) (Beneficiary $e0 morel))    ;; n 1 docs 1  e.g. tierC-000303

;; ---- slot sell.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sell) (Beneficiary $e0 $x1) (Member $x1 hall))    ;; n 1 docs 1  e.g. tierA-000011

;; ---- slot situate.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 situate) (Experiencer $e0 alema_nature_reserve))    ;; n 1 docs 1  e.g. tierC-000211

;; ---- slot sporting_activity.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 sporting_activity) (Experiencer $e0 $x1) (Member $x1 recreational_sport))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000147
(And (Member $e0 sporting_activity) (Experiencer $e0 $x1) (Member $x1 sporting_activity))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000147

;; ---- slot sporting_activity.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sporting_activity) (Time $e0 modern_times))    ;; n 1 docs 1  e.g. tierC-000147

;; ---- slot sprint.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sprint) (Agent $e0 $x1) (Member $x1 shepherd))    ;; n 1 docs 1  e.g. tierA-000175

;; ---- slot sprint.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sprint) (Location $e0 $x1) (Member $x1 ridge))    ;; n 1 docs 1  e.g. tierA-000175

;; ---- slot stage.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stage) (Agent $e0 robert_day))    ;; n 1 docs 1  e.g. tierC-000092

;; ---- slot stage.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stage) (Patient $e0 $x1) (Member $x1 movie))    ;; n 1 docs 1  e.g. tierC-000092

;; ---- slot stay.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stay) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000122

;; ---- slot stay.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stay) (Location $e0 japan))    ;; n 1 docs 1  e.g. tierC-000122

;; ---- slot stroll.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stroll) (Agent $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierA-000184

;; ---- slot stroll.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stroll) (Goal $e0 $x1) (Member $x1 pier))    ;; n 1 docs 1  e.g. tierA-000184

;; ---- slot survive.Agent  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 survive) (Agent $e0 $x1) (Member $x1 elm))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000260
(And (Member $e0 survive) (Agent $e0 $x1) (Member $x1 last))    ;; n 1 (mass 0.5) docs 1  e.g. tierA-000260

;; ---- slot survive.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 survive) (Time $e0 that_autumn))    ;; n 1 docs 1  e.g. tierA-000260

;; ---- slot switch_off.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 switch_off) (Agent $e0 robbie))    ;; n 1 docs 1  e.g. tierC-000316

;; ---- slot switch_off.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 switch_off) (Patient $e0 $x1) (Member $x1 machine))    ;; n 1 docs 1  e.g. tierC-000316

;; ---- slot switch_off.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 switch_off) (Time $e0 later))    ;; n 1 docs 1  e.g. tierC-000316

;; ---- slot take.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 take) (Patient $e0 $e1) (Member $e1 walk))    ;; n 1 docs 1  e.g. tierA-000182

;; ---- slot talk.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 talk) (Recipient $e0 loren))    ;; n 1 docs 1  e.g. tierC-000209

;; ---- slot turn_off.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 turn_off) (Agent $e0 robbie))    ;; n 1 docs 1  e.g. tierC-000315

;; ---- slot turn_off.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 turn_off) (Patient $e0 $x1) (Member $x1 machine))    ;; n 1 docs 1  e.g. tierC-000315

;; ---- slot turn_off.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 turn_off) (Time $e0 later))    ;; n 1 docs 1  e.g. tierC-000315

;; ---- slot usual.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 usual) (Experiencer $e0 $x1) (Member $x1 usual))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000135
(And (Member $e0 usual) (Experiencer $e0 $x1) (Member $x1 view))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000135

;; ---- slot work.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 work) (Beneficiary $e0 morel))    ;; n 1 docs 1  e.g. tierC-000304

;; ---- slot destined.Experiencer  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 destined) (Experiencer $e0 $x1) (Member $x1 destined))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000009
(And (Member $e0 destined) (Experiencer $e0 $x1) (Member $x1 film))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000009
(And (Member $e0 destined) (Experiencer $e0 $x1) (Member $x1 syrian))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000009

;; ---- slot low.Experiencer  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 low) (Experiencer $e0 $x1) (Member $x1 low))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000070
(And (Member $e0 low) (Experiencer $e0 $x1) (Member $x1 reduced))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000070
(And (Member $e0 low) (Experiencer $e0 $x1) (Member $x1 speed_limit))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000070

;; ---- slot post.Theme  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 post) (Theme $e0 $x1) (Member $x1 low))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000069
(And (Member $e0 post) (Theme $e0 $x1) (Member $x1 reduced))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000069
(And (Member $e0 post) (Theme $e0 $x1) (Member $x1 speed_limit))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000069

;; ==================== other slots (582): entity centers + event centers under non-role heads ====================

;; ---- slot <unclassed>.GroupOf  [entity center; head other]  n 98  docs<= 96  distinct 39  eventive 0
(GroupOf $x0 child)    ;; n 17 docs 17  e.g. tierA-000181 tierA-000182
(GroupOf $x0 forklift)    ;; n 7 docs 7  e.g. tierA-000001 tierA-000002
(GroupOf $x0 climber)    ;; n 5 docs 5  e.g. tierA-000109 tierA-000110
(GroupOf $x0 egg)    ;; n 5 docs 5  e.g. tierA-000084 tierA-000085
(GroupOf $x0 sample)    ;; n 5 docs 5  e.g. tierA-000380 tierA-000381
(GroupOf $x0 person)    ;; n 4 docs 2  e.g. tierC-000353 tierC-000354
(GroupOf $x0 soil_sample)    ;; n 4 docs 4  e.g. tierA-000245 tierA-000246
(GroupOf $x0 admirer)    ;; n 2 docs 2  e.g. tierC-000065 tierC-000066
(GroupOf $x0 automobile)    ;; n 2 docs 2  e.g. tierA-000394 tierA-000397
(GroupOf $x0 city)    ;; n 2 docs 2  e.g. tierC-000069 tierC-000070
(GroupOf $x0 district)    ;; n 2 docs 2  e.g. tierC-000191 tierC-000192
(GroupOf $x0 european_american_settler)    ;; n 2 docs 2  e.g. tierC-000025 tierC-000026
(GroupOf $x0 friend)    ;; n 2 docs 2  e.g. tierC-000043 tierC-000044
(GroupOf $x0 hill)    ;; n 2 docs 2  e.g. tierC-000343 tierC-000344
(GroupOf $x0 illustration)    ;; n 2 docs 2  e.g. tierC-000231 tierC-000232
(GroupOf $x0 indonesian_immigrant)    ;; n 2 docs 2  e.g. tierC-000351 tierC-000352
(GroupOf $x0 law)    ;; n 2 docs 2  e.g. tierC-000285 tierC-000286
(GroupOf $x0 localized_version)    ;; n 2 docs 2  e.g. tierC-000173 tierC-000174
(GroupOf $x0 nephew)    ;; n 2 docs 2  e.g. tierC-000139 tierC-000140
(GroupOf $x0 pacificat)    ;; n 2 docs 2  e.g. tierC-000183 tierC-000184
(GroupOf $x0 predictive_function)    ;; n 2 docs 2  e.g. tierC-000205 tierC-000206
(GroupOf $x0 session)    ;; n 2 docs 2  e.g. tierC-000349 tierC-000350
(GroupOf $x0 sister)    ;; n 2 docs 2  e.g. tierC-000127 tierC-000128
(GroupOf $x0 start)    ;; n 2 docs 2  e.g. tierC-000255 tierC-000256
(GroupOf $x0 tradition)    ;; n 2 docs 2  e.g. tierC-000117 tierC-000118
(GroupOf $x0 whig)    ;; n 2 docs 2  e.g. tierC-000087 tierC-000088
(GroupOf $x0 activity)    ;; n 1 docs 1  e.g. tierC-000040
(GroupOf $x0 countersignature)    ;; n 1 docs 1  e.g. tierA-000092
(GroupOf $x0 department)    ;; n 1 docs 1  e.g. tierC-000106
(GroupOf $x0 division)    ;; n 1 docs 1  e.g. tierC-000105
(GroupOf $x0 indigenous_american)    ;; n 1 docs 1  e.g. tierC-000025
(GroupOf $x0 ladder)    ;; n 1 docs 1  e.g. tierA-000299
(GroupOf $x0 medal)    ;; n 1 docs 1  e.g. tierA-000280
(GroupOf $x0 native_american)    ;; n 1 docs 1  e.g. tierC-000026
(GroupOf $x0 painting)    ;; n 1 docs 1  e.g. tierA-000310
(GroupOf $x0 people)    ;; n 1 docs 1  e.g. tierC-000002
(GroupOf $x0 projector)    ;; n 1 docs 1  e.g. tierA-000013
(GroupOf $x0 traditional_chinese_drama)    ;; n 1 docs 1  e.g. tierC-000014
(GroupOf $x0 whistle)    ;; n 1 docs 1  e.g. tierA-000265

;; ---- slot <unclassed>.Cardinality  [entity center; head other]  n 47  docs<= 45  distinct 1  eventive 0
(Cardinality $x0 <num>)    ;; n 47 docs 45  e.g. tierA-000001 tierA-000002

;; ---- slot person.Member  [entity center; head other]  n 37  docs<= 37  distinct 1  eventive 0
(Member $x0 person)    ;; n 37 docs 37  e.g. tierC-000013 tierC-000014

;; ---- slot <unclassed>.Possession  [entity center; head other]  n 18  docs<= 24  distinct 11  eventive 0
(And (Possession $x0 $x1) (Member $x1 person))    ;; n 5 docs 5  e.g. tierC-000066 tierC-000127
(Possession $x0 dora_smith)    ;; n 2 docs 2  e.g. tierC-000289 tierC-000290
(Possession $x0 gil_aires)    ;; n 2 docs 2  e.g. tierC-000357 tierC-000358
(Possession $x0 leonor_rodrigues)    ;; n 2 docs 2  e.g. tierC-000357 tierC-000358
(Possession $x0 subsequent_game)    ;; n 2 docs 2  e.g. tierC-000173 tierC-000174
(Possession $x0 twilight)    ;; n 2 docs 2  e.g. tierC-000043 tierC-000044
(Possession $x0 j_augustus_knapp)    ;; n 1 docs 1  e.g. tierC-000232
(And (Possession $x0 $x1) (Member $x1 community))    ;; n 2 (mass 0.5) docs 2  e.g. tierC-000117 tierC-000118
(And (Possession $x0 $x1) (Member $x1 neighbouring))    ;; n 2 (mass 0.5) docs 2  e.g. tierC-000117 tierC-000118
(And (Possession $x0 $x1) (Member $x1 other))    ;; n 2 (mass 0.5) docs 2  e.g. tierC-000117 tierC-000118
(And (Possession $x0 $x1) (Member $x1 sunni))    ;; n 2 (mass 0.5) docs 2  e.g. tierC-000117 tierC-000118

;; ---- slot work.Member  [event center; head other]  n 17  docs<= 13  distinct 1  eventive 0
(Member $e0 work)    ;; n 17 docs 13  e.g. tierA-000311 tierA-000312

;; ---- slot big.Member  [entity center; head other]  n 14  docs<= 14  distinct 7  eventive 0
(Member $x0 big)    ;; n 7 docs 7  e.g. tierA-000328 tierA-000332
(And (Member $x0 big) (Member $x0 cat_fight))    ;; n 2 docs 2  e.g. tierC-000019 tierC-000020
(And (Member $x0 big) (Member $x0 boiler))    ;; n 1 docs 1  e.g. tierA-000340
(And (Member $x0 big) (Member $x0 crate))    ;; n 1 docs 1  e.g. tierA-000328
(And (Member $x0 big) (Member $x0 hatch))    ;; n 1 docs 1  e.g. tierA-000332
(And (Member $x0 big) (Member $x0 skylight))    ;; n 1 docs 1  e.g. tierA-000344
(And (Member $x0 big) (Member $x0 spoil_mound))    ;; n 1 docs 1  e.g. tierA-000348

;; ---- slot build.Member  [event center; head other]  n 14  docs<= 10  distinct 1  eventive 0
(Member $e0 build)    ;; n 14 docs 10  e.g. tierC-000045 tierC-000046

;; ---- slot buy.Member  [event center; head other]  n 14  docs<= 14  distinct 1  eventive 0
(Member $e0 buy)    ;; n 14 docs 14  e.g. tierA-000001 tierA-000005

;; ---- slot bench.Member  [entity center; head other]  n 13  docs<= 13  distinct 5  eventive 0
(Member $x0 bench)    ;; n 6 docs 6  e.g. tierA-000335 tierA-000336
(And (Member $x0 bench) (Member $x0 new))    ;; n 4 docs 4  e.g. tierA-000335 tierA-000336
(And (Member $x0 bench) (Member $x0 big))    ;; n 1 docs 1  e.g. tierA-000336
(And (Member $x0 bench) (Member $x0 large))    ;; n 1 docs 1  e.g. tierA-000335
(And (Member $x0 bench) (Member $x0 small))    ;; n 1 docs 1  e.g. tierA-000338

;; ---- slot crate.Member  [entity center; head other]  n 12  docs<= 12  distinct 3  eventive 0
(Member $x0 crate)    ;; n 9 docs 9  e.g. tierA-000015 tierA-000016
(And (Member $x0 crate) (Member $x0 large))    ;; n 2 docs 2  e.g. tierA-000327 tierA-000330
(And (Member $x0 crate) (Member $x0 small))    ;; n 1 docs 1  e.g. tierA-000329

;; ---- slot depot.Member  [entity center; head other]  n 12  docs<= 12  distinct 1  eventive 0
(Member $x0 depot)    ;; n 12 docs 12  e.g. tierA-000001 tierA-000002

;; ---- slot discover.Member  [event center; head other]  n 12  docs<= 12  distinct 1  eventive 0
(Member $e0 discover)    ;; n 12 docs 12  e.g. tierA-000128 tierA-000130

;; ---- slot give.Member  [event center; head other]  n 12  docs<= 12  distinct 1  eventive 0
(Member $e0 give)    ;; n 12 docs 12  e.g. tierA-000208 tierA-000213

;; ---- slot physician.Member  [entity center; head other]  n 12  docs<= 12  distinct 1  eventive 0
(Member $x0 physician)    ;; n 12 docs 12  e.g. tierA-000375 tierA-000377

;; ---- slot begin.Member  [event center; head other]  n 11  docs<= 9  distinct 1  eventive 0
(Member $e0 begin)    ;; n 11 docs 9  e.g. tierA-000052 tierA-000055

;; ---- slot board.Member  [entity center; head other]  n 11  docs<= 11  distinct 1  eventive 0
(Member $x0 board)    ;; n 11 docs 11  e.g. tierA-000114 tierA-000115

;; ---- slot decide.Member  [event center; head other]  n 11  docs<= 11  distinct 1  eventive 0
(Member $e0 decide)    ;; n 11 docs 11  e.g. tierA-000185 tierA-000189

;; ---- slot destroy.Member  [event center; head other]  n 11  docs<= 11  distinct 1  eventive 0
(Member $e0 destroy)    ;; n 11 docs 11  e.g. tierA-000222 tierA-000223

;; ---- slot hall.Member  [entity center; head other]  n 11  docs<= 11  distinct 1  eventive 0
(Member $x0 hall)    ;; n 11 docs 11  e.g. tierA-000008 tierA-000009

;; ---- slot school.Member  [entity center; head other]  n 11  docs<= 11  distinct 1  eventive 0
(Member $x0 school)    ;; n 11 docs 11  e.g. tierA-000008 tierA-000009

;; ---- slot answer.Member  [event center; head other]  n 10  docs<= 10  distinct 1  eventive 0
(Member $e0 answer)    ;; n 10 docs 10  e.g. tierA-000207 tierA-000209

;; ---- slot file.Member  [entity center; head other]  n 10  docs<= 10  distinct 2  eventive 0
(Member $x0 file)    ;; n 5 docs 5  e.g. tierA-000138 tierA-000139
(And (Member $x0 file) (Member $x0 missing))    ;; n 5 docs 5  e.g. tierA-000138 tierA-000139

;; ---- slot gearbox.Member  [entity center; head other]  n 10  docs<= 10  distinct 2  eventive 0
(Member $x0 gearbox)    ;; n 5 docs 5  e.g. tierA-000029 tierA-000030
(And (Member $x0 gearbox) (Member $x0 seized))    ;; n 5 docs 5  e.g. tierA-000029 tierA-000030

;; ---- slot lend.Member  [event center; head other]  n 10  docs<= 10  distinct 1  eventive 0
(Member $e0 lend)    ;; n 10 docs 10  e.g. tierA-000296 tierA-000298

;; ---- slot require.Member  [event center; head other]  n 10  docs<= 10  distinct 1  eventive 0
(Member $e0 require)    ;; n 10 docs 10  e.g. tierA-000084 tierA-000086

;; ---- slot teach.Member  [event center; head other]  n 10  docs<= 10  distinct 1  eventive 0
(Member $e0 teach)    ;; n 10 docs 10  e.g. tierA-000281 tierA-000283

;; ---- slot cancel.Member  [event center; head other]  n 9  docs<= 9  distinct 1  eventive 0
(Member $e0 cancel)    ;; n 9 docs 9  e.g. tierA-000143 tierA-000145

;; ---- slot ledger.Member  [entity center; head other]  n 9  docs<= 9  distinct 1  eventive 0
(Member $x0 ledger)    ;; n 9 docs 9  e.g. tierA-000128 tierA-000129

;; ---- slot abandon.Member  [event center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $e0 abandon)    ;; n 8 docs 8  e.g. tierA-000099 tierA-000101

;; ---- slot appear.Member  [event center; head other]  n 8  docs<= 5  distinct 1  eventive 0
(Member $e0 appear)    ;; n 8 docs 5  e.g. tierC-000049 tierC-000050

;; ---- slot automobile.Member  [entity center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $x0 automobile)    ;; n 8 docs 8  e.g. tierA-000390 tierA-000392

;; ---- slot crew.Member  [entity center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $x0 crew)    ;; n 8 docs 8  e.g. tierA-000049 tierA-000050

;; ---- slot decision.Member  [event center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $e0 decision)    ;; n 8 docs 8  e.g. tierA-000186 tierA-000187

;; ---- slot elm.Member  [entity center; head other]  n 8  docs<= 8  distinct 2  eventive 0
(Member $x0 elm)    ;; n 4 docs 4  e.g. tierA-000257 tierA-000258
(And (Member $x0 elm) (Member $x0 last))    ;; n 4 docs 4  e.g. tierA-000257 tierA-000258

;; ---- slot family.Member  [entity center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $x0 family)    ;; n 8 docs 8  e.g. tierA-000196 tierA-000197

;; ---- slot have.Member  [event center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $e0 have)    ;; n 8 docs 8  e.g. tierC-000153 tierC-000154

;; ---- slot include.Member  [event center; head other]  n 8  docs<= 4  distinct 1  eventive 0
(Member $e0 include)    ;; n 8 docs 4  e.g. tierC-000139 tierC-000140

;; ---- slot market.Member  [event center; head other]  n 8  docs<= 6  distinct 3  eventive 0
(Member $e0 market)    ;; n 3 docs 2  e.g. tierC-000321 tierC-000322
(And (Member $e0 market) (Member $e0 russian))    ;; n 3 docs 2  e.g. tierC-000321 tierC-000322
(And (Member $e0 market) (Member $e0 similar))    ;; n 2 docs 2  e.g. tierC-000321 tierC-000322

;; ---- slot new.Member  [entity center; head other]  n 8  docs<= 8  distinct 2  eventive 0
(Member $x0 new)    ;; n 4 docs 4  e.g. tierA-000185 tierA-000186
(And (Member $x0 new) (Member $x0 roof))    ;; n 4 docs 4  e.g. tierA-000185 tierA-000186

;; ---- slot produce.Member  [event center; head other]  n 8  docs<= 6  distinct 1  eventive 0
(Member $e0 produce)    ;; n 8 docs 6  e.g. tierC-000009 tierC-000010

;; ---- slot reject.Member  [event center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $e0 reject)    ;; n 8 docs 8  e.g. tierA-000158 tierA-000160

;; ---- slot repair.Member  [event center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $e0 repair)    ;; n 8 docs 8  e.g. tierA-000029 tierA-000032

;; ---- slot serve.Member  [event center; head other]  n 8  docs<= 4  distinct 1  eventive 0
(Member $e0 serve)    ;; n 8 docs 4  e.g. tierC-000053 tierC-000054

;; ---- slot sing.Member  [event center; head other]  n 8  docs<= 4  distinct 1  eventive 0
(Member $e0 sing)    ;; n 8 docs 4  e.g. tierC-000127 tierC-000128

;; ---- slot song.Member  [entity center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $x0 song)    ;; n 8 docs 8  e.g. tierA-000291 tierA-000292

;; ---- slot view.Possession  [entity center; head other]  n 8  docs<= 8  distinct 2  eventive 0
(And (Member $x0 view) (Possession $x0 free_soil_party))    ;; n 4 docs 4  e.g. tierC-000159 tierC-000160
(And (Member $x0 view) (Possession $x0 republican_party))    ;; n 4 docs 4  e.g. tierC-000159 tierC-000160

;; ---- slot walk.Member  [event center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $e0 walk)    ;; n 8 docs 8  e.g. tierA-000173 tierA-000174

;; ---- slot be.Member  [event center; head other]  n 7  docs<= 5  distinct 1  eventive 0
(Member $e0 be)    ;; n 7 docs 5  e.g. tierC-000126 tierC-000212

;; ---- slot calibration.Member  [entity center; head other]  n 7  docs<= 7  distinct 3  eventive 0
(Member $x0 calibration)    ;; n 4 docs 4  e.g. tierA-000355 tierA-000356
(And (Member $x0 calibration) (Member $x0 difficult))    ;; n 2 docs 2  e.g. tierA-000355 tierA-000357
(And (Member $x0 calibration) (Member $x0 hard))    ;; n 1 docs 1  e.g. tierA-000356

;; ---- slot chef.Member  [entity center; head other]  n 7  docs<= 7  distinct 1  eventive 0
(Member $x0 chef)    ;; n 7 docs 7  e.g. tierA-000015 tierA-000016

;; ---- slot courier.Member  [entity center; head other]  n 7  docs<= 7  distinct 3  eventive 0
(Member $x0 courier)    ;; n 4 docs 4  e.g. tierA-000367 tierA-000368
(And (Member $x0 courier) (Member $x0 exhausted))    ;; n 2 docs 2  e.g. tierA-000367 tierA-000369
(And (Member $x0 courier) (Member $x0 tired))    ;; n 1 docs 1  e.g. tierA-000368

;; ---- slot descent.Member  [entity center; head other]  n 7  docs<= 7  distinct 4  eventive 0
(Member $x0 descent)    ;; n 4 docs 4  e.g. tierA-000359 tierA-000360
(And (Member $x0 descent) (Member $x0 difficult))    ;; n 1 docs 1  e.g. tierA-000359
(And (Member $x0 descent) (Member $x0 easy))    ;; n 1 docs 1  e.g. tierA-000362
(And (Member $x0 descent) (Member $x0 hard))    ;; n 1 docs 1  e.g. tierA-000360

;; ---- slot house.Member  [entity center; head other]  n 7  docs<= 7  distinct 4  eventive 0
(Member $x0 house)    ;; n 3 docs 3  e.g. tierC-000095 tierC-000096
(And (Member $x0 house) (Member $x0 muslim))    ;; n 2 docs 2  e.g. tierC-000095 tierC-000096
(And (Member $x0 house) (Member $x0 large))    ;; n 1 docs 1  e.g. tierC-000115
(And (Member $x0 house) (Member $x0 listed_building))    ;; n 1 docs 1  e.g. tierC-000115

;; ---- slot kiln.Member  [entity center; head other]  n 7  docs<= 7  distinct 1  eventive 0
(Member $x0 kiln)    ;; n 7 docs 7  e.g. tierA-000022 tierA-000023

;; ---- slot locate.Member  [event center; head other]  n 7  docs<= 7  distinct 1  eventive 0
(Member $e0 locate)    ;; n 7 docs 7  e.g. tierC-000003 tierC-000004

;; ---- slot postpone.Member  [event center; head other]  n 7  docs<= 7  distinct 1  eventive 0
(Member $e0 postpone)    ;; n 7 docs 7  e.g. tierA-000114 tierA-000116

;; ---- slot pottery_studio.Member  [entity center; head other]  n 7  docs<= 7  distinct 1  eventive 0
(Member $x0 pottery_studio)    ;; n 7 docs 7  e.g. tierA-000022 tierA-000023

;; ---- slot start.Member  [event center; head other]  n 7  docs<= 6  distinct 1  eventive 0
(Member $e0 start)    ;; n 7 docs 6  e.g. tierA-000053 tierA-000058

;; ---- slot arrive.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 arrive)    ;; n 6 docs 6  e.g. tierA-000237 tierA-000238

;; ---- slot artist.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 artist)    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236
(And (Member $x0 artist) (Member $x0 official))    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236
(And (Member $x0 artist) (Member $x0 soviet))    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236

;; ---- slot become.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 become)    ;; n 6 docs 6  e.g. tierC-000001 tierC-000158

;; ---- slot black_hard.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 black_hard)    ;; n 2 docs 2  e.g. tierC-000265 tierC-000266
(And (Member $x0 black_hard) (Member $x0 dense))    ;; n 2 docs 2  e.g. tierC-000265 tierC-000266
(And (Member $x0 black_hard) (Member $x0 purple))    ;; n 2 docs 2  e.g. tierC-000265 tierC-000266

;; ---- slot boiler.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 boiler)    ;; n 3 docs 3  e.g. tierA-000339 tierA-000341
(And (Member $x0 boiler) (Member $x0 huge))    ;; n 2 docs 2  e.g. tierA-000339 tierA-000342
(And (Member $x0 boiler) (Member $x0 tiny))    ;; n 1 docs 1  e.g. tierA-000341

;; ---- slot bridge.Member  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $x0 bridge)    ;; n 6 docs 6  e.g. tierA-000399 tierA-000400

;; ---- slot budget.Member  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $x0 budget)    ;; n 6 docs 6  e.g. tierA-000201 tierA-000202

;; ---- slot budget.Possession  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(And (Member $x0 budget) (Possession $x0 next_year))    ;; n 6 docs 6  e.g. tierA-000201 tierA-000202

;; ---- slot case.Member  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $x0 case)    ;; n 6 docs 6  e.g. tierA-000190 tierA-000191

;; ---- slot clear.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 clear)    ;; n 2 docs 2  e.g. tierC-000221 tierC-000222
(And (Member $x0 clear) (Member $x0 distinction))    ;; n 2 docs 2  e.g. tierC-000221 tierC-000222
(And (Member $x0 clear) (Member $x0 important))    ;; n 2 docs 2  e.g. tierC-000221 tierC-000222

;; ---- slot constant.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 constant)    ;; n 2 docs 2  e.g. tierC-000153 tierC-000154
(And (Member $x0 constant) (Member $x0 entropy))    ;; n 2 docs 2  e.g. tierC-000153 tierC-000154
(And (Member $x0 constant) (Member $x0 uniform))    ;; n 2 docs 2  e.g. tierC-000153 tierC-000154

;; ---- slot cracked.Member  [entity center; head other]  n 6  docs<= 6  distinct 2  eventive 0
(Member $x0 cracked)    ;; n 3 docs 3  e.g. tierA-000049 tierA-000050
(And (Member $x0 cracked) (Member $x0 feed_pipe))    ;; n 3 docs 3  e.g. tierA-000049 tierA-000050

;; ---- slot crate.GroupOf  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(And (Member $x0 crate) (GroupOf $x0 lemon))    ;; n 6 docs 6  e.g. tierA-000015 tierA-000016

;; ---- slot design.Member  [event center; head other]  n 6  docs<= 4  distinct 1  eventive 0
(Member $e0 design)    ;; n 6 docs 4  e.g. tierC-000119 tierC-000120

;; ---- slot desired.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 desired)    ;; n 2 docs 2  e.g. tierC-000073 tierC-000074
(And (Member $x0 desired) (Member $x0 plasmid))    ;; n 2 docs 2  e.g. tierC-000073 tierC-000074
(And (Member $x0 desired) (Member $x0 white))    ;; n 2 docs 2  e.g. tierC-000073 tierC-000074

;; ---- slot diverse.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 diverse)    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288
(And (Member $x0 diverse) (Member $x0 established))    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288
(And (Member $x0 diverse) (Member $x0 genre))    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot electrician.Member  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $x0 electrician)    ;; n 6 docs 6  e.g. tierA-000035 tierA-000036

;; ---- slot find.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 find)    ;; n 6 docs 6  e.g. tierC-000243 tierC-000244

;; ---- slot huge.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 huge)    ;; n 3 docs 3  e.g. tierA-000343 tierA-000345
(And (Member $x0 huge) (Member $x0 skylight))    ;; n 2 docs 2  e.g. tierA-000343 tierA-000345
(And (Member $x0 huge) (Member $x0 spoil_mound))    ;; n 1 docs 1  e.g. tierA-000347

;; ---- slot judge.Member  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $x0 judge)    ;; n 6 docs 6  e.g. tierA-000190 tierA-000191

;; ---- slot low.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 low)    ;; n 2 docs 2  e.g. tierC-000069 tierC-000070
(And (Member $x0 low) (Member $x0 reduced))    ;; n 2 docs 2  e.g. tierC-000069 tierC-000070
(And (Member $x0 low) (Member $x0 speed_limit))    ;; n 2 docs 2  e.g. tierC-000069 tierC-000070

;; ---- slot mechanic.Member  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $x0 mechanic)    ;; n 6 docs 6  e.g. tierA-000029 tierA-000030

;; ---- slot moist.Member  [entity center; head other]  n 6  docs<= 6  distinct 4  eventive 0
(Member $x0 moist)    ;; n 2 docs 2  e.g. tierC-000339 tierC-000340
(And (Member $x0 moist) (Member $x0 plantation))    ;; n 2 docs 2  e.g. tierC-000339 tierC-000340
(And (Member $x0 moist) (Member $x0 natural_forest))    ;; n 1 docs 1  e.g. tierC-000339
(And (Member $x0 moist) (Member $x0 natural_lowland_forest))    ;; n 1 docs 1  e.g. tierC-000340

;; ---- slot neighbouring.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 neighbouring)    ;; n 2 docs 2  e.g. tierC-000117 tierC-000118
(And (Member $x0 neighbouring) (Member $x0 other))    ;; n 2 docs 2  e.g. tierC-000117 tierC-000118
(And (Member $x0 neighbouring) (Member $x0 sunni))    ;; n 2 docs 2  e.g. tierC-000117 tierC-000118

;; ---- slot portray.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 portray)    ;; n 6 docs 6  e.g. tierC-000247 tierC-000248

;; ---- slot sell.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 sell)    ;; n 6 docs 6  e.g. tierA-000004 tierA-000011

;; ---- slot use.Member  [event center; head other]  n 6  docs<= 4  distinct 1  eventive 0
(Member $e0 use)    ;; n 6 docs 4  e.g. tierC-000005 tierC-000006

;; ---- slot write.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 write)    ;; n 6 docs 6  e.g. tierC-000089 tierC-000090

;; ---- slot yard_floodlight.Member  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $x0 yard_floodlight)    ;; n 6 docs 6  e.g. tierA-000035 tierA-000036

;; ---- slot afternoon_session.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 afternoon_session)    ;; n 5 docs 5  e.g. tierA-000153 tierA-000154

;; ---- slot airline.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 airline)    ;; n 5 docs 5  e.g. tierA-000143 tierA-000144

;; ---- slot apple_harvest.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 apple_harvest)    ;; n 5 docs 5  e.g. tierA-000067 tierA-000068

;; ---- slot apprentice.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 apprentice)    ;; n 5 docs 5  e.g. tierA-000281 tierA-000282

;; ---- slot archive.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 archive)    ;; n 5 docs 5  e.g. tierA-000227 tierA-000228

;; ---- slot bank.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 bank)    ;; n 5 docs 5  e.g. tierA-000163 tierA-000164

;; ---- slot borrow.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 borrow)    ;; n 5 docs 5  e.g. tierA-000297 tierA-000302

;; ---- slot caller.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 caller)    ;; n 5 docs 5  e.g. tierA-000217 tierA-000218

;; ---- slot chart.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 chart)    ;; n 5 docs 5  e.g. tierA-000375 tierA-000376

;; ---- slot clerk.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 clerk)    ;; n 5 docs 5  e.g. tierA-000207 tierA-000208

;; ---- slot club.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 club)    ;; n 5 docs 5  e.g. tierA-000123 tierA-000124

;; ---- slot committee.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 committee)    ;; n 5 docs 5  e.g. tierA-000185 tierA-000186

;; ---- slot council.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 council)    ;; n 5 docs 5  e.g. tierA-000148 tierA-000149

;; ---- slot die.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 die)    ;; n 5 docs 5  e.g. tierA-000253 tierA-000255

;; ---- slot direct.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 direct)    ;; n 5 docs 5  e.g. tierC-000010 tierC-000091

;; ---- slot diver.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 diver)    ;; n 5 docs 5  e.g. tierA-000133 tierA-000134

;; ---- slot dress_rehearsal.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 dress_rehearsal)    ;; n 5 docs 5  e.g. tierA-000062 tierA-000063

;; ---- slot editor.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 editor)    ;; n 5 docs 5  e.g. tierA-000158 tierA-000159

;; ---- slot evening_flight.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 evening_flight)    ;; n 5 docs 5  e.g. tierA-000143 tierA-000144

;; ---- slot fire.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 fire)    ;; n 5 docs 5  e.g. tierA-000227 tierA-000228

;; ---- slot firm.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 firm)    ;; n 5 docs 5  e.g. tierA-000104 tierA-000105

;; ---- slot flood.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 flood)    ;; n 5 docs 5  e.g. tierA-000232 tierA-000233

;; ---- slot footbridge.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 footbridge)    ;; n 5 docs 5  e.g. tierA-000232 tierA-000233

;; ---- slot gallery.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 gallery)    ;; n 5 docs 5  e.g. tierA-000306 tierA-000307

;; ---- slot generator.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 generator)    ;; n 5 docs 5  e.g. tierA-000301 tierA-000302

;; ---- slot greenhouse.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 greenhouse)    ;; n 5 docs 5  e.g. tierA-000222 tierA-000223

;; ---- slot hatch.Member  [entity center; head other]  n 5  docs<= 5  distinct 2  eventive 0
(Member $x0 hatch)    ;; n 3 docs 3  e.g. tierA-000331 tierA-000333
(And (Member $x0 hatch) (Member $x0 large))    ;; n 2 docs 2  e.g. tierA-000331 tierA-000333

;; ---- slot intern.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 intern)    ;; n 5 docs 5  e.g. tierA-000138 tierA-000139

;; ---- slot lane.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 lane)    ;; n 5 docs 5  e.g. tierA-000390 tierA-000391

;; ---- slot lathe.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 lathe)    ;; n 5 docs 5  e.g. tierA-000094 tierA-000095

;; ---- slot library.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 library)    ;; n 5 docs 5  e.g. tierA-000266 tierA-000267

;; ---- slot loan_application.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 loan_application)    ;; n 5 docs 5  e.g. tierA-000163 tierA-000164

;; ---- slot lunch.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 lunch)    ;; n 5 docs 5  e.g. tierA-000062 tierA-000063

;; ---- slot manifest.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 manifest)    ;; n 5 docs 5  e.g. tierA-000271 tierA-000272

;; ---- slot manuscript.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 manuscript)    ;; n 5 docs 5  e.g. tierA-000158 tierA-000159

;; ---- slot museum.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 museum)    ;; n 5 docs 5  e.g. tierA-000306 tierA-000307

;; ---- slot neighbour.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 neighbour)    ;; n 5 docs 5  e.g. tierA-000296 tierA-000297

;; ---- slot north_route.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 north_route)    ;; n 5 docs 5  e.g. tierA-000109 tierA-000110

;; ---- slot panel.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 panel)    ;; n 5 docs 5  e.g. tierA-000168 tierA-000169

;; ---- slot permit.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 permit)    ;; n 5 docs 5  e.g. tierA-000089 tierA-000090

;; ---- slot pilot.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 pilot)    ;; n 5 docs 5  e.g. tierA-000212 tierA-000213

;; ---- slot point.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 point)    ;; n 5 docs 5  e.g. tierA-000133 tierA-000134

;; ---- slot potter.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 potter)    ;; n 5 docs 5  e.g. tierA-000281 tierA-000282

;; ---- slot projector.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 projector)    ;; n 5 docs 5  e.g. tierA-000008 tierA-000009

;; ---- slot proposal.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 proposal)    ;; n 5 docs 5  e.g. tierA-000168 tierA-000169

;; ---- slot query.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 query)    ;; n 5 docs 5  e.g. tierA-000207 tierA-000208

;; ---- slot receive.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 receive)    ;; n 5 docs 5  e.g. tierA-000262 tierA-000272

;; ---- slot recipe.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 recipe)    ;; n 5 docs 5  e.g. tierA-000084 tierA-000085

;; ---- slot rescue_team.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 rescue_team)    ;; n 5 docs 5  e.g. tierA-000099 tierA-000100

;; ---- slot scan.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 scan)    ;; n 5 docs 5  e.g. tierA-000385 tierA-000386

;; ---- slot search.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 search)    ;; n 5 docs 5  e.g. tierA-000099 tierA-000100

;; ---- slot shoreline_survey.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 shoreline_survey)    ;; n 5 docs 5  e.g. tierA-000052 tierA-000053

;; ---- slot squad.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 squad)    ;; n 5 docs 5  e.g. tierA-000286 tierA-000287

;; ---- slot storm.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 storm)    ;; n 5 docs 5  e.g. tierA-000222 tierA-000223

;; ---- slot summer_fair.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 summer_fair)    ;; n 5 docs 5  e.g. tierA-000148 tierA-000149

;; ---- slot take.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 take)    ;; n 5 docs 5  e.g. tierA-000174 tierA-000178

;; ---- slot tender.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 tender)    ;; n 5 docs 5  e.g. tierA-000104 tierA-000105

;; ---- slot tender.Possession  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(And (Member $x0 tender) (Possession $x0 $x1) (Member $x1 firm))    ;; n 5 docs 5  e.g. tierA-000104 tierA-000105

;; ---- slot tournament.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 tournament)    ;; n 5 docs 5  e.g. tierA-000123 tierA-000124

;; ---- slot tower.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 tower)    ;; n 5 docs 5  e.g. tierA-000212 tierA-000213

;; ---- slot tutor.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 tutor)    ;; n 5 docs 5  e.g. tierA-000153 tierA-000154

;; ---- slot vet.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 vet)    ;; n 5 docs 5  e.g. tierA-000217 tierA-000218

;; ---- slot vote.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 vote)    ;; n 5 docs 5  e.g. tierA-000114 tierA-000115

;; ---- slot winner.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 winner)    ;; n 5 docs 5  e.g. tierA-000276 tierA-000277

;; ---- slot wreck.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 wreck)    ;; n 5 docs 5  e.g. tierA-000133 tierA-000134

;; ---- slot <unclassed>.PartOf  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(PartOf $x0 khurda_road)    ;; n 2 docs 2  e.g. tierC-000105 tierC-000106
(PartOf $x0 huancavelica)    ;; n 1 docs 1  e.g. tierC-000191
(PartOf $x0 peru)    ;; n 1 docs 1  e.g. tierC-000192

;; ---- slot accompany.Member  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $e0 accompany)    ;; n 4 docs 2  e.g. tierC-000127 tierC-000128

;; ---- slot acquire.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 acquire)    ;; n 4 docs 4  e.g. tierA-000003 tierA-000010

;; ---- slot add.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 add)    ;; n 4 docs 4  e.g. tierC-000227 tierC-000228

;; ---- slot allow.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 allow)    ;; n 4 docs 4  e.g. tierA-000075 tierA-000076

;; ---- slot attention.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 attention)    ;; n 2 docs 2  e.g. tierC-000177 tierC-000178
(And (Member $x0 attention) (Member $x0 widespread))    ;; n 2 docs 2  e.g. tierC-000177 tierC-000178

;; ---- slot auditor.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 auditor)    ;; n 4 docs 4  e.g. tierA-000128 tierA-000129

;; ---- slot bad.Between  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $x0 bad) (Between $x0 germany))    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242
(And (Member $x0 bad) (Between $x0 poland))    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242

;; ---- slot bad.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 bad)    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242
(And (Member $x0 bad) (Member $x0 relationship))    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242

;; ---- slot balance.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 balance)    ;; n 2 docs 2  e.g. tierC-000257 tierC-000258
(And (Member $x0 balance) (Member $x0 international))    ;; n 2 docs 2  e.g. tierC-000257 tierC-000258

;; ---- slot become.Result  [event center; head other]  n 4  docs<= 4  distinct 3  eventive 4
(And (Member $e0 become) (Result $e0 $e1) (Member $e1 bad))    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242
(And (Member $e0 become) (Result $e0 $e1) (Member $e1 indigenous))    ;; n 1 docs 1  e.g. tierC-000001
(And (Member $e0 become) (Result $e0 $e1) (Member $e1 lax))    ;; n 1 docs 1  e.g. tierC-000158

;; ---- slot biologist.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 biologist)    ;; n 4 docs 4  e.g. tierA-000319 tierA-000320

;; ---- slot block.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 block)    ;; n 2 docs 2  e.g. tierC-000321 tierC-000322
(And (Member $x0 block) (Member $x0 pakistani))    ;; n 2 docs 2  e.g. tierC-000321 tierC-000322

;; ---- slot block.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 block)    ;; n 4 docs 4  e.g. tierA-000390 tierA-000391

;; ---- slot border_section.Between  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $x0 border_section) (Between $x0 lessos))    ;; n 2 docs 2  e.g. tierC-000245 tierC-000246
(And (Member $x0 border_section) (Between $x0 uganda))    ;; n 2 docs 2  e.g. tierC-000245 tierC-000246

;; ---- slot celebrated.Member  [event center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $e0 celebrated)    ;; n 2 docs 2  e.g. tierC-000013 tierC-000014
(And (Member $e0 celebrated) (Member $e0 warrior))    ;; n 2 docs 2  e.g. tierC-000013 tierC-000014

;; ---- slot coach.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 coach)    ;; n 4 docs 4  e.g. tierA-000286 tierA-000287

;; ---- slot commence.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 commence)    ;; n 4 docs 4  e.g. tierA-000054 tierA-000059

;; ---- slot company.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 company)    ;; n 4 docs 4  e.g. tierC-000045 tierC-000046

;; ---- slot complex.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 complex)    ;; n 2 docs 2  e.g. tierC-000163 tierC-000164
(And (Member $x0 complex) (Member $x0 simple))    ;; n 2 docs 2  e.g. tierC-000163 tierC-000164

;; ---- slot considerable.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 considerable)    ;; n 2 docs 2  e.g. tierC-000265 tierC-000266
(And (Member $x0 considerable) (Member $x0 pyrite_content))    ;; n 2 docs 2  e.g. tierC-000265 tierC-000266

;; ---- slot context.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 context)    ;; n 2 docs 2  e.g. tierC-000205 tierC-000206
(And (Member $x0 context) (Member $x0 non_spatial))    ;; n 2 docs 2  e.g. tierC-000205 tierC-000206

;; ---- slot cottage.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 cottage)    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270
(And (Member $x0 cottage) (Member $x0 isolated))    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot countersignature.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 countersignature)    ;; n 4 docs 4  e.g. tierA-000089 tierA-000090

;; ---- slot create.Member  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $e0 create)    ;; n 4 docs 2  e.g. tierC-000025 tierC-000026

;; ---- slot curator.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 curator)    ;; n 4 docs 4  e.g. tierA-000080 tierA-000081

;; ---- slot current.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 current)    ;; n 2 docs 2  e.g. tierC-000173 tierC-000174
(And (Member $x0 current) (Member $x0 designation_convention))    ;; n 1 docs 1  e.g. tierC-000174
(And (Member $x0 current) (Member $x0 naming_convention))    ;; n 1 docs 1  e.g. tierC-000173

;; ---- slot define.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 define)    ;; n 4 docs 4  e.g. tierC-000145 tierC-000146

;; ---- slot delegation.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 delegation)    ;; n 4 docs 4  e.g. tierA-000241 tierA-000242

;; ---- slot departure.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 departure)    ;; n 4 docs 4  e.g. tierA-000119 tierA-000120

;; ---- slot departure.Possession  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(And (Member $x0 departure) (Possession $x0 $x1) (Member $x1 ferry))    ;; n 4 docs 4  e.g. tierA-000119 tierA-000120

;; ---- slot difficult.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 difficult)    ;; n 2 docs 2  e.g. tierA-000351 tierA-000354
(And (Member $x0 difficult) (Member $x0 repair))    ;; n 2 docs 2  e.g. tierA-000351 tierA-000354

;; ---- slot drill.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 drill)    ;; n 4 docs 4  e.g. tierA-000286 tierA-000287

;; ---- slot driver.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 driver)    ;; n 4 docs 4  e.g. tierA-000271 tierA-000272

;; ---- slot elder.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 elder)    ;; n 4 docs 4  e.g. tierA-000291 tierA-000292

;; ---- slot emmy.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 emmy)    ;; n 4 docs 4  e.g. tierC-000277 tierC-000278

;; ---- slot encourage.Member  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $e0 encourage)    ;; n 4 docs 2  e.g. tierC-000107 tierC-000108

;; ---- slot error.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 error)    ;; n 4 docs 4  e.g. tierA-000128 tierA-000129

;; ---- slot exhausted.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 exhausted)    ;; n 2 docs 2  e.g. tierA-000363 tierA-000366
(And (Member $x0 exhausted) (Member $x0 night_crew))    ;; n 2 docs 2  e.g. tierA-000363 tierA-000366

;; ---- slot family.Possession  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(And (Member $x0 family) (Possession $x0 $x1) (Member $x1 person))    ;; n 4 docs 4  e.g. tierC-000017 tierC-000018

;; ---- slot ferry.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 ferry)    ;; n 4 docs 4  e.g. tierA-000119 tierA-000120

;; ---- slot follow.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 follow)    ;; n 4 docs 4  e.g. tierC-000076 tierC-000095

;; ---- slot foreman.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 foreman)    ;; n 4 docs 4  e.g. tierA-000271 tierA-000272

;; ---- slot form.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 form)    ;; n 4 docs 4  e.g. tierC-000163 tierC-000164

;; ---- slot founder.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 founder)    ;; n 4 docs 4  e.g. tierA-000253 tierA-000254

;; ---- slot frame.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 frame)    ;; n 4 docs 4  e.g. tierA-000315 tierA-000316

;; ---- slot freight.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 freight)    ;; n 4 docs 4  e.g. tierA-000237 tierA-000238

;; ---- slot gate.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 gate)    ;; n 4 docs 4  e.g. tierA-000395 tierA-000396

;; ---- slot give_up.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 give_up)    ;; n 4 docs 4  e.g. tierA-000100 tierA-000105

;; ---- slot government.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 government)    ;; n 4 docs 4  e.g. tierC-000217 tierC-000218

;; ---- slot government.Possession  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $x0 government) (Possession $x0 kenya))    ;; n 2 docs 2  e.g. tierC-000245 tierC-000246
(And (Member $x0 government) (Possession $x0 uganda))    ;; n 2 docs 2  e.g. tierC-000217 tierC-000218

;; ---- slot hearing.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 hearing)    ;; n 4 docs 4  e.g. tierA-000057 tierA-000058

;; ---- slot hotel.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 hotel)    ;; n 4 docs 4  e.g. tierC-000045 tierC-000046

;; ---- slot influence.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 influence)    ;; n 4 docs 4  e.g. tierC-000257 tierC-000258

;; ---- slot isostructural.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 isostructural)    ;; n 2 docs 2  e.g. tierC-000163 tierC-000164
(And (Member $x0 isostructural) (Member $x0 potassium_salt))    ;; n 2 docs 2  e.g. tierC-000163 tierC-000164

;; ---- slot kill.Member  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $e0 kill)    ;; n 4 docs 2  e.g. tierC-000353 tierC-000354

;; ---- slot ladder.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 ladder)    ;; n 4 docs 4  e.g. tierA-000296 tierA-000297

;; ---- slot licence.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 licence)    ;; n 4 docs 4  e.g. tierA-000076 tierA-000077

;; ---- slot line.Member  [entity center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $x0 line)    ;; n 4 docs 2  e.g. tierC-000083 tierC-000084

;; ---- slot lunch.Before  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 4
(And (Member $x0 lunch) (Before $x0 $e1) (Member $e1 begin))    ;; n 2 docs 2  e.g. tierA-000062 tierA-000066
(And (Member $x0 lunch) (Before $x0 $e1) (Member $e1 commence))    ;; n 1 docs 1  e.g. tierA-000064
(And (Member $x0 lunch) (Before $x0 $e1) (Member $e1 start))    ;; n 1 docs 1  e.g. tierA-000063

;; ---- slot make.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 make)    ;; n 4 docs 4  e.g. tierA-000186 tierA-000191

;; ---- slot move.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 move)    ;; n 4 docs 4  e.g. tierC-000121 tierC-000122

;; ---- slot mural.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 mural)    ;; n 4 docs 4  e.g. tierA-000311 tierA-000312

;; ---- slot nurse.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 nurse)    ;; n 4 docs 4  e.g. tierA-000177 tierA-000178

;; ---- slot order.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 order)    ;; n 4 docs 4  e.g. tierA-000385 tierA-000386

;; ---- slot painting.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 painting)    ;; n 4 docs 4  e.g. tierA-000306 tierA-000307

;; ---- slot pier.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 pier)    ;; n 4 docs 4  e.g. tierA-000181 tierA-000182

;; ---- slot play.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 play)    ;; n 4 docs 4  e.g. tierC-000227 tierC-000228

;; ---- slot purchase.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 purchase)    ;; n 4 docs 4  e.g. tierA-000002 tierA-000009

;; ---- slot ranger.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 ranger)    ;; n 4 docs 4  e.g. tierA-000319 tierA-000320

;; ---- slot reach.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 reach)    ;; n 4 docs 4  e.g. tierA-000187 tierA-000192

;; ---- slot recruit.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 recruit)    ;; n 4 docs 4  e.g. tierA-000261 tierA-000262

;; ---- slot replace.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 replace)    ;; n 4 docs 4  e.g. tierC-000099 tierC-000100

;; ---- slot ridge.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 ridge)    ;; n 4 docs 4  e.g. tierA-000173 tierA-000174

;; ---- slot shepherd.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 shepherd)    ;; n 4 docs 4  e.g. tierA-000173 tierA-000174

;; ---- slot sign.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 sign)    ;; n 4 docs 4  e.g. tierA-000375 tierA-000376

;; ---- slot sing.To  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 4
(And (Member $e0 sing) (To $e0 $e1) (Member $e1 accompany))    ;; n 4 docs 2  e.g. tierC-000127 tierC-000128

;; ---- slot speak.Member  [event center; head other]  n 4  docs<= 3  distinct 1  eventive 0
(Member $e0 speak)    ;; n 4 docs 3  e.g. tierC-000023 tierC-000024

;; ---- slot star.Member  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $e0 star)    ;; n 4 docs 2  e.g. tierC-000137 tierC-000138

;; ---- slot study.Member  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $e0 study)    ;; n 4 docs 2  e.g. tierC-000253 tierC-000254

;; ---- slot survey.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 survey)    ;; n 4 docs 4  e.g. tierA-000319 tierA-000320

;; ---- slot trainer.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 trainer)    ;; n 4 docs 4  e.g. tierA-000261 tierA-000262

;; ---- slot view.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 view)    ;; n 4 docs 4  e.g. tierC-000159 tierC-000160

;; ---- slot ward.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 ward)    ;; n 4 docs 4  e.g. tierA-000177 tierA-000178

;; ---- slot win.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 win)    ;; n 4 docs 4  e.g. tierC-000277 tierC-000278

;; ---- slot active.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 active)    ;; n 3 docs 3  e.g. tierC-000080 tierC-000201

;; ---- slot answer.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 answer)    ;; n 3 docs 3  e.g. tierA-000208 tierA-000213

;; ---- slot bear.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 bear)    ;; n 3 docs 3  e.g. tierC-000199 tierC-000200

;; ---- slot call_off.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 call_off)    ;; n 3 docs 3  e.g. tierA-000144 tierA-000149

;; ---- slot car.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 car)    ;; n 3 docs 3  e.g. tierA-000391 tierA-000396

;; ---- slot cause.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 cause)    ;; n 3 docs 3  e.g. tierA-000223 tierA-000228

;; ---- slot conduct.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 conduct)    ;; n 3 docs 3  e.g. tierC-000284 tierC-000341

;; ---- slot destined.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 destined)    ;; n 1 docs 1  e.g. tierC-000009
(And (Member $x0 destined) (Member $x0 film))    ;; n 1 docs 1  e.g. tierC-000009
(And (Member $x0 destined) (Member $x0 syrian))    ;; n 1 docs 1  e.g. tierC-000009

;; ---- slot discipline.Member  [event center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $e0 discipline)    ;; n 2 docs 2  e.g. tierC-000157 tierC-000158
(And (Member $e0 discipline) (Member $e0 lax))    ;; n 1 docs 1  e.g. tierC-000158

;; ---- slot doctor.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 doctor)    ;; n 3 docs 3  e.g. tierA-000376 tierA-000381

;; ---- slot end.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 end)    ;; n 3 docs 3  e.g. tierA-000056 tierA-000060

;; ---- slot examine.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 examine)    ;; n 3 docs 3  e.g. tierA-000380 tierA-000381

;; ---- slot find_out.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 find_out)    ;; n 3 docs 3  e.g. tierA-000129 tierA-000134

;; ---- slot fitter.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 fitter)    ;; n 3 docs 3  e.g. tierA-000315 tierA-000316

;; ---- slot fund.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 fund)    ;; n 3 docs 3  e.g. tierC-000217 tierC-000218

;; ---- slot house.Member  [event center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $e0 house)    ;; n 1 docs 1  e.g. tierC-000116
(And (Member $e0 house) (Member $e0 large))    ;; n 1 docs 1  e.g. tierC-000116
(And (Member $e0 house) (Member $e0 listed_building))    ;; n 1 docs 1  e.g. tierC-000116

;; ---- slot house.Possession  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $x0 house) (Possession $x0 arakkal))    ;; n 2 docs 2  e.g. tierC-000095 tierC-000096
(And (Member $x0 house) (Possession $x0 derwent_isle))    ;; n 1 docs 1  e.g. tierC-000115

;; ---- slot learn.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 learn)    ;; n 3 docs 3  e.g. tierA-000282 tierA-000287

;; ---- slot medal.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 medal)    ;; n 3 docs 3  e.g. tierA-000276 tierA-000277

;; ---- slot need.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 need)    ;; n 3 docs 3  e.g. tierA-000085 tierA-000090

;; ---- slot park.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 park)    ;; n 3 docs 3  e.g. tierC-000003 tierC-000004

;; ---- slot permit.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 permit)    ;; n 3 docs 3  e.g. tierA-000073 tierA-000077

;; ---- slot put_off.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 put_off)    ;; n 3 docs 3  e.g. tierA-000115 tierA-000120

;; ---- slot random.Cardinality  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(And (Member $x0 random) (Cardinality $x0 <num>))    ;; n 3 docs 3  e.g. tierC-000145 tierC-000146

;; ---- slot random.GroupOf  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $x0 random) (GroupOf $x0 way))    ;; n 2 docs 2  e.g. tierC-000146 tierC-000261
(And (Member $x0 random) (GroupOf $x0 manner))    ;; n 1 docs 1  e.g. tierC-000145

;; ---- slot random.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 random)    ;; n 3 docs 3  e.g. tierC-000145 tierC-000146

;; ---- slot spoil_mound.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 spoil_mound)    ;; n 2 docs 2  e.g. tierA-000349 tierA-000350
(And (Member $x0 spoil_mound) (Member $x0 tiny))    ;; n 1 docs 1  e.g. tierA-000350

;; ---- slot succeed.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 succeed)    ;; n 3 docs 3  e.g. tierC-000075 tierC-000100

;; ---- slot turn_down.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 turn_down)    ;; n 3 docs 3  e.g. tierA-000159 tierA-000164

;; ---- slot wait.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 wait)    ;; n 3 docs 3  e.g. tierA-000395 tierA-000396

;; ---- slot warden.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 warden)    ;; n 3 docs 3  e.g. tierA-000073 tierA-000074

;; ---- slot welder.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 welder)    ;; n 3 docs 3  e.g. tierA-000315 tierA-000316

;; ---- slot western.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 western)    ;; n 3 docs 3  e.g. tierC-000143 tierC-000144

;; ---- slot western.PartOf  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $x0 western) (PartOf $x0 china))    ;; n 2 docs 2  e.g. tierC-000143 tierC-000144
(And (Member $x0 western) (PartOf $x0 europe))    ;; n 1 docs 1  e.g. tierC-000279

;; ---- slot whistle.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 whistle)    ;; n 3 docs 3  e.g. tierA-000261 tierA-000262

;; ---- slot work.Possession  [entity center; head other]  n 2  docs<= 6  distinct 3  eventive 0
(And (Member $x0 work) (Possession $x0 $x1) (Member $x1 artist))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000235 tierC-000236
(And (Member $x0 work) (Possession $x0 $x1) (Member $x1 official))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000235 tierC-000236
(And (Member $x0 work) (Possession $x0 $x1) (Member $x1 soviet))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000235 tierC-000236

;; ---- slot <unclassed>.Before  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Before $x0 $e1) (Member $e1 return))    ;; n 2 docs 2  e.g. tierC-000255 tierC-000256

;; ---- slot <unclassed>.KindProperty  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(KindProperty $x0 widespread)    ;; n 2 docs 2  e.g. tierC-000097 tierC-000098

;; ---- slot <unclassed>.With  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(With $x0 west_virginia)    ;; n 2 docs 2  e.g. tierC-000255 tierC-000256

;; ---- slot accept.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 accept)    ;; n 2 docs 2  e.g. tierA-000161 tierA-000172

;; ---- slot administrator.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 administrator)    ;; n 2 docs 2  e.g. tierC-000085 tierC-000086

;; ---- slot advance.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 advance)    ;; n 2 docs 2  e.g. tierA-000117 tierA-000127

;; ---- slot album.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 album)    ;; n 2 docs 2  e.g. tierC-000103 tierC-000104

;; ---- slot algorithmically_equivalent.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 algorithmically_equivalent) (GroupOf $x0 sequence))    ;; n 2 docs 2  e.g. tierC-000145 tierC-000146

;; ---- slot algorithmically_equivalent.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 algorithmically_equivalent)    ;; n 2 docs 2  e.g. tierC-000145 tierC-000146

;; ---- slot army.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 army)    ;; n 2 docs 2  e.g. tierC-000157 tierC-000158

;; ---- slot arrange.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 arrange)    ;; n 2 docs 2  e.g. tierC-000349 tierC-000350

;; ---- slot arrival.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 arrival)    ;; n 2 docs 2  e.g. tierA-000242 tierA-000246

;; ---- slot aspect.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 aspect)    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114

;; ---- slot assistant.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 assistant)    ;; n 2 docs 2  e.g. tierC-000151 tierC-000152

;; ---- slot attract.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 attract)    ;; n 2 docs 2  e.g. tierC-000177 tierC-000178

;; ---- slot avoid.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 avoid)    ;; n 2 docs 2  e.g. tierA-000401 tierC-000124

;; ---- slot bad.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 bad)    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242

;; ---- slot bake.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 bake)    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot balance.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 balance) (Possession $x0 political_power))    ;; n 2 docs 2  e.g. tierC-000257 tierC-000258

;; ---- slot band.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 band)    ;; n 2 docs 2  e.g. tierC-000179 tierC-000180

;; ---- slot barako.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 barako)    ;; n 2 docs 2  e.g. tierC-000203 tierC-000204

;; ---- slot barometer.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 barometer)    ;; n 2 docs 2  e.g. tierC-000213 tierC-000214

;; ---- slot believe.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 believe)    ;; n 2 docs 2  e.g. tierC-000061 tierC-000062

;; ---- slot big.During  [entity center; head other]  n 2  docs<= 4  distinct 3  eventive 0
(And (Member $x0 big) (During $x0 $x1) (Member $x1 homecoming_game))    ;; n 2 (mass 1) docs 2  e.g. tierC-000019 tierC-000020
(And (Member $x0 big) (During $x0 $x1) (Member $x1 great))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000020
(And (Member $x0 big) (During $x0 $x1) (Member $x1 large))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000019

;; ---- slot black_hard.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 black_hard) (GroupOf $x0 rock))    ;; n 2 docs 2  e.g. tierC-000265 tierC-000266

;; ---- slot border_section.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 border_section)    ;; n 2 docs 2  e.g. tierC-000245 tierC-000246

;; ---- slot break_into.But  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 break_into) (But $e0 $e1) (Member $e1 find))    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244

;; ---- slot break_into.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 break_into)    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244

;; ---- slot bring.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 bring)    ;; n 2 docs 2  e.g. tierC-000351 tierC-000352

;; ---- slot byzantine.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 byzantine) (GroupOf $x0 tradition))    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114

;; ---- slot byzantine.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 byzantine)    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114

;; ---- slot celebrate.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 celebrate)    ;; n 2 docs 2  e.g. tierC-000133 tierC-000134

;; ---- slot central_arm.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 central_arm)    ;; n 2 docs 2  e.g. tierC-000007 tierC-000008

;; ---- slot central_arm.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 central_arm) (PartOf $x0 $x1) (Member $x1 ministry))    ;; n 2 docs 2  e.g. tierC-000007 tierC-000008

;; ---- slot change.During  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 change) (During $e0 $e1) (Member $e1 present))    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012

;; ---- slot change.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 change)    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012

;; ---- slot chapel.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 chapel)    ;; n 1 docs 1  e.g. tierC-000115
(And (Member $x0 chapel) (Member $x0 listed_building))    ;; n 1 docs 1  e.g. tierC-000115

;; ---- slot chapel.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 chapel)    ;; n 1 docs 1  e.g. tierC-000116
(And (Member $e0 chapel) (Member $e0 listed_building))    ;; n 1 docs 1  e.g. tierC-000116

;; ---- slot clarify.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 clarify)    ;; n 2 docs 2  e.g. tierC-000021 tierC-000022

;; ---- slot common.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 common)    ;; n 1 docs 1  e.g. tierC-000136
(And (Member $x0 common) (Member $x0 view))    ;; n 1 docs 1  e.g. tierC-000136

;; ---- slot community.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 community)    ;; n 2 docs 2  e.g. tierC-000025 tierC-000026

;; ---- slot compete.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 compete)    ;; n 2 docs 2  e.g. tierA-000318 tierA-000321

;; ---- slot competitive_activity.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 competitive_activity)    ;; n 1 docs 1  e.g. tierC-000148
(And (Member $x0 competitive_activity) (Member $x0 recreational_sport))    ;; n 1 docs 1  e.g. tierC-000148

;; ---- slot compose.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 compose)    ;; n 2 docs 2  e.g. tierC-000131 tierC-000132

;; ---- slot confirm.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 confirm)    ;; n 2 docs 2  e.g. tierA-000146 tierA-000157

;; ---- slot consider.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 consider)    ;; n 2 docs 2  e.g. tierC-000233 tierC-000234

;; ---- slot considerable.PartOf  [entity center; head other]  n 2  docs<= 8  distinct 4  eventive 0
(And (Member $x0 considerable) (PartOf $x0 $x1) (Member $x1 black_hard))    ;; n 2 (mass 0.5) docs 2  e.g. tierC-000265 tierC-000266
(And (Member $x0 considerable) (PartOf $x0 $x1) (Member $x1 dense))    ;; n 2 (mass 0.5) docs 2  e.g. tierC-000265 tierC-000266
(And (Member $x0 considerable) (PartOf $x0 $x1) (Member $x1 purple))    ;; n 2 (mass 0.5) docs 2  e.g. tierC-000265 tierC-000266
(And (Member $x0 considerable) (PartOf $x0 $x1) (Member $x1 rock))    ;; n 2 (mass 0.5) docs 2  e.g. tierC-000265 tierC-000266

;; ---- slot contact.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 contact)    ;; n 2 docs 2  e.g. tierC-000017 tierC-000018

;; ---- slot continue.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 continue)    ;; n 2 docs 2  e.g. tierA-000102 tierA-000113

;; ---- slot corruption.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 corruption)    ;; n 2 docs 2  e.g. tierC-000157 tierC-000158

;; ---- slot couch.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 couch)    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot cross.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 cross)    ;; n 2 docs 2  e.g. tierA-000399 tierA-000400

;; ---- slot curse.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 curse)    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot curse.To  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 2
(And (Member $e0 curse) (To $e0 $e1) (Member $e1 avoid))    ;; n 1 docs 1  e.g. tierC-000124
(And (Member $e0 curse) (To $e0 $e1) (Member $e1 prevent))    ;; n 1 docs 1  e.g. tierC-000123

;; ---- slot depart.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 depart)    ;; n 2 docs 2  e.g. tierA-000244 tierA-000247

;; ---- slot diverse.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 diverse)    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot double.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 double)    ;; n 2 docs 2  e.g. tierC-000055 tierC-000056

;; ---- slot draw.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 draw)    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot drum.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 drum)    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot easy.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 easy)    ;; n 1 docs 1  e.g. tierA-000353
(And (Member $x0 easy) (Member $x0 repair))    ;; n 1 docs 1  e.g. tierA-000353

;; ---- slot empirical.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 empirical) (GroupOf $x0 relationship))    ;; n 2 docs 2  e.g. tierC-000021 tierC-000022

;; ---- slot empirical.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 empirical)    ;; n 2 docs 2  e.g. tierC-000021 tierC-000022

;; ---- slot empirical.Possession  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 empirical) (Possession $x0 logical_phrase))    ;; n 1 docs 1  e.g. tierC-000021
(And (Member $x0 empirical) (Possession $x0 logical_proposition))    ;; n 1 docs 1  e.g. tierC-000022

;; ---- slot endorse.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 endorse)    ;; n 2 docs 2  e.g. tierC-000159 tierC-000355

;; ---- slot energetic.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 energetic)    ;; n 1 docs 1  e.g. tierA-000365
(And (Member $x0 energetic) (Member $x0 night_crew))    ;; n 1 docs 1  e.g. tierA-000365

;; ---- slot enter.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 enter)    ;; n 2 docs 2  e.g. tierC-000063 tierC-000064

;; ---- slot episode.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 episode)    ;; n 2 docs 2  e.g. tierC-000297 tierC-000298

;; ---- slot equivalent.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 equivalent) (GroupOf $x0 sequence))    ;; n 2 docs 2  e.g. tierC-000261 tierC-000262

;; ---- slot equivalent.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 equivalent)    ;; n 2 docs 2  e.g. tierC-000261 tierC-000262

;; ---- slot established.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 established)    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot event.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 event)    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot exhibit.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 exhibit)    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236

;; ---- slot exile.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 exile)    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot exile.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 exile) (Possession $x0 $x1) (Member $x1 man))    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot expand.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 expand)    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot expand.To  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 expand) (To $e0 $e1) (Member $e1 bake))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot expedition.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 expedition)    ;; n 2 docs 2  e.g. tierC-000171 tierC-000172

;; ---- slot extract.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 extract)    ;; n 2 docs 2  e.g. tierC-000333 tierC-000334

;; ---- slot father.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 father)    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot father.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 father) (Possession $x0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot film.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 film)    ;; n 1 docs 1  e.g. tierC-000010
(And (Member $x0 film) (Member $x0 syrian))    ;; n 1 docs 1  e.g. tierC-000010

;; ---- slot first_team.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 first_team)    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244

;; ---- slot fix.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 fix)    ;; n 2 docs 2  e.g. tierA-000030 tierA-000036

;; ---- slot foot.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 foot)    ;; n 2 docs 2  e.g. tierC-000003 tierC-000004

;; ---- slot foot.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 foot) (PartOf $x0 bay_street))    ;; n 2 docs 2  e.g. tierC-000003 tierC-000004

;; ---- slot forbid.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 forbid)    ;; n 2 docs 2  e.g. tierA-000074 tierA-000083

;; ---- slot geological_party.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 geological_party)    ;; n 2 docs 2  e.g. tierC-000033 tierC-000034

;; ---- slot go.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 go)    ;; n 2 docs 2  e.g. tierC-000209 tierC-000210

;; ---- slot go.To  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 go) (To $e0 $e1) (Member $e1 talk))    ;; n 2 docs 2  e.g. tierC-000209 tierC-000210

;; ---- slot governor.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 governor)    ;; n 2 docs 2  e.g. tierC-000099 tierC-000100

;; ---- slot great.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 great)    ;; n 1 docs 1  e.g. tierC-000020
(And (Member $x0 great) (Member $x0 homecoming_game))    ;; n 1 docs 1  e.g. tierC-000020

;; ---- slot group.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 group)    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot hard.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 hard)    ;; n 1 docs 1  e.g. tierA-000352
(And (Member $x0 hard) (Member $x0 repair))    ;; n 1 docs 1  e.g. tierA-000352

;; ---- slot headquarters.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 headquarters)    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot help.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 help)    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072

;; ---- slot hold.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 hold)    ;; n 2 docs 2  e.g. tierC-000283 tierC-000284

;; ---- slot homecoming_game.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 homecoming_game)    ;; n 1 docs 1  e.g. tierC-000019
(And (Member $x0 homecoming_game) (Member $x0 large))    ;; n 1 docs 1  e.g. tierC-000019

;; ---- slot hope.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 hope)    ;; n 2 docs 2  e.g. tierC-000029 tierC-000030

;; ---- slot horn.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 horn)    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072

;; ---- slot hurricane.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 hurricane)    ;; n 2 docs 2  e.g. tierC-000353 tierC-000354

;; ---- slot identity.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 identity)    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072

;; ---- slot identity.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 identity) (Possession $x0 herald))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072

;; ---- slot illegal.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 illegal)    ;; n 2 docs 2  e.g. tierC-000039 tierC-000040

;; ---- slot implore.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 implore)    ;; n 2 docs 1  e.g. tierC-000043

;; ---- slot indigenous.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 indigenous)    ;; n 1 docs 1  e.g. tierC-000001
(And (Member $x0 indigenous) (Member $x0 people))    ;; n 1 docs 1  e.g. tierC-000001

;; ---- slot inherit.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 inherit)    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114

;; ---- slot inomaru.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 inomaru)    ;; n 2 docs 2  e.g. tierC-000237 tierC-000238

;; ---- slot invite.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 invite)    ;; n 2 docs 1  e.g. tierC-000044

;; ---- slot job.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 job)    ;; n 2 docs 2  e.g. tierC-000303 tierC-000304

;; ---- slot join.Before  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 join) (Before $e0 $e1) (Member $e1 take_over))    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot join.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 join)    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot kick_the_bucket.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 kick_the_bucket)    ;; n 2 docs 2  e.g. tierA-000254 tierA-000258

;; ---- slot kidnap.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 kidnap)    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot lead.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 lead)    ;; n 2 docs 2  e.g. tierC-000019 tierC-000020

;; ---- slot lessos_kenya_border_section.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 lessos_kenya_border_section)    ;; n 2 docs 2  e.g. tierC-000217 tierC-000218

;; ---- slot lose.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 lose)    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162

;; ---- slot lure.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 lure)    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot machine.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 machine)    ;; n 2 docs 2  e.g. tierC-000315 tierC-000316

;; ---- slot main_songwriting_unit.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 main_songwriting_unit)    ;; n 2 docs 2  e.g. tierC-000179 tierC-000180

;; ---- slot man.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 man)    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot marry.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 marry)    ;; n 2 docs 2  e.g. tierC-000075 tierC-000076

;; ---- slot mass_ceremony.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 mass_ceremony)    ;; n 2 docs 2  e.g. tierC-000283 tierC-000284

;; ---- slot mela.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 mela)    ;; n 2 docs 2  e.g. tierC-000133 tierC-000134

;; ---- slot mend.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 mend)    ;; n 2 docs 2  e.g. tierA-000031 tierA-000037

;; ---- slot mental_world.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 mental_world)    ;; n 2 docs 2  e.g. tierC-000233 tierC-000234

;; ---- slot method.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 method)    ;; n 2 docs 2  e.g. tierC-000061 tierC-000062

;; ---- slot metropolitan_statistical_area.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 metropolitan_statistical_area)    ;; n 2 docs 2  e.g. tierC-000275 tierC-000276

;; ---- slot mind.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 mind)    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012

;; ---- slot mind.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 mind) (Possession $x0 cameron))    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012

;; ---- slot ministry.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 ministry)    ;; n 2 docs 2  e.g. tierC-000007 tierC-000008

;; ---- slot model.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 model)    ;; n 2 docs 2  e.g. tierC-000267 tierC-000268

;; ---- slot moist.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 moist) (GroupOf $x0 habitat))    ;; n 2 docs 2  e.g. tierC-000339 tierC-000340

;; ---- slot moist.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 moist) (Possession $x0 $x1))    ;; n 2 docs 2  e.g. tierC-000339 tierC-000340

;; ---- slot movie.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 movie)    ;; n 2 docs 2  e.g. tierC-000091 tierC-000092

;; ---- slot name.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 name)    ;; n 2 docs 2  e.g. tierC-000111 tierC-000112

;; ---- slot nation.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 nation)    ;; n 2 docs 2  e.g. tierC-000299 tierC-000300

;; ---- slot neighbouring.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 neighbouring) (GroupOf $x0 community))    ;; n 2 docs 2  e.g. tierC-000117 tierC-000118

;; ---- slot network.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 network)    ;; n 2 docs 2  e.g. tierC-000185 tierC-000186

;; ---- slot night_crew.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 night_crew)    ;; n 1 docs 1  e.g. tierA-000364
(And (Member $x0 night_crew) (Member $x0 tired))    ;; n 1 docs 1  e.g. tierA-000364

;; ---- slot nominate.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 nominate)    ;; n 2 docs 2  e.g. tierC-000009 tierC-000010

;; ---- slot north.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 north)    ;; n 2 docs 2  e.g. tierC-000211 tierC-000212

;; ---- slot north.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 north) (PartOf $x0 estonia))    ;; n 2 docs 2  e.g. tierC-000211 tierC-000212

;; ---- slot northeastern.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 northeastern)    ;; n 2 docs 2  e.g. tierC-000263 tierC-000264

;; ---- slot northeastern.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 northeastern) (PartOf $x0 colombia))    ;; n 2 docs 2  e.g. tierC-000263 tierC-000264

;; ---- slot offer.Because  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 offer) (Because $e0 $e1) (Member $e1 want))    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312

;; ---- slot offer.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 offer)    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312

;; ---- slot open.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 open)    ;; n 2 docs 2  e.g. tierC-000285 tierC-000286

;; ---- slot orchestra.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 orchestra)    ;; n 2 docs 2  e.g. tierC-000341 tierC-000342

;; ---- slot organise.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 organise)    ;; n 2 docs 2  e.g. tierC-000133 tierC-000134

;; ---- slot paint.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 paint)    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot paper_factory.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 paper_factory)    ;; n 2 docs 2  e.g. tierC-000045 tierC-000292

;; ---- slot paper_mill.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 paper_mill)    ;; n 2 docs 2  e.g. tierC-000046 tierC-000291

;; ---- slot part.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 part)    ;; n 2 docs 2  e.g. tierC-000135 tierC-000136

;; ---- slot part.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 part) (PartOf $x0 southern_india))    ;; n 2 docs 2  e.g. tierC-000135 tierC-000136

;; ---- slot pencil_portrait.About  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 pencil_portrait) (About $x0 john_higgins))    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot pencil_portrait.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 pencil_portrait)    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot perform.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 perform)    ;; n 2 docs 1  e.g. tierC-000127

;; ---- slot personality.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 personality)    ;; n 2 docs 2  e.g. tierC-000227 tierC-000228

;; ---- slot personality.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 personality) (Possession $x0 holly_golightly))    ;; n 2 docs 2  e.g. tierC-000227 tierC-000228

;; ---- slot post.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 post)    ;; n 2 docs 2  e.g. tierC-000025 tierC-000026

;; ---- slot preach.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 preach)    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot present.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 present)    ;; n 1 docs 1  e.g. tierC-000214
(And (Member $x0 present) (Member $x0 scale))    ;; n 1 docs 1  e.g. tierC-000214

;; ---- slot present.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 present)    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012

;; ---- slot present_in.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 present_in)    ;; n 1 docs 1  e.g. tierC-000213
(And (Member $x0 present_in) (Member $x0 scale))    ;; n 1 docs 1  e.g. tierC-000213

;; ---- slot president.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 president)    ;; n 2 docs 2  e.g. tierC-000053 tierC-000054

;; ---- slot president.Possession  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 president) (Possession $x0 new_york_stock_exchange))    ;; n 1 docs 1  e.g. tierC-000053
(And (Member $x0 president) (Possession $x0 nyse_group))    ;; n 1 docs 1  e.g. tierC-000054

;; ---- slot print.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 print)    ;; n 2 docs 2  e.g. tierC-000231 tierC-000232

;; ---- slot race.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 race)    ;; n 2 docs 2  e.g. tierC-000029 tierC-000030

;; ---- slot recreational_sport.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 recreational_sport)    ;; n 1 docs 1  e.g. tierC-000147
(And (Member $x0 recreational_sport) (Member $x0 sporting_activity))    ;; n 1 docs 1  e.g. tierC-000147

;; ---- slot recreational_sport.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 recreational_sport)    ;; n 2 docs 2  e.g. tierC-000147 tierC-000148

;; ---- slot refer.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 refer)    ;; n 2 docs 2  e.g. tierC-000205 tierC-000206

;; ---- slot reflect.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 reflect)    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114

;; ---- slot region.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 region)    ;; n 2 docs 2  e.g. tierC-000095 tierC-000096

;; ---- slot region.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 region)    ;; n 2 docs 2  e.g. tierC-000223 tierC-000224

;; ---- slot regional_unit.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 regional_unit)    ;; n 2 docs 2  e.g. tierC-000031 tierC-000032

;; ---- slot religion.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 religion)    ;; n 2 docs 2  e.g. tierC-000257 tierC-000258

;; ---- slot religion.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 religion) (Possession $x0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000257 tierC-000258

;; ---- slot represent.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 represent)    ;; n 2 docs 2  e.g. tierC-000007 tierC-000008

;; ---- slot representation.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 representation)    ;; n 2 docs 2  e.g. tierC-000271 tierC-000272

;; ---- slot return.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 return)    ;; n 2 docs 2  e.g. tierC-000255 tierC-000256

;; ---- slot room.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 room)    ;; n 2 docs 2  e.g. tierC-000213 tierC-000214

;; ---- slot rule.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 rule)    ;; n 2 docs 2  e.g. tierC-000095 tierC-000096

;; ---- slot run.But  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 run) (But $e0 $e1) (Member $e1 lose))    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162

;; ---- slot run.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 run)    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162

;; ---- slot save.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 save)    ;; n 2 docs 2  e.g. tierA-000231 tierA-000235

;; ---- slot season.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 season)    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244

;; ---- slot seduce.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 seduce)    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot select.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 select)    ;; n 2 docs 2  e.g. tierC-000303 tierC-000304

;; ---- slot sell.Before  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 sell) (Before $e0 $e1) (Member $e1 expand))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot shake.Before  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 shake) (Before $e0 $e1) (Member $e1 extract))    ;; n 2 docs 2  e.g. tierC-000333 tierC-000334

;; ---- slot shake.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 shake)    ;; n 2 docs 2  e.g. tierC-000333 tierC-000334

;; ---- slot ship.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 ship)    ;; n 2 docs 2  e.g. tierC-000203 tierC-000204

;; ---- slot sleep.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 sleep)    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot solvent.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 solvent)    ;; n 2 docs 2  e.g. tierC-000333 tierC-000334

;; ---- slot southern.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 southern)    ;; n 2 docs 2  e.g. tierC-000279 tierC-000280

;; ---- slot southern.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 southern) (PartOf $x0 north_africa))    ;; n 2 docs 2  e.g. tierC-000279 tierC-000280

;; ---- slot speaker.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 speaker)    ;; n 2 docs 1  e.g. tierC-000078

;; ---- slot specify.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 specify)    ;; n 2 docs 2  e.g. tierC-000267 tierC-000268

;; ---- slot spend.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 spend)    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot spokesman.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 spokesman)    ;; n 2 docs 1  e.g. tierC-000077

;; ---- slot stab.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 stab)    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot stab.To  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 2
(And (Member $e0 stab) (To $e0 $e1) (Member $e1 avoid))    ;; n 1 docs 1  e.g. tierC-000124
(And (Member $e0 stab) (To $e0 $e1) (Member $e1 prevent))    ;; n 1 docs 1  e.g. tierC-000123

;; ---- slot state.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 state)    ;; n 2 docs 2  e.g. tierC-000353 tierC-000354

;; ---- slot station.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 station)    ;; n 2 docs 2  e.g. tierC-000185 tierC-000186

;; ---- slot story.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 story)    ;; n 2 docs 2  e.g. tierC-000177 tierC-000178

;; ---- slot suggest.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 suggest)    ;; n 2 docs 2  e.g. tierC-000017 tierC-000018

;; ---- slot support.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 support)    ;; n 2 docs 2  e.g. tierC-000160 tierC-000356

;; ---- slot take_over.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 take_over)    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot talk.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 talk)    ;; n 2 docs 2  e.g. tierC-000209 tierC-000210

;; ---- slot task.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 task)    ;; n 2 docs 2  e.g. tierC-000021 tierC-000022

;; ---- slot task.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 task) (Possession $x0 philosophy))    ;; n 2 docs 2  e.g. tierC-000021 tierC-000022

;; ---- slot tell.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 tell)    ;; n 2 docs 2  e.g. tierC-000035 tierC-000036

;; ---- slot term.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 term)    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162

;; ---- slot tunnel.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 tunnel)    ;; n 2 docs 2  e.g. tierC-000125 tierC-000126

;; ---- slot usual.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 usual)    ;; n 1 docs 1  e.g. tierC-000135
(And (Member $x0 usual) (Member $x0 view))    ;; n 1 docs 1  e.g. tierC-000135

;; ---- slot village.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 village)    ;; n 2 docs 2  e.g. tierC-000133 tierC-000134

;; ---- slot voice.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 voice)    ;; n 2 docs 1  e.g. tierC-000093

;; ---- slot want.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 want)    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312

;; ---- slot welcome.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 welcome)    ;; n 2 docs 2  e.g. tierC-000087 tierC-000088

;; ---- slot widespread.But  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 widespread) (But $e0 <term:SameDegree>))    ;; n 2 docs 2  e.g. tierC-000097 tierC-000098

;; ---- slot widespread.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 widespread)    ;; n 2 docs 2  e.g. tierC-000097 tierC-000098

;; ---- slot wilson.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 wilson)    ;; n 2 docs 2  e.g. tierC-000277 tierC-000302

;; ---- slot work.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 work)    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236

;; ---- slot <unclassed>.GroupOf  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(GroupOf $e0 tributary)    ;; n 1 docs 1  e.g. tierC-000313

;; ---- slot <unclassed>.Only  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Only $e0 $e1) (Member $e1 find))    ;; n 1 docs 1  e.g. tierC-000313

;; ---- slot <unclassed>.Possession  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Possession $e0 yunnan)    ;; n 1 docs 1  e.g. tierC-000313

;; ---- slot <unclassed>.Relate  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Relate $x0 prostitution)    ;; n 1 docs 1  e.g. tierC-000040

;; ---- slot accidental.Cardinality  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 accidental) (Cardinality $x0 <num>))    ;; n 1 docs 1  e.g. tierC-000262

;; ---- slot accidental.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 accidental) (GroupOf $x0 way))    ;; n 1 docs 1  e.g. tierC-000262

;; ---- slot accidental.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 accidental)    ;; n 1 docs 1  e.g. tierC-000262

;; ---- slot address.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 address)    ;; n 1 docs 1  e.g. tierC-000137

;; ---- slot auditor.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 auditor)    ;; n 1 docs 1  e.g. tierA-000132

;; ---- slot become.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 become) (Before $e0 $e1) (Member $e1 cease))    ;; n 1 docs 1  e.g. tierC-000001

;; ---- slot break.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 break)    ;; n 1 docs 1  e.g. tierA-000040

;; ---- slot cease.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 cease)    ;; n 1 docs 1  e.g. tierC-000001

;; ---- slot cease.Result  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 cease) (Result $e0 $e1) (Member $e1 french))    ;; n 1 docs 1  e.g. tierC-000001

;; ---- slot chapel.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 chapel) (Possession $x0 derwent_isle))    ;; n 1 docs 1  e.g. tierC-000115

;; ---- slot common.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 common)    ;; n 1 docs 1  e.g. tierC-000136

;; ---- slot competitive_activity.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 competitive_activity)    ;; n 1 docs 1  e.g. tierC-000148

;; ---- slot destined.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 destined)    ;; n 1 docs 1  e.g. tierC-000009

;; ---- slot develop.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 develop)    ;; n 1 docs 1  e.g. tierC-000349

;; ---- slot dissolve.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 dissolve)    ;; n 1 docs 1  e.g. tierC-000099

;; ---- slot engineer.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 engineer)    ;; n 1 docs 1  e.g. tierC-000350

;; ---- slot error.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 error)    ;; n 1 docs 1  e.g. tierA-000132

;; ---- slot establish.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 establish)    ;; n 1 docs 1  e.g. tierC-000175

;; ---- slot exceed.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 exceed)    ;; n 1 docs 1  e.g. tierC-000194

;; ---- slot executive_level.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 executive_level)    ;; n 1 docs 1  e.g. tierC-000007

;; ---- slot finance.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 finance)    ;; n 1 docs 1  e.g. tierC-000246

;; ---- slot force.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 force)    ;; n 1 docs 1  e.g. tierC-000041

;; ---- slot found.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 found)    ;; n 1 docs 1  e.g. tierC-000176

;; ---- slot french.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 french)    ;; n 1 docs 1  e.g. tierC-000001

;; ---- slot give_on.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 give_on)    ;; n 1 docs 1  e.g. tierC-000111

;; ---- slot hold.End  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hold) (End $e0 dawn))    ;; n 1 docs 1  e.g. tierC-000284

;; ---- slot homentropic_current.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 homentropic_current)    ;; n 1 docs 1  e.g. tierC-000154

;; ---- slot homentropic_flow.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 homentropic_flow)    ;; n 1 docs 1  e.g. tierC-000153

;; ---- slot ignore.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 ignore)    ;; n 1 docs 1  e.g. tierA-000384

;; ---- slot immiscible.Cardinality  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 immiscible) (Cardinality $x0 <num>))    ;; n 1 docs 1  e.g. tierC-000333

;; ---- slot immiscible.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 immiscible) (GroupOf $x0 liquid))    ;; n 1 docs 1  e.g. tierC-000333

;; ---- slot immiscible.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 immiscible)    ;; n 1 docs 1  e.g. tierC-000333

;; ---- slot indigenous.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 indigenous)    ;; n 1 docs 1  e.g. tierC-000001

;; ---- slot industrialization.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 industrialization)    ;; n 1 docs 1  e.g. tierC-000087

;; ---- slot isostructural.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 isostructural) (Possession $x0 technetium))    ;; n 1 docs 1  e.g. tierC-000164

;; ---- slot issaquah_creek_park.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 issaquah_creek_park)    ;; n 1 docs 1  e.g. tierC-000063

;; ---- slot lax.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 lax)    ;; n 1 docs 1  e.g. tierC-000158

;; ---- slot leave.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 leave)    ;; n 1 docs 1  e.g. tierA-000398

;; ---- slot legal.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 legal) (GroupOf $x0 activity))    ;; n 1 docs 1  e.g. tierC-000040

;; ---- slot legal.Inheritance  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 legal) (Inheritance $x0 legal))    ;; n 1 docs 1  e.g. tierC-000040

;; ---- slot legal.SubsetOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 legal) (SubsetOf $x0 $x1) (Member $x1 activity))    ;; n 1 docs 1  e.g. tierC-000040

;; ---- slot low.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 low)    ;; n 1 docs 1  e.g. tierC-000070

;; ---- slot main_songwriting_unit.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 main_songwriting_unit) (PartOf $x0 $x1) (Member $x1 band))    ;; n 1 docs 1  e.g. tierC-000180

;; ---- slot mainstream_media.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mainstream_media)    ;; n 1 docs 1  e.g. tierC-000178

;; ---- slot merge.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 merge)    ;; n 1 docs 1  e.g. tierC-000104

;; ---- slot mix.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 mix)    ;; n 1 docs 1  e.g. tierC-000103

;; ---- slot nonmixable.Cardinality  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 nonmixable) (Cardinality $x0 <num>))    ;; n 1 docs 1  e.g. tierC-000334

;; ---- slot nonmixable.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 nonmixable) (GroupOf $x0 liquid))    ;; n 1 docs 1  e.g. tierC-000334

;; ---- slot nonmixable.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 nonmixable)    ;; n 1 docs 1  e.g. tierC-000334

;; ---- slot oblige.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 oblige)    ;; n 1 docs 1  e.g. tierC-000042

;; ---- slot occupational_group.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 occupational_group)    ;; n 1 docs 1  e.g. tierC-000329

;; ---- slot outperform.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 outperform)    ;; n 1 docs 1  e.g. tierC-000193

;; ---- slot post.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 post)    ;; n 1 docs 1  e.g. tierC-000069

;; ---- slot pray.End  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pray) (End $e0 dawn))    ;; n 1 docs 1  e.g. tierC-000283

;; ---- slot pray.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 pray)    ;; n 1 docs 1  e.g. tierC-000283

;; ---- slot prevent.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 prevent)    ;; n 1 docs 1  e.g. tierC-000123

;; ---- slot professional_group.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 professional_group)    ;; n 1 docs 1  e.g. tierC-000330

;; ---- slot provincial_capital.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 provincial_capital)    ;; n 1 docs 1  e.g. tierC-000347

;; ---- slot provincial_capital.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 provincial_capital) (Possession $x0 manila))    ;; n 1 docs 1  e.g. tierC-000347

;; ---- slot remain.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 remain) (Before $e0 $e1) (Member $e1 move))    ;; n 1 docs 1  e.g. tierC-000121

;; ---- slot remain.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 remain)    ;; n 1 docs 1  e.g. tierC-000121

;; ---- slot screenplay.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 screenplay)    ;; n 1 docs 1  e.g. tierC-000090

;; ---- slot script.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 script)    ;; n 1 docs 1  e.g. tierC-000089

;; ---- slot series.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 series)    ;; n 1 docs 1  e.g. tierC-000229

;; ---- slot series.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 series)    ;; n 1 docs 1  e.g. tierC-000230

;; ---- slot situate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 situate)    ;; n 1 docs 1  e.g. tierC-000211

;; ---- slot skylight.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 skylight)    ;; n 1 docs 1  e.g. tierA-000346

;; ---- slot social_media.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 social_media)    ;; n 1 docs 1  e.g. tierC-000178

;; ---- slot speaker.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 speaker) (Before $e0 $e1) (Member $e1 speaker))    ;; n 1 docs 1  e.g. tierC-000078

;; ---- slot spokesman.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 spokesman) (Before $e0 $e1) (Member $e1 spokesman))    ;; n 1 docs 1  e.g. tierC-000077

;; ---- slot sporting_activity.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sporting_activity)    ;; n 1 docs 1  e.g. tierC-000147

;; ---- slot sprint.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sprint)    ;; n 1 docs 1  e.g. tierA-000175

;; ---- slot stage.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 stage)    ;; n 1 docs 1  e.g. tierC-000092

;; ---- slot stay.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 stay) (Before $e0 $e1) (Member $e1 move))    ;; n 1 docs 1  e.g. tierC-000122

;; ---- slot stay.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 stay)    ;; n 1 docs 1  e.g. tierC-000122

;; ---- slot stroll.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 stroll)    ;; n 1 docs 1  e.g. tierA-000184

;; ---- slot survive.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 survive)    ;; n 1 docs 1  e.g. tierA-000260

;; ---- slot switch_off.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 switch_off)    ;; n 1 docs 1  e.g. tierC-000316

;; ---- slot tributary.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 tributary)    ;; n 1 docs 1  e.g. tierC-000314

;; ---- slot tributary.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 tributary) (Possession $x0 yunnan))    ;; n 1 docs 1  e.g. tierC-000314

;; ---- slot turn_off.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 turn_off)    ;; n 1 docs 1  e.g. tierC-000315

;; ---- slot usual.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 usual)    ;; n 1 docs 1  e.g. tierC-000135

;; ==================== slot-merge signals (86; ppmi cosine >= 0.5, >= 2 shared informative fillers, slot n >= 3) ====================

;; cross-event  acquire.Agent ~ purchase.Agent  cosine 1.00 (raw 1.00)  support 4  shared: chef depot pottery_studio school
;;   A e.g. tierA-000017 tierA-000003   B e.g. tierA-000016 tierA-000002
(And (Member $e0 acquire) (Agent $e0 $x1))
(And (Member $e0 purchase) (Agent $e0 $x1))

;; cross-event  acquire.Theme ~ purchase.Theme  cosine 1.00 (raw 1.00)  support 4  shared: crate forklift kiln lemon projector
;;   A e.g. tierA-000017 tierA-000003   B e.g. tierA-000016 tierA-000002
(And (Member $e0 acquire) (Theme $e0 $x1))
(And (Member $e0 purchase) (Theme $e0 $x1))

;; cross-event  begin.Agent ~ create.Agent  cosine 1.00 (raw 1.00)  support 4  shared: european_american_settler indigenous_american native_american
;;   A e.g. tierC-000025 tierC-000026   B e.g. tierC-000025 tierC-000026
(And (Member $e0 begin) (Agent $e0 $x1))
(And (Member $e0 create) (Agent $e0 $x1))

;; cross-event  commence.Patient ~ start.Patient  cosine 1.00 (raw 1.00)  support 4  shared: apple_harvest dress_rehearsal hearing shoreline_survey
;;   A e.g. tierA-000069 tierA-000064   B e.g. tierA-000068 tierA-000063
(And (Member $e0 commence) (Patient $e0 $x1))
(And (Member $e0 start) (Patient $e0 $x1))

;; cross-event  commence.Time ~ end.Time  cosine 1.00 (raw 1.00)  support 4  shared: dawn morning
;;   A e.g. tierA-000054 tierA-000059   B e.g. tierA-000056 tierA-000060
(And (Member $e0 commence) (Time $e0 $x1))
(And (Member $e0 end) (Time $e0 $x1))

;; cross-event  commence.Time ~ start.Time  cosine 1.00 (raw 1.00)  support 4  shared: dawn morning
;;   A e.g. tierA-000054 tierA-000059   B e.g. tierA-000053 tierA-000058
(And (Member $e0 commence) (Time $e0 $x1))
(And (Member $e0 start) (Time $e0 $x1))

;; cross-event  end.Time ~ start.Time  cosine 1.00 (raw 1.00)  support 4  shared: dawn morning
;;   A e.g. tierA-000056 tierA-000060   B e.g. tierA-000053 tierA-000058
(And (Member $e0 end) (Time $e0 $x1))
(And (Member $e0 start) (Time $e0 $x1))

;; cross-event  make.Agent ~ reach.Agent  cosine 1.00 (raw 1.00)  support 4  shared: board committee family judge
;;   A e.g. tierA-000202 tierA-000186   B e.g. tierA-000203 tierA-000187
(And (Member $e0 make) (Agent $e0 $x1))
(And (Member $e0 reach) (Agent $e0 $x1))

;; cross-event  abandon.Agent ~ give_up.Agent  cosine 1.00 (raw 0.98)  support 3  shared: climber firm rescue_team
;;   A e.g. tierA-000109 tierA-000111   B e.g. tierA-000110 tierA-000105
(And (Member $e0 abandon) (Agent $e0 $x1))
(And (Member $e0 give_up) (Agent $e0 $x1))

;; cross-event  learn.Theme ~ teach.Theme  cosine 1.00 (raw 0.99)  support 3  shared: drill glazing song
;;   A e.g. tierA-000287 tierA-000282   B e.g. tierA-000286 tierA-000288
(And (Member $e0 learn) (Theme $e0 $x1))
(And (Member $e0 teach) (Theme $e0 $x1))

;; cross-event  need.Theme ~ require.Theme  cosine 1.00 (raw 0.99)  support 3  shared: countersignature egg monthly_servicing
;;   A e.g. tierA-000090 tierA-000085   B e.g. tierA-000089 tierA-000091
(And (Member $e0 need) (Theme $e0 $x1))
(And (Member $e0 require) (Theme $e0 $x1))

;; cross-event  postpone.Agent ~ put_off.Agent  cosine 1.00 (raw 0.98)  support 3  shared: board club ferry
;;   A e.g. tierA-000114 tierA-000116   B e.g. tierA-000115 tierA-000124
(And (Member $e0 postpone) (Agent $e0 $x1))
(And (Member $e0 put_off) (Agent $e0 $x1))

;; cross-event  postpone.Theme ~ put_off.Theme  cosine 1.00 (raw 0.98)  support 3  shared: departure tournament vote
;;   A e.g. tierA-000119 tierA-000122   B e.g. tierA-000120 tierA-000124
(And (Member $e0 postpone) (Theme $e0 $x1))
(And (Member $e0 put_off) (Theme $e0 $x1))

;; cross-event  abandon.Theme ~ give_up.Theme  cosine 1.00 (raw 0.98)  support 3  shared: north_route search tender
;;   A e.g. tierA-000109 tierA-000111   B e.g. tierA-000110 tierA-000100
(And (Member $e0 abandon) (Theme $e0 $x1))
(And (Member $e0 give_up) (Theme $e0 $x1))

;; cross-event  allow.Agent ~ permit.Agent  cosine 1.00 (raw 0.94)  support 3  shared: curator licence warden
;;   A e.g. tierA-000080 tierA-000076   B e.g. tierA-000081 tierA-000077
(And (Member $e0 allow) (Agent $e0 $x1))
(And (Member $e0 permit) (Agent $e0 $x1))

;; cross-event  allow.Theme ~ permit.Theme  cosine 1.00 (raw 0.94)  support 3  shared: night_delivery photography visitor
;;   A e.g. tierA-000076 tierA-000078   B e.g. tierA-000077 tierA-000081
(And (Member $e0 allow) (Theme $e0 $x1))
(And (Member $e0 permit) (Theme $e0 $x1))

;; cross-event  begin.Patient ~ commence.Patient  cosine 0.99 (raw 0.97)  support 4  shared: apple_harvest dress_rehearsal hearing shoreline_survey
;;   A e.g. tierA-000067 tierA-000070   B e.g. tierA-000069 tierA-000064
(And (Member $e0 begin) (Patient $e0 $x1))
(And (Member $e0 commence) (Patient $e0 $x1))

;; cross-event  begin.Patient ~ start.Patient  cosine 0.99 (raw 0.97)  support 4  shared: apple_harvest dress_rehearsal hearing shoreline_survey
;;   A e.g. tierA-000067 tierA-000070   B e.g. tierA-000068 tierA-000063
(And (Member $e0 begin) (Patient $e0 $x1))
(And (Member $e0 start) (Patient $e0 $x1))

;; cross-event  need.Holder ~ require.Holder  cosine 0.96 (raw 0.98)  support 3  shared: lathe permit recipe
;;   A e.g. tierA-000095 tierA-000090   B e.g. tierA-000094 tierA-000096
(And (Member $e0 need) (Holder $e0 $x1))
(And (Member $e0 require) (Holder $e0 $x1))

;; cross-event  begin.Time ~ commence.Time  cosine 0.95 (raw 0.95)  support 4  shared: dawn morning
;;   A e.g. tierA-000052 tierA-000055   B e.g. tierA-000054 tierA-000059
(And (Member $e0 begin) (Time $e0 $x1))
(And (Member $e0 commence) (Time $e0 $x1))

;; cross-event  begin.Time ~ end.Time  cosine 0.95 (raw 0.95)  support 4  shared: dawn morning
;;   A e.g. tierA-000052 tierA-000055   B e.g. tierA-000056 tierA-000060
(And (Member $e0 begin) (Time $e0 $x1))
(And (Member $e0 end) (Time $e0 $x1))

;; cross-event  begin.Time ~ start.Time  cosine 0.95 (raw 0.95)  support 4  shared: dawn morning
;;   A e.g. tierA-000052 tierA-000055   B e.g. tierA-000053 tierA-000058
(And (Member $e0 begin) (Time $e0 $x1))
(And (Member $e0 start) (Time $e0 $x1))

;; cross-event  call_off.Agent ~ cancel.Agent  cosine 0.95 (raw 0.96)  support 3  shared: airline council tutor
;;   A e.g. tierA-000144 tierA-000149   B e.g. tierA-000143 tierA-000145
(And (Member $e0 call_off) (Agent $e0 $x1))
(And (Member $e0 cancel) (Agent $e0 $x1))

;; cross-event  decide.Theme ~ decision.Theme  cosine 0.85 (raw 0.96)  support 8  shared: budget case new roof
;;   A e.g. tierA-000201 tierA-000204   B e.g. tierA-000202 tierA-000203
(And (Member $e0 decide) (Theme $e0 $x1))
(And (Member $e0 decision) (Theme $e0 $x1))

;; cross-event  commence.Patient ~ end.Patient  cosine 0.85 (raw 0.87)  support 3  shared: apple_harvest hearing shoreline_survey
;;   A e.g. tierA-000069 tierA-000059   B e.g. tierA-000071 tierA-000060
(And (Member $e0 commence) (Patient $e0 $x1))
(And (Member $e0 end) (Patient $e0 $x1))

;; cross-event  end.Patient ~ start.Patient  cosine 0.85 (raw 0.87)  support 3  shared: apple_harvest hearing shoreline_survey
;;   A e.g. tierA-000071 tierA-000060   B e.g. tierA-000068 tierA-000058
(And (Member $e0 end) (Patient $e0 $x1))
(And (Member $e0 start) (Patient $e0 $x1))

;; cross-event  begin.Patient ~ end.Patient  cosine 0.82 (raw 0.80)  support 3  shared: apple_harvest hearing shoreline_survey
;;   A e.g. tierA-000067 tierA-000070   B e.g. tierA-000071 tierA-000060
(And (Member $e0 begin) (Patient $e0 $x1))
(And (Member $e0 end) (Patient $e0 $x1))

;; cross-event  borrow.Theme ~ lend.Theme  cosine 0.81 (raw 0.65)  support 5  shared: generator ladder painting
;;   A e.g. tierA-000302 tierA-000297   B e.g. tierA-000301 tierA-000303
(And (Member $e0 borrow) (Theme $e0 $x1))
(And (Member $e0 lend) (Theme $e0 $x1))

;; cross-event  acquire.Theme ~ sell.Theme  cosine 0.80 (raw 0.68)  support 4  shared: crate forklift kiln lemon projector
;;   A e.g. tierA-000017 tierA-000003   B e.g. tierA-000018 tierA-000004
(And (Member $e0 acquire) (Theme $e0 $x1))
(And (Member $e0 sell) (Theme $e0 $x1))

;; cross-event  purchase.Theme ~ sell.Theme  cosine 0.80 (raw 0.68)  support 4  shared: crate forklift kiln lemon projector
;;   A e.g. tierA-000016 tierA-000002   B e.g. tierA-000018 tierA-000004
(And (Member $e0 purchase) (Theme $e0 $x1))
(And (Member $e0 sell) (Theme $e0 $x1))

;; cross-event  portray.Agent ~ win.Agent  cosine 0.77 (raw 0.82)  support 4  shared: james_woods wilson
;;   A e.g. tierC-000301 tierC-000302   B e.g. tierC-000277 tierC-000278
(And (Member $e0 portray) (Agent $e0 $x1))
(And (Member $e0 win) (Agent $e0 $x1))

;; cross-event  examine.Agent ~ order.Agent  cosine 0.72 (raw 0.91)  support 3  shared: doctor physician
;;   A e.g. tierA-000381 tierA-000380   B e.g. tierA-000386 tierA-000385
(And (Member $e0 examine) (Agent $e0 $x1))
(And (Member $e0 order) (Agent $e0 $x1))

;; cross-event  examine.Agent ~ sign.Agent  cosine 0.72 (raw 0.91)  support 3  shared: doctor physician
;;   A e.g. tierA-000381 tierA-000380   B e.g. tierA-000376 tierA-000375
(And (Member $e0 examine) (Agent $e0 $x1))
(And (Member $e0 sign) (Agent $e0 $x1))

;; cross-event  cause.Agent ~ destroy.Agent  cosine 0.72 (raw 0.93)  support 3  shared: fire flood storm
;;   A e.g. tierA-000228 tierA-000233   B e.g. tierA-000227 tierA-000229
(And (Member $e0 cause) (Agent $e0 $x1))
(And (Member $e0 destroy) (Agent $e0 $x1))

;; cross-event  reject.Agent ~ turn_down.Agent  cosine 0.72 (raw 0.93)  support 3  shared: bank editor panel
;;   A e.g. tierA-000163 tierA-000165   B e.g. tierA-000164 tierA-000159
(And (Member $e0 reject) (Agent $e0 $x1))
(And (Member $e0 turn_down) (Agent $e0 $x1))

;; cross-event  decide.Agent ~ make.Agent  cosine 0.72 (raw 0.90)  support 4  shared: board committee family judge
;;   A e.g. tierA-000201 tierA-000204   B e.g. tierA-000202 tierA-000186
(And (Member $e0 decide) (Agent $e0 $x1))
(And (Member $e0 make) (Agent $e0 $x1))

;; cross-event  decide.Agent ~ reach.Agent  cosine 0.72 (raw 0.90)  support 4  shared: board committee family judge
;;   A e.g. tierA-000201 tierA-000204   B e.g. tierA-000203 tierA-000187
(And (Member $e0 decide) (Agent $e0 $x1))
(And (Member $e0 reach) (Agent $e0 $x1))

;; cross-event  reject.Theme ~ turn_down.Theme  cosine 0.72 (raw 0.93)  support 3  shared: loan_application manuscript proposal
;;   A e.g. tierA-000163 tierA-000165   B e.g. tierA-000164 tierA-000159
(And (Member $e0 reject) (Theme $e0 $x1))
(And (Member $e0 turn_down) (Theme $e0 $x1))

;; cross-event  acquire.Theme ~ buy.Theme  cosine 0.70 (raw 0.94)  support 4  shared: crate forklift kiln lemon projector
;;   A e.g. tierA-000017 tierA-000003   B e.g. tierA-000015 tierA-000019
(And (Member $e0 acquire) (Theme $e0 $x1))
(And (Member $e0 buy) (Theme $e0 $x1))

;; cross-event  buy.Theme ~ purchase.Theme  cosine 0.70 (raw 0.94)  support 4  shared: crate forklift kiln lemon projector
;;   A e.g. tierA-000015 tierA-000019   B e.g. tierA-000016 tierA-000002
(And (Member $e0 buy) (Theme $e0 $x1))
(And (Member $e0 purchase) (Theme $e0 $x1))

;; cross-event  give.Theme ~ receive.Theme  cosine 0.69 (raw 0.57)  support 5  shared: manifest medal whistle
;;   A e.g. tierA-000271 tierA-000273   B e.g. tierA-000272 tierA-000277
(And (Member $e0 give) (Theme $e0 $x1))
(And (Member $e0 receive) (Theme $e0 $x1))

;; cross-event  take.Agent ~ walk.Agent  cosine 0.66 (raw 0.51)  support 5  shared: child nurse shepherd
;;   A e.g. tierA-000182 tierA-000178   B e.g. tierA-000181 tierA-000177
(And (Member $e0 take) (Agent $e0 $x1))
(And (Member $e0 walk) (Agent $e0 $x1))

;; cross-event  follow.Theme ~ succeed.Theme  cosine 0.63 (raw 0.47)  support 3  shared: henry_cole margaret
;;   A e.g. tierC-000337 tierC-000076   B e.g. tierC-000338 tierC-000075
(And (Member $e0 follow) (Theme $e0 $x1))
(And (Member $e0 succeed) (Theme $e0 $x1))

;; cross-event  acquire.Agent ~ buy.Agent  cosine 0.62 (raw 0.95)  support 4  shared: chef depot pottery_studio school
;;   A e.g. tierA-000017 tierA-000003   B e.g. tierA-000015 tierA-000019
(And (Member $e0 acquire) (Agent $e0 $x1))
(And (Member $e0 buy) (Agent $e0 $x1))

;; cross-event  buy.Agent ~ purchase.Agent  cosine 0.62 (raw 0.95)  support 4  shared: chef depot pottery_studio school
;;   A e.g. tierA-000015 tierA-000019   B e.g. tierA-000016 tierA-000002
(And (Member $e0 buy) (Agent $e0 $x1))
(And (Member $e0 purchase) (Agent $e0 $x1))

;; cross-event  accompany.Agent ~ appear.Agent  cosine 0.61 (raw 0.78)  support 4  shared: person sister
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000049 tierC-000050
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; cross-event  direct.Patient ~ produce.Patient  cosine 0.61 (raw 0.41)  support 5  shared: film movie syrian
;;   A e.g. tierC-000010 tierC-000091   B e.g. tierC-000009 tierC-000092
(And (Member $e0 direct) (Patient $e0 $x1))
(And (Member $e0 produce) (Patient $e0 $x1))

;; cross-event  buy.Theme ~ sell.Theme  cosine 0.56 (raw 0.65)  support 6  shared: crate forklift kiln lemon projector
;;   A e.g. tierA-000015 tierA-000019   B e.g. tierA-000018 tierA-000004
(And (Member $e0 buy) (Theme $e0 $x1))
(And (Member $e0 sell) (Theme $e0 $x1))

;; cross-event  follow.Agent ~ succeed.Agent  cosine 0.53 (raw 0.58)  support 3  shared: alexander bailey
;;   A e.g. tierC-000076 tierC-000337   B e.g. tierC-000075 tierC-000338
(And (Member $e0 follow) (Agent $e0 $x1))
(And (Member $e0 succeed) (Agent $e0 $x1))

;; cross-event  order.Agent ~ sign.Agent  cosine 0.53 (raw 0.83)  support 4  shared: doctor physician
;;   A e.g. tierA-000386 tierA-000385   B e.g. tierA-000376 tierA-000375
(And (Member $e0 order) (Agent $e0 $x1))
(And (Member $e0 sign) (Agent $e0 $x1))

;; cross-role  repair.Agent ~ repair.Patient  cosine 0.97 (raw 0.83)  support 8  shared: cracked crew electrician feed_pipe gearbox mechanic
;;   A e.g. tierA-000051 tierA-000049   B e.g. tierA-000039 tierA-000029
(And (Member $e0 repair) (Agent $e0 $x1))
(And (Member $e0 repair) (Patient $e0 $x1))

;; cross-role  sign.Agent ~ sign.Patient  cosine 0.83 (raw 0.65)  support 4  shared: chart physician
;;   A e.g. tierA-000378 tierA-000375   B e.g. tierA-000376 tierA-000377
(And (Member $e0 sign) (Agent $e0 $x1))
(And (Member $e0 sign) (Patient $e0 $x1))

;; cross-role  order.Agent ~ order.Theme  cosine 0.83 (raw 0.65)  support 4  shared: physician scan
;;   A e.g. tierA-000385 tierA-000387   B e.g. tierA-000389 tierA-000386
(And (Member $e0 order) (Agent $e0 $x1))
(And (Member $e0 order) (Theme $e0 $x1))

;; cross-role  reject.Agent ~ reject.Theme  cosine 0.83 (raw 0.57)  support 8  shared: bank editor loan_application manuscript
;;   A e.g. tierA-000163 tierA-000165   B e.g. tierA-000166 tierA-000162
(And (Member $e0 reject) (Agent $e0 $x1))
(And (Member $e0 reject) (Theme $e0 $x1))

;; cross-role  destroy.Agent ~ destroy.Patient  cosine 0.81 (raw 0.50)  support 8  shared: archive fire greenhouse storm
;;   A e.g. tierA-000230 tierA-000227   B e.g. tierA-000228 tierA-000229
(And (Member $e0 destroy) (Agent $e0 $x1))
(And (Member $e0 destroy) (Patient $e0 $x1))

;; cross-role  answer.Agent ~ answer.Theme  cosine 0.80 (raw 0.42)  support 10  shared: caller clerk query vet
;;   A e.g. tierA-000221 tierA-000207   B e.g. tierA-000217 tierA-000219
(And (Member $e0 answer) (Agent $e0 $x1))
(And (Member $e0 answer) (Theme $e0 $x1))

;; cross-role  teach.Agent ~ teach.Recipient  cosine 0.78 (raw 0.42)  support 10  shared: apprentice coach potter squad
;;   A e.g. tierA-000285 tierA-000286   B e.g. tierA-000281 tierA-000283
(And (Member $e0 teach) (Agent $e0 $x1))
(And (Member $e0 teach) (Recipient $e0 $x1))

;; cross-role  lend.Agent ~ lend.Recipient  cosine 0.74 (raw 0.42)  support 10  shared: crew depot neighbour ravi
;;   A e.g. tierA-000304 tierA-000301   B e.g. tierA-000303 tierA-000300
(And (Member $e0 lend) (Agent $e0 $x1))
(And (Member $e0 lend) (Recipient $e0 $x1))

;; cross-role  form.Agent ~ form.Patient  cosine 0.67 (raw 0.21)  support 4  shared: complex simple technetium
;;   A e.g. tierC-000164 tierC-000163   B e.g. tierC-000179 tierC-000180
(And (Member $e0 form) (Agent $e0 $x1))
(And (Member $e0 form) (Patient $e0 $x1))

;; cross-role  portray.Agent ~ portray.Theme  cosine 0.63 (raw 0.67)  support 6  shared: james_woods wilson
;;   A e.g. tierC-000301 tierC-000302   B e.g. tierC-000277 tierC-000278
(And (Member $e0 portray) (Agent $e0 $x1))
(And (Member $e0 portray) (Theme $e0 $x1))

;; cross-role  walk.Agent ~ walk.Goal  cosine 0.60 (raw 0.60)  support 3  shared: child pier
;;   A e.g. tierA-000181 tierA-000183   B e.g. tierA-000182 tierA-000183
(And (Member $e0 walk) (Agent $e0 $x1))
(And (Member $e0 walk) (Goal $e0 $x1))

;; cross-role  work.Agent ~ work.CoAgent  cosine 0.60 (raw 0.32)  support 7  shared: bo fitter nils ranger
;;   A e.g. tierA-000312 tierA-000316   B e.g. tierA-000311 tierA-000313
(And (Member $e0 work) (Agent $e0 $x1))
(And (Member $e0 work) (CoAgent $e0 $x1))

;; cross-role  walk.Agent ~ walk.Location  cosine 0.57 (raw 0.45)  support 5  shared: nurse ward
;;   A e.g. tierA-000177 tierA-000180   B e.g. tierA-000178 tierA-000173
(And (Member $e0 walk) (Agent $e0 $x1))
(And (Member $e0 walk) (Location $e0 $x1))

;; cross-role  discover.Agent ~ discover.Theme  cosine 0.53 (raw 0.32)  support 7  shared: diver wreck
;;   A e.g. tierA-000133 tierA-000135   B e.g. tierA-000136 tierA-000137
(And (Member $e0 discover) (Agent $e0 $x1))
(And (Member $e0 discover) (Theme $e0 $x1))

;; cross-both  block.Agent ~ wait.Experiencer  cosine 1.00 (raw 0.99)  support 3  shared: automobile car
;;   A e.g. tierA-000390 tierA-000392   B e.g. tierA-000395 tierA-000397
(And (Member $e0 block) (Agent $e0 $x1))
(And (Member $e0 wait) (Experiencer $e0 $x1))

;; cross-both  acquire.Agent ~ sell.Recipient  cosine 0.99 (raw 1.00)  support 4  shared: chef depot pottery_studio school
;;   A e.g. tierA-000017 tierA-000003   B e.g. tierA-000018 tierA-000004
(And (Member $e0 acquire) (Agent $e0 $x1))
(And (Member $e0 sell) (Recipient $e0 $x1))

;; cross-both  purchase.Agent ~ sell.Recipient  cosine 0.99 (raw 1.00)  support 4  shared: chef depot pottery_studio school
;;   A e.g. tierA-000016 tierA-000002   B e.g. tierA-000018 tierA-000004
(And (Member $e0 purchase) (Agent $e0 $x1))
(And (Member $e0 sell) (Recipient $e0 $x1))

;; cross-both  borrow.Agent ~ lend.Recipient  cosine 0.83 (raw 0.94)  support 3  shared: crew gallery ravi
;;   A e.g. tierA-000302 tierA-000307   B e.g. tierA-000301 tierA-000303
(And (Member $e0 borrow) (Agent $e0 $x1))
(And (Member $e0 lend) (Recipient $e0 $x1))

;; cross-both  learn.Source ~ teach.Agent  cosine 0.83 (raw 0.94)  support 3  shared: coach elder potter
;;   A e.g. tierA-000287 tierA-000292   B e.g. tierA-000286 tierA-000288
(And (Member $e0 learn) (Source $e0 $x1))
(And (Member $e0 teach) (Agent $e0 $x1))

;; cross-both  portray.Theme ~ win.Agent  cosine 0.82 (raw 0.82)  support 4  shared: james_woods wilson
;;   A e.g. tierC-000277 tierC-000278   B e.g. tierC-000301 tierC-000302
(And (Member $e0 portray) (Theme $e0 $x1))
(And (Member $e0 win) (Agent $e0 $x1))

;; cross-both  borrow.Source ~ lend.Agent  cosine 0.81 (raw 0.94)  support 3  shared: depot museum neighbour
;;   A e.g. tierA-000302 tierA-000307   B e.g. tierA-000301 tierA-000303
(And (Member $e0 borrow) (Source $e0 $x1))
(And (Member $e0 lend) (Agent $e0 $x1))

;; cross-both  learn.Agent ~ teach.Recipient  cosine 0.77 (raw 0.94)  support 3  shared: apprentice child squad
;;   A e.g. tierA-000282 tierA-000292   B e.g. tierA-000281 tierA-000283
(And (Member $e0 learn) (Agent $e0 $x1))
(And (Member $e0 teach) (Recipient $e0 $x1))

;; cross-both  give.Agent ~ receive.Source  cosine 0.74 (raw 0.91)  support 3  shared: foreman school trainer
;;   A e.g. tierA-000271 tierA-000273   B e.g. tierA-000272 tierA-000277
(And (Member $e0 give) (Agent $e0 $x1))
(And (Member $e0 receive) (Source $e0 $x1))

;; cross-both  acquire.Theme ~ buy.Agent  cosine 0.71 (raw 0.23)  support 4  shared: crate forklift kiln lemon
;;   A e.g. tierA-000017 tierA-000003   B e.g. tierA-000021 tierA-000006
(And (Member $e0 acquire) (Theme $e0 $x1))
(And (Member $e0 buy) (Agent $e0 $x1))

;; cross-both  buy.Agent ~ purchase.Theme  cosine 0.71 (raw 0.23)  support 4  shared: crate forklift kiln lemon
;;   A e.g. tierA-000021 tierA-000006   B e.g. tierA-000016 tierA-000002
(And (Member $e0 buy) (Agent $e0 $x1))
(And (Member $e0 purchase) (Theme $e0 $x1))

;; cross-both  give.Recipient ~ receive.Agent  cosine 0.65 (raw 0.91)  support 3  shared: driver recruit winner
;;   A e.g. tierA-000271 tierA-000273   B e.g. tierA-000272 tierA-000262
(And (Member $e0 give) (Recipient $e0 $x1))
(And (Member $e0 receive) (Agent $e0 $x1))

;; cross-both  acquire.Agent ~ buy.Theme  cosine 0.64 (raw 0.27)  support 4  shared: chef depot pottery_studio
;;   A e.g. tierA-000017 tierA-000003   B e.g. tierA-000021 tierA-000006
(And (Member $e0 acquire) (Agent $e0 $x1))
(And (Member $e0 buy) (Theme $e0 $x1))

;; cross-both  buy.Theme ~ purchase.Agent  cosine 0.64 (raw 0.27)  support 4  shared: chef depot pottery_studio
;;   A e.g. tierA-000021 tierA-000006   B e.g. tierA-000016 tierA-000002
(And (Member $e0 buy) (Theme $e0 $x1))
(And (Member $e0 purchase) (Agent $e0 $x1))

;; cross-both  buy.Agent ~ sell.Recipient  cosine 0.61 (raw 0.95)  support 4  shared: chef depot pottery_studio school
;;   A e.g. tierA-000015 tierA-000019   B e.g. tierA-000018 tierA-000004
(And (Member $e0 buy) (Agent $e0 $x1))
(And (Member $e0 sell) (Recipient $e0 $x1))

;; cross-both  buy.Theme ~ sell.Recipient  cosine 0.59 (raw 0.27)  support 4  shared: chef depot pottery_studio
;;   A e.g. tierA-000021 tierA-000006   B e.g. tierA-000018 tierA-000004
(And (Member $e0 buy) (Theme $e0 $x1))
(And (Member $e0 sell) (Recipient $e0 $x1))

;; cross-both  reject.Theme ~ turn_down.Agent  cosine 0.57 (raw 0.31)  support 3  shared: bank editor
;;   A e.g. tierA-000166 tierA-000162   B e.g. tierA-000164 tierA-000159
(And (Member $e0 reject) (Theme $e0 $x1))
(And (Member $e0 turn_down) (Agent $e0 $x1))

;; cross-both  reject.Agent ~ turn_down.Theme  cosine 0.57 (raw 0.31)  support 3  shared: loan_application manuscript
;;   A e.g. tierA-000166 tierA-000162   B e.g. tierA-000164 tierA-000159
(And (Member $e0 reject) (Agent $e0 $x1))
(And (Member $e0 turn_down) (Theme $e0 $x1))

;; cross-both  buy.Agent ~ sell.Theme  cosine 0.56 (raw 0.16)  support 6  shared: crate forklift kiln lemon
;;   A e.g. tierA-000021 tierA-000006   B e.g. tierA-000018 tierA-000004
(And (Member $e0 buy) (Agent $e0 $x1))
(And (Member $e0 sell) (Theme $e0 $x1))

;; cross-both  cause.Agent ~ destroy.Patient  cosine 0.52 (raw 0.21)  support 3  shared: fire storm
;;   A e.g. tierA-000228 tierA-000223   B e.g. tierA-000230 tierA-000226
(And (Member $e0 cause) (Agent $e0 $x1))
(And (Member $e0 destroy) (Patient $e0 $x1))

;; cross-both  learn.Source ~ teach.Recipient  cosine 0.52 (raw 0.24)  support 3  shared: coach potter
;;   A e.g. tierA-000287 tierA-000282   B e.g. tierA-000289 tierA-000285
(And (Member $e0 learn) (Source $e0 $x1))
(And (Member $e0 teach) (Recipient $e0 $x1))

;; cross-both  answer.Theme ~ give.Recipient  cosine 0.51 (raw 0.32)  support 10  shared: caller query tower
;;   A e.g. tierA-000217 tierA-000219   B e.g. tierA-000218 tierA-000208
(And (Member $e0 answer) (Theme $e0 $x1))
(And (Member $e0 give) (Recipient $e0 $x1))

;; ==================== #23 flip witnesses, candidate-eligible (3; prompt-undetermined classes, ENTITY fillers) ====================
;; PROVISIONAL role-canonicalization candidates, minority -> majority role (tie -> Patient);
;; NOT rules: build_candidates carries them to the gauntlet (role-bridge card, same_relation
;; question, prompt_side_evidence filing). Witnesses: A under Theme | B under Patient.

;; become  Theme 2 / Patient 5  shared: —  witnesses: tierC-000237|tierC-000001 tierC-000237|tierC-000238 tierC-000237|tierC-000241
(Implication (And (Member $e become) (Theme $e $x)) (And (Member $e become) (Patient $e $x)))

;; avoid  Theme 1 / Patient 1  shared: —  witnesses: tierA-000401|tierC-000124
(Implication (And (Member $e avoid) (Theme $e $x)) (And (Member $e avoid) (Patient $e $x)))

;; conduct  Theme 2 / Patient 1  shared: —  witnesses: tierC-000341|tierC-000284 tierC-000342|tierC-000284
(Implication (And (Member $e conduct) (Patient $e $x)) (And (Member $e conduct) (Theme $e $x)))

;; ==================== D.3 diagnostics (8; parse-error path, never candidates) ====================
;; {"determined_role": "Patient", "determined_since": "f6448eac", "event_class": "cancel", "eventive": {"Patient": 0, "Theme": 0}, "examples": {"Patient": ["tierA-000145", "tierA-000148", "tierA-000150"], "Theme": ["tierA-000143", "tierA-000388"]}, "patient_n": 7, "route": "parse-error (D.3: prompt-determined class)", "shared_fillers": ["evening_flight"], "theme_n": 2, "witness_pairs": ["tierA-000143|tierA-000145", "tierA-000143|tierA-000148", "tierA-000143|tierA-000150"]}
;; {"determined_role": "Patient", "determined_since": "f6448eac", "event_class": "call_off", "eventive": {"Patient": 0, "Theme": 0}, "examples": {"Patient": ["tierA-000149", "tierA-000154"], "Theme": ["tierA-000144"]}, "patient_n": 2, "route": "parse-error (D.3: prompt-determined class)", "shared_fillers": [], "theme_n": 1, "witness_pairs": ["tierA-000144|tierA-000149", "tierA-000144|tierA-000154"]}
;; {"determined_role": "Patient", "determined_since": "f6448eac", "event_class": "postpone", "examples": ["tierA-000114", "tierA-000116", "tierA-000119"], "fillers": {"departure": {"entity": 2}, "tournament": {"entity": 3}, "vote": {"entity": 2}}, "forbidden_role": "Theme", "n": 7, "route": "parse-error (D.3: prompt-determined class)"}
;; {"determined_role": "Patient", "determined_since": "f6448eac", "event_class": "put_off", "examples": ["tierA-000115", "tierA-000120", "tierA-000124"], "fillers": {"departure": {"entity": 1}, "tournament": {"entity": 1}, "vote": {"entity": 1}}, "forbidden_role": "Theme", "n": 3, "route": "parse-error (D.3: prompt-determined class)"}
;; {"determined_role": "Patient", "determined_since": "f6448eac", "event_class": "cancel", "examples": ["tierA-000143", "tierA-000388"], "fillers": {"evening_flight": {"entity": 1}, "scan": {"entity": 1}}, "forbidden_role": "Theme", "n": 2, "route": "parse-error (D.3: prompt-determined class)"}
;; {"determined_role": "Theme", "determined_since": "f6448eac", "event_class": "move", "examples": ["tierC-000197", "tierC-000198"], "fillers": {"headquarters": {"entity": 2}}, "forbidden_role": "Patient", "n": 2, "route": "parse-error (D.3: prompt-determined class)"}
;; {"determined_role": "Patient", "determined_since": "f6448eac", "event_class": "call_off", "examples": ["tierA-000144"], "fillers": {"evening_flight": {"entity": 1}}, "forbidden_role": "Theme", "n": 1, "route": "parse-error (D.3: prompt-determined class)"}
;; {"class_a": "buy", "class_b": "buy", "cosine": 0.88, "cosine_raw": 0.458, "determined_role": "Theme", "determined_since": "f6448eac", "examples_a": ["tierA-000015", "tierA-000019"], "examples_b": ["tierA-000021", "tierA-000006"], "n_a": 14, "n_b": 14, "role_a": "Agent", "role_b": "Theme", "shared_fillers": ["chef", "crate", "depot", "forklift", "kiln", "lemon", "pottery_studio"], "slot_a": "buy.Agent", "slot_b": "buy.Theme"}
