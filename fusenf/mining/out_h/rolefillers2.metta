;; FUSE-NF §4.3.2 role-filler distributions — readable MeTTa RENDERING (never loaded:
;; a slot valuation is a conjunctive query over variables, not an assertion).
;; 1729 event-role slots + 2343 other slots from valuations_slots.jsonl (the §4.3.1 valuation
;; export); weighting ppmi, min_n 3, cos 0.5; pinned prompt 2ed18b93,
;; D.3 table 59 verbs. A slot = center class × head, one line per filler:
;; $e0/$x0 = the event/entity center, $e1/$x1/$f1 = a skolem filler (its own kind picks the
;; letter), a bare symbol = a constant filler, <num>/<str>/<term:X> = literal wildcards as in
;; patterns2.metta. Sorted by slot n desc. slots*.jsonl / flip_eligible.jsonl are the record of truth.

;; ==================== event-role slots (1729) ====================

;; ---- slot have.Holder  [event center; head role]  n 44  docs<= 46  distinct 40  eventive 1
(And (Member $e0 have) (Holder $e0 kristoffer))    ;; n 4 docs 4  e.g. tierC-000181 tierC-000182
(And (Member $e0 have) (Holder $e0 karen))    ;; n 2 docs 2  e.g. tierC-000182 tierC-000239
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierC-000271 tierC-000272
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 town))    ;; n 2 docs 2  e.g. tierB-000408 tierB-001348
(And (Member $e0 have) (Holder $e0 algiers))    ;; n 1 docs 1  e.g. tierB-000333
(And (Member $e0 have) (Holder $e0 boldi))    ;; n 1 docs 1  e.g. tierB-000162
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 creature))    ;; n 1 docs 1  e.g. tierB-001412
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 decision))    ;; n 1 docs 1  e.g. tierB-001797
(And (Member $e0 have) (Holder $e0 diego))    ;; n 1 docs 1  e.g. tierB-001216
(And (Member $e0 have) (Holder $e0 february))    ;; n 1 docs 1  e.g. tierB-001553
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 food))    ;; n 1 docs 1  e.g. tierB-001103
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 gas_station))    ;; n 1 docs 1  e.g. tierB-000797
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 homentropic_current))    ;; n 1 docs 1  e.g. tierC-000154
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 homentropic_flow))    ;; n 1 docs 1  e.g. tierC-000153
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 hotel))    ;; n 1 docs 1  e.g. tierB-001043
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 house))    ;; n 1 docs 1  e.g. tierB-001016
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 insurance))    ;; n 1 docs 1  e.g. tierB-001758
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 ivy))    ;; n 1 docs 1  e.g. tierB-001929
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 lawyer))    ;; n 1 docs 1  e.g. tierB-000492
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 library))    ;; n 1 docs 1  e.g. tierB-000931
(And (Member $e0 have) (Holder $e0 miroslav))    ;; n 1 docs 1  e.g. tierB-000855
(And (Member $e0 have) (Holder $e0 morocco))    ;; n 1 docs 1  e.g. tierB-000819
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 movie))    ;; n 1 docs 1  e.g. tierB-001555
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 ocean))    ;; n 1 docs 1  e.g. tierB-000722
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 place))    ;; n 1 docs 1  e.g. tierB-000494
(And (Member $e0 have) (Holder $e0 rasputin))    ;; n 1 docs 1  e.g. tierB-001861
(And (Member $e0 have) (Holder $e0 $e1) (Member $e1 repeat))    ;; n 1 docs 1  e.g. tierB-001804
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 room))    ;; n 1 docs 1  e.g. tierB-001264
(And (Member $e0 have) (Holder $e0 scotland))    ;; n 1 docs 1  e.g. tierB-000902
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 sentence))    ;; n 1 docs 1  e.g. tierB-000142
(And (Member $e0 have) (Holder $e0 thomas))    ;; n 1 docs 1  e.g. tierB-000358
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 tower))    ;; n 1 docs 1  e.g. tierB-001919
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 tuareg))    ;; n 1 docs 1  e.g. tierB-001467
(And (Member $e0 have) (Holder $e0 wilson))    ;; n 1 docs 1  e.g. tierB-000730
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 word_processor))    ;; n 1 docs 1  e.g. tierB-001177
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 writer))    ;; n 1 docs 1  e.g. tierB-000926
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 bad))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000790
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 mosque))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000665
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 old))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000665
(And (Member $e0 have) (Holder $e0 $x1) (Member $x1 weather))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000790

;; ---- slot have.Theme  [event center; head role]  n 43  docs<= 66  distinct 59  eventive 1
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 child))    ;; n 4 docs 4  e.g. tierC-000181 tierC-000182
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 antler))    ;; n 1 docs 1  e.g. tierB-001412
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 beauty_salon))    ;; n 1 docs 1  e.g. tierB-000333
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 cemetery))    ;; n 1 docs 1  e.g. tierB-001348
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 chance))    ;; n 1 docs 1  e.g. tierB-000730
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 color))    ;; n 1 docs 1  e.g. tierB-000722
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 day))    ;; n 1 docs 1  e.g. tierB-001553
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 effect))    ;; n 1 docs 1  e.g. tierB-000790
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 friend))    ;; n 1 docs 1  e.g. tierB-000066
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 gas_pump))    ;; n 1 docs 1  e.g. tierB-000797
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 guard))    ;; n 1 docs 1  e.g. tierB-000494
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 herd))    ;; n 1 docs 1  e.g. tierB-001467
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 leaf))    ;; n 1 docs 1  e.g. tierB-001929
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 meaning))    ;; n 1 docs 1  e.g. tierB-000142
(And (Member $e0 have) (Theme $e0 representation))    ;; n 1 docs 1  e.g. tierC-000272
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 representation))    ;; n 1 docs 1  e.g. tierC-000271
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 reputation))    ;; n 1 docs 1  e.g. tierB-000492
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 right))    ;; n 1 docs 1  e.g. tierB-000902
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000162
(And (Member $e0 have) (Theme $e0 $e1) (Member $e1 thought))    ;; n 1 docs 1  e.g. tierB-001216
(And (Member $e0 have) (Theme $e0 value))    ;; n 1 docs 1  e.g. tierB-001804
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 constant))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000153 tierC-000154
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 entropy))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000153 tierC-000154
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 uniform))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000153 tierC-000154
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 atmosphere))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001043
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 beautiful))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001016
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 blue))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001264
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 conical))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001919
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 curtain))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001264
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 deductible))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001758
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 dream))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000855
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 eerie))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000665
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 feeling))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000665
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 garden))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001016
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 high))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001758
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 history))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000408
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 homely))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001043
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 internal_politics))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000819
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 intriguing))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000819
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 nasty))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000358
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 nice))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001103
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 parenthetic))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000926
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 personality))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000358
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 plot))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001555
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 predictable))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001555
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 purpose))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001177
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 rich))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000408
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 roof))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001919
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 single))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001177
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 soul_piercing))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001861
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 stare))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001861
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 style))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000926
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 taste))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001103
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 weird))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000855
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 bank))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000931
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 consequence))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001797
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 document))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000931
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 serious))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001797
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 valuable))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000931
(And (Member $e0 have) (Theme $e0 $x1) (Member $x1 wide))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001797

;; ---- slot use.Theme  [event center; head role]  n 23  docs<= 26  distinct 23  eventive 1
(And (Member $e0 use) (Theme $e0 auto_tune))    ;; n 1 docs 1  e.g. tierB-000850
(And (Member $e0 use) (Theme $e0 banach_mackey_topology))    ;; n 1 docs 1  e.g. tierC-000006
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 banach_mackey_topology))    ;; n 1 docs 1  e.g. tierC-000005
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 chemical_agent))    ;; n 1 docs 1  e.g. tierB-001431
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 current))    ;; n 2 (mass 1) docs 2  e.g. tierC-000173 tierC-000174
(And (Member $e0 use) (Theme $e0 fire))    ;; n 1 docs 1  e.g. tierB-001304
(And (Member $e0 use) (Theme $e0 iga))    ;; n 1 docs 1  e.g. tierB-001314
(And (Member $e0 use) (Theme $e0 jingle))    ;; n 1 docs 1  e.g. tierB-000282
(And (Member $e0 use) (Theme $e0 laravel))    ;; n 1 docs 1  e.g. tierB-000404
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 machine))    ;; n 1 docs 1  e.g. tierB-000938
(And (Member $e0 use) (Theme $e0 $e1) (Member $e1 metaphor))    ;; n 1 docs 1  e.g. tierB-001884
(And (Member $e0 use) (Theme $e0 midway))    ;; n 1 docs 1  e.g. tierB-000908
(And (Member $e0 use) (Theme $e0 paramilitary_group))    ;; n 1 docs 1  e.g. tierB-001098
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 phrase))    ;; n 1 docs 1  e.g. tierB-000866
(And (Member $e0 use) (Theme $e0 public_fund))    ;; n 1 docs 1  e.g. tierB-000268
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 room))    ;; n 1 docs 1  e.g. tierB-001378
(And (Member $e0 use) (Theme $e0 sentence))    ;; n 1 docs 1  e.g. tierB-000971
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 sugar))    ;; n 1 docs 1  e.g. tierB-001243
(And (Member $e0 use) (Theme $e0 weak_arens_space_topology))    ;; n 1 docs 1  e.g. tierC-000006
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 weak_arens_space_topology))    ;; n 1 docs 1  e.g. tierC-000005
(And (Member $e0 use) (Theme $e0 word))    ;; n 1 docs 1  e.g. tierB-001154
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 calendar))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000089
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 designation_convention))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000174
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 naming_convention))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000173
(And (Member $e0 use) (Theme $e0 $x1) (Member $x1 various))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000089

;; ---- slot make.Patient  [event center; head role]  n 20  docs<= 27  distinct 25  eventive 0
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 difference))    ;; n 2 (mass 1.5) docs 2  e.g. tierB-000025 tierB-001831
(And (Member $e0 make) (Patient $e0 afghanistan))    ;; n 1 docs 1  e.g. tierB-001504
(And (Member $e0 make) (Patient $e0 augustus))    ;; n 1 docs 1  e.g. tierB-001809
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 big))    ;; n 2 (mass 1) docs 2  e.g. tierB-001457 tierB-001831
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 chicken_fried_steak))    ;; n 1 docs 1  e.g. tierB-000998
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 claim))    ;; n 1 docs 1  e.g. tierB-000964
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 cope))    ;; n 1 docs 1  e.g. tierB-001696
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 cup))    ;; n 1 docs 1  e.g. tierB-000269
(And (Member $e0 make) (Patient $e0 eye_contact))    ;; n 1 docs 1  e.g. tierB-000539
(And (Member $e0 make) (Patient $e0 isabella))    ;; n 1 docs 1  e.g. tierB-000325
(And (Member $e0 make) (Patient $e0 paper))    ;; n 1 docs 1  e.g. tierB-001431
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 purchase))    ;; n 1 docs 1  e.g. tierB-001623
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 telephone_call))    ;; n 1 docs 1  e.g. tierB-001182
(And (Member $e0 make) (Patient $e0 travel))    ;; n 1 docs 1  e.g. tierB-001754
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 bad))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001594
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 beautiful))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001920
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 clicking))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000951
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 comfortable))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000371
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 high_pitched))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000073
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 house))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000371
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 matter))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001594
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 noise))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000073
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 room))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001920
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 snowman))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001457
(And (Member $e0 make) (Patient $e0 $x1) (Member $x1 sound))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000951

;; ---- slot build.Patient  [event center; head role]  n 18  docs<= 20  distinct 12  eventive 0
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 hotel))    ;; n 4 docs 4  e.g. tierC-000045 tierC-000046
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 room))    ;; n 3 docs 2  e.g. tierC-000213 tierC-000214
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 horn))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 paper_factory))    ;; n 2 docs 2  e.g. tierC-000045 tierC-000292
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 paper_mill))    ;; n 2 docs 2  e.g. tierC-000046 tierC-000291
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierC-000119 tierC-000120
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 network))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000063
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001867
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 original))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000932
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 playground))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001867
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 turing_machine))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000932
(And (Member $e0 build) (Patient $e0 $x1) (Member $x1 well))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000063

;; ---- slot make.Agent  [event center; head role]  n 18  docs<= 19  distinct 19  eventive 0
(And (Member $e0 make) (Agent $e0 artistic_beauty))    ;; n 1 docs 1  e.g. tierB-000371
(And (Member $e0 make) (Agent $e0 augustus))    ;; n 1 docs 1  e.g. tierB-001809
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 boy))    ;; n 1 docs 1  e.g. tierB-001457
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 cat))    ;; n 1 docs 1  e.g. tierB-000073
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 curtain))    ;; n 1 docs 1  e.g. tierB-001920
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 customer))    ;; n 1 docs 1  e.g. tierB-001623
(And (Member $e0 make) (Agent $e0 damiano))    ;; n 1 docs 1  e.g. tierB-000325
(And (Member $e0 make) (Agent $e0 david))    ;; n 1 docs 1  e.g. tierB-000173
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 diner))    ;; n 1 docs 1  e.g. tierB-000998
(And (Member $e0 make) (Agent $e0 elias))    ;; n 1 docs 1  e.g. tierB-000025
(And (Member $e0 make) (Agent $e0 hanako))    ;; n 1 docs 1  e.g. tierB-000951
(And (Member $e0 make) (Agent $e0 james))    ;; n 1 docs 1  e.g. tierB-000539
(And (Member $e0 make) (Agent $e0 lorenzo))    ;; n 1 docs 1  e.g. tierB-001594
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 docs 1  e.g. tierB-001182
(And (Member $e0 make) (Agent $e0 practical_utility))    ;; n 1 docs 1  e.g. tierB-000371
(And (Member $e0 make) (Agent $e0 taliban))    ;; n 1 docs 1  e.g. tierB-001504
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001831
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 gusty))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001754
(And (Member $e0 make) (Agent $e0 $x1) (Member $x1 wind))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001754

;; ---- slot go.Agent  [event center; head role]  n 15  docs<= 15  distinct 14  eventive 0
(And (Member $e0 go) (Agent $e0 katherine))    ;; n 2 docs 2  e.g. tierC-000209 tierC-000210
(And (Member $e0 go) (Agent $e0 $x1) (Member $x1 cat))    ;; n 1 docs 1  e.g. tierB-001183
(And (Member $e0 go) (Agent $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierB-001496
(And (Member $e0 go) (Agent $e0 daniel))    ;; n 1 docs 1  e.g. tierB-000576
(And (Member $e0 go) (Agent $e0 donald))    ;; n 1 docs 1  e.g. tierB-000115
(And (Member $e0 go) (Agent $e0 flavio))    ;; n 1 docs 1  e.g. tierB-001145
(And (Member $e0 go) (Agent $e0 kalman))    ;; n 1 docs 1  e.g. tierB-000012
(And (Member $e0 go) (Agent $e0 linda))    ;; n 1 docs 1  e.g. tierB-000313
(And (Member $e0 go) (Agent $e0 mariko))    ;; n 1 docs 1  e.g. tierB-001857
(And (Member $e0 go) (Agent $e0 matthew))    ;; n 1 docs 1  e.g. tierB-001418
(And (Member $e0 go) (Agent $e0 mennad))    ;; n 1 docs 1  e.g. tierB-000219
(And (Member $e0 go) (Agent $e0 mom))    ;; n 1 docs 1  e.g. tierB-000204
(And (Member $e0 go) (Agent $e0 olivia))    ;; n 1 docs 1  e.g. tierB-000012
(And (Member $e0 go) (Agent $e0 $x1) (Member $x1 pupil))    ;; n 1 docs 1  e.g. tierB-001628

;; ---- slot play.Agent  [event center; head role]  n 15  docs<= 15  distinct 10  eventive 0
(And (Member $e0 play) (Agent $e0 $x1) (Member $x1 child))    ;; n 4 docs 4  e.g. tierB-000160 tierB-000648
(And (Member $e0 play) (Agent $e0 boston_red_sox))    ;; n 2 docs 2  e.g. tierC-000229 tierC-000230
(And (Member $e0 play) (Agent $e0 cincinnati_reds))    ;; n 2 docs 2  e.g. tierC-000229 tierC-000230
(And (Member $e0 play) (Agent $e0 audrey_hepburn))    ;; n 1 docs 1  e.g. tierC-000228
(And (Member $e0 play) (Agent $e0 audrey_heppurn))    ;; n 1 docs 1  e.g. tierC-000227
(And (Member $e0 play) (Agent $e0 biology))    ;; n 1 docs 1  e.g. tierB-000816
(And (Member $e0 play) (Agent $e0 $x1) (Member $x1 boy))    ;; n 1 docs 1  e.g. tierB-001840
(And (Member $e0 play) (Agent $e0 religion))    ;; n 1 docs 1  e.g. tierB-000089
(And (Member $e0 play) (Agent $e0 tony))    ;; n 1 docs 1  e.g. tierB-001766
(And (Member $e0 play) (Agent $e0 yumi))    ;; n 1 docs 1  e.g. tierB-000939

;; ---- slot build.Agent  [event center; head role]  n 14  docs<= 10  distinct 5  eventive 0
(And (Member $e0 build) (Agent $e0 $x1) (Member $x1 company))    ;; n 8 docs 4  e.g. tierC-000045 tierC-000046
(And (Member $e0 build) (Agent $e0 o_r_woodcock))    ;; n 2 docs 2  e.g. tierC-000119 tierC-000120
(And (Member $e0 build) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072
(And (Member $e0 build) (Agent $e0 $x1) (Member $x1 community))    ;; n 1 docs 1  e.g. tierB-001867
(And (Member $e0 build) (Agent $e0 $x1) (Member $x1 mozabite))    ;; n 1 docs 1  e.g. tierB-000063

;; ---- slot find.Location  [event center; head role]  n 14  docs<= 14  distinct 10  eventive 0
(And (Member $e0 find) (Location $e0 $x1) (Member $x1 bench))    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244
(And (Member $e0 find) (Location $e0 $x1) (Member $x1 southern))    ;; n 2 docs 2  e.g. tierC-000279 tierC-000280
(And (Member $e0 find) (Location $e0 $x1) (Member $x1 tributary))    ;; n 2 docs 2  e.g. tierC-000313 tierC-000314
(And (Member $e0 find) (Location $e0 yunnan))    ;; n 2 docs 2  e.g. tierC-000313 tierC-000314
(And (Member $e0 find) (Location $e0 lake_dianchi))    ;; n 1 docs 1  e.g. tierC-000313
(And (Member $e0 find) (Location $e0 sahara_desert))    ;; n 1 docs 1  e.g. tierB-000585
(And (Member $e0 find) (Location $e0 $x1) (Member $x1 station))    ;; n 1 docs 1  e.g. tierB-000706
(And (Member $e0 find) (Location $e0 $x1) (Member $x1 tomb))    ;; n 1 docs 1  e.g. tierB-000579
(And (Member $e0 find) (Location $e0 $x1) (Member $x1 western))    ;; n 1 docs 1  e.g. tierC-000279
(And (Member $e0 find) (Location $e0 western_europe))    ;; n 1 docs 1  e.g. tierC-000280

;; ---- slot start.Theme  [event center; head role]  n 13  docs<= 14  distinct 14  eventive 12
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 appear))    ;; n 1 docs 1  e.g. tierB-001940
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 chant))    ;; n 1 docs 1  e.g. tierB-001169
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 cry))    ;; n 1 docs 1  e.g. tierB-000738
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 disappear))    ;; n 1 docs 1  e.g. tierB-000265
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 hear))    ;; n 1 docs 1  e.g. tierB-001479
(And (Member $e0 start) (Theme $e0 high_school))    ;; n 1 docs 1  e.g. tierB-000043
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 improve))    ;; n 1 docs 1  e.g. tierB-001816
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 roll))    ;; n 1 docs 1  e.g. tierB-000942
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 run_out))    ;; n 1 docs 1  e.g. tierB-001446
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 show))    ;; n 1 docs 1  e.g. tierB-000465
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 talk))    ;; n 1 docs 1  e.g. tierB-001219
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 vomit))    ;; n 1 docs 1  e.g. tierB-000199
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 feel))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000534
(And (Member $e0 start) (Theme $e0 $e1) (Member $e1 light_headed))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000534

;; ---- slot go.Goal  [event center; head role]  n 12  docs<= 11  distinct 9  eventive 0
(And (Member $e0 go) (Goal $e0 bed))    ;; n 4 docs 3  e.g. tierB-000012 tierB-001418
(And (Member $e0 go) (Goal $e0 $x1) (Member $x1 aesthetic_salon))    ;; n 1 docs 1  e.g. tierB-001857
(And (Member $e0 go) (Goal $e0 $x1) (Member $x1 bathroom))    ;; n 1 docs 1  e.g. tierB-001145
(And (Member $e0 go) (Goal $e0 $x1) (Member $x1 hospital))    ;; n 1 docs 1  e.g. tierB-000219
(And (Member $e0 go) (Goal $e0 loren))    ;; n 1 docs 1  e.g. tierC-000210
(And (Member $e0 go) (Goal $e0 $x1) (Member $x1 place))    ;; n 1 docs 1  e.g. tierB-000576
(And (Member $e0 go) (Goal $e0 school))    ;; n 1 docs 1  e.g. tierB-001628
(And (Member $e0 go) (Goal $e0 $x1) (Member $x1 supermarket))    ;; n 1 docs 1  e.g. tierB-000204
(And (Member $e0 go) (Goal $e0 $x1) (Member $x1 way))    ;; n 1 docs 1  e.g. tierB-001190

;; ---- slot study.Agent  [event center; head role]  n 12  docs<= 11  distinct 9  eventive 0
(And (Member $e0 study) (Agent $e0 $x1) (Member $x1 person))    ;; n 3 docs 2  e.g. tierC-000253 tierC-000254
(And (Member $e0 study) (Agent $e0 $x1) (Member $x1 scientist))    ;; n 2 docs 2  e.g. tierB-000225 tierB-001984
(And (Member $e0 study) (Agent $e0 beth))    ;; n 1 docs 1  e.g. tierB-001544
(And (Member $e0 study) (Agent $e0 carlos))    ;; n 1 docs 1  e.g. tierB-001879
(And (Member $e0 study) (Agent $e0 fadil))    ;; n 1 docs 1  e.g. tierB-000253
(And (Member $e0 study) (Agent $e0 $x1) (Member $x1 forensics_researcher))    ;; n 1 docs 1  e.g. tierB-000710
(And (Member $e0 study) (Agent $e0 nicolaus_copernicus))    ;; n 1 docs 1  e.g. tierB-000292
(And (Member $e0 study) (Agent $e0 peter))    ;; n 1 docs 1  e.g. tierB-001084
(And (Member $e0 study) (Agent $e0 yuri))    ;; n 1 docs 1  e.g. tierB-000203

;; ---- slot become.Patient  [event center; head role]  n 11  docs<= 20  distinct 16  eventive 0
(And (Member $e0 become) (Patient $e0 ashton))    ;; n 1 docs 1  e.g. tierB-001079
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 bad))    ;; n 2 (mass 1) docs 2  e.g. tierC-000241 tierC-000242
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 indigenous))    ;; n 2 (mass 1) docs 2  e.g. tierC-000001 tierC-000002
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 person))    ;; n 2 (mass 1) docs 2  e.g. tierC-000001 tierC-000237
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 relationship))    ;; n 2 (mass 1) docs 2  e.g. tierC-000241 tierC-000242
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000740
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 conservative))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001817
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 discipline))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000158
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 earth))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001582
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 inomaru))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000237
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 intense))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000352
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 lax))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000158
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 noise))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000352
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 people))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000002
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 red))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001582
(And (Member $e0 become) (Patient $e0 $x1) (Member $x1 revolutionary))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001817

;; ---- slot begin.Agent  [event center; head role]  n 11  docs<= 11  distinct 10  eventive 0
(And (Member $e0 begin) (Agent $e0 $x1) (Member $x1 european_american_settler))    ;; n 2 docs 2  e.g. tierC-000025 tierC-000026
(And (Member $e0 begin) (Agent $e0 $x1) (Member $x1 crowd))    ;; n 1 docs 1  e.g. tierB-001052
(And (Member $e0 begin) (Agent $e0 david))    ;; n 1 docs 1  e.g. tierB-000173
(And (Member $e0 begin) (Agent $e0 $x1) (Member $x1 indigenous_american))    ;; n 1 docs 1  e.g. tierC-000025
(And (Member $e0 begin) (Agent $e0 jessica))    ;; n 1 docs 1  e.g. tierB-000075
(And (Member $e0 begin) (Agent $e0 $x1) (Member $x1 legionnaire))    ;; n 1 docs 1  e.g. tierB-001138
(And (Member $e0 begin) (Agent $e0 mark))    ;; n 1 docs 1  e.g. tierB-000075
(And (Member $e0 begin) (Agent $e0 $x1) (Member $x1 native_american))    ;; n 1 docs 1  e.g. tierC-000026
(And (Member $e0 begin) (Agent $e0 $x1) (Member $x1 rebel))    ;; n 1 docs 1  e.g. tierB-000485
(And (Member $e0 begin) (Agent $e0 william))    ;; n 1 docs 1  e.g. tierB-000240

;; ---- slot begin.Theme  [event center; head role]  n 11  docs<= 9  distinct 8  eventive 11
(And (Member $e0 begin) (Theme $e0 $e1) (Member $e1 create))    ;; n 4 docs 2  e.g. tierC-000025 tierC-000026
(And (Member $e0 begin) (Theme $e0 $e1) (Member $e1 applaud))    ;; n 1 docs 1  e.g. tierB-001052
(And (Member $e0 begin) (Theme $e0 $e1) (Member $e1 bud))    ;; n 1 docs 1  e.g. tierB-001394
(And (Member $e0 begin) (Theme $e0 $e1) (Member $e1 confess))    ;; n 1 docs 1  e.g. tierB-000240
(And (Member $e0 begin) (Theme $e0 $e1) (Member $e1 distribute))    ;; n 1 docs 1  e.g. tierB-000485
(And (Member $e0 begin) (Theme $e0 $e1) (Member $e1 hang_out))    ;; n 1 docs 1  e.g. tierB-000075
(And (Member $e0 begin) (Theme $e0 $e1) (Member $e1 make))    ;; n 1 docs 1  e.g. tierB-000173
(And (Member $e0 begin) (Theme $e0 $e1) (Member $e1 torture))    ;; n 1 docs 1  e.g. tierB-001138

;; ---- slot build.Location  [event center; head role]  n 11  docs<= 10  distinct 4  eventive 0
(And (Member $e0 build) (Location $e0 kazakhstan))    ;; n 4 docs 4  e.g. tierC-000045 tierC-000046
(And (Member $e0 build) (Location $e0 eskisehir))    ;; n 3 docs 3  e.g. tierC-000045 tierC-000291
(And (Member $e0 build) (Location $e0 turkey))    ;; n 3 docs 2  e.g. tierC-000046 tierC-000291
(And (Member $e0 build) (Location $e0 ghardaia))    ;; n 1 docs 1  e.g. tierB-000063

;; ---- slot kill.Patient  [event center; head role]  n 11  docs<= 9  distinct 5  eventive 0
(And (Member $e0 kill) (Patient $e0 $x1) (Member $x1 person))    ;; n 6 docs 4  e.g. tierB-000393 tierB-000412
(And (Member $e0 kill) (Patient $e0 $x1) (Member $x1 soldier))    ;; n 2 docs 2  e.g. tierB-000067 tierB-001705
(And (Member $e0 kill) (Patient $e0 $x1) (Member $x1 fox))    ;; n 1 docs 1  e.g. tierB-001399
(And (Member $e0 kill) (Patient $e0 $x1) (Member $x1 gazelle))    ;; n 1 docs 1  e.g. tierB-001197
(And (Member $e0 kill) (Patient $e0 $x1) (Member $x1 zombie))    ;; n 1 docs 1  e.g. tierB-001047

;; ---- slot start.Patient  [event center; head role]  n 11  docs<= 14  distinct 14  eventive 1
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 concert))    ;; n 1 docs 1  e.g. tierB-001000
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 crack))    ;; n 1 docs 1  e.g. tierB-000265
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 dog_feed))    ;; n 1 docs 1  e.g. tierB-001446
(And (Member $e0 start) (Patient $e0 $e1) (Member $e1 knock))    ;; n 1 docs 1  e.g. tierB-001899
(And (Member $e0 start) (Patient $e0 milky_way))    ;; n 1 docs 1  e.g. tierB-000465
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 national_fibre_optic_network_project))    ;; n 1 docs 1  e.g. tierB-000192
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001816
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 truck))    ;; n 1 docs 1  e.g. tierB-000659
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 watermelon_season))    ;; n 1 docs 1  e.g. tierB-000699
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 freedom_movement))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000654
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 gusher))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000654
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 blue))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001940
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 pocket))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001940
(And (Member $e0 start) (Patient $e0 $x1) (Member $x1 sky))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001940

;; ---- slot produce.Patient  [event center; head role]  n 11  docs<= 15  distinct 11  eventive 0
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 movie))    ;; n 4 docs 2  e.g. tierC-000091 tierC-000092
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 album))    ;; n 2 docs 2  e.g. tierC-000103 tierC-000104
(And (Member $e0 produce) (Patient $e0 insulin))    ;; n 1 docs 1  e.g. tierB-001358
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 film))    ;; n 2 (mass 0.833) docs 2  e.g. tierC-000009 tierC-000010
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 syrian_film))    ;; n 2 (mass 0.833) docs 2  e.g. tierC-000009 tierC-000010
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 mesmerizing))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000208
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 sheen))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000208
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 cyanide))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001995
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 destined))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000009
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 harmless))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001995
(And (Member $e0 produce) (Patient $e0 $x1) (Member $x1 trace))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001995

;; ---- slot find.Theme  [event center; head role]  n 10  docs<= 10  distinct 6  eventive 0
(And (Member $e0 find) (Theme $e0 $x1) (Member $x1 thing))    ;; n 4 docs 4  e.g. tierC-000279 tierC-000280
(And (Member $e0 find) (Theme $e0 couper))    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244
(And (Member $e0 find) (Theme $e0 $x1) (Member $x1 clay_figurine))    ;; n 1 docs 1  e.g. tierB-000579
(And (Member $e0 find) (Theme $e0 $x1) (Member $x1 meteorite))    ;; n 1 docs 1  e.g. tierB-000585
(And (Member $e0 find) (Theme $e0 $x1) (Member $x1 paper_sheet))    ;; n 1 docs 1  e.g. tierB-001139
(And (Member $e0 find) (Theme $e0 pietro))    ;; n 1 docs 1  e.g. tierB-000706

;; ---- slot leave.Agent  [event center; head role]  n 10  docs<= 10  distinct 10  eventive 0
(And (Member $e0 leave) (Agent $e0 brian))    ;; n 1 docs 1  e.g. tierB-000425
(And (Member $e0 leave) (Agent $e0 $x1) (Member $x1 bus))    ;; n 1 docs 1  e.g. tierB-001739
(And (Member $e0 leave) (Agent $e0 $x1) (Member $x1 car))    ;; n 1 docs 1  e.g. tierB-000713
(And (Member $e0 leave) (Agent $e0 ivan))    ;; n 1 docs 1  e.g. tierB-000564
(And (Member $e0 leave) (Agent $e0 marcus))    ;; n 1 docs 1  e.g. tierB-001350
(And (Member $e0 leave) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000747
(And (Member $e0 leave) (Agent $e0 $x1) (Member $x1 plane))    ;; n 1 docs 1  e.g. tierB-000298
(And (Member $e0 leave) (Agent $e0 rodrigo))    ;; n 1 docs 1  e.g. tierB-000704
(And (Member $e0 leave) (Agent $e0 $x1) (Member $x1 ship))    ;; n 1 docs 1  e.g. tierB-000100
(And (Member $e0 leave) (Agent $e0 tom))    ;; n 1 docs 1  e.g. tierB-000004

;; ---- slot serve.Agent  [event center; head role]  n 10  docs<= 11  distinct 10  eventive 0
(And (Member $e0 serve) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 (mass 1.5) docs 2  e.g. tierC-000053 tierC-000054
(And (Member $e0 serve) (Agent $e0 $x1) (Member $x1 grandmother))    ;; n 1 docs 1  e.g. tierB-000864
(And (Member $e0 serve) (Agent $e0 indooroopilly))    ;; n 1 docs 1  e.g. tierC-000185
(And (Member $e0 serve) (Agent $e0 indooroopilly_line))    ;; n 1 docs 1  e.g. tierC-000186
(And (Member $e0 serve) (Agent $e0 ipswich_line))    ;; n 1 docs 1  e.g. tierC-000186
(And (Member $e0 serve) (Agent $e0 ipswich_rosewood))    ;; n 1 docs 1  e.g. tierC-000185
(And (Member $e0 serve) (Agent $e0 janos))    ;; n 1 docs 1  e.g. tierB-000940
(And (Member $e0 serve) (Agent $e0 rosewood_line))    ;; n 1 docs 1  e.g. tierC-000186
(And (Member $e0 serve) (Agent $e0 yitzhak))    ;; n 1 docs 1  e.g. tierB-000910
(And (Member $e0 serve) (Agent $e0 $x1) (Member $x1 president))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000053

;; ---- slot take.Theme  [event center; head role]  n 10  docs<= 12  distinct 11  eventive 0
(And (Member $e0 take) (Theme $e0 $x1) (Member $x1 identity))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072
(And (Member $e0 take) (Theme $e0 office))    ;; n 1 docs 1  e.g. tierB-001726
(And (Member $e0 take) (Theme $e0 $x1) (Member $x1 portrait))    ;; n 1 docs 1  e.g. tierB-001540
(And (Member $e0 take) (Theme $e0 power))    ;; n 1 docs 1  e.g. tierB-000309
(And (Member $e0 take) (Theme $e0 $x1) (Member $x1 roller))    ;; n 1 docs 1  e.g. tierB-000942
(And (Member $e0 take) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000252
(And (Member $e0 take) (Theme $e0 $x1) (Member $x1 while))    ;; n 1 docs 1  e.g. tierB-000978
(And (Member $e0 take) (Theme $e0 $x1) (Member $x1 close))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000987
(And (Member $e0 take) (Theme $e0 $x1) (Member $x1 drastic))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001591
(And (Member $e0 take) (Theme $e0 $x1) (Member $x1 look))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000987
(And (Member $e0 take) (Theme $e0 $x1) (Member $x1 measure))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001591

;; ---- slot try.Agent  [event center; head role]  n 10  docs<= 11  distinct 11  eventive 0
(And (Member $e0 try) (Agent $e0 $x1) (Member $x1 alien))    ;; n 1 docs 1  e.g. tierB-000469
(And (Member $e0 try) (Agent $e0 bob))    ;; n 1 docs 1  e.g. tierB-000947
(And (Member $e0 try) (Agent $e0 claudio))    ;; n 1 docs 1  e.g. tierB-000216
(And (Member $e0 try) (Agent $e0 $x1) (Member $x1 company))    ;; n 1 docs 1  e.g. tierB-001130
(And (Member $e0 try) (Agent $e0 $x1) (Member $x1 crocodile))    ;; n 1 docs 1  e.g. tierB-000470
(And (Member $e0 try) (Agent $e0 david))    ;; n 1 docs 1  e.g. tierB-000117
(And (Member $e0 try) (Agent $e0 felix))    ;; n 1 docs 1  e.g. tierB-000487
(And (Member $e0 try) (Agent $e0 mark))    ;; n 1 docs 1  e.g. tierB-000400
(And (Member $e0 try) (Agent $e0 santiago))    ;; n 1 docs 1  e.g. tierB-000547
(And (Member $e0 try) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001773
(And (Member $e0 try) (Agent $e0 $x1) (Member $x1 young))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001773

;; ---- slot try.Theme  [event center; head role]  n 10  docs<= 10  distinct 8  eventive 7
(And (Member $e0 try) (Theme $e0 <term:And>))    ;; n 3 docs 3  e.g. tierB-000216 tierB-000469
(And (Member $e0 try) (Theme $e0 $e1) (Member $e1 abuse))    ;; n 1 docs 1  e.g. tierB-001773
(And (Member $e0 try) (Theme $e0 $e1) (Member $e1 burnish))    ;; n 1 docs 1  e.g. tierB-001130
(And (Member $e0 try) (Theme $e0 $e1) (Member $e1 call))    ;; n 1 docs 1  e.g. tierB-000547
(And (Member $e0 try) (Theme $e0 $e1) (Member $e1 give_up))    ;; n 1 docs 1  e.g. tierB-000947
(And (Member $e0 try) (Theme $e0 $e1) (Member $e1 pull))    ;; n 1 docs 1  e.g. tierB-000470
(And (Member $e0 try) (Theme $e0 $e1) (Member $e1 reach))    ;; n 1 docs 1  e.g. tierB-000117
(And (Member $e0 try) (Theme $e0 $e1) (Member $e1 steal))    ;; n 1 docs 1  e.g. tierB-000400

;; ---- slot write.Patient  [event center; head role]  n 10  docs<= 10  distinct 8  eventive 0
(And (Member $e0 write) (Patient $e0 $x1) (Member $x1 episode))    ;; n 2 docs 2  e.g. tierC-000297 tierC-000298
(And (Member $e0 write) (Patient $e0 $x1) (Member $x1 song))    ;; n 2 docs 2  e.g. tierC-000131 tierC-000132
(And (Member $e0 write) (Patient $e0 $x1) (Member $x1 book))    ;; n 1 docs 1  e.g. tierB-001962
(And (Member $e0 write) (Patient $e0 $x1) (Member $x1 character))    ;; n 1 docs 1  e.g. tierB-001601
(And (Member $e0 write) (Patient $e0 letter))    ;; n 1 docs 1  e.g. tierB-001004
(And (Member $e0 write) (Patient $e0 $x1) (Member $x1 screenplay))    ;; n 1 docs 1  e.g. tierC-000090
(And (Member $e0 write) (Patient $e0 $x1) (Member $x1 script))    ;; n 1 docs 1  e.g. tierC-000089
(And (Member $e0 write) (Patient $e0 sentence))    ;; n 1 docs 1  e.g. tierB-000971

;; ---- slot follow.Agent  [event center; head role]  n 9  docs<= 11  distinct 10  eventive 0
(And (Member $e0 follow) (Agent $e0 $x1) (Member $x1 bhadala))    ;; n 2 docs 2  e.g. tierC-000117 tierC-000118
(And (Member $e0 follow) (Agent $e0 alexander))    ;; n 1 docs 1  e.g. tierC-000076
(And (Member $e0 follow) (Agent $e0 bailey))    ;; n 1 docs 1  e.g. tierC-000337
(And (Member $e0 follow) (Agent $e0 $x1) (Member $x1 muslim_house))    ;; n 1 docs 1  e.g. tierC-000096
(And (Member $e0 follow) (Agent $e0 $x1) (Member $x1 road))    ;; n 1 docs 1  e.g. tierB-000584
(And (Member $e0 follow) (Agent $e0 sami))    ;; n 1 docs 1  e.g. tierB-000026
(And (Member $e0 follow) (Agent $e0 $x1) (Member $x1 beast))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000231
(And (Member $e0 follow) (Agent $e0 $x1) (Member $x1 crawling))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000231
(And (Member $e0 follow) (Agent $e0 $x1) (Member $x1 house))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000095
(And (Member $e0 follow) (Agent $e0 $x1) (Member $x1 muslim))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000095

;; ---- slot follow.Theme  [event center; head role]  n 9  docs<= 9  distinct 7  eventive 0
(And (Member $e0 follow) (Theme $e0 $x1) (Member $x1 region))    ;; n 2 docs 2  e.g. tierC-000095 tierC-000096
(And (Member $e0 follow) (Theme $e0 $x1) (Member $x1 tradition))    ;; n 2 docs 2  e.g. tierC-000117 tierC-000118
(And (Member $e0 follow) (Theme $e0 henry_cole))    ;; n 1 docs 1  e.g. tierC-000337
(And (Member $e0 follow) (Theme $e0 layla))    ;; n 1 docs 1  e.g. tierB-000026
(And (Member $e0 follow) (Theme $e0 lukas))    ;; n 1 docs 1  e.g. tierB-000231
(And (Member $e0 follow) (Theme $e0 margaret_fleming))    ;; n 1 docs 1  e.g. tierC-000076
(And (Member $e0 follow) (Theme $e0 $x1) (Member $x1 shoreline))    ;; n 1 docs 1  e.g. tierB-000584

;; ---- slot kill.Agent  [event center; head role]  n 9  docs<= 7  distinct 6  eventive 0
(And (Member $e0 kill) (Agent $e0 $x1) (Member $x1 hurricane))    ;; n 4 docs 2  e.g. tierC-000353 tierC-000354
(And (Member $e0 kill) (Agent $e0 cancer))    ;; n 1 docs 1  e.g. tierB-000393
(And (Member $e0 kill) (Agent $e0 fire))    ;; n 1 docs 1  e.g. tierB-001047
(And (Member $e0 kill) (Agent $e0 $x1) (Member $x1 hunter))    ;; n 1 docs 1  e.g. tierB-001399
(And (Member $e0 kill) (Agent $e0 ivan))    ;; n 1 docs 1  e.g. tierB-000412
(And (Member $e0 kill) (Agent $e0 $x1) (Member $x1 lion))    ;; n 1 docs 1  e.g. tierB-001197

;; ---- slot sing.Agent  [event center; head role]  n 9  docs<= 10  distinct 8  eventive 0
(And (Member $e0 sing) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000127 tierC-000128
(And (Member $e0 sing) (Agent $e0 $x1) (Member $x1 sister))    ;; n 2 docs 2  e.g. tierC-000127 tierC-000128
(And (Member $e0 sing) (Agent $e0 $x1) (Member $x1 actress))    ;; n 1 docs 1  e.g. tierB-001156
(And (Member $e0 sing) (Agent $e0 amateur_barbershop_harmony_society))    ;; n 1 docs 1  e.g. tierC-000329
(And (Member $e0 sing) (Agent $e0 $x1) (Member $x1 bird))    ;; n 1 docs 1  e.g. tierB-001901
(And (Member $e0 sing) (Agent $e0 david))    ;; n 1 docs 1  e.g. tierB-000827
(And (Member $e0 sing) (Agent $e0 $x1) (Member $x1 group))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000330
(And (Member $e0 sing) (Agent $e0 $x1) (Member $x1 professional))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000330

;; ---- slot take.Agent  [event center; head role]  n 9  docs<= 9  distinct 8  eventive 0
(And (Member $e0 take) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072
(And (Member $e0 take) (Agent $e0 $x1) (Member $x1 cook))    ;; n 1 docs 1  e.g. tierB-000942
(And (Member $e0 take) (Agent $e0 gustavo))    ;; n 1 docs 1  e.g. tierB-000987
(And (Member $e0 take) (Agent $e0 jerry_rawlings))    ;; n 1 docs 1  e.g. tierB-000309
(And (Member $e0 take) (Agent $e0 lajos))    ;; n 1 docs 1  e.g. tierB-001102
(And (Member $e0 take) (Agent $e0 michael))    ;; n 1 docs 1  e.g. tierB-000252
(And (Member $e0 take) (Agent $e0 $x1) (Member $x1 president))    ;; n 1 docs 1  e.g. tierB-001726
(And (Member $e0 take) (Agent $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000978

;; ---- slot fall.Patient  [event center; head role]  n 9  docs<= 12  distinct 12  eventive 0
(And (Member $e0 fall) (Patient $e0 $x1) (Member $x1 book))    ;; n 1 docs 1  e.g. tierB-001364
(And (Member $e0 fall) (Patient $e0 $x1) (Member $x1 chick))    ;; n 1 docs 1  e.g. tierB-000779
(And (Member $e0 fall) (Patient $e0 $x1) (Member $x1 hush_of_anticipation))    ;; n 1 docs 1  e.g. tierB-001975
(And (Member $e0 fall) (Patient $e0 ice_pellet))    ;; n 1 docs 1  e.g. tierB-000456
(And (Member $e0 fall) (Patient $e0 $x1) (Member $x1 pupil))    ;; n 1 docs 1  e.g. tierB-000194
(And (Member $e0 fall) (Patient $e0 $x1) (Member $x1 scaffolding))    ;; n 1 docs 1  e.g. tierB-001306
(And (Member $e0 fall) (Patient $e0 snow))    ;; n 1 docs 1  e.g. tierB-001905
(And (Member $e0 fall) (Patient $e0 $x1) (Member $x1 forest))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000609
(And (Member $e0 fall) (Patient $e0 $x1) (Member $x1 silent))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000609
(And (Member $e0 fall) (Patient $e0 $x1) (Member $x1 dead))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001476
(And (Member $e0 fall) (Patient $e0 $x1) (Member $x1 rotten))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001476
(And (Member $e0 fall) (Patient $e0 $x1) (Member $x1 tree))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001476

;; ---- slot hear.Stimulus  [event center; head role]  n 9  docs<= 13  distinct 12  eventive 2
(And (Member $e0 hear) (Stimulus $e0 $x1) (Member $x1 bang))    ;; n 1 docs 1  e.g. tierB-000189
(And (Member $e0 hear) (Stimulus $e0 $e1) (Member $e1 crash))    ;; n 1 docs 1  e.g. tierB-000176
(And (Member $e0 hear) (Stimulus $e0 $x1) (Member $x1 knock))    ;; n 1 docs 1  e.g. tierB-000751
(And (Member $e0 hear) (Stimulus $e0 $x1) (Member $x1 shot))    ;; n 1 docs 1  e.g. tierB-000421
(And (Member $e0 hear) (Stimulus $e0 $e1) (Member $e1 start))    ;; n 1 docs 1  e.g. tierB-000659
(And (Member $e0 hear) (Stimulus $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000756
(And (Member $e0 hear) (Stimulus $e0 $x1) (Member $x1 noise))    ;; n 2 (mass 0.833) docs 2  e.g. tierB-000695 tierB-001479
(And (Member $e0 hear) (Stimulus $e0 $x1) (Member $x1 music))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000681
(And (Member $e0 hear) (Stimulus $e0 $x1) (Member $x1 ticking))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000695
(And (Member $e0 hear) (Stimulus $e0 $x1) (Member $x1 upbeat))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000681
(And (Member $e0 hear) (Stimulus $e0 $x1) (Member $x1 barking))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001479
(And (Member $e0 hear) (Stimulus $e0 $x1) (Member $x1 growling))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001479

;; ---- slot change.Patient  [event center; head role]  n 8  docs<= 8  distinct 7  eventive 0
(And (Member $e0 change) (Patient $e0 $x1) (Member $x1 weather))    ;; n 2 docs 2  e.g. tierB-000517 tierB-001491
(And (Member $e0 change) (Patient $e0 color))    ;; n 1 docs 1  e.g. tierB-000098
(And (Member $e0 change) (Patient $e0 $x1) (Member $x1 course))    ;; n 1 docs 1  e.g. tierB-001803
(And (Member $e0 change) (Patient $e0 $x1) (Member $x1 mind))    ;; n 1 docs 1  e.g. tierC-000011
(And (Member $e0 change) (Patient $e0 $x1) (Member $x1 name))    ;; n 1 docs 1  e.g. tierB-000139
(And (Member $e0 change) (Patient $e0 $x1) (Member $x1 rain))    ;; n 1 docs 1  e.g. tierB-001588
(And (Member $e0 change) (Patient $e0 thing))    ;; n 1 docs 1  e.g. tierB-001217

;; ---- slot hear.Experiencer  [event center; head role]  n 8  docs<= 8  distinct 7  eventive 0
(And (Member $e0 hear) (Experiencer $e0 bruno))    ;; n 2 docs 2  e.g. tierB-000659 tierB-000695
(And (Member $e0 hear) (Experiencer $e0 damiano))    ;; n 1 docs 1  e.g. tierB-000189
(And (Member $e0 hear) (Experiencer $e0 fadil))    ;; n 1 docs 1  e.g. tierB-000421
(And (Member $e0 hear) (Experiencer $e0 flavio))    ;; n 1 docs 1  e.g. tierB-000751
(And (Member $e0 hear) (Experiencer $e0 james))    ;; n 1 docs 1  e.g. tierB-000681
(And (Member $e0 hear) (Experiencer $e0 jonas))    ;; n 1 docs 1  e.g. tierB-000756
(And (Member $e0 hear) (Experiencer $e0 oleg))    ;; n 1 docs 1  e.g. tierB-001479

;; ---- slot live.Agent  [event center; head role]  n 8  docs<= 8  distinct 8  eventive 0
(And (Member $e0 live) (Agent $e0 beja))    ;; n 1 docs 1  e.g. tierB-001049
(And (Member $e0 live) (Agent $e0 cainan))    ;; n 1 docs 1  e.g. tierB-000778
(And (Member $e0 live) (Agent $e0 elias))    ;; n 1 docs 1  e.g. tierB-000524
(And (Member $e0 live) (Agent $e0 mary))    ;; n 1 docs 1  e.g. tierB-000048
(And (Member $e0 live) (Agent $e0 ray_kurtzweil))    ;; n 1 docs 1  e.g. tierB-000707
(And (Member $e0 live) (Agent $e0 tiziri))    ;; n 1 docs 1  e.g. tierB-001768
(And (Member $e0 live) (Agent $e0 $x1) (Member $x1 wolf))    ;; n 1 docs 1  e.g. tierB-001525
(And (Member $e0 live) (Agent $e0 yidir))    ;; n 1 docs 1  e.g. tierB-001768

;; ---- slot live.Location  [event center; head role]  n 8  docs<= 10  distinct 8  eventive 0
(And (Member $e0 live) (Location $e0 norway))    ;; n 2 docs 1  e.g. tierB-001768
(And (Member $e0 live) (Location $e0 $x1) (Member $x1 house))    ;; n 3 (mass 1.5) docs 3  e.g. tierB-000048 tierB-000371
(And (Member $e0 live) (Location $e0 $x1) (Member $x1 group))    ;; n 1 docs 1  e.g. tierB-001525
(And (Member $e0 live) (Location $e0 $x1) (Member $x1 southeastern_corner))    ;; n 1 docs 1  e.g. tierB-001049
(And (Member $e0 live) (Location $e0 $x1) (Member $x1 suburb))    ;; n 1 docs 1  e.g. tierB-000707
(And (Member $e0 live) (Location $e0 $x1) (Member $x1 comfortable))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000371
(And (Member $e0 live) (Location $e0 $x1) (Member $x1 isolated))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000524
(And (Member $e0 live) (Location $e0 $x1) (Member $x1 large))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000048

;; ---- slot need.Experiencer  [event center; head role]  n 8  docs<= 8  distinct 8  eventive 0
(And (Member $e0 need) (Experiencer $e0 algeria))    ;; n 1 docs 1  e.g. tierB-000086
(And (Member $e0 need) (Experiencer $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierB-001496
(And (Member $e0 need) (Experiencer $e0 $x1) (Member $x1 doctor))    ;; n 1 docs 1  e.g. tierB-000339
(And (Member $e0 need) (Experiencer $e0 $x1) (Member $x1 gate))    ;; n 1 docs 1  e.g. tierB-000455
(And (Member $e0 need) (Experiencer $e0 karl))    ;; n 1 docs 1  e.g. tierB-000061
(And (Member $e0 need) (Experiencer $e0 martino))    ;; n 1 docs 1  e.g. tierB-000107
(And (Member $e0 need) (Experiencer $e0 $x1) (Member $x1 sauce))    ;; n 1 docs 1  e.g. tierB-000174
(And (Member $e0 need) (Experiencer $e0 yanni))    ;; n 1 docs 1  e.g. tierB-000114

;; ---- slot open.Patient  [event center; head role]  n 8  docs<= 9  distinct 4  eventive 0
(And (Member $e0 open) (Patient $e0 $x1) (Member $x1 door))    ;; n 4 (mass 3.5) docs 4  e.g. tierB-000056 tierB-001487
(And (Member $e0 open) (Patient $e0 $x1) (Member $x1 law))    ;; n 2 docs 2  e.g. tierC-000285 tierC-000286
(And (Member $e0 open) (Patient $e0 $x1) (Member $x1 bank))    ;; n 1 docs 1  e.g. tierB-000302
(And (Member $e0 open) (Patient $e0 door))    ;; n 1 docs 1  e.g. tierB-000958
(And (Member $e0 open) (Patient $e0 $x1) (Member $x1 vault_like))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000056

;; ---- slot play.Theme  [event center; head role]  n 8  docs<= 10  distinct 7  eventive 0
(And (Member $e0 play) (Theme $e0 holly_golightly))    ;; n 2 docs 2  e.g. tierC-000227 tierC-000228
(And (Member $e0 play) (Theme $e0 tennis))    ;; n 2 docs 2  e.g. tierB-000939 tierB-001766
(And (Member $e0 play) (Theme $e0 $x1) (Member $x1 harp))    ;; n 1 docs 1  e.g. tierB-000648
(And (Member $e0 play) (Theme $e0 $x1) (Member $x1 role))    ;; n 2 (mass 1) docs 2  e.g. tierB-000089 tierB-000816
(And (Member $e0 play) (Theme $e0 $x1) (Member $x1 series))    ;; n 1 docs 1  e.g. tierC-000230
(And (Member $e0 play) (Theme $e0 $x1) (Member $x1 crucial))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000816
(And (Member $e0 play) (Theme $e0 $x1) (Member $x1 important))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000089

;; ---- slot speak.Agent  [event center; head role]  n 8  docs<= 7  distinct 6  eventive 0
(And (Member $e0 speak) (Agent $e0 oates))    ;; n 2 docs 2  e.g. tierC-000023 tierC-000024
(And (Member $e0 speak) (Agent $e0 sophia))    ;; n 2 docs 1  e.g. tierB-000271
(And (Member $e0 speak) (Agent $e0 kari_wahlgren))    ;; n 1 docs 1  e.g. tierC-000094
(And (Member $e0 speak) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 docs 1  e.g. tierB-001068
(And (Member $e0 speak) (Agent $e0 mie_sonozaki))    ;; n 1 docs 1  e.g. tierC-000094
(And (Member $e0 speak) (Agent $e0 xavier))    ;; n 1 docs 1  e.g. tierB-000053

;; ---- slot talk.Agent  [event center; head role]  n 8  docs<= 8  distinct 7  eventive 0
(And (Member $e0 talk) (Agent $e0 katherine))    ;; n 2 docs 2  e.g. tierC-000209 tierC-000210
(And (Member $e0 talk) (Agent $e0 daniel))    ;; n 1 docs 1  e.g. tierB-000078
(And (Member $e0 talk) (Agent $e0 $x1) (Member $x1 friend))    ;; n 1 docs 1  e.g. tierB-000550
(And (Member $e0 talk) (Agent $e0 jordan_peterson))    ;; n 1 docs 1  e.g. tierB-001968
(And (Member $e0 talk) (Agent $e0 linda))    ;; n 1 docs 1  e.g. tierB-000327
(And (Member $e0 talk) (Agent $e0 $x1) (Member $x1 novelist))    ;; n 1 docs 1  e.g. tierB-001666
(And (Member $e0 talk) (Agent $e0 $x1) (Member $x1 school_janitor))    ;; n 1 docs 1  e.g. tierB-001219

;; ---- slot use.Agent  [event center; head role]  n 8  docs<= 8  distinct 7  eventive 0
(And (Member $e0 use) (Agent $e0 $x1) (Member $x1 localized_version))    ;; n 2 docs 2  e.g. tierC-000173 tierC-000174
(And (Member $e0 use) (Agent $e0 $x1) (Member $x1 algerian_government))    ;; n 1 docs 1  e.g. tierB-000268
(And (Member $e0 use) (Agent $e0 churchill))    ;; n 1 docs 1  e.g. tierB-001884
(And (Member $e0 use) (Agent $e0 dad))    ;; n 1 docs 1  e.g. tierB-001304
(And (Member $e0 use) (Agent $e0 $x1) (Member $x1 human_brain))    ;; n 1 docs 1  e.g. tierB-001243
(And (Member $e0 use) (Agent $e0 $x1) (Member $x1 singer))    ;; n 1 docs 1  e.g. tierB-000850
(And (Member $e0 use) (Agent $e0 $x1) (Member $x1 ukrainian_army))    ;; n 1 docs 1  e.g. tierB-001098

;; ---- slot walk.Agent  [event center; head role]  n 8  docs<= 8  distinct 8  eventive 0
(And (Member $e0 walk) (Agent $e0 adriano))    ;; n 1 docs 1  e.g. tierB-001044
(And (Member $e0 walk) (Agent $e0 $x1) (Member $x1 ant))    ;; n 1 docs 1  e.g. tierB-000036
(And (Member $e0 walk) (Agent $e0 $x1) (Member $x1 customer))    ;; n 1 docs 1  e.g. tierB-000324
(And (Member $e0 walk) (Agent $e0 felix))    ;; n 1 docs 1  e.g. tierB-000148
(And (Member $e0 walk) (Agent $e0 hanako))    ;; n 1 docs 1  e.g. tierB-000951
(And (Member $e0 walk) (Agent $e0 leon))    ;; n 1 docs 1  e.g. tierB-000805
(And (Member $e0 walk) (Agent $e0 michael))    ;; n 1 docs 1  e.g. tierB-000929
(And (Member $e0 walk) (Agent $e0 $x1) (Member $x1 school_janitor))    ;; n 1 docs 1  e.g. tierB-001219

;; ---- slot want.Experiencer  [event center; head role]  n 8  docs<= 8  distinct 7  eventive 0
(And (Member $e0 want) (Experiencer $e0 aslan))    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312
(And (Member $e0 want) (Experiencer $e0 benedito))    ;; n 1 docs 1  e.g. tierB-000626
(And (Member $e0 want) (Experiencer $e0 $x1) (Member $x1 cat))    ;; n 1 docs 1  e.g. tierB-000250
(And (Member $e0 want) (Experiencer $e0 edmundo))    ;; n 1 docs 1  e.g. tierB-001390
(And (Member $e0 want) (Experiencer $e0 leon))    ;; n 1 docs 1  e.g. tierB-000846
(And (Member $e0 want) (Experiencer $e0 pepper))    ;; n 1 docs 1  e.g. tierB-001988
(And (Member $e0 want) (Experiencer $e0 tony))    ;; n 1 docs 1  e.g. tierB-001988

;; ---- slot want.Theme  [event center; head role]  n 8  docs<= 7  distinct 1  eventive 0
(And (Member $e0 want) (Theme $e0 <term:And>))    ;; n 8 docs 7  e.g. tierB-000250 tierB-000626

;; ---- slot work.Agent  [event center; head role]  n 8  docs<= 9  distinct 9  eventive 0
(And (Member $e0 work) (Agent $e0 asserson))    ;; n 1 docs 1  e.g. tierC-000079
(And (Member $e0 work) (Agent $e0 dad))    ;; n 1 docs 1  e.g. tierB-001187
(And (Member $e0 work) (Agent $e0 dan))    ;; n 1 docs 1  e.g. tierB-000867
(And (Member $e0 work) (Agent $e0 dmitri))    ;; n 1 docs 1  e.g. tierB-000212
(And (Member $e0 work) (Agent $e0 jones))    ;; n 1 docs 1  e.g. tierC-000304
(And (Member $e0 work) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001813
(And (Member $e0 work) (Agent $e0 $x1) (Member $x1 volunteer))    ;; n 1 docs 1  e.g. tierB-001134
(And (Member $e0 work) (Agent $e0 $x1) (Member $x1 adaptor))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001873
(And (Member $e0 work) (Agent $e0 $x1) (Member $x1 old))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001873

;; ---- slot write.Agent  [event center; head role]  n 8  docs<= 10  distinct 6  eventive 0
(And (Member $e0 write) (Agent $e0 $x1) (Member $x1 person))    ;; n 3 (mass 2.5) docs 3  e.g. tierB-001962 tierC-000089
(And (Member $e0 write) (Agent $e0 bill_wrubel))    ;; n 2 docs 2  e.g. tierC-000297 tierC-000298
(And (Member $e0 write) (Agent $e0 gilles_thibaut))    ;; n 2 docs 2  e.g. tierC-000131 tierC-000132
(And (Member $e0 write) (Agent $e0 $x1) (Member $x1 busy))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001004
(And (Member $e0 write) (Agent $e0 $x1) (Member $x1 famous))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001962
(And (Member $e0 write) (Agent $e0 $x1) (Member $x1 father))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001004

;; ---- slot produce.Agent  [event center; head role]  n 8  docs<= 10  distinct 7  eventive 0
(And (Member $e0 produce) (Agent $e0 colin_richardson))    ;; n 2 docs 2  e.g. tierC-000103 tierC-000104
(And (Member $e0 produce) (Agent $e0 harvey_hayutin))    ;; n 2 docs 2  e.g. tierC-000091 tierC-000092
(And (Member $e0 produce) (Agent $e0 sy_weintraub))    ;; n 2 docs 2  e.g. tierC-000091 tierC-000092
(And (Member $e0 produce) (Agent $e0 $x1) (Member $x1 pancreas))    ;; n 1 docs 1  e.g. tierB-001358
(And (Member $e0 produce) (Agent $e0 $x1) (Member $x1 layer))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000208
(And (Member $e0 produce) (Agent $e0 $x1) (Member $x1 oil))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000208
(And (Member $e0 produce) (Agent $e0 $x1) (Member $x1 thin))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000208

;; ---- slot come.Agent  [event center; head role]  n 7  docs<= 7  distinct 7  eventive 0
(And (Member $e0 come) (Agent $e0 $x1) (Member $x1 bus))    ;; n 1 docs 1  e.g. tierB-001528
(And (Member $e0 come) (Agent $e0 $x1) (Member $x1 country))    ;; n 1 docs 1  e.g. tierB-001534
(And (Member $e0 come) (Agent $e0 $x1) (Member $x1 discussion))    ;; n 1 docs 1  e.g. tierB-001963
(And (Member $e0 come) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 docs 1  e.g. tierB-000277
(And (Member $e0 come) (Agent $e0 sleep))    ;; n 1 docs 1  e.g. tierB-000255
(And (Member $e0 come) (Agent $e0 $x1) (Member $x1 student))    ;; n 1 docs 1  e.g. tierB-000387
(And (Member $e0 come) (Agent $e0 $x1) (Member $x1 train))    ;; n 1 docs 1  e.g. tierB-000238

;; ---- slot contain.Agent  [event center; head role]  n 7  docs<= 6  distinct 6  eventive 0
(And (Member $e0 contain) (Agent $e0 $x1) (Member $x1 card))    ;; n 3 (mass 1.5) docs 1  e.g. tierB-000101
(And (Member $e0 contain) (Agent $e0 $x1) (Member $x1 deck))    ;; n 3 (mass 1.5) docs 1  e.g. tierB-000101
(And (Member $e0 contain) (Agent $e0 $x1) (Member $x1 chest))    ;; n 1 docs 1  e.g. tierB-001650
(And (Member $e0 contain) (Agent $e0 plasma))    ;; n 1 docs 1  e.g. tierB-000454
(And (Member $e0 contain) (Agent $e0 $x1) (Member $x1 song))    ;; n 1 docs 1  e.g. tierB-000768
(And (Member $e0 contain) (Agent $e0 $x1) (Member $x1 vitamin_pill))    ;; n 1 docs 1  e.g. tierB-001254

;; ---- slot contain.Theme  [event center; head role]  n 7  docs<= 9  distinct 9  eventive 0
(And (Member $e0 contain) (Theme $e0 $x1) (Member $x1 electrolyte))    ;; n 1 docs 1  e.g. tierB-000454
(And (Member $e0 contain) (Theme $e0 $x1) (Member $x1 gold_coin))    ;; n 1 docs 1  e.g. tierB-001650
(And (Member $e0 contain) (Theme $e0 $x1) (Member $x1 jack))    ;; n 1 docs 1  e.g. tierB-000101
(And (Member $e0 contain) (Theme $e0 $x1) (Member $x1 king))    ;; n 1 docs 1  e.g. tierB-000101
(And (Member $e0 contain) (Theme $e0 $x1) (Member $x1 queen))    ;; n 1 docs 1  e.g. tierB-000101
(And (Member $e0 contain) (Theme $e0 $x1) (Member $x1 abundant))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001254
(And (Member $e0 contain) (Theme $e0 $x1) (Member $x1 degrading))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000768
(And (Member $e0 contain) (Theme $e0 $x1) (Member $x1 lyric))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000768
(And (Member $e0 contain) (Theme $e0 $x1) (Member $x1 nutrition))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001254

;; ---- slot create.Patient  [event center; head role]  n 7  docs<= 7  distinct 6  eventive 0
(And (Member $e0 create) (Patient $e0 $x1) (Member $x1 community))    ;; n 4 docs 2  e.g. tierC-000025 tierC-000026
(And (Member $e0 create) (Patient $e0 $x1) (Member $x1 particle_accelerator))    ;; n 1 docs 1  e.g. tierB-000863
(And (Member $e0 create) (Patient $e0 $x1) (Member $x1 calendar))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000089
(And (Member $e0 create) (Patient $e0 $x1) (Member $x1 language))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000728
(And (Member $e0 create) (Patient $e0 $x1) (Member $x1 new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000728
(And (Member $e0 create) (Patient $e0 $x1) (Member $x1 various))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000089

;; ---- slot form.Agent  [event center; head role]  n 7  docs<= 8  distinct 6  eventive 0
(And (Member $e0 form) (Agent $e0 jon_bon_jovi))    ;; n 2 docs 2  e.g. tierC-000179 tierC-000180
(And (Member $e0 form) (Agent $e0 sambora))    ;; n 2 docs 2  e.g. tierC-000179 tierC-000180
(And (Member $e0 form) (Agent $e0 $x1) (Member $x1 labourer))    ;; n 1 docs 1  e.g. tierB-000780
(And (Member $e0 form) (Agent $e0 technetium))    ;; n 1 docs 1  e.g. tierC-000163
(And (Member $e0 form) (Agent $e0 $x1) (Member $x1 complex))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000164
(And (Member $e0 form) (Agent $e0 $x1) (Member $x1 simple))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000164

;; ---- slot get.Patient  [event center; head role]  n 7  docs<= 13  distinct 12  eventive 0
(And (Member $e0 get) (Patient $e0 $x1) (Member $x1 bad))    ;; n 2 (mass 1) docs 2  e.g. tierB-000748 tierB-001910
(And (Member $e0 get) (Patient $e0 iran))    ;; n 1 docs 1  e.g. tierB-000206
(And (Member $e0 get) (Patient $e0 $x1) (Member $x1 big))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000890
(And (Member $e0 get) (Patient $e0 $x1) (Member $x1 cheap))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000370
(And (Member $e0 get) (Patient $e0 $x1) (Member $x1 day))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001658
(And (Member $e0 get) (Patient $e0 $x1) (Member $x1 excuse))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000370
(And (Member $e0 get) (Patient $e0 $x1) (Member $x1 expensive))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000370
(And (Member $e0 get) (Patient $e0 $x1) (Member $x1 fire))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000890
(And (Member $e0 get) (Patient $e0 $x1) (Member $x1 problem))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001910
(And (Member $e0 get) (Patient $e0 $x1) (Member $x1 short))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001658
(And (Member $e0 get) (Patient $e0 $x1) (Member $x1 thing))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000370
(And (Member $e0 get) (Patient $e0 $x1) (Member $x1 weather))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000748

;; ---- slot need.Theme  [event center; head role]  n 7  docs<= 7  distinct 6  eventive 5
(And (Member $e0 need) (Theme $e0 <term:And>))    ;; n 2 docs 2  e.g. tierB-000061 tierB-000086
(And (Member $e0 need) (Theme $e0 $e1) (Member $e1 generate))    ;; n 1 docs 1  e.g. tierB-000107
(And (Member $e0 need) (Theme $e0 $e1) (Member $e1 go))    ;; n 1 docs 1  e.g. tierB-001496
(And (Member $e0 need) (Theme $e0 $e1) (Member $e1 paint))    ;; n 1 docs 1  e.g. tierB-000455
(And (Member $e0 need) (Theme $e0 $e1) (Member $e1 run))    ;; n 1 docs 1  e.g. tierB-000339
(And (Member $e0 need) (Theme $e0 $e1) (Member $e1 understand))    ;; n 1 docs 1  e.g. tierB-000114

;; ---- slot sell.Theme  [event center; head role]  n 7  docs<= 9  distinct 8  eventive 0
(And (Member $e0 sell) (Theme $e0 ice_cream))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 copy))    ;; n 1 docs 1  e.g. tierB-000784
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 milk))    ;; n 1 docs 1  e.g. tierB-000326
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001956
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 bean))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000975
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 cell_phone))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001168
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001168
(And (Member $e0 sell) (Theme $e0 $x1) (Member $x1 roasted))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000975

;; ---- slot serve.Theme  [event center; head role]  n 7  docs<= 4  distinct 4  eventive 0
(And (Member $e0 serve) (Theme $e0 springfield_station))    ;; n 3 docs 1  e.g. tierC-000186
(And (Member $e0 serve) (Theme $e0 springfield))    ;; n 2 docs 1  e.g. tierC-000185
(And (Member $e0 serve) (Theme $e0 $x1) (Member $x1 coffee))    ;; n 1 docs 1  e.g. tierB-000940
(And (Member $e0 serve) (Theme $e0 revenge))    ;; n 1 docs 1  e.g. tierB-000915

;; ---- slot win.Agent  [event center; head role]  n 7  docs<= 7  distinct 4  eventive 0
(And (Member $e0 win) (Agent $e0 james_woods))    ;; n 2 docs 2  e.g. tierC-000301 tierC-000302
(And (Member $e0 win) (Agent $e0 wilson))    ;; n 2 docs 2  e.g. tierB-000730 tierC-000278
(And (Member $e0 win) (Agent $e0 $x1) (Member $x1 away_team))    ;; n 1 docs 1  e.g. tierB-001345
(And (Member $e0 win) (Agent $e0 $x1) (Member $x1 horse))    ;; n 1 docs 1  e.g. tierB-000145
(And (Member $e0 win) (Agent $e0 $x1) (Member $x1 wilson))    ;; n 1 docs 1  e.g. tierC-000277

;; ---- slot turn.Patient  [event center; head role]  n 7  docs<= 11  distinct 11  eventive 0
(And (Member $e0 turn) (Patient $e0 gustavo))    ;; n 1 docs 1  e.g. tierB-001675
(And (Member $e0 turn) (Patient $e0 $x1) (Member $x1 road))    ;; n 1 docs 1  e.g. tierB-000018
(And (Member $e0 turn) (Patient $e0 $x1) (Member $x1 russian_speech))    ;; n 1 docs 1  e.g. tierB-000777
(And (Member $e0 turn) (Patient $e0 $x1) (Member $x1 war))    ;; n 1 docs 1  e.g. tierB-001579
(And (Member $e0 turn) (Patient $e0 $x1) (Member $x1 black))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000476
(And (Member $e0 turn) (Patient $e0 $x1) (Member $x1 ceiling))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000476
(And (Member $e0 turn) (Patient $e0 $x1) (Member $x1 freedom_movement))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000654
(And (Member $e0 turn) (Patient $e0 $x1) (Member $x1 gusher))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000654
(And (Member $e0 turn) (Patient $e0 $x1) (Member $x1 leaf))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000832
(And (Member $e0 turn) (Patient $e0 $x1) (Member $x1 red))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000832
(And (Member $e0 turn) (Patient $e0 $x1) (Member $x1 yellow))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000832

;; ---- slot appear.Agent  [event center; head role]  n 6  docs<= 5  distinct 3  eventive 0
(And (Member $e0 appear) (Agent $e0 $x1) (Member $x1 person))    ;; n 3 docs 2  e.g. tierC-000050 tierC-000128
(And (Member $e0 appear) (Agent $e0 brian_packham))    ;; n 2 docs 2  e.g. tierC-000259 tierC-000260
(And (Member $e0 appear) (Agent $e0 $x1) (Member $x1 sister))    ;; n 1 docs 1  e.g. tierC-000128

;; ---- slot bear.Patient  [event center; head role]  n 6  docs<= 7  distinct 5  eventive 0
(And (Member $e0 bear) (Patient $e0 $x1) (Member $x1 person))    ;; n 3 docs 3  e.g. tierC-000199 tierC-000200
(And (Member $e0 bear) (Patient $e0 tobias))    ;; n 1 docs 1  e.g. tierB-000906
(And (Member $e0 bear) (Patient $e0 tycho_brahe))    ;; n 1 docs 1  e.g. tierB-001812
(And (Member $e0 bear) (Patient $e0 $x1) (Member $x1 man))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001568
(And (Member $e0 bear) (Patient $e0 $x1) (Member $x1 poor))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001568

;; ---- slot build.Instrument  [event center; head role]  n 6  docs<= 7  distinct 5  eventive 1
(And (Member $e0 build) (Instrument $e0 $x1) (Member $x1 barometer))    ;; n 2 docs 2  e.g. tierC-000213 tierC-000214
(And (Member $e0 build) (Instrument $e0 $x1) (Member $x1 help))    ;; n 1 docs 1  e.g. tierC-000072
(And (Member $e0 build) (Instrument $e0 $e1) (Member $e1 help))    ;; n 1 docs 1  e.g. tierC-000071
(And (Member $e0 build) (Instrument $e0 $x1) (Member $x1 presented_in_scale))    ;; n 1 docs 1  e.g. tierC-000213
(And (Member $e0 build) (Instrument $e0 $x1) (Member $x1 presented))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000214
(And (Member $e0 build) (Instrument $e0 $x1) (Member $x1 scale))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000214

;; ---- slot capture.Theme  [event center; head role]  n 6  docs<= 6  distinct 6  eventive 0
(And (Member $e0 capture) (Theme $e0 $x1) (Member $x1 algerian_city))    ;; n 1 docs 1  e.g. tierB-000215
(And (Member $e0 capture) (Theme $e0 $x1) (Member $x1 british_ship))    ;; n 1 docs 1  e.g. tierB-000636
(And (Member $e0 capture) (Theme $e0 $x1) (Member $x1 capital))    ;; n 1 docs 1  e.g. tierB-001342
(And (Member $e0 capture) (Theme $e0 $x1) (Member $x1 magpie))    ;; n 1 docs 1  e.g. tierB-000852
(And (Member $e0 capture) (Theme $e0 $x1) (Member $x1 merchant_ship))    ;; n 1 docs 1  e.g. tierB-001990
(And (Member $e0 capture) (Theme $e0 valerian))    ;; n 1 docs 1  e.g. tierB-001312

;; ---- slot cause.Agent  [event center; head role]  n 6  docs<= 6  distinct 6  eventive 1
(And (Member $e0 cause) (Agent $e0 $x1) (Member $x1 demon))    ;; n 1 docs 1  e.g. tierB-001649
(And (Member $e0 cause) (Agent $e0 $x1) (Member $x1 news))    ;; n 1 docs 1  e.g. tierB-001875
(And (Member $e0 cause) (Agent $e0 $x1) (Member $x1 storm))    ;; n 1 docs 1  e.g. tierB-000775
(And (Member $e0 cause) (Agent $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001089
(And (Member $e0 cause) (Agent $e0 $x1) (Member $x1 tide))    ;; n 1 docs 1  e.g. tierB-001283
(And (Member $e0 cause) (Agent $e0 $e1) (Member $e1 walk))    ;; n 1 docs 1  e.g. tierB-000805

;; ---- slot create.Agent  [event center; head role]  n 6  docs<= 6  distinct 5  eventive 0
(And (Member $e0 create) (Agent $e0 $x1) (Member $x1 european_american_settler))    ;; n 2 docs 2  e.g. tierC-000025 tierC-000026
(And (Member $e0 create) (Agent $e0 $x1) (Member $x1 indigenous_american))    ;; n 1 docs 1  e.g. tierC-000025
(And (Member $e0 create) (Agent $e0 $x1) (Member $x1 native_american))    ;; n 1 docs 1  e.g. tierC-000026
(And (Member $e0 create) (Agent $e0 paul))    ;; n 1 docs 1  e.g. tierB-000863
(And (Member $e0 create) (Agent $e0 $x1) (Member $x1 writer))    ;; n 1 docs 1  e.g. tierB-000728

;; ---- slot enter.Agent  [event center; head role]  n 6  docs<= 6  distinct 5  eventive 0
(And (Member $e0 enter) (Agent $e0 lake_sammamish))    ;; n 2 docs 2  e.g. tierC-000063 tierC-000064
(And (Member $e0 enter) (Agent $e0 layla))    ;; n 1 docs 1  e.g. tierB-000163
(And (Member $e0 enter) (Agent $e0 martino))    ;; n 1 docs 1  e.g. tierB-000450
(And (Member $e0 enter) (Agent $e0 $x1) (Member $x1 muslim))    ;; n 1 docs 1  e.g. tierB-000622
(And (Member $e0 enter) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000556

;; ---- slot form.Patient  [event center; head role]  n 6  docs<= 7  distinct 7  eventive 0
(And (Member $e0 form) (Patient $e0 main_songwriting_unit))    ;; n 2 docs 1  e.g. tierC-000180
(And (Member $e0 form) (Patient $e0 $x1) (Member $x1 human_barricade))    ;; n 1 docs 1  e.g. tierB-000780
(And (Member $e0 form) (Patient $e0 technetium))    ;; n 1 docs 1  e.g. tierC-000164
(And (Member $e0 form) (Patient $e0 $x1) (Member $x1 complex))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000163
(And (Member $e0 form) (Patient $e0 $x1) (Member $x1 main))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000179
(And (Member $e0 form) (Patient $e0 $x1) (Member $x1 simple))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000163
(And (Member $e0 form) (Patient $e0 $x1) (Member $x1 songwriting_unit))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000179

;; ---- slot fund.Agent  [event center; head role]  n 6  docs<= 6  distinct 3  eventive 0
(And (Member $e0 fund) (Agent $e0 jica))    ;; n 3 docs 3  e.g. tierC-000217 tierC-000218
(And (Member $e0 fund) (Agent $e0 $x1) (Member $x1 government))    ;; n 2 docs 2  e.g. tierC-000217 tierC-000245
(And (Member $e0 fund) (Agent $e0 government_of_uganda))    ;; n 1 docs 1  e.g. tierC-000218

;; ---- slot get.Agent  [event center; head role]  n 6  docs<= 7  distinct 7  eventive 0
(And (Member $e0 get) (Agent $e0 diego))    ;; n 1 docs 1  e.g. tierB-000577
(And (Member $e0 get) (Agent $e0 gabriel))    ;; n 1 docs 1  e.g. tierB-001325
(And (Member $e0 get) (Agent $e0 janos))    ;; n 1 docs 1  e.g. tierB-000672
(And (Member $e0 get) (Agent $e0 leonid))    ;; n 1 docs 1  e.g. tierB-001185
(And (Member $e0 get) (Agent $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000770
(And (Member $e0 get) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001773
(And (Member $e0 get) (Agent $e0 $x1) (Member $x1 young))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001773

;; ---- slot help.Agent  [event center; head role]  n 6  docs<= 6  distinct 6  eventive 0
(And (Member $e0 help) (Agent $e0 context))    ;; n 1 docs 1  e.g. tierB-001149
(And (Member $e0 help) (Agent $e0 $x1) (Member $x1 hothouse_condition))    ;; n 1 docs 1  e.g. tierB-000858
(And (Member $e0 help) (Agent $e0 jonas))    ;; n 1 docs 1  e.g. tierB-000319
(And (Member $e0 help) (Agent $e0 karen))    ;; n 1 docs 1  e.g. tierC-000071
(And (Member $e0 help) (Agent $e0 $x1) (Member $x1 life_experience))    ;; n 1 docs 1  e.g. tierB-001909
(And (Member $e0 help) (Agent $e0 michael))    ;; n 1 docs 1  e.g. tierB-001094

;; ---- slot receive.Theme  [event center; head role]  n 6  docs<= 7  distinct 6  eventive 0
(And (Member $e0 receive) (Theme $e0 $x1) (Member $x1 work))    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236
(And (Member $e0 receive) (Theme $e0 $x1) (Member $x1 award))    ;; n 1 docs 1  e.g. tierB-000962
(And (Member $e0 receive) (Theme $e0 $x1) (Member $x1 honorary_knighthood))    ;; n 1 docs 1  e.g. tierB-001595
(And (Member $e0 receive) (Theme $e0 permit))    ;; n 1 docs 1  e.g. tierB-001035
(And (Member $e0 receive) (Theme $e0 $x1) (Member $x1 car))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001693
(And (Member $e0 receive) (Theme $e0 $x1) (Member $x1 new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001693

;; ---- slot run.Agent  [event center; head role]  n 6  docs<= 6  distinct 5  eventive 0
(And (Member $e0 run) (Agent $e0 george_allen))    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162
(And (Member $e0 run) (Agent $e0 $x1) (Member $x1 doctor))    ;; n 1 docs 1  e.g. tierB-000339
(And (Member $e0 run) (Agent $e0 $x1) (Member $x1 goat))    ;; n 1 docs 1  e.g. tierB-001153
(And (Member $e0 run) (Agent $e0 $x1) (Member $x1 squirrel))    ;; n 1 docs 1  e.g. tierB-001563
(And (Member $e0 run) (Agent $e0 tobias))    ;; n 1 docs 1  e.g. tierB-000178

;; ---- slot sleep.Experiencer  [event center; head role]  n 6  docs<= 6  distinct 4  eventive 0
(And (Member $e0 sleep) (Experiencer $e0 $x1) (Member $x1 cat))    ;; n 2 docs 2  e.g. tierB-001003 tierB-001334
(And (Member $e0 sleep) (Experiencer $e0 $x1) (Member $x1 child))    ;; n 2 docs 2  e.g. tierB-001891 tierB-001945
(And (Member $e0 sleep) (Experiencer $e0 baya))    ;; n 1 docs 1  e.g. tierB-001538
(And (Member $e0 sleep) (Experiencer $e0 $x1) (Member $x1 dog))    ;; n 1 docs 1  e.g. tierB-001753

;; ---- slot speak.Theme  [event center; head role]  n 6  docs<= 6  distinct 6  eventive 0
(And (Member $e0 speak) (Theme $e0 ashe))    ;; n 2 docs 1  e.g. tierC-000094
(And (Member $e0 speak) (Theme $e0 czech))    ;; n 1 docs 1  e.g. tierB-000271
(And (Member $e0 speak) (Theme $e0 english))    ;; n 1 docs 1  e.g. tierB-000053
(And (Member $e0 speak) (Theme $e0 polish))    ;; n 1 docs 1  e.g. tierB-000271
(And (Member $e0 speak) (Theme $e0 $x1) (Member $x1 foreign))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001068
(And (Member $e0 speak) (Theme $e0 $x1) (Member $x1 language))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001068

;; ---- slot start.Agent  [event center; head role]  n 6  docs<= 7  distinct 7  eventive 0
(And (Member $e0 start) (Agent $e0 $x1) (Member $x1 cook))    ;; n 1 docs 1  e.g. tierB-000942
(And (Member $e0 start) (Agent $e0 $x1) (Member $x1 girl))    ;; n 1 docs 1  e.g. tierB-000738
(And (Member $e0 start) (Agent $e0 karl))    ;; n 1 docs 1  e.g. tierB-000199
(And (Member $e0 start) (Agent $e0 $x1) (Member $x1 school_janitor))    ;; n 1 docs 1  e.g. tierB-001219
(And (Member $e0 start) (Agent $e0 skura))    ;; n 1 docs 1  e.g. tierB-000043
(And (Member $e0 start) (Agent $e0 $x1) (Member $x1 crowd))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001169
(And (Member $e0 start) (Agent $e0 $x1) (Member $x1 whole))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001169

;; ---- slot study.Location  [event center; head role]  n 6  docs<= 6  distinct 4  eventive 0
(And (Member $e0 study) (Location $e0 davis_studio))    ;; n 2 docs 2  e.g. tierC-000253 tierC-000254
(And (Member $e0 study) (Location $e0 julian_ashton_art_school))    ;; n 2 docs 2  e.g. tierC-000253 tierC-000254
(And (Member $e0 study) (Location $e0 munich))    ;; n 1 docs 1  e.g. tierB-001084
(And (Member $e0 study) (Location $e0 $x1) (Member $x1 university))    ;; n 1 docs 1  e.g. tierB-000292

;; ---- slot study.Theme  [event center; head role]  n 6  docs<= 7  distinct 7  eventive 0
(And (Member $e0 study) (Theme $e0 <term:Question>))    ;; n 1 docs 1  e.g. tierB-000225
(And (Member $e0 study) (Theme $e0 arabic))    ;; n 1 docs 1  e.g. tierB-000253
(And (Member $e0 study) (Theme $e0 canon_law))    ;; n 1 docs 1  e.g. tierB-000292
(And (Member $e0 study) (Theme $e0 mechanical_engineering))    ;; n 1 docs 1  e.g. tierB-001544
(And (Member $e0 study) (Theme $e0 $x1) (Member $x1 rate))    ;; n 1 docs 1  e.g. tierB-000710
(And (Member $e0 study) (Theme $e0 $x1) (Member $x1 bacterium))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001984
(And (Member $e0 study) (Theme $e0 $x1) (Member $x1 new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001984

;; ---- slot write.CoAgent  [event center; head role]  n 6  docs<= 6  distinct 3  eventive 0
(And (Member $e0 write) (CoAgent $e0 bianca_olsen))    ;; n 2 docs 2  e.g. tierC-000089 tierC-000090
(And (Member $e0 write) (CoAgent $e0 cyril_rambour))    ;; n 2 docs 2  e.g. tierC-000089 tierC-000090
(And (Member $e0 write) (CoAgent $e0 laurie_aubanel))    ;; n 2 docs 2  e.g. tierC-000089 tierC-000090

;; ---- slot add.Agent  [event center; head role]  n 5  docs<= 5  distinct 4  eventive 0
(And (Member $e0 add) (Agent $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierC-000227 tierC-000228
(And (Member $e0 add) (Agent $e0 $x1) (Member $x1 cook))    ;; n 1 docs 1  e.g. tierB-000462
(And (Member $e0 add) (Agent $e0 j_augustus_knapp))    ;; n 1 docs 1  e.g. tierC-000231
(And (Member $e0 add) (Agent $e0 $x1) (Member $x1 plant))    ;; n 1 docs 1  e.g. tierB-001132

;; ---- slot appear.Location  [event center; head role]  n 5  docs<= 4  distinct 4  eventive 0
(And (Member $e0 appear) (Location $e0 cafe))    ;; n 2 docs 1  e.g. tierC-000128
(And (Member $e0 appear) (Location $e0 comedic_role))    ;; n 1 docs 1  e.g. tierC-000050
(And (Member $e0 appear) (Location $e0 coronation_street))    ;; n 1 docs 1  e.g. tierC-000260
(And (Member $e0 appear) (Location $e0 musical_film))    ;; n 1 docs 1  e.g. tierC-000050

;; ---- slot buy.Theme  [event center; head role]  n 5  docs<= 7  distinct 7  eventive 0
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 computer))    ;; n 1 docs 1  e.g. tierB-000849
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 food))    ;; n 1 docs 1  e.g. tierB-000368
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 house))    ;; n 1 docs 1  e.g. tierB-001690
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 blue))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000367
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 shirt))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000367
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 trouser))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000367
(And (Member $e0 buy) (Theme $e0 $x1) (Member $x1 yellow))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000367

;; ---- slot cry.Agent  [event center; head role]  n 5  docs<= 5  distinct 5  eventive 0
(And (Member $e0 cry) (Agent $e0 alberto))    ;; n 1 docs 1  e.g. tierB-000502
(And (Member $e0 cry) (Agent $e0 baya))    ;; n 1 docs 1  e.g. tierB-001538
(And (Member $e0 cry) (Agent $e0 $x1) (Member $x1 girl))    ;; n 1 docs 1  e.g. tierB-000738
(And (Member $e0 cry) (Agent $e0 rima))    ;; n 1 docs 1  e.g. tierB-000030
(And (Member $e0 cry) (Agent $e0 skura))    ;; n 1 docs 1  e.g. tierB-000030

;; ---- slot direct.Agent  [event center; head role]  n 5  docs<= 5  distinct 4  eventive 0
(And (Member $e0 direct) (Agent $e0 lev_l_spiro))    ;; n 2 docs 2  e.g. tierC-000297 tierC-000298
(And (Member $e0 direct) (Agent $e0 claude_lelouch))    ;; n 1 docs 1  e.g. tierC-000138
(And (Member $e0 direct) (Agent $e0 $x1) (Member $x1 conductor))    ;; n 1 docs 1  e.g. tierB-001087
(And (Member $e0 direct) (Agent $e0 robert_day))    ;; n 1 docs 1  e.g. tierC-000091

;; ---- slot direct.Patient  [event center; head role]  n 5  docs<= 6  distinct 5  eventive 0
(And (Member $e0 direct) (Patient $e0 $x1) (Member $x1 episode))    ;; n 2 docs 2  e.g. tierC-000297 tierC-000298
(And (Member $e0 direct) (Patient $e0 $x1) (Member $x1 movie))    ;; n 1 docs 1  e.g. tierC-000091
(And (Member $e0 direct) (Patient $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierC-000138
(And (Member $e0 direct) (Patient $e0 $x1) (Member $x1 film))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000010
(And (Member $e0 direct) (Patient $e0 $x1) (Member $x1 syrian_film))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000010

;; ---- slot draw.Agent  [event center; head role]  n 5  docs<= 5  distinct 3  eventive 0
(And (Member $e0 draw) (Agent $e0 $x1) (Member $x1 child))    ;; n 2 docs 2  e.g. tierB-001245 tierB-001250
(And (Member $e0 draw) (Agent $e0 cowper))    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294
(And (Member $e0 draw) (Agent $e0 $x1) (Member $x1 concert))    ;; n 1 docs 1  e.g. tierB-000781

;; ---- slot eat.Patient  [event center; head role]  n 5  docs<= 5  distinct 4  eventive 0
(And (Member $e0 eat) (Patient $e0 bread))    ;; n 1 docs 1  e.g. tierB-001973
(And (Member $e0 eat) (Patient $e0 $x1) (Member $x1 chicken))    ;; n 1 docs 1  e.g. tierB-000616
(And (Member $e0 eat) (Patient $e0 cookie))    ;; n 1 docs 1  e.g. tierB-000410
(And (Member $e0 eat) (Patient $e0 $x1) (Member $x1 cookie))    ;; n 1 docs 1  e.g. tierB-000338
(And (Member $e0 eat) (Patient $e0 $x1) (Member $x1 rabbit))    ;; n 1 docs 1  e.g. tierB-001551

;; ---- slot fly.Agent  [event center; head role]  n 5  docs<= 5  distinct 5  eventive 0
(And (Member $e0 fly) (Agent $e0 $x1) (Member $x1 eagle))    ;; n 1 docs 1  e.g. tierB-000121
(And (Member $e0 fly) (Agent $e0 $x1) (Member $x1 insect))    ;; n 1 docs 1  e.g. tierB-000801
(And (Member $e0 fly) (Agent $e0 $x1) (Member $x1 plane))    ;; n 1 docs 1  e.g. tierB-000045
(And (Member $e0 fly) (Agent $e0 $x1) (Member $x1 rocket))    ;; n 1 docs 1  e.g. tierB-001789
(And (Member $e0 fly) (Agent $e0 superman))    ;; n 1 docs 1  e.g. tierB-001789

;; ---- slot include.Theme  [event center; head role]  n 5  docs<= 5  distinct 5  eventive 0
(And (Member $e0 include) (Theme $e0 armaan_jain))    ;; n 1 docs 1  e.g. tierC-000139
(And (Member $e0 include) (Theme $e0 $x1) (Member $x1 extradition_clause))    ;; n 1 docs 1  e.g. tierB-001878
(And (Member $e0 include) (Theme $e0 $x1) (Member $x1 marching_band))    ;; n 1 docs 1  e.g. tierB-000379
(And (Member $e0 include) (Theme $e0 nikhil_nanda))    ;; n 1 docs 1  e.g. tierC-000139
(And (Member $e0 include) (Theme $e0 ranbir_kapoor))    ;; n 1 docs 1  e.g. tierC-000139

;; ---- slot lead.Agent  [event center; head role]  n 5  docs<= 5  distinct 4  eventive 0
(And (Member $e0 lead) (Agent $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierC-000019 tierC-000020
(And (Member $e0 lead) (Agent $e0 $x1) (Member $x1 dog))    ;; n 1 docs 1  e.g. tierB-001086
(And (Member $e0 lead) (Agent $e0 education))    ;; n 1 docs 1  e.g. tierB-000105
(And (Member $e0 lead) (Agent $e0 $x1) (Member $x1 general))    ;; n 1 docs 1  e.g. tierB-001782

;; ---- slot lead.Goal  [event center; head role]  n 5  docs<= 7  distinct 7  eventive 0
(And (Member $e0 lead) (Goal $e0 happiness))    ;; n 1 docs 1  e.g. tierB-000105
(And (Member $e0 lead) (Goal $e0 home))    ;; n 1 docs 1  e.g. tierB-001086
(And (Member $e0 lead) (Goal $e0 peace))    ;; n 1 docs 1  e.g. tierB-000105
(And (Member $e0 lead) (Goal $e0 $x1) (Member $x1 big))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000020
(And (Member $e0 lead) (Goal $e0 $x1) (Member $x1 cat_fight))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000020
(And (Member $e0 lead) (Goal $e0 $x1) (Member $x1 glory))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000040
(And (Member $e0 lead) (Goal $e0 $x1) (Member $x1 lost))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000040

;; ---- slot marry.Agent  [event center; head role]  n 5  docs<= 5  distinct 4  eventive 0
(And (Member $e0 marry) (Agent $e0 margaret_fleming))    ;; n 2 docs 2  e.g. tierC-000075 tierC-000076
(And (Member $e0 marry) (Agent $e0 james_of_barrochan))    ;; n 1 docs 1  e.g. tierC-000075
(And (Member $e0 marry) (Agent $e0 nancy))    ;; n 1 docs 1  e.g. tierB-000478
(And (Member $e0 marry) (Agent $e0 steve))    ;; n 1 docs 1  e.g. tierB-000478

;; ---- slot portray.Agent  [event center; head role]  n 5  docs<= 5  distinct 3  eventive 0
(And (Member $e0 portray) (Agent $e0 soichiro_akizuki))    ;; n 2 docs 2  e.g. tierC-000247 tierC-000248
(And (Member $e0 portray) (Agent $e0 james_woods))    ;; n 1 docs 1  e.g. tierC-000301
(And (Member $e0 portray) (Agent $e0 wilson))    ;; n 1 docs 1  e.g. tierC-000278
(And (Member $e0 portray) (Agent $e0 $x1) (Member $x1 wilson))    ;; n 1 docs 1  e.g. tierC-000277

;; ---- slot portray.Theme  [event center; head role]  n 5  docs<= 5  distinct 3  eventive 0
(And (Member $e0 portray) (Theme $e0 james_woods))    ;; n 2 docs 2  e.g. tierC-000277 tierC-000278
(And (Member $e0 portray) (Theme $e0 kantaro_suga))    ;; n 2 docs 2  e.g. tierC-000247 tierC-000248
(And (Member $e0 portray) (Theme $e0 wilson))    ;; n 1 docs 1  e.g. tierC-000301

;; ---- slot present.Theme  [event center; head role]  n 5  docs<= 5  distinct 4  eventive 0
(And (Member $e0 present) (Theme $e0 $x1) (Member $x1 song))    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012
(And (Member $e0 present) (Theme $e0 $x1) (Member $x1 golden_opportunity))    ;; n 1 docs 1  e.g. tierB-001486
(And (Member $e0 present) (Theme $e0 $x1) (Member $x1 picture))    ;; n 1 docs 1  e.g. tierB-000876
(And (Member $e0 present) (Theme $e0 $x1) (Member $x1 play))    ;; n 1 docs 1  e.g. tierB-001932

;; ---- slot provide.Agent  [event center; head role]  n 5  docs<= 5  distinct 5  eventive 0
(And (Member $e0 provide) (Agent $e0 $x1) (Member $x1 kitchen_island))    ;; n 1 docs 1  e.g. tierB-001663
(And (Member $e0 provide) (Agent $e0 media))    ;; n 1 docs 1  e.g. tierB-001482
(And (Member $e0 provide) (Agent $e0 $x1) (Member $x1 organisation))    ;; n 1 docs 1  e.g. tierB-000769
(And (Member $e0 provide) (Agent $e0 $x1) (Member $x1 power_station))    ;; n 1 docs 1  e.g. tierB-001260
(And (Member $e0 provide) (Agent $e0 $x1) (Member $x1 witness))    ;; n 1 docs 1  e.g. tierB-001262

;; ---- slot provide.Theme  [event center; head role]  n 5  docs<= 7  distinct 7  eventive 0
(And (Member $e0 provide) (Theme $e0 electricity))    ;; n 1 docs 1  e.g. tierB-001260
(And (Member $e0 provide) (Theme $e0 food))    ;; n 1 docs 1  e.g. tierB-000769
(And (Member $e0 provide) (Theme $e0 plurivocality))    ;; n 1 docs 1  e.g. tierB-001482
(And (Member $e0 provide) (Theme $e0 $x1) (Member $x1 counter_space))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001663
(And (Member $e0 provide) (Theme $e0 $x1) (Member $x1 description))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001262
(And (Member $e0 provide) (Theme $e0 $x1) (Member $x1 detailed))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001262
(And (Member $e0 provide) (Theme $e0 $x1) (Member $x1 extra))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001663

;; ---- slot ready.Experiencer  [event center; head role]  n 5  docs<= 5  distinct 5  eventive 0
(And (Member $e0 ready) (Experiencer $e0 $x1) (Member $x1 cake))    ;; n 1 docs 1  e.g. tierB-000916
(And (Member $e0 ready) (Experiencer $e0 $x1) (Member $x1 dinner))    ;; n 1 docs 1  e.g. tierB-000168
(And (Member $e0 ready) (Experiencer $e0 leonid))    ;; n 1 docs 1  e.g. tierB-001185
(And (Member $e0 ready) (Experiencer $e0 skura))    ;; n 1 docs 1  e.g. tierB-000044
(And (Member $e0 ready) (Experiencer $e0 yanni))    ;; n 1 docs 1  e.g. tierB-000044

;; ---- slot say.Theme  [event center; head role]  n 5  docs<= 5  distinct 4  eventive 0
(And (Member $e0 say) (Theme $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierB-000080 tierB-000865
(And (Member $e0 say) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001602
(And (Member $e0 say) (Theme $e0 <term:Inheritance>))    ;; n 1 docs 1  e.g. tierB-001441
(And (Member $e0 say) (Theme $e0 $x1) (Member $x1 funeral_prayer))    ;; n 1 docs 1  e.g. tierB-001626

;; ---- slot sell.Agent  [event center; head role]  n 5  docs<= 6  distinct 5  eventive 0
(And (Member $e0 sell) (Agent $e0 $x1) (Member $x1 company))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198
(And (Member $e0 sell) (Agent $e0 mennad))    ;; n 1 docs 1  e.g. tierB-000257
(And (Member $e0 sell) (Agent $e0 $x1) (Member $x1 newspaper))    ;; n 1 docs 1  e.g. tierB-000784
(And (Member $e0 sell) (Agent $e0 $x1) (Member $x1 coffee_brand))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000975
(And (Member $e0 sell) (Agent $e0 $x1) (Member $x1 indie))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000975

;; ---- slot sing.Theme  [event center; head role]  n 5  docs<= 3  distinct 2  eventive 0
(And (Member $e0 sing) (Theme $e0 music))    ;; n 4 docs 2  e.g. tierC-000127 tierC-000128
(And (Member $e0 sing) (Theme $e0 $x1) (Member $x1 song))    ;; n 1 docs 1  e.g. tierB-001156

;; ---- slot sleep.Location  [event center; head role]  n 5  docs<= 5  distinct 3  eventive 0
(And (Member $e0 sleep) (Location $e0 $x1) (Member $x1 couch))    ;; n 3 docs 3  e.g. tierB-001003 tierC-000041
(And (Member $e0 sleep) (Location $e0 inside))    ;; n 1 docs 1  e.g. tierB-001334
(And (Member $e0 sleep) (Location $e0 $x1) (Member $x1 mat))    ;; n 1 docs 1  e.g. tierB-001753

;; ---- slot stand.Experiencer  [event center; head role]  n 5  docs<= 5  distinct 5  eventive 0
(And (Member $e0 stand) (Experiencer $e0 alberto))    ;; n 1 docs 1  e.g. tierB-001299
(And (Member $e0 stand) (Experiencer $e0 diego))    ;; n 1 docs 1  e.g. tierB-000676
(And (Member $e0 stand) (Experiencer $e0 edmundo))    ;; n 1 docs 1  e.g. tierB-001604
(And (Member $e0 stand) (Experiencer $e0 $x1) (Member $x1 general))    ;; n 1 docs 1  e.g. tierB-001782
(And (Member $e0 stand) (Experiencer $e0 $x1) (Member $x1 student))    ;; n 1 docs 1  e.g. tierB-000712

;; ---- slot start.Experiencer  [event center; head role]  n 5  docs<= 5  distinct 4  eventive 0
(And (Member $e0 start) (Experiencer $e0 $x1) (Member $x1 bridge))    ;; n 2 docs 2  e.g. tierC-000125 tierC-000126
(And (Member $e0 start) (Experiencer $e0 gunter))    ;; n 1 docs 1  e.g. tierB-000534
(And (Member $e0 start) (Experiencer $e0 oleg))    ;; n 1 docs 1  e.g. tierB-001479
(And (Member $e0 start) (Experiencer $e0 $x1) (Member $x1 tunnel))    ;; n 1 docs 1  e.g. tierC-000125

;; ---- slot swim.Agent  [event center; head role]  n 5  docs<= 8  distinct 5  eventive 0
(And (Member $e0 swim) (Agent $e0 $x1) (Member $x1 fish))    ;; n 3 (mass 1.5) docs 3  e.g. tierB-000782 tierB-001008
(And (Member $e0 swim) (Agent $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierB-001511
(And (Member $e0 swim) (Agent $e0 linda))    ;; n 1 docs 1  e.g. tierB-000313
(And (Member $e0 swim) (Agent $e0 $x1) (Member $x1 school))    ;; n 2 (mass 1) docs 2  e.g. tierB-000782 tierB-001008
(And (Member $e0 swim) (Agent $e0 $x1) (Member $x1 red))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001268

;; ---- slot travel.Agent  [event center; head role]  n 5  docs<= 4  distinct 4  eventive 0
(And (Member $e0 travel) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 1  e.g. tierB-001618
(And (Member $e0 travel) (Agent $e0 $x1) (Member $x1 campaigner))    ;; n 1 docs 1  e.g. tierB-000830
(And (Member $e0 travel) (Agent $e0 matthew))    ;; n 1 docs 1  e.g. tierB-000667
(And (Member $e0 travel) (Agent $e0 roger))    ;; n 1 docs 1  e.g. tierB-000995

;; ---- slot watch.Agent  [event center; head role]  n 5  docs<= 5  distinct 5  eventive 0
(And (Member $e0 watch) (Agent $e0 baya))    ;; n 1 docs 1  e.g. tierB-000651
(And (Member $e0 watch) (Agent $e0 $x1) (Member $x1 coach))    ;; n 1 docs 1  e.g. tierB-001720
(And (Member $e0 watch) (Agent $e0 $x1) (Member $x1 family))    ;; n 1 docs 1  e.g. tierB-000520
(And (Member $e0 watch) (Agent $e0 $x1) (Member $x1 government))    ;; n 1 docs 1  e.g. tierB-001800
(And (Member $e0 watch) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000258

;; ---- slot win.Theme  [event center; head role]  n 5  docs<= 5  distinct 2  eventive 0
(And (Member $e0 win) (Theme $e0 $x1) (Member $x1 emmy))    ;; n 4 docs 4  e.g. tierC-000277 tierC-000278
(And (Member $e0 win) (Theme $e0 $x1) (Member $x1 race))    ;; n 1 docs 1  e.g. tierB-000145

;; ---- slot accompany.Agent  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 accompany) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000127 tierC-000128
(And (Member $e0 accompany) (Agent $e0 $x1) (Member $x1 sister))    ;; n 2 docs 2  e.g. tierC-000127 tierC-000128

;; ---- slot accompany.Theme  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 accompany) (Theme $e0 silent_film))    ;; n 4 docs 2  e.g. tierC-000127 tierC-000128

;; ---- slot active.Time  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 active) (Time $e0 early_morning))    ;; n 2 docs 2  e.g. tierC-000201 tierC-000202
(And (Member $e0 active) (Time $e0 late_afternoon))    ;; n 2 docs 2  e.g. tierC-000201 tierC-000202

;; ---- slot add.Theme  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 add) (Theme $e0 $x1) (Member $x1 illustration))    ;; n 2 docs 2  e.g. tierC-000231 tierC-000232
(And (Member $e0 add) (Theme $e0 $x1) (Member $x1 clove))    ;; n 1 docs 1  e.g. tierB-000462
(And (Member $e0 add) (Theme $e0 $x1) (Member $x1 greenery))    ;; n 1 docs 1  e.g. tierB-001132

;; ---- slot arrive.Agent  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 arrive) (Agent $e0 donald))    ;; n 1 docs 1  e.g. tierB-000444
(And (Member $e0 arrive) (Agent $e0 $x1) (Member $x1 driver))    ;; n 1 docs 1  e.g. tierB-000237
(And (Member $e0 arrive) (Agent $e0 $x1) (Member $x1 paris_train))    ;; n 1 docs 1  e.g. tierB-001992
(And (Member $e0 arrive) (Agent $e0 $x1) (Member $x1 spring))    ;; n 1 docs 1  e.g. tierB-001440

;; ---- slot avoid.Theme  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 avoid) (Theme $e0 bankruptcy))    ;; n 1 docs 1  e.g. tierB-000171
(And (Member $e0 avoid) (Theme $e0 $x1) (Member $x1 conform))    ;; n 1 docs 1  e.g. tierB-000674
(And (Member $e0 avoid) (Theme $e0 $x1) (Member $x1 pitfall))    ;; n 1 docs 1  e.g. tierB-000246
(And (Member $e0 avoid) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierC-000124

;; ---- slot bad.Experiencer  [event center; head role]  n 4  docs<= 8  distinct 4  eventive 0
(And (Member $e0 bad) (Experiencer $e0 $x1) (Member $x1 bad))    ;; n 4 (mass 2) docs 4  e.g. tierB-000748 tierB-001594
(And (Member $e0 bad) (Experiencer $e0 $x1) (Member $x1 relationship))    ;; n 2 (mass 1) docs 2  e.g. tierC-000241 tierC-000242
(And (Member $e0 bad) (Experiencer $e0 $x1) (Member $x1 matter))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001594
(And (Member $e0 bad) (Experiencer $e0 $x1) (Member $x1 weather))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000748

;; ---- slot bear.Location  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 bear) (Location $e0 bromma))    ;; n 2 docs 2  e.g. tierC-000199 tierC-000200
(And (Member $e0 bear) (Location $e0 denmark))    ;; n 1 docs 1  e.g. tierB-001812
(And (Member $e0 bear) (Location $e0 $x1) (Member $x1 planet))    ;; n 1 docs 1  e.g. tierB-000906

;; ---- slot begin.Patient  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 begin) (Patient $e0 $x1) (Member $x1 night))    ;; n 1 docs 1  e.g. tierB-001048
(And (Member $e0 begin) (Patient $e0 school))    ;; n 1 docs 1  e.g. tierB-001085
(And (Member $e0 begin) (Patient $e0 $x1) (Member $x1 tree))    ;; n 1 docs 1  e.g. tierB-001394
(And (Member $e0 begin) (Patient $e0 $x1) (Member $x1 uprising))    ;; n 1 docs 1  e.g. tierB-000182

;; ---- slot begin.Time  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 begin) (Time $e0 <term:Day>))    ;; n 1 docs 1  e.g. tierB-000182
(And (Member $e0 begin) (Time $e0 <term:Hour>))    ;; n 1 docs 1  e.g. tierB-001085
(And (Member $e0 begin) (Time $e0 <term:Minute>))    ;; n 1 docs 1  e.g. tierB-001085
(And (Member $e0 begin) (Time $e0 <term:Month>))    ;; n 1 docs 1  e.g. tierB-000182

;; ---- slot bring.Theme  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 bring) (Theme $e0 advantage))    ;; n 1 docs 1  e.g. tierB-001013
(And (Member $e0 bring) (Theme $e0 $x1) (Member $x1 british_ship))    ;; n 1 docs 1  e.g. tierB-000636
(And (Member $e0 bring) (Theme $e0 chinese_dumpling))    ;; n 1 docs 1  e.g. tierC-000351
(And (Member $e0 bring) (Theme $e0 jonathan))    ;; n 1 docs 1  e.g. tierB-000427

;; ---- slot capture.Agent  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 capture) (Agent $e0 $x1) (Member $x1 falcon))    ;; n 1 docs 1  e.g. tierB-000852
(And (Member $e0 capture) (Agent $e0 $x1) (Member $x1 pirate))    ;; n 1 docs 1  e.g. tierB-001990
(And (Member $e0 capture) (Agent $e0 spain))    ;; n 1 docs 1  e.g. tierB-000215
(And (Member $e0 capture) (Agent $e0 $x1) (Member $x1 troop))    ;; n 1 docs 1  e.g. tierB-001342

;; ---- slot cause.Patient  [event center; head role]  n 4  docs<= 5  distinct 5  eventive 0
(And (Member $e0 cause) (Patient $e0 abandonment_anxiety))    ;; n 1 docs 1  e.g. tierB-001089
(And (Member $e0 cause) (Patient $e0 $x1) (Member $x1 damage))    ;; n 1 docs 1  e.g. tierB-000775
(And (Member $e0 cause) (Patient $e0 $x1) (Member $x1 earthquake))    ;; n 1 docs 1  e.g. tierB-001649
(And (Member $e0 cause) (Patient $e0 $x1) (Member $x1 creaking))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000805
(And (Member $e0 cause) (Patient $e0 $x1) (Member $x1 sound))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000805

;; ---- slot change.Agent  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 change) (Agent $e0 cameron))    ;; n 1 docs 1  e.g. tierC-000011
(And (Member $e0 change) (Agent $e0 french_dahomey))    ;; n 1 docs 1  e.g. tierB-000139
(And (Member $e0 change) (Agent $e0 $x1) (Member $x1 leaf))    ;; n 1 docs 1  e.g. tierB-000098
(And (Member $e0 change) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 docs 1  e.g. tierB-001803

;; ---- slot close.Experiencer  [event center; head role]  n 4  docs<= 2  distinct 2  eventive 0
(And (Member $e0 close) (Experiencer $e0 low_german))    ;; n 3 docs 1  e.g. tierB-000188
(And (Member $e0 close) (Experiencer $e0 boldi))    ;; n 1 docs 1  e.g. tierB-000079

;; ---- slot come.Source  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 come) (Source $e0 $x1) (Member $x1 garden))    ;; n 1 docs 1  e.g. tierB-000677
(And (Member $e0 come) (Source $e0 greek))    ;; n 1 docs 1  e.g. tierB-000152
(And (Member $e0 come) (Source $e0 $x1) (Member $x1 place))    ;; n 1 docs 1  e.g. tierB-001774
(And (Member $e0 come) (Source $e0 $x1) (Member $x1 treeline))    ;; n 1 docs 1  e.g. tierB-001949

;; ---- slot connect.Theme  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 connect) (Theme $e0 kayalar))    ;; n 2 docs 2  e.g. tierC-000037 tierC-000038
(And (Member $e0 connect) (Theme $e0 nagoya))    ;; n 1 docs 1  e.g. tierB-001071
(And (Member $e0 connect) (Theme $e0 tokyo))    ;; n 1 docs 1  e.g. tierB-001071

;; ---- slot consider.Theme  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 consider) (Theme $e0 <term:Member>))    ;; n 2 docs 2  e.g. tierC-000233 tierC-000234
(And (Member $e0 consider) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001863
(And (Member $e0 consider) (Theme $e0 $x1) (Member $x1 issue))    ;; n 1 docs 1  e.g. tierB-001300

;; ---- slot create.Location  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 create) (Location $e0 $x1) (Member $x1 post))    ;; n 4 docs 2  e.g. tierC-000025 tierC-000026

;; ---- slot decide.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 decide) (Agent $e0 fyodor))    ;; n 2 docs 2  e.g. tierB-000401 tierB-001597
(And (Member $e0 decide) (Agent $e0 beth))    ;; n 1 docs 1  e.g. tierB-001544
(And (Member $e0 decide) (Agent $e0 elias))    ;; n 1 docs 1  e.g. tierB-000563

;; ---- slot decide.Theme  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 2
(And (Member $e0 decide) (Theme $e0 <term:And>))    ;; n 2 docs 2  e.g. tierB-000563 tierB-001597
(And (Member $e0 decide) (Theme $e0 $e1) (Member $e1 confront))    ;; n 1 docs 1  e.g. tierB-000401
(And (Member $e0 decide) (Theme $e0 $e1) (Member $e1 study))    ;; n 1 docs 1  e.g. tierB-001544

;; ---- slot design.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 design) (Agent $e0 henry_l_taylor))    ;; n 2 docs 2  e.g. tierC-000119 tierC-000120
(And (Member $e0 design) (Agent $e0 philip_hercus))    ;; n 1 docs 1  e.g. tierC-000184
(And (Member $e0 design) (Agent $e0 robert_allan_limited))    ;; n 1 docs 1  e.g. tierC-000184

;; ---- slot design.Patient  [event center; head role]  n 4  docs<= 3  distinct 2  eventive 0
(And (Member $e0 design) (Patient $e0 $x1) (Member $x1 pacificat))    ;; n 2 docs 1  e.g. tierC-000184
(And (Member $e0 design) (Patient $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierC-000119 tierC-000120

;; ---- slot die.Patient  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 die) (Patient $e0 $x1) (Member $x1 person))    ;; n 3 docs 3  e.g. tierB-001967 tierC-000199
(And (Member $e0 die) (Patient $e0 $x1) (Member $x1 family))    ;; n 1 docs 1  e.g. tierB-000838

;; ---- slot do.Patient  [event center; head role]  n 4  docs<= 5  distinct 4  eventive 0
(And (Member $e0 do) (Patient $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierB-001520 tierB-001721
(And (Member $e0 do) (Patient $e0 $x1) (Member $x1 dish))    ;; n 1 docs 1  e.g. tierB-001955
(And (Member $e0 do) (Patient $e0 $x1) (Member $x1 dance))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001735
(And (Member $e0 do) (Patient $e0 $x1) (Member $x1 little))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001735

;; ---- slot eat.Agent  [event center; head role]  n 4  docs<= 5  distinct 5  eventive 0
(And (Member $e0 eat) (Agent $e0 $x1) (Member $x1 bird))    ;; n 1 docs 1  e.g. tierB-001973
(And (Member $e0 eat) (Agent $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierB-000410
(And (Member $e0 eat) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000338
(And (Member $e0 eat) (Agent $e0 $x1) (Member $x1 brown))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001551
(And (Member $e0 eat) (Agent $e0 $x1) (Member $x1 dog))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001551

;; ---- slot encourage.In  [event center; head oblique]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 encourage) (In $e0 mathematics))    ;; n 2 docs 2  e.g. tierC-000107 tierC-000108
(And (Member $e0 encourage) (In $e0 chess))    ;; n 1 docs 1  e.g. tierC-000108
(And (Member $e0 encourage) (In $e0 chess_play))    ;; n 1 docs 1  e.g. tierC-000107

;; ---- slot enter.Theme  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 enter) (Theme $e0 $x1) (Member $x1 cave))    ;; n 1 docs 1  e.g. tierB-000163
(And (Member $e0 enter) (Theme $e0 issaquah_creek))    ;; n 1 docs 1  e.g. tierC-000064
(And (Member $e0 enter) (Theme $e0 $x1) (Member $x1 park))    ;; n 1 docs 1  e.g. tierC-000063
(And (Member $e0 enter) (Theme $e0 united_states))    ;; n 1 docs 1  e.g. tierB-000622

;; ---- slot find.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 find) (Agent $e0 couper))    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244
(And (Member $e0 find) (Agent $e0 flavio))    ;; n 1 docs 1  e.g. tierB-001139
(And (Member $e0 find) (Agent $e0 pietro))    ;; n 1 docs 1  e.g. tierB-000706

;; ---- slot get.Theme  [event center; head role]  n 4  docs<= 5  distinct 5  eventive 1
(And (Member $e0 get) (Theme $e0 $e1) (Member $e1 arrest))    ;; n 1 docs 1  e.g. tierB-000770
(And (Member $e0 get) (Theme $e0 $x1) (Member $x1 hamster))    ;; n 1 docs 1  e.g. tierB-000672
(And (Member $e0 get) (Theme $e0 $x1) (Member $x1 snack))    ;; n 1 docs 1  e.g. tierB-001325
(And (Member $e0 get) (Theme $e0 $x1) (Member $x1 low))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000418
(And (Member $e0 get) (Theme $e0 $x1) (Member $x1 price))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000418

;; ---- slot give.Theme  [event center; head role]  n 4  docs<= 5  distinct 5  eventive 0
(And (Member $e0 give) (Theme $e0 chocolate))    ;; n 1 docs 1  e.g. tierB-001046
(And (Member $e0 give) (Theme $e0 mock_champagne))    ;; n 1 docs 1  e.g. tierB-001046
(And (Member $e0 give) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierC-000111
(And (Member $e0 give) (Theme $e0 $x1) (Member $x1 advice))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000137
(And (Member $e0 give) (Theme $e0 $x1) (Member $x1 good))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000137

;; ---- slot good.Experiencer  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 good) (Experiencer $e0 barley_bread))    ;; n 1 docs 1  e.g. tierB-000999
(And (Member $e0 good) (Experiencer $e0 thing))    ;; n 1 docs 1  e.g. tierB-001238
(And (Member $e0 good) (Experiencer $e0 $x1) (Member $x1 weather))    ;; n 1 docs 1  e.g. tierB-000495
(And (Member $e0 good) (Experiencer $e0 $x1) (Member $x1 windshield))    ;; n 1 docs 1  e.g. tierB-001521

;; ---- slot help.Theme  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 2
(And (Member $e0 help) (Theme $e0 $e1) (Member $e1 define))    ;; n 1 docs 1  e.g. tierB-001149
(And (Member $e0 help) (Theme $e0 $x1) (Member $x1 girl))    ;; n 1 docs 1  e.g. tierB-000319
(And (Member $e0 help) (Theme $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000299
(And (Member $e0 help) (Theme $e0 $e1) (Member $e1 thrive))    ;; n 1 docs 1  e.g. tierB-000858

;; ---- slot include.Agent  [event center; head role]  n 4  docs<= 2  distinct 2  eventive 0
(And (Member $e0 include) (Agent $e0 $x1) (Member $x1 nephew))    ;; n 3 docs 1  e.g. tierC-000139
(And (Member $e0 include) (Agent $e0 $x1) (Member $x1 parade))    ;; n 1 docs 1  e.g. tierB-000379

;; ---- slot increase.Patient  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 increase) (Patient $e0 $x1) (Member $x1 industrial_output))    ;; n 1 docs 1  e.g. tierB-000690
(And (Member $e0 increase) (Patient $e0 $x1) (Member $x1 motor_vehicle))    ;; n 1 docs 1  e.g. tierB-000680
(And (Member $e0 increase) (Patient $e0 $x1) (Member $x1 ukrainian_combat_loss))    ;; n 1 docs 1  e.g. tierB-000965
(And (Member $e0 increase) (Patient $e0 xenophobia))    ;; n 1 docs 1  e.g. tierB-001903

;; ---- slot kill.Location  [event center; head role]  n 4  docs<= 3  distinct 2  eventive 0
(And (Member $e0 kill) (Location $e0 $x1) (Member $x1 state))    ;; n 3 docs 2  e.g. tierC-000353 tierC-000354
(And (Member $e0 kill) (Location $e0 here))    ;; n 1 docs 1  e.g. tierB-001705

;; ---- slot kill.Manner  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 kill) (Manner $e0 directly))    ;; n 2 docs 2  e.g. tierC-000353 tierC-000354
(And (Member $e0 kill) (Manner $e0 indirectly))    ;; n 2 docs 2  e.g. tierC-000353 tierC-000354

;; ---- slot lie.Experiencer  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 lie) (Experiencer $e0 $x1) (Member $x1 book))    ;; n 1 docs 1  e.g. tierB-001078
(And (Member $e0 lie) (Experiencer $e0 $x1) (Member $x1 notebook))    ;; n 1 docs 1  e.g. tierB-001078
(And (Member $e0 lie) (Experiencer $e0 $x1) (Member $x1 pen))    ;; n 1 docs 1  e.g. tierB-001078
(And (Member $e0 lie) (Experiencer $e0 $x1) (Member $x1 tape_recorder))    ;; n 1 docs 1  e.g. tierB-001041

;; ---- slot lie.Location  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 lie) (Location $e0 $x1) (Member $x1 table))    ;; n 4 docs 2  e.g. tierB-001041 tierB-001078

;; ---- slot look.Experiencer  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 look) (Experiencer $e0 europe))    ;; n 1 docs 1  e.g. tierB-001135
(And (Member $e0 look) (Experiencer $e0 $x1) (Member $x1 flag))    ;; n 1 docs 1  e.g. tierB-000831
(And (Member $e0 look) (Experiencer $e0 $x1) (Member $x1 island))    ;; n 1 docs 1  e.g. tierB-000230
(And (Member $e0 look) (Experiencer $e0 $x1) (Member $x1 school))    ;; n 1 docs 1  e.g. tierB-000297

;; ---- slot look.Like  [event center; head oblique]  n 4  docs<= 6  distinct 6  eventive 0
(And (Member $e0 look) (Like $e0 $x1) (Member $x1 paradise))    ;; n 1 docs 1  e.g. tierB-001135
(And (Member $e0 look) (Like $e0 prison))    ;; n 1 docs 1  e.g. tierB-000297
(And (Member $e0 look) (Like $e0 $x1) (Member $x1 huge))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000230
(And (Member $e0 look) (Like $e0 $x1) (Member $x1 inverted))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000831
(And (Member $e0 look) (Like $e0 $x1) (Member $x1 philippine_flag))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000831
(And (Member $e0 look) (Like $e0 $x1) (Member $x1 spider))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000230

;; ---- slot move.Agent  [event center; head role]  n 4  docs<= 5  distinct 4  eventive 0
(And (Member $e0 move) (Agent $e0 $x1) (Member $x1 headquarters))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198
(And (Member $e0 move) (Agent $e0 sammy))    ;; n 1 docs 1  e.g. tierB-001570
(And (Member $e0 move) (Agent $e0 $x1) (Member $x1 fish))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000782
(And (Member $e0 move) (Agent $e0 $x1) (Member $x1 school))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000782

;; ---- slot perform.Location  [event center; head role]  n 4  docs<= 3  distinct 3  eventive 0
(And (Member $e0 perform) (Location $e0 cafe))    ;; n 2 docs 1  e.g. tierC-000127
(And (Member $e0 perform) (Location $e0 home))    ;; n 1 docs 1  e.g. tierB-000970
(And (Member $e0 perform) (Location $e0 public))    ;; n 1 docs 1  e.g. tierB-000970

;; ---- slot preach.Agent  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 preach) (Agent $e0 $x1) (Member $x1 person))    ;; n 4 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot preach.Location  [event center; head role]  n 4  docs<= 2  distinct 2  eventive 0
(And (Member $e0 preach) (Location $e0 gareccio))    ;; n 2 docs 1  e.g. tierC-000048
(And (Member $e0 preach) (Location $e0 italy))    ;; n 2 docs 1  e.g. tierC-000047

;; ---- slot present.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 present) (Agent $e0 horner))    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012
(And (Member $e0 present) (Agent $e0 $x1) (Member $x1 company))    ;; n 1 docs 1  e.g. tierB-001932
(And (Member $e0 present) (Agent $e0 $x1) (Member $x1 golden_opportunity))    ;; n 1 docs 1  e.g. tierB-001486

;; ---- slot receive.Agent  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 receive) (Agent $e0 beth))    ;; n 1 docs 1  e.g. tierB-000962
(And (Member $e0 receive) (Agent $e0 franks))    ;; n 1 docs 1  e.g. tierB-001595
(And (Member $e0 receive) (Agent $e0 $x1) (Member $x1 refugee))    ;; n 1 docs 1  e.g. tierB-001035
(And (Member $e0 receive) (Agent $e0 $x1) (Member $x1 winner))    ;; n 1 docs 1  e.g. tierB-001693

;; ---- slot replace.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 replace) (Agent $e0 sherman_howard))    ;; n 2 docs 2  e.g. tierC-000359 tierC-000360
(And (Member $e0 replace) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000100
(And (Member $e0 replace) (Agent $e0 peter_gaussen))    ;; n 1 docs 1  e.g. tierC-000099

;; ---- slot replace.Theme  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 replace) (Theme $e0 lex_lex_luthor))    ;; n 1 docs 1  e.g. tierC-000360
(And (Member $e0 replace) (Theme $e0 lex_luthor))    ;; n 1 docs 1  e.g. tierC-000359
(And (Member $e0 replace) (Theme $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000099
(And (Member $e0 replace) (Theme $e0 william_ewer))    ;; n 1 docs 1  e.g. tierC-000100

;; ---- slot require.Theme  [event center; head role]  n 4  docs<= 6  distinct 6  eventive 0
(And (Member $e0 require) (Theme $e0 $x1) (Member $x1 american_phone_number))    ;; n 1 docs 1  e.g. tierB-000607
(And (Member $e0 require) (Theme $e0 $x1) (Member $x1 repair))    ;; n 1 docs 1  e.g. tierB-001436
(And (Member $e0 require) (Theme $e0 $x1) (Member $x1 hard))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001980
(And (Member $e0 require) (Theme $e0 $x1) (Member $x1 id_card))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001566
(And (Member $e0 require) (Theme $e0 $x1) (Member $x1 valid))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001566
(And (Member $e0 require) (Theme $e0 $x1) (Member $x1 work))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001980

;; ---- slot specify.In  [event center; head oblique]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 specify) (In $e0 continuous_time))    ;; n 2 docs 2  e.g. tierC-000267 tierC-000268
(And (Member $e0 specify) (In $e0 discrete_time))    ;; n 2 docs 2  e.g. tierC-000267 tierC-000268

;; ---- slot spend.Agent  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 spend) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048
(And (Member $e0 spend) (Agent $e0 $x1) (Member $x1 giraffe))    ;; n 1 docs 1  e.g. tierB-001146
(And (Member $e0 spend) (Agent $e0 may))    ;; n 1 docs 1  e.g. tierB-000883

;; ---- slot star.Agent  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 star) (Agent $e0 $x1) (Member $x1 thing))    ;; n 4 docs 2  e.g. tierC-000137 tierC-000138

;; ---- slot star.Theme  [event center; head role]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $e0 star) (Theme $e0 jeremy_irons))    ;; n 2 docs 2  e.g. tierC-000137 tierC-000138
(And (Member $e0 star) (Theme $e0 patricia_kaas))    ;; n 2 docs 2  e.g. tierC-000137 tierC-000138

;; ---- slot stop.Agent  [event center; head role]  n 4  docs<= 5  distinct 5  eventive 0
(And (Member $e0 stop) (Agent $e0 rima))    ;; n 1 docs 1  e.g. tierB-000030
(And (Member $e0 stop) (Agent $e0 skura))    ;; n 1 docs 1  e.g. tierB-000030
(And (Member $e0 stop) (Agent $e0 yanni))    ;; n 1 docs 1  e.g. tierB-000125
(And (Member $e0 stop) (Agent $e0 $x1) (Member $x1 adaptor))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001873
(And (Member $e0 stop) (Agent $e0 $x1) (Member $x1 old))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001873

;; ---- slot stop.Theme  [event center; head role]  n 4  docs<= 3  distinct 2  eventive 4
(And (Member $e0 stop) (Theme $e0 $e1) (Member $e1 cry))    ;; n 2 docs 1  e.g. tierB-000030
(And (Member $e0 stop) (Theme $e0 $e1) (Member $e1 work))    ;; n 2 docs 2  e.g. tierB-001515 tierB-001873

;; ---- slot support.Theme  [event center; head role]  n 4  docs<= 2  distinct 1  eventive 0
(And (Member $e0 support) (Theme $e0 $x1) (Member $x1 view))    ;; n 4 docs 2  e.g. tierC-000160 tierC-000356

;; ---- slot tell.Theme  [event center; head role]  n 4  docs<= 4  distinct 3  eventive 0
(And (Member $e0 tell) (Theme $e0 <term:Question>))    ;; n 2 docs 2  e.g. tierC-000035 tierC-000036
(And (Member $e0 tell) (Theme $e0 $x1) (Member $x1 lie))    ;; n 1 docs 1  e.g. tierB-000742
(And (Member $e0 tell) (Theme $e0 $x1) (Member $x1 truth))    ;; n 1 docs 1  e.g. tierB-000745

;; ---- slot use.Manner  [event center; head role]  n 4  docs<= 3  distinct 3  eventive 0
(And (Member $e0 use) (Manner $e0 rarely))    ;; n 2 docs 1  e.g. tierC-000005
(And (Member $e0 use) (Manner $e0 colloquially))    ;; n 1 docs 1  e.g. tierB-000866
(And (Member $e0 use) (Manner $e0 responsibly))    ;; n 1 docs 1  e.g. tierB-000268

;; ---- slot walk.Goal  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 walk) (Goal $e0 $x1) (Member $x1 back))    ;; n 1 docs 1  e.g. tierB-001044
(And (Member $e0 walk) (Goal $e0 $x1) (Member $x1 classroom))    ;; n 1 docs 1  e.g. tierB-001219
(And (Member $e0 walk) (Goal $e0 $x1) (Member $x1 forest))    ;; n 1 docs 1  e.g. tierB-000929
(And (Member $e0 walk) (Goal $e0 $x1) (Member $x1 store))    ;; n 1 docs 1  e.g. tierB-000324

;; ---- slot walk.Location  [event center; head role]  n 4  docs<= 5  distinct 5  eventive 0
(And (Member $e0 walk) (Location $e0 $x1) (Member $x1 dark))    ;; n 1 docs 1  e.g. tierB-000148
(And (Member $e0 walk) (Location $e0 $x1) (Member $x1 hallway))    ;; n 1 docs 1  e.g. tierB-000951
(And (Member $e0 walk) (Location $e0 $x1) (Member $x1 wood_floor))    ;; n 1 docs 1  e.g. tierB-000805
(And (Member $e0 walk) (Location $e0 $x1) (Member $x1 balloon))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000036
(And (Member $e0 walk) (Location $e0 $x1) (Member $x1 little))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000036

;; ---- slot watch.Theme  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 watch) (Theme $e0 $x1) (Member $x1 activity))    ;; n 1 docs 1  e.g. tierB-001800
(And (Member $e0 watch) (Theme $e0 $x1) (Member $x1 event))    ;; n 1 docs 1  e.g. tierB-000258
(And (Member $e0 watch) (Theme $e0 $x1) (Member $x1 movie))    ;; n 1 docs 1  e.g. tierB-000520
(And (Member $e0 watch) (Theme $e0 natural_hair_video))    ;; n 1 docs 1  e.g. tierB-000651

;; ---- slot win.For  [event center; head oblique]  n 4  docs<= 4  distinct 2  eventive 4
(And (Member $e0 win) (For $e0 $e1) (Member $e1 portray))    ;; n 3 docs 3  e.g. tierC-000277 tierC-000278
(And (Member $e0 win) (For $e0 $e1) (Member $e1 portrayal))    ;; n 1 docs 1  e.g. tierC-000302

;; ---- slot work.Location  [event center; head role]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $e0 work) (Location $e0 church_of_norway))    ;; n 1 docs 1  e.g. tierC-000079
(And (Member $e0 work) (Location $e0 europe))    ;; n 1 docs 1  e.g. tierB-000419
(And (Member $e0 work) (Location $e0 $x1) (Member $x1 factory))    ;; n 1 docs 1  e.g. tierB-001187
(And (Member $e0 work) (Location $e0 $x1) (Member $x1 prison_kitchen))    ;; n 1 docs 1  e.g. tierB-000867

;; ---- slot discover.Theme  [event center; head role]  n 4  docs<= 6  distinct 5  eventive 0
(And (Member $e0 discover) (Theme $e0 $x1) (Member $x1 name))    ;; n 2 docs 2  e.g. tierC-000111 tierC-000112
(And (Member $e0 discover) (Theme $e0 $x1) (Member $x1 pterosaur_egg))    ;; n 1 docs 1  e.g. tierB-000658
(And (Member $e0 discover) (Theme $e0 $x1) (Member $x1 magnet))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001251
(And (Member $e0 discover) (Theme $e0 $x1) (Member $x1 new))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001251
(And (Member $e0 discover) (Theme $e0 $x1) (Member $x1 type))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001251

;; ---- slot jump.Agent  [event center; head role]  n 4  docs<= 6  distinct 6  eventive 0
(And (Member $e0 jump) (Agent $e0 $x1) (Member $x1 boy))    ;; n 1 docs 1  e.g. tierB-001530
(And (Member $e0 jump) (Agent $e0 $x1) (Member $x1 cow))    ;; n 1 docs 1  e.g. tierB-000889
(And (Member $e0 jump) (Agent $e0 $x1) (Member $x1 donkey))    ;; n 1 docs 1  e.g. tierB-001983
(And (Member $e0 jump) (Agent $e0 $x1) (Member $x1 brown))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000871
(And (Member $e0 jump) (Agent $e0 $x1) (Member $x1 fox))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000871
(And (Member $e0 jump) (Agent $e0 $x1) (Member $x1 quick))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000871

;; ---- slot active.Experiencer  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 active) (Experiencer $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierC-000201 tierC-000202
(And (Member $e0 active) (Experiencer $e0 asserson))    ;; n 1 docs 1  e.g. tierC-000080

;; ---- slot affect.Agent  [event center; head role]  n 3  docs<= 1  distinct 1  eventive 0
(And (Member $e0 affect) (Agent $e0 $x1) (Member $x1 cyberattack))    ;; n 3 docs 1  e.g. tierB-001275

;; ---- slot affect.Location  [event center; head role]  n 3  docs<= 1  distinct 1  eventive 0
(And (Member $e0 affect) (Location $e0 $x1) (Member $x1 world))    ;; n 3 docs 1  e.g. tierB-001275

;; ---- slot affect.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 affect) (Theme $e0 bank))    ;; n 1 docs 1  e.g. tierB-001275
(And (Member $e0 affect) (Theme $e0 company))    ;; n 1 docs 1  e.g. tierB-001275
(And (Member $e0 affect) (Theme $e0 hospital))    ;; n 1 docs 1  e.g. tierB-001275

;; ---- slot affect.Time  [event center; head role]  n 3  docs<= 1  distinct 1  eventive 0
(And (Member $e0 affect) (Time $e0 this_year))    ;; n 3 docs 1  e.g. tierB-001275

;; ---- slot approve.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 approve) (Theme $e0 $x1) (Member $x1 bill))    ;; n 1 docs 1  e.g. tierB-000974
(And (Member $e0 approve) (Theme $e0 $x1) (Member $x1 plan))    ;; n 1 docs 1  e.g. tierB-000037
(And (Member $e0 approve) (Theme $e0 $x1) (Member $x1 treaty))    ;; n 1 docs 1  e.g. tierB-000128

;; ---- slot attack.Patient  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 attack) (Patient $e0 $x1) (Member $x1 building))    ;; n 1 docs 1  e.g. tierB-001688
(And (Member $e0 attack) (Patient $e0 consumer_rights))    ;; n 1 docs 1  e.g. tierB-000673
(And (Member $e0 attack) (Patient $e0 rodrigo))    ;; n 1 docs 1  e.g. tierB-000345

;; ---- slot bake.Agent  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 bake) (Agent $e0 $x1) (Member $x1 company))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198
(And (Member $e0 bake) (Agent $e0 ella))    ;; n 1 docs 1  e.g. tierB-000464

;; ---- slot bake.Patient  [event center; head role]  n 3  docs<= 4  distinct 4  eventive 0
(And (Member $e0 bake) (Patient $e0 ice_cone))    ;; n 1 docs 1  e.g. tierC-000198
(And (Member $e0 bake) (Patient $e0 ice_cream_cone))    ;; n 1 docs 1  e.g. tierC-000197
(And (Member $e0 bake) (Patient $e0 $x1) (Member $x1 pie))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000464
(And (Member $e0 bake) (Patient $e0 $x1) (Member $x1 scrumptious))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000464

;; ---- slot base.On  [event center; head oblique]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 base) (On $e0 $x1) (Member $x1 fight))    ;; n 1 docs 1  e.g. tierB-001610
(And (Member $e0 base) (On $e0 $x1) (Member $x1 latin_alphabet))    ;; n 1 docs 1  e.g. tierB-001605
(And (Member $e0 base) (On $e0 puritan_value))    ;; n 1 docs 1  e.g. tierB-001928

;; ---- slot beautiful.Experiencer  [event center; head role]  n 3  docs<= 5  distinct 4  eventive 0
(And (Member $e0 beautiful) (Experiencer $e0 $x1) (Member $x1 beautiful))    ;; n 2 (mass 1) docs 2  e.g. tierB-000904 tierB-001920
(And (Member $e0 beautiful) (Experiencer $e0 $x1) (Member $x1 weather))    ;; n 1 docs 1  e.g. tierB-000565
(And (Member $e0 beautiful) (Experiencer $e0 $x1) (Member $x1 moon))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000904
(And (Member $e0 beautiful) (Experiencer $e0 $x1) (Member $x1 room))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001920

;; ---- slot break_out.Patient  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 1
(And (Member $e0 break_out) (Patient $e0 $x1) (Member $x1 fire))    ;; n 1 docs 1  e.g. tierB-001302
(And (Member $e0 break_out) (Patient $e0 $x1) (Member $x1 forest_fire))    ;; n 1 docs 1  e.g. tierB-001694
(And (Member $e0 break_out) (Patient $e0 $e1) (Member $e1 war))    ;; n 1 docs 1  e.g. tierB-001641

;; ---- slot bring.Goal  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 bring) (Goal $e0 $x1) (Member $x1 gallows))    ;; n 1 docs 1  e.g. tierB-000427
(And (Member $e0 bring) (Goal $e0 indonesia))    ;; n 1 docs 1  e.g. tierC-000351
(And (Member $e0 bring) (Goal $e0 united_states))    ;; n 1 docs 1  e.g. tierB-000636

;; ---- slot buy.Agent  [event center; head role]  n 3  docs<= 2  distinct 2  eventive 0
(And (Member $e0 buy) (Agent $e0 keike))    ;; n 2 docs 1  e.g. tierB-000367
(And (Member $e0 buy) (Agent $e0 regis))    ;; n 1 docs 1  e.g. tierB-001690

;; ---- slot change.Time  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 change) (Time $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-000139
(And (Member $e0 change) (Time $e0 past_year))    ;; n 1 docs 1  e.g. tierB-001217
(And (Member $e0 change) (Time $e0 tonight))    ;; n 1 docs 1  e.g. tierB-001588

;; ---- slot close.Agent  [event center; head role]  n 3  docs<= 4  distinct 4  eventive 0
(And (Member $e0 close) (Agent $e0 $x1) (Member $x1 guard))    ;; n 1 docs 1  e.g. tierB-001926
(And (Member $e0 close) (Agent $e0 $x1) (Member $x1 pilot))    ;; n 1 docs 1  e.g. tierB-000950
(And (Member $e0 close) (Agent $e0 $x1) (Member $x1 female))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001205
(And (Member $e0 close) (Agent $e0 $x1) (Member $x1 giraffe))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001205

;; ---- slot close.Goal  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 close) (Goal $e0 dutch))    ;; n 1 docs 1  e.g. tierB-000188
(And (Member $e0 close) (Goal $e0 frisian))    ;; n 1 docs 1  e.g. tierB-000188
(And (Member $e0 close) (Goal $e0 high_german))    ;; n 1 docs 1  e.g. tierB-000188

;; ---- slot close.Patient  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 close) (Patient $e0 $x1) (Member $x1 door))    ;; n 2 docs 2  e.g. tierB-000950 tierB-001926
(And (Member $e0 close) (Patient $e0 $x1) (Member $x1 store))    ;; n 1 docs 1  e.g. tierB-000218

;; ---- slot come.Goal  [event center; head role]  n 3  docs<= 4  distinct 4  eventive 0
(And (Member $e0 come) (Goal $e0 $x1) (Member $x1 concert))    ;; n 1 docs 1  e.g. tierB-000387
(And (Member $e0 come) (Goal $e0 $x1) (Member $x1 conclusion))    ;; n 1 docs 1  e.g. tierB-001963
(And (Member $e0 come) (Goal $e0 $x1) (Member $x1 political))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001534
(And (Member $e0 come) (Goal $e0 $x1) (Member $x1 settlement))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001534

;; ---- slot come.Patient  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 come) (Patient $e0 $x1) (Member $x1 insect_sound))    ;; n 1 docs 1  e.g. tierB-000677
(And (Member $e0 come) (Patient $e0 $x1) (Member $x1 sound))    ;; n 1 docs 1  e.g. tierB-001949
(And (Member $e0 come) (Patient $e0 $x1) (Member $x1 typhoon))    ;; n 1 docs 1  e.g. tierB-001697

;; ---- slot come_back.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 come_back) (Agent $e0 $x1) (Member $x1 boy))    ;; n 1 docs 1  e.g. tierB-000337
(And (Member $e0 come_back) (Agent $e0 $x1) (Member $x1 dad))    ;; n 1 docs 1  e.g. tierB-000575
(And (Member $e0 come_back) (Agent $e0 $x1) (Member $x1 mom))    ;; n 1 docs 1  e.g. tierB-000575

;; ---- slot compose.Patient  [event center; head role]  n 3  docs<= 4  distinct 3  eventive 0
(And (Member $e0 compose) (Patient $e0 $x1) (Member $x1 song))    ;; n 2 docs 2  e.g. tierC-000131 tierC-000132
(And (Member $e0 compose) (Patient $e0 $x1) (Member $x1 great))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001575
(And (Member $e0 compose) (Patient $e0 $x1) (Member $x1 symphony))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001575

;; ---- slot conduct.Agent  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 conduct) (Agent $e0 carl_fenton))    ;; n 2 docs 2  e.g. tierC-000341 tierC-000342
(And (Member $e0 conduct) (Agent $e0 fbi))    ;; n 1 docs 1  e.g. tierB-000177

;; ---- slot conduct.Theme  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 conduct) (Theme $e0 $x1) (Member $x1 orchestra))    ;; n 2 docs 2  e.g. tierC-000341 tierC-000342
(And (Member $e0 conduct) (Theme $e0 surveillance))    ;; n 1 docs 1  e.g. tierB-000177

;; ---- slot cover.Instrument  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 cover) (Instrument $e0 $x1) (Member $x1 paper_decoration))    ;; n 1 docs 1  e.g. tierB-001541
(And (Member $e0 cover) (Instrument $e0 snow))    ;; n 1 docs 1  e.g. tierB-001166
(And (Member $e0 cover) (Instrument $e0 weed))    ;; n 1 docs 1  e.g. tierB-000809

;; ---- slot cover.Patient  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 cover) (Patient $e0 $x1) (Member $x1 courtyard))    ;; n 1 docs 1  e.g. tierB-000809
(And (Member $e0 cover) (Patient $e0 $x1) (Member $x1 shopping_arcade))    ;; n 1 docs 1  e.g. tierB-001541
(And (Member $e0 cover) (Patient $e0 $x1) (Member $x1 top))    ;; n 1 docs 1  e.g. tierB-001166

;; ---- slot define.Theme  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 define) (Theme $e0 $x1) (Member $x1 sequence))    ;; n 2 docs 2  e.g. tierC-000261 tierC-000262
(And (Member $e0 define) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001149

;; ---- slot die.Location  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 die) (Location $e0 stockholm))    ;; n 2 docs 2  e.g. tierC-000199 tierC-000200
(And (Member $e0 die) (Location $e0 $x1) (Member $x1 fire))    ;; n 1 docs 1  e.g. tierB-000838

;; ---- slot drink.Patient  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 drink) (Patient $e0 tea))    ;; n 2 docs 1  e.g. tierB-000209
(And (Member $e0 drink) (Patient $e0 $x1) (Member $x1 good))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000993
(And (Member $e0 drink) (Patient $e0 $x1) (Member $x1 water))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000993

;; ---- slot drive.Agent  [event center; head role]  n 3  docs<= 2  distinct 2  eventive 0
(And (Member $e0 drive) (Agent $e0 $x1) (Member $x1 bus))    ;; n 2 docs 1  e.g. tierB-001430
(And (Member $e0 drive) (Agent $e0 $x1) (Member $x1 van))    ;; n 1 docs 1  e.g. tierB-000426

;; ---- slot encourage.Agent  [event center; head role]  n 3  docs<= 2  distinct 1  eventive 0
(And (Member $e0 encourage) (Agent $e0 ralph))    ;; n 3 docs 2  e.g. tierC-000107 tierC-000108

;; ---- slot encourage.Theme  [event center; head role]  n 3  docs<= 2  distinct 1  eventive 0
(And (Member $e0 encourage) (Theme $e0 maurice))    ;; n 3 docs 2  e.g. tierC-000107 tierC-000108

;; ---- slot endorse.Theme  [event center; head role]  n 3  docs<= 2  distinct 1  eventive 0
(And (Member $e0 endorse) (Theme $e0 $x1) (Member $x1 view))    ;; n 3 docs 2  e.g. tierC-000159 tierC-000355

;; ---- slot fall.Source  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 fall) (Source $e0 $x1) (Member $x1 shelf))    ;; n 1 docs 1  e.g. tierB-001364
(And (Member $e0 fall) (Source $e0 $x1) (Member $x1 sky))    ;; n 1 docs 1  e.g. tierB-000456
(And (Member $e0 fall) (Source $e0 $x1) (Member $x1 tree))    ;; n 1 docs 1  e.g. tierB-000779

;; ---- slot fight.Agent  [event center; head role]  n 3  docs<= 2  distinct 2  eventive 0
(And (Member $e0 fight) (Agent $e0 $x1) (Member $x1 kabye_person))    ;; n 2 docs 1  e.g. tierB-001629
(And (Member $e0 fight) (Agent $e0 $x1) (Member $x1 union_boss))    ;; n 1 docs 1  e.g. tierB-001379

;; ---- slot fight.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 fight) (Theme $e0 $x1) (Member $x1 freeze))    ;; n 1 docs 1  e.g. tierB-001379
(And (Member $e0 fight) (Theme $e0 islamic_fundamentalism))    ;; n 1 docs 1  e.g. tierB-001629
(And (Member $e0 fight) (Theme $e0 terrorism))    ;; n 1 docs 1  e.g. tierB-001629

;; ---- slot fund.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 fund) (Theme $e0 $x1) (Member $x1 border_section))    ;; n 1 docs 1  e.g. tierC-000217
(And (Member $e0 fund) (Theme $e0 lessos_kenya))    ;; n 1 docs 1  e.g. tierC-000218
(And (Member $e0 fund) (Theme $e0 lessos_uganda))    ;; n 1 docs 1  e.g. tierC-000245

;; ---- slot give.Agent  [event center; head role]  n 3  docs<= 2  distinct 2  eventive 0
(And (Member $e0 give) (Agent $e0 vladimir))    ;; n 2 docs 1  e.g. tierB-001046
(And (Member $e0 give) (Agent $e0 william))    ;; n 1 docs 1  e.g. tierB-000137

;; ---- slot go.Manner  [event center; head role]  n 3  docs<= 2  distinct 2  eventive 0
(And (Member $e0 go) (Manner $e0 late))    ;; n 2 docs 1  e.g. tierB-000012
(And (Member $e0 go) (Manner $e0 immediately))    ;; n 1 docs 1  e.g. tierB-001496

;; ---- slot grow.Patient  [event center; head role]  n 3  docs<= 4  distinct 4  eventive 0
(And (Member $e0 grow) (Patient $e0 $x1) (Member $x1 beard))    ;; n 1 docs 1  e.g. tierB-001512
(And (Member $e0 grow) (Patient $e0 kalman))    ;; n 1 docs 1  e.g. tierB-000228
(And (Member $e0 grow) (Patient $e0 $x1) (Member $x1 faint))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001384
(And (Member $e0 grow) (Patient $e0 $x1) (Member $x1 sound))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001384

;; ---- slot have.In  [event center; head oblique]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 have) (In $e0 fluid_mechanics))    ;; n 2 docs 2  e.g. tierC-000153 tierC-000154
(And (Member $e0 have) (In $e0 poetry))    ;; n 1 docs 1  e.g. tierB-001804

;; ---- slot hold.Patient  [event center; head role]  n 3  docs<= 4  distinct 4  eventive 0
(And (Member $e0 hold) (Patient $e0 $x1) (Member $x1 meeting))    ;; n 1 docs 1  e.g. tierB-000378
(And (Member $e0 hold) (Patient $e0 $x1) (Member $x1 prayer))    ;; n 1 docs 1  e.g. tierC-000284
(And (Member $e0 hold) (Patient $e0 $x1) (Member $x1 ceremony))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000283
(And (Member $e0 hold) (Patient $e0 $x1) (Member $x1 mass))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000283

;; ---- slot lead.Theme  [event center; head role]  n 3  docs<= 4  distinct 4  eventive 0
(And (Member $e0 lead) (Theme $e0 $x1) (Member $x1 sheep))    ;; n 1 docs 1  e.g. tierB-001086
(And (Member $e0 lead) (Theme $e0 $x1) (Member $x1 squad))    ;; n 1 docs 1  e.g. tierB-001782
(And (Member $e0 lead) (Theme $e0 $x1) (Member $x1 big))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000019
(And (Member $e0 lead) (Theme $e0 $x1) (Member $x1 cat_fight))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000019

;; ---- slot learn.Theme  [event center; head role]  n 3  docs<= 4  distinct 4  eventive 0
(And (Member $e0 learn) (Theme $e0 berber))    ;; n 1 docs 1  e.g. tierB-000229
(And (Member $e0 learn) (Theme $e0 vocabulary))    ;; n 1 docs 1  e.g. tierB-000282
(And (Member $e0 learn) (Theme $e0 $x1) (Member $x1 foreign))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000608
(And (Member $e0 learn) (Theme $e0 $x1) (Member $x1 language))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000608

;; ---- slot leave.Patient  [event center; head role]  n 3  docs<= 6  distinct 5  eventive 0
(And (Member $e0 leave) (Patient $e0 $x1) (Member $x1 door))    ;; n 2 (mass 1) docs 2  e.g. tierB-000425 tierB-000747
(And (Member $e0 leave) (Patient $e0 $x1) (Member $x1 light))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000004
(And (Member $e0 leave) (Patient $e0 $x1) (Member $x1 on))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000004
(And (Member $e0 leave) (Patient $e0 $x1) (Member $x1 open))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000425
(And (Member $e0 leave) (Patient $e0 $x1) (Member $x1 unlocked))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000747

;; ---- slot leave.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 leave) (Theme $e0 $x1) (Member $x1 car))    ;; n 1 docs 1  e.g. tierB-000704
(And (Member $e0 leave) (Theme $e0 $x1) (Member $x1 parking_lot))    ;; n 1 docs 1  e.g. tierB-000713
(And (Member $e0 leave) (Theme $e0 $x1) (Member $x1 room))    ;; n 1 docs 1  e.g. tierB-001350

;; ---- slot lose.Agent  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 lose) (Agent $e0 george_allen))    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162
(And (Member $e0 lose) (Agent $e0 $x1) (Member $x1 tire))    ;; n 1 docs 1  e.g. tierB-000236

;; ---- slot move.Goal  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 move) (Goal $e0 baltimore))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198
(And (Member $e0 move) (Goal $e0 here))    ;; n 1 docs 1  e.g. tierB-001570

;; ---- slot paint.Patient  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 paint) (Patient $e0 landscape))    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294
(And (Member $e0 paint) (Patient $e0 $x1) (Member $x1 gate))    ;; n 1 docs 1  e.g. tierB-000455

;; ---- slot pick_up.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 pick_up) (Agent $e0 $x1) (Member $x1 camera))    ;; n 1 docs 1  e.g. tierB-001040
(And (Member $e0 pick_up) (Agent $e0 jay))    ;; n 1 docs 1  e.g. tierB-000334
(And (Member $e0 pick_up) (Agent $e0 santiago))    ;; n 1 docs 1  e.g. tierB-001072

;; ---- slot play.Location  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 play) (Location $e0 havana))    ;; n 2 docs 2  e.g. tierC-000229 tierC-000230
(And (Member $e0 play) (Location $e0 $x1) (Member $x1 floor))    ;; n 1 docs 1  e.g. tierB-001125

;; ---- slot read.Agent  [event center; head role]  n 3  docs<= 4  distinct 4  eventive 0
(And (Member $e0 read) (Agent $e0 katya))    ;; n 1 docs 1  e.g. tierB-001637
(And (Member $e0 read) (Agent $e0 thomas))    ;; n 1 docs 1  e.g. tierB-001221
(And (Member $e0 read) (Agent $e0 $x1) (Member $x1 girl))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000783
(And (Member $e0 read) (Agent $e0 $x1) (Member $x1 little))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000783

;; ---- slot read.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 read) (Theme $e0 $x1) (Member $x1 comic))    ;; n 1 docs 1  e.g. tierB-001221
(And (Member $e0 read) (Theme $e0 $x1) (Member $x1 economics_magazine))    ;; n 1 docs 1  e.g. tierB-001637
(And (Member $e0 read) (Theme $e0 $x1) (Member $x1 fairy_tale))    ;; n 1 docs 1  e.g. tierB-000783

;; ---- slot require.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 1
(And (Member $e0 require) (Agent $e0 $x1) (Member $x1 app))    ;; n 1 docs 1  e.g. tierB-000607
(And (Member $e0 require) (Agent $e0 $x1) (Member $x1 house))    ;; n 1 docs 1  e.g. tierB-001436
(And (Member $e0 require) (Agent $e0 $e1) (Member $e1 master))    ;; n 1 docs 1  e.g. tierB-001980

;; ---- slot return.Agent  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 return) (Agent $e0 glasnow))    ;; n 2 docs 2  e.g. tierC-000255 tierC-000256
(And (Member $e0 return) (Agent $e0 $x1) (Member $x1 fishing_boat))    ;; n 1 docs 1  e.g. tierB-000688

;; ---- slot return.Goal  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 return) (Goal $e0 altoona))    ;; n 2 docs 2  e.g. tierC-000255 tierC-000256
(And (Member $e0 return) (Goal $e0 port))    ;; n 1 docs 1  e.g. tierB-000688

;; ---- slot rule.Agent  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 rule) (Agent $e0 tipu_sultan))    ;; n 2 docs 2  e.g. tierC-000095 tierC-000096
(And (Member $e0 rule) (Agent $e0 spain))    ;; n 1 docs 1  e.g. tierB-000311

;; ---- slot rule.Theme  [event center; head role]  n 3  docs<= 4  distinct 4  eventive 0
(And (Member $e0 rule) (Theme $e0 cuba))    ;; n 1 docs 1  e.g. tierB-000311
(And (Member $e0 rule) (Theme $e0 $x1) (Member $x1 muslim_house))    ;; n 1 docs 1  e.g. tierC-000096
(And (Member $e0 rule) (Theme $e0 $x1) (Member $x1 house))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000095
(And (Member $e0 rule) (Theme $e0 $x1) (Member $x1 muslim))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000095

;; ---- slot season.Instrument  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 season) (Instrument $e0 $x1) (Member $x1 horse_radish))    ;; n 1 docs 1  e.g. tierB-000733
(And (Member $e0 season) (Instrument $e0 lemongrass))    ;; n 1 docs 1  e.g. tierB-001692
(And (Member $e0 season) (Instrument $e0 ramson))    ;; n 1 docs 1  e.g. tierB-001692

;; ---- slot see.Stimulus  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 see) (Stimulus $e0 $x1) (Member $x1 animal))    ;; n 1 docs 1  e.g. tierB-000980
(And (Member $e0 see) (Stimulus $e0 $x1) (Member $x1 full_moon))    ;; n 1 docs 1  e.g. tierB-000686
(And (Member $e0 see) (Stimulus $e0 jessica))    ;; n 1 docs 1  e.g. tierB-000115

;; ---- slot shoot.Patient  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 shoot) (Patient $e0 $x1) (Member $x1 bear))    ;; n 1 docs 1  e.g. tierB-000813
(And (Member $e0 shoot) (Patient $e0 dan))    ;; n 1 docs 1  e.g. tierB-000256
(And (Member $e0 shoot) (Patient $e0 jfk))    ;; n 1 docs 1  e.g. tierB-001813

;; ---- slot sleep.Agent  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 sleep) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042
(And (Member $e0 sleep) (Agent $e0 $x1) (Member $x1 family))    ;; n 1 docs 1  e.g. tierB-001302

;; ---- slot solve.Patient  [event center; head role]  n 3  docs<= 3  distinct 1  eventive 0
(And (Member $e0 solve) (Patient $e0 $x1) (Member $x1 problem))    ;; n 3 docs 3  e.g. tierB-000935 tierB-001202

;; ---- slot spend.Theme  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 spend) (Theme $e0 $x1) (Member $x1 exile))    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048
(And (Member $e0 spend) (Theme $e0 $x1) (Member $x1 day))    ;; n 1 docs 1  e.g. tierB-001146

;; ---- slot start.Location  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 start) (Location $e0 sweden))    ;; n 2 docs 2  e.g. tierC-000125 tierC-000126
(And (Member $e0 start) (Location $e0 denmark))    ;; n 1 docs 1  e.g. tierC-000125

;; ---- slot stick.Patient  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 stick) (Patient $e0 $x1) (Member $x1 chewing_gum))    ;; n 1 docs 1  e.g. tierB-000482
(And (Member $e0 stick) (Patient $e0 $x1) (Member $x1 horse))    ;; n 1 docs 1  e.g. tierB-000383
(And (Member $e0 stick) (Patient $e0 $x1) (Member $x1 truck))    ;; n 1 docs 1  e.g. tierB-001027

;; ---- slot succeed.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 succeed) (Agent $e0 alexander))    ;; n 1 docs 1  e.g. tierC-000075
(And (Member $e0 succeed) (Agent $e0 bailey))    ;; n 1 docs 1  e.g. tierC-000338
(And (Member $e0 succeed) (Agent $e0 peter_gaussen))    ;; n 1 docs 1  e.g. tierC-000100

;; ---- slot succeed.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 succeed) (Theme $e0 henry_cole))    ;; n 1 docs 1  e.g. tierC-000338
(And (Member $e0 succeed) (Theme $e0 margaret_fleming))    ;; n 1 docs 1  e.g. tierC-000075
(And (Member $e0 succeed) (Theme $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000100

;; ---- slot suggest.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 suggest) (Theme $e0 <term:Might>))    ;; n 1 docs 1  e.g. tierB-000700
(And (Member $e0 suggest) (Theme $e0 corentin_rahier))    ;; n 1 docs 1  e.g. tierC-000018
(And (Member $e0 suggest) (Theme $e0 muriel_zazoui))    ;; n 1 docs 1  e.g. tierC-000017

;; ---- slot take.Time  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 take) (Time $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-000309
(And (Member $e0 take) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-001591
(And (Member $e0 take) (Time $e0 tomorrow))    ;; n 1 docs 1  e.g. tierB-001726

;; ---- slot take_off.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 take_off) (Agent $e0 $x1) (Member $x1 airplane))    ;; n 1 docs 1  e.g. tierB-001471
(And (Member $e0 take_off) (Agent $e0 dan))    ;; n 1 docs 1  e.g. tierB-000147
(And (Member $e0 take_off) (Agent $e0 $x1) (Member $x1 plane))    ;; n 1 docs 1  e.g. tierB-000132

;; ---- slot take_over.Agent  [event center; head role]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $e0 take_over) (Agent $e0 watts))    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110
(And (Member $e0 take_over) (Agent $e0 $x1) (Member $x1 ivy))    ;; n 1 docs 1  e.g. tierB-001234

;; ---- slot talk.Recipient  [event center; head role]  n 3  docs<= 4  distinct 4  eventive 0
(And (Member $e0 talk) (Recipient $e0 loren))    ;; n 1 docs 1  e.g. tierC-000209
(And (Member $e0 talk) (Recipient $e0 $x1) (Member $x1 teacher))    ;; n 1 docs 1  e.g. tierB-001219
(And (Member $e0 talk) (Recipient $e0 $x1) (Member $x1 audience))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001666
(And (Member $e0 talk) (Recipient $e0 $x1) (Member $x1 large))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001666

;; ---- slot turn.Goal  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 turn) (Goal $e0 $x1) (Member $x1 quagmire))    ;; n 1 docs 1  e.g. tierB-001579
(And (Member $e0 turn) (Goal $e0 $x1) (Member $x1 report))    ;; n 1 docs 1  e.g. tierB-000777
(And (Member $e0 turn) (Goal $e0 river))    ;; n 1 docs 1  e.g. tierB-000018

;; ---- slot understand.Stimulus  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 understand) (Stimulus $e0 public_health_issue))    ;; n 1 docs 1  e.g. tierB-000816
(And (Member $e0 understand) (Stimulus $e0 $x1) (Member $x1 reason))    ;; n 1 docs 1  e.g. tierB-000114
(And (Member $e0 understand) (Stimulus $e0 specific_issue))    ;; n 1 docs 1  e.g. tierB-001909

;; ---- slot wear.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 wear) (Theme $e0 helmet))    ;; n 1 docs 1  e.g. tierB-001396
(And (Member $e0 wear) (Theme $e0 inaugural_gown))    ;; n 1 docs 1  e.g. tierB-001318
(And (Member $e0 wear) (Theme $e0 $x1) (Member $x1 mask))    ;; n 1 docs 1  e.g. tierB-001801

;; ---- slot welcome.Agent  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 welcome) (Agent $e0 $x1) (Member $x1 host))    ;; n 1 docs 1  e.g. tierB-001868
(And (Member $e0 welcome) (Agent $e0 $x1) (Member $x1 industrialization))    ;; n 1 docs 1  e.g. tierC-000087
(And (Member $e0 welcome) (Agent $e0 $x1) (Member $x1 whig))    ;; n 1 docs 1  e.g. tierC-000088

;; ---- slot welcome.Theme  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 welcome) (Theme $e0 $x1) (Member $x1 guest))    ;; n 1 docs 1  e.g. tierB-001868
(And (Member $e0 welcome) (Theme $e0 industrialization))    ;; n 1 docs 1  e.g. tierC-000088
(And (Member $e0 welcome) (Theme $e0 $x1) (Member $x1 whig))    ;; n 1 docs 1  e.g. tierC-000087

;; ---- slot work.Experiencer  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 work) (Experiencer $e0 $x1) (Member $x1 mouse))    ;; n 1 docs 1  e.g. tierB-001515
(And (Member $e0 work) (Experiencer $e0 $x1) (Member $x1 site))    ;; n 1 docs 1  e.g. tierB-000144
(And (Member $e0 work) (Experiencer $e0 $x1) (Member $x1 travel_adaptor))    ;; n 1 docs 1  e.g. tierB-000419

;; ---- slot work.Manner  [event center; head role]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $e0 work) (Manner $e0 fine))    ;; n 1 docs 1  e.g. tierB-000144
(And (Member $e0 work) (Manner $e0 late))    ;; n 1 docs 1  e.g. tierB-000212
(And (Member $e0 work) (Manner $e0 perfectly))    ;; n 1 docs 1  e.g. tierB-000419

;; ---- slot pull.Theme  [event center; head role]  n 3  docs<= 5  distinct 5  eventive 0
(And (Member $e0 pull) (Theme $e0 boris))    ;; n 1 docs 1  e.g. tierB-000470
(And (Member $e0 pull) (Theme $e0 santiago))    ;; n 1 docs 1  e.g. tierB-001386
(And (Member $e0 pull) (Theme $e0 $x1) (Member $x1 freight_car))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001120
(And (Member $e0 pull) (Theme $e0 $x1) (Member $x1 line))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001120
(And (Member $e0 pull) (Theme $e0 $x1) (Member $x1 long))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001120

;; ---- slot diverse.Experiencer  [event center; head role]  n 2  docs<= 6  distinct 3  eventive 0
(And (Member $e0 diverse) (Experiencer $e0 $x1) (Member $x1 diverse))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288
(And (Member $e0 diverse) (Experiencer $e0 $x1) (Member $x1 established))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288
(And (Member $e0 diverse) (Experiencer $e0 $x1) (Member $x1 genre))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot established.Experiencer  [event center; head role]  n 2  docs<= 6  distinct 3  eventive 0
(And (Member $e0 established) (Experiencer $e0 $x1) (Member $x1 diverse))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288
(And (Member $e0 established) (Experiencer $e0 $x1) (Member $x1 established))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288
(And (Member $e0 established) (Experiencer $e0 $x1) (Member $x1 genre))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot add.Goal  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 add) (Goal $e0 $x1) (Member $x1 sauce))    ;; n 1 docs 1  e.g. tierB-000462
(And (Member $e0 add) (Goal $e0 $x1) (Member $x1 scene))    ;; n 1 docs 1  e.g. tierB-001132

;; ---- slot address.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 address) (Theme $e0 public_health_issue))    ;; n 1 docs 1  e.g. tierB-000816
(And (Member $e0 address) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierC-000137

;; ---- slot appear.As  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 appear) (As $e0 peter))    ;; n 2 docs 2  e.g. tierC-000259 tierC-000260

;; ---- slot approve.Agent  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 approve) (Agent $e0 american_senate))    ;; n 1 docs 1  e.g. tierB-000128
(And (Member $e0 approve) (Agent $e0 $x1) (Member $x1 majority))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000974
(And (Member $e0 approve) (Agent $e0 $x1) (Member $x1 overwhelming))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000974

;; ---- slot arrange.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 arrange) (Agent $e0 nick_de_caro))    ;; n 2 docs 2  e.g. tierC-000349 tierC-000350

;; ---- slot arrest.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 arrest) (Patient $e0 stefan))    ;; n 1 docs 1  e.g. tierB-000770
(And (Member $e0 arrest) (Patient $e0 $x1) (Member $x1 suspect))    ;; n 1 docs 1  e.g. tierB-001600

;; ---- slot arrive.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 arrive) (Location $e0 here))    ;; n 1 docs 1  e.g. tierB-000237
(And (Member $e0 arrive) (Location $e0 there))    ;; n 1 docs 1  e.g. tierB-001440

;; ---- slot arrive.Time  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 arrive) (Time $e0 soon))    ;; n 1 docs 1  e.g. tierB-001440
(And (Member $e0 arrive) (Time $e0 yesterday))    ;; n 1 docs 1  e.g. tierB-000237

;; ---- slot assistant.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 assistant) (Experiencer $e0 bruno_simma))    ;; n 2 docs 2  e.g. tierC-000151 tierC-000152

;; ---- slot assistant.Recipient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 assistant) (Recipient $e0 paulus))    ;; n 2 docs 2  e.g. tierC-000151 tierC-000152

;; ---- slot attack.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 attack) (Agent $e0 $x1) (Member $x1 enemy))    ;; n 1 docs 1  e.g. tierB-001688
(And (Member $e0 attack) (Agent $e0 $x1) (Member $x1 zombie))    ;; n 1 docs 1  e.g. tierB-000345

;; ---- slot attempt.Agent  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 attempt) (Agent $e0 yair_stern))    ;; n 2 docs 1  e.g. tierB-000166

;; ---- slot attempt.Theme  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 2
(And (Member $e0 attempt) (Theme $e0 $e1) (Member $e1 collaborate))    ;; n 2 docs 1  e.g. tierB-000166

;; ---- slot attract.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 attract) (Agent $e0 $x1) (Member $x1 story))    ;; n 2 docs 2  e.g. tierC-000177 tierC-000178

;; ---- slot attract.Source  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 attract) (Source $e0 mainstream_media))    ;; n 1 docs 1  e.g. tierC-000177
(And (Member $e0 attract) (Source $e0 social_media))    ;; n 1 docs 1  e.g. tierC-000177

;; ---- slot attract.Theme  [event center; head role]  n 2  docs<= 4  distinct 2  eventive 0
(And (Member $e0 attract) (Theme $e0 $x1) (Member $x1 attention))    ;; n 2 (mass 1) docs 2  e.g. tierC-000177 tierC-000178
(And (Member $e0 attract) (Theme $e0 $x1) (Member $x1 widespread))    ;; n 2 (mass 1) docs 2  e.g. tierC-000177 tierC-000178

;; ---- slot avoid.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 avoid) (Agent $e0 cyprus))    ;; n 1 docs 1  e.g. tierB-000171
(And (Member $e0 avoid) (Agent $e0 $x1) (Member $x1 father))    ;; n 1 docs 1  e.g. tierC-000124

;; ---- slot ban.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 ban) (Agent $e0 $x1) (Member $x1 israeli_authority))    ;; n 1 docs 1  e.g. tierB-000830
(And (Member $e0 ban) (Agent $e0 jerry_rawlings))    ;; n 1 docs 1  e.g. tierB-000309

;; ---- slot ban.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 1
(And (Member $e0 ban) (Theme $e0 political_party))    ;; n 1 docs 1  e.g. tierB-000309
(And (Member $e0 ban) (Theme $e0 $e1) (Member $e1 travel))    ;; n 1 docs 1  e.g. tierB-000830

;; ---- slot base.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 base) (Theme $e0 $x1) (Member $x1 law))    ;; n 1 docs 1  e.g. tierB-001928
(And (Member $e0 base) (Theme $e0 $x1) (Member $x1 game))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001610
(And (Member $e0 base) (Theme $e0 $x1) (Member $x1 whole))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001610

;; ---- slot beautiful.Time  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 beautiful) (Time $e0 fall))    ;; n 1 docs 1  e.g. tierB-000904
(And (Member $e0 beautiful) (Time $e0 yesterday))    ;; n 1 docs 1  e.g. tierB-000565

;; ---- slot become.Time  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 become) (Time $e0 now))    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242

;; ---- slot believe.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 believe) (Theme $e0 <term:And>))    ;; n 2 docs 2  e.g. tierC-000061 tierC-000062

;; ---- slot black.Experiencer  [event center; head role]  n 2  docs<= 4  distinct 3  eventive 0
(And (Member $e0 black) (Experiencer $e0 $x1) (Member $x1 black))    ;; n 2 (mass 1) docs 2  e.g. tierB-000476 tierB-001882
(And (Member $e0 black) (Experiencer $e0 $x1) (Member $x1 ceiling))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000476
(And (Member $e0 black) (Experiencer $e0 $x1) (Member $x1 toast))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001882

;; ---- slot block.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 block) (Agent $e0 $x1) (Member $x1 army))    ;; n 1 docs 1  e.g. tierB-000913
(And (Member $e0 block) (Agent $e0 trump))    ;; n 1 docs 1  e.g. tierB-000622

;; ---- slot bring.Agent  [event center; head role]  n 2  docs<= 4  distinct 4  eventive 0
(And (Member $e0 bring) (Agent $e0 $x1) (Member $x1 enlarged))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001013
(And (Member $e0 bring) (Agent $e0 $x1) (Member $x1 immigrant))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000351
(And (Member $e0 bring) (Agent $e0 $x1) (Member $x1 indonesian))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000351
(And (Member $e0 bring) (Agent $e0 $x1) (Member $x1 social_horizon))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001013

;; ---- slot broadcast.Time  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 broadcast) (Time $e0 <term:Hour>))    ;; n 1 docs 1  e.g. tierB-001007
(And (Member $e0 broadcast) (Time $e0 $x1) (Member $x1 hour))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000903
(And (Member $e0 broadcast) (Time $e0 $x1) (Member $x1 late))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000903

;; ---- slot burn.Patient  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 burn) (Patient $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000196
(And (Member $e0 burn) (Patient $e0 $x1) (Member $x1 black))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001882
(And (Member $e0 burn) (Patient $e0 $x1) (Member $x1 toast))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001882

;; ---- slot burst.Instrument  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 burst) (Instrument $e0 corn))    ;; n 1 docs 1  e.g. tierB-001765
(And (Member $e0 burst) (Instrument $e0 food))    ;; n 1 docs 1  e.g. tierB-000369

;; ---- slot burst.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 burst) (Patient $e0 $x1) (Member $x1 bag))    ;; n 1 docs 1  e.g. tierB-001765
(And (Member $e0 burst) (Patient $e0 $x1) (Member $x1 fridge))    ;; n 1 docs 1  e.g. tierB-000369

;; ---- slot bustle.CoAgent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 bustle) (CoAgent $e0 cyclist))    ;; n 1 docs 1  e.g. tierB-001966
(And (Member $e0 bustle) (CoAgent $e0 pedestrian))    ;; n 1 docs 1  e.g. tierB-001966

;; ---- slot call.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 call) (Agent $e0 mark))    ;; n 1 docs 1  e.g. tierB-000239
(And (Member $e0 call) (Agent $e0 santiago))    ;; n 1 docs 1  e.g. tierB-000547

;; ---- slot catch.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 catch) (Theme $e0 $x1) (Member $x1 scent))    ;; n 1 docs 1  e.g. tierB-001900
(And (Member $e0 catch) (Theme $e0 $x1) (Member $x1 wild_boar))    ;; n 1 docs 1  e.g. tierB-000222

;; ---- slot cause.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 1
(And (Member $e0 cause) (Theme $e0 $e1) (Member $e1 accrete))    ;; n 1 docs 1  e.g. tierB-001283
(And (Member $e0 cause) (Theme $e0 $x1) (Member $x1 huge))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001875
(And (Member $e0 cause) (Theme $e0 $x1) (Member $x1 stir))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001875

;; ---- slot cease.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 1
(And (Member $e0 cease) (Theme $e0 <term:Member>))    ;; n 1 docs 1  e.g. tierC-000002
(And (Member $e0 cease) (Theme $e0 $e1) (Member $e1 french))    ;; n 1 docs 1  e.g. tierC-000001

;; ---- slot celebrate.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 celebrate) (Theme $e0 $x1) (Member $x1 birthday))    ;; n 1 docs 1  e.g. tierB-000303
(And (Member $e0 celebrate) (Theme $e0 $x1) (Member $x1 mela))    ;; n 1 docs 1  e.g. tierC-000133

;; ---- slot celebrated.In  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 celebrated) (In $e0 popular_culture))    ;; n 1 docs 1  e.g. tierC-000013
(And (Member $e0 celebrated) (In $e0 traditional_chinese_drama))    ;; n 1 docs 1  e.g. tierC-000013

;; ---- slot change.Manner  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 change) (Manner $e0 a_lot))    ;; n 1 docs 1  e.g. tierB-001217
(And (Member $e0 change) (Manner $e0 often))    ;; n 1 docs 1  e.g. tierB-001491

;; ---- slot claim.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 claim) (Theme $e0 <term:Member>))    ;; n 1 docs 1  e.g. tierB-000191
(And (Member $e0 claim) (Theme $e0 $x1) (Member $x1 painting))    ;; n 1 docs 1  e.g. tierB-001542

;; ---- slot clean.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 clean) (Agent $e0 $x1) (Member $x1 servant))    ;; n 1 docs 1  e.g. tierB-001231
(And (Member $e0 clean) (Agent $e0 yuri))    ;; n 1 docs 1  e.g. tierB-001143

;; ---- slot clean.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 clean) (Patient $e0 $x1) (Member $x1 dinner_table))    ;; n 1 docs 1  e.g. tierB-001143
(And (Member $e0 clean) (Patient $e0 $x1) (Member $x1 floor))    ;; n 1 docs 1  e.g. tierB-001231

;; ---- slot climb.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 climb) (Agent $e0 $x1) (Member $x1 dung_beetle))    ;; n 1 docs 1  e.g. tierB-001735
(And (Member $e0 climb) (Agent $e0 vladimir))    ;; n 1 docs 1  e.g. tierB-000344

;; ---- slot collaborate.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 collaborate) (Agent $e0 $x1) (Member $x1 nazi))    ;; n 1 docs 1  e.g. tierB-000166
(And (Member $e0 collaborate) (Agent $e0 yair_stern))    ;; n 1 docs 1  e.g. tierB-000166

;; ---- slot collapse.Patient  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 collapse) (Patient $e0 $x1) (Member $x1 housing_market))    ;; n 1 docs 1  e.g. tierB-001567
(And (Member $e0 collapse) (Patient $e0 $x1) (Member $x1 thing))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000082
(And (Member $e0 collapse) (Patient $e0 $x1) (Member $x1 whole))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000082

;; ---- slot combine.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 combine) (Agent $e0 artistic_beauty))    ;; n 1 docs 1  e.g. tierB-000371
(And (Member $e0 combine) (Agent $e0 practical_utility))    ;; n 1 docs 1  e.g. tierB-000371

;; ---- slot come.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 come) (Experiencer $e0 $x1) (Member $x1 origin))    ;; n 1 docs 1  e.g. tierB-001774
(And (Member $e0 come) (Experiencer $e0 $x1) (Member $x1 word))    ;; n 1 docs 1  e.g. tierB-000152

;; ---- slot come.Time  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 come) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierB-000387
(And (Member $e0 come) (Time $e0 morning))    ;; n 1 docs 1  e.g. tierB-000238

;; ---- slot come_back.Goal  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 come_back) (Goal $e0 home))    ;; n 2 docs 1  e.g. tierB-000575

;; ---- slot commit.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 commit) (Patient $e0 $x1) (Member $x1 atrocity))    ;; n 1 docs 1  e.g. tierB-001204
(And (Member $e0 commit) (Patient $e0 war_crime))    ;; n 1 docs 1  e.g. tierB-001858

;; ---- slot common.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 common) (Location $e0 $x1))    ;; n 1 docs 1  e.g. tierC-000136
(And (Member $e0 common) (Location $e0 $x1) (Member $x1 northern))    ;; n 1 docs 1  e.g. tierC-000136

;; ---- slot connect.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 connect) (Agent $e0 tomei_expressway))    ;; n 1 docs 1  e.g. tierB-001071
(And (Member $e0 connect) (Agent $e0 $x1) (Member $x1 underground_channel))    ;; n 1 docs 1  e.g. tierB-000063

;; ---- slot connect.Goal  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 connect) (Goal $e0 giresun))    ;; n 2 docs 2  e.g. tierC-000037 tierC-000038

;; ---- slot contact.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 contact) (Agent $e0 $x1) (Member $x1 family))    ;; n 2 docs 2  e.g. tierC-000017 tierC-000018

;; ---- slot contact.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 contact) (Theme $e0 corentin_rahier))    ;; n 2 docs 2  e.g. tierC-000017 tierC-000018

;; ---- slot continue.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 2
(And (Member $e0 continue) (Theme $e0 $e1) (Member $e1 climb))    ;; n 1 docs 1  e.g. tierB-000930
(And (Member $e0 continue) (Theme $e0 $e1) (Member $e1 shine))    ;; n 1 docs 1  e.g. tierB-001977

;; ---- slot cost.Agent  [event center; head role]  n 2  docs<= 4  distinct 4  eventive 0
(And (Member $e0 cost) (Agent $e0 $x1) (Member $x1 careless))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001452
(And (Member $e0 cost) (Agent $e0 $x1) (Member $x1 mistake))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001452
(And (Member $e0 cost) (Agent $e0 $x1) (Member $x1 new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001460
(And (Member $e0 cost) (Agent $e0 $x1) (Member $x1 tablet))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001460

;; ---- slot counteract.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 counteract) (Agent $e0 dream))    ;; n 1 docs 1  e.g. tierB-000516
(And (Member $e0 counteract) (Agent $e0 reality))    ;; n 1 docs 1  e.g. tierB-000516

;; ---- slot counteract.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 counteract) (Theme $e0 dream))    ;; n 1 docs 1  e.g. tierB-000516
(And (Member $e0 counteract) (Theme $e0 reality))    ;; n 1 docs 1  e.g. tierB-000516

;; ---- slot curse.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 curse) (Agent $e0 $x1) (Member $x1 father))    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot curse.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 curse) (Theme $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot deal_with.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 deal_with) (Theme $e0 complaint))    ;; n 1 docs 1  e.g. tierB-000555
(And (Member $e0 deal_with) (Theme $e0 $x1) (Member $x1 problem))    ;; n 1 docs 1  e.g. tierB-000398

;; ---- slot define.In  [event center; head oblique]  n 2  docs<= 3  distinct 2  eventive 0
(And (Member $e0 define) (In $e0 $x1) (Member $x1 way))    ;; n 2 (mass 1.5) docs 2  e.g. tierC-000261 tierC-000262
(And (Member $e0 define) (In $e0 $x1) (Member $x1 random))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000261

;; ---- slot depart.Time  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 depart) (Time $e0 <term:Hour>))    ;; n 1 docs 1  e.g. tierB-001927
(And (Member $e0 depart) (Time $e0 <term:Minute>))    ;; n 1 docs 1  e.g. tierB-001927

;; ---- slot deserve.Agent  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 deserve) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000628
(And (Member $e0 deserve) (Agent $e0 $x1) (Member $x1 good))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001294
(And (Member $e0 deserve) (Agent $e0 $x1) (Member $x1 question))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001294

;; ---- slot deserve.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 deserve) (Theme $e0 punishment))    ;; n 1 docs 1  e.g. tierB-000628
(And (Member $e0 deserve) (Theme $e0 $x1) (Member $x1 good))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001294
(And (Member $e0 deserve) (Theme $e0 $x1) (Member $x1 reply))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001294

;; ---- slot destroy.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 destroy) (Agent $e0 $x1) (Member $x1 conquistador))    ;; n 1 docs 1  e.g. tierB-000799
(And (Member $e0 destroy) (Agent $e0 $x1) (Member $x1 fire))    ;; n 1 docs 1  e.g. tierB-001163

;; ---- slot destroy.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 destroy) (Patient $e0 $x1) (Member $x1 city_centre))    ;; n 1 docs 1  e.g. tierB-001163
(And (Member $e0 destroy) (Patient $e0 $x1) (Member $x1 mayan_book))    ;; n 1 docs 1  e.g. tierB-000799

;; ---- slot discover.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 discover) (Agent $e0 $x1) (Member $x1 paleontologist))    ;; n 1 docs 1  e.g. tierB-000658
(And (Member $e0 discover) (Agent $e0 $x1) (Member $x1 scientist))    ;; n 1 docs 1  e.g. tierB-001251

;; ---- slot display.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 display) (Theme $e0 $x1) (Member $x1 ad))    ;; n 1 docs 1  e.g. tierB-001253
(And (Member $e0 display) (Theme $e0 inaugural_gown))    ;; n 1 docs 1  e.g. tierB-001318

;; ---- slot distribute.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 distribute) (Theme $e0 clothing))    ;; n 1 docs 1  e.g. tierB-000485
(And (Member $e0 distribute) (Theme $e0 food))    ;; n 1 docs 1  e.g. tierB-000485

;; ---- slot diverse.Time  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 diverse) (Time $e0 today))    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot do.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 do) (Theme $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierB-001236 tierB-001729

;; ---- slot do.Time  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 do) (Time $e0 long_time_ago))    ;; n 1 docs 1  e.g. tierB-001520
(And (Member $e0 do) (Time $e0 next_monday))    ;; n 1 docs 1  e.g. tierB-001729

;; ---- slot double.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 double) (Agent $e0 paul_cavanagh))    ;; n 1 docs 1  e.g. tierC-000055
(And (Member $e0 double) (Agent $e0 paul_paul_cavanagh))    ;; n 1 docs 1  e.g. tierC-000056

;; ---- slot double.Beneficiary  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 double) (Beneficiary $e0 nelson))    ;; n 2 docs 2  e.g. tierC-000055 tierC-000056

;; ---- slot draw.Instrument  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 draw) (Instrument $e0 chalk))    ;; n 1 docs 1  e.g. tierB-001245
(And (Member $e0 draw) (Instrument $e0 $x1) (Member $x1 marker))    ;; n 1 docs 1  e.g. tierB-001250

;; ---- slot draw.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 draw) (Location $e0 $x1) (Member $x1 page))    ;; n 1 docs 1  e.g. tierB-001250
(And (Member $e0 draw) (Location $e0 $x1) (Member $x1 sidewalk))    ;; n 1 docs 1  e.g. tierB-001245

;; ---- slot draw.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 draw) (Patient $e0 $x1) (Member $x1 pencil_portrait))    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot dress.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 dress) (Patient $e0 $x1) (Member $x1 woman))    ;; n 1 docs 1  e.g. tierB-001295
(And (Member $e0 dress) (Patient $e0 $x1) (Member $x1 wound))    ;; n 1 docs 1  e.g. tierB-000028

;; ---- slot drink.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 drink) (Agent $e0 baya))    ;; n 1 docs 1  e.g. tierB-000209
(And (Member $e0 drink) (Agent $e0 mennad))    ;; n 1 docs 1  e.g. tierB-000209

;; ---- slot due.Experiencer  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 due) (Experiencer $e0 $x1) (Member $x1 train))    ;; n 1 docs 1  e.g. tierB-000900
(And (Member $e0 due) (Experiencer $e0 $x1) (Member $x1 due))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000315
(And (Member $e0 due) (Experiencer $e0 $x1) (Member $x1 plane))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000315

;; ---- slot due.Time  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 due) (Time $e0 <term:Hour>))    ;; n 2 docs 2  e.g. tierB-000315 tierB-000900

;; ---- slot end.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 end) (Patient $e0 $x1) (Member $x1 football_game))    ;; n 1 docs 1  e.g. tierB-001921
(And (Member $e0 end) (Patient $e0 $x1) (Member $x1 world))    ;; n 1 docs 1  e.g. tierB-000108

;; ---- slot endorse.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 endorse) (Agent $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierC-000159 tierC-000355

;; ---- slot enter.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 enter) (Location $e0 $x1) (Member $x1 park))    ;; n 1 docs 1  e.g. tierC-000064
(And (Member $e0 enter) (Location $e0 $x1) (Member $x1 site))    ;; n 1 docs 1  e.g. tierB-000450

;; ---- slot escape.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 escape) (Agent $e0 $x1) (Member $x1 centipede))    ;; n 1 docs 1  e.g. tierB-000772
(And (Member $e0 escape) (Agent $e0 ivan))    ;; n 1 docs 1  e.g. tierB-000412

;; ---- slot establish.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 establish) (Location $e0 $x1) (Member $x1 conversation))    ;; n 1 docs 1  e.g. tierB-000034
(And (Member $e0 establish) (Location $e0 holy_roman_empire))    ;; n 1 docs 1  e.g. tierB-000373

;; ---- slot establish.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 establish) (Patient $e0 principality_of_liechtenstein))    ;; n 1 docs 1  e.g. tierB-000373
(And (Member $e0 establish) (Patient $e0 $x1) (Member $x1 topic))    ;; n 1 docs 1  e.g. tierB-000034

;; ---- slot established.Time  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 established) (Time $e0 today))    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot event.Time  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 event) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierB-000559
(And (Member $e0 event) (Time $e0 today))    ;; n 1 docs 1  e.g. tierB-000808

;; ---- slot examine.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 examine) (Agent $e0 $x1) (Member $x1 doctor))    ;; n 1 docs 1  e.g. tierB-001122
(And (Member $e0 examine) (Agent $e0 $x1) (Member $x1 gazelle))    ;; n 1 docs 1  e.g. tierB-001836

;; ---- slot examine.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 examine) (Theme $e0 $x1) (Member $x1 surroundings))    ;; n 1 docs 1  e.g. tierB-001836
(And (Member $e0 examine) (Theme $e0 $x1) (Member $x1 x_ray))    ;; n 1 docs 1  e.g. tierB-001122

;; ---- slot exceed.In  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 exceed) (In $e0 quality))    ;; n 1 docs 1  e.g. tierC-000194
(And (Member $e0 exceed) (In $e0 stability))    ;; n 1 docs 1  e.g. tierC-000194

;; ---- slot exhibit.Manner  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 exhibit) (Manner $e0 widely))    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236

;; ---- slot exhibit.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 exhibit) (Theme $e0 $x1) (Member $x1 work))    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236

;; ---- slot expand.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 expand) (Agent $e0 $x1) (Member $x1 company))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot face.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 face) (Theme $e0 $x1) (Member $x1 problem))    ;; n 1 docs 1  e.g. tierB-001401
(And (Member $e0 face) (Theme $e0 $x1) (Member $x1 sea))    ;; n 1 docs 1  e.g. tierB-000767

;; ---- slot fall.Manner  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 fall) (Manner $e0 gradually))    ;; n 1 docs 1  e.g. tierB-000194
(And (Member $e0 fall) (Manner $e0 steadily))    ;; n 1 docs 1  e.g. tierB-001905

;; ---- slot famous.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 famous) (Experiencer $e0 chinese))    ;; n 1 docs 1  e.g. tierB-001627
(And (Member $e0 famous) (Experiencer $e0 lake_towada))    ;; n 1 docs 1  e.g. tierB-001898

;; ---- slot famous.For  [event center; head oblique]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 famous) (For $e0 $x1) (Member $x1 beauty))    ;; n 1 docs 1  e.g. tierB-001898
(And (Member $e0 famous) (For $e0 $x1) (Member $x1 elegant))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001627
(And (Member $e0 famous) (For $e0 $x1) (Member $x1 logic))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001627

;; ---- slot feel.Experiencer  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 feel) (Experiencer $e0 gunter))    ;; n 1 docs 1  e.g. tierB-000534
(And (Member $e0 feel) (Experiencer $e0 $x1) (Member $x1 cold))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000261
(And (Member $e0 feel) (Experiencer $e0 $x1) (Member $x1 wall))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000261

;; ---- slot fight.Manner  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fight) (Manner $e0 fiercely))    ;; n 2 docs 1  e.g. tierB-001629

;; ---- slot fill.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 fill) (Patient $e0 $x1) (Member $x1 earthenware_bowl))    ;; n 1 docs 1  e.g. tierB-000016
(And (Member $e0 fill) (Patient $e0 $x1) (Member $x1 kitchen))    ;; n 1 docs 1  e.g. tierB-001403

;; ---- slot finance.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 finance) (Agent $e0 government_of_kenya))    ;; n 1 docs 1  e.g. tierC-000246
(And (Member $e0 finance) (Agent $e0 jica))    ;; n 1 docs 1  e.g. tierC-000246

;; ---- slot finance.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 finance) (Theme $e0 lessos_border_section_uganda))    ;; n 1 docs 1  e.g. tierC-000246
(And (Member $e0 finance) (Theme $e0 $x1) (Member $x1 project))    ;; n 1 docs 1  e.g. tierB-001532

;; ---- slot flight.Goal  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 flight) (Goal $e0 california))    ;; n 1 docs 1  e.g. tierB-000717
(And (Member $e0 flight) (Goal $e0 stockholm))    ;; n 1 docs 1  e.g. tierB-000308

;; ---- slot fly.Location  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 fly) (Location $e0 $x1) (Member $x1 mountain))    ;; n 1 docs 1  e.g. tierB-000045
(And (Member $e0 fly) (Location $e0 $x1) (Member $x1 sunny))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000121
(And (Member $e0 fly) (Location $e0 $x1) (Member $x1 valley))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000121

;; ---- slot gather.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 gather) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000258
(And (Member $e0 gather) (Agent $e0 $x1) (Member $x1 shark))    ;; n 1 docs 1  e.g. tierB-001911

;; ---- slot get.Goal  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 get) (Goal $e0 $x1) (Member $x1 enclosure))    ;; n 1 docs 1  e.g. tierB-001773
(And (Member $e0 get) (Goal $e0 $x1) (Member $x1 stall))    ;; n 1 docs 1  e.g. tierB-000577

;; ---- slot give.Recipient  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 give) (Recipient $e0 $x1) (Member $x1 kid))    ;; n 2 docs 1  e.g. tierB-001046

;; ---- slot give_up.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 1
(And (Member $e0 give_up) (Theme $e0 $e1) (Member $e1 smoke))    ;; n 1 docs 1  e.g. tierB-000947
(And (Member $e0 give_up) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierC-000112

;; ---- slot go.Instrument  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 go) (Instrument $e0 bike))    ;; n 1 docs 1  e.g. tierB-001628
(And (Member $e0 go) (Instrument $e0 $x1) (Member $x1 huge))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000576
(And (Member $e0 go) (Instrument $e0 $x1) (Member $x1 sport_bag))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000576

;; ---- slot go_back.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 go_back) (Agent $e0 $x1) (Member $x1 father))    ;; n 1 docs 1  e.g. tierB-001743
(And (Member $e0 go_back) (Agent $e0 $x1) (Member $x1 soldier))    ;; n 1 docs 1  e.g. tierB-001058

;; ---- slot go_back.Goal  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 go_back) (Goal $e0 home))    ;; n 1 docs 1  e.g. tierB-001743
(And (Member $e0 go_back) (Goal $e0 $x1) (Member $x1 town))    ;; n 1 docs 1  e.g. tierB-001058

;; ---- slot go_down.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 go_down) (Patient $e0 $x1) (Member $x1 sun))    ;; n 1 docs 1  e.g. tierB-000825
(And (Member $e0 go_down) (Patient $e0 traffic))    ;; n 1 docs 1  e.g. tierB-001793

;; ---- slot go_into_effect.Time  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 go_into_effect) (Time $e0 <term:Day>))    ;; n 1 docs 1  e.g. tierB-001924
(And (Member $e0 go_into_effect) (Time $e0 <term:Month>))    ;; n 1 docs 1  e.g. tierB-001924

;; ---- slot govern.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 govern) (Agent $e0 $x1) (Member $x1 party))    ;; n 1 docs 1  e.g. tierB-000359
(And (Member $e0 govern) (Agent $e0 rule))    ;; n 1 docs 1  e.g. tierB-000934

;; ---- slot hang.Experiencer  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 hang) (Experiencer $e0 $x1) (Member $x1 smoke))    ;; n 1 docs 1  e.g. tierB-001303
(And (Member $e0 hang) (Experiencer $e0 $x1) (Member $x1 chandelier))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001925
(And (Member $e0 hang) (Experiencer $e0 $x1) (Member $x1 large))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001925

;; ---- slot hang.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hang) (Location $e0 $x1) (Member $x1 middle))    ;; n 1 docs 1  e.g. tierB-001925
(And (Member $e0 hang) (Location $e0 $x1) (Member $x1 town))    ;; n 1 docs 1  e.g. tierB-001303

;; ---- slot hang_out.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hang_out) (Agent $e0 jessica))    ;; n 1 docs 1  e.g. tierB-000075
(And (Member $e0 hang_out) (Agent $e0 mark))    ;; n 1 docs 1  e.g. tierB-000075

;; ---- slot happen.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 happen) (Location $e0 here))    ;; n 1 docs 1  e.g. tierB-001708
(And (Member $e0 happen) (Location $e0 $x1) (Member $x1 town))    ;; n 1 docs 1  e.g. tierB-001893

;; ---- slot hate.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hate) (Experiencer $e0 miroslav))    ;; n 1 docs 1  e.g. tierB-000009
(And (Member $e0 hate) (Experiencer $e0 $x1) (Member $x1 right))    ;; n 1 docs 1  e.g. tierB-001180

;; ---- slot hate.Stimulus  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hate) (Stimulus $e0 child))    ;; n 1 docs 1  e.g. tierB-001180
(And (Member $e0 hate) (Stimulus $e0 $x1) (Member $x1 food))    ;; n 1 docs 1  e.g. tierB-000009

;; ---- slot have.At  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 have) (At $e0 local_level))    ;; n 1 docs 1  e.g. tierC-000272
(And (Member $e0 have) (At $e0 regional_level))    ;; n 1 docs 1  e.g. tierC-000272

;; ---- slot have.CoAgent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 have) (CoAgent $e0 karen))    ;; n 2 docs 2  e.g. tierC-000181 tierC-000240

;; ---- slot have.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 have) (Location $e0 local_level))    ;; n 1 docs 1  e.g. tierC-000271
(And (Member $e0 have) (Location $e0 regional_level))    ;; n 1 docs 1  e.g. tierC-000271

;; ---- slot hear.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hear) (Location $e0 $x1) (Member $x1 back_door))    ;; n 1 docs 1  e.g. tierB-000189
(And (Member $e0 hear) (Location $e0 outside))    ;; n 1 docs 1  e.g. tierB-000681

;; ---- slot hidden.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hidden) (Experiencer $e0 happiness))    ;; n 1 docs 1  e.g. tierB-000758
(And (Member $e0 hidden) (Experiencer $e0 north_korea))    ;; n 1 docs 1  e.g. tierB-000979

;; ---- slot hide.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hide) (Agent $e0 alberto))    ;; n 1 docs 1  e.g. tierB-000502
(And (Member $e0 hide) (Agent $e0 $x1) (Member $x1 cat))    ;; n 1 docs 1  e.g. tierB-000381

;; ---- slot hide.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hide) (Location $e0 $x1) (Member $x1 bush))    ;; n 1 docs 1  e.g. tierB-000381
(And (Member $e0 hide) (Location $e0 $x1) (Member $x1 table))    ;; n 1 docs 1  e.g. tierB-000502

;; ---- slot hit.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hit) (Agent $e0 $x1) (Member $x1 frost))    ;; n 1 docs 1  e.g. tierB-000506
(And (Member $e0 hit) (Agent $e0 $x1) (Member $x1 tranquilliser_dart))    ;; n 1 docs 1  e.g. tierB-001001

;; ---- slot hit.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hit) (Patient $e0 $x1) (Member $x1 medlar))    ;; n 1 docs 1  e.g. tierB-000506
(And (Member $e0 hit) (Patient $e0 $x1) (Member $x1 tiger))    ;; n 1 docs 1  e.g. tierB-001001

;; ---- slot hold.Time  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hold) (Time $e0 night))    ;; n 1 docs 1  e.g. tierC-000283
(And (Member $e0 hold) (Time $e0 tomorrow))    ;; n 1 docs 1  e.g. tierB-000378

;; ---- slot hold_up.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hold_up) (Agent $e0 $x1) (Member $x1 accident))    ;; n 1 docs 1  e.g. tierB-000692
(And (Member $e0 hold_up) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 docs 1  e.g. tierB-001801

;; ---- slot hold_up.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hold_up) (Theme $e0 $x1) (Member $x1 freight_train))    ;; n 1 docs 1  e.g. tierB-000329
(And (Member $e0 hold_up) (Theme $e0 $x1) (Member $x1 liquor_store))    ;; n 1 docs 1  e.g. tierB-001801

;; ---- slot hope.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 hope) (Experiencer $e0 blair))    ;; n 2 docs 2  e.g. tierC-000029 tierC-000030

;; ---- slot hope.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 hope) (Theme $e0 <term:And>))    ;; n 2 docs 2  e.g. tierC-000029 tierC-000030

;; ---- slot identify.As  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 identify) (As $e0 girl))    ;; n 1 docs 1  e.g. tierB-001191
(And (Member $e0 identify) (As $e0 straight))    ;; n 1 docs 1  e.g. tierB-001191

;; ---- slot implore.Recipient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 implore) (Recipient $e0 $x1) (Member $x1 friend))    ;; n 1 docs 1  e.g. tierC-000043
(And (Member $e0 implore) (Recipient $e0 twilight))    ;; n 1 docs 1  e.g. tierC-000043

;; ---- slot improve.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 improve) (Patient $e0 $x1) (Member $x1 student_teacher_relation))    ;; n 1 docs 1  e.g. tierB-001065
(And (Member $e0 improve) (Patient $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001816

;; ---- slot influence.Agent  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 influence) (Agent $e0 $x1) (Member $x1 international_balance_of_political_power))    ;; n 1 docs 1  e.g. tierC-000257
(And (Member $e0 influence) (Agent $e0 $x1) (Member $x1 immigrant))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000351
(And (Member $e0 influence) (Agent $e0 $x1) (Member $x1 indonesian))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000351

;; ---- slot influence.Manner  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 influence) (Manner $e0 directly))    ;; n 2 docs 2  e.g. tierC-000257 tierC-000258

;; ---- slot influence.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 influence) (Patient $e0 chinese_dumpling))    ;; n 1 docs 1  e.g. tierC-000351
(And (Member $e0 influence) (Patient $e0 $x1) (Member $x1 religion))    ;; n 1 docs 1  e.g. tierC-000257

;; ---- slot inherit.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 inherit) (Agent $e0 $x1) (Member $x1 byzantine_tradition))    ;; n 1 docs 1  e.g. tierC-000114
(And (Member $e0 inherit) (Agent $e0 islam))    ;; n 1 docs 1  e.g. tierC-000113

;; ---- slot inherit.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 inherit) (Theme $e0 $x1) (Member $x1 byzantine_tradition))    ;; n 1 docs 1  e.g. tierC-000113
(And (Member $e0 inherit) (Theme $e0 islam))    ;; n 1 docs 1  e.g. tierC-000114

;; ---- slot injure.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 injure) (Patient $e0 $x1) (Member $x1 giraffe))    ;; n 1 docs 1  e.g. tierB-000725
(And (Member $e0 injure) (Patient $e0 $x1) (Member $x1 stunt_double))    ;; n 1 docs 1  e.g. tierB-001017

;; ---- slot join.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 join) (Agent $e0 wyman))    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot join.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 join) (Theme $e0 $x1) (Member $x1 group))    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot keep.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 keep) (Agent $e0 augustus))    ;; n 1 docs 1  e.g. tierB-001809
(And (Member $e0 keep) (Agent $e0 $x1) (Member $x1 sun))    ;; n 1 docs 1  e.g. tierB-001933

;; ---- slot keep.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 1
(And (Member $e0 keep) (Theme $e0 $e1) (Member $e1 shine))    ;; n 1 docs 1  e.g. tierB-001933
(And (Member $e0 keep) (Theme $e0 $x1) (Member $x1 veneer))    ;; n 1 docs 1  e.g. tierB-001809

;; ---- slot kidnap.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 kidnap) (Theme $e0 bobby))    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot know.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 know) (Experiencer $e0 $x1) (Member $x1 guy))    ;; n 1 docs 1  e.g. tierB-000689
(And (Member $e0 know) (Experiencer $e0 linda))    ;; n 1 docs 1  e.g. tierB-001449

;; ---- slot know.Stimulus  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 know) (Stimulus $e0 $x1) (Member $x1 author))    ;; n 1 docs 1  e.g. tierB-001843
(And (Member $e0 know) (Stimulus $e0 $x1) (Member $x1 question))    ;; n 1 docs 1  e.g. tierB-001449

;; ---- slot laugh.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 laugh) (Agent $e0 $x1) (Member $x1 boy))    ;; n 1 docs 1  e.g. tierB-001316
(And (Member $e0 laugh) (Agent $e0 $x1) (Member $x1 devil))    ;; n 1 docs 1  e.g. tierB-001147

;; ---- slot leave.Time  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 leave) (Time $e0 <term:Hour>))    ;; n 1 docs 1  e.g. tierB-000298
(And (Member $e0 leave) (Time $e0 tomorrow))    ;; n 1 docs 1  e.g. tierB-000100

;; ---- slot let.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 1
(And (Member $e0 let) (Theme $e0 $e1) (Member $e1 eat))    ;; n 1 docs 1  e.g. tierB-000410
(And (Member $e0 let) (Theme $e0 $x1) (Member $x1 house))    ;; n 1 docs 1  e.g. tierB-001687

;; ---- slot light.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 light) (Patient $e0 $x1) (Member $x1 room))    ;; n 2 docs 2  e.g. tierB-001642 tierB-001997

;; ---- slot like.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 like) (Experiencer $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierB-000160
(And (Member $e0 like) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001485

;; ---- slot lose.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 lose) (Theme $e0 air))    ;; n 1 docs 1  e.g. tierB-000236
(And (Member $e0 lose) (Theme $e0 $x1) (Member $x1 habit))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000795
(And (Member $e0 lose) (Theme $e0 $x1) (Member $x1 hard))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000795

;; ---- slot love.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 love) (Experiencer $e0 marie))    ;; n 1 docs 1  e.g. tierB-001815
(And (Member $e0 love) (Experiencer $e0 $x1) (Member $x1 nation))    ;; n 1 docs 1  e.g. tierB-001330

;; ---- slot love.Stimulus  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 love) (Stimulus $e0 mandela))    ;; n 1 docs 1  e.g. tierB-001330
(And (Member $e0 love) (Stimulus $e0 poetry))    ;; n 1 docs 1  e.g. tierB-001815

;; ---- slot lure.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 lure) (Agent $e0 roger))    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot lure.Goal  [event center; head role]  n 2  docs<= 4  distinct 2  eventive 0
(And (Member $e0 lure) (Goal $e0 $x1) (Member $x1 cottage))    ;; n 2 (mass 1) docs 2  e.g. tierC-000269 tierC-000270
(And (Member $e0 lure) (Goal $e0 $x1) (Member $x1 isolated))    ;; n 2 (mass 1) docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot lure.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 lure) (Theme $e0 frankie))    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot maintain.Patient  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 maintain) (Patient $e0 $x1) (Member $x1 park))    ;; n 1 docs 1  e.g. tierB-001239
(And (Member $e0 maintain) (Patient $e0 $x1) (Member $x1 cultural_heritage))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001864
(And (Member $e0 maintain) (Patient $e0 $x1) (Member $x1 settlement))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001864

;; ---- slot mean.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 mean) (Theme $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierB-001149 tierB-001989

;; ---- slot move_back.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 move_back) (Agent $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000121 tierC-000122

;; ---- slot move_back.CoAgent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 move_back) (CoAgent $e0 $x1) (Member $x1 family))    ;; n 2 docs 2  e.g. tierC-000121 tierC-000122

;; ---- slot move_back.Goal  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 move_back) (Goal $e0 germany))    ;; n 2 docs 2  e.g. tierC-000121 tierC-000122

;; ---- slot need.Stimulus  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 need) (Stimulus $e0 $x1) (Member $x1 chili))    ;; n 1 docs 1  e.g. tierB-000174
(And (Member $e0 need) (Stimulus $e0 $x1) (Member $x1 action))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001141
(And (Member $e0 need) (Stimulus $e0 $x1) (Member $x1 appropriate))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001141

;; ---- slot occur.DueTo  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 occur) (DueTo $e0 autosomal_dominant_disease))    ;; n 2 docs 2  e.g. tierC-000149 tierC-000150

;; ---- slot offer.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 offer) (Agent $e0 aslan))    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312

;; ---- slot offer.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 offer) (Theme $e0 <term:And>))    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312

;; ---- slot on.Experiencer  [event center; head role]  n 2  docs<= 4  distinct 3  eventive 0
(And (Member $e0 on) (Experiencer $e0 $x1) (Member $x1 on))    ;; n 2 (mass 1) docs 2  e.g. tierB-000004 tierB-001051
(And (Member $e0 on) (Experiencer $e0 $x1) (Member $x1 light))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000004
(And (Member $e0 on) (Experiencer $e0 $x1) (Member $x1 program))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001051

;; ---- slot open.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 open) (Agent $e0 knowledge))    ;; n 1 docs 1  e.g. tierB-000958
(And (Member $e0 open) (Agent $e0 rodrigo))    ;; n 1 docs 1  e.g. tierB-000056

;; ---- slot order.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 order) (Agent $e0 $x1) (Member $x1 dictator))    ;; n 1 docs 1  e.g. tierB-001222
(And (Member $e0 order) (Agent $e0 $x1) (Member $x1 professor))    ;; n 1 docs 1  e.g. tierB-000705

;; ---- slot order.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 order) (Theme $e0 $x1) (Member $x1 book))    ;; n 1 docs 1  e.g. tierB-000705
(And (Member $e0 order) (Theme $e0 $x1) (Member $x1 full_scale))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001222
(And (Member $e0 order) (Theme $e0 $x1) (Member $x1 invasion))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001222

;; ---- slot organise.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 organise) (Location $e0 $x1) (Member $x1 village))    ;; n 2 docs 2  e.g. tierC-000133 tierC-000134

;; ---- slot organise.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 organise) (Patient $e0 janmashtmi))    ;; n 1 docs 1  e.g. tierC-000134
(And (Member $e0 organise) (Patient $e0 janmashtmi_festival))    ;; n 1 docs 1  e.g. tierC-000133

;; ---- slot outperform.In  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 outperform) (In $e0 quality))    ;; n 1 docs 1  e.g. tierC-000193
(And (Member $e0 outperform) (In $e0 stability))    ;; n 1 docs 1  e.g. tierC-000193

;; ---- slot outside.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 outside) (Location $e0 $x1) (Member $x1 backyard))    ;; n 1 docs 1  e.g. tierB-001091
(And (Member $e0 outside) (Location $e0 $x1) (Member $x1 pool))    ;; n 1 docs 1  e.g. tierB-001091

;; ---- slot own.Holder  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 own) (Holder $e0 johnson))    ;; n 1 docs 1  e.g. tierB-000145
(And (Member $e0 own) (Holder $e0 ken))    ;; n 1 docs 1  e.g. tierB-001698

;; ---- slot own.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 own) (Theme $e0 $x1) (Member $x1 dog))    ;; n 1 docs 1  e.g. tierB-001698
(And (Member $e0 own) (Theme $e0 $x1) (Member $x1 horse))    ;; n 1 docs 1  e.g. tierB-000145

;; ---- slot packed.Time  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 packed) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierB-000917
(And (Member $e0 packed) (Time $e0 night))    ;; n 1 docs 1  e.g. tierB-000917

;; ---- slot paint.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 paint) (Agent $e0 cowper))    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot party.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 party) (Agent $e0 kalman))    ;; n 1 docs 1  e.g. tierB-000012
(And (Member $e0 party) (Agent $e0 olivia))    ;; n 1 docs 1  e.g. tierB-000012

;; ---- slot party.Time  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 party) (Time $e0 night))    ;; n 2 docs 1  e.g. tierB-000012

;; ---- slot pass.Agent  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 pass) (Agent $e0 $x1) (Member $x1 federal_parliament))    ;; n 1 docs 1  e.g. tierB-001762
(And (Member $e0 pass) (Agent $e0 $x1) (Member $x1 fish))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001008
(And (Member $e0 pass) (Agent $e0 $x1) (Member $x1 school))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001008

;; ---- slot pass.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 pass) (Theme $e0 $x1) (Member $x1 milestone))    ;; n 1 docs 1  e.g. tierB-000649
(And (Member $e0 pass) (Theme $e0 $x1) (Member $x1 law))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001762
(And (Member $e0 pass) (Theme $e0 $x1) (Member $x1 new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001762

;; ---- slot pass_by.Manner  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 pass_by) (Manner $e0 certainly))    ;; n 1 docs 1  e.g. tierB-000094
(And (Member $e0 pass_by) (Manner $e0 quickly))    ;; n 1 docs 1  e.g. tierB-000094

;; ---- slot perform.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 perform) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000127
(And (Member $e0 perform) (Agent $e0 $x1) (Member $x1 sister))    ;; n 1 docs 1  e.g. tierC-000127

;; ---- slot perform.Patient  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 perform) (Patient $e0 durga))    ;; n 2 docs 1  e.g. tierB-000970

;; ---- slot pick_up.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 pick_up) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001040
(And (Member $e0 pick_up) (Theme $e0 $x1) (Member $x1 old))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000334
(And (Member $e0 pick_up) (Theme $e0 $x1) (Member $x1 scissors))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000334

;; ---- slot play.In  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 2
(And (Member $e0 play) (In $e0 $e1) (Member $e1 address))    ;; n 1 docs 1  e.g. tierB-000816
(And (Member $e0 play) (In $e0 $e1) (Member $e1 understand))    ;; n 1 docs 1  e.g. tierB-000816

;; ---- slot plow.Agent  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 plow) (Agent $e0 $x1) (Member $x1 farmer))    ;; n 1 docs 1  e.g. tierB-001501
(And (Member $e0 plow) (Agent $e0 $x1) (Member $x1 ox))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001490
(And (Member $e0 plow) (Agent $e0 $x1) (Member $x1 sturdy))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001490

;; ---- slot plow.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 plow) (Patient $e0 $x1) (Member $x1 field))    ;; n 2 docs 2  e.g. tierB-001490 tierB-001501

;; ---- slot present.Recipient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 present) (Recipient $e0 cameron))    ;; n 2 docs 2  e.g. tierC-000011 tierC-000012

;; ---- slot press.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 press) (Agent $e0 chuck_norris))    ;; n 1 docs 1  e.g. tierB-001494
(And (Member $e0 press) (Agent $e0 daniel))    ;; n 1 docs 1  e.g. tierB-000201

;; ---- slot prevent.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 prevent) (Agent $e0 $x1) (Member $x1 father))    ;; n 1 docs 1  e.g. tierC-000123
(And (Member $e0 prevent) (Agent $e0 $x1) (Member $x1 snow))    ;; n 1 docs 1  e.g. tierB-001471

;; ---- slot prevent.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 1
(And (Member $e0 prevent) (Theme $e0 $e1) (Member $e1 take_off))    ;; n 1 docs 1  e.g. tierB-001471
(And (Member $e0 prevent) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierC-000123

;; ---- slot print.Manner  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 print) (Manner $e0 commercially))    ;; n 2 docs 2  e.g. tierC-000231 tierC-000232

;; ---- slot print.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 print) (Patient $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierC-000231 tierC-000232

;; ---- slot produce.For  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 produce) (For $e0 oscar))    ;; n 2 docs 2  e.g. tierC-000009 tierC-000010

;; ---- slot provide.Recipient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 provide) (Recipient $e0 $x1) (Member $x1 city))    ;; n 1 docs 1  e.g. tierB-001260
(And (Member $e0 provide) (Recipient $e0 $x1) (Member $x1 refugee))    ;; n 1 docs 1  e.g. tierB-000769

;; ---- slot pull.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 pull) (Agent $e0 $x1) (Member $x1 crocodile))    ;; n 1 docs 1  e.g. tierB-000470
(And (Member $e0 pull) (Agent $e0 $x1) (Member $x1 locomotive))    ;; n 1 docs 1  e.g. tierB-001120

;; ---- slot reach.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 reach) (Agent $e0 david))    ;; n 1 docs 1  e.g. tierB-000117
(And (Member $e0 reach) (Agent $e0 $x1) (Member $x1 jury))    ;; n 1 docs 1  e.g. tierB-001082

;; ---- slot reach.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 reach) (Theme $e0 amanda))    ;; n 1 docs 1  e.g. tierB-000117
(And (Member $e0 reach) (Theme $e0 $x1) (Member $x1 easy))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001488
(And (Member $e0 reach) (Theme $e0 $x1) (Member $x1 place))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001488

;; ---- slot ready.For  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 ready) (For $e0 $x1) (Member $x1 fresh))    ;; n 2 (mass 1) docs 1  e.g. tierB-000044
(And (Member $e0 ready) (For $e0 $x1) (Member $x1 start))    ;; n 2 (mass 1) docs 1  e.g. tierB-000044

;; ---- slot receive.Manner  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 receive) (Manner $e0 well))    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236

;; ---- slot recreational_sport.Experiencer  [event center; head role]  n 2  docs<= 6  distinct 4  eventive 0
(And (Member $e0 recreational_sport) (Experiencer $e0 $x1) (Member $x1 recreational_sport))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000147 tierC-000148
(And (Member $e0 recreational_sport) (Experiencer $e0 $x1) (Member $x1 thing))    ;; n 2 (mass 0.667) docs 2  e.g. tierC-000147 tierC-000148
(And (Member $e0 recreational_sport) (Experiencer $e0 $x1) (Member $x1 competitive_activity))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000148
(And (Member $e0 recreational_sport) (Experiencer $e0 $x1) (Member $x1 sporting_activity))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000147

;; ---- slot recreational_sport.Time  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 recreational_sport) (Time $e0 modern_times))    ;; n 2 docs 2  e.g. tierC-000147 tierC-000148

;; ---- slot reflect.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 reflect) (Agent $e0 $x1) (Member $x1 ivory))    ;; n 1 docs 1  e.g. tierC-000114
(And (Member $e0 reflect) (Agent $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierC-000113

;; ---- slot reflect.Like  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 reflect) (Like $e0 $x1) (Member $x1 aspect))    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114

;; ---- slot reflect.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 reflect) (Theme $e0 $x1) (Member $x1 byzantine_tradition))    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114

;; ---- slot remain.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 remain) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000121
(And (Member $e0 remain) (Experiencer $e0 $x1) (Member $x1 secret))    ;; n 1 docs 1  e.g. tierB-001320

;; ---- slot repeat.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 repeat) (Theme $e0 $x1) (Member $x1 landing))    ;; n 1 docs 1  e.g. tierB-000147
(And (Member $e0 repeat) (Theme $e0 sound))    ;; n 1 docs 1  e.g. tierB-001804

;; ---- slot replace.As  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 replace) (As $e0 governor))    ;; n 1 docs 1  e.g. tierC-000100
(And (Member $e0 replace) (As $e0 scott_wells))    ;; n 1 docs 1  e.g. tierC-000360

;; ---- slot represent.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 represent) (Agent $e0 eeaa))    ;; n 2 docs 2  e.g. tierC-000007 tierC-000008

;; ---- slot represent.At  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 represent) (At $e0 executive_level))    ;; n 2 docs 2  e.g. tierC-000007 tierC-000008

;; ---- slot represent.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 represent) (Theme $e0 $x1) (Member $x1 central_arm))    ;; n 1 docs 1  e.g. tierC-000007
(And (Member $e0 represent) (Theme $e0 $x1) (Member $x1 arm))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000008
(And (Member $e0 represent) (Theme $e0 $x1) (Member $x1 central))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000008

;; ---- slot reveal.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 reveal) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001359
(And (Member $e0 reveal) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001881

;; ---- slot roast.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 roast) (Patient $e0 $x1) (Member $x1 chicken))    ;; n 1 docs 1  e.g. tierB-001304
(And (Member $e0 roast) (Patient $e0 $x1) (Member $x1 meat))    ;; n 1 docs 1  e.g. tierB-000921

;; ---- slot roll.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 roll) (Patient $e0 $x1) (Member $x1 pizza_dough))    ;; n 1 docs 1  e.g. tierB-000942
(And (Member $e0 roll) (Patient $e0 thunder))    ;; n 1 docs 1  e.g. tierB-001228

;; ---- slot run.For  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 run) (For $e0 $x1) (Member $x1 term))    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162

;; ---- slot run.Goal  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 run) (Goal $e0 $x1) (Member $x1 basement))    ;; n 1 docs 1  e.g. tierB-000178
(And (Member $e0 run) (Goal $e0 $x1) (Member $x1 tree))    ;; n 1 docs 1  e.g. tierB-001563

;; ---- slot run.Manner  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 run) (Manner $e0 playfully))    ;; n 1 docs 1  e.g. tierB-001153
(And (Member $e0 run) (Manner $e0 quickly))    ;; n 1 docs 1  e.g. tierB-001563

;; ---- slot say.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 say) (Agent $e0 martha))    ;; n 1 docs 1  e.g. tierB-000865
(And (Member $e0 say) (Agent $e0 $x1) (Member $x1 priest))    ;; n 1 docs 1  e.g. tierB-001626

;; ---- slot say.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 say) (Experiencer $e0 jackson))    ;; n 1 docs 1  e.g. tierB-001441
(And (Member $e0 say) (Experiencer $e0 $x1) (Member $x1 official))    ;; n 1 docs 1  e.g. tierB-001602

;; ---- slot season.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 season) (Patient $e0 $x1) (Member $x1 salmon))    ;; n 1 docs 1  e.g. tierB-001692
(And (Member $e0 season) (Patient $e0 $x1) (Member $x1 sushi))    ;; n 1 docs 1  e.g. tierB-000733

;; ---- slot seduce.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 seduce) (Agent $e0 emily))    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot seduce.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 seduce) (Location $e0 $x1) (Member $x1 couch))    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot seduce.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 seduce) (Theme $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot select.For  [event center; head oblique]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 select) (For $e0 $x1) (Member $x1 job))    ;; n 2 docs 2  e.g. tierC-000303 tierC-000304

;; ---- slot select.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 select) (Theme $e0 jones))    ;; n 2 docs 2  e.g. tierC-000303 tierC-000304

;; ---- slot send.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 send) (Theme $e0 $x1) (Member $x1 doctor))    ;; n 1 docs 1  e.g. tierB-000666
(And (Member $e0 send) (Theme $e0 sound_wave))    ;; n 1 docs 1  e.g. tierB-000715

;; ---- slot set.Patient  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 set) (Patient $e0 $x1) (Member $x1 objective))    ;; n 1 docs 1  e.g. tierB-001974
(And (Member $e0 set) (Patient $e0 $x1) (Member $x1 boy))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001976
(And (Member $e0 set) (Patient $e0 $x1) (Member $x1 straight))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001976

;; ---- slot share.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 share) (Agent $e0 canada))    ;; n 1 docs 1  e.g. tierB-000696
(And (Member $e0 share) (Agent $e0 usa))    ;; n 1 docs 1  e.g. tierB-000696

;; ---- slot shine.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 shine) (Experiencer $e0 $x1) (Member $x1 hope))    ;; n 1 docs 1  e.g. tierB-001977
(And (Member $e0 shine) (Experiencer $e0 $x1) (Member $x1 sun))    ;; n 1 docs 1  e.g. tierB-001218

;; ---- slot ship.Goal  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 ship) (Goal $e0 san_francisco))    ;; n 2 docs 2  e.g. tierC-000203 tierC-000204

;; ---- slot ship.Source  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 ship) (Source $e0 manila))    ;; n 2 docs 2  e.g. tierC-000203 tierC-000204

;; ---- slot ship.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 ship) (Theme $e0 barako))    ;; n 2 docs 2  e.g. tierC-000203 tierC-000204

;; ---- slot shoot.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 shoot) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001813
(And (Member $e0 shoot) (Agent $e0 $x1) (Member $x1 police))    ;; n 1 docs 1  e.g. tierB-000256

;; ---- slot sing.Manner  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 sing) (Manner $e0 a_cappella))    ;; n 2 docs 2  e.g. tierC-000329 tierC-000330

;; ---- slot sit.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 sit) (Experiencer $e0 $x1) (Member $x1 camper))    ;; n 1 docs 1  e.g. tierB-000922
(And (Member $e0 sit) (Experiencer $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierB-001685

;; ---- slot speak.In  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 speak) (In $e0 english))    ;; n 1 docs 1  e.g. tierC-000094
(And (Member $e0 speak) (In $e0 japanese))    ;; n 1 docs 1  e.g. tierC-000094

;; ---- slot speak.Recipient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 speak) (Recipient $e0 harvey))    ;; n 2 docs 2  e.g. tierC-000023 tierC-000024

;; ---- slot speaker.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 speaker) (Experiencer $e0 james_david_edgar))    ;; n 1 docs 1  e.g. tierC-000078
(And (Member $e0 speaker) (Experiencer $e0 thomas_bain))    ;; n 1 docs 1  e.g. tierC-000078

;; ---- slot specify.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 specify) (Patient $e0 msm))    ;; n 1 docs 1  e.g. tierC-000268
(And (Member $e0 specify) (Patient $e0 $x1) (Member $x1 msm_model))    ;; n 1 docs 1  e.g. tierC-000267

;; ---- slot spend.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 spend) (Location $e0 france))    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot spokesman.Experiencer  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 spokesman) (Experiencer $e0 james_david_edgar))    ;; n 1 docs 1  e.g. tierC-000077
(And (Member $e0 spokesman) (Experiencer $e0 thomas_bain))    ;; n 1 docs 1  e.g. tierC-000077

;; ---- slot spread.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 spread) (Location $e0 $x1) (Member $x1 division))    ;; n 1 docs 1  e.g. tierB-001113
(And (Member $e0 spread) (Location $e0 $x1) (Member $x1 table))    ;; n 1 docs 1  e.g. tierB-000047

;; ---- slot stab.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 stab) (Agent $e0 $x1) (Member $x1 father))    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot stab.Patient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 stab) (Patient $e0 appius_claudius_crassus))    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot stand.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 stand) (Location $e0 $x1) (Member $x1 building))    ;; n 1 docs 1  e.g. tierB-000676
(And (Member $e0 stand) (Location $e0 $x1) (Member $x1 corner))    ;; n 1 docs 1  e.g. tierB-001299

;; ---- slot stay.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 stay) (Agent $e0 dmitri))    ;; n 1 docs 1  e.g. tierB-000647
(And (Member $e0 stay) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000122

;; ---- slot stay.Location  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 stay) (Location $e0 japan))    ;; n 1 docs 1  e.g. tierC-000122
(And (Member $e0 stay) (Location $e0 $x1) (Member $x1 cabin))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000647
(And (Member $e0 stay) (Location $e0 $x1) (Member $x1 small))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000647

;; ---- slot steal.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 steal) (Agent $e0 mark))    ;; n 1 docs 1  e.g. tierB-000400
(And (Member $e0 steal) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000628

;; ---- slot stick.Location  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 stick) (Location $e0 $x1) (Member $x1 railway_crossing))    ;; n 1 docs 1  e.g. tierB-001027
(And (Member $e0 stick) (Location $e0 $x1) (Member $x1 deep))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000383
(And (Member $e0 stick) (Location $e0 $x1) (Member $x1 snow))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000383

;; ---- slot stop.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 stop) (Location $e0 $x1) (Member $x1 floor))    ;; n 1 docs 1  e.g. tierB-000792
(And (Member $e0 stop) (Location $e0 $x1) (Member $x1 rest_area))    ;; n 1 docs 1  e.g. tierB-000125

;; ---- slot stop.Manner  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 stop) (Manner $e0 suddenly))    ;; n 2 docs 2  e.g. tierB-001515 tierB-001873

;; ---- slot stop.Patient  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 stop) (Patient $e0 $x1) (Member $x1 mouse))    ;; n 1 docs 1  e.g. tierB-001515
(And (Member $e0 stop) (Patient $e0 $x1) (Member $x1 lift))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000792
(And (Member $e0 stop) (Patient $e0 $x1) (Member $x1 other))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000792

;; ---- slot suggest.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 suggest) (Agent $e0 corentin_rahier))    ;; n 1 docs 1  e.g. tierC-000017
(And (Member $e0 suggest) (Agent $e0 muriel_zazoui))    ;; n 1 docs 1  e.g. tierC-000018

;; ---- slot suggest.As  [event center; head oblique]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 suggest) (As $e0 $x1) (Member $x1 potential_partner))    ;; n 1 docs 1  e.g. tierC-000018
(And (Member $e0 suggest) (As $e0 $x1) (Member $x1 partner))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000017
(And (Member $e0 suggest) (As $e0 $x1) (Member $x1 potential))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000017

;; ---- slot support.Agent  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 support) (Agent $e0 $x1) (Member $x1 thing))    ;; n 2 docs 2  e.g. tierC-000160 tierC-000356

;; ---- slot swim.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 swim) (Location $e0 $x1) (Member $x1 lake))    ;; n 1 docs 1  e.g. tierB-001268
(And (Member $e0 swim) (Location $e0 $x1) (Member $x1 sea))    ;; n 1 docs 1  e.g. tierB-001511

;; ---- slot swim.Manner  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 swim) (Manner $e0 lazily))    ;; n 1 docs 1  e.g. tierB-001268
(And (Member $e0 swim) (Manner $e0 together))    ;; n 1 docs 1  e.g. tierB-001008

;; ---- slot take.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 take) (Patient $e0 $x1) (Member $x1 medication))    ;; n 1 docs 1  e.g. tierB-001102
(And (Member $e0 take) (Patient $e0 $x1) (Member $x1 picture))    ;; n 1 docs 1  e.g. tierB-001077

;; ---- slot take_care_for.Agent  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 take_care_for) (Agent $e0 god))    ;; n 2 docs 1  e.g. tierB-000198

;; ---- slot take_care_for.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 take_care_for) (Theme $e0 $x1) (Member $x1 drunk))    ;; n 1 docs 1  e.g. tierB-000198
(And (Member $e0 take_care_for) (Theme $e0 $x1) (Member $x1 fool))    ;; n 1 docs 1  e.g. tierB-000198

;; ---- slot take_over.Theme  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 take_over) (Theme $e0 $x1) (Member $x1 drum))    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot talk.About  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 talk) (About $e0 $x1) (Member $x1 car))    ;; n 1 docs 1  e.g. tierB-000327
(And (Member $e0 talk) (About $e0 partnership_problem))    ;; n 1 docs 1  e.g. tierB-000550

;; ---- slot teach.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 teach) (Agent $e0 $x1) (Member $x1 teacher))    ;; n 1 docs 1  e.g. tierB-000749
(And (Member $e0 teach) (Agent $e0 van_bavel))    ;; n 1 docs 1  e.g. tierB-001612

;; ---- slot tell.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 tell) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000745
(And (Member $e0 tell) (Agent $e0 tommy))    ;; n 1 docs 1  e.g. tierC-000036

;; ---- slot tell.Recipient  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 tell) (Recipient $e0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000035 tierC-000036

;; ---- slot throw.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 throw) (Agent $e0 $x1) (Member $x1 boy))    ;; n 1 docs 1  e.g. tierB-000340
(And (Member $e0 throw) (Agent $e0 matthew))    ;; n 1 docs 1  e.g. tierB-001023

;; ---- slot throw.Theme  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 throw) (Theme $e0 $x1) (Member $x1 pine_cone))    ;; n 1 docs 1  e.g. tierB-001023
(And (Member $e0 throw) (Theme $e0 $x1) (Member $x1 rock))    ;; n 1 docs 1  e.g. tierB-000340

;; ---- slot travel.Instrument  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 travel) (Instrument $e0 road))    ;; n 1 docs 1  e.g. tierB-001618
(And (Member $e0 travel) (Instrument $e0 train))    ;; n 1 docs 1  e.g. tierB-001618

;; ---- slot travel.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 travel) (Location $e0 $x1) (Member $x1 west))    ;; n 1 docs 1  e.g. tierB-000995
(And (Member $e0 travel) (Location $e0 west_bank))    ;; n 1 docs 1  e.g. tierB-000830

;; ---- slot travel.Manner  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 travel) (Manner $e0 alone))    ;; n 1 docs 1  e.g. tierB-000434
(And (Member $e0 travel) (Manner $e0 so_much))    ;; n 1 docs 1  e.g. tierB-000667

;; ---- slot turn_off.Patient  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 turn_off) (Patient $e0 $x1) (Member $x1 light))    ;; n 1 docs 1  e.g. tierB-001106
(And (Member $e0 turn_off) (Patient $e0 $x1) (Member $x1 machine))    ;; n 1 docs 1  e.g. tierC-000315

;; ---- slot use.For  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 1
(And (Member $e0 use) (For $e0 general_purpose))    ;; n 1 docs 1  e.g. tierB-001378
(And (Member $e0 use) (For $e0 $e1) (Member $e1 polish))    ;; n 1 docs 1  e.g. tierB-000938

;; ---- slot usual.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 usual) (Location $e0 $x1) (Member $x1 northern))    ;; n 1 docs 1  e.g. tierC-000135
(And (Member $e0 usual) (Location $e0 $x1) (Member $x1 part))    ;; n 1 docs 1  e.g. tierC-000135

;; ---- slot visit.Theme  [event center; head role]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $e0 visit) (Theme $e0 $x1) (Member $x1 city))    ;; n 1 docs 1  e.g. tierB-000985
(And (Member $e0 visit) (Theme $e0 $x1) (Member $x1 museum))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001653
(And (Member $e0 visit) (Theme $e0 $x1) (Member $x1 worth))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001653

;; ---- slot voice.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 voice) (Agent $e0 kari_wahlgren))    ;; n 1 docs 1  e.g. tierC-000093
(And (Member $e0 voice) (Agent $e0 mie_sonozaki))    ;; n 1 docs 1  e.g. tierC-000093

;; ---- slot voice.In  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 voice) (In $e0 english))    ;; n 1 docs 1  e.g. tierC-000093
(And (Member $e0 voice) (In $e0 japanese))    ;; n 1 docs 1  e.g. tierC-000093

;; ---- slot voice.Theme  [event center; head role]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 voice) (Theme $e0 ashe))    ;; n 2 docs 1  e.g. tierC-000093

;; ---- slot wait.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 wait) (Agent $e0 $x1) (Member $x1 student))    ;; n 1 docs 1  e.g. tierB-000712
(And (Member $e0 wait) (Agent $e0 tom))    ;; n 1 docs 1  e.g. tierB-000002

;; ---- slot wait.For  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 1
(And (Member $e0 wait) (For $e0 $x1) (Member $x1 bus))    ;; n 1 docs 1  e.g. tierB-000712
(And (Member $e0 wait) (For $e0 $e1) (Member $e1 ring))    ;; n 1 docs 1  e.g. tierB-000002

;; ---- slot war.Location  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 war) (Location $e0 iraq))    ;; n 1 docs 1  e.g. tierB-001641
(And (Member $e0 war) (Location $e0 ukraine))    ;; n 1 docs 1  e.g. tierB-001621

;; ---- slot warrior.In  [event center; head oblique]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 warrior) (In $e0 $x1) (Member $x1 chinese_drama))    ;; n 1 docs 1  e.g. tierC-000014
(And (Member $e0 warrior) (In $e0 popular_culture))    ;; n 1 docs 1  e.g. tierC-000014

;; ---- slot watch.Manner  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 watch) (Manner $e0 carefully))    ;; n 1 docs 1  e.g. tierB-001800
(And (Member $e0 watch) (Manner $e0 together))    ;; n 1 docs 1  e.g. tierB-000520

;; ---- slot wear.Agent  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 wear) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 docs 1  e.g. tierB-001801
(And (Member $e0 wear) (Agent $e0 us_first_lady))    ;; n 1 docs 1  e.g. tierB-001318

;; ---- slot widespread.Experiencer  [event center; head role]  n 2  docs<= 4  distinct 2  eventive 0
(And (Member $e0 widespread) (Experiencer $e0 $x1) (Member $x1 thing))    ;; n 2 (mass 1) docs 2  e.g. tierC-000097 tierC-000098
(And (Member $e0 widespread) (Experiencer $e0 $x1) (Member $x1 widespread))    ;; n 2 (mass 1) docs 2  e.g. tierC-000097 tierC-000098

;; ---- slot widespread.Location  [event center; head role]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 widespread) (Location $e0 europe))    ;; n 2 docs 2  e.g. tierC-000097 tierC-000098

;; ---- slot work.Beneficiary  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 work) (Beneficiary $e0 cia))    ;; n 1 docs 1  e.g. tierB-001813
(And (Member $e0 work) (Beneficiary $e0 morel))    ;; n 1 docs 1  e.g. tierC-000304

;; ---- slot work.Time  [event center; head role]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 work) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-000144
(And (Member $e0 work) (Time $e0 tonight))    ;; n 1 docs 1  e.g. tierB-000212

;; ---- slot jump.Over  [event center; head oblique]  n 2  docs<= 4  distinct 4  eventive 0
(And (Member $e0 jump) (Over $e0 $x1) (Member $x1 moon))    ;; n 1 docs 1  e.g. tierB-000889
(And (Member $e0 jump) (Over $e0 $x1) (Member $x1 brown))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000871
(And (Member $e0 jump) (Over $e0 $x1) (Member $x1 dog))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000871
(And (Member $e0 jump) (Over $e0 $x1) (Member $x1 lazy))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000871

;; ---- slot nominate.Theme  [event center; head role]  n 2  docs<= 5  distinct 3  eventive 0
(And (Member $e0 nominate) (Theme $e0 $x1) (Member $x1 film))    ;; n 2 (mass 0.833) docs 2  e.g. tierC-000009 tierC-000010
(And (Member $e0 nominate) (Theme $e0 $x1) (Member $x1 syrian_film))    ;; n 2 (mass 0.833) docs 2  e.g. tierC-000009 tierC-000010
(And (Member $e0 nominate) (Theme $e0 $x1) (Member $x1 destined))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000009

;; ---- slot red.Experiencer  [event center; head role]  n 2  docs<= 5  distinct 4  eventive 0
(And (Member $e0 red) (Experiencer $e0 $x1) (Member $x1 red))    ;; n 2 (mass 0.833) docs 2  e.g. tierB-000832 tierB-001582
(And (Member $e0 red) (Experiencer $e0 $x1) (Member $x1 earth))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001582
(And (Member $e0 red) (Experiencer $e0 $x1) (Member $x1 leaf))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000832
(And (Member $e0 red) (Experiencer $e0 $x1) (Member $x1 yellow))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000832

;; ---- slot transform.Patient  [event center; head role]  n 2  docs<= 5  distinct 5  eventive 0
(And (Member $e0 transform) (Patient $e0 $x1) (Member $x1 bat))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001209
(And (Member $e0 transform) (Patient $e0 $x1) (Member $x1 vampire))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001209
(And (Member $e0 transform) (Patient $e0 $x1) (Member $x1 cozy))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001573
(And (Member $e0 transform) (Patient $e0 $x1) (Member $x1 living_room))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001573
(And (Member $e0 transform) (Patient $e0 $x1) (Member $x1 theater))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001573

;; ---- slot abolish.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 abolish) (Patient $e0 $x1) (Member $x1 deficit))    ;; n 1 docs 1  e.g. tierB-001648

;; ---- slot absent.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 absent) (Experiencer $e0 $x1) (Member $x1 boy))    ;; n 1 docs 1  e.g. tierB-001625

;; ---- slot absent.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 absent) (Source $e0 school))    ;; n 1 docs 1  e.g. tierB-001625

;; ---- slot absent.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 absent) (Time $e0 yesterday))    ;; n 1 docs 1  e.g. tierB-001625

;; ---- slot absorb.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 absorb) (Goal $e0 $x1) (Member $x1 community))    ;; n 1 docs 1  e.g. tierB-001902

;; ---- slot absorb.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 absorb) (Manner $e0 quickly))    ;; n 1 docs 1  e.g. tierB-001902

;; ---- slot absorb.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 absorb) (Patient $e0 $x1) (Member $x1 newcomer))    ;; n 1 docs 1  e.g. tierB-001902

;; ---- slot absorbed.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 absorbed) (Experiencer $e0 $x1) (Member $x1 girl))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000783
(And (Member $e0 absorbed) (Experiencer $e0 $x1) (Member $x1 little))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000783

;; ---- slot absorbed.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 absorbed) (In $e0 $e1) (Member $e1 read))    ;; n 1 docs 1  e.g. tierB-000783

;; ---- slot abuse.Agent  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 abuse) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001773
(And (Member $e0 abuse) (Agent $e0 $x1) (Member $x1 young))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001773

;; ---- slot abuse.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 abuse) (Manner $e0 sexually))    ;; n 1 docs 1  e.g. tierB-001773

;; ---- slot abuse.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 abuse) (Patient $e0 $x1) (Member $x1 sheep))    ;; n 1 docs 1  e.g. tierB-001773

;; ---- slot accept.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 accept) (Agent $e0 antonio))    ;; n 1 docs 1  e.g. tierB-000328

;; ---- slot accept.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 accept) (Manner $e0 happily))    ;; n 1 docs 1  e.g. tierB-000328

;; ---- slot accept.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 accept) (Theme $e0 $x1) (Member $x1 invitation))    ;; n 1 docs 1  e.g. tierB-000328

;; ---- slot accident.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 accident) (Location $e0 $x1) (Member $x1 junction))    ;; n 1 docs 1  e.g. tierB-001277

;; ---- slot accomplish.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 accomplish) (Patient $e0 $x1) (Member $x1 objective))    ;; n 1 docs 1  e.g. tierB-001974

;; ---- slot according.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 according) (Experiencer $e0 john))    ;; n 1 docs 1  e.g. tierB-001680

;; ---- slot according.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 according) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001680

;; ---- slot accrete.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 accrete) (Location $e0 $x1) (Member $x1 shore))    ;; n 1 docs 1  e.g. tierB-001283

;; ---- slot accrete.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 accrete) (Patient $e0 sand))    ;; n 1 docs 1  e.g. tierB-001283

;; ---- slot accuse.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 accuse) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000548

;; ---- slot accuse.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 accuse) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-000548

;; ---- slot achieve.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 achieve) (Agent $e0 french_dahomey))    ;; n 1 docs 1  e.g. tierB-000139

;; ---- slot achieve.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 achieve) (Theme $e0 independence))    ;; n 1 docs 1  e.g. tierB-000139

;; ---- slot achieve.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 achieve) (Time $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-000139

;; ---- slot act.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 act) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-001346

;; ---- slot active.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 active) (Location $e0 church_of_norway))    ;; n 1 docs 1  e.g. tierC-000080

;; ---- slot address.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 address) (Agent $e0 claude_lelouch))    ;; n 1 docs 1  e.g. tierC-000137

;; ---- slot admission.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 admission) (Goal $e0 $x1) (Member $x1 club))    ;; n 1 docs 1  e.g. tierB-001953

;; ---- slot adorn.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 adorn) (Instrument $e0 $x1) (Member $x1 plant))    ;; n 1 docs 1  e.g. tierB-001132

;; ---- slot adorn.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 adorn) (Patient $e0 $x1) (Member $x1 veranda))    ;; n 1 docs 1  e.g. tierB-001132

;; ---- slot advise.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 advise) (Agent $e0 $x1) (Member $x1 doctor))    ;; n 1 docs 1  e.g. tierB-000793

;; ---- slot advise.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 advise) (Recipient $e0 $x1) (Member $x1 man))    ;; n 1 docs 1  e.g. tierB-000793

;; ---- slot advise.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 advise) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-000793

;; ---- slot afloat.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 afloat) (Experiencer $e0 $x1) (Member $x1 afloat))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001179
(And (Member $e0 afloat) (Experiencer $e0 $x1) (Member $x1 business))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001179

;; ---- slot afraid.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 afraid) (Experiencer $e0 lorenzo))    ;; n 1 docs 1  e.g. tierB-001090

;; ---- slot afraid.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 afraid) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001090

;; ---- slot agree.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 agree) (Theme $e0 <term:Member>))    ;; n 1 docs 1  e.g. tierB-001686

;; ---- slot alarmed.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 alarmed) (Experiencer $e0 ashton))    ;; n 1 docs 1  e.g. tierB-001079

;; ---- slot alive.CoAgent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 alive) (CoAgent $e0 $x1) (Member $x1 fan))    ;; n 1 docs 1  e.g. tierB-001332

;; ---- slot alive.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 alive) (Experiencer $e0 $x1) (Member $x1 concert_hall))    ;; n 1 docs 1  e.g. tierB-001332

;; ---- slot all_right.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 all_right) (Experiencer $e0 everything))    ;; n 1 docs 1  e.g. tierB-000051

;; ---- slot all_right.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 all_right) (Time $e0 present))    ;; n 1 docs 1  e.g. tierB-000051

;; ---- slot anger.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 anger) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001669

;; ---- slot angry.BecauseOf  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 angry) (BecauseOf $e0 $e1) (Member $e1 happen))    ;; n 1 docs 1  e.g. tierB-001363

;; ---- slot angry.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 angry) (Experiencer $e0 oleg))    ;; n 1 docs 1  e.g. tierB-001363

;; ---- slot annex.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 annex) (Theme $e0 jerusalem))    ;; n 1 docs 1  e.g. tierB-000709

;; ---- slot announce.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 announce) (Agent $e0 $x1) (Member $x1 cloud))    ;; n 1 docs 1  e.g. tierB-001697

;; ---- slot announce.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 announce) (Theme $e0 $e1) (Member $e1 come))    ;; n 1 docs 1  e.g. tierB-001697

;; ---- slot annoying.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 annoying) (Agent $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierB-000587

;; ---- slot answer.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 answer) (Agent $e0 oleg))    ;; n 1 docs 1  e.g. tierB-001426

;; ---- slot answer.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 answer) (Manner $e0 quickly))    ;; n 1 docs 1  e.g. tierB-001426

;; ---- slot answer.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 answer) (Theme $e0 $x1) (Member $x1 question))    ;; n 1 docs 1  e.g. tierB-001426

;; ---- slot answer_to.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 answer_to) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 docs 1  e.g. tierB-001416

;; ---- slot answer_to.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 answer_to) (Theme $e0 $x1) (Member $x1 description))    ;; n 1 docs 1  e.g. tierB-001416

;; ---- slot antinomic.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 antinomic) (Experiencer $e0 islam))    ;; n 1 docs 1  e.g. tierB-000952

;; ---- slot apologize.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 apologize) (Agent $e0 mark))    ;; n 1 docs 1  e.g. tierB-000239

;; ---- slot apologize.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 apologize) (For $e0 $e1) (Member $e1 call))    ;; n 1 docs 1  e.g. tierB-000239

;; ---- slot appeal.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 appeal) (Theme $e0 $x1) (Member $x1 verdict))    ;; n 1 docs 1  e.g. tierB-001930

;; ---- slot appear.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 appear) (In $e0 coronation_street))    ;; n 1 docs 1  e.g. tierC-000259

;; ---- slot appear.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 appear) (Time $e0 later_in_life))    ;; n 1 docs 1  e.g. tierC-000050

;; ---- slot applaud.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 applaud) (Agent $e0 $x1) (Member $x1 crowd))    ;; n 1 docs 1  e.g. tierB-001052

;; ---- slot apply.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 apply) (Goal $e0 $x1) (Member $x1 field))    ;; n 1 docs 1  e.g. tierB-001728

;; ---- slot apply.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 apply) (Theme $e0 fuzzy_logic))    ;; n 1 docs 1  e.g. tierB-001728

;; ---- slot approve.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 approve) (Manner $e0 quickly))    ;; n 1 docs 1  e.g. tierB-000128

;; ---- slot around.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 around) (Experiencer $e0 stefan))    ;; n 1 docs 1  e.g. tierB-000836

;; ---- slot around.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 around) (Location $e0 $x1) (Member $x1 hotel))    ;; n 1 docs 1  e.g. tierB-000836

;; ---- slot arrange.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 arrange) (Patient $e0 $x1) (Member $x1 session))    ;; n 1 docs 1  e.g. tierC-000350

;; ---- slot arrange.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 arrange) (Theme $e0 $x1) (Member $x1 session))    ;; n 1 docs 1  e.g. tierC-000349

;; ---- slot arrest.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 arrest) (Agent $e0 $x1) (Member $x1 police))    ;; n 1 docs 1  e.g. tierB-001600

;; ---- slot arrest.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 arrest) (In $e0 $x1) (Member $x1 case))    ;; n 1 docs 1  e.g. tierB-001600

;; ---- slot arrival.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 arrival) (Agent $e0 $x1) (Member $x1 french_settler))    ;; n 1 docs 1  e.g. tierB-000005

;; ---- slot arrive.Instrument  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 arrive) (Instrument $e0 $x1) (Member $x1 brand_new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000444
(And (Member $e0 arrive) (Instrument $e0 $x1) (Member $x1 ferrari))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000444

;; ---- slot ascend.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ascend) (Experiencer $e0 $x1) (Member $x1 road))    ;; n 1 docs 1  e.g. tierB-000826

;; ---- slot ascend.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ascend) (Manner $e0 steeply))    ;; n 1 docs 1  e.g. tierB-000826

;; ---- slot ascend.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ascend) (Source $e0 $x1) (Member $x1 point))    ;; n 1 docs 1  e.g. tierB-000826

;; ---- slot ashamed.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 ashamed) (Experiencer $e0 $x1) (Member $x1 man))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001568
(And (Member $e0 ashamed) (Experiencer $e0 $x1) (Member $x1 poor))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001568

;; ---- slot ashamed.Of  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 ashamed) (Of $e0 $e1) (Member $e1 bear))    ;; n 1 docs 1  e.g. tierB-001568

;; ---- slot ask.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ask) (Agent $e0 linda))    ;; n 1 docs 1  e.g. tierB-001449

;; ---- slot ask.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ask) (Theme $e0 $x1) (Member $x1 question))    ;; n 1 docs 1  e.g. tierB-001449

;; ---- slot assault.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 assault) (Agent $e0 $x1) (Member $x1 robber))    ;; n 1 docs 1  e.g. tierB-000213

;; ---- slot assault.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 assault) (Patient $e0 $x1) (Member $x1 guardsman))    ;; n 1 docs 1  e.g. tierB-000213

;; ---- slot assistant.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 assistant) (In $e0 lagrand))    ;; n 1 docs 1  e.g. tierC-000151

;; ---- slot attack.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 attack) (Manner $e0 instantly))    ;; n 1 docs 1  e.g. tierB-000345

;; ---- slot attend.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 attend) (Agent $e0 $x1) (Member $x1 foreign_minister))    ;; n 1 docs 1  e.g. tierB-001584

;; ---- slot attend.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 attend) (Theme $e0 $x1) (Member $x1 talk))    ;; n 1 docs 1  e.g. tierB-001584

;; ---- slot attractive.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 attractive) (Experiencer $e0 $x1) (Member $x1 attractive))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001874
(And (Member $e0 attractive) (Experiencer $e0 $x1) (Member $x1 profession))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001874

;; ---- slot attribute.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 attribute) (Goal $e0 $x1) (Member $x1 pilot_error))    ;; n 1 docs 1  e.g. tierB-000834

;; ---- slot attribute.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 attribute) (Theme $e0 $x1) (Member $x1 cause))    ;; n 1 docs 1  e.g. tierB-000834

;; ---- slot award.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 award) (Recipient $e0 $x1) (Member $x1 ceo))    ;; n 1 docs 1  e.g. tierB-001101

;; ---- slot award.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 award) (Theme $e0 stock_option))    ;; n 1 docs 1  e.g. tierB-001101

;; ---- slot backward.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 backward) (Experiencer $e0 afghanistan))    ;; n 1 docs 1  e.g. tierB-001504

;; ---- slot base.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 base) (Patient $e0 $x1) (Member $x1 esperanto_alphabet))    ;; n 1 docs 1  e.g. tierB-001605

;; ---- slot bask.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 bask) (Experiencer $e0 $x1) (Member $x1 goat))    ;; n 1 docs 1  e.g. tierB-001904

;; ---- slot bask.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 bask) (Location $e0 $x1) (Member $x1 sunlight))    ;; n 1 docs 1  e.g. tierB-001904

;; ---- slot bat.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 bat) (Experiencer $e0 $x1) (Member $x1 bat))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001209
(And (Member $e0 bat) (Experiencer $e0 $x1) (Member $x1 vampire))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001209

;; ---- slot battle.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 battle) (Location $e0 kurukshetra))    ;; n 1 docs 1  e.g. tierB-001076

;; ---- slot be.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 be) (Experiencer $e0 gabor))    ;; n 1 docs 1  e.g. tierB-000514

;; ---- slot be.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 be) (Goal $e0 $x1) (Member $x1 island))    ;; n 1 docs 1  e.g. tierB-000514

;; ---- slot be.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 be) (In $e0 $x1) (Member $x1 weather))    ;; n 1 docs 1  e.g. tierB-001619

;; ---- slot be.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 be) (Location $e0 $x1) (Member $x1 office))    ;; n 1 docs 1  e.g. tierB-001619

;; ---- slot be.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 be) (Time $e0 before))    ;; n 1 docs 1  e.g. tierB-000514

;; ---- slot bear.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 bear) (Time $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-001812

;; ---- slot become.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 become) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000238

;; ---- slot become.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 become) (Instrument $e0 blood))    ;; n 1 docs 1  e.g. tierB-001582

;; ---- slot become.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 become) (Theme $e0 inomaru))    ;; n 1 docs 1  e.g. tierC-000238

;; ---- slot beget.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 beget) (Agent $e0 cainan))    ;; n 1 docs 1  e.g. tierB-000778

;; ---- slot beget.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 beget) (Patient $e0 malaleel))    ;; n 1 docs 1  e.g. tierB-000778

;; ---- slot begin.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 begin) (Manner $e0 just))    ;; n 1 docs 1  e.g. tierB-001048

;; ---- slot beset.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 beset) (Experiencer $e0 $x1) (Member $x1 problem))    ;; n 1 docs 1  e.g. tierB-001424

;; ---- slot beset.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 beset) (Stimulus $e0 difficulty))    ;; n 1 docs 1  e.g. tierB-001424

;; ---- slot better.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 better) (Experiencer $e0 $e1) (Member $e1 have))    ;; n 1 docs 1  e.g. tierB-001016

;; ---- slot big.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 big) (Experiencer $e0 $x1) (Member $x1 pear))    ;; n 1 docs 1  e.g. tierB-001851

;; ---- slot big.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 big) (Time $e0 this_year))    ;; n 1 docs 1  e.g. tierB-001851

;; ---- slot bite.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 bite) (Agent $e0 $x1) (Member $x1 wolf))    ;; n 1 docs 1  e.g. tierB-001473

;; ---- slot bite.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 bite) (Patient $e0 maria))    ;; n 1 docs 1  e.g. tierB-001473

;; ---- slot blend_in.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 blend_in) (Agent $e0 adriano))    ;; n 1 docs 1  e.g. tierB-001117

;; ---- slot block.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 block) (Patient $e0 $x1) (Member $x1 road))    ;; n 1 docs 1  e.g. tierB-000913

;; ---- slot block.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 block) (Theme $e0 $e1) (Member $e1 enter))    ;; n 1 docs 1  e.g. tierB-000622

;; ---- slot bloom.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 bloom) (Patient $e0 $x1) (Member $x1 rose))    ;; n 1 docs 1  e.g. tierB-001814

;; ---- slot bloom.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 bloom) (Time $e0 spring))    ;; n 1 docs 1  e.g. tierB-001814

;; ---- slot boil_down.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 boil_down) (Experiencer $e0 fluency))    ;; n 1 docs 1  e.g. tierB-000093

;; ---- slot book.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 book) (Manner $e0 fully))    ;; n 1 docs 1  e.g. tierB-000717

;; ---- slot book.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 book) (Theme $e0 $e1) (Member $e1 flight))    ;; n 1 docs 1  e.g. tierB-000717

;; ---- slot border.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 border) (Agent $e0 mediterranean_sea))    ;; n 1 docs 1  e.g. tierB-000601

;; ---- slot border.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 border) (Location $e0 west))    ;; n 1 docs 1  e.g. tierB-000601

;; ---- slot border.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 border) (Theme $e0 israel))    ;; n 1 docs 1  e.g. tierB-000601

;; ---- slot borrow.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 borrow) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000238

;; ---- slot borrow.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 borrow) (Theme $e0 $e1) (Member $e1 inomaru))    ;; n 1 docs 1  e.g. tierC-000237

;; ---- slot break.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 break) (Agent $e0 kerr))    ;; n 1 docs 1  e.g. tierC-000244

;; ---- slot break.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 break) (Goal $e0 $x1) (Member $x1 first_team))    ;; n 1 docs 1  e.g. tierC-000244

;; ---- slot break.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 break) (Patient $e0 $x1) (Member $x1 window))    ;; n 1 docs 1  e.g. tierB-000320

;; ---- slot break.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 break) (Time $e0 this_season))    ;; n 1 docs 1  e.g. tierC-000244

;; ---- slot break_into.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 break_into) (Agent $e0 kerr))    ;; n 1 docs 1  e.g. tierC-000243

;; ---- slot break_into.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 break_into) (Theme $e0 $x1) (Member $x1 first_team))    ;; n 1 docs 1  e.g. tierC-000243

;; ---- slot break_into.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 break_into) (Time $e0 $x1) (Member $x1 season))    ;; n 1 docs 1  e.g. tierC-000243

;; ---- slot break_out.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 break_out) (Location $e0 siberia))    ;; n 1 docs 1  e.g. tierB-001694

;; ---- slot bring_out.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 bring_out) (Agent $e0 wasabi))    ;; n 1 docs 1  e.g. tierB-000466

;; ---- slot bring_out.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 bring_out) (Manner $e0 really))    ;; n 1 docs 1  e.g. tierB-000466

;; ---- slot bring_out.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 bring_out) (Patient $e0 $x1) (Member $x1 flavor))    ;; n 1 docs 1  e.g. tierB-000466

;; ---- slot broadcast.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 broadcast) (Manner $e0 live))    ;; n 1 docs 1  e.g. tierB-001007

;; ---- slot broadcast.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 broadcast) (Theme $e0 $x1) (Member $x1 soccer_game))    ;; n 1 docs 1  e.g. tierB-001007

;; ---- slot brush_aside.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 brush_aside) (Agent $e0 pietro))    ;; n 1 docs 1  e.g. tierB-001172

;; ---- slot brush_aside.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 brush_aside) (Theme $e0 <term:Member>))    ;; n 1 docs 1  e.g. tierB-001172

;; ---- slot bud.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 bud) (Patient $e0 $x1) (Member $x1 tree))    ;; n 1 docs 1  e.g. tierB-001394

;; ---- slot build.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 build) (Beneficiary $e0 $x1) (Member $x1 kid))    ;; n 1 docs 1  e.g. tierB-001867

;; ---- slot build.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 build) (Time $e0 ages_ago))    ;; n 1 docs 1  e.g. tierB-000932

;; ---- slot build_up.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 build_up) (Agent $e0 $x1) (Member $x1 bone))    ;; n 1 docs 1  e.g. tierB-000936

;; ---- slot build_up.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 build_up) (Patient $e0 $x1) (Member $x1 skeleton))    ;; n 1 docs 1  e.g. tierB-000936

;; ---- slot burn.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 burn) (Manner $e0 pretty_badly))    ;; n 1 docs 1  e.g. tierB-000196

;; ---- slot burnish.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 burnish) (Agent $e0 $x1) (Member $x1 company))    ;; n 1 docs 1  e.g. tierB-001130

;; ---- slot burnish.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 burnish) (Patient $e0 $x1) (Member $x1 image))    ;; n 1 docs 1  e.g. tierB-001130

;; ---- slot burrow.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 burrow) (Agent $e0 $x1) (Member $x1 mole))    ;; n 1 docs 1  e.g. tierB-001308

;; ---- slot burrow.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 burrow) (Goal $e0 $x1) (Member $x1 ground))    ;; n 1 docs 1  e.g. tierB-001308

;; ---- slot bustle.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 1
(And (Member $e0 bustle) (Experiencer $e0 $e1) (Member $e1 modern))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001966
(And (Member $e0 bustle) (Experiencer $e0 $e1) (Member $e1 street))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001966

;; ---- slot call.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 call) (Recipient $e0 $x1) (Member $x1 police))    ;; n 1 docs 1  e.g. tierB-000547

;; ---- slot call.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 call) (Theme $e0 <term:Member>))    ;; n 1 docs 1  e.g. tierB-000239

;; ---- slot call_for.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 call_for) (Agent $e0 $x1) (Member $x1 situation))    ;; n 1 docs 1  e.g. tierB-000120

;; ---- slot call_for.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 call_for) (Theme $e0 $x1) (Member $x1 drastic))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000120
(And (Member $e0 call_for) (Theme $e0 $x1) (Member $x1 measure))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000120

;; ---- slot call_off.OnAccountOf  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 call_off) (OnAccountOf $e0 $x1) (Member $x1 rain))    ;; n 1 docs 1  e.g. tierB-000498

;; ---- slot call_off.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 call_off) (Patient $e0 $x1) (Member $x1 game))    ;; n 1 docs 1  e.g. tierB-000498

;; ---- slot care.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 care) (Agent $e0 $x1) (Member $x1 doctor))    ;; n 1 docs 1  e.g. tierB-000049

;; ---- slot care.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 care) (For $e0 $x1) (Member $x1 patient))    ;; n 1 docs 1  e.g. tierB-000049

;; ---- slot care.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 care) (Manner $e0 well))    ;; n 1 docs 1  e.g. tierB-000049

;; ---- slot carry.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 carry) (Agent $e0 $x1) (Member $x1 shop))    ;; n 1 docs 1  e.g. tierB-001181

;; ---- slot carry.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 carry) (Theme $e0 leather_goods))    ;; n 1 docs 1  e.g. tierB-001181

;; ---- slot carry_forward.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 carry_forward) (Theme $e0 $x1) (Member $x1 total))    ;; n 1 docs 1  e.g. tierB-001638

;; ---- slot carry_out.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 carry_out) (In $e0 $x1) (Member $x1 field))    ;; n 1 docs 1  e.g. tierB-000774

;; ---- slot carry_out.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 carry_out) (Patient $e0 $x1) (Member $x1 experiment))    ;; n 1 docs 1  e.g. tierB-000774

;; ---- slot catch.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 catch) (Agent $e0 $x1) (Member $x1 cat))    ;; n 1 docs 1  e.g. tierB-001900

;; ---- slot catch.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 catch) (Instrument $e0 $x1) (Member $x1 snare))    ;; n 1 docs 1  e.g. tierB-000222

;; ---- slot catch_hold_of.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 catch_hold_of) (Agent $e0 hercules))    ;; n 1 docs 1  e.g. tierB-001798

;; ---- slot catch_hold_of.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 catch_hold_of) (Theme $e0 $x1) (Member $x1 monster))    ;; n 1 docs 1  e.g. tierB-001798

;; ---- slot catch_hold_of.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 catch_hold_of) (Time $e0 next_instant))    ;; n 1 docs 1  e.g. tierB-001798

;; ---- slot cause.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cause) (Location $e0 $x1) (Member $x1 city))    ;; n 1 docs 1  e.g. tierB-001649

;; ---- slot cause.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cause) (Recipient $e0 $x1) (Member $x1 crop))    ;; n 1 docs 1  e.g. tierB-000775

;; ---- slot caw.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 caw) (Agent $e0 $x1) (Member $x1 crow))    ;; n 1 docs 1  e.g. tierB-001655

;; ---- slot caw.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 caw) (Source $e0 $x1) (Member $x1 treetop))    ;; n 1 docs 1  e.g. tierB-001655

;; ---- slot cease.Agent  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 cease) (Agent $e0 $x1) (Member $x1 indigenous))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001
(And (Member $e0 cease) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001

;; ---- slot cease.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 cease) (Patient $e0 $x1) (Member $x1 indigenous))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000002
(And (Member $e0 cease) (Patient $e0 $x1) (Member $x1 people))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000002

;; ---- slot celebrate.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 celebrate) (Patient $e0 $x1) (Member $x1 mela))    ;; n 1 docs 1  e.g. tierC-000134

;; ---- slot celebrate.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 celebrate) (Time $e0 morning))    ;; n 1 docs 1  e.g. tierB-000303

;; ---- slot celebrated.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 celebrated) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000013

;; ---- slot change.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 change) (Goal $e0 snow))    ;; n 1 docs 1  e.g. tierB-001588

;; ---- slot change_mind.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 change_mind) (Agent $e0 cameron))    ;; n 1 docs 1  e.g. tierC-000012

;; ---- slot chant.Agent  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 chant) (Agent $e0 $x1) (Member $x1 crowd))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001169
(And (Member $e0 chant) (Agent $e0 $x1) (Member $x1 whole))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001169

;; ---- slot cheap.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 cheap) (Experiencer $e0 $x1) (Member $x1 cheap))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000370
(And (Member $e0 cheap) (Experiencer $e0 $x1) (Member $x1 excuse))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000370

;; ---- slot check.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 check) (Agent $e0 bill))    ;; n 1 docs 1  e.g. tierB-000363

;; ---- slot choose.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 choose) (Agent $e0 jonas))    ;; n 1 docs 1  e.g. tierB-000610

;; ---- slot choose.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 choose) (Theme $e0 $e1) (Member $e1 imprison))    ;; n 1 docs 1  e.g. tierB-000610

;; ---- slot claim.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 claim) (Agent $e0 john))    ;; n 1 docs 1  e.g. tierB-001542

;; ---- slot claim.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 claim) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000191

;; ---- slot clarify.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 clarify) (Agent $e0 $x1) (Member $x1 task))    ;; n 1 docs 1  e.g. tierC-000021

;; ---- slot clarify.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 clarify) (Patient $e0 $x1) (Member $x1 relationship))    ;; n 1 docs 1  e.g. tierC-000022

;; ---- slot clarify.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 clarify) (Theme $e0 $x1) (Member $x1 empirical_relationship))    ;; n 1 docs 1  e.g. tierC-000021

;; ---- slot class.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 class) (Experiencer $e0 $x1) (Member $x1 keeper))    ;; n 1 docs 1  e.g. tierB-000631

;; ---- slot class.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 class) (Time $e0 today))    ;; n 1 docs 1  e.g. tierB-000631

;; ---- slot clever.At  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 clever) (At $e0 work))    ;; n 1 docs 1  e.g. tierB-000898

;; ---- slot clever.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 clever) (Experiencer $e0 thomas))    ;; n 1 docs 1  e.g. tierB-000898

;; ---- slot climb.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 climb) (Goal $e0 $x1) (Member $x1 room))    ;; n 1 docs 1  e.g. tierB-000344

;; ---- slot climb.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 climb) (Location $e0 $x1) (Member $x1 dung_ball))    ;; n 1 docs 1  e.g. tierB-001735

;; ---- slot climb.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 climb) (Manner $e0 back))    ;; n 1 docs 1  e.g. tierB-000344

;; ---- slot climb.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 climb) (Patient $e0 $x1) (Member $x1 price))    ;; n 1 docs 1  e.g. tierB-000930

;; ---- slot close.Over  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 close) (Over $e0 $x1) (Member $x1 calf))    ;; n 1 docs 1  e.g. tierB-001205

;; ---- slot close.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 close) (Stimulus $e0 animal))    ;; n 1 docs 1  e.g. tierB-000079

;; ---- slot cold.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 cold) (Experiencer $e0 $x1) (Member $x1 cold))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000362
(And (Member $e0 cold) (Experiencer $e0 $x1) (Member $x1 trail))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000362

;; ---- slot collapse.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 collapse) (Time $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-001567

;; ---- slot colonization.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 colonization) (Agent $e0 insect))    ;; n 1 docs 1  e.g. tierB-000710

;; ---- slot colonization.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 colonization) (Theme $e0 carcass))    ;; n 1 docs 1  e.g. tierB-000710

;; ---- slot come.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 come) (Manner $e0 early))    ;; n 1 docs 1  e.g. tierB-000238

;; ---- slot come.Over  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 come) (Over $e0 $x1) (Member $x1 dispute))    ;; n 1 docs 1  e.g. tierB-001534

;; ---- slot come_along.Agent  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 come_along) (Agent $e0 $x1) (Member $x1 friend))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000765
(And (Member $e0 come_along) (Agent $e0 $x1) (Member $x1 good))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000765

;; ---- slot come_in.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 come_in) (Agent $e0 $x1) (Member $x1 boy))    ;; n 1 docs 1  e.g. tierB-000500

;; ---- slot come_in.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 come_in) (Patient $e0 $x1) (Member $x1 snowstorm))    ;; n 1 docs 1  e.g. tierB-000296

;; ---- slot come_in.Through  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 come_in) (Through $e0 $x1) (Member $x1 back_door))    ;; n 1 docs 1  e.g. tierB-000500

;; ---- slot come_into_force.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 come_into_force) (Patient $e0 $x1) (Member $x1 treaty))    ;; n 1 docs 1  e.g. tierB-000437

;; ---- slot come_into_force.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 come_into_force) (Time $e0 <term:Hour>))    ;; n 1 docs 1  e.g. tierB-000437

;; ---- slot come_together.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 come_together) (Agent $e0 $x1) (Member $x1 community))    ;; n 1 docs 1  e.g. tierB-001867

;; ---- slot come_up.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 come_up) (Agent $e0 daniel))    ;; n 1 docs 1  e.g. tierB-000078

;; ---- slot come_up.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 come_up) (Goal $e0 amanda))    ;; n 1 docs 1  e.g. tierB-000078

;; ---- slot commit.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 commit) (Agent $e0 nation))    ;; n 1 docs 1  e.g. tierB-001858

;; ---- slot common.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 common) (Experiencer $e0 $x1) (Member $x1 common))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000136
(And (Member $e0 common) (Experiencer $e0 $x1) (Member $x1 view))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000136

;; ---- slot compare.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 compare) (Theme $e0 $x1) (Member $x1 word_processor))    ;; n 1 docs 1  e.g. tierB-001177

;; ---- slot compassionate.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 compassionate) (Experiencer $e0 boris))    ;; n 1 docs 1  e.g. tierB-000496

;; ---- slot compassionate.Towards  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 compassionate) (Towards $e0 poor))    ;; n 1 docs 1  e.g. tierB-000496

;; ---- slot competitive_activity.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 competitive_activity) (Time $e0 modern_times))    ;; n 1 docs 1  e.g. tierC-000148

;; ---- slot complain.About  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 complain) (About $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001365

;; ---- slot complain.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 complain) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001365

;; ---- slot complete.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 complete) (Patient $e0 $e1) (Member $e1 conquest))    ;; n 1 docs 1  e.g. tierB-001031

;; ---- slot compose.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 compose) (Agent $e0 gilles_thibaut))    ;; n 1 docs 1  e.g. tierC-000132

;; ---- slot conduct.On  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 conduct) (On $e0 matt_brown))    ;; n 1 docs 1  e.g. tierB-000177

;; ---- slot conduct.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 conduct) (Patient $e0 $x1) (Member $x1 ceremony))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000284
(And (Member $e0 conduct) (Patient $e0 $x1) (Member $x1 mass))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000284

;; ---- slot conduct.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 conduct) (Time $e0 night))    ;; n 1 docs 1  e.g. tierC-000284

;; ---- slot confess.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 confess) (Agent $e0 william))    ;; n 1 docs 1  e.g. tierB-000240

;; ---- slot confront.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 confront) (Agent $e0 fyodor))    ;; n 1 docs 1  e.g. tierB-000401

;; ---- slot confront.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 confront) (Theme $e0 $x1) (Member $x1 intruder))    ;; n 1 docs 1  e.g. tierB-000401

;; ---- slot confusion.Of  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 confusion) (Of $e0 name))    ;; n 1 docs 1  e.g. tierB-000481

;; ---- slot connect.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 connect) (Patient $e0 $x1) (Member $x1 network))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000063
(And (Member $e0 connect) (Patient $e0 $x1) (Member $x1 well))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000063

;; ---- slot conquest.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 conquest) (Agent $e0 france))    ;; n 1 docs 1  e.g. tierB-001031

;; ---- slot conquest.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 conquest) (Patient $e0 vietnam))    ;; n 1 docs 1  e.g. tierB-001031

;; ---- slot conservative.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 conservative) (Experiencer $e0 $x1) (Member $x1 conservative))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001817
(And (Member $e0 conservative) (Experiencer $e0 $x1) (Member $x1 revolutionary))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001817

;; ---- slot consider.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 consider) (Manner $e0 more_carefully))    ;; n 1 docs 1  e.g. tierB-001300

;; ---- slot consist.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 consist) (Experiencer $e0 $x1) (Member $x1 main_meal))    ;; n 1 docs 1  e.g. tierB-001519

;; ---- slot consist.Of  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 consist) (Of $e0 $x1) (Member $x1 dish))    ;; n 1 docs 1  e.g. tierB-001519

;; ---- slot constitute.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 constitute) (Agent $e0 $x1) (Member $x1 legislation))    ;; n 1 docs 1  e.g. tierB-000673

;; ---- slot constitute.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 1
(And (Member $e0 constitute) (Theme $e0 $e1) (Member $e1 attack))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000673
(And (Member $e0 constitute) (Theme $e0 $e1) (Member $e1 full_fledged))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000673

;; ---- slot construct.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 construct) (Patient $e0 $x1) (Member $x1 railroad))    ;; n 1 docs 1  e.g. tierB-001064

;; ---- slot construct.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 construct) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-001064

;; ---- slot consult.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 consult) (Agent $e0 ashton))    ;; n 1 docs 1  e.g. tierB-001079

;; ---- slot consult.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 consult) (Theme $e0 $x1) (Member $x1 family_physician))    ;; n 1 docs 1  e.g. tierB-001079

;; ---- slot continue.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 continue) (Agent $e0 $x1) (Member $x1 price))    ;; n 1 docs 1  e.g. tierB-000930

;; ---- slot continue.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 continue) (Experiencer $e0 $x1) (Member $x1 hope))    ;; n 1 docs 1  e.g. tierB-001977

;; ---- slot continue.Like  [event center; head oblique]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 continue) (Like $e0 $x1) (Member $x1 flame))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001977
(And (Member $e0 continue) (Like $e0 $x1) (Member $x1 fragile))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001977

;; ---- slot convert.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 convert) (Goal $e0 islam))    ;; n 1 docs 1  e.g. tierB-000092

;; ---- slot cook.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cook) (Agent $e0 $x1) (Member $x1 woman))    ;; n 1 docs 1  e.g. tierB-000864

;; ---- slot cool.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cool) (Experiencer $e0 $x1) (Member $x1 night))    ;; n 1 docs 1  e.g. tierB-000463

;; ---- slot cost.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cost) (Recipient $e0 $x1) (Member $x1 company))    ;; n 1 docs 1  e.g. tierB-001452

;; ---- slot cost.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cost) (Theme $e0 $x1) (Member $x1 fortune))    ;; n 1 docs 1  e.g. tierB-001460

;; ---- slot cover.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cover) (Agent $e0 $x1) (Member $x1 fog))    ;; n 1 docs 1  e.g. tierB-000702

;; ---- slot cover.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cover) (Theme $e0 $x1) (Member $x1 peak))    ;; n 1 docs 1  e.g. tierB-000702

;; ---- slot crack_down.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 crack_down) (Agent $e0 $x1) (Member $x1 moroccan_police))    ;; n 1 docs 1  e.g. tierB-000097

;; ---- slot crack_down.On  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 crack_down) (On $e0 $x1) (Member $x1 protest))    ;; n 1 docs 1  e.g. tierB-000097

;; ---- slot crackle.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 crackle) (Agent $e0 $x1) (Member $x1 campfire))    ;; n 1 docs 1  e.g. tierB-001023

;; ---- slot crash.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 crash) (Goal $e0 $x1) (Member $x1 ground))    ;; n 1 docs 1  e.g. tierB-000176

;; ---- slot crash.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 crash) (Patient $e0 $x1) (Member $x1 tree))    ;; n 1 docs 1  e.g. tierB-000176

;; ---- slot cross.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cross) (Experiencer $e0 $x1) (Member $x1 bridge))    ;; n 1 docs 1  e.g. tierB-000227

;; ---- slot cross.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cross) (Location $e0 el_harrach_river))    ;; n 1 docs 1  e.g. tierB-000227

;; ---- slot crow.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 crow) (Experiencer $e0 gustavo))    ;; n 1 docs 1  e.g. tierB-001675

;; ---- slot crowd.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 crowd) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000991

;; ---- slot crowd.Location  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 crowd) (Location $e0 $x1) (Member $x1 dancer))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000991
(And (Member $e0 crowd) (Location $e0 $x1) (Member $x1 fantastic))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000991

;; ---- slot cry.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cry) (Patient $e0 baya))    ;; n 1 docs 1  e.g. tierB-001538

;; ---- slot cut_down.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cut_down) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 docs 1  e.g. tierB-000277

;; ---- slot cut_down.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 cut_down) (Patient $e0 $x1) (Member $x1 tree))    ;; n 1 docs 1  e.g. tierB-000277

;; ---- slot dance.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dance) (Agent $e0 beth))    ;; n 1 docs 1  e.g. tierB-000962

;; ---- slot dead.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dead) (Experiencer $e0 dan))    ;; n 1 docs 1  e.g. tierB-000256

;; ---- slot deal.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 deal) (Experiencer $e0 $x1) (Member $x1 book))    ;; n 1 docs 1  e.g. tierB-001960

;; ---- slot deal.With  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 deal) (With $e0 psychology))    ;; n 1 docs 1  e.g. tierB-001960

;; ---- slot deal_with.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 deal_with) (Manner $e0 carefully))    ;; n 1 docs 1  e.g. tierB-000398

;; ---- slot decrease.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 decrease) (Patient $e0 $x1) (Member $x1 population_density))    ;; n 1 docs 1  e.g. tierB-001359

;; ---- slot deliver.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 deliver) (Agent $e0 $x1) (Member $x1 postman))    ;; n 1 docs 1  e.g. tierB-000598

;; ---- slot deliver.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 deliver) (Theme $e0 letter))    ;; n 1 docs 1  e.g. tierB-000598

;; ---- slot deliver.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 deliver) (Time $e0 morning))    ;; n 1 docs 1  e.g. tierB-000598

;; ---- slot delivery.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 delivery) (Theme $e0 goods))    ;; n 1 docs 1  e.g. tierB-001952

;; ---- slot demand.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 demand) (Agent $e0 $x1) (Member $x1 pizza))    ;; n 1 docs 1  e.g. tierB-001032

;; ---- slot demand.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 demand) (Experiencer $e0 $x1) (Member $x1 critic))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000602
(And (Member $e0 demand) (Experiencer $e0 $x1) (Member $x1 young))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000602

;; ---- slot demand.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 demand) (Location $e0 $x1) (Member $x1 place))    ;; n 1 docs 1  e.g. tierB-000602

;; ---- slot demand.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 demand) (Theme $e0 $x1) (Member $x1 cheese))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001032
(And (Member $e0 demand) (Theme $e0 $x1) (Member $x1 extra))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001032

;; ---- slot demolish.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 demolish) (Patient $e0 $x1) (Member $x1 house))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000471
(And (Member $e0 demolish) (Patient $e0 $x1) (Member $x1 old))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000471

;; ---- slot demonstrate.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 demonstrate) (Agent $e0 $x1) (Member $x1 salesman))    ;; n 1 docs 1  e.g. tierB-001996

;; ---- slot demonstrate.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 demonstrate) (Theme $e0 <term:Question>))    ;; n 1 docs 1  e.g. tierB-001996

;; ---- slot depart.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 depart) (Agent $e0 $x1) (Member $x1 train))    ;; n 1 docs 1  e.g. tierB-001927

;; ---- slot desperate.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 desperate) (Experiencer $e0 $x1) (Member $x1 desperate))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001539
(And (Member $e0 desperate) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001539

;; ---- slot desperate.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 desperate) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001539

;; ---- slot develop.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 develop) (Agent $e0 bruce_botnick))    ;; n 1 docs 1  e.g. tierC-000349

;; ---- slot develop.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 develop) (Patient $e0 web_application))    ;; n 1 docs 1  e.g. tierB-000404

;; ---- slot develop.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 develop) (Theme $e0 $x1) (Member $x1 session))    ;; n 1 docs 1  e.g. tierC-000349

;; ---- slot devote.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 devote) (Theme $e0 $x1) (Member $x1 morning))    ;; n 1 docs 1  e.g. tierB-000229

;; ---- slot dictate.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dictate) (Experiencer $e0 $x1) (Member $x1 schedule))    ;; n 1 docs 1  e.g. tierB-001389

;; ---- slot dictate.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dictate) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001389

;; ---- slot die.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 die) (Source $e0 mosquito))    ;; n 1 docs 1  e.g. tierB-001967

;; ---- slot die_down.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 die_down) (Patient $e0 $x1) (Member $x1 wind))    ;; n 1 docs 1  e.g. tierB-000062

;; ---- slot die_out.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 die_out) (Patient $e0 old_prussian))    ;; n 1 docs 1  e.g. tierB-001443

;; ---- slot die_out.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 die_out) (Time $e0 long_time_ago))    ;; n 1 docs 1  e.g. tierB-001443

;; ---- slot differ.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 differ) (Experiencer $e0 $x1) (Member $x1 sentence))    ;; n 1 docs 1  e.g. tierB-000629

;; ---- slot differ.WithRespectTo  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 differ) (WithRespectTo $e0 tense))    ;; n 1 docs 1  e.g. tierB-000629

;; ---- slot difficult.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 difficult) (Experiencer $e0 $x1) (Member $x1 difficult))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000925
(And (Member $e0 difficult) (Experiencer $e0 $x1) (Member $x1 hill))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000925

;; ---- slot difficult.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 difficult) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001535

;; ---- slot digest.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 digest) (Patient $e0 apple_seed))    ;; n 1 docs 1  e.g. tierB-001995

;; ---- slot direct.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 direct) (For $e0 oscar))    ;; n 1 docs 1  e.g. tierC-000010

;; ---- slot direct.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 direct) (Theme $e0 $x1) (Member $x1 orchestra))    ;; n 1 docs 1  e.g. tierB-001087

;; ---- slot disappear.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 disappear) (Agent $e0 $x1) (Member $x1 horse))    ;; n 1 docs 1  e.g. tierB-001752

;; ---- slot disappear.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 disappear) (Goal $e0 $x1) (Member $x1 wood))    ;; n 1 docs 1  e.g. tierB-001752

;; ---- slot disappear.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 disappear) (Patient $e0 $x1) (Member $x1 crack))    ;; n 1 docs 1  e.g. tierB-000265

;; ---- slot discover.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 discover) (Location $e0 japan))    ;; n 1 docs 1  e.g. tierC-000112

;; ---- slot dismantle.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dismantle) (Patient $e0 $x1) (Member $x1 apartheid_system))    ;; n 1 docs 1  e.g. tierB-001611

;; ---- slot display.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 display) (Agent $e0 $x1) (Member $x1 billboard))    ;; n 1 docs 1  e.g. tierB-001253

;; ---- slot dissolve.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dissolve) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000099

;; ---- slot dissolve.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dissolve) (Patient $e0 william_ewer))    ;; n 1 docs 1  e.g. tierC-000099

;; ---- slot distinguish.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 distinguish) (Agent $e0 hugo))    ;; n 1 docs 1  e.g. tierB-001445

;; ---- slot distinguish.Between  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 distinguish) (Between $e0 $x1) (Member $x1 paste))    ;; n 1 docs 1  e.g. tierB-001445

;; ---- slot distort.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 distort) (Patient $e0 religion))    ;; n 1 docs 1  e.g. tierB-001240

;; ---- slot distribute.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 distribute) (Agent $e0 $x1) (Member $x1 rebel))    ;; n 1 docs 1  e.g. tierB-000485

;; ---- slot distribute.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 distribute) (Recipient $e0 $x1) (Member $x1 local))    ;; n 1 docs 1  e.g. tierB-000485

;; ---- slot distribute.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 distribute) (Source $e0 $x1) (Member $x1 storehouse))    ;; n 1 docs 1  e.g. tierB-000485

;; ---- slot divide.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 divide) (Agent $e0 chuck_norris))    ;; n 1 docs 1  e.g. tierB-000824

;; ---- slot divide.By  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 divide) (By $e0 zero))    ;; n 1 docs 1  e.g. tierB-000824

;; ---- slot do.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 do) (Agent $e0 $x1) (Member $x1 dung_beetle))    ;; n 1 docs 1  e.g. tierB-001735

;; ---- slot do_away_with.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 do_away_with) (Agent $e0 america))    ;; n 1 docs 1  e.g. tierB-001226

;; ---- slot do_away_with.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 do_away_with) (Patient $e0 slavery))    ;; n 1 docs 1  e.g. tierB-001226

;; ---- slot do_the_trick.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 do_the_trick) (Agent $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001507

;; ---- slot do_time.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 do_time) (Agent $e0 $x1) (Member $x1 inmate))    ;; n 1 docs 1  e.g. tierB-001786

;; ---- slot do_time.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 do_time) (For $e0 $x1) (Member $x1 burglary_conviction))    ;; n 1 docs 1  e.g. tierB-001786

;; ---- slot doctor.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 doctor) (Experiencer $e0 yuri))    ;; n 1 docs 1  e.g. tierB-000203

;; ---- slot draw.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 draw) (Source $e0 $x1) (Member $x1 town))    ;; n 1 docs 1  e.g. tierB-000781

;; ---- slot draw.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 draw) (Theme $e0 $x1) (Member $x1 attendee))    ;; n 1 docs 1  e.g. tierB-000781

;; ---- slot dress.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dress) (Agent $e0 $x1) (Member $x1 nurse))    ;; n 1 docs 1  e.g. tierB-000028

;; ---- slot dress.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dress) (Manner $e0 conventional))    ;; n 1 docs 1  e.g. tierB-001295

;; ---- slot drink.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 drink) (Time $e0 yesterday))    ;; n 1 docs 1  e.g. tierB-000946

;; ---- slot drip.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 drip) (Patient $e0 $x1) (Member $x1 rain))    ;; n 1 docs 1  e.g. tierB-001110

;; ---- slot drip.Through  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 drip) (Through $e0 $x1) (Member $x1 leak))    ;; n 1 docs 1  e.g. tierB-001110

;; ---- slot drive.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 drive) (Manner $e0 slowly))    ;; n 1 docs 1  e.g. tierB-000426

;; ---- slot drop.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 drop) (Patient $e0 $x1) (Member $x1 charge))    ;; n 1 docs 1  e.g. tierB-001465

;; ---- slot dwarf_planet.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 dwarf_planet) (Experiencer $e0 pluto))    ;; n 1 docs 1  e.g. tierB-001866

;; ---- slot eat.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 eat) (Source $e0 $x1) (Member $x1 cookie_jar))    ;; n 1 docs 1  e.g. tierB-000338

;; ---- slot eat_away.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 eat_away) (Agent $e0 rust))    ;; n 1 docs 1  e.g. tierB-000249

;; ---- slot eat_away.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 eat_away) (Patient $e0 $x1) (Member $x1 iron_bar))    ;; n 1 docs 1  e.g. tierB-000249

;; ---- slot effective.Against  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 effective) (Against $e0 $x1) (Member $x1 virus))    ;; n 1 docs 1  e.g. tierB-000786

;; ---- slot elect.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 elect) (Agent $e0 $x1) (Member $x1 student))    ;; n 1 docs 1  e.g. tierB-001066

;; ---- slot elect.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 elect) (Theme $e0 $x1) (Member $x1 member))    ;; n 1 docs 1  e.g. tierB-001066

;; ---- slot emerge.FromBehind  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 emerge) (FromBehind $e0 $x1) (Member $x1 cloud))    ;; n 1 docs 1  e.g. tierB-001838

;; ---- slot emerge.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 emerge) (Patient $e0 $x1) (Member $x1 sun))    ;; n 1 docs 1  e.g. tierB-001838

;; ---- slot enable.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 enable) (Agent $e0 $x1) (Member $x1 taste_test))    ;; n 1 docs 1  e.g. tierB-001445

;; ---- slot enable.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 enable) (Theme $e0 $e1) (Member $e1 distinguish))    ;; n 1 docs 1  e.g. tierB-001445

;; ---- slot end.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 end) (Time $e0 one_day))    ;; n 1 docs 1  e.g. tierB-000108

;; ---- slot endeavor.Source  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 endeavor) (Source $e0 $x1) (Member $x1 corporation))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000538
(And (Member $e0 endeavor) (Source $e0 $x1) (Member $x1 massive))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000538

;; ---- slot engineer.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 engineer) (Agent $e0 bruce_botnick))    ;; n 1 docs 1  e.g. tierC-000350

;; ---- slot engineer.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 engineer) (Patient $e0 $x1) (Member $x1 session))    ;; n 1 docs 1  e.g. tierC-000350

;; ---- slot enough.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 enough) (Experiencer $e0 $x1) (Member $x1 old))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001164
(And (Member $e0 enough) (Experiencer $e0 $x1) (Member $x1 port))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001164

;; ---- slot enough.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 enough) (For $e0 modern_ship))    ;; n 1 docs 1  e.g. tierB-001164

;; ---- slot enter.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 enter) (For $e0 free))    ;; n 1 docs 1  e.g. tierB-000556

;; ---- slot enter.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 enter) (Instrument $e0 $x1) (Member $x1 ticket))    ;; n 1 docs 1  e.g. tierB-000556

;; ---- slot enter.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 enter) (Manner $e0 cautiously))    ;; n 1 docs 1  e.g. tierB-000163

;; ---- slot escort.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 escort) (Agent $e0 claudio))    ;; n 1 docs 1  e.g. tierB-000111

;; ---- slot escort.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 escort) (Goal $e0 $x1) (Member $x1 exit))    ;; n 1 docs 1  e.g. tierB-000111

;; ---- slot escort.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 escort) (Theme $e0 isabella))    ;; n 1 docs 1  e.g. tierB-000111

;; ---- slot establish.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 establish) (Time $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-000373

;; ---- slot evaporate.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 evaporate) (Patient $e0 $x1) (Member $x1 rainwater))    ;; n 1 docs 1  e.g. tierB-000251

;; ---- slot evaporate.Time  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 evaporate) (Time $e0 $x1) (Member $x1 day))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000251
(And (Member $e0 evaporate) (Time $e0 $x1) (Member $x1 hot))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000251

;; ---- slot event.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 event) (Experiencer $e0 $x1) (Member $x1 delayed))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000808
(And (Member $e0 event) (Experiencer $e0 $x1) (Member $x1 train))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000808

;; ---- slot excavate.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 excavate) (Agent $e0 $x1) (Member $x1 team))    ;; n 1 docs 1  e.g. tierB-000374

;; ---- slot excavate.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 excavate) (Beneficiary $e0 $x1) (Member $x1 archaeologist))    ;; n 1 docs 1  e.g. tierB-000374

;; ---- slot excavate.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 excavate) (Manner $e0 carefully))    ;; n 1 docs 1  e.g. tierB-000374

;; ---- slot exceed.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 exceed) (Agent $e0 quadratic_placement))    ;; n 1 docs 1  e.g. tierC-000194

;; ---- slot exceed.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 exceed) (Theme $e0 combinatorial_solution))    ;; n 1 docs 1  e.g. tierC-000194

;; ---- slot exceed.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 exceed) (Time $e0 later))    ;; n 1 docs 1  e.g. tierC-000194

;; ---- slot excellent.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 excellent) (Experiencer $e0 hubble))    ;; n 1 docs 1  e.g. tierB-000568

;; ---- slot exist.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 exist) (Experiencer $e0 truth))    ;; n 1 docs 1  e.g. tierB-001671

;; ---- slot expensive.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 expensive) (Experiencer $e0 $x1) (Member $x1 expensive))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000370
(And (Member $e0 expensive) (Experiencer $e0 $x1) (Member $x1 thing))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000370

;; ---- slot explain.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 explain) (Agent $e0 paul))    ;; n 1 docs 1  e.g. tierB-000087

;; ---- slot explain.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 explain) (Manner $e0 in_full))    ;; n 1 docs 1  e.g. tierB-000087

;; ---- slot explain.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 explain) (Theme $e0 $e1) (Member $e1 happen))    ;; n 1 docs 1  e.g. tierB-000087

;; ---- slot explode.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 explode) (Patient $e0 $e1) (Member $e1 anger))    ;; n 1 docs 1  e.g. tierB-001669

;; ---- slot face.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 face) (Agent $e0 $x1) (Member $x1 hotel))    ;; n 1 docs 1  e.g. tierB-000767

;; ---- slot fade.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fade) (Manner $e0 slowly))    ;; n 1 docs 1  e.g. tierB-000685

;; ---- slot fade.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 fade) (Patient $e0 $x1) (Member $x1 light))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000685
(And (Member $e0 fade) (Patient $e0 $x1) (Member $x1 outside))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000685

;; ---- slot fail.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fail) (Patient $e0 diplomacy))    ;; n 1 docs 1  e.g. tierB-001591

;; ---- slot faint.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 faint) (Experiencer $e0 $x1) (Member $x1 faint))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001384
(And (Member $e0 faint) (Experiencer $e0 $x1) (Member $x1 sound))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001384

;; ---- slot fall.BecauseOf  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fall) (BecauseOf $e0 $x1) (Member $x1 wind))    ;; n 1 docs 1  e.g. tierB-001306

;; ---- slot fall.Over  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fall) (Over $e0 $x1) (Member $x1 crowd))    ;; n 1 docs 1  e.g. tierB-001975

;; ---- slot fall.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fall) (Time $e0 any_time))    ;; n 1 docs 1  e.g. tierB-001476

;; ---- slot falling_out.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 falling_out) (Agent $e0 $x1) (Member $x1 couple))    ;; n 1 docs 1  e.g. tierB-000828

;; ---- slot falling_out.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 falling_out) (Time $e0 $x1) (Member $x1 point))    ;; n 1 docs 1  e.g. tierB-000828

;; ---- slot fan.Agent  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 fan) (Agent $e0 $x1) (Member $x1 easterly))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001163
(And (Member $e0 fan) (Agent $e0 $x1) (Member $x1 wind))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001163

;; ---- slot fan.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fan) (Patient $e0 $x1) (Member $x1 fire))    ;; n 1 docs 1  e.g. tierB-001163

;; ---- slot fear.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fear) (Stimulus $e0 change))    ;; n 1 docs 1  e.g. tierB-001609

;; ---- slot festival.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 festival) (Time $e0 evening))    ;; n 1 docs 1  e.g. tierB-001061

;; ---- slot fill.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fill) (Agent $e0 $x1) (Member $x1 aroma))    ;; n 1 docs 1  e.g. tierB-001403

;; ---- slot fill.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fill) (Instrument $e0 $x1) (Member $x1 potato))    ;; n 1 docs 1  e.g. tierB-000016

;; ---- slot finalize.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 finalize) (Agent $e0 $x1) (Member $x1 author))    ;; n 1 docs 1  e.g. tierB-001964

;; ---- slot finalize.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 finalize) (Patient $e0 $x1) (Member $x1 plot))    ;; n 1 docs 1  e.g. tierB-001964

;; ---- slot finance.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 finance) (Manner $e0 jointly))    ;; n 1 docs 1  e.g. tierC-000246

;; ---- slot fine.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fine) (Theme $e0 $x1) (Member $x1 speeder))    ;; n 1 docs 1  e.g. tierB-001526

;; ---- slot fire.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fire) (Patient $e0 $x1) (Member $x1 salvo))    ;; n 1 docs 1  e.g. tierB-001824

;; ---- slot flight.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 flight) (Source $e0 pyongyang))    ;; n 1 docs 1  e.g. tierB-000717

;; ---- slot float.Down  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 float) (Down $e0 $x1) (Member $x1 river))    ;; n 1 docs 1  e.g. tierB-000416

;; ---- slot float.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 float) (Theme $e0 $x1) (Member $x1 log))    ;; n 1 docs 1  e.g. tierB-000416

;; ---- slot flow.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 flow) (Location $e0 london))    ;; n 1 docs 1  e.g. tierB-001691

;; ---- slot flow.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 flow) (Patient $e0 thames))    ;; n 1 docs 1  e.g. tierB-001691

;; ---- slot fly.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fly) (Manner $e0 around))    ;; n 1 docs 1  e.g. tierB-000801

;; ---- slot fly_away.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fly_away) (Agent $e0 gustavo))    ;; n 1 docs 1  e.g. tierB-001675

;; ---- slot follow.As  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 follow) (As $e0 $x1) (Member $x1 caretaker))    ;; n 1 docs 1  e.g. tierC-000337

;; ---- slot follow.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 follow) (Experiencer $e0 $x1) (Member $x1 result))    ;; n 1 docs 1  e.g. tierB-000744

;; ---- slot follow.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 follow) (Source $e0 $x1) (Member $x1 proposition))    ;; n 1 docs 1  e.g. tierB-000744

;; ---- slot follow.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 follow) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-000744

;; ---- slot foment.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 foment) (Agent $e0 $e1) (Member $e1 request))    ;; n 1 docs 1  e.g. tierB-000969

;; ---- slot foment.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 foment) (Patient $e0 $x1) (Member $x1 diplomatic_crisis))    ;; n 1 docs 1  e.g. tierB-000969

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

;; ---- slot freeze_over.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 freeze_over) (Patient $e0 lake_akan))    ;; n 1 docs 1  e.g. tierB-000572

;; ---- slot french.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 french) (Experiencer $e0 $x1) (Member $x1 indigenous))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001
(And (Member $e0 french) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001

;; ---- slot game.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 game) (Time $e0 next_week))    ;; n 1 docs 1  e.g. tierB-000259

;; ---- slot gather.Around  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 gather) (Around $e0 fishing_boat))    ;; n 1 docs 1  e.g. tierB-001911

;; ---- slot generate.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 generate) (Agent $e0 martino))    ;; n 1 docs 1  e.g. tierB-000107

;; ---- slot generate.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 generate) (For $e0 $x1) (Member $x1 liftoff))    ;; n 1 docs 1  e.g. tierB-000107

;; ---- slot generate.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 generate) (Patient $e0 $x1) (Member $x1 energy))    ;; n 1 docs 1  e.g. tierB-000107

;; ---- slot get.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 get) (Beneficiary $e0 olivia))    ;; n 1 docs 1  e.g. tierB-000672

;; ---- slot get.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 get) (For $e0 bed))    ;; n 1 docs 1  e.g. tierB-001185

;; ---- slot get.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 get) (Manner $e0 gradually))    ;; n 1 docs 1  e.g. tierB-001658

;; ---- slot get.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 get) (Source $e0 $x1) (Member $x1 vending_machine))    ;; n 1 docs 1  e.g. tierB-001325

;; ---- slot get.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 get) (Time $e0 tonight))    ;; n 1 docs 1  e.g. tierB-001773

;; ---- slot get_out.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 get_out) (Agent $e0 pietro))    ;; n 1 docs 1  e.g. tierB-000138

;; ---- slot get_out.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 get_out) (Source $e0 $x1) (Member $x1 way))    ;; n 1 docs 1  e.g. tierB-000138

;; ---- slot get_rid_of.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 get_rid_of) (Agent $e0 algiers))    ;; n 1 docs 1  e.g. tierB-000262

;; ---- slot get_rid_of.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 get_rid_of) (Patient $e0 $x1) (Member $x1 shantytown))    ;; n 1 docs 1  e.g. tierB-000262

;; ---- slot give.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 give) (Location $e0 japan))    ;; n 1 docs 1  e.g. tierC-000111

;; ---- slot give_off.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 give_off) (Agent $e0 $x1) (Member $x1 flower))    ;; n 1 docs 1  e.g. tierB-000085

;; ---- slot give_off.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 give_off) (Patient $e0 $x1) (Member $x1 perfume))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000085
(And (Member $e0 give_off) (Patient $e0 $x1) (Member $x1 pleasant))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000085

;; ---- slot give_up.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 give_up) (Agent $e0 bob))    ;; n 1 docs 1  e.g. tierB-000947

;; ---- slot give_up.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 give_up) (Location $e0 japan))    ;; n 1 docs 1  e.g. tierC-000112

;; ---- slot give_up.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 give_up) (Manner $e0 first))    ;; n 1 docs 1  e.g. tierC-000112

;; ---- slot glitch.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 glitch) (Location $e0 $x1) (Member $x1 system))    ;; n 1 docs 1  e.g. tierB-001931

;; ---- slot go.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 go) (Patient $e0 $x1) (Member $x1 cold))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000362
(And (Member $e0 go) (Patient $e0 $x1) (Member $x1 trail))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000362

;; ---- slot go.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 go) (Theme $e0 $e1) (Member $e1 swim))    ;; n 1 docs 1  e.g. tierB-000313

;; ---- slot go.Through  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go) (Through $e0 $x1) (Member $x1 gap))    ;; n 1 docs 1  e.g. tierB-001183

;; ---- slot go_above_and_beyond.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go_above_and_beyond) (Agent $e0 william))    ;; n 1 docs 1  e.g. tierB-000273

;; ---- slot go_around.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 go_around) (Agent $e0 $e1) (Member $e1 rumor))    ;; n 1 docs 1  e.g. tierB-001547

;; ---- slot go_back.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go_back) (Manner $e0 immediately))    ;; n 1 docs 1  e.g. tierB-001743

;; ---- slot go_back.Without  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go_back) (Without $e0 hope))    ;; n 1 docs 1  e.g. tierB-001058

;; ---- slot go_down.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go_down) (Manner $e0 considerably))    ;; n 1 docs 1  e.g. tierB-001793

;; ---- slot go_in.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go_in) (Agent $e0 bill))    ;; n 1 docs 1  e.g. tierB-000363

;; ---- slot go_into_effect.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go_into_effect) (Patient $e0 $x1) (Member $x1 winter_hour))    ;; n 1 docs 1  e.g. tierB-001924

;; ---- slot go_off.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go_off) (Patient $e0 $x1) (Member $x1 light))    ;; n 1 docs 1  e.g. tierB-001756

;; ---- slot go_on.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go_on) (Patient $e0 $x1) (Member $x1 light))    ;; n 1 docs 1  e.g. tierB-001756

;; ---- slot go_on_sale.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go_on_sale) (Patient $e0 $x1) (Member $x1 ticket))    ;; n 1 docs 1  e.g. tierB-001513

;; ---- slot go_on_sale.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go_on_sale) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierB-001513

;; ---- slot go_out.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 go_out) (Agent $e0 $x1) (Member $x1 mother))    ;; n 1 docs 1  e.g. tierB-000720

;; ---- slot go_without_saying.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 go_without_saying) (Experiencer $e0 $x1) (Member $x1 last))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000657
(And (Member $e0 go_without_saying) (Experiencer $e0 $x1) (Member $x1 part))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000657

;; ---- slot good.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 good) (Beneficiary $e0 health))    ;; n 1 docs 1  e.g. tierB-000999

;; ---- slot good.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 good) (Source $e0 here))    ;; n 1 docs 1  e.g. tierB-001521

;; ---- slot good.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 good) (Time $e0 today))    ;; n 1 docs 1  e.g. tierB-000495

;; ---- slot govern.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 govern) (Location $e0 $x1) (Member $x1 coalition))    ;; n 1 docs 1  e.g. tierB-000359

;; ---- slot govern.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 govern) (Theme $e0 $x1) (Member $x1 interaction))    ;; n 1 docs 1  e.g. tierB-000934

;; ---- slot grasp.At  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 grasp) (At $e0 $x1) (Member $x1 opportunity))    ;; n 1 docs 1  e.g. tierB-001572

;; ---- slot grasp.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 grasp) (Manner $e0 immediately))    ;; n 1 docs 1  e.g. tierB-001572

;; ---- slot gray.Like  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 gray) (Like $e0 developed_country))    ;; n 1 docs 1  e.g. tierB-000611

;; ---- slot gray.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 gray) (Patient $e0 america))    ;; n 1 docs 1  e.g. tierB-000611

;; ---- slot grow.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 grow) (Agent $e0 $x1) (Member $x1 manager))    ;; n 1 docs 1  e.g. tierB-001512

;; ---- slot guarantee.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 guarantee) (In $e0 life))    ;; n 1 docs 1  e.g. tierB-001069

;; ---- slot guarantee.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 guarantee) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001069

;; ---- slot gusher.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 gusher) (Experiencer $e0 $x1) (Member $x1 freedom_movement))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000654
(And (Member $e0 gusher) (Experiencer $e0 $x1) (Member $x1 gusher))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000654

;; ---- slot hand_over.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hand_over) (Recipient $e0 $x1) (Member $x1 police))    ;; n 1 docs 1  e.g. tierB-000150

;; ---- slot hand_over.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hand_over) (Theme $e0 $x1) (Member $x1 thief))    ;; n 1 docs 1  e.g. tierB-000150

;; ---- slot hang.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hang) (Source $e0 $x1) (Member $x1 ceiling))    ;; n 1 docs 1  e.g. tierB-001925

;; ---- slot hang_out.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hang_out) (Manner $e0 often))    ;; n 1 docs 1  e.g. tierB-000075

;; ---- slot happen.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 happen) (Patient $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001893

;; ---- slot happen.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 happen) (Time $e0 lunchtime))    ;; n 1 docs 1  e.g. tierB-001363

;; ---- slot happy.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 happy) (Experiencer $e0 $x1) (Member $x1 student))    ;; n 1 docs 1  e.g. tierB-001832

;; ---- slot hard.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 hard) (Experiencer $e0 $e1) (Member $e1 open))    ;; n 1 docs 1  e.g. tierB-001523

;; ---- slot hard.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hard) (Patient $e0 $x1) (Member $x1 decision))    ;; n 1 docs 1  e.g. tierB-001339

;; ---- slot have.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 have) (Manner $e0 clearly))    ;; n 1 docs 1  e.g. tierB-000730

;; ---- slot have.On  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 have) (On $e0 $x1) (Member $x1 crop))    ;; n 1 docs 1  e.g. tierB-000790

;; ---- slot hazardous.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hazardous) (Experiencer $e0 travel))    ;; n 1 docs 1  e.g. tierB-001754

;; ---- slot hazardous.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hazardous) (For $e0 high_profile_vehicle))    ;; n 1 docs 1  e.g. tierB-001754

;; ---- slot head.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 head) (Agent $e0 $x1) (Member $x1 hunting_dog))    ;; n 1 docs 1  e.g. tierB-001055

;; ---- slot head.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 head) (Goal $e0 $x1) (Member $x1 wood))    ;; n 1 docs 1  e.g. tierB-001055

;; ---- slot healthy.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 healthy) (Experiencer $e0 $x1) (Member $x1 healthy))    ;; n 1 docs 1  e.g. tierB-001710

;; ---- slot heat.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 heat) (Location $e0 $x1) (Member $x1 oven))    ;; n 1 docs 1  e.g. tierB-000403

;; ---- slot heat.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 heat) (Patient $e0 $x1) (Member $x1 food))    ;; n 1 docs 1  e.g. tierB-000403

;; ---- slot help.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 help) (In $e0 $e1) (Member $e1 understand))    ;; n 1 docs 1  e.g. tierB-001909

;; ---- slot help.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 help) (Time $e0 in_time))    ;; n 1 docs 1  e.g. tierB-000299

;; ---- slot help.With  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 help) (With $e0 $x1) (Member $x1 family_business))    ;; n 1 docs 1  e.g. tierB-001094

;; ---- slot hidden.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hidden) (Location $e0 unknown))    ;; n 1 docs 1  e.g. tierB-000758

;; ---- slot hidden.Source  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hidden) (Source $e0 $x1) (Member $x1 public))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000979
(And (Member $e0 hidden) (Source $e0 $x1) (Member $x1 view))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000979

;; ---- slot high.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 high) (Experiencer $e0 $x1) (Member $x1 price))    ;; n 1 docs 1  e.g. tierB-001937

;; ---- slot high.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 high) (Time $e0 lately))    ;; n 1 docs 1  e.g. tierB-001937

;; ---- slot hike.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hike) (Agent $e0 ziri))    ;; n 1 docs 1  e.g. tierB-000008

;; ---- slot hike.Location  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hike) (Location $e0 $x1) (Member $x1 hiking_path))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000008
(And (Member $e0 hike) (Location $e0 $x1) (Member $x1 secluded))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000008

;; ---- slot hint.At  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hint) (At $e0 autumn))    ;; n 1 docs 1  e.g. tierB-001596

;; ---- slot hint.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hint) (Experiencer $e0 $x1) (Member $x1 air))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001596
(And (Member $e0 hint) (Experiencer $e0 $x1) (Member $x1 crisp))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001596

;; ---- slot hit_on.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hit_on) (Agent $e0 ziri))    ;; n 1 docs 1  e.g. tierB-000013

;; ---- slot hit_on.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hit_on) (Theme $e0 rima))    ;; n 1 docs 1  e.g. tierB-000013

;; ---- slot hold.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hold) (Agent $e0 $x1) (Member $x1 theater))    ;; n 1 docs 1  e.g. tierB-001266

;; ---- slot hold.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hold) (Location $e0 here))    ;; n 1 docs 1  e.g. tierB-000378

;; ---- slot hold.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hold) (Theme $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001266

;; ---- slot hold_up.BecauseOf  [event center; head oblique]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 hold_up) (BecauseOf $e0 $x1) (Member $x1 dense))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000329
(And (Member $e0 hold_up) (BecauseOf $e0 $x1) (Member $x1 fog))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000329

;; ---- slot hold_up.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hold_up) (Patient $e0 traffic))    ;; n 1 docs 1  e.g. tierB-000692

;; ---- slot horrible.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 horrible) (Location $e0 $x1) (Member $x1 suburb))    ;; n 1 docs 1  e.g. tierB-000489

;; ---- slot horrible.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 horrible) (Time $e0 the_other_day))    ;; n 1 docs 1  e.g. tierB-000489

;; ---- slot hot.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hot) (Experiencer $e0 $x1) (Member $x1 day))    ;; n 1 docs 1  e.g. tierB-000463

;; ---- slot identify.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 identify) (Agent $e0 kate))    ;; n 1 docs 1  e.g. tierB-001191

;; ---- slot illegal.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 illegal) (Experiencer $e0 $x1) (Member $x1 drug))    ;; n 1 docs 1  e.g. tierB-001880

;; ---- slot illness.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 illness) (Experiencer $e0 $x1) (Member $x1 boy))    ;; n 1 docs 1  e.g. tierB-001625

;; ---- slot illumine.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 illumine) (Agent $e0 $x1) (Member $x1 lantern))    ;; n 1 docs 1  e.g. tierB-001061

;; ---- slot illumine.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 illumine) (In $e0 green))    ;; n 1 docs 1  e.g. tierB-001061

;; ---- slot illumine.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 illumine) (Theme $e0 $e1) (Member $e1 festival))    ;; n 1 docs 1  e.g. tierB-001061

;; ---- slot illustrate.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 illustrate) (Agent $e0 j_augustus_knapp))    ;; n 1 docs 1  e.g. tierC-000232

;; ---- slot illustrate.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 illustrate) (Patient $e0 $x1) (Member $x1 illustration))    ;; n 1 docs 1  e.g. tierC-000232

;; ---- slot imitate.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 imitate) (Agent $e0 $x1) (Member $x1 bird))    ;; n 1 docs 1  e.g. tierB-001888

;; ---- slot imitate.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 imitate) (Theme $e0 $x1) (Member $x1 human))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001888
(And (Member $e0 imitate) (Theme $e0 $x1) (Member $x1 voice))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001888

;; ---- slot implement.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 implement) (Agent $e0 brazil))    ;; n 1 docs 1  e.g. tierB-000281

;; ---- slot implement.CoAgent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 implement) (CoAgent $e0 spain))    ;; n 1 docs 1  e.g. tierB-000281

;; ---- slot implement.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 implement) (Theme $e0 $x1) (Member $x1 law_of_reciprocity))    ;; n 1 docs 1  e.g. tierB-000281

;; ---- slot implore.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 implore) (Agent $e0 celestia))    ;; n 1 docs 1  e.g. tierC-000043

;; ---- slot implore.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 implore) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierC-000043

;; ---- slot imprison.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 imprison) (Patient $e0 jonas))    ;; n 1 docs 1  e.g. tierB-000610

;; ---- slot improve.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 improve) (Location $e0 $x1) (Member $x1 school))    ;; n 1 docs 1  e.g. tierB-001065

;; ---- slot in_charge_of.Holder  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 in_charge_of) (Holder $e0 yamada))    ;; n 1 docs 1  e.g. tierB-001171

;; ---- slot in_charge_of.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 in_charge_of) (Theme $e0 $x1) (Member $x1 second_year_class))    ;; n 1 docs 1  e.g. tierB-001171

;; ---- slot in_charge_of.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 in_charge_of) (Time $e0 this_year))    ;; n 1 docs 1  e.g. tierB-001171

;; ---- slot in_fashion.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 in_fashion) (Experiencer $e0 $x1) (Member $x1 in_fashion))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001896
(And (Member $e0 in_fashion) (Experiencer $e0 $x1) (Member $x1 style))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001896

;; ---- slot in_fashion.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 in_fashion) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-001896

;; ---- slot include.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 include) (Location $e0 $x1) (Member $x1 treaty))    ;; n 1 docs 1  e.g. tierB-001878

;; ---- slot increase.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 increase) (Location $e0 $x1) (Member $x1 region))    ;; n 1 docs 1  e.g. tierB-001903

;; ---- slot incubate.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 incubate) (Location $e0 $x1) (Member $x1 mother_bird))    ;; n 1 docs 1  e.g. tierB-000217

;; ---- slot incubate.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 incubate) (Patient $e0 $x1) (Member $x1 egg))    ;; n 1 docs 1  e.g. tierB-000217

;; ---- slot indicate.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 indicate) (Agent $e0 $x1) (Member $x1 arrow))    ;; n 1 docs 1  e.g. tierB-001190

;; ---- slot indicate.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 indicate) (Theme $e0 $x1) (Member $x1 way))    ;; n 1 docs 1  e.g. tierB-001190

;; ---- slot indigenous.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 indigenous) (Experiencer $e0 $x1) (Member $x1 indigenous))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001
(And (Member $e0 indigenous) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000001

;; ---- slot influence.Source  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 influence) (Source $e0 $x1) (Member $x1 balance))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000258
(And (Member $e0 influence) (Source $e0 $x1) (Member $x1 international))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000258

;; ---- slot influence.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 influence) (Theme $e0 $x1) (Member $x1 religion))    ;; n 1 docs 1  e.g. tierC-000258

;; ---- slot injure.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 injure) (Source $e0 $x1) (Member $x1 lion_attack))    ;; n 1 docs 1  e.g. tierB-000725

;; ---- slot inomaru.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 inomaru) (Experiencer $e0 $x1) (Member $x1 inomaru))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000237
(And (Member $e0 inomaru) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000237

;; ---- slot install.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 install) (Patient $e0 $x1) (Member $x1 game))    ;; n 1 docs 1  e.g. tierB-001845

;; ---- slot into.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 into) (Experiencer $e0 boris))    ;; n 1 docs 1  e.g. tierB-000603

;; ---- slot into.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 into) (Stimulus $e0 motorcross_biking))    ;; n 1 docs 1  e.g. tierB-000603

;; ---- slot investigate.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 investigate) (Agent $e0 ftc))    ;; n 1 docs 1  e.g. tierB-001355

;; ---- slot investigate.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 investigate) (Theme $e0 $x1) (Member $x1 company))    ;; n 1 docs 1  e.g. tierB-001355

;; ---- slot investigation.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 investigation) (Theme $e0 $x1) (Member $x1 organism))    ;; n 1 docs 1  e.g. tierB-001589

;; ---- slot involve.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 involve) (Agent $e0 $x1) (Member $x1 border_incident))    ;; n 1 docs 1  e.g. tierB-001222

;; ---- slot involve.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 involve) (Theme $e0 $e1) (Member $e1 traffic))    ;; n 1 docs 1  e.g. tierB-001222

;; ---- slot involved.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 involved) (Experiencer $e0 $x1) (Member $x1 army))    ;; n 1 docs 1  e.g. tierB-000411

;; ---- slot involved.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 involved) (In $e0 $x1) (Member $x1 action))    ;; n 1 docs 1  e.g. tierB-000411

;; ---- slot issue.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 issue) (Experiencer $e0 $x1) (Member $x1 answer))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000997
(And (Member $e0 issue) (Experiencer $e0 $x1) (Member $x1 no))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000997

;; ---- slot jail.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 jail) (Experiencer $e0 dan))    ;; n 1 docs 1  e.g. tierB-000867

;; ---- slot jump.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 jump) (For $e0 joy))    ;; n 1 docs 1  e.g. tierB-001530

;; ---- slot jump.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 jump) (Manner $e0 around))    ;; n 1 docs 1  e.g. tierB-001983

;; ---- slot keep_a_clean_sheet.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 keep_a_clean_sheet) (Agent $e0 $x1) (Member $x1 goalkeeper))    ;; n 1 docs 1  e.g. tierB-001508

;; ---- slot keep_away.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 keep_away) (Agent $e0 $x1) (Member $x1 onion))    ;; n 1 docs 1  e.g. tierB-001837

;; ---- slot keep_away.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 keep_away) (Theme $e0 mosquito))    ;; n 1 docs 1  e.g. tierB-001837

;; ---- slot key_in.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 key_in) (Manner $e0 intentionally))    ;; n 1 docs 1  e.g. tierB-001922

;; ---- slot key_in.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 key_in) (Theme $e0 $x1) (Member $x1 lyric))    ;; n 1 docs 1  e.g. tierB-001922

;; ---- slot kick.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kick) (Agent $e0 jamil))    ;; n 1 docs 1  e.g. tierB-001092

;; ---- slot kick.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kick) (Theme $e0 $x1) (Member $x1 ball))    ;; n 1 docs 1  e.g. tierB-001092

;; ---- slot kick_out.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kick_out) (Source $e0 $x1) (Member $x1 surrealist_movement))    ;; n 1 docs 1  e.g. tierB-000438

;; ---- slot kick_out.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kick_out) (Theme $e0 salvador_dali))    ;; n 1 docs 1  e.g. tierB-000438

;; ---- slot kidnap.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kidnap) (Agent $e0 roger))    ;; n 1 docs 1  e.g. tierC-000269

;; ---- slot kill.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kill) (In $e0 action))    ;; n 1 docs 1  e.g. tierB-000067

;; ---- slot kill_time.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kill_time) (Agent $e0 kalman))    ;; n 1 docs 1  e.g. tierB-000504

;; ---- slot kind.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kind) (Experiencer $e0 boris))    ;; n 1 docs 1  e.g. tierB-000496

;; ---- slot kind.Towards  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kind) (Towards $e0 poor))    ;; n 1 docs 1  e.g. tierB-000496

;; ---- slot king.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 king) (Experiencer $e0 augustus))    ;; n 1 docs 1  e.g. tierB-001809

;; ---- slot kit_out.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kit_out) (Instrument $e0 $x1) (Member $x1 jacket))    ;; n 1 docs 1  e.g. tierB-001429

;; ---- slot kit_out.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 kit_out) (Patient $e0 $x1) (Member $x1 camper))    ;; n 1 docs 1  e.g. tierB-001429

;; ---- slot knock.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 knock) (Location $e0 $x1) (Member $x1 window))    ;; n 1 docs 1  e.g. tierB-001899

;; ---- slot know.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 know) (Manner $e0 internationally))    ;; n 1 docs 1  e.g. tierB-001843

;; ---- slot know.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 know) (Theme $e0 <term:Question>))    ;; n 1 docs 1  e.g. tierB-000689

;; ---- slot large.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 large) (Experiencer $e0 kalman))    ;; n 1 docs 1  e.g. tierB-000228

;; ---- slot laugh.At  [event center; head oblique]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 laugh) (At $e0 $x1) (Member $x1 man))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001316
(And (Member $e0 laugh) (At $e0 $x1) (Member $x1 old))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001316

;; ---- slot lax.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 lax) (Experiencer $e0 $x1) (Member $x1 discipline))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000158
(And (Member $e0 lax) (Experiencer $e0 $x1) (Member $x1 lax))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000158

;; ---- slot lay.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lay) (Patient $e0 $x1) (Member $x1 table))    ;; n 1 docs 1  e.g. tierB-001624

;; ---- slot lay.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lay) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-001624

;; ---- slot lay_waste_to.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lay_waste_to) (Agent $e0 $x1) (Member $x1 soldier))    ;; n 1 docs 1  e.g. tierB-001695

;; ---- slot lay_waste_to.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lay_waste_to) (Patient $e0 $x1) (Member $x1 city))    ;; n 1 docs 1  e.g. tierB-001695

;; ---- slot lead.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lead) (Beneficiary $e0 person))    ;; n 1 docs 1  e.g. tierB-000105

;; ---- slot lead.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lead) (Experiencer $e0 $x1) (Member $x1 prophecy))    ;; n 1 docs 1  e.g. tierB-000040

;; ---- slot lead.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lead) (Manner $e0 finally))    ;; n 1 docs 1  e.g. tierB-000040

;; ---- slot lead_to.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 lead_to) (Agent $e0 $e1) (Member $e1 explode))    ;; n 1 docs 1  e.g. tierB-001669

;; ---- slot lead_to.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lead_to) (Theme $e0 $x1) (Member $x1 riot))    ;; n 1 docs 1  e.g. tierB-001669

;; ---- slot leak.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 leak) (Agent $e0 $x1) (Member $x1 oil_filter))    ;; n 1 docs 1  e.g. tierB-000888

;; ---- slot leak.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 leak) (Theme $e0 oil))    ;; n 1 docs 1  e.g. tierB-000888

;; ---- slot leave.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 leave) (Goal $e0 honolulu))    ;; n 1 docs 1  e.g. tierB-000100

;; ---- slot leave.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 leave) (Location $e0 $x1) (Member $x1 workshop))    ;; n 1 docs 1  e.g. tierB-000704

;; ---- slot leave.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 leave) (Source $e0 narita))    ;; n 1 docs 1  e.g. tierB-000298

;; ---- slot leave_a_lot_to_be_desired.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 leave_a_lot_to_be_desired) (Agent $e0 $x1) (Member $x1 report))    ;; n 1 docs 1  e.g. tierB-000306

;; ---- slot leave_behind.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 leave_behind) (Theme $e0 $x1) (Member $x1 girl))    ;; n 1 docs 1  e.g. tierB-000133

;; ---- slot legalize.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 legalize) (Agent $e0 music))    ;; n 1 docs 1  e.g. tierB-000840

;; ---- slot legalize.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 legalize) (Patient $e0 vertical_expression))    ;; n 1 docs 1  e.g. tierB-000840

;; ---- slot let.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 let) (Agent $e0 mom))    ;; n 1 docs 1  e.g. tierB-000410

;; ---- slot let_go.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 let_go) (Agent $e0 $x1) (Member $x1 shopkeeper))    ;; n 1 docs 1  e.g. tierB-000091

;; ---- slot let_go.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 let_go) (For $e0 almost_nothing))    ;; n 1 docs 1  e.g. tierB-000091

;; ---- slot let_go.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 let_go) (Theme $e0 $x1) (Member $x1 cloth))    ;; n 1 docs 1  e.g. tierB-000091

;; ---- slot lick.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lick) (Agent $e0 $x1) (Member $x1 flame))    ;; n 1 docs 1  e.g. tierB-001586

;; ---- slot lick.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lick) (Theme $e0 $x1) (Member $x1 bottom))    ;; n 1 docs 1  e.g. tierB-001586

;; ---- slot life.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 life) (Time $e0 nineties))    ;; n 1 docs 1  e.g. tierB-000284

;; ---- slot light.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 light) (Agent $e0 $x1) (Member $x1 candle))    ;; n 1 docs 1  e.g. tierB-001997

;; ---- slot light.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 light) (Manner $e0 dimly))    ;; n 1 docs 1  e.g. tierB-001642

;; ---- slot like.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 like) (Stimulus $e0 violence))    ;; n 1 docs 1  e.g. tierB-001485

;; ---- slot like.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 like) (Theme $e0 $e1) (Member $e1 play))    ;; n 1 docs 1  e.g. tierB-000160

;; ---- slot line.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 line) (Agent $e0 $x1) (Member $x1 cab))    ;; n 1 docs 1  e.g. tierB-001684

;; ---- slot line.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 line) (Theme $e0 $x1) (Member $x1 entire))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001684
(And (Member $e0 line) (Theme $e0 $x1) (Member $x1 street))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001684

;; ---- slot linger.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 linger) (Experiencer $e0 $x1) (Member $x1 scent))    ;; n 1 docs 1  e.g. tierB-001531

;; ---- slot linger.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 linger) (Location $e0 $x1) (Member $x1 air))    ;; n 1 docs 1  e.g. tierB-001531

;; ---- slot list.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 list) (Theme $e0 $x1) (Member $x1 ingredient))    ;; n 1 docs 1  e.g. tierB-000750

;; ---- slot listen.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 listen) (Agent $e0 william))    ;; n 1 docs 1  e.g. tierB-000137

;; ---- slot lobby.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lobby) (Agent $e0 $x1) (Member $x1 banking_industry))    ;; n 1 docs 1  e.g. tierB-001133

;; ---- slot lobby.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lobby) (For $e0 deregulation))    ;; n 1 docs 1  e.g. tierB-001133

;; ---- slot lock.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lock) (Manner $e0 by_itself))    ;; n 1 docs 1  e.g. tierB-001326

;; ---- slot lock.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 lock) (Patient $e0 $x1) (Member $x1 door))    ;; n 1 docs 1  e.g. tierB-001326

;; ---- slot locked.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 locked) (Experiencer $e0 $x1) (Member $x1 door))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000880
(And (Member $e0 locked) (Experiencer $e0 $x1) (Member $x1 locked))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000880

;; ---- slot locked.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 locked) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-000880

;; ---- slot look.On  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 look) (On $e0 outside))    ;; n 1 docs 1  e.g. tierB-000297

;; ---- slot look.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 look) (Source $e0 $x1) (Member $x1 aeroplane))    ;; n 1 docs 1  e.g. tierB-000230

;; ---- slot look.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 look) (Theme $e0 thing))    ;; n 1 docs 1  e.g. tierB-001985

;; ---- slot look.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 look) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-001135

;; ---- slot look_into.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 look_into) (Theme $e0 $x1) (Member $x1 matter))    ;; n 1 docs 1  e.g. tierB-000574

;; ---- slot look_up.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 look_up) (Agent $e0 james))    ;; n 1 docs 1  e.g. tierB-000539

;; ---- slot maintain.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 maintain) (Agent $e0 $x1) (Member $x1 municipality))    ;; n 1 docs 1  e.g. tierB-001239

;; ---- slot maintain.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 maintain) (Time $e0 today))    ;; n 1 docs 1  e.g. tierB-001864

;; ---- slot make.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 make) (Beneficiary $e0 $x1) (Member $x1 royal_chapel))    ;; n 1 docs 1  e.g. tierB-001696

;; ---- slot make.CoAgent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 make) (CoAgent $e0 amanda))    ;; n 1 docs 1  e.g. tierB-000539

;; ---- slot make.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 make) (Manner $e0 effectively))    ;; n 1 docs 1  e.g. tierB-001809

;; ---- slot make.Of  [event center; head oblique]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 make) (Of $e0 $x1) (Member $x1 glass))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000269
(And (Member $e0 make) (Of $e0 $x1) (Member $x1 real))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000269

;; ---- slot make.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 make) (Theme $e0 progress))    ;; n 1 docs 1  e.g. tierB-000173

;; ---- slot make.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 make) (Time $e0 past))    ;; n 1 docs 1  e.g. tierB-000964

;; ---- slot make_up.Of  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 make_up) (Of $e0 oxygen))    ;; n 1 docs 1  e.g. tierB-000360

;; ---- slot make_up.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 make_up) (Theme $e0 $x1) (Member $x1 atmosphere))    ;; n 1 docs 1  e.g. tierB-000360

;; ---- slot mammoth.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 mammoth) (Theme $e0 $e1) (Member $e1 spot))    ;; n 1 docs 1  e.g. tierB-001257

;; ---- slot march.Agent  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 march) (Agent $e0 $x1) (Member $x1 group))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001357
(And (Member $e0 march) (Agent $e0 $x1) (Member $x1 two_spirit_native_american))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001357

;; ---- slot march.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 march) (Location $e0 $x1) (Member $x1 parade))    ;; n 1 docs 1  e.g. tierB-001357

;; ---- slot marry.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 marry) (Theme $e0 james_of_barrochan))    ;; n 1 docs 1  e.g. tierC-000076

;; ---- slot marry.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 marry) (Time $e0 next_week))    ;; n 1 docs 1  e.g. tierB-000478

;; ---- slot master.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 master) (Theme $e0 $x1) (Member $x1 foreign_language))    ;; n 1 docs 1  e.g. tierB-001980

;; ---- slot materialize.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 materialize) (Patient $e0 $x1) (Member $x1 ghost))    ;; n 1 docs 1  e.g. tierB-001366

;; ---- slot materialize.Source  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 materialize) (Source $e0 $x1) (Member $x1 dark))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001366
(And (Member $e0 materialize) (Source $e0 $x1) (Member $x1 room))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001366

;; ---- slot mature.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mature) (Manner $e0 a_little_bit))    ;; n 1 docs 1  e.g. tierB-001434

;; ---- slot mature.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mature) (Patient $e0 $x1) (Member $x1 strawberry_tree_fruit))    ;; n 1 docs 1  e.g. tierB-001434

;; ---- slot mean.As  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mean) (As $e0 $x1) (Member $x1 joke))    ;; n 1 docs 1  e.g. tierB-001989

;; ---- slot mean.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mean) (Experiencer $e0 word))    ;; n 1 docs 1  e.g. tierB-000759

;; ---- slot mean.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mean) (Manner $e0 really))    ;; n 1 docs 1  e.g. tierB-001149

;; ---- slot mean.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mean) (Stimulus $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000759

;; ---- slot meditate.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 meditate) (Agent $e0 buddha))    ;; n 1 docs 1  e.g. tierB-001377

;; ---- slot meditate.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 meditate) (Location $e0 $x1) (Member $x1 bodhi_tree))    ;; n 1 docs 1  e.g. tierB-001377

;; ---- slot melt.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 melt) (Location $e0 $x1) (Member $x1 water))    ;; n 1 docs 1  e.g. tierB-001451

;; ---- slot melt.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 melt) (Patient $e0 $x1) (Member $x1 ice))    ;; n 1 docs 1  e.g. tierB-001451

;; ---- slot melt_away.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 melt_away) (Patient $e0 $x1) (Member $x1 snow))    ;; n 1 docs 1  e.g. tierB-000154

;; ---- slot mention.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mention) (Location $e0 bible))    ;; n 1 docs 1  e.g. tierB-000483

;; ---- slot mention.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mention) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000483

;; ---- slot merge.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 merge) (Agent $e0 jason_suecof))    ;; n 1 docs 1  e.g. tierC-000104

;; ---- slot merge.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 merge) (Patient $e0 $x1) (Member $x1 album))    ;; n 1 docs 1  e.g. tierC-000104

;; ---- slot metaphor.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 metaphor) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001884

;; ---- slot miracle.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 miracle) (Time $e0 night))    ;; n 1 docs 1  e.g. tierB-000264

;; ---- slot missing.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 missing) (Experiencer $e0 $x1) (Member $x1 fishing_boat))    ;; n 1 docs 1  e.g. tierB-000688

;; ---- slot misunderstand.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 misunderstand) (Experiencer $e0 robert))    ;; n 1 docs 1  e.g. tierB-000865

;; ---- slot misunderstand.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 misunderstand) (Stimulus $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000865

;; ---- slot mix.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mix) (Agent $e0 jason_suecof))    ;; n 1 docs 1  e.g. tierC-000103

;; ---- slot mix.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mix) (Patient $e0 $x1) (Member $x1 album))    ;; n 1 docs 1  e.g. tierC-000103

;; ---- slot modern.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 modern) (Experiencer $e0 $x1) (Member $x1 road))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001966
(And (Member $e0 modern) (Experiencer $e0 $x1) (Member $x1 street))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001966

;; ---- slot modest.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 modest) (Experiencer $e0 $x1) (Member $x1 union))    ;; n 1 docs 1  e.g. tierB-001667

;; ---- slot modest.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 modest) (In $e0 $x1) (Member $x1 wage_demand))    ;; n 1 docs 1  e.g. tierB-001667

;; ---- slot mount.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mount) (Agent $e0 $x1) (Member $x1 rider))    ;; n 1 docs 1  e.g. tierB-000981

;; ---- slot mount.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mount) (Theme $e0 $x1) (Member $x1 horse))    ;; n 1 docs 1  e.g. tierB-000981

;; ---- slot move.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 move) (Manner $e0 gracefully))    ;; n 1 docs 1  e.g. tierB-000782

;; ---- slot move.Through  [event center; head oblique]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 move) (Through $e0 $x1) (Member $x1 clear))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000782
(And (Member $e0 move) (Through $e0 $x1) (Member $x1 water))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000782

;; ---- slot move.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 move) (Time $e0 last_year))    ;; n 1 docs 1  e.g. tierB-001570

;; ---- slot mull_over.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mull_over) (Agent $e0 boldi))    ;; n 1 docs 1  e.g. tierB-000162

;; ---- slot mull_over.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 mull_over) (Theme $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000162

;; ---- slot need.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 need) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-001141

;; ---- slot negotiation.Location  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 negotiation) (Location $e0 $x1) (Member $x1 closed))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001474
(And (Member $e0 negotiation) (Location $e0 $x1) (Member $x1 door))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001474

;; ---- slot nest.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 nest) (Agent $e0 $x1) (Member $x1 stork))    ;; n 1 docs 1  e.g. tierB-000633

;; ---- slot nest.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 nest) (Location $e0 $x1) (Member $x1 roof))    ;; n 1 docs 1  e.g. tierB-000633

;; ---- slot new.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 new) (Experiencer $e0 $x1) (Member $x1 house))    ;; n 1 docs 1  e.g. tierB-001337

;; ---- slot nice.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 nice) (Experiencer $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000960

;; ---- slot nice.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 nice) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-000960

;; ---- slot oblige.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 oblige) (Agent $e0 jessica))    ;; n 1 docs 1  e.g. tierC-000042

;; ---- slot oblige.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 oblige) (Theme $e0 $e1) (Member $e1 sleep))    ;; n 1 docs 1  e.g. tierC-000042

;; ---- slot observe.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 observe) (Manner $e0 frequently))    ;; n 1 docs 1  e.g. tierB-001911

;; ---- slot observe.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 observe) (Stimulus $e0 $e1) (Member $e1 gather))    ;; n 1 docs 1  e.g. tierB-001911

;; ---- slot occur.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 occur) (Agent $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierC-000149

;; ---- slot okay.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 okay) (Theme $e0 person))    ;; n 1 docs 1  e.g. tierB-001679

;; ---- slot old.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 old) (Experiencer $e0 $x1) (Member $x1 house))    ;; n 1 docs 1  e.g. tierB-001337

;; ---- slot ooze.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ooze) (Patient $e0 blood))    ;; n 1 docs 1  e.g. tierB-001287

;; ---- slot ooze.Source  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 ooze) (Source $e0 $x1) (Member $x1 face))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001287
(And (Member $e0 ooze) (Source $e0 $x1) (Member $x1 lacerated))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001287

;; ---- slot open.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 open) (Experiencer $e0 $x1) (Member $x1 door))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000425
(And (Member $e0 open) (Experiencer $e0 $x1) (Member $x1 open))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000425

;; ---- slot open.Goal  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 open) (Goal $e0 $x1) (Member $x1 new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000958
(And (Member $e0 open) (Goal $e0 $x1) (Member $x1 possibility))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000958

;; ---- slot open.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 open) (Time $e0 <term:Hour>))    ;; n 1 docs 1  e.g. tierB-000302

;; ---- slot order.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 order) (Source $e0 new_york))    ;; n 1 docs 1  e.g. tierB-000705

;; ---- slot originate.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 originate) (Location $e0 paris))    ;; n 1 docs 1  e.g. tierB-001272

;; ---- slot originate.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 originate) (Patient $e0 $x1) (Member $x1 costume_style))    ;; n 1 docs 1  e.g. tierB-001272

;; ---- slot out_of_stock.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 out_of_stock) (Experiencer $e0 $x1) (Member $x1 out_of_stock))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001045
(And (Member $e0 out_of_stock) (Experiencer $e0 $x1) (Member $x1 product))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001045

;; ---- slot out_of_the_question.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 out_of_the_question) (Experiencer $e0 $x1) (Member $x1 out_of_the_question))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000842
(And (Member $e0 out_of_the_question) (Experiencer $e0 $x1) (Member $x1 thing))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000842

;; ---- slot outperform.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 outperform) (Agent $e0 quadratic_placement))    ;; n 1 docs 1  e.g. tierC-000193

;; ---- slot outperform.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 outperform) (Theme $e0 combinatorial_solution))    ;; n 1 docs 1  e.g. tierC-000193

;; ---- slot outperform.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 outperform) (Time $e0 later))    ;; n 1 docs 1  e.g. tierC-000193

;; ---- slot outside.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 outside) (Experiencer $e0 lorenzo))    ;; n 1 docs 1  e.g. tierB-001091

;; ---- slot packed.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 packed) (Experiencer $e0 $x1) (Member $x1 packed))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000917
(And (Member $e0 packed) (Experiencer $e0 $x1) (Member $x1 restaurant))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000917

;; ---- slot parallel.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 parallel) (Experiencer $e0 $x1) (Member $x1 lakeside_road))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001906
(And (Member $e0 parallel) (Experiencer $e0 $x1) (Member $x1 parallel))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001906

;; ---- slot park.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 park) (Location $e0 spot))    ;; n 1 docs 1  e.g. tierB-000197

;; ---- slot parking.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 parking) (Beneficiary $e0 customer))    ;; n 1 docs 1  e.g. tierB-000945

;; ---- slot pass.By  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pass) (By $e0 $x1) (Member $x1 diver))    ;; n 1 docs 1  e.g. tierB-001008

;; ---- slot pass.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pass) (Patient $e0 $x1) (Member $x1 hour))    ;; n 1 docs 1  e.g. tierB-001782

;; ---- slot pass.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pass) (Time $e0 today))    ;; n 1 docs 1  e.g. tierB-001762

;; ---- slot pass_by.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pass_by) (Patient $e0 $x1) (Member $x1 summer))    ;; n 1 docs 1  e.g. tierB-000094

;; ---- slot pay.For  [event center; head oblique]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 pay) (For $e0 $x1) (Member $x1 shift))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001603
(And (Member $e0 pay) (For $e0 $x1) (Member $x1 whole))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001603

;; ---- slot pay.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pay) (Recipient $e0 lukas))    ;; n 1 docs 1  e.g. tierB-001603

;; ---- slot pay_off.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pay_off) (Patient $e0 $x1) (Member $x1 tax))    ;; n 1 docs 1  e.g. tierB-001200

;; ---- slot peek.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 peek) (Agent $e0 $x1) (Member $x1 mouse))    ;; n 1 docs 1  e.g. tierB-000693

;; ---- slot peek.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 peek) (Source $e0 $x1) (Member $x1 hole))    ;; n 1 docs 1  e.g. tierB-000693

;; ---- slot penetrate.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 penetrate) (Agent $e0 $x1) (Member $x1 light))    ;; n 1 docs 1  e.g. tierB-000561

;; ---- slot penetrate.Like  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 penetrate) (Like $e0 pillar))    ;; n 1 docs 1  e.g. tierB-000561

;; ---- slot penetrate.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 penetrate) (Theme $e0 $x1) (Member $x1 wave))    ;; n 1 docs 1  e.g. tierB-000561

;; ---- slot photography_walk.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 photography_walk) (Agent $e0 gustavo))    ;; n 1 docs 1  e.g. tierB-000791

;; ---- slot photography_walk.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 photography_walk) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierB-000791

;; ---- slot pick_up.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pick_up) (Patient $e0 $x1) (Member $x1 pace))    ;; n 1 docs 1  e.g. tierB-001072

;; ---- slot place.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 place) (Patient $e0 $x1) (Member $x1 order))    ;; n 1 docs 1  e.g. tierB-001952

;; ---- slot plaster.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 plaster) (Location $e0 $x1) (Member $x1 newspaper))    ;; n 1 docs 1  e.g. tierB-001070

;; ---- slot plaster.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 plaster) (Theme $e0 $x1) (Member $x1 picture))    ;; n 1 docs 1  e.g. tierB-001070

;; ---- slot play.Around  [event center; head oblique]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 play) (Around $e0 $x1) (Member $x1 castle))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001840
(And (Member $e0 play) (Around $e0 $x1) (Member $x1 green))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001840

;; ---- slot play.CoAgent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 play) (CoAgent $e0 $x1) (Member $x1 cat))    ;; n 1 docs 1  e.g. tierB-000160

;; ---- slot play.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 play) (Instrument $e0 lego))    ;; n 1 docs 1  e.g. tierB-001433

;; ---- slot play.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 play) (Manner $e0 well))    ;; n 1 docs 1  e.g. tierB-001766

;; ---- slot play.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 play) (Patient $e0 $x1) (Member $x1 series))    ;; n 1 docs 1  e.g. tierC-000229

;; ---- slot play.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 play) (Time $e0 <term:Weekday>))    ;; n 1 docs 1  e.g. tierB-000939

;; ---- slot plow.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 plow) (Manner $e0 quickly))    ;; n 1 docs 1  e.g. tierB-001501

;; ---- slot plummet.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 plummet) (Manner $e0 quickly))    ;; n 1 docs 1  e.g. tierB-000005

;; ---- slot plummet.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 plummet) (Patient $e0 $x1) (Member $x1 berber_speaking))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000005
(And (Member $e0 plummet) (Patient $e0 $x1) (Member $x1 population))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000005

;; ---- slot plummet.With  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 plummet) (With $e0 $e1) (Member $e1 arrival))    ;; n 1 docs 1  e.g. tierB-000005

;; ---- slot point.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 point) (Agent $e0 gunter))    ;; n 1 docs 1  e.g. tierB-000882

;; ---- slot point.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 point) (Goal $e0 $x1) (Member $x1 house))    ;; n 1 docs 1  e.g. tierB-000882

;; ---- slot point_out.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 point_out) (Theme $e0 $x1) (Member $x1 difference))    ;; n 1 docs 1  e.g. tierB-001455

;; ---- slot polish.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 polish) (Patient $e0 metal))    ;; n 1 docs 1  e.g. tierB-000938

;; ---- slot pollute.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pollute) (Agent $e0 $x1) (Member $x1 factory))    ;; n 1 docs 1  e.g. tierB-001151

;; ---- slot pollute.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pollute) (Patient $e0 $x1) (Member $x1 environment))    ;; n 1 docs 1  e.g. tierB-001151

;; ---- slot pop.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pop) (Agent $e0 $x1) (Member $x1 campfire))    ;; n 1 docs 1  e.g. tierB-001023

;; ---- slot portrayal.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 portrayal) (Agent $e0 james_woods))    ;; n 1 docs 1  e.g. tierC-000302

;; ---- slot portrayal.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 portrayal) (Theme $e0 wilson))    ;; n 1 docs 1  e.g. tierC-000302

;; ---- slot pose.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pose) (Agent $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001661

;; ---- slot pose.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pose) (Theme $e0 $x1) (Member $x1 ethical_dilemma))    ;; n 1 docs 1  e.g. tierB-001661

;; ---- slot positive.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 positive) (For $e0 diacetylmorphine))    ;; n 1 docs 1  e.g. tierB-001948

;; ---- slot possess.Holder  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 possess) (Holder $e0 marco))    ;; n 1 docs 1  e.g. tierB-000510

;; ---- slot possess.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 possess) (Theme $e0 $x1) (Member $x1 stamp_collection))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000510
(And (Member $e0 possess) (Theme $e0 $x1) (Member $x1 valuable))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000510

;; ---- slot post.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 post) (Location $e0 $x1) (Member $x1 city))    ;; n 1 docs 1  e.g. tierC-000069

;; ---- slot post.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 post) (Theme $e0 $x1) (Member $x1 reduced))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000069
(And (Member $e0 post) (Theme $e0 $x1) (Member $x1 speed_limit))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000069

;; ---- slot postpone.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 postpone) (Patient $e0 $x1) (Member $x1 party))    ;; n 1 docs 1  e.g. tierB-001381

;; ---- slot powerful.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 powerful) (Experiencer $e0 iran))    ;; n 1 docs 1  e.g. tierB-000206

;; ---- slot practice.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 practice) (Agent $e0 $x1) (Member $x1 team))    ;; n 1 docs 1  e.g. tierB-001720

;; ---- slot practice.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 practice) (Manner $e0 harder))    ;; n 1 docs 1  e.g. tierB-001720

;; ---- slot pray.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pray) (Patient $e0 $x1) (Member $x1 prayer))    ;; n 1 docs 1  e.g. tierC-000283

;; ---- slot preach.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 preach) (Theme $e0 gareccio))    ;; n 1 docs 1  e.g. tierC-000047

;; ---- slot prefer.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 prefer) (Experiencer $e0 $x1) (Member $x1 spider))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000734
(And (Member $e0 prefer) (Experiencer $e0 $x1) (Member $x1 vegetarian))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000734

;; ---- slot prefer.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 prefer) (Stimulus $e0 $x1) (Member $x1 nectar))    ;; n 1 docs 1  e.g. tierB-000734

;; ---- slot prepare.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 prepare) (Agent $e0 $x1) (Member $x1 soldier))    ;; n 1 docs 1  e.g. tierB-000274

;; ---- slot prepare.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 prepare) (For $e0 battle))    ;; n 1 docs 1  e.g. tierB-000274

;; ---- slot present.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 present) (Experiencer $e0 wagner_group))    ;; n 1 docs 1  e.g. tierB-001683

;; ---- slot present.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 present) (Location $e0 africa))    ;; n 1 docs 1  e.g. tierB-001683

;; ---- slot present.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 present) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-001486

;; ---- slot press.On  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 press) (On $e0 $x1) (Member $x1 button))    ;; n 1 docs 1  e.g. tierB-000201

;; ---- slot press.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 press) (Theme $e0 $f1))    ;; n 1 docs 1  e.g. tierB-001494

;; ---- slot proclaim.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 proclaim) (Agent $e0 xavier))    ;; n 1 docs 1  e.g. tierB-001533

;; ---- slot proclaim.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 proclaim) (Theme $e0 $x1) (Member $x1 stance))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001533
(And (Member $e0 proclaim) (Theme $e0 $x1) (Member $x1 syncretic))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001533

;; ---- slot program.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 program) (Agent $e0 programmer))    ;; n 1 docs 1  e.g. tierB-000109

;; ---- slot program.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 program) (Patient $e0 $x1) (Member $x1 program))    ;; n 1 docs 1  e.g. tierB-000109

;; ---- slot promise.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 promise) (Agent $e0 tebboune))    ;; n 1 docs 1  e.g. tierB-000663

;; ---- slot promise.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 promise) (Theme $e0 $x1) (Member $x1 change))    ;; n 1 docs 1  e.g. tierB-000663

;; ---- slot protect.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 protect) (Theme $e0 $x1) (Member $x1 head))    ;; n 1 docs 1  e.g. tierB-001396

;; ---- slot provide.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 provide) (For $e0 $x1) (Member $x1 cook))    ;; n 1 docs 1  e.g. tierB-001663

;; ---- slot provide.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 provide) (In $e0 $x1) (Member $x1 society))    ;; n 1 docs 1  e.g. tierB-001482

;; ---- slot pull.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pull) (Goal $e0 $x1) (Member $x1 river))    ;; n 1 docs 1  e.g. tierB-000470

;; ---- slot pull.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pull) (Source $e0 $x1) (Member $x1 room))    ;; n 1 docs 1  e.g. tierB-001386

;; ---- slot pull_over.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pull_over) (Theme $e0 $x1) (Member $x1 speeder))    ;; n 1 docs 1  e.g. tierB-001526

;; ---- slot pulse.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pulse) (Agent $e0 $x1) (Member $x1 loudspeaker))    ;; n 1 docs 1  e.g. tierB-000193

;; ---- slot pulse.With  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pulse) (With $e0 $x1) (Member $x1 noise))    ;; n 1 docs 1  e.g. tierB-000193

;; ---- slot purchase.Against  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 purchase) (Against $e0 law))    ;; n 1 docs 1  e.g. tierB-000015

;; ---- slot purchase.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 purchase) (Theme $e0 pirated_copy))    ;; n 1 docs 1  e.g. tierB-000015

;; ---- slot purpose.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 purpose) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001740

;; ---- slot push_around.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 push_around) (Agent $e0 $x1) (Member $x1 breeze))    ;; n 1 docs 1  e.g. tierB-001961

;; ---- slot push_around.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 push_around) (Theme $e0 $x1) (Member $x1 foliage))    ;; n 1 docs 1  e.g. tierB-001961

;; ---- slot put.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 put) (Agent $e0 antonio))    ;; n 1 docs 1  e.g. tierB-001037

;; ---- slot put.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 put) (Goal $e0 $x1) (Member $x1 well))    ;; n 1 docs 1  e.g. tierB-001037

;; ---- slot put.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 put) (Theme $e0 $x1) (Member $x1 poison))    ;; n 1 docs 1  e.g. tierB-001037

;; ---- slot put_a_stop_to.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 put_a_stop_to) (Agent $e0 felix))    ;; n 1 docs 1  e.g. tierB-000389

;; ---- slot put_a_stop_to.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 put_a_stop_to) (Manner $e0 definitely))    ;; n 1 docs 1  e.g. tierB-000389

;; ---- slot put_a_stop_to.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 put_a_stop_to) (Patient $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000389

;; ---- slot put_a_stop_to.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 put_a_stop_to) (Time $e0 right_away))    ;; n 1 docs 1  e.g. tierB-000389

;; ---- slot put_down.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 put_down) (Patient $e0 $x1) (Member $x1 riot))    ;; n 1 docs 1  e.g. tierB-000323

;; ---- slot put_off.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 put_off) (Patient $e0 $e1) (Member $e1 game))    ;; n 1 docs 1  e.g. tierB-000259

;; ---- slot put_together.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 put_together) (Patient $e0 word))    ;; n 1 docs 1  e.g. tierB-000759

;; ---- slot put_up.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 put_up) (Agent $e0 $x1) (Member $x1 company))    ;; n 1 docs 1  e.g. tierB-000762

;; ---- slot put_up.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 put_up) (Patient $e0 $x1) (Member $x1 web_page))    ;; n 1 docs 1  e.g. tierB-000762

;; ---- slot question.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 question) (Agent $e0 prigozhin))    ;; n 1 docs 1  e.g. tierB-001621

;; ---- slot question.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 question) (Theme $e0 $e1) (Member $e1 war))    ;; n 1 docs 1  e.g. tierB-001621

;; ---- slot raise_the_dead.Agent  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 raise_the_dead) (Agent $e0 $x1) (Member $x1 coffee))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000156
(And (Member $e0 raise_the_dead) (Agent $e0 $x1) (Member $x1 strong))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000156

;; ---- slot reach.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 reach) (Patient $e0 $x1) (Member $x1 verdict))    ;; n 1 docs 1  e.g. tierB-001082

;; ---- slot reach.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 reach) (Source $e0 here))    ;; n 1 docs 1  e.g. tierB-001488

;; ---- slot ready.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ready) (Time $e0 soon))    ;; n 1 docs 1  e.g. tierB-000168

;; ---- slot rebel.Against  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rebel) (Against $e0 $x1) (Member $x1 king))    ;; n 1 docs 1  e.g. tierB-000248

;; ---- slot rebel.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rebel) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000248

;; ---- slot recall.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 recall) (Agent $e0 $x1) (Member $x1 company))    ;; n 1 docs 1  e.g. tierB-000853

;; ---- slot recall.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 recall) (Theme $e0 $x1) (Member $x1 product))    ;; n 1 docs 1  e.g. tierB-000853

;; ---- slot receive.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 receive) (For $e0 $e1) (Member $e1 dance))    ;; n 1 docs 1  e.g. tierB-000962

;; ---- slot receive.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 receive) (Location $e0 $x1) (Member $x1 winter_festival))    ;; n 1 docs 1  e.g. tierB-000962

;; ---- slot receive.Source  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 receive) (Source $e0 $x1) (Member $x1 car_dealer))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001693
(And (Member $e0 receive) (Source $e0 $x1) (Member $x1 local))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001693

;; ---- slot reclassify.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 reclassify) (Patient $e0 pluto))    ;; n 1 docs 1  e.g. tierB-001866

;; ---- slot recognize.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 recognize) (Theme $e0 $x1) (Member $x1 cultural_heritage))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001864
(And (Member $e0 recognize) (Theme $e0 $x1) (Member $x1 settlement))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001864

;; ---- slot recognize.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 recognize) (Time $e0 today))    ;; n 1 docs 1  e.g. tierB-001864

;; ---- slot rectify.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rectify) (Agent $e0 decolonization_effort))    ;; n 1 docs 1  e.g. tierB-001912

;; ---- slot rectify.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rectify) (Patient $e0 historical_injustice))    ;; n 1 docs 1  e.g. tierB-001912

;; ---- slot redeem.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 redeem) (Agent $e0 michael))    ;; n 1 docs 1  e.g. tierB-000252

;; ---- slot redeem.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 redeem) (Patient $e0 michael))    ;; n 1 docs 1  e.g. tierB-000252

;; ---- slot refer.As  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 refer) (As $e0 pedo_transfer_function))    ;; n 1 docs 1  e.g. tierC-000205

;; ---- slot refer.In  [event center; head oblique]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 refer) (In $e0 $x1) (Member $x1 context))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000205
(And (Member $e0 refer) (In $e0 $x1) (Member $x1 non_spatial))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000205

;; ---- slot refer.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 refer) (Theme $e0 $x1) (Member $x1 predictive_function))    ;; n 1 docs 1  e.g. tierC-000205

;; ---- slot refuse.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 refuse) (Agent $e0 yitzhak))    ;; n 1 docs 1  e.g. tierB-000910

;; ---- slot refuse.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 refuse) (Theme $e0 $e1) (Member $e1 serve))    ;; n 1 docs 1  e.g. tierB-000910

;; ---- slot relate.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 relate) (Experiencer $e0 $x1) (Member $x1 activity))    ;; n 1 docs 1  e.g. tierC-000040

;; ---- slot relax.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 relax) (Agent $e0 adriano))    ;; n 1 docs 1  e.g. tierB-001767

;; ---- slot relax.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 relax) (Time $e0 last_half_hour))    ;; n 1 docs 1  e.g. tierB-001767

;; ---- slot remain.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 remain) (Location $e0 japan))    ;; n 1 docs 1  e.g. tierC-000121

;; ---- slot remove.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 remove) (Source $e0 office))    ;; n 1 docs 1  e.g. tierB-000366

;; ---- slot remove.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 remove) (Theme $e0 brett_kavanaugh))    ;; n 1 docs 1  e.g. tierB-000366

;; ---- slot rent.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rent) (Agent $e0 bruno))    ;; n 1 docs 1  e.g. tierB-000571

;; ---- slot rent.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rent) (Theme $e0 $x1) (Member $x1 beach_house))    ;; n 1 docs 1  e.g. tierB-000571

;; ---- slot rent.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rent) (Time $e0 weekend))    ;; n 1 docs 1  e.g. tierB-000571

;; ---- slot repair.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 repair) (Manner $e0 fully))    ;; n 1 docs 1  e.g. tierB-001134

;; ---- slot repair.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 repair) (Patient $e0 $x1) (Member $x1 system))    ;; n 1 docs 1  e.g. tierB-001134

;; ---- slot repeat.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 repeat) (Agent $e0 dan))    ;; n 1 docs 1  e.g. tierB-000147

;; ---- slot request.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 request) (Theme $e0 $x1) (Member $x1 american_assistance))    ;; n 1 docs 1  e.g. tierB-000969

;; ---- slot rescue.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rescue) (Patient $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000196

;; ---- slot reside.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 reside) (Agent $e0 $x1) (Member $x1 refugee))    ;; n 1 docs 1  e.g. tierB-001035

;; ---- slot reside.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 reside) (Location $e0 gabon))    ;; n 1 docs 1  e.g. tierB-001035

;; ---- slot rest.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rest) (Experiencer $e0 $x1) (Member $x1 sociologist))    ;; n 1 docs 1  e.g. tierB-000963

;; ---- slot rest.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rest) (Location $e0 $x1) (Member $x1 palm_tree))    ;; n 1 docs 1  e.g. tierB-000963

;; ---- slot restrict.Agent  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 restrict) (Agent $e0 $x1) (Member $x1 law))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000288
(And (Member $e0 restrict) (Agent $e0 $x1) (Member $x1 new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000288

;; ---- slot restrict.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 restrict) (Theme $e0 $e1) (Member $e1 sale))    ;; n 1 docs 1  e.g. tierB-000288

;; ---- slot result.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 result) (Agent $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001994

;; ---- slot result.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 result) (Experiencer $e0 sickness))    ;; n 1 docs 1  e.g. tierB-000407

;; ---- slot result.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 result) (In $e0 nothing))    ;; n 1 docs 1  e.g. tierB-001994

;; ---- slot result.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 result) (Manner $e0 often))    ;; n 1 docs 1  e.g. tierB-000407

;; ---- slot result.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 result) (Source $e0 $x1) (Member $x1 eat))    ;; n 1 docs 1  e.g. tierB-000407

;; ---- slot return.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 return) (Manner $e0 safely))    ;; n 1 docs 1  e.g. tierB-000688

;; ---- slot revamp.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 revamp) (Patient $e0 $x1) (Member $x1 road))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001966
(And (Member $e0 revamp) (Patient $e0 $x1) (Member $x1 street))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001966

;; ---- slot reveal.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 reveal) (Agent $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001881

;; ---- slot reveal.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 reveal) (Experiencer $e0 $x1) (Member $x1 recent))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001359
(And (Member $e0 reveal) (Experiencer $e0 $x1) (Member $x1 survey))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001359

;; ---- slot rewrite.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rewrite) (Manner $e0 completely))    ;; n 1 docs 1  e.g. tierB-001622

;; ---- slot rewrite.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rewrite) (Patient $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001622

;; ---- slot ricochet.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ricochet) (Patient $e0 $x1) (Member $x1 ball))    ;; n 1 docs 1  e.g. tierB-000103

;; ---- slot ricochet.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ricochet) (Source $e0 $x1) (Member $x1 bat))    ;; n 1 docs 1  e.g. tierB-000103

;; ---- slot ride.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ride) (Agent $e0 $x1) (Member $x1 cowboy))    ;; n 1 docs 1  e.g. tierB-001543

;; ---- slot ride.Goal  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 ride) (Goal $e0 $x1) (Member $x1 town))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001543
(And (Member $e0 ride) (Goal $e0 $x1) (Member $x1 unknown))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001543

;; ---- slot ring.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ring) (Agent $e0 mary))    ;; n 1 docs 1  e.g. tierB-000002

;; ---- slot rip.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rip) (Patient $e0 $x1) (Member $x1 sound))    ;; n 1 docs 1  e.g. tierB-001894

;; ---- slot rip.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rip) (Time $e0 night))    ;; n 1 docs 1  e.g. tierB-001894

;; ---- slot roast.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 roast) (Agent $e0 dad))    ;; n 1 docs 1  e.g. tierB-001304

;; ---- slot roast.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 roast) (Manner $e0 well))    ;; n 1 docs 1  e.g. tierB-000921

;; ---- slot rob.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rob) (Patient $e0 $x1) (Member $x1 bank))    ;; n 1 docs 1  e.g. tierB-001917

;; ---- slot rob.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rob) (Time $e0 yesterday))    ;; n 1 docs 1  e.g. tierB-001917

;; ---- slot roll.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 roll) (Agent $e0 $x1) (Member $x1 cook))    ;; n 1 docs 1  e.g. tierB-000942

;; ---- slot roll.Instrument  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 roll) (Instrument $e0 $x1) (Member $x1 crash))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001228
(And (Member $e0 roll) (Instrument $e0 $x1) (Member $x1 menacing))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001228

;; ---- slot roll.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 roll) (Location $e0 $x1) (Member $x1 peel))    ;; n 1 docs 1  e.g. tierB-000942

;; ---- slot roll_over.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 roll_over) (Agent $e0 $x1) (Member $x1 dog))    ;; n 1 docs 1  e.g. tierB-001892

;; ---- slot roll_over.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 roll_over) (Location $e0 $x1) (Member $x1 ground))    ;; n 1 docs 1  e.g. tierB-001892

;; ---- slot rough.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rough) (Experiencer $e0 $x1) (Member $x1 sea))    ;; n 1 docs 1  e.g. tierB-000134

;; ---- slot round.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 round) (Agent $e0 $x1) (Member $x1 runner))    ;; n 1 docs 1  e.g. tierB-001860

;; ---- slot round.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 round) (Goal $e0 $x1) (Member $x1 homestretch))    ;; n 1 docs 1  e.g. tierB-001860

;; ---- slot round.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 round) (Theme $e0 $x1) (Member $x1 corner))    ;; n 1 docs 1  e.g. tierB-001860

;; ---- slot rule.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rule) (Time $e0 that_time))    ;; n 1 docs 1  e.g. tierB-000311

;; ---- slot rumor.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rumor) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001547

;; ---- slot run.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 run) (Theme $e0 $x1) (Member $x1 test))    ;; n 1 docs 1  e.g. tierB-000339

;; ---- slot run.Through  [event center; head oblique]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 run) (Through $e0 $x1) (Member $x1 field))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001153
(And (Member $e0 run) (Through $e0 $x1) (Member $x1 open))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001153

;; ---- slot run_around.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 run_around) (Agent $e0 ziri))    ;; n 1 docs 1  e.g. tierB-000001

;; ---- slot run_around.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 run_around) (Manner $e0 constantly))    ;; n 1 docs 1  e.g. tierB-000001

;; ---- slot run_away.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 run_away) (Agent $e0 ivan))    ;; n 1 docs 1  e.g. tierB-000406

;; ---- slot run_out.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 run_out) (Agent $e0 $x1) (Member $x1 student))    ;; n 1 docs 1  e.g. tierB-000656

;; ---- slot run_out.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 run_out) (Manner $e0 quickly))    ;; n 1 docs 1  e.g. tierB-001446

;; ---- slot run_out.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 run_out) (Patient $e0 $x1) (Member $x1 dog_feed))    ;; n 1 docs 1  e.g. tierB-001446

;; ---- slot run_out.Through  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 run_out) (Through $e0 $x1) (Member $x1 door))    ;; n 1 docs 1  e.g. tierB-000656

;; ---- slot rush.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rush) (Agent $e0 martino))    ;; n 1 docs 1  e.g. tierB-000588

;; ---- slot rush.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rush) (Goal $e0 $x1) (Member $x1 emergency_room))    ;; n 1 docs 1  e.g. tierB-000588

;; ---- slot sacrifice.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sacrifice) (Patient $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001761

;; ---- slot sad.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sad) (Experiencer $e0 alberto))    ;; n 1 docs 1  e.g. tierB-000542

;; ---- slot sad.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sad) (Time $e0 always))    ;; n 1 docs 1  e.g. tierB-000542

;; ---- slot sail.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sail) (Agent $e0 benedito))    ;; n 1 docs 1  e.g. tierB-000618

;; ---- slot sail.Location  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 sail) (Location $e0 $x1) (Member $x1 calm))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000618
(And (Member $e0 sail) (Location $e0 $x1) (Member $x1 water))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000618

;; ---- slot sale.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sale) (Recipient $e0 minor))    ;; n 1 docs 1  e.g. tierB-000288

;; ---- slot sale.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sale) (Theme $e0 cigarette))    ;; n 1 docs 1  e.g. tierB-000288

;; ---- slot save.Agent  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 save) (Agent $e0 $x1) (Member $x1 boy))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001285
(And (Member $e0 save) (Agent $e0 $x1) (Member $x1 tall))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001285

;; ---- slot save.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 save) (Patient $e0 $x1) (Member $x1 child))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001285
(And (Member $e0 save) (Patient $e0 $x1) (Member $x1 drowning))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001285

;; ---- slot say.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 say) (Location $e0 $x1) (Member $x1 cemetery_chapel))    ;; n 1 docs 1  e.g. tierB-001626

;; ---- slot scanty.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 scanty) (Experiencer $e0 $x1) (Member $x1 rice_crop))    ;; n 1 docs 1  e.g. tierB-001387

;; ---- slot scanty.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 scanty) (Time $e0 this_year))    ;; n 1 docs 1  e.g. tierB-001387

;; ---- slot scare.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 scare) (Agent $e0 $x1) (Member $x1 thunder))    ;; n 1 docs 1  e.g. tierB-000634

;; ---- slot scare.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 scare) (Patient $e0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierB-000634

;; ---- slot schedule.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 schedule) (Patient $e0 $e1) (Member $e1 broadcast))    ;; n 1 docs 1  e.g. tierB-000903

;; ---- slot scorch.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 scorch) (Agent $e0 direct_sun))    ;; n 1 docs 1  e.g. tierB-001246

;; ---- slot scorch.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 scorch) (Patient $e0 $x1) (Member $x1 leaf))    ;; n 1 docs 1  e.g. tierB-001246

;; ---- slot screw.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 screw) (Goal $e0 $x1) (Member $x1 jar))    ;; n 1 docs 1  e.g. tierB-000135

;; ---- slot screw.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 screw) (Patient $e0 $x1) (Member $x1 lid))    ;; n 1 docs 1  e.g. tierB-000135

;; ---- slot search.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 search) (Agent $e0 bill))    ;; n 1 docs 1  e.g. tierB-000441

;; ---- slot search.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 search) (Theme $e0 $x1) (Member $x1 entire))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000441
(And (Member $e0 search) (Theme $e0 $x1) (Member $x1 house))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000441

;; ---- slot see.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 see) (Experiencer $e0 donald))    ;; n 1 docs 1  e.g. tierB-000115

;; ---- slot see.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 see) (Location $e0 $x1) (Member $x1 northern_hemisphere))    ;; n 1 docs 1  e.g. tierB-000980

;; ---- slot see.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 see) (Time $e0 tonight))    ;; n 1 docs 1  e.g. tierB-000686

;; ---- slot seek.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 seek) (Manner $e0 eagerly))    ;; n 1 docs 1  e.g. tierB-001953

;; ---- slot seek.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 seek) (Theme $e0 $e1) (Member $e1 admission))    ;; n 1 docs 1  e.g. tierB-001953

;; ---- slot select.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 select) (Beneficiary $e0 morel))    ;; n 1 docs 1  e.g. tierC-000303

;; ---- slot sell.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sell) (In $e0 glass_bottle))    ;; n 1 docs 1  e.g. tierB-000326

;; ---- slot sell.Like  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sell) (Like $e0 hot_cake))    ;; n 1 docs 1  e.g. tierB-001168

;; ---- slot sell.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sell) (Location $e0 australia))    ;; n 1 docs 1  e.g. tierB-001956

;; ---- slot sell.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sell) (Manner $e0 well))    ;; n 1 docs 1  e.g. tierB-001956

;; ---- slot send.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 send) (Agent $e0 $x1) (Member $x1 ear_canal))    ;; n 1 docs 1  e.g. tierB-000715

;; ---- slot send.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 send) (Manner $e0 immediately))    ;; n 1 docs 1  e.g. tierB-000666

;; ---- slot send.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 send) (Recipient $e0 $x1) (Member $x1 eardrum))    ;; n 1 docs 1  e.g. tierB-000715

;; ---- slot sentence.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sentence) (Goal $e0 death))    ;; n 1 docs 1  e.g. tierB-000427

;; ---- slot sentence.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sentence) (Theme $e0 jonathan))    ;; n 1 docs 1  e.g. tierB-000427

;; ---- slot serve.As  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 serve) (As $e0 $x1) (Member $x1 president))    ;; n 1 docs 1  e.g. tierC-000054

;; ---- slot serve.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 serve) (Location $e0 idf))    ;; n 1 docs 1  e.g. tierB-000910

;; ---- slot serve.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 serve) (Manner $e0 best))    ;; n 1 docs 1  e.g. tierB-000915

;; ---- slot serve.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 serve) (Recipient $e0 martha))    ;; n 1 docs 1  e.g. tierB-000940

;; ---- slot set.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 set) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001976

;; ---- slot set_fire_to.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 set_fire_to) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001887

;; ---- slot set_fire_to.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 set_fire_to) (Patient $e0 $x1) (Member $x1 house))    ;; n 1 docs 1  e.g. tierB-001887

;; ---- slot set_sail.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 set_sail) (Agent $e0 $x1) (Member $x1 ship))    ;; n 1 docs 1  e.g. tierB-000605

;; ---- slot set_sail.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 set_sail) (For $e0 bombay))    ;; n 1 docs 1  e.g. tierB-000605

;; ---- slot set_up.Agent  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 set_up) (Agent $e0 $x1) (Member $x1 man))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001870
(And (Member $e0 set_up) (Agent $e0 $x1) (Member $x1 young))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001870

;; ---- slot set_up.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 set_up) (Patient $e0 $x1) (Member $x1 bowling_pin))    ;; n 1 docs 1  e.g. tierB-001870

;; ---- slot settle.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 settle) (Agent $e0 $x1) (Member $x1 butterfly))    ;; n 1 docs 1  e.g. tierB-000977

;; ---- slot settle.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 settle) (Location $e0 $x1) (Member $x1 flower))    ;; n 1 docs 1  e.g. tierB-000977

;; ---- slot share.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 share) (Theme $e0 $x1) (Member $x1 border))    ;; n 1 docs 1  e.g. tierB-000696

;; ---- slot shed_light.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 shed_light) (Agent $e0 $e1) (Member $e1 investigation))    ;; n 1 docs 1  e.g. tierB-001589

;; ---- slot shed_light.On  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 shed_light) (On $e0 $x1) (Member $x1 search))    ;; n 1 docs 1  e.g. tierB-001589

;; ---- slot shine.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 shine) (Agent $e0 $x1) (Member $x1 sun))    ;; n 1 docs 1  e.g. tierB-001933

;; ---- slot shine.Like  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 shine) (Like $e0 gold))    ;; n 1 docs 1  e.g. tierB-001218

;; ---- slot shine.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 shine) (Location $e0 $x1) (Member $x1 cloud))    ;; n 1 docs 1  e.g. tierB-001933

;; ---- slot shop.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 shop) (Agent $e0 $x1) (Member $x1 mother))    ;; n 1 docs 1  e.g. tierB-000720

;; ---- slot short.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 short) (Experiencer $e0 $x1) (Member $x1 day))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001658
(And (Member $e0 short) (Experiencer $e0 $x1) (Member $x1 short))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001658

;; ---- slot shortening.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 shortening) (Experiencer $e0 iga))    ;; n 1 docs 1  e.g. tierB-001314

;; ---- slot show.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 show) (Patient $e0 milky_way))    ;; n 1 docs 1  e.g. tierB-000465

;; ---- slot show_up.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 show_up) (Goal $e0 $x1) (Member $x1 party))    ;; n 1 docs 1  e.g. tierB-001152

;; ---- slot show_up.Without  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 show_up) (Without $e0 $x1) (Member $x1 invitation))    ;; n 1 docs 1  e.g. tierB-001152

;; ---- slot shut.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 shut) (Patient $e0 $x1) (Member $x1 bank))    ;; n 1 docs 1  e.g. tierB-000302

;; ---- slot shut.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 shut) (Time $e0 <term:Hour>))    ;; n 1 docs 1  e.g. tierB-000302

;; ---- slot sight_read.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 sight_read) (Theme $e0 $x1) (Member $x1 difficult))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001847
(And (Member $e0 sight_read) (Theme $e0 $x1) (Member $x1 sheet_music))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001847

;; ---- slot sign.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sign) (Agent $e0 $x1) (Member $x1 author))    ;; n 1 docs 1  e.g. tierB-000170

;; ---- slot sign.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sign) (Patient $e0 $x1) (Member $x1 limited_edition))    ;; n 1 docs 1  e.g. tierB-000170

;; ---- slot silence.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 silence) (Agent $e0 $x1) (Member $x1 government))    ;; n 1 docs 1  e.g. tierB-001885

;; ---- slot silence.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 silence) (Patient $e0 $x1) (Member $x1 opposition))    ;; n 1 docs 1  e.g. tierB-001885

;; ---- slot silent.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 silent) (Experiencer $e0 $x1) (Member $x1 forest))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000609
(And (Member $e0 silent) (Experiencer $e0 $x1) (Member $x1 silent))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000609

;; ---- slot sing.Location  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 sing) (Location $e0 $x1) (Member $x1 early))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001901
(And (Member $e0 sing) (Location $e0 $x1) (Member $x1 morning_light))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001901

;; ---- slot sink.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sink) (Agent $e0 hezbollah))    ;; n 1 docs 1  e.g. tierB-000581

;; ---- slot sink.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sink) (Patient $e0 $x1) (Member $x1 israeli_military_ship))    ;; n 1 docs 1  e.g. tierB-000581

;; ---- slot sit.Around  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sit) (Around $e0 $x1) (Member $x1 fire))    ;; n 1 docs 1  e.g. tierB-000922

;; ---- slot sit.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sit) (Location $e0 $x1) (Member $x1 fence))    ;; n 1 docs 1  e.g. tierB-001685

;; ---- slot sit_down.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sit_down) (Agent $e0 $x1) (Member $x1 boy))    ;; n 1 docs 1  e.g. tierB-000305

;; ---- slot sit_down.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sit_down) (Location $e0 $x1) (Member $x1 bench))    ;; n 1 docs 1  e.g. tierB-000305

;; ---- slot smell.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 smell) (Agent $e0 $x1) (Member $x1 fox))    ;; n 1 docs 1  e.g. tierB-000423

;; ---- slot smell.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 smell) (Experiencer $e0 $x1) (Member $x1 place))    ;; n 1 docs 1  e.g. tierB-001517

;; ---- slot smell.Like  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 smell) (Like $e0 $x1) (Member $x1 locker_room))    ;; n 1 docs 1  e.g. tierB-001517

;; ---- slot smell.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 smell) (Theme $e0 $x1) (Member $x1 lair))    ;; n 1 docs 1  e.g. tierB-000423

;; ---- slot smile.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 smile) (Agent $e0 igor))    ;; n 1 docs 1  e.g. tierB-000210

;; ---- slot smile.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 smile) (Manner $e0 as_always))    ;; n 1 docs 1  e.g. tierB-000210

;; ---- slot smoke.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 smoke) (Agent $e0 bob))    ;; n 1 docs 1  e.g. tierB-000947

;; ---- slot soar.Across  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 soar) (Across $e0 $x1) (Member $x1 sky))    ;; n 1 docs 1  e.g. tierB-001333

;; ---- slot soar.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 soar) (Agent $e0 $x1) (Member $x1 crow))    ;; n 1 docs 1  e.g. tierB-001333

;; ---- slot soar.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 soar) (Manner $e0 gracefully))    ;; n 1 docs 1  e.g. tierB-001333

;; ---- slot soluble.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 soluble) (Experiencer $e0 $x1) (Member $x1 powder))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000887
(And (Member $e0 soluble) (Experiencer $e0 $x1) (Member $x1 soluble))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000887

;; ---- slot soluble.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 soluble) (In $e0 water))    ;; n 1 docs 1  e.g. tierB-000887

;; ---- slot solve.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 solve) (Agent $e0 algorithm))    ;; n 1 docs 1  e.g. tierB-001202

;; ---- slot solve.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 solve) (Instrument $e0 $x1))    ;; n 1 docs 1  e.g. tierB-000935

;; ---- slot solve.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 solve) (Manner $e0 step_by_step))    ;; n 1 docs 1  e.g. tierB-001202

;; ---- slot sorry.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 sorry) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001258
(And (Member $e0 sorry) (Experiencer $e0 $x1) (Member $x1 sorry))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001258

;; ---- slot sorry.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sorry) (For $e0 $x1) (Member $x1 word))    ;; n 1 docs 1  e.g. tierB-001258

;; ---- slot sow.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sow) (Agent $e0 $x1) (Member $x1 farmer))    ;; n 1 docs 1  e.g. tierB-001689

;; ---- slot sow.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sow) (Theme $e0 barley))    ;; n 1 docs 1  e.g. tierB-001689

;; ---- slot speak.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 speak) (Manner $e0 poorly))    ;; n 1 docs 1  e.g. tierB-000053

;; ---- slot speak_out.Against  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 speak_out) (Against $e0 terrorist_activity))    ;; n 1 docs 1  e.g. tierB-001972

;; ---- slot speak_out.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 speak_out) (Agent $e0 $x1) (Member $x1 muslim_community))    ;; n 1 docs 1  e.g. tierB-001972

;; ---- slot spell_out.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spell_out) (Agent $e0 $x1) (Member $x1 document))    ;; n 1 docs 1  e.g. tierB-000555

;; ---- slot spell_out.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spell_out) (Manner $e0 clearly))    ;; n 1 docs 1  e.g. tierB-000555

;; ---- slot spell_out.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 spell_out) (Theme $e0 $x1) (Member $x1 correct))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000555
(And (Member $e0 spell_out) (Theme $e0 $x1) (Member $x1 procedure))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000555

;; ---- slot spend.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spend) (Manner $e0 alone))    ;; n 1 docs 1  e.g. tierB-000883

;; ---- slot spend.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spend) (Patient $e0 $x1) (Member $x1 time))    ;; n 1 docs 1  e.g. tierB-000883

;; ---- slot spend.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spend) (Time $e0 sometimes))    ;; n 1 docs 1  e.g. tierB-000883

;; ---- slot spend.Without  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spend) (Without $e0 $x1))    ;; n 1 docs 1  e.g. tierB-001146

;; ---- slot spot.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spot) (Agent $e0 stefan))    ;; n 1 docs 1  e.g. tierB-000316

;; ---- slot spot.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spot) (Location $e0 $x1) (Member $x1 middle))    ;; n 1 docs 1  e.g. tierB-001257

;; ---- slot spot.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 spot) (Stimulus $e0 $e1) (Member $e1 work_out))    ;; n 1 docs 1  e.g. tierB-000316

;; ---- slot spot.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spot) (Theme $e0 body))    ;; n 1 docs 1  e.g. tierB-001257

;; ---- slot spread.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spread) (Agent $e0 kate))    ;; n 1 docs 1  e.g. tierB-000047

;; ---- slot spread.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spread) (Manner $e0 quickly))    ;; n 1 docs 1  e.g. tierB-001113

;; ---- slot spread.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spread) (Patient $e0 $x1) (Member $x1 excitement))    ;; n 1 docs 1  e.g. tierB-001113

;; ---- slot spread.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 spread) (Theme $e0 $x1) (Member $x1 cloth))    ;; n 1 docs 1  e.g. tierB-000047

;; ---- slot stage.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stage) (Agent $e0 robert_day))    ;; n 1 docs 1  e.g. tierC-000092

;; ---- slot stage.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stage) (Patient $e0 $x1) (Member $x1 movie))    ;; n 1 docs 1  e.g. tierC-000092

;; ---- slot stand.NextTo  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stand) (NextTo $e0 $x1) (Member $x1 table))    ;; n 1 docs 1  e.g. tierB-001604

;; ---- slot start.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 start) (Manner $e0 really))    ;; n 1 docs 1  e.g. tierB-000465

;; ---- slot start.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 start) (Time $e0 soon))    ;; n 1 docs 1  e.g. tierB-000699

;; ---- slot steal.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 steal) (Source $e0 $x1) (Member $x1 street_vendor))    ;; n 1 docs 1  e.g. tierB-000400

;; ---- slot steal.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 steal) (Theme $e0 $x1) (Member $x1 hot_dog))    ;; n 1 docs 1  e.g. tierB-000400

;; ---- slot stick.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stick) (Goal $e0 $x1) (Member $x1 show_sole))    ;; n 1 docs 1  e.g. tierB-000482

;; ---- slot straight.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 straight) (Experiencer $e0 $x1) (Member $x1 boy))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001976
(And (Member $e0 straight) (Experiencer $e0 $x1) (Member $x1 straight))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001976

;; ---- slot strew.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 strew) (Instrument $e0 trash))    ;; n 1 docs 1  e.g. tierB-000757

;; ---- slot strew.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 strew) (Patient $e0 $x1) (Member $x1 platform))    ;; n 1 docs 1  e.g. tierB-000757

;; ---- slot strike.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 strike) (Agent $e0 $x1) (Member $x1 clock))    ;; n 1 docs 1  e.g. tierB-000354

;; ---- slot strike.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 strike) (Location $e0 here))    ;; n 1 docs 1  e.g. tierB-000653

;; ---- slot strike.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 strike) (Patient $e0 $x1) (Member $x1 lightning_bolt))    ;; n 1 docs 1  e.g. tierB-000653

;; ---- slot strike.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 strike) (Theme $e0 twelve))    ;; n 1 docs 1  e.g. tierB-000354

;; ---- slot strike.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 strike) (Time $e0 midnight))    ;; n 1 docs 1  e.g. tierB-000354

;; ---- slot struggle.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 struggle) (Agent $e0 cyprus))    ;; n 1 docs 1  e.g. tierB-000171

;; ---- slot stuck.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stuck) (Experiencer $e0 gabor))    ;; n 1 docs 1  e.g. tierB-000589

;; ---- slot stuck.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 stuck) (Location $e0 $x1) (Member $x1 place))    ;; n 1 docs 1  e.g. tierB-000589

;; ---- slot study.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 study) (For $e0 $x1) (Member $x1 exam))    ;; n 1 docs 1  e.g. tierB-001879

;; ---- slot succeed.As  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 succeed) (As $e0 $x1) (Member $x1 caretaker))    ;; n 1 docs 1  e.g. tierC-000338

;; ---- slot suffer.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 suffer) (Agent $e0 $x1) (Member $x1 patient))    ;; n 1 docs 1  e.g. tierB-001498

;; ---- slot suffer.Theme  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 suffer) (Theme $e0 $x1) (Member $x1 brain_haemorrhage))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001498
(And (Member $e0 suffer) (Theme $e0 $x1) (Member $x1 severe))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001498

;; ---- slot suggest.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 suggest) (Experiencer $e0 jim))    ;; n 1 docs 1  e.g. tierB-000700

;; ---- slot surround.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 surround) (Agent $e0 $x1) (Member $x1 stone_wall))    ;; n 1 docs 1  e.g. tierB-001005

;; ---- slot surround.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 surround) (Theme $e0 $x1) (Member $x1 house))    ;; n 1 docs 1  e.g. tierB-001005

;; ---- slot sweep_away.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sweep_away) (Agent $e0 $x1) (Member $x1 current))    ;; n 1 docs 1  e.g. tierB-000018

;; ---- slot sweep_away.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 sweep_away) (Theme $e0 $x1) (Member $x1 vehicle))    ;; n 1 docs 1  e.g. tierB-000018

;; ---- slot switch_off.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 switch_off) (Agent $e0 robbie))    ;; n 1 docs 1  e.g. tierC-000316

;; ---- slot switch_off.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 switch_off) (Patient $e0 $x1) (Member $x1 machine))    ;; n 1 docs 1  e.g. tierC-000316

;; ---- slot switch_off.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 switch_off) (Time $e0 later))    ;; n 1 docs 1  e.g. tierC-000316

;; ---- slot take.As  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 take) (As $e0 $x1) (Member $x1 opportunity))    ;; n 1 docs 1  e.g. tierB-000252

;; ---- slot take.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 take) (Instrument $e0 $e1) (Member $e1 help))    ;; n 1 docs 1  e.g. tierC-000071

;; ---- slot take.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 take) (Location $e0 australia))    ;; n 1 docs 1  e.g. tierB-001077

;; ---- slot take.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 take) (Source $e0 $x1) (Member $x1 wall))    ;; n 1 docs 1  e.g. tierB-001540

;; ---- slot take_down.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 take_down) (Agent $e0 $x1) (Member $x1 museum))    ;; n 1 docs 1  e.g. tierB-001423

;; ---- slot take_down.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 take_down) (Theme $e0 $x1) (Member $x1 picture))    ;; n 1 docs 1  e.g. tierB-001423

;; ---- slot take_off.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 take_off) (Time $e0 just_now))    ;; n 1 docs 1  e.g. tierB-000132

;; ---- slot take_over.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 take_over) (Patient $e0 $x1) (Member $x1 yard))    ;; n 1 docs 1  e.g. tierB-001234

;; ---- slot take_part.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 take_part) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001033

;; ---- slot take_part.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 take_part) (In $e0 $x1) (Member $x1 marathon))    ;; n 1 docs 1  e.g. tierB-001033

;; ---- slot talk.Like  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 talk) (Like $e0 kermit_the_frog))    ;; n 1 docs 1  e.g. tierB-001968

;; ---- slot talk.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 talk) (Time $e0 yesterday))    ;; n 1 docs 1  e.g. tierB-000327

;; ---- slot teach.Recipient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 teach) (Recipient $e0 $x1) (Member $x1 class))    ;; n 1 docs 1  e.g. tierB-001612

;; ---- slot teach.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 teach) (Source $e0 $x1) (Member $x1 elevator))    ;; n 1 docs 1  e.g. tierB-001612

;; ---- slot teach.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 teach) (Theme $e0 $x1) (Member $x1 phrase))    ;; n 1 docs 1  e.g. tierB-000749

;; ---- slot teem.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 teem) (Experiencer $e0 $x1) (Member $x1 place))    ;; n 1 docs 1  e.g. tierB-001397

;; ---- slot teem.With  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 teem) (With $e0 $x1) (Member $x1 spider))    ;; n 1 docs 1  e.g. tierB-001397

;; ---- slot teleport.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 teleport) (Agent $e0 karl))    ;; n 1 docs 1  e.g. tierB-000029

;; ---- slot teleport.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 teleport) (Goal $e0 algeria))    ;; n 1 docs 1  e.g. tierB-000029

;; ---- slot teleport.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 teleport) (Theme $e0 rima))    ;; n 1 docs 1  e.g. tierB-000029

;; ---- slot tell.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 tell) (Experiencer $e0 tommy))    ;; n 1 docs 1  e.g. tierC-000035

;; ---- slot tell.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 tell) (In $e0 silence))    ;; n 1 docs 1  e.g. tierB-000742

;; ---- slot terrorize.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 terrorize) (Agent $e0 igor))    ;; n 1 docs 1  e.g. tierB-000096

;; ---- slot terrorize.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 terrorize) (Location $e0 $x1) (Member $x1 area))    ;; n 1 docs 1  e.g. tierB-000096

;; ---- slot terrorize.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 terrorize) (Patient $e0 camper))    ;; n 1 docs 1  e.g. tierB-000096

;; ---- slot think.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 think) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001160

;; ---- slot think.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 think) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001160

;; ---- slot thought.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 thought) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-001216

;; ---- slot thrive.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 thrive) (Patient $e0 $x1) (Member $x1 exotic_plant))    ;; n 1 docs 1  e.g. tierB-000858

;; ---- slot throw.At  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 throw) (At $e0 $x1) (Member $x1 dog))    ;; n 1 docs 1  e.g. tierB-000340

;; ---- slot throw.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 throw) (Goal $e0 $x1) (Member $x1 campfire))    ;; n 1 docs 1  e.g. tierB-001023

;; ---- slot thud.Against  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 thud) (Against $e0 $x1) (Member $x1 wall))    ;; n 1 docs 1  e.g. tierB-000343

;; ---- slot thud.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 thud) (Agent $e0 $x1) (Member $x1 ball))    ;; n 1 docs 1  e.g. tierB-000343

;; ---- slot tick_away.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 tick_away) (Manner $e0 quickly))    ;; n 1 docs 1  e.g. tierB-001062

;; ---- slot tick_away.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 tick_away) (Patient $e0 $x1) (Member $x1 allotted))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001062
(And (Member $e0 tick_away) (Patient $e0 $x1) (Member $x1 time))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001062

;; ---- slot tie.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 tie) (Agent $e0 james))    ;; n 1 docs 1  e.g. tierB-000392

;; ---- slot tie.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 tie) (Instrument $e0 $x1) (Member $x1 rope))    ;; n 1 docs 1  e.g. tierB-000392

;; ---- slot tie.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 tie) (Patient $e0 $x1) (Member $x1 bodyguard))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000392
(And (Member $e0 tie) (Patient $e0 $x1) (Member $x1 together))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000392

;; ---- slot till.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 till) (Agent $e0 $x1) (Member $x1 farmer))    ;; n 1 docs 1  e.g. tierB-000291

;; ---- slot till.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 till) (Location $e0 $x1) (Member $x1 bottom_field))    ;; n 1 docs 1  e.g. tierB-000291

;; ---- slot till.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 till) (Patient $e0 $x1) (Member $x1 soil))    ;; n 1 docs 1  e.g. tierB-000291

;; ---- slot together.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 together) (Experiencer $e0 $x1) (Member $x1 bodyguard))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000392
(And (Member $e0 together) (Experiencer $e0 $x1) (Member $x1 together))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000392

;; ---- slot top.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 top) (Patient $e0 $x1) (Member $x1 tree))    ;; n 1 docs 1  e.g. tierB-001757

;; ---- slot top.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 top) (Time $e0 this_summer))    ;; n 1 docs 1  e.g. tierB-001757

;; ---- slot topple.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 topple) (Agent $e0 $x1) (Member $x1 wind))    ;; n 1 docs 1  e.g. tierB-001886

;; ---- slot topple.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 topple) (Patient $e0 $x1) (Member $x1 tree))    ;; n 1 docs 1  e.g. tierB-001886

;; ---- slot torture.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 torture) (Agent $e0 $x1) (Member $x1 legionnaire))    ;; n 1 docs 1  e.g. tierB-001138

;; ---- slot traffic.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 traffic) (Theme $e0 gluten))    ;; n 1 docs 1  e.g. tierB-001222

;; ---- slot translate.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 translate) (Agent $e0 alexander))    ;; n 1 docs 1  e.g. tierB-001270

;; ---- slot translate.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 translate) (In $e0 spanish))    ;; n 1 docs 1  e.g. tierB-001270

;; ---- slot translate.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 translate) (Theme $e0 sentence))    ;; n 1 docs 1  e.g. tierB-000310

;; ---- slot translate.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 translate) (Time $e0 now))    ;; n 1 docs 1  e.g. tierB-001270

;; ---- slot travel.For  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 travel) (For $e0 work))    ;; n 1 docs 1  e.g. tierB-000667

;; ---- slot travel.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 travel) (Goal $e0 town))    ;; n 1 docs 1  e.g. tierB-000995

;; ---- slot travel.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 travel) (Source $e0 town))    ;; n 1 docs 1  e.g. tierB-000995

;; ---- slot treat.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 treat) (Theme $e0 $x1) (Member $x1 lady))    ;; n 1 docs 1  e.g. tierB-001636

;; ---- slot try.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 try) (Manner $e0 often))    ;; n 1 docs 1  e.g. tierB-000947

;; ---- slot try.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 try) (Time $e0 tonight))    ;; n 1 docs 1  e.g. tierB-001773

;; ---- slot try_on.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 try_on) (Agent $e0 mary))    ;; n 1 docs 1  e.g. tierB-000021

;; ---- slot try_on.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 try_on) (Theme $e0 $x1) (Member $x1 dress))    ;; n 1 docs 1  e.g. tierB-000021

;; ---- slot turn.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 turn) (Manner $e0 quickly))    ;; n 1 docs 1  e.g. tierB-001579

;; ---- slot turn.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 turn) (Source $e0 moisture))    ;; n 1 docs 1  e.g. tierB-000476

;; ---- slot turn.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 turn) (Time $e0 autumn))    ;; n 1 docs 1  e.g. tierB-000832

;; ---- slot turn_off.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 turn_off) (Agent $e0 robbie))    ;; n 1 docs 1  e.g. tierC-000315

;; ---- slot turn_off.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 turn_off) (Time $e0 later))    ;; n 1 docs 1  e.g. tierC-000315

;; ---- slot turn_out.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 turn_out) (Agent $e0 $x1) (Member $x1 search))    ;; n 1 docs 1  e.g. tierB-001550

;; ---- slot turn_out.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 turn_out) (Theme $e0 nothing))    ;; n 1 docs 1  e.g. tierB-001550

;; ---- slot type_ia_supernova.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 type_ia_supernova) (Location $e0 milky_way))    ;; n 1 docs 1  e.g. tierB-001015

;; ---- slot uncomfortable.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 uncomfortable) (Experiencer $e0 isabella))    ;; n 1 docs 1  e.g. tierB-000325

;; ---- slot understand.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 understand) (Experiencer $e0 yanni))    ;; n 1 docs 1  e.g. tierB-000114

;; ---- slot unfold.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 unfold) (Patient $e0 $x1) (Member $x1 future))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001557
(And (Member $e0 unfold) (Patient $e0 $x1) (Member $x1 mystery))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001557

;; ---- slot unknown.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 unknown) (Experiencer $e0 $x1) (Member $x1 cause))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000919
(And (Member $e0 unknown) (Experiencer $e0 $x1) (Member $x1 unknown))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000919

;; ---- slot unlocked.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 unlocked) (Experiencer $e0 $x1) (Member $x1 door))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000747
(And (Member $e0 unlocked) (Experiencer $e0 $x1) (Member $x1 unlocked))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000747

;; ---- slot unwilling.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 unwilling) (Experiencer $e0 $x1) (Member $x1 villager))    ;; n 1 docs 1  e.g. tierB-000124

;; ---- slot unwilling.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 unwilling) (Theme $e0 <term:And>))    ;; n 1 docs 1  e.g. tierB-000124

;; ---- slot update.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 update) (Patient $e0 $x1) (Member $x1 software))    ;; n 1 docs 1  e.g. tierB-000557

;; ---- slot upset.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 upset) (Experiencer $e0 liisa))    ;; n 1 docs 1  e.g. tierB-001657

;; ---- slot upset.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 upset) (Theme $e0 <term:Member>))    ;; n 1 docs 1  e.g. tierB-001657

;; ---- slot use.As  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 use) (As $e0 name))    ;; n 1 docs 1  e.g. tierB-001314

;; ---- slot use.Beneficiary  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 use) (Beneficiary $e0 transpacific_flight))    ;; n 1 docs 1  e.g. tierB-000908

;; ---- slot use.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 use) (In $e0 real_life))    ;; n 1 docs 1  e.g. tierB-000971

;; ---- slot usual.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 usual) (Experiencer $e0 $x1) (Member $x1 usual))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000135
(And (Member $e0 usual) (Experiencer $e0 $x1) (Member $x1 view))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000135

;; ---- slot vanish.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 vanish) (Patient $e0 leon))    ;; n 1 docs 1  e.g. tierB-000955

;; ---- slot vanish.Source  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 vanish) (Source $e0 $x1) (Member $x1 spotlight))    ;; n 1 docs 1  e.g. tierB-000955

;; ---- slot vindicate.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 vindicate) (Theme $e0 $x1) (Member $x1 critic))    ;; n 1 docs 1  e.g. tierB-000409

;; ---- slot visit.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 visit) (Agent $e0 $x1) (Member $x1 governor))    ;; n 1 docs 1  e.g. tierB-000985

;; ---- slot vomit.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 vomit) (Agent $e0 karl))    ;; n 1 docs 1  e.g. tierB-000199

;; ---- slot vomit.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 vomit) (In $e0 disgust))    ;; n 1 docs 1  e.g. tierB-000199

;; ---- slot wait.Experiencer  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 wait) (Experiencer $e0 $x1) (Member $x1 future))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001557
(And (Member $e0 wait) (Experiencer $e0 $x1) (Member $x1 mystery))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001557

;; ---- slot wait.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 wait) (Theme $e0 $e1) (Member $e1 unfold))    ;; n 1 docs 1  e.g. tierB-001557

;; ---- slot wake.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 wake) (Goal $e0 $x1) (Member $x1 thud))    ;; n 1 docs 1  e.g. tierB-000909

;; ---- slot wake.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 wake) (Patient $e0 claudio))    ;; n 1 docs 1  e.g. tierB-000909

;; ---- slot ward_off.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ward_off) (Agent $e0 $x1) (Member $x1 necklace))    ;; n 1 docs 1  e.g. tierB-000453

;; ---- slot ward_off.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 ward_off) (Theme $e0 $x1) (Member $x1 evil_eye))    ;; n 1 docs 1  e.g. tierB-000453

;; ---- slot warrior.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 warrior) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000014

;; ---- slot watch.Stimulus  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 watch) (Stimulus $e0 $e1) (Member $e1 practice))    ;; n 1 docs 1  e.g. tierB-001720

;; ---- slot wax.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 wax) (Patient $e0 $x1) (Member $x1 car))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000447
(And (Member $e0 wax) (Patient $e0 $x1) (Member $x1 shiny))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000447

;; ---- slot weave.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 weave) (Agent $e0 time))    ;; n 1 docs 1  e.g. tierB-001677

;; ---- slot weave.In  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 weave) (In $e0 silence))    ;; n 1 docs 1  e.g. tierB-001677

;; ---- slot weave.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 weave) (Patient $e0 $x1) (Member $x1 web))    ;; n 1 docs 1  e.g. tierB-001677

;; ---- slot weird_out.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 weird_out) (Manner $e0 a_bit))    ;; n 1 docs 1  e.g. tierB-000254

;; ---- slot weird_out.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 weird_out) (Theme $e0 tobias))    ;; n 1 docs 1  e.g. tierB-000254

;; ---- slot welcome.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 welcome) (Goal $e0 wikipedia))    ;; n 1 docs 1  e.g. tierB-001787

;; ---- slot welcome.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 welcome) (Manner $e0 warmly))    ;; n 1 docs 1  e.g. tierB-001868

;; ---- slot welcome_back.Goal  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 welcome_back) (Goal $e0 school))    ;; n 1 docs 1  e.g. tierB-000554

;; ---- slot welcome_back.Instrument  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 welcome_back) (Instrument $e0 open_arms))    ;; n 1 docs 1  e.g. tierB-000554

;; ---- slot welcome_back.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 welcome_back) (Theme $e0 anne))    ;; n 1 docs 1  e.g. tierB-000554

;; ---- slot whisper.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 whisper) (Patient $e0 $x1) (Member $x1 wind))    ;; n 1 docs 1  e.g. tierB-001632

;; ---- slot whisper.Through  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 whisper) (Through $e0 $x1) (Member $x1 tree))    ;; n 1 docs 1  e.g. tierB-001632

;; ---- slot white.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 white) (Experiencer $e0 paper))    ;; n 1 docs 1  e.g. tierB-001431

;; ---- slot wind.Around  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 wind) (Around $e0 tree))    ;; n 1 docs 1  e.g. tierB-001107

;; ---- slot wind.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 wind) (Experiencer $e0 $x1) (Member $x1 vine))    ;; n 1 docs 1  e.g. tierB-001107

;; ---- slot wither.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 wither) (Patient $e0 faith))    ;; n 1 docs 1  e.g. tierB-001240

;; ---- slot work_out.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 work_out) (Agent $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000316

;; ---- slot work_out.Location  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 work_out) (Location $e0 $x1) (Member $x1 gym))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000316
(And (Member $e0 work_out) (Location $e0 $x1) (Member $x1 huge))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000316

;; ---- slot work_through.Theme  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 work_through) (Theme $e0 past_trauma))    ;; n 1 docs 1  e.g. tierB-000118

;; ---- slot worry.Experiencer  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 worry) (Experiencer $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001784

;; ---- slot worry.Time  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 worry) (Time $e0 hurricane_season))    ;; n 1 docs 1  e.g. tierB-001784

;; ---- slot wound.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 wound) (Patient $e0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000771

;; ---- slot wreak.Agent  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 wreak) (Agent $e0 $x1) (Member $x1 golem))    ;; n 1 docs 1  e.g. tierB-001706

;; ---- slot wreak.Location  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 wreak) (Location $e0 $x1) (Member $x1 village))    ;; n 1 docs 1  e.g. tierB-001706

;; ---- slot wreak.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 wreak) (Patient $e0 havoc))    ;; n 1 docs 1  e.g. tierB-001706

;; ---- slot wriggle.Like  [event center; head oblique]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 wriggle) (Like $e0 $x1) (Member $x1 snake))    ;; n 1 docs 1  e.g. tierB-001854

;; ---- slot wriggle.Patient  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 wriggle) (Patient $e0 $x1) (Member $x1 pitch))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001854
(And (Member $e0 wriggle) (Patient $e0 $x1) (Member $x1 straight))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001854

;; ---- slot write.Manner  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 write) (Manner $e0 this_way))    ;; n 1 docs 1  e.g. tierB-001601

;; ---- slot yield.Goal  [event center; head role]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 yield) (Goal $e0 $x1) (Member $x1 push))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001453
(And (Member $e0 yield) (Goal $e0 $x1) (Member $x1 strong))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001453

;; ---- slot yield.Patient  [event center; head role]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 yield) (Patient $e0 $x1) (Member $x1 door))    ;; n 1 docs 1  e.g. tierB-001453

;; ---- slot appear.Patient  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 appear) (Patient $e0 $x1) (Member $x1 blue))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001940
(And (Member $e0 appear) (Patient $e0 $x1) (Member $x1 pocket))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001940
(And (Member $e0 appear) (Patient $e0 $x1) (Member $x1 sky))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001940

;; ---- slot clean.Instrument  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 clean) (Instrument $e0 $x1) (Member $x1 rag))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001143
(And (Member $e0 clean) (Instrument $e0 $x1) (Member $x1 smelly))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001143
(And (Member $e0 clean) (Instrument $e0 $x1) (Member $x1 terrible))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001143

;; ---- slot competitive_activity.Experiencer  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 competitive_activity) (Experiencer $e0 $x1) (Member $x1 competitive_activity))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000148
(And (Member $e0 competitive_activity) (Experiencer $e0 $x1) (Member $x1 recreational_sport))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000148
(And (Member $e0 competitive_activity) (Experiencer $e0 $x1) (Member $x1 thing))    ;; n 1 (mass 0.333) docs 1  e.g. tierC-000148

;; ---- slot cozy.Experiencer  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 cozy) (Experiencer $e0 $x1) (Member $x1 cozy))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001573
(And (Member $e0 cozy) (Experiencer $e0 $x1) (Member $x1 living_room))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001573
(And (Member $e0 cozy) (Experiencer $e0 $x1) (Member $x1 theater))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-001573

;; ---- slot effective.Experiencer  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 effective) (Experiencer $e0 $x1) (Member $x1 drug))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000786
(And (Member $e0 effective) (Experiencer $e0 $x1) (Member $x1 effective))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000786
(And (Member $e0 effective) (Experiencer $e0 $x1) (Member $x1 experimental))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000786

;; ---- slot limp.Experiencer  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 limp) (Experiencer $e0 $x1) (Member $x1 hat))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000596
(And (Member $e0 limp) (Experiencer $e0 $x1) (Member $x1 limp))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000596
(And (Member $e0 limp) (Experiencer $e0 $x1) (Member $x1 wet))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000596

;; ---- slot prove.Experiencer  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 prove) (Experiencer $e0 $x1) (Member $x1 drug))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000786
(And (Member $e0 prove) (Experiencer $e0 $x1) (Member $x1 effective))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000786
(And (Member $e0 prove) (Experiencer $e0 $x1) (Member $x1 experimental))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000786

;; ---- slot wet.Experiencer  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 wet) (Experiencer $e0 $x1) (Member $x1 hat))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000596
(And (Member $e0 wet) (Experiencer $e0 $x1) (Member $x1 limp))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000596
(And (Member $e0 wet) (Experiencer $e0 $x1) (Member $x1 wet))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000596

;; ---- slot yellow.Experiencer  [event center; head role]  n 1  docs<= 3  distinct 3  eventive 0
(And (Member $e0 yellow) (Experiencer $e0 $x1) (Member $x1 leaf))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000832
(And (Member $e0 yellow) (Experiencer $e0 $x1) (Member $x1 red))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000832
(And (Member $e0 yellow) (Experiencer $e0 $x1) (Member $x1 yellow))    ;; n 1 (mass 0.333) docs 1  e.g. tierB-000832

;; ==================== other slots (2343): entity centers + event centers under non-role heads ====================

;; ---- slot <unclassed>.GroupOf  [entity center; head other]  n 490  docs<= 470  distinct 302  eventive 0
(GroupOf $x0 person)    ;; n 34 docs 31  e.g. tierB-000040 tierB-000126
(GroupOf $x0 child)    ;; n 20 docs 20  e.g. tierB-000410 tierB-000587
(GroupOf $x0 thing)    ;; n 11 docs 11  e.g. tierB-000162 tierB-000483
(GroupOf $x0 view)    ;; n 7 docs 4  e.g. tierC-000159 tierC-000160
(GroupOf $x0 book)    ;; n 5 docs 5  e.g. tierB-000295 tierB-000705
(GroupOf $x0 city)    ;; n 5 docs 5  e.g. tierB-000207 tierB-001260
(GroupOf $x0 cloud)    ;; n 5 docs 5  e.g. tierB-001252 tierB-001284
(GroupOf $x0 girl)    ;; n 5 docs 4  e.g. tierB-000133 tierB-000738
(GroupOf $x0 pupil)    ;; n 5 docs 4  e.g. tierB-000194 tierB-000794
(GroupOf $x0 student)    ;; n 5 docs 5  e.g. tierB-000387 tierB-000656
(GroupOf $x0 boy)    ;; n 4 docs 4  e.g. tierB-001316 tierB-001457
(GroupOf $x0 friend)    ;; n 4 docs 4  e.g. tierB-000066 tierB-000267
(GroupOf $x0 soldier)    ;; n 4 docs 4  e.g. tierB-000274 tierB-001058
(GroupOf $x0 cookie)    ;; n 3 docs 3  e.g. tierB-000335 tierB-000338
(GroupOf $x0 day)    ;; n 3 docs 3  e.g. tierB-000463 tierB-000513
(GroupOf $x0 dish)    ;; n 3 docs 3  e.g. tierB-000796 tierB-001519
(GroupOf $x0 flower)    ;; n 3 docs 3  e.g. tierB-000085 tierB-001935
(GroupOf $x0 law)    ;; n 3 docs 3  e.g. tierB-001928 tierC-000285
(GroupOf $x0 leaf)    ;; n 3 docs 3  e.g. tierB-000098 tierB-001246
(GroupOf $x0 man)    ;; n 3 docs 3  e.g. tierB-000277 tierB-001068
(GroupOf $x0 question)    ;; n 3 docs 3  e.g. tierB-001351 tierB-001426
(GroupOf $x0 refugee)    ;; n 3 docs 2  e.g. tierB-000769 tierB-001035
(GroupOf $x0 road)    ;; n 3 docs 3  e.g. tierB-000018 tierB-000913
(GroupOf $x0 rock)    ;; n 3 docs 3  e.g. tierB-000760 tierC-000265
(GroupOf $x0 scientist)    ;; n 3 docs 3  e.g. tierB-000225 tierB-001251
(GroupOf $x0 sequence)    ;; n 3 docs 3  e.g. tierC-000145 tierC-000261
(GroupOf $x0 sister)    ;; n 3 docs 3  e.g. tierB-001362 tierC-000127
(GroupOf $x0 tree)    ;; n 3 docs 3  e.g. tierB-001394 tierB-001632
(GroupOf $x0 window)    ;; n 3 docs 2  e.g. tierB-000320 tierB-000687
(GroupOf $x0 woman)    ;; n 3 docs 3  e.g. tierB-000864 tierB-001295
(GroupOf $x0 activity)    ;; n 2 docs 2  e.g. tierB-001800 tierC-000040
(GroupOf $x0 aspect)    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114
(GroupOf $x0 bhadala)    ;; n 2 docs 2  e.g. tierC-000117 tierC-000118
(GroupOf $x0 bird)    ;; n 2 docs 2  e.g. tierB-001901 tierB-001973
(GroupOf $x0 bush)    ;; n 2 docs 2  e.g. tierB-000381 tierB-001825
(GroupOf $x0 byzantine_tradition)    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114
(GroupOf $x0 camper)    ;; n 2 docs 2  e.g. tierB-000922 tierB-001429
(GroupOf $x0 centipede)    ;; n 2 docs 1  e.g. tierB-000772
(GroupOf $x0 chick)    ;; n 2 docs 1  e.g. tierB-000779
(GroupOf $x0 clove)    ;; n 2 docs 2  e.g. tierB-000357 tierB-000462
(GroupOf $x0 corner)    ;; n 2 docs 1  e.g. tierB-001299
(GroupOf $x0 country)    ;; n 2 docs 2  e.g. tierB-000622 tierB-001534
(GroupOf $x0 cow)    ;; n 2 docs 2  e.g. tierB-000891 tierB-001173
(GroupOf $x0 crop)    ;; n 2 docs 2  e.g. tierB-000790 tierB-001499
(GroupOf $x0 district)    ;; n 2 docs 2  e.g. tierC-000191 tierC-000192
(GroupOf $x0 earthquake)    ;; n 2 docs 2  e.g. tierB-000364 tierB-001649
(GroupOf $x0 egg)    ;; n 2 docs 2  e.g. tierB-000217 tierB-001855
(GroupOf $x0 european_american_settler)    ;; n 2 docs 2  e.g. tierC-000025 tierC-000026
(GroupOf $x0 field)    ;; n 2 docs 2  e.g. tierB-001501 tierB-001728
(GroupOf $x0 hand)    ;; n 2 docs 2  e.g. tierB-000332 tierB-001639
(GroupOf $x0 hill)    ;; n 2 docs 2  e.g. tierC-000343 tierC-000344
(GroupOf $x0 house)    ;; n 2 docs 1  e.g. tierB-001337
(GroupOf $x0 illustration)    ;; n 2 docs 2  e.g. tierC-000231 tierC-000232
(GroupOf $x0 insect)    ;; n 2 docs 2  e.g. tierB-000801 tierB-001196
(GroupOf $x0 kid)    ;; n 2 docs 2  e.g. tierB-001046 tierB-001867
(GroupOf $x0 listed_building)    ;; n 2 docs 2  e.g. tierC-000115 tierC-000116
(GroupOf $x0 localized_version)    ;; n 2 docs 2  e.g. tierC-000173 tierC-000174
(GroupOf $x0 mayan_book)    ;; n 2 docs 1  e.g. tierB-000799
(GroupOf $x0 message)    ;; n 2 docs 1  e.g. tierB-000519
(GroupOf $x0 native_american)    ;; n 2 docs 2  e.g. tierB-001214 tierC-000026
(GroupOf $x0 nephew)    ;; n 2 docs 2  e.g. tierC-000139 tierC-000140
(GroupOf $x0 noise)    ;; n 2 docs 2  e.g. tierB-000193 tierB-000414
(GroupOf $x0 pakistani_block)    ;; n 2 docs 2  e.g. tierC-000321 tierC-000322
(GroupOf $x0 part)    ;; n 2 docs 2  e.g. tierB-000417 tierC-000135
(GroupOf $x0 pear)    ;; n 2 docs 2  e.g. tierB-001050 tierB-001851
(GroupOf $x0 place)    ;; n 2 docs 2  e.g. tierB-000602 tierB-001774
(GroupOf $x0 plane)    ;; n 2 docs 1  e.g. tierB-000761
(GroupOf $x0 prayer)    ;; n 2 docs 2  e.g. tierC-000283 tierC-000284
(GroupOf $x0 predictive_function)    ;; n 2 docs 2  e.g. tierC-000205 tierC-000206
(GroupOf $x0 problem)    ;; n 2 docs 2  e.g. tierB-000398 tierB-001970
(GroupOf $x0 reason)    ;; n 2 docs 2  e.g. tierB-000976 tierB-001673
(GroupOf $x0 session)    ;; n 2 docs 2  e.g. tierC-000349 tierC-000350
(GroupOf $x0 shop)    ;; n 2 docs 1  e.g. tierB-001111
(GroupOf $x0 start)    ;; n 2 docs 2  e.g. tierC-000255 tierC-000256
(GroupOf $x0 street)    ;; n 2 docs 2  e.g. tierB-000116 tierB-000153
(GroupOf $x0 ticket)    ;; n 2 docs 2  e.g. tierB-001391 tierB-001513
(GroupOf $x0 tradition)    ;; n 2 docs 2  e.g. tierC-000117 tierC-000118
(GroupOf $x0 tributary)    ;; n 2 docs 2  e.g. tierC-000313 tierC-000314
(GroupOf $x0 villager)    ;; n 2 docs 1  e.g. tierB-000124
(GroupOf $x0 wagon)    ;; n 2 docs 1  e.g. tierB-001505
(GroupOf $x0 wall)    ;; n 2 docs 2  e.g. tierB-000911 tierB-001704
(GroupOf $x0 way)    ;; n 2 docs 2  e.g. tierB-001985 tierC-000262
(GroupOf $x0 whig)    ;; n 2 docs 2  e.g. tierC-000087 tierC-000088
(GroupOf $x0 act)    ;; n 1 docs 1  e.g. tierB-001932
(GroupOf $x0 action)    ;; n 1 docs 1  e.g. tierB-000411
(GroupOf $x0 actor)    ;; n 1 docs 1  e.g. tierB-000523
(GroupOf $x0 admirer)    ;; n 1 docs 1  e.g. tierC-000065
(GroupOf $x0 adult)    ;; n 1 docs 1  e.g. tierB-001742
(GroupOf $x0 algerian_city)    ;; n 1 docs 1  e.g. tierB-000215
(GroupOf $x0 animal)    ;; n 1 docs 1  e.g. tierB-000980
(GroupOf $x0 antler)    ;; n 1 docs 1  e.g. tierB-001412
(GroupOf $x0 apple)    ;; n 1 docs 1  e.g. tierB-000384
(GroupOf $x0 archaeologist)    ;; n 1 docs 1  e.g. tierB-000374
(GroupOf $x0 atrocity)    ;; n 1 docs 1  e.g. tierB-001204
(GroupOf $x0 attendee)    ;; n 1 docs 1  e.g. tierB-000781
(GroupOf $x0 ball)    ;; n 1 docs 1  e.g. tierB-000019
(GroupOf $x0 bat)    ;; n 1 docs 1  e.g. tierB-000518
(GroupOf $x0 beast)    ;; n 1 docs 1  e.g. tierB-001715
(GroupOf $x0 beauty_salon)    ;; n 1 docs 1  e.g. tierB-000333
(GroupOf $x0 bed)    ;; n 1 docs 1  e.g. tierB-001704
(GroupOf $x0 bicycle)    ;; n 1 docs 1  e.g. tierB-001157
(GroupOf $x0 bone)    ;; n 1 docs 1  e.g. tierB-000936
(GroupOf $x0 bowling_pin)    ;; n 1 docs 1  e.g. tierB-001870
(GroupOf $x0 branch)    ;; n 1 docs 1  e.g. tierB-000479
(GroupOf $x0 bridge)    ;; n 1 docs 1  e.g. tierB-000022
(GroupOf $x0 bungalow)    ;; n 1 docs 1  e.g. tierB-001775
(GroupOf $x0 cab)    ;; n 1 docs 1  e.g. tierB-001684
(GroupOf $x0 cabinet)    ;; n 1 docs 1  e.g. tierB-000641
(GroupOf $x0 candidate)    ;; n 1 docs 1  e.g. tierB-001616
(GroupOf $x0 candle)    ;; n 1 docs 1  e.g. tierB-001997
(GroupOf $x0 cat)    ;; n 1 docs 1  e.g. tierB-000160
(GroupOf $x0 cemetery)    ;; n 1 docs 1  e.g. tierB-001348
(GroupOf $x0 charge)    ;; n 1 docs 1  e.g. tierB-001465
(GroupOf $x0 chinese_drama)    ;; n 1 docs 1  e.g. tierC-000014
(GroupOf $x0 claim)    ;; n 1 docs 1  e.g. tierB-000964
(GroupOf $x0 clay_figurine)    ;; n 1 docs 1  e.g. tierB-000579
(GroupOf $x0 colonial_authority)    ;; n 1 docs 1  e.g. tierB-001716
(GroupOf $x0 condition)    ;; n 1 docs 1  e.g. tierB-000294
(GroupOf $x0 conquistador)    ;; n 1 docs 1  e.g. tierB-000799
(GroupOf $x0 cop)    ;; n 1 docs 1  e.g. tierB-001216
(GroupOf $x0 cope)    ;; n 1 docs 1  e.g. tierB-001696
(GroupOf $x0 copy)    ;; n 1 docs 1  e.g. tierB-000784
(GroupOf $x0 cowboy)    ;; n 1 docs 1  e.g. tierB-001543
(GroupOf $x0 crazy)    ;; n 1 docs 1  e.g. tierB-000804
(GroupOf $x0 critic)    ;; n 1 docs 1  e.g. tierB-000409
(GroupOf $x0 crowd)    ;; n 1 docs 1  e.g. tierB-001018
(GroupOf $x0 current)    ;; n 1 docs 1  e.g. tierB-000018
(GroupOf $x0 curtain)    ;; n 1 docs 1  e.g. tierB-001920
(GroupOf $x0 customer)    ;; n 1 docs 1  e.g. tierB-000324
(GroupOf $x0 deadly_sin)    ;; n 1 docs 1  e.g. tierB-000655
(GroupOf $x0 department)    ;; n 1 docs 1  e.g. tierC-000106
(GroupOf $x0 diver)    ;; n 1 docs 1  e.g. tierB-001008
(GroupOf $x0 division)    ;; n 1 docs 1  e.g. tierC-000105
(GroupOf $x0 doctor)    ;; n 1 docs 1  e.g. tierB-001122
(GroupOf $x0 door)    ;; n 1 docs 1  e.g. tierB-000687
(GroupOf $x0 drink)    ;; n 1 docs 1  e.g. tierB-000368
(GroupOf $x0 drum)    ;; n 1 docs 1  e.g. tierC-000110
(GroupOf $x0 drunk)    ;; n 1 docs 1  e.g. tierB-000198
(GroupOf $x0 dung_beetle)    ;; n 1 docs 1  e.g. tierB-001735
(GroupOf $x0 earring)    ;; n 1 docs 1  e.g. tierB-000461
(GroupOf $x0 electrolyte)    ;; n 1 docs 1  e.g. tierB-000454
(GroupOf $x0 empirical_relationship)    ;; n 1 docs 1  e.g. tierC-000021
(GroupOf $x0 english_sentence)    ;; n 1 docs 1  e.g. tierB-000422
(GroupOf $x0 evil)    ;; n 1 docs 1  e.g. tierB-000697
(GroupOf $x0 exotic_plant)    ;; n 1 docs 1  e.g. tierB-000858
(GroupOf $x0 experiment)    ;; n 1 docs 1  e.g. tierB-000774
(GroupOf $x0 eye)    ;; n 1 docs 1  e.g. tierB-000732
(GroupOf $x0 factory)    ;; n 1 docs 1  e.g. tierB-001151
(GroupOf $x0 family)    ;; n 1 docs 1  e.g. tierB-000838
(GroupOf $x0 family_physician)    ;; n 1 docs 1  e.g. tierB-001079
(GroupOf $x0 fan)    ;; n 1 docs 1  e.g. tierB-001332
(GroupOf $x0 farmer)    ;; n 1 docs 1  e.g. tierB-001501
(GroupOf $x0 flame)    ;; n 1 docs 1  e.g. tierB-001586
(GroupOf $x0 fool)    ;; n 1 docs 1  e.g. tierB-000198
(GroupOf $x0 footprint)    ;; n 1 docs 1  e.g. tierB-000798
(GroupOf $x0 foreigner)    ;; n 1 docs 1  e.g. tierB-001546
(GroupOf $x0 forensics_researcher)    ;; n 1 docs 1  e.g. tierB-000710
(GroupOf $x0 forest_fire)    ;; n 1 docs 1  e.g. tierB-001694
(GroupOf $x0 french_settler)    ;; n 1 docs 1  e.g. tierB-000005
(GroupOf $x0 fund)    ;; n 1 docs 1  e.g. tierB-000683
(GroupOf $x0 gas_pump)    ;; n 1 docs 1  e.g. tierB-000797
(GroupOf $x0 ghost)    ;; n 1 docs 1  e.g. tierB-001690
(GroupOf $x0 giraffe)    ;; n 1 docs 1  e.g. tierB-001146
(GroupOf $x0 gold_coin)    ;; n 1 docs 1  e.g. tierB-001650
(GroupOf $x0 guard)    ;; n 1 docs 1  e.g. tierB-000494
(GroupOf $x0 guest)    ;; n 1 docs 1  e.g. tierB-001868
(GroupOf $x0 guy)    ;; n 1 docs 1  e.g. tierB-000689
(GroupOf $x0 habitat)    ;; n 1 docs 1  e.g. tierC-000339
(GroupOf $x0 hardship)    ;; n 1 docs 1  e.g. tierB-001977
(GroupOf $x0 herd)    ;; n 1 docs 1  e.g. tierB-001467
(GroupOf $x0 horse)    ;; n 1 docs 1  e.g. tierB-001771
(GroupOf $x0 hothouse_condition)    ;; n 1 docs 1  e.g. tierB-000858
(GroupOf $x0 hour)    ;; n 1 docs 1  e.g. tierB-001782
(GroupOf $x0 indigenous_american)    ;; n 1 docs 1  e.g. tierC-000025
(GroupOf $x0 ingredient)    ;; n 1 docs 1  e.g. tierB-001518
(GroupOf $x0 insect_sound)    ;; n 1 docs 1  e.g. tierB-000677
(GroupOf $x0 interaction)    ;; n 1 docs 1  e.g. tierB-000934
(GroupOf $x0 island)    ;; n 1 docs 1  e.g. tierB-000573
(GroupOf $x0 israeli_authority)    ;; n 1 docs 1  e.g. tierB-000830
(GroupOf $x0 jack)    ;; n 1 docs 1  e.g. tierB-000101
(GroupOf $x0 jacket)    ;; n 1 docs 1  e.g. tierB-001429
(GroupOf $x0 journalist)    ;; n 1 docs 1  e.g. tierB-001292
(GroupOf $x0 kabye_person)    ;; n 1 docs 1  e.g. tierB-001629
(GroupOf $x0 kidnapper)    ;; n 1 docs 1  e.g. tierB-001737
(GroupOf $x0 king)    ;; n 1 docs 1  e.g. tierB-000101
(GroupOf $x0 knife)    ;; n 1 docs 1  e.g. tierB-000604
(GroupOf $x0 labourer)    ;; n 1 docs 1  e.g. tierB-000780
(GroupOf $x0 lane)    ;; n 1 docs 1  e.g. tierB-001966
(GroupOf $x0 lantern)    ;; n 1 docs 1  e.g. tierB-001061
(GroupOf $x0 legionnaire)    ;; n 1 docs 1  e.g. tierB-001138
(GroupOf $x0 lie)    ;; n 1 docs 1  e.g. tierB-000742
(GroupOf $x0 light)    ;; n 1 docs 1  e.g. tierB-001583
(GroupOf $x0 lion)    ;; n 1 docs 1  e.g. tierB-001197
(GroupOf $x0 local)    ;; n 1 docs 1  e.g. tierB-000485
(GroupOf $x0 log)    ;; n 1 docs 1  e.g. tierB-000416
(GroupOf $x0 lyric)    ;; n 1 docs 1  e.g. tierB-001922
(GroupOf $x0 manner)    ;; n 1 docs 1  e.g. tierC-000145
(GroupOf $x0 marching_band)    ;; n 1 docs 1  e.g. tierB-000379
(GroupOf $x0 marker)    ;; n 1 docs 1  e.g. tierB-001250
(GroupOf $x0 meaning)    ;; n 1 docs 1  e.g. tierB-000142
(GroupOf $x0 measure)    ;; n 1 docs 1  e.g. tierB-000409
(GroupOf $x0 medlar)    ;; n 1 docs 1  e.g. tierB-000506
(GroupOf $x0 member)    ;; n 1 docs 1  e.g. tierB-001066
(GroupOf $x0 miscreant)    ;; n 1 docs 1  e.g. tierB-001390
(GroupOf $x0 moon)    ;; n 1 docs 1  e.g. tierB-001769
(GroupOf $x0 moroccan_police)    ;; n 1 docs 1  e.g. tierB-000097
(GroupOf $x0 motor_vehicle)    ;; n 1 docs 1  e.g. tierB-000680
(GroupOf $x0 mountain)    ;; n 1 docs 1  e.g. tierB-000727
(GroupOf $x0 mozabite)    ;; n 1 docs 1  e.g. tierB-000063
(GroupOf $x0 muslim)    ;; n 1 docs 1  e.g. tierB-000622
(GroupOf $x0 nazi)    ;; n 1 docs 1  e.g. tierB-000166
(GroupOf $x0 newcomer)    ;; n 1 docs 1  e.g. tierB-001902
(GroupOf $x0 newspaper)    ;; n 1 docs 1  e.g. tierB-001070
(GroupOf $x0 night)    ;; n 1 docs 1  e.g. tierB-000463
(GroupOf $x0 official)    ;; n 1 docs 1  e.g. tierB-001602
(GroupOf $x0 orange)    ;; n 1 docs 1  e.g. tierB-001633
(GroupOf $x0 organism)    ;; n 1 docs 1  e.g. tierB-001589
(GroupOf $x0 pacificat)    ;; n 1 docs 1  e.g. tierC-000184
(GroupOf $x0 paleontologist)    ;; n 1 docs 1  e.g. tierB-000658
(GroupOf $x0 palm_tree)    ;; n 1 docs 1  e.g. tierB-000963
(GroupOf $x0 pancake)    ;; n 1 docs 1  e.g. tierB-001395
(GroupOf $x0 paper_decoration)    ;; n 1 docs 1  e.g. tierB-001541
(GroupOf $x0 paper_sheet)    ;; n 1 docs 1  e.g. tierB-001139
(GroupOf $x0 parent)    ;; n 1 docs 1  e.g. tierC-000130
(GroupOf $x0 park)    ;; n 1 docs 1  e.g. tierB-000972
(GroupOf $x0 party)    ;; n 1 docs 1  e.g. tierB-000359
(GroupOf $x0 paste)    ;; n 1 docs 1  e.g. tierB-001445
(GroupOf $x0 peak)    ;; n 1 docs 1  e.g. tierB-000702
(GroupOf $x0 penguin)    ;; n 1 docs 1  e.g. tierB-001780
(GroupOf $x0 people)    ;; n 1 docs 1  e.g. tierB-001371
(GroupOf $x0 phrase)    ;; n 1 docs 1  e.g. tierB-000749
(GroupOf $x0 pilot_error)    ;; n 1 docs 1  e.g. tierB-000834
(GroupOf $x0 pine_cone)    ;; n 1 docs 1  e.g. tierB-001023
(GroupOf $x0 pirate)    ;; n 1 docs 1  e.g. tierB-001990
(GroupOf $x0 pitfall)    ;; n 1 docs 1  e.g. tierB-000246
(GroupOf $x0 plant)    ;; n 1 docs 1  e.g. tierB-001132
(GroupOf $x0 plate)    ;; n 1 docs 1  e.g. tierB-001492
(GroupOf $x0 pleasantry)    ;; n 1 docs 1  e.g. tierB-001682
(GroupOf $x0 police)    ;; n 1 docs 1  e.g. tierB-001600
(GroupOf $x0 potato)    ;; n 1 docs 1  e.g. tierB-000016
(GroupOf $x0 price)    ;; n 1 docs 1  e.g. tierB-001937
(GroupOf $x0 product)    ;; n 1 docs 1  e.g. tierB-000853
(GroupOf $x0 prophecy)    ;; n 1 docs 1  e.g. tierB-000040
(GroupOf $x0 protest)    ;; n 1 docs 1  e.g. tierB-000097
(GroupOf $x0 pterosaur_egg)    ;; n 1 docs 1  e.g. tierB-000658
(GroupOf $x0 queen)    ;; n 1 docs 1  e.g. tierB-000101
(GroupOf $x0 rebel)    ;; n 1 docs 1  e.g. tierB-000485
(GroupOf $x0 region)    ;; n 1 docs 1  e.g. tierB-001903
(GroupOf $x0 relationship)    ;; n 1 docs 1  e.g. tierC-000022
(GroupOf $x0 repair)    ;; n 1 docs 1  e.g. tierB-001436
(GroupOf $x0 reveller)    ;; n 1 docs 1  e.g. tierB-001941
(GroupOf $x0 riot)    ;; n 1 docs 1  e.g. tierB-001669
(GroupOf $x0 room)    ;; n 1 docs 1  e.g. tierB-001378
(GroupOf $x0 root)    ;; n 1 docs 1  e.g. tierB-000714
(GroupOf $x0 rose)    ;; n 1 docs 1  e.g. tierB-001814
(GroupOf $x0 rule)    ;; n 1 docs 1  e.g. tierB-001393
(GroupOf $x0 runner)    ;; n 1 docs 1  e.g. tierB-001860
(GroupOf $x0 salvo)    ;; n 1 docs 1  e.g. tierB-001824
(GroupOf $x0 search)    ;; n 1 docs 1  e.g. tierB-001550
(GroupOf $x0 sentence)    ;; n 1 docs 1  e.g. tierB-000629
(GroupOf $x0 shantytown)    ;; n 1 docs 1  e.g. tierB-000262
(GroupOf $x0 shark)    ;; n 1 docs 1  e.g. tierB-001911
(GroupOf $x0 sheep)    ;; n 1 docs 1  e.g. tierB-001086
(GroupOf $x0 spider)    ;; n 1 docs 1  e.g. tierB-001397
(GroupOf $x0 squirrel)    ;; n 1 docs 1  e.g. tierB-001331
(GroupOf $x0 strawberry)    ;; n 1 docs 1  e.g. tierB-001841
(GroupOf $x0 strawberry_tree_fruit)    ;; n 1 docs 1  e.g. tierB-001434
(GroupOf $x0 student_association)    ;; n 1 docs 1  e.g. tierB-001066
(GroupOf $x0 sunni_community)    ;; n 1 docs 1  e.g. tierC-000118
(GroupOf $x0 swimmer)    ;; n 1 docs 1  e.g. tierB-000402
(GroupOf $x0 switch)    ;; n 1 docs 1  e.g. tierB-001788
(GroupOf $x0 table)    ;; n 1 docs 1  e.g. tierB-000372
(GroupOf $x0 taste_test)    ;; n 1 docs 1  e.g. tierB-001445
(GroupOf $x0 tax)    ;; n 1 docs 1  e.g. tierB-001200
(GroupOf $x0 teacher)    ;; n 1 docs 1  e.g. tierB-001832
(GroupOf $x0 team)    ;; n 1 docs 1  e.g. tierB-001921
(GroupOf $x0 test)    ;; n 1 docs 1  e.g. tierB-000339
(GroupOf $x0 text)    ;; n 1 docs 1  e.g. tierB-001790
(GroupOf $x0 thud)    ;; n 1 docs 1  e.g. tierB-000909
(GroupOf $x0 tide)    ;; n 1 docs 1  e.g. tierB-001283
(GroupOf $x0 tomato)    ;; n 1 docs 1  e.g. tierB-001067
(GroupOf $x0 topic)    ;; n 1 docs 1  e.g. tierB-000034
(GroupOf $x0 total)    ;; n 1 docs 1  e.g. tierB-000643
(GroupOf $x0 towel)    ;; n 1 docs 1  e.g. tierB-000868
(GroupOf $x0 town)    ;; n 1 docs 1  e.g. tierB-000781
(GroupOf $x0 track)    ;; n 1 docs 1  e.g. tierB-000169
(GroupOf $x0 troop)    ;; n 1 docs 1  e.g. tierB-001342
(GroupOf $x0 tuareg)    ;; n 1 docs 1  e.g. tierB-001467
(GroupOf $x0 ukrainian_combat_loss)    ;; n 1 docs 1  e.g. tierB-000965
(GroupOf $x0 underground_channel)    ;; n 1 docs 1  e.g. tierB-000063
(GroupOf $x0 union_boss)    ;; n 1 docs 1  e.g. tierB-001379
(GroupOf $x0 upholstered_chair)    ;; n 1 docs 1  e.g. tierB-001269
(GroupOf $x0 vehicle)    ;; n 1 docs 1  e.g. tierB-000018
(GroupOf $x0 volunteer)    ;; n 1 docs 1  e.g. tierB-001134
(GroupOf $x0 wage_demand)    ;; n 1 docs 1  e.g. tierB-001667
(GroupOf $x0 wave)    ;; n 1 docs 1  e.g. tierB-000561
(GroupOf $x0 wing)    ;; n 1 docs 1  e.g. tierB-001461
(GroupOf $x0 winter_hour)    ;; n 1 docs 1  e.g. tierB-001924
(GroupOf $x0 witness)    ;; n 1 docs 1  e.g. tierB-001262
(GroupOf $x0 wolf)    ;; n 1 docs 1  e.g. tierB-001525
(GroupOf $x0 word)    ;; n 1 docs 1  e.g. tierB-001258
(GroupOf $x0 zombie)    ;; n 1 docs 1  e.g. tierB-001047

;; ---- slot thing.Member  [entity center; head other]  n 108  docs<= 107  distinct 6  eventive 0
(Member $x0 thing)    ;; n 102 docs 101  e.g. tierB-000055 tierB-000080
(And (Member $x0 thing) (Member $x0 widespread))    ;; n 2 docs 2  e.g. tierC-000097 tierC-000098
(And (Member $x0 thing) (Member $x0 time))    ;; n 1 docs 1  e.g. tierB-000839
(And (Member $x0 thing) (Member $x0 true))    ;; n 1 docs 1  e.g. tierB-001778
(And (Member $x0 thing) (Member $x0 whole))    ;; n 1 docs 1  e.g. tierB-000082
(And (Member $x0 thing) (Member $x0 wrong))    ;; n 1 docs 1  e.g. tierB-000859

;; ---- slot <unclassed>.Cardinality  [entity center; head other]  n 65  docs<= 63  distinct 2  eventive 0
(Cardinality $x0 <num>)    ;; n 64 docs 62  e.g. tierB-000101 tierB-000133
(Cardinality $x0 <term:ParticleFromNormal>)    ;; n 1 docs 1  e.g. tierB-001035

;; ---- slot person.Member  [entity center; head other]  n 58  docs<= 58  distinct 3  eventive 0
(Member $x0 person)    ;; n 56 docs 56  e.g. tierB-000316 tierB-000338
(And (Member $x0 person) (Member $x0 president))    ;; n 1 docs 1  e.g. tierC-000053
(And (Member $x0 person) (Member $x0 sorry))    ;; n 1 docs 1  e.g. tierB-001258

;; ---- slot <unclassed>.LocatedIn  [entity center; head other]  n 46  docs<= 50  distinct 41  eventive 0
(LocatedIn $x0 here)    ;; n 3 docs 3  e.g. tierB-000518 tierB-000972
(And (LocatedIn $x0 $x1) (Member $x1 city))    ;; n 2 docs 2  e.g. tierB-000153 tierB-000680
(And (LocatedIn $x0 $x1) (Member $x1 class))    ;; n 2 docs 2  e.g. tierB-000794 tierB-000814
(LocatedIn $x0 derwent_isle)    ;; n 2 docs 2  e.g. tierC-000115 tierC-000116
(And (LocatedIn $x0 $x1) (Member $x1 garden))    ;; n 2 docs 2  e.g. tierB-000760 tierB-001935
(And (LocatedIn $x0 $x1) (Member $x1 southern))    ;; n 2 docs 2  e.g. tierC-000135 tierC-000136
(And (LocatedIn $x0 $x1) (Member $x1 full))    ;; n 3 (mass 1.5) docs 3  e.g. tierB-000796 tierB-001196
(LocatedIn $x0 algiers)    ;; n 1 docs 1  e.g. tierB-000262
(And (LocatedIn $x0 $x1) (Member $x1 ceiling))    ;; n 1 docs 1  e.g. tierB-000687
(And (LocatedIn $x0 $x1) (Member $x1 country))    ;; n 1 docs 1  e.g. tierB-001546
(LocatedIn $x0 dianchi_lake)    ;; n 1 docs 1  e.g. tierC-000314
(LocatedIn $x0 el_harrach)    ;; n 1 docs 1  e.g. tierB-001550
(And (LocatedIn $x0 $x1) (Member $x1 film))    ;; n 1 docs 1  e.g. tierB-001295
(And (LocatedIn $x0 $x1) (Member $x1 floor))    ;; n 1 docs 1  e.g. tierB-000687
(LocatedIn $x0 gaul)    ;; n 1 docs 1  e.g. tierB-001371
(And (LocatedIn $x0 $x1) (Member $x1 house))    ;; n 1 docs 1  e.g. tierB-001690
(LocatedIn $x0 huancavelica)    ;; n 1 docs 1  e.g. tierC-000191
(LocatedIn $x0 india)    ;; n 1 docs 1  e.g. tierB-001173
(LocatedIn $x0 japan)    ;; n 1 docs 1  e.g. tierB-000364
(LocatedIn $x0 loglan)    ;; n 1 docs 1  e.g. tierB-000519
(LocatedIn $x0 lojban)    ;; n 1 docs 1  e.g. tierB-000519
(And (LocatedIn $x0 $x1) (Member $x1 market))    ;; n 1 docs 1  e.g. tierB-001018
(And (LocatedIn $x0 $x1) (Member $x1 ocean))    ;; n 1 docs 1  e.g. tierB-000573
(And (LocatedIn $x0 $x1) (Member $x1 park))    ;; n 1 docs 1  e.g. tierB-001331
(LocatedIn $x0 peru)    ;; n 1 docs 1  e.g. tierC-000192
(And (LocatedIn $x0 $x1) (Member $x1 play))    ;; n 1 docs 1  e.g. tierB-000523
(LocatedIn $x0 russian_far_east)    ;; n 1 docs 1  e.g. tierB-001730
(And (LocatedIn $x0 $x1) (Member $x1 storeroom))    ;; n 1 docs 1  e.g. tierB-000372
(And (LocatedIn $x0 $x1) (Member $x1 street))    ;; n 1 docs 1  e.g. tierB-001111
(And (LocatedIn $x0 $x1) (Member $x1 table))    ;; n 1 docs 1  e.g. tierB-001492
(LocatedIn $x0 tatoeba)    ;; n 1 docs 1  e.g. tierB-000422
(And (LocatedIn $x0 $x1) (Member $x1 tree))    ;; n 1 docs 1  e.g. tierB-001633
(LocatedIn $x0 uk)    ;; n 1 docs 1  e.g. tierB-000467
(And (LocatedIn $x0 $x1) (Member $x1 village))    ;; n 1 docs 1  e.g. tierB-000116
(And (LocatedIn $x0 $x1) (Member $x1 wall))    ;; n 1 docs 1  e.g. tierB-001788
(And (LocatedIn $x0 $x1) (Member $x1 world))    ;; n 1 docs 1  e.g. tierB-001477
(And (LocatedIn $x0 $x1) (Member $x1 basket))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000019
(And (LocatedIn $x0 $x1) (Member $x1 fountain))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001760
(And (LocatedIn $x0 $x1) (Member $x1 kitchen_sink))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000796
(And (LocatedIn $x0 $x1) (Member $x1 place))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001196
(And (LocatedIn $x0 $x1) (Member $x1 red))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000019

;; ---- slot have.Member  [event center; head other]  n 43  docs<= 43  distinct 1  eventive 0
(Member $e0 have)    ;; n 43 docs 43  e.g. tierB-000066 tierB-000142

;; ---- slot <unclassed>.Possession  [entity center; head other]  n 30  docs<= 34  distinct 23  eventive 0
(And (Possession $x0 $x1) (Member $x1 person))    ;; n 5 docs 5  e.g. tierC-000127 tierC-000128
(Possession $x0 free_soil_party)    ;; n 4 docs 4  e.g. tierC-000159 tierC-000160
(Possession $x0 republican_party)    ;; n 4 docs 4  e.g. tierC-000159 tierC-000160
(Possession $x0 subsequent_game)    ;; n 2 docs 2  e.g. tierC-000173 tierC-000174
(And (Possession $x0 $x1) (Member $x1 country))    ;; n 1 docs 1  e.g. tierB-001928
(Possession $x0 dora_smith)    ;; n 1 docs 1  e.g. tierC-000290
(Possession $x0 god)    ;; n 1 docs 1  e.g. tierB-000040
(Possession $x0 islamic_ivory)    ;; n 1 docs 1  e.g. tierC-000113
(Possession $x0 jupiter)    ;; n 1 docs 1  e.g. tierB-001769
(Possession $x0 logical_phrase)    ;; n 1 docs 1  e.g. tierC-000021
(Possession $x0 logical_proposition)    ;; n 1 docs 1  e.g. tierC-000022
(Possession $x0 radical_group)    ;; n 1 docs 1  e.g. tierB-001800
(And (Possession $x0 $x1) (Member $x1 sunni_community))    ;; n 1 docs 1  e.g. tierC-000118
(And (Possession $x0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierC-000339
(Possession $x0 twilight)    ;; n 1 docs 1  e.g. tierC-000043
(And (Possession $x0 $x1) (Member $x1 union))    ;; n 1 docs 1  e.g. tierB-001667
(Possession $x0 yunnan)    ;; n 1 docs 1  e.g. tierC-000313
(And (Possession $x0 $x1) (Member $x1 easy))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000246
(And (Possession $x0 $x1) (Member $x1 generalization))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000246
(And (Possession $x0 $x1) (Member $x1 community))    ;; n 1 (mass 0.25) docs 1  e.g. tierC-000117
(And (Possession $x0 $x1) (Member $x1 neighbouring))    ;; n 1 (mass 0.25) docs 1  e.g. tierC-000117
(And (Possession $x0 $x1) (Member $x1 other))    ;; n 1 (mass 0.25) docs 1  e.g. tierC-000117
(And (Possession $x0 $x1) (Member $x1 sunni))    ;; n 1 (mass 0.25) docs 1  e.g. tierC-000117

;; ---- slot house.Member  [entity center; head other]  n 25  docs<= 25  distinct 6  eventive 0
(Member $x0 house)    ;; n 18 docs 18  e.g. tierB-000048 tierB-000293
(And (Member $x0 house) (Member $x0 large))    ;; n 3 docs 3  e.g. tierB-000048 tierC-000115
(And (Member $x0 house) (Member $x0 isolated))    ;; n 1 docs 1  e.g. tierB-000524
(And (Member $x0 house) (Member $x0 listed_building))    ;; n 1 docs 1  e.g. tierC-000116
(And (Member $x0 house) (Member $x0 muslim))    ;; n 1 docs 1  e.g. tierC-000095
(And (Member $x0 house) (Member $x0 old))    ;; n 1 docs 1  e.g. tierB-000471

;; ---- slot use.Member  [event center; head other]  n 24  docs<= 22  distinct 2  eventive 0
(Member $e0 use)    ;; n 23 docs 21  e.g. tierB-000089 tierB-000268
(And (Member $e0 use) (Member $e0 way))    ;; n 1 docs 1  e.g. tierB-000282

;; ---- slot start.Member  [event center; head other]  n 22  docs<= 21  distinct 1  eventive 0
(Member $e0 start)    ;; n 22 docs 21  e.g. tierB-000043 tierB-000192

;; ---- slot good.Member  [entity center; head other]  n 21  docs<= 20  distinct 11  eventive 0
(Member $x0 good)    ;; n 10 docs 9  e.g. tierB-000023 tierB-000024
(And (Member $x0 good) (Member $x0 omen))    ;; n 2 docs 2  e.g. tierB-000023 tierB-000527
(And (Member $x0 good) (Member $x0 health))    ;; n 1 docs 1  e.g. tierB-001844
(And (Member $x0 good) (Member $x0 learning_environment))    ;; n 1 docs 1  e.g. tierB-001805
(And (Member $x0 good) (Member $x0 question))    ;; n 1 docs 1  e.g. tierB-001294
(And (Member $x0 good) (Member $x0 rat))    ;; n 1 docs 1  e.g. tierB-000024
(And (Member $x0 good) (Member $x0 reply))    ;; n 1 docs 1  e.g. tierB-001294
(And (Member $x0 good) (Member $x0 school))    ;; n 1 docs 1  e.g. tierB-000546
(And (Member $x0 good) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierB-000023
(And (Member $x0 good) (Member $x0 water))    ;; n 1 docs 1  e.g. tierB-000993
(And (Member $x0 good) (Member $x0 weather))    ;; n 1 docs 1  e.g. tierB-001499

;; ---- slot make.Member  [event center; head other]  n 21  docs<= 21  distinct 1  eventive 0
(Member $e0 make)    ;; n 21 docs 21  e.g. tierB-000025 tierB-000073

;; ---- slot big.Member  [entity center; head other]  n 19  docs<= 19  distinct 9  eventive 0
(Member $x0 big)    ;; n 10 docs 10  e.g. tierB-000083 tierB-000214
(And (Member $x0 big) (Member $x0 cat_fight))    ;; n 2 docs 2  e.g. tierC-000019 tierC-000020
(And (Member $x0 big) (Member $x0 box))    ;; n 1 docs 1  e.g. tierB-000083
(And (Member $x0 big) (Member $x0 cobweb))    ;; n 1 docs 1  e.g. tierB-000912
(And (Member $x0 big) (Member $x0 deal))    ;; n 1 docs 1  e.g. tierB-000214
(And (Member $x0 big) (Member $x0 difference))    ;; n 1 docs 1  e.g. tierB-001831
(And (Member $x0 big) (Member $x0 fire))    ;; n 1 docs 1  e.g. tierB-000890
(And (Member $x0 big) (Member $x0 project))    ;; n 1 docs 1  e.g. tierB-000746
(And (Member $x0 big) (Member $x0 snowman))    ;; n 1 docs 1  e.g. tierB-001457

;; ---- slot beautiful.Member  [entity center; head other]  n 18  docs<= 18  distinct 10  eventive 0
(Member $x0 beautiful)    ;; n 9 docs 9  e.g. tierB-000872 tierB-000904
(And (Member $x0 beautiful) (Member $x0 earth))    ;; n 1 docs 1  e.g. tierB-001259
(And (Member $x0 beautiful) (Member $x0 flower))    ;; n 1 docs 1  e.g. tierB-000872
(And (Member $x0 beautiful) (Member $x0 garden))    ;; n 1 docs 1  e.g. tierB-001016
(And (Member $x0 beautiful) (Member $x0 girl))    ;; n 1 docs 1  e.g. tierB-001822
(And (Member $x0 beautiful) (Member $x0 moon))    ;; n 1 docs 1  e.g. tierB-000904
(And (Member $x0 beautiful) (Member $x0 mountain_scenery))    ;; n 1 docs 1  e.g. tierB-001500
(And (Member $x0 beautiful) (Member $x0 planet))    ;; n 1 docs 1  e.g. tierB-001259
(And (Member $x0 beautiful) (Member $x0 room))    ;; n 1 docs 1  e.g. tierB-001920
(And (Member $x0 beautiful) (Member $x0 view))    ;; n 1 docs 1  e.g. tierB-001466

;; ---- slot build.Member  [event center; head other]  n 18  docs<= 13  distinct 1  eventive 0
(Member $e0 build)    ;; n 18 docs 13  e.g. tierB-000063 tierB-000932

;; ---- slot door.Member  [entity center; head other]  n 18  docs<= 18  distinct 5  eventive 0
(Member $x0 door)    ;; n 14 docs 14  e.g. tierB-000056 tierB-000425
(And (Member $x0 door) (Member $x0 locked))    ;; n 1 docs 1  e.g. tierB-000880
(And (Member $x0 door) (Member $x0 open))    ;; n 1 docs 1  e.g. tierB-000425
(And (Member $x0 door) (Member $x0 unlocked))    ;; n 1 docs 1  e.g. tierB-000747
(And (Member $x0 door) (Member $x0 vault_like))    ;; n 1 docs 1  e.g. tierB-000056

;; ---- slot go.Member  [event center; head other]  n 17  docs<= 16  distinct 1  eventive 0
(Member $e0 go)    ;; n 17 docs 16  e.g. tierB-000012 tierB-000115

;; ---- slot man.Member  [entity center; head other]  n 16  docs<= 16  distinct 5  eventive 0
(Member $x0 man)    ;; n 11 docs 11  e.g. tierB-000793 tierB-001182
(And (Member $x0 man) (Member $x0 young))    ;; n 2 docs 2  e.g. tierB-001773 tierB-001870
(And (Member $x0 man) (Member $x0 naked))    ;; n 1 docs 1  e.g. tierB-001593
(And (Member $x0 man) (Member $x0 old))    ;; n 1 docs 1  e.g. tierB-001316
(And (Member $x0 man) (Member $x0 poor))    ;; n 1 docs 1  e.g. tierB-001568

;; ---- slot room.Member  [entity center; head other]  n 16  docs<= 15  distinct 1  eventive 0
(Member $x0 room)    ;; n 16 docs 15  e.g. tierB-000263 tierB-000344

;; ---- slot bad.Member  [entity center; head other]  n 14  docs<= 14  distinct 6  eventive 0
(Member $x0 bad)    ;; n 7 docs 7  e.g. tierB-000748 tierB-000790
(And (Member $x0 bad) (Member $x0 relationship))    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242
(And (Member $x0 bad) (Member $x0 weather))    ;; n 2 docs 2  e.g. tierB-000748 tierB-000790
(And (Member $x0 bad) (Member $x0 matter))    ;; n 1 docs 1  e.g. tierB-001594
(And (Member $x0 bad) (Member $x0 problem))    ;; n 1 docs 1  e.g. tierB-001910
(And (Member $x0 bad) (Member $x0 road))    ;; n 1 docs 1  e.g. tierB-001958

;; ---- slot begin.Member  [event center; head other]  n 14  docs<= 12  distinct 1  eventive 0
(Member $e0 begin)    ;; n 14 docs 12  e.g. tierB-000075 tierB-000173

;; ---- slot get.Member  [event center; head other]  n 14  docs<= 13  distinct 1  eventive 0
(Member $e0 get)    ;; n 14 docs 13  e.g. tierB-000206 tierB-000370

;; ---- slot <unclassed>.SubsetOf  [entity center; head other]  n 13  docs<= 13  distinct 12  eventive 0
(And (SubsetOf $x0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierB-000196 tierB-000467
(And (SubsetOf $x0 $x1) (Member $x1 centipede))    ;; n 1 docs 1  e.g. tierB-000772
(And (SubsetOf $x0 $x1) (Member $x1 chick))    ;; n 1 docs 1  e.g. tierB-000779
(And (SubsetOf $x0 $x1) (Member $x1 corner))    ;; n 1 docs 1  e.g. tierB-001299
(And (SubsetOf $x0 $x1) (Member $x1 girl))    ;; n 1 docs 1  e.g. tierB-000133
(And (SubsetOf $x0 $x1) (Member $x1 mayan_book))    ;; n 1 docs 1  e.g. tierB-000799
(And (SubsetOf $x0 $x1) (Member $x1 plane))    ;; n 1 docs 1  e.g. tierB-000761
(And (SubsetOf $x0 $x1) (Member $x1 pupil))    ;; n 1 docs 1  e.g. tierB-001628
(And (SubsetOf $x0 $x1) (Member $x1 refugee))    ;; n 1 docs 1  e.g. tierB-001035
(And (SubsetOf $x0 $x1) (Member $x1 shop))    ;; n 1 docs 1  e.g. tierB-001111
(And (SubsetOf $x0 $x1) (Member $x1 villager))    ;; n 1 docs 1  e.g. tierB-000124
(And (SubsetOf $x0 $x1) (Member $x1 window))    ;; n 1 docs 1  e.g. tierB-000320

;; ---- slot car.Member  [entity center; head other]  n 13  docs<= 13  distinct 5  eventive 0
(Member $x0 car)    ;; n 9 docs 9  e.g. tierB-000083 tierB-000190
(And (Member $x0 car) (Member $x0 dark_blue))    ;; n 1 docs 1  e.g. tierB-001248
(And (Member $x0 car) (Member $x0 model))    ;; n 1 docs 1  e.g. tierB-001458
(And (Member $x0 car) (Member $x0 new))    ;; n 1 docs 1  e.g. tierB-001693
(And (Member $x0 car) (Member $x0 shiny))    ;; n 1 docs 1  e.g. tierB-000447

;; ---- slot company.Member  [entity center; head other]  n 13  docs<= 13  distinct 1  eventive 0
(Member $x0 company)    ;; n 13 docs 13  e.g. tierB-000762 tierB-000853

;; ---- slot play.Member  [event center; head other]  n 13  docs<= 13  distinct 1  eventive 0
(Member $e0 play)    ;; n 13 docs 13  e.g. tierB-000089 tierB-000160

;; ---- slot become.Member  [event center; head other]  n 12  docs<= 12  distinct 1  eventive 0
(Member $e0 become)    ;; n 12 docs 12  e.g. tierB-000352 tierB-000740

;; ---- slot book.Member  [entity center; head other]  n 12  docs<= 11  distinct 2  eventive 0
(Member $x0 book)    ;; n 11 docs 10  e.g. tierB-000295 tierB-000458
(And (Member $x0 book) (Member $x0 worth_every_penny))    ;; n 1 docs 1  e.g. tierB-000773

;; ---- slot come.Member  [event center; head other]  n 12  docs<= 12  distinct 1  eventive 0
(Member $e0 come)    ;; n 12 docs 12  e.g. tierB-000152 tierB-000238

;; ---- slot study.Member  [event center; head other]  n 12  docs<= 11  distinct 1  eventive 0
(Member $e0 study)    ;; n 12 docs 11  e.g. tierB-000203 tierB-000225

;; ---- slot take.Member  [event center; head other]  n 12  docs<= 12  distinct 1  eventive 0
(Member $e0 take)    ;; n 12 docs 12  e.g. tierB-000252 tierB-000309

;; ---- slot <unclassed>.PartOf  [entity center; head other]  n 11  docs<= 12  distinct 11  eventive 0
(PartOf $x0 khurda_road)    ;; n 2 docs 2  e.g. tierC-000105 tierC-000106
(And (PartOf $x0 $x1) (Member $x1 animal))    ;; n 1 docs 1  e.g. tierB-001461
(And (PartOf $x0 $x1) (Member $x1 cake))    ;; n 1 docs 1  e.g. tierB-001518
(PartOf $x0 islamic_ivory)    ;; n 1 docs 1  e.g. tierC-000114
(And (PartOf $x0 $x1) (Member $x1 ivy))    ;; n 1 docs 1  e.g. tierB-001246
(And (PartOf $x0 $x1) (Member $x1 plant))    ;; n 1 docs 1  e.g. tierB-000714
(And (PartOf $x0 $x1) (Member $x1 play))    ;; n 1 docs 1  e.g. tierB-001932
(And (PartOf $x0 $x1) (Member $x1 student_association))    ;; n 1 docs 1  e.g. tierB-001066
(PartOf $x0 yunnan)    ;; n 1 docs 1  e.g. tierC-000314
(And (PartOf $x0 $x1) (Member $x1 road))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001966
(And (PartOf $x0 $x1) (Member $x1 street))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001966

;; ---- slot cat.Member  [entity center; head other]  n 11  docs<= 11  distinct 2  eventive 0
(Member $x0 cat)    ;; n 10 docs 10  e.g. tierB-000024 tierB-000073
(And (Member $x0 cat) (Member $x0 good))    ;; n 1 docs 1  e.g. tierB-000024

;; ---- slot huge.Member  [entity center; head other]  n 11  docs<= 11  distinct 7  eventive 0
(Member $x0 huge)    ;; n 5 docs 5  e.g. tierB-000230 tierB-000576
(And (Member $x0 huge) (Member $x0 inequality))    ;; n 1 docs 1  e.g. tierB-001206
(And (Member $x0 huge) (Member $x0 parent))    ;; n 1 docs 1  e.g. tierB-001987
(And (Member $x0 huge) (Member $x0 responsibility))    ;; n 1 docs 1  e.g. tierB-001987
(And (Member $x0 huge) (Member $x0 spider))    ;; n 1 docs 1  e.g. tierB-000230
(And (Member $x0 huge) (Member $x0 sport_bag))    ;; n 1 docs 1  e.g. tierB-000576
(And (Member $x0 huge) (Member $x0 stir))    ;; n 1 docs 1  e.g. tierB-001875

;; ---- slot kill.Member  [event center; head other]  n 11  docs<= 9  distinct 1  eventive 0
(Member $e0 kill)    ;; n 11 docs 9  e.g. tierB-000067 tierB-000393

;; ---- slot produce.Member  [event center; head other]  n 11  docs<= 9  distinct 1  eventive 0
(Member $e0 produce)    ;; n 11 docs 9  e.g. tierB-000208 tierB-001358

;; ---- slot serve.Member  [event center; head other]  n 11  docs<= 8  distinct 1  eventive 0
(Member $e0 serve)    ;; n 11 docs 8  e.g. tierB-000864 tierB-000910

;; ---- slot table.Member  [entity center; head other]  n 11  docs<= 11  distinct 1  eventive 0
(Member $x0 table)    ;; n 11 docs 11  e.g. tierB-000016 tierB-000047

;; ---- slot work.Member  [event center; head other]  n 11  docs<= 11  distinct 1  eventive 0
(Member $e0 work)    ;; n 11 docs 11  e.g. tierB-000144 tierB-000212

;; ---- slot blue.Member  [entity center; head other]  n 10  docs<= 10  distinct 4  eventive 0
(Member $x0 blue)    ;; n 5 docs 5  e.g. tierB-000367 tierB-000937
(And (Member $x0 blue) (Member $x0 sky))    ;; n 3 docs 3  e.g. tierB-000937 tierB-001124
(And (Member $x0 blue) (Member $x0 curtain))    ;; n 1 docs 1  e.g. tierB-001264
(And (Member $x0 blue) (Member $x0 shirt))    ;; n 1 docs 1  e.g. tierB-000367

;; ---- slot find.Member  [event center; head other]  n 10  docs<= 10  distinct 1  eventive 0
(Member $e0 find)    ;; n 10 docs 10  e.g. tierB-000579 tierB-000585

;; ---- slot follow.Member  [event center; head other]  n 10  docs<= 10  distinct 1  eventive 0
(Member $e0 follow)    ;; n 10 docs 10  e.g. tierB-000026 tierB-000231

;; ---- slot leave.Member  [event center; head other]  n 10  docs<= 10  distinct 1  eventive 0
(Member $e0 leave)    ;; n 10 docs 10  e.g. tierB-000004 tierB-000100

;; ---- slot tree.Member  [entity center; head other]  n 10  docs<= 9  distinct 1  eventive 0
(Member $x0 tree)    ;; n 10 docs 9  e.g. tierB-000176 tierB-000277

;; ---- slot try.Member  [event center; head other]  n 10  docs<= 10  distinct 1  eventive 0
(Member $e0 try)    ;; n 10 docs 10  e.g. tierB-000117 tierB-000216

;; ---- slot write.Member  [event center; head other]  n 10  docs<= 10  distinct 1  eventive 0
(Member $e0 write)    ;; n 10 docs 10  e.g. tierB-000971 tierB-001004

;; ---- slot city.Member  [entity center; head other]  n 9  docs<= 9  distinct 1  eventive 0
(Member $x0 city)    ;; n 9 docs 9  e.g. tierB-000153 tierB-000546

;; ---- slot clear.Member  [entity center; head other]  n 9  docs<= 9  distinct 4  eventive 0
(Member $x0 clear)    ;; n 4 docs 4  e.g. tierB-000782 tierB-001093
(And (Member $x0 clear) (Member $x0 distinction))    ;; n 2 docs 2  e.g. tierC-000221 tierC-000222
(And (Member $x0 clear) (Member $x0 important))    ;; n 2 docs 2  e.g. tierC-000221 tierC-000222
(And (Member $x0 clear) (Member $x0 water))    ;; n 1 docs 1  e.g. tierB-000782

;; ---- slot close.Member  [event center; head other]  n 9  docs<= 7  distinct 2  eventive 0
(Member $e0 close)    ;; n 8 docs 6  e.g. tierB-000079 tierB-000188
(And (Member $e0 close) (Member $e0 watch))    ;; n 1 docs 1  e.g. tierB-001205

;; ---- slot fall.Member  [event center; head other]  n 9  docs<= 9  distinct 1  eventive 0
(Member $e0 fall)    ;; n 9 docs 9  e.g. tierB-000194 tierB-000456

;; ---- slot hear.Member  [event center; head other]  n 9  docs<= 9  distinct 1  eventive 0
(Member $e0 hear)    ;; n 9 docs 9  e.g. tierB-000176 tierB-000189

;; ---- slot live.Member  [event center; head other]  n 9  docs<= 8  distinct 1  eventive 0
(Member $e0 live)    ;; n 9 docs 8  e.g. tierB-000048 tierB-000371

;; ---- slot need.Member  [event center; head other]  n 9  docs<= 9  distinct 1  eventive 0
(Member $e0 need)    ;; n 9 docs 9  e.g. tierB-000061 tierB-000086

;; ---- slot open.Member  [event center; head other]  n 9  docs<= 9  distinct 1  eventive 0
(Member $e0 open)    ;; n 9 docs 9  e.g. tierB-000056 tierB-000302

;; ---- slot problem.Member  [entity center; head other]  n 9  docs<= 9  distinct 2  eventive 0
(Member $x0 problem)    ;; n 8 docs 8  e.g. tierB-000307 tierB-000650
(And (Member $x0 problem) (Member $x0 water))    ;; n 1 docs 1  e.g. tierB-000650

;; ---- slot sing.Member  [event center; head other]  n 9  docs<= 7  distinct 1  eventive 0
(Member $e0 sing)    ;; n 9 docs 7  e.g. tierB-000827 tierB-001156

;; ---- slot sleep.Member  [event center; head other]  n 9  docs<= 9  distinct 1  eventive 0
(Member $e0 sleep)    ;; n 9 docs 9  e.g. tierB-001003 tierB-001302

;; ---- slot become.Result  [event center; head other]  n 8  docs<= 8  distinct 7  eventive 8
(And (Member $e0 become) (Result $e0 $e1) (Member $e1 bad))    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242
(And (Member $e0 become) (Result $e0 $e1) (Member $e1 alarmed))    ;; n 1 docs 1  e.g. tierB-001079
(And (Member $e0 become) (Result $e0 $e1) (Member $e1 conservative))    ;; n 1 docs 1  e.g. tierB-001817
(And (Member $e0 become) (Result $e0 $e1) (Member $e1 indigenous))    ;; n 1 docs 1  e.g. tierC-000001
(And (Member $e0 become) (Result $e0 $e1) (Member $e1 inomaru))    ;; n 1 docs 1  e.g. tierC-000237
(And (Member $e0 become) (Result $e0 $e1) (Member $e1 lax))    ;; n 1 docs 1  e.g. tierC-000158
(And (Member $e0 become) (Result $e0 $e1) (Member $e1 red))    ;; n 1 docs 1  e.g. tierB-001582

;; ---- slot brown.Member  [entity center; head other]  n 8  docs<= 7  distinct 5  eventive 0
(Member $x0 brown)    ;; n 3 docs 2  e.g. tierB-000871 tierB-001551
(And (Member $x0 brown) (Member $x0 dog))    ;; n 2 docs 2  e.g. tierB-000871 tierB-001551
(And (Member $x0 brown) (Member $x0 fox))    ;; n 1 docs 1  e.g. tierB-000871
(And (Member $x0 brown) (Member $x0 lazy))    ;; n 1 docs 1  e.g. tierB-000871
(And (Member $x0 brown) (Member $x0 quick))    ;; n 1 docs 1  e.g. tierB-000871

;; ---- slot change.Member  [event center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $e0 change)    ;; n 8 docs 8  e.g. tierB-000098 tierB-000139

;; ---- slot hotel.Member  [entity center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $x0 hotel)    ;; n 8 docs 8  e.g. tierB-000149 tierB-000767

;; ---- slot light.Member  [entity center; head other]  n 8  docs<= 8  distinct 3  eventive 0
(Member $x0 light)    ;; n 6 docs 6  e.g. tierB-000561 tierB-000685
(And (Member $x0 light) (Member $x0 outside))    ;; n 1 docs 1  e.g. tierB-000685
(And (Member $x0 light) (Member $x0 rhythm))    ;; n 1 docs 1  e.g. tierB-001556

;; ---- slot movie.Member  [entity center; head other]  n 8  docs<= 8  distinct 3  eventive 0
(Member $x0 movie)    ;; n 6 docs 6  e.g. tierB-000520 tierB-001253
(And (Member $x0 movie) (Member $x0 swords_and_sorcery))    ;; n 1 docs 1  e.g. tierB-001965
(And (Member $x0 movie) (Member $x0 upcoming))    ;; n 1 docs 1  e.g. tierB-001253

;; ---- slot new.Member  [entity center; head other]  n 8  docs<= 8  distinct 4  eventive 0
(Member $x0 new)    ;; n 5 docs 5  e.g. tierB-000958 tierB-001113
(And (Member $x0 new) (Member $x0 playground))    ;; n 1 docs 1  e.g. tierB-001867
(And (Member $x0 new) (Member $x0 product))    ;; n 1 docs 1  e.g. tierB-001113
(And (Member $x0 new) (Member $x0 tablet))    ;; n 1 docs 1  e.g. tierB-001460

;; ---- slot park.Member  [entity center; head other]  n 8  docs<= 8  distinct 2  eventive 0
(Member $x0 park)    ;; n 7 docs 7  e.g. tierB-000569 tierB-001239
(And (Member $x0 park) (Member $x0 wooded))    ;; n 1 docs 1  e.g. tierB-000569

;; ---- slot road.Member  [entity center; head other]  n 8  docs<= 8  distinct 2  eventive 0
(Member $x0 road)    ;; n 7 docs 7  e.g. tierB-000294 tierB-000468
(And (Member $x0 road) (Member $x0 street))    ;; n 1 docs 1  e.g. tierB-001966

;; ---- slot sell.Member  [event center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $e0 sell)    ;; n 8 docs 8  e.g. tierB-000257 tierB-000326

;; ---- slot song.Member  [entity center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $x0 song)    ;; n 8 docs 8  e.g. tierB-000768 tierB-001156

;; ---- slot speak.Member  [event center; head other]  n 8  docs<= 6  distinct 1  eventive 0
(Member $e0 speak)    ;; n 8 docs 6  e.g. tierB-000053 tierB-000271

;; ---- slot talk.Member  [event center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $e0 talk)    ;; n 8 docs 8  e.g. tierB-000078 tierB-000327

;; ---- slot town.Member  [entity center; head other]  n 8  docs<= 8  distinct 2  eventive 0
(Member $x0 town)    ;; n 7 docs 7  e.g. tierB-000408 tierB-000739
(And (Member $x0 town) (Member $x0 unknown))    ;; n 1 docs 1  e.g. tierB-001543

;; ---- slot walk.Member  [event center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $e0 walk)    ;; n 8 docs 8  e.g. tierB-000036 tierB-000148

;; ---- slot want.Member  [event center; head other]  n 8  docs<= 7  distinct 1  eventive 0
(Member $e0 want)    ;; n 8 docs 7  e.g. tierB-000250 tierB-000626

;; ---- slot weather.Member  [entity center; head other]  n 8  docs<= 8  distinct 1  eventive 0
(Member $x0 weather)    ;; n 8 docs 8  e.g. tierB-000351 tierB-000429

;; ---- slot appear.Member  [event center; head other]  n 7  docs<= 5  distinct 1  eventive 0
(Member $e0 appear)    ;; n 7 docs 5  e.g. tierB-001940 tierC-000050

;; ---- slot beauty.Member  [entity center; head other]  n 7  docs<= 7  distinct 3  eventive 0
(Member $x0 beauty)    ;; n 4 docs 4  e.g. tierB-000376 tierB-000678
(And (Member $x0 beauty) (Member $x0 beyond_description))    ;; n 2 docs 2  e.g. tierB-000678 tierB-001503
(And (Member $x0 beauty) (Member $x0 true))    ;; n 1 docs 1  e.g. tierB-000376

;; ---- slot black.Member  [entity center; head other]  n 7  docs<= 7  distinct 4  eventive 0
(Member $x0 black)    ;; n 4 docs 4  e.g. tierB-000476 tierB-000541
(And (Member $x0 black) (Member $x0 box))    ;; n 1 docs 1  e.g. tierB-000541
(And (Member $x0 black) (Member $x0 ceiling))    ;; n 1 docs 1  e.g. tierB-000476
(And (Member $x0 black) (Member $x0 toast))    ;; n 1 docs 1  e.g. tierB-001882

;; ---- slot boy.Member  [entity center; head other]  n 7  docs<= 7  distinct 2  eventive 0
(Member $x0 boy)    ;; n 6 docs 6  e.g. tierB-000305 tierB-000337
(And (Member $x0 boy) (Member $x0 tall))    ;; n 1 docs 1  e.g. tierB-001285

;; ---- slot child.Member  [entity center; head other]  n 7  docs<= 7  distinct 2  eventive 0
(Member $x0 child)    ;; n 6 docs 6  e.g. tierB-000160 tierB-001021
(And (Member $x0 child) (Member $x0 drowning))    ;; n 1 docs 1  e.g. tierB-001285

;; ---- slot complex.Member  [entity center; head other]  n 7  docs<= 7  distinct 4  eventive 0
(Member $x0 complex)    ;; n 3 docs 3  e.g. tierB-000391 tierC-000163
(And (Member $x0 complex) (Member $x0 simple))    ;; n 2 docs 2  e.g. tierC-000163 tierC-000164
(And (Member $x0 complex) (Member $x0 grim))    ;; n 1 docs 1  e.g. tierB-000391
(And (Member $x0 complex) (Member $x0 situation))    ;; n 1 docs 1  e.g. tierB-000391

;; ---- slot computer.Member  [entity center; head other]  n 7  docs<= 6  distinct 3  eventive 0
(Member $x0 computer)    ;; n 5 docs 4  e.g. tierB-000504 tierB-000849
(And (Member $x0 computer) (Member $x0 new))    ;; n 1 docs 1  e.g. tierB-001834
(And (Member $x0 computer) (Member $x0 old))    ;; n 1 docs 1  e.g. tierB-001834

;; ---- slot contain.Member  [event center; head other]  n 7  docs<= 5  distinct 1  eventive 0
(Member $e0 contain)    ;; n 7 docs 5  e.g. tierB-000101 tierB-000454

;; ---- slot create.Member  [event center; head other]  n 7  docs<= 5  distinct 1  eventive 0
(Member $e0 create)    ;; n 7 docs 5  e.g. tierB-000089 tierB-000728

;; ---- slot do.Member  [event center; head other]  n 7  docs<= 7  distinct 2  eventive 0
(Member $e0 do)    ;; n 6 docs 6  e.g. tierB-001236 tierB-001520
(And (Member $e0 do) (Member $e0 fun))    ;; n 1 docs 1  e.g. tierB-001236

;; ---- slot dog.Member  [entity center; head other]  n 7  docs<= 7  distinct 1  eventive 0
(Member $x0 dog)    ;; n 7 docs 7  e.g. tierB-000340 tierB-000537

;; ---- slot food.Member  [entity center; head other]  n 7  docs<= 7  distinct 2  eventive 0
(Member $x0 food)    ;; n 6 docs 6  e.g. tierB-000009 tierB-000368
(And (Member $x0 food) (Member $x0 tasteful))    ;; n 1 docs 1  e.g. tierB-001311

;; ---- slot garden.Member  [entity center; head other]  n 7  docs<= 7  distinct 1  eventive 0
(Member $x0 garden)    ;; n 7 docs 7  e.g. tierB-000322 tierB-000615

;; ---- slot help.Member  [event center; head other]  n 7  docs<= 7  distinct 1  eventive 0
(Member $e0 help)    ;; n 7 docs 7  e.g. tierB-000299 tierB-000319

;; ---- slot line.Member  [entity center; head other]  n 7  docs<= 5  distinct 2  eventive 0
(Member $x0 line)    ;; n 6 docs 4  e.g. tierB-000172 tierB-001120
(And (Member $x0 line) (Member $x0 long))    ;; n 1 docs 1  e.g. tierB-001120

;; ---- slot make.Result  [event center; head other]  n 7  docs<= 8  distinct 8  eventive 7
(And (Member $e0 make) (Result $e0 $e1) (Member $e1 bad))    ;; n 1 docs 1  e.g. tierB-001594
(And (Member $e0 make) (Result $e0 $e1) (Member $e1 beautiful))    ;; n 1 docs 1  e.g. tierB-001920
(And (Member $e0 make) (Result $e0 $e1) (Member $e1 hazardous))    ;; n 1 docs 1  e.g. tierB-001754
(And (Member $e0 make) (Result $e0 $e1) (Member $e1 king))    ;; n 1 docs 1  e.g. tierB-001809
(And (Member $e0 make) (Result $e0 $e1) (Member $e1 uncomfortable))    ;; n 1 docs 1  e.g. tierB-000325
(And (Member $e0 make) (Result $e0 $e1) (Member $e1 white))    ;; n 1 docs 1  e.g. tierB-001431
(And (Member $e0 make) (Result $e0 $e1) (Member $e1 backward))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001504
(And (Member $e0 make) (Result $e0 $e1) (Member $e1 country))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001504

;; ---- slot turn.Member  [event center; head other]  n 7  docs<= 7  distinct 1  eventive 0
(Member $e0 turn)    ;; n 7 docs 7  e.g. tierB-000018 tierB-000476

;; ---- slot win.Member  [event center; head other]  n 7  docs<= 7  distinct 1  eventive 0
(Member $e0 win)    ;; n 7 docs 7  e.g. tierB-000145 tierB-000730

;; ---- slot <unclassed>.Only  [entity center; head other]  n 6  docs<= 6  distinct 4  eventive 6
(And (Only $x0 $e1) (Member $e1 find))    ;; n 2 docs 2  e.g. tierC-000313 tierC-000314
(And (Only $x0 $e1) (Member $e1 have))    ;; n 2 docs 2  e.g. tierB-000797 tierB-001553
(And (Only $x0 $e1) (Member $e1 like))    ;; n 1 docs 1  e.g. tierB-001485
(And (Only $x0 $e1) (Member $e1 solve))    ;; n 1 docs 1  e.g. tierB-000935

;; ---- slot add.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 add)    ;; n 6 docs 6  e.g. tierB-000462 tierB-001132

;; ---- slot bank.Member  [entity center; head other]  n 6  docs<= 6  distinct 2  eventive 0
(Member $x0 bank)    ;; n 5 docs 5  e.g. tierB-000302 tierB-000931
(And (Member $x0 bank) (Member $x0 valuable))    ;; n 1 docs 1  e.g. tierB-000931

;; ---- slot bear.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 bear)    ;; n 6 docs 6  e.g. tierB-000906 tierB-001568

;; ---- slot building.Member  [entity center; head other]  n 6  docs<= 6  distinct 4  eventive 0
(Member $x0 building)    ;; n 3 docs 3  e.g. tierB-000676 tierB-001385
(And (Member $x0 building) (Member $x0 concert_hall))    ;; n 1 docs 1  e.g. tierB-001385
(And (Member $x0 building) (Member $x0 dome_shaped))    ;; n 1 docs 1  e.g. tierB-001385
(And (Member $x0 building) (Member $x0 visible))    ;; n 1 docs 1  e.g. tierB-001385

;; ---- slot buy.Member  [event center; head other]  n 6  docs<= 5  distinct 2  eventive 0
(Member $e0 buy)    ;; n 5 docs 4  e.g. tierB-000367 tierB-000368
(And (Member $e0 buy) (Member $e0 out_of_the_question))    ;; n 1 docs 1  e.g. tierB-000849

;; ---- slot capture.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 capture)    ;; n 6 docs 6  e.g. tierB-000215 tierB-000636

;; ---- slot cause.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 cause)    ;; n 6 docs 6  e.g. tierB-000775 tierB-000805

;; ---- slot cold.Member  [entity center; head other]  n 6  docs<= 6  distinct 4  eventive 0
(Member $x0 cold)    ;; n 3 docs 3  e.g. tierB-000205 tierB-000261
(And (Member $x0 cold) (Member $x0 trail))    ;; n 1 docs 1  e.g. tierB-000362
(And (Member $x0 cold) (Member $x0 wall))    ;; n 1 docs 1  e.g. tierB-000261
(And (Member $x0 cold) (Member $x0 weather))    ;; n 1 docs 1  e.g. tierB-000205

;; ---- slot constant.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 constant)    ;; n 2 docs 2  e.g. tierC-000153 tierC-000154
(And (Member $x0 constant) (Member $x0 entropy))    ;; n 2 docs 2  e.g. tierC-000153 tierC-000154
(And (Member $x0 constant) (Member $x0 uniform))    ;; n 2 docs 2  e.g. tierC-000153 tierC-000154

;; ---- slot desired.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 desired)    ;; n 2 docs 2  e.g. tierC-000073 tierC-000074
(And (Member $x0 desired) (Member $x0 plasmid))    ;; n 2 docs 2  e.g. tierC-000073 tierC-000074
(And (Member $x0 desired) (Member $x0 white))    ;; n 2 docs 2  e.g. tierC-000073 tierC-000074

;; ---- slot direct.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 direct)    ;; n 6 docs 6  e.g. tierB-001087 tierC-000010

;; ---- slot diverse.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 diverse)    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288
(And (Member $x0 diverse) (Member $x0 established))    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288
(And (Member $x0 diverse) (Member $x0 genre))    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot easy.Member  [entity center; head other]  n 6  docs<= 6  distinct 4  eventive 0
(Member $x0 easy)    ;; n 3 docs 3  e.g. tierB-000246 tierB-001432
(And (Member $x0 easy) (Member $x0 generalization))    ;; n 1 docs 1  e.g. tierB-000246
(And (Member $x0 easy) (Member $x0 place))    ;; n 1 docs 1  e.g. tierB-001488
(And (Member $x0 easy) (Member $x0 problem))    ;; n 1 docs 1  e.g. tierB-001432

;; ---- slot enter.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 enter)    ;; n 6 docs 6  e.g. tierB-000163 tierB-000450

;; ---- slot family.Member  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $x0 family)    ;; n 6 docs 6  e.g. tierB-000520 tierB-001302

;; ---- slot floor.Member  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $x0 floor)    ;; n 6 docs 6  e.g. tierB-000687 tierB-000792

;; ---- slot form.Member  [event center; head other]  n 6  docs<= 5  distinct 1  eventive 0
(Member $e0 form)    ;; n 6 docs 5  e.g. tierB-000780 tierC-000163

;; ---- slot fridge.Member  [entity center; head other]  n 6  docs<= 6  distinct 2  eventive 0
(Member $x0 fridge)    ;; n 5 docs 5  e.g. tierB-000233 tierB-000369
(And (Member $x0 fridge) (Member $x0 full))    ;; n 1 docs 1  e.g. tierB-000918

;; ---- slot full.Member  [entity center; head other]  n 6  docs<= 6  distinct 4  eventive 0
(Member $x0 full)    ;; n 3 docs 3  e.g. tierB-000796 tierB-000861
(And (Member $x0 full) (Member $x0 kitchen_sink))    ;; n 1 docs 1  e.g. tierB-000796
(And (Member $x0 full) (Member $x0 place))    ;; n 1 docs 1  e.g. tierB-001196
(And (Member $x0 full) (Member $x0 potential))    ;; n 1 docs 1  e.g. tierB-000861

;; ---- slot get.Result  [event center; head other]  n 6  docs<= 6  distinct 6  eventive 6
(And (Member $e0 get) (Result $e0 $e1) (Member $e1 bad))    ;; n 1 docs 1  e.g. tierB-000748
(And (Member $e0 get) (Result $e0 $e1) (Member $e1 cheap))    ;; n 1 docs 1  e.g. tierB-000370
(And (Member $e0 get) (Result $e0 $e1) (Member $e1 expensive))    ;; n 1 docs 1  e.g. tierB-000370
(And (Member $e0 get) (Result $e0 $e1) (Member $e1 powerful))    ;; n 1 docs 1  e.g. tierB-000206
(And (Member $e0 get) (Result $e0 $e1) (Member $e1 ready))    ;; n 1 docs 1  e.g. tierB-001185
(And (Member $e0 get) (Result $e0 $e1) (Member $e1 short))    ;; n 1 docs 1  e.g. tierB-001658

;; ---- slot girl.Member  [entity center; head other]  n 6  docs<= 6  distinct 3  eventive 0
(Member $x0 girl)    ;; n 3 docs 3  e.g. tierB-000319 tierB-000783
(And (Member $x0 girl) (Member $x0 little))    ;; n 2 docs 2  e.g. tierB-000783 tierB-001280
(And (Member $x0 girl) (Member $x0 heroine))    ;; n 1 docs 1  e.g. tierB-001280

;; ---- slot lead.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 lead)    ;; n 6 docs 6  e.g. tierB-000040 tierB-000105

;; ---- slot place.Member  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $x0 place)    ;; n 6 docs 6  e.g. tierB-000494 tierB-000576

;; ---- slot present.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 present)    ;; n 6 docs 6  e.g. tierB-000876 tierB-001486

;; ---- slot receive.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 receive)    ;; n 6 docs 6  e.g. tierB-000962 tierB-001035

;; ---- slot run.Member  [event center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $e0 run)    ;; n 6 docs 6  e.g. tierB-000178 tierB-000339

;; ---- slot school.Member  [entity center; head other]  n 6  docs<= 6  distinct 2  eventive 0
(Member $x0 school)    ;; n 5 docs 5  e.g. tierB-000297 tierB-000782
(And (Member $x0 school) (Member $x0 whole))    ;; n 1 docs 1  e.g. tierB-001207

;; ---- slot stop.Member  [event center; head other]  n 6  docs<= 5  distinct 1  eventive 0
(Member $e0 stop)    ;; n 6 docs 5  e.g. tierB-000030 tierB-000125

;; ---- slot travel.Member  [event center; head other]  n 6  docs<= 5  distinct 1  eventive 0
(Member $e0 travel)    ;; n 6 docs 5  e.g. tierB-000434 tierB-000667

;; ---- slot village.Member  [entity center; head other]  n 6  docs<= 6  distinct 1  eventive 0
(Member $x0 village)    ;; n 6 docs 6  e.g. tierB-000116 tierB-001317

;; ---- slot atmosphere.Member  [entity center; head other]  n 5  docs<= 5  distinct 3  eventive 0
(Member $x0 atmosphere)    ;; n 3 docs 3  e.g. tierB-000285 tierB-000360
(And (Member $x0 atmosphere) (Member $x0 different))    ;; n 1 docs 1  e.g. tierB-000285
(And (Member $x0 atmosphere) (Member $x0 homely))    ;; n 1 docs 1  e.g. tierB-001043

;; ---- slot attack.Member  [event center; head other]  n 5  docs<= 5  distinct 3  eventive 0
(Member $e0 attack)    ;; n 3 docs 3  e.g. tierB-000345 tierB-000673
(And (Member $e0 attack) (Member $e0 full_fledged))    ;; n 1 docs 1  e.g. tierB-000673
(And (Member $e0 attack) (Member $e0 strong))    ;; n 1 docs 1  e.g. tierB-001688

;; ---- slot avoid.Member  [event center; head other]  n 5  docs<= 5  distinct 2  eventive 0
(Member $e0 avoid)    ;; n 4 docs 4  e.g. tierB-000171 tierB-000246
(And (Member $e0 avoid) (Member $e0 point))    ;; n 1 docs 1  e.g. tierB-000674

;; ---- slot box.Member  [entity center; head other]  n 5  docs<= 4  distinct 2  eventive 0
(Member $x0 box)    ;; n 4 docs 3  e.g. tierB-000475 tierB-000956
(And (Member $x0 box) (Member $x0 bulky))    ;; n 1 docs 1  e.g. tierB-000956

;; ---- slot bus.Member  [entity center; head other]  n 5  docs<= 4  distinct 1  eventive 0
(Member $x0 bus)    ;; n 5 docs 4  e.g. tierB-000712 tierB-001430

;; ---- slot busy.Member  [entity center; head other]  n 5  docs<= 5  distinct 4  eventive 0
(Member $x0 busy)    ;; n 2 docs 2  e.g. tierB-001004 tierB-001208
(And (Member $x0 busy) (Member $x0 elderly))    ;; n 1 docs 1  e.g. tierB-001208
(And (Member $x0 busy) (Member $x0 father))    ;; n 1 docs 1  e.g. tierB-001004
(And (Member $x0 busy) (Member $x0 lady))    ;; n 1 docs 1  e.g. tierB-001208

;; ---- slot corner.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 corner)    ;; n 5 docs 5  e.g. tierB-000081 tierB-000912

;; ---- slot crowd.Member  [entity center; head other]  n 5  docs<= 5  distinct 2  eventive 0
(Member $x0 crowd)    ;; n 4 docs 4  e.g. tierB-001052 tierB-001108
(And (Member $x0 crowd) (Member $x0 whole))    ;; n 1 docs 1  e.g. tierB-001169

;; ---- slot cry.Member  [event center; head other]  n 5  docs<= 4  distinct 1  eventive 0
(Member $e0 cry)    ;; n 5 docs 4  e.g. tierB-000030 tierB-000502

;; ---- slot dead.Member  [entity center; head other]  n 5  docs<= 5  distinct 4  eventive 0
(Member $x0 dead)    ;; n 2 docs 2  e.g. tierB-001476 tierB-001950
(And (Member $x0 dead) (Member $x0 horse))    ;; n 1 docs 1  e.g. tierB-001950
(And (Member $x0 dead) (Member $x0 rotten))    ;; n 1 docs 1  e.g. tierB-001476
(And (Member $x0 dead) (Member $x0 tree))    ;; n 1 docs 1  e.g. tierB-001476

;; ---- slot draw.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 draw)    ;; n 5 docs 5  e.g. tierB-000781 tierB-001245

;; ---- slot eat.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 eat)    ;; n 5 docs 5  e.g. tierB-000338 tierB-000410

;; ---- slot famous.Member  [entity center; head other]  n 5  docs<= 5  distinct 4  eventive 0
(Member $x0 famous)    ;; n 2 docs 2  e.g. tierB-001647 tierB-001962
(And (Member $x0 famous) (Member $x0 museum))    ;; n 1 docs 1  e.g. tierB-001647
(And (Member $x0 famous) (Member $x0 person))    ;; n 1 docs 1  e.g. tierB-001962
(And (Member $x0 famous) (Member $x0 tourist_attraction))    ;; n 1 docs 1  e.g. tierB-001647

;; ---- slot film.Member  [entity center; head other]  n 5  docs<= 5  distinct 2  eventive 0
(Member $x0 film)    ;; n 4 docs 4  e.g. tierB-000505 tierB-001017
(And (Member $x0 film) (Member $x0 syrian_film))    ;; n 1 docs 1  e.g. tierC-000010

;; ---- slot fly.Member  [event center; head other]  n 5  docs<= 4  distinct 1  eventive 0
(Member $e0 fly)    ;; n 5 docs 4  e.g. tierB-000045 tierB-000121

;; ---- slot government.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 government)    ;; n 5 docs 5  e.g. tierB-000548 tierB-001800

;; ---- slot happen.Member  [event center; head other]  n 5  docs<= 5  distinct 2  eventive 0
(Member $e0 happen)    ;; n 4 docs 4  e.g. tierB-000087 tierB-001363
(And (Member $e0 happen) (Member $e0 strange))    ;; n 1 docs 1  e.g. tierB-001708

;; ---- slot horse.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 horse)    ;; n 5 docs 5  e.g. tierB-000145 tierB-000383

;; ---- slot include.Member  [event center; head other]  n 5  docs<= 3  distinct 1  eventive 0
(Member $e0 include)    ;; n 5 docs 3  e.g. tierB-000379 tierB-001878

;; ---- slot ivy.Member  [entity center; head other]  n 5  docs<= 5  distinct 2  eventive 0
(Member $x0 ivy)    ;; n 4 docs 4  e.g. tierB-000394 tierB-001234
(And (Member $x0 ivy) (Member $x0 plant))    ;; n 1 docs 1  e.g. tierB-000394

;; ---- slot look.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 look)    ;; n 5 docs 5  e.g. tierB-000230 tierB-000297

;; ---- slot low.Member  [entity center; head other]  n 5  docs<= 5  distinct 4  eventive 0
(Member $x0 low)    ;; n 2 docs 2  e.g. tierB-000418 tierC-000070
(And (Member $x0 low) (Member $x0 price))    ;; n 1 docs 1  e.g. tierB-000418
(And (Member $x0 low) (Member $x0 reduced))    ;; n 1 docs 1  e.g. tierC-000070
(And (Member $x0 low) (Member $x0 speed_limit))    ;; n 1 docs 1  e.g. tierC-000070

;; ---- slot original.Member  [entity center; head other]  n 5  docs<= 5  distinct 3  eventive 0
(Member $x0 original)    ;; n 3 docs 3  e.g. tierB-000567 tierB-000932
(And (Member $x0 original) (Member $x0 qipao))    ;; n 1 docs 1  e.g. tierB-000567
(And (Member $x0 original) (Member $x0 turing_machine))    ;; n 1 docs 1  e.g. tierB-000932

;; ---- slot portray.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 portray)    ;; n 5 docs 5  e.g. tierC-000247 tierC-000248

;; ---- slot provide.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 provide)    ;; n 5 docs 5  e.g. tierB-000769 tierB-001260

;; ---- slot ready.Member  [event center; head other]  n 5  docs<= 4  distinct 1  eventive 0
(Member $e0 ready)    ;; n 5 docs 4  e.g. tierB-000044 tierB-000168

;; ---- slot say.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 say)    ;; n 5 docs 5  e.g. tierB-000080 tierB-000865

;; ---- slot sing.To  [event center; head other]  n 5  docs<= 4  distinct 3  eventive 4
(And (Member $e0 sing) (To $e0 $e1) (Member $e1 accompany))    ;; n 4 docs 2  e.g. tierC-000127 tierC-000128
(And (Member $e0 sing) (To $e0 $x1) (Member $x1 music))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000827
(And (Member $e0 sing) (To $e0 $x1) (Member $x1 sad))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000827

;; ---- slot sky.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 sky)    ;; n 5 docs 5  e.g. tierB-000456 tierB-000722

;; ---- slot stand.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 stand)    ;; n 5 docs 5  e.g. tierB-000676 tierB-000712

;; ---- slot swim.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 swim)    ;; n 5 docs 5  e.g. tierB-000313 tierB-000782

;; ---- slot turn.Result  [event center; head other]  n 5  docs<= 5  distinct 5  eventive 5
(And (Member $e0 turn) (Result $e0 $e1) (Member $e1 black))    ;; n 1 docs 1  e.g. tierB-000476
(And (Member $e0 turn) (Result $e0 $e1) (Member $e1 crow))    ;; n 1 docs 1  e.g. tierB-001675
(And (Member $e0 turn) (Result $e0 $e1) (Member $e1 gusher))    ;; n 1 docs 1  e.g. tierB-000654
(And (Member $e0 turn) (Result $e0 $e1) (Member $e1 red))    ;; n 1 docs 1  e.g. tierB-000832
(And (Member $e0 turn) (Result $e0 $e1) (Member $e1 yellow))    ;; n 1 docs 1  e.g. tierB-000832

;; ---- slot wall.Member  [entity center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $x0 wall)    ;; n 5 docs 5  e.g. tierB-000343 tierB-000560

;; ---- slot watch.Member  [event center; head other]  n 5  docs<= 5  distinct 1  eventive 0
(Member $e0 watch)    ;; n 5 docs 5  e.g. tierB-000258 tierB-000520

;; ---- slot accompany.Member  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $e0 accompany)    ;; n 4 docs 2  e.g. tierC-000127 tierC-000128

;; ---- slot action.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 action)    ;; n 2 docs 2  e.g. tierB-001141 tierB-001922
(And (Member $x0 action) (Member $x0 appropriate))    ;; n 1 docs 1  e.g. tierB-001141
(And (Member $x0 action) (Member $x0 onscreen))    ;; n 1 docs 1  e.g. tierB-001922

;; ---- slot arrive.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 arrive)    ;; n 4 docs 4  e.g. tierB-000237 tierB-000444

;; ---- slot attention.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 attention)    ;; n 2 docs 2  e.g. tierC-000177 tierC-000178
(And (Member $x0 attention) (Member $x0 widespread))    ;; n 2 docs 2  e.g. tierC-000177 tierC-000178

;; ---- slot bad.Between  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $x0 bad) (Between $x0 germany))    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242
(And (Member $x0 bad) (Between $x0 poland))    ;; n 2 docs 2  e.g. tierC-000241 tierC-000242

;; ---- slot bad.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 bad)    ;; n 4 docs 4  e.g. tierB-000748 tierB-001594

;; ---- slot be.Member  [event center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $e0 be)    ;; n 2 docs 2  e.g. tierB-000514 tierB-001619
(And (Member $e0 be) (Member $e0 real))    ;; n 1 docs 1  e.g. tierB-001619
(And (Member $e0 be) (Member $e0 torture))    ;; n 1 docs 1  e.g. tierB-001619

;; ---- slot beauty.Possession  [entity center; head other]  n 4  docs<= 4  distinct 4  eventive 0
(And (Member $x0 beauty) (Possession $x0 lake_towada))    ;; n 1 docs 1  e.g. tierB-001898
(And (Member $x0 beauty) (Possession $x0 $x1) (Member $x1 scenery))    ;; n 1 docs 1  e.g. tierB-001503
(And (Member $x0 beauty) (Possession $x0 sex))    ;; n 1 docs 1  e.g. tierB-000376
(And (Member $x0 beauty) (Possession $x0 $x1) (Member $x1 sight))    ;; n 1 docs 1  e.g. tierB-000678

;; ---- slot bicycle.Member  [entity center; head other]  n 4  docs<= 3  distinct 3  eventive 0
(Member $x0 bicycle)    ;; n 2 docs 1  e.g. tierB-001890
(And (Member $x0 bicycle) (Member $x0 purple))    ;; n 1 docs 1  e.g. tierB-001890
(And (Member $x0 bicycle) (Member $x0 yellow))    ;; n 1 docs 1  e.g. tierB-001890

;; ---- slot bring.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 bring)    ;; n 4 docs 4  e.g. tierB-000427 tierB-000636

;; ---- slot captain.Member  [entity center; head other]  n 4  docs<= 3  distinct 3  eventive 0
(Member $x0 captain)    ;; n 2 docs 1  e.g. tierB-001442
(And (Member $x0 captain) (Member $x0 former))    ;; n 1 docs 1  e.g. tierB-001442
(And (Member $x0 captain) (Member $x0 present))    ;; n 1 docs 1  e.g. tierB-001442

;; ---- slot castle.Member  [entity center; head other]  n 4  docs<= 3  distinct 2  eventive 0
(Member $x0 castle)    ;; n 3 docs 2  e.g. tierB-000088 tierB-001840
(And (Member $x0 castle) (Member $x0 green))    ;; n 1 docs 1  e.g. tierB-001840

;; ---- slot ceremony.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 ceremony)    ;; n 2 docs 2  e.g. tierC-000283 tierC-000284
(And (Member $x0 ceremony) (Member $x0 mass))    ;; n 2 docs 2  e.g. tierC-000283 tierC-000284

;; ---- slot chapel.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 chapel)    ;; n 2 docs 2  e.g. tierC-000115 tierC-000116
(And (Member $x0 chapel) (Member $x0 former))    ;; n 1 docs 1  e.g. tierC-000116
(And (Member $x0 chapel) (Member $x0 listed_building))    ;; n 1 docs 1  e.g. tierC-000116

;; ---- slot class.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 class)    ;; n 4 docs 4  e.g. tierB-000794 tierB-000814

;; ---- slot community.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 community)    ;; n 4 docs 4  e.g. tierB-001867 tierB-001902

;; ---- slot conduct.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 conduct)    ;; n 4 docs 4  e.g. tierB-000177 tierC-000284

;; ---- slot connect.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 connect)    ;; n 4 docs 4  e.g. tierB-000063 tierB-001071

;; ---- slot consider.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 consider)    ;; n 4 docs 4  e.g. tierB-001300 tierB-001863

;; ---- slot context.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 context)    ;; n 2 docs 2  e.g. tierC-000205 tierC-000206
(And (Member $x0 context) (Member $x0 non_spatial))    ;; n 2 docs 2  e.g. tierC-000205 tierC-000206

;; ---- slot cottage.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 cottage)    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270
(And (Member $x0 cottage) (Member $x0 isolated))    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot country.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 country)    ;; n 4 docs 4  e.g. tierB-000207 tierB-001546

;; ---- slot cover.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 cover)    ;; n 4 docs 4  e.g. tierB-000702 tierB-000809

;; ---- slot current.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 current)    ;; n 2 docs 2  e.g. tierC-000173 tierC-000174
(And (Member $x0 current) (Member $x0 designation_convention))    ;; n 1 docs 1  e.g. tierC-000174
(And (Member $x0 current) (Member $x0 naming_convention))    ;; n 1 docs 1  e.g. tierC-000173

;; ---- slot dangerous.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 dangerous)    ;; n 2 docs 2  e.g. tierB-001021 tierB-001727
(And (Member $x0 dangerous) (Member $x0 neighborhood))    ;; n 1 docs 1  e.g. tierB-001727
(And (Member $x0 dangerous) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierB-001021

;; ---- slot day.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 day)    ;; n 3 docs 3  e.g. tierB-000251 tierB-001146
(And (Member $x0 day) (Member $x0 hot))    ;; n 1 docs 1  e.g. tierB-000251

;; ---- slot decide.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 decide)    ;; n 4 docs 4  e.g. tierB-000401 tierB-000563

;; ---- slot design.Member  [event center; head other]  n 4  docs<= 3  distinct 1  eventive 0
(Member $e0 design)    ;; n 4 docs 3  e.g. tierC-000119 tierC-000120

;; ---- slot die.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 die)    ;; n 4 docs 4  e.g. tierB-000838 tierB-001967

;; ---- slot difficult.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 difficult)    ;; n 2 docs 2  e.g. tierB-000925 tierB-001847
(And (Member $x0 difficult) (Member $x0 hill))    ;; n 1 docs 1  e.g. tierB-000925
(And (Member $x0 difficult) (Member $x0 sheet_music))    ;; n 1 docs 1  e.g. tierB-001847

;; ---- slot direct.Member  [entity center; head other]  n 4  docs<= 4  distinct 4  eventive 0
(Member $x0 direct)    ;; n 1 docs 1  e.g. tierC-000068
(And (Member $x0 direct) (Member $x0 reaction))    ;; n 1 docs 1  e.g. tierC-000068
(And (Member $x0 direct) (Member $x0 synthesis))    ;; n 1 docs 1  e.g. tierC-000068
(And (Member $x0 direct) (Member $x0 violent))    ;; n 1 docs 1  e.g. tierC-000068

;; ---- slot discover.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 discover)    ;; n 4 docs 4  e.g. tierB-000658 tierB-001251

;; ---- slot doctor.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 doctor)    ;; n 4 docs 4  e.g. tierB-000049 tierB-000339

;; ---- slot dress.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 dress)    ;; n 3 docs 3  e.g. tierB-000021 tierB-001587
(And (Member $x0 dress) (Member $x0 pure_silk))    ;; n 1 docs 1  e.g. tierB-001634

;; ---- slot drink.Member  [event center; head other]  n 4  docs<= 3  distinct 1  eventive 0
(Member $e0 drink)    ;; n 4 docs 3  e.g. tierB-000209 tierB-000946

;; ---- slot drug.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 drug)    ;; n 2 docs 2  e.g. tierB-000786 tierB-001880
(And (Member $x0 drug) (Member $x0 effective))    ;; n 1 docs 1  e.g. tierB-000786
(And (Member $x0 drug) (Member $x0 experimental))    ;; n 1 docs 1  e.g. tierB-000786

;; ---- slot emmy.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 emmy)    ;; n 4 docs 4  e.g. tierC-000277 tierC-000278

;; ---- slot entire.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 entire)    ;; n 2 docs 2  e.g. tierB-000441 tierB-001684
(And (Member $x0 entire) (Member $x0 house))    ;; n 1 docs 1  e.g. tierB-000441
(And (Member $x0 entire) (Member $x0 street))    ;; n 1 docs 1  e.g. tierB-001684

;; ---- slot family.Possession  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(And (Member $x0 family) (Possession $x0 $x1) (Member $x1 person))    ;; n 4 docs 4  e.g. tierC-000017 tierC-000018

;; ---- slot field.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 field)    ;; n 3 docs 3  e.g. tierB-000774 tierB-001153
(And (Member $x0 field) (Member $x0 open))    ;; n 1 docs 1  e.g. tierB-001153

;; ---- slot fire.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 fire)    ;; n 4 docs 4  e.g. tierB-000838 tierB-000922

;; ---- slot foreign.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 foreign)    ;; n 2 docs 2  e.g. tierB-000608 tierB-001068
(And (Member $x0 foreign) (Member $x0 language))    ;; n 2 docs 2  e.g. tierB-000608 tierB-001068

;; ---- slot forest.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 forest)    ;; n 3 docs 3  e.g. tierB-000141 tierB-000609
(And (Member $x0 forest) (Member $x0 silent))    ;; n 1 docs 1  e.g. tierB-000609

;; ---- slot former.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 former)    ;; n 2 docs 2  e.g. tierC-000167 tierC-000168
(And (Member $x0 former) (Member $x0 prefecture))    ;; n 2 docs 2  e.g. tierC-000167 tierC-000168

;; ---- slot fresh.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 fresh)    ;; n 2 docs 2  e.g. tierB-000044 tierB-001531
(And (Member $x0 fresh) (Member $x0 rain))    ;; n 1 docs 1  e.g. tierB-001531
(And (Member $x0 fresh) (Member $x0 start))    ;; n 1 docs 1  e.g. tierB-000044

;; ---- slot friend.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 friend)    ;; n 2 docs 2  e.g. tierB-000267 tierB-000765
(And (Member $x0 friend) (Member $x0 good))    ;; n 1 docs 1  e.g. tierB-000765
(And (Member $x0 friend) (Member $x0 old))    ;; n 1 docs 1  e.g. tierB-000267

;; ---- slot game.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 game)    ;; n 3 docs 3  e.g. tierB-000498 tierB-001610
(And (Member $x0 game) (Member $x0 whole))    ;; n 1 docs 1  e.g. tierB-001610

;; ---- slot general.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 general)    ;; n 2 docs 2  e.g. tierB-001470 tierB-001782
(And (Member $x0 general) (Member $x0 great))    ;; n 1 docs 1  e.g. tierB-001470
(And (Member $x0 general) (Member $x0 statesman))    ;; n 1 docs 1  e.g. tierB-001470

;; ---- slot give.Member  [event center; head other]  n 4  docs<= 3  distinct 1  eventive 0
(Member $e0 give)    ;; n 4 docs 3  e.g. tierB-000137 tierB-001046

;; ---- slot good.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 good)    ;; n 4 docs 4  e.g. tierB-000495 tierB-000999

;; ---- slot great.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 great)    ;; n 2 docs 2  e.g. tierB-000522 tierC-000020
(And (Member $x0 great) (Member $x0 homecoming_game))    ;; n 1 docs 1  e.g. tierC-000020
(And (Member $x0 great) (Member $x0 news))    ;; n 1 docs 1  e.g. tierB-000522

;; ---- slot ground.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 ground)    ;; n 4 docs 4  e.g. tierB-000176 tierB-000474

;; ---- slot group.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 group)    ;; n 4 docs 4  e.g. tierB-001357 tierB-001525

;; ---- slot hold.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 hold)    ;; n 4 docs 4  e.g. tierB-000378 tierB-001266

;; ---- slot increase.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 increase)    ;; n 4 docs 4  e.g. tierB-000680 tierB-000690

;; ---- slot jump.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 jump)    ;; n 4 docs 4  e.g. tierB-000871 tierB-000889

;; ---- slot kitchen.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 kitchen)    ;; n 3 docs 3  e.g. tierB-000604 tierB-001291
(And (Member $x0 kitchen) (Member $x0 place))    ;; n 1 docs 1  e.g. tierB-000604

;; ---- slot language.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 language)    ;; n 3 docs 3  e.g. tierB-000122 tierB-000728
(And (Member $x0 language) (Member $x0 new))    ;; n 1 docs 1  e.g. tierB-000728

;; ---- slot law.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 law)    ;; n 2 docs 2  e.g. tierB-000288 tierB-001762
(And (Member $x0 law) (Member $x0 new))    ;; n 2 docs 2  e.g. tierB-000288 tierB-001762

;; ---- slot lie.Member  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $e0 lie)    ;; n 4 docs 2  e.g. tierB-001041 tierB-001078

;; ---- slot lose.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 lose)    ;; n 4 docs 4  e.g. tierB-000236 tierB-000795

;; ---- slot machine.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 machine)    ;; n 4 docs 4  e.g. tierB-000938 tierB-001996

;; ---- slot magnet.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 magnet)    ;; n 2 docs 2  e.g. tierB-000233 tierB-001251
(And (Member $x0 magnet) (Member $x0 new))    ;; n 1 docs 1  e.g. tierB-001251
(And (Member $x0 magnet) (Member $x0 type))    ;; n 1 docs 1  e.g. tierB-001251

;; ---- slot matter.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 matter)    ;; n 3 docs 3  e.g. tierB-000119 tierB-000244
(And (Member $x0 matter) (Member $x0 serious))    ;; n 1 docs 1  e.g. tierB-000244

;; ---- slot middle.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 middle)    ;; n 4 docs 4  e.g. tierB-000141 tierB-000524

;; ---- slot move.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 move)    ;; n 4 docs 4  e.g. tierB-000782 tierB-001570

;; ---- slot music.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 music)    ;; n 2 docs 2  e.g. tierB-000681 tierB-000827
(And (Member $x0 music) (Member $x0 sad))    ;; n 1 docs 1  e.g. tierB-000827
(And (Member $x0 music) (Member $x0 upbeat))    ;; n 1 docs 1  e.g. tierB-000681

;; ---- slot northern.LocatedIn  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $x0 northern) (LocatedIn $x0 estonia))    ;; n 2 docs 2  e.g. tierC-000211 tierC-000212
(And (Member $x0 northern) (LocatedIn $x0 india))    ;; n 2 docs 2  e.g. tierC-000135 tierC-000136

;; ---- slot northern.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 northern)    ;; n 4 docs 4  e.g. tierC-000135 tierC-000136

;; ---- slot ocean.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 ocean)    ;; n 3 docs 3  e.g. tierB-000573 tierB-000722
(And (Member $x0 ocean) (Member $x0 vast))    ;; n 1 docs 1  e.g. tierB-001257

;; ---- slot old.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 old)    ;; n 2 docs 2  e.g. tierB-000334 tierB-001164
(And (Member $x0 old) (Member $x0 port))    ;; n 1 docs 1  e.g. tierB-001164
(And (Member $x0 old) (Member $x0 scissors))    ;; n 1 docs 1  e.g. tierB-000334

;; ---- slot other.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 other)    ;; n 2 docs 2  e.g. tierB-000202 tierB-001738
(And (Member $x0 other) (Member $x0 side))    ;; n 1 docs 1  e.g. tierB-000202
(And (Member $x0 other) (Member $x0 way))    ;; n 1 docs 1  e.g. tierB-001738

;; ---- slot party.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 party)    ;; n 4 docs 4  e.g. tierB-000646 tierB-001152

;; ---- slot pass.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 pass)    ;; n 4 docs 4  e.g. tierB-000649 tierB-001008

;; ---- slot perform.Member  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $e0 perform)    ;; n 4 docs 2  e.g. tierB-000970 tierC-000127

;; ---- slot picture.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 picture)    ;; n 4 docs 4  e.g. tierB-000876 tierB-001070

;; ---- slot preach.Member  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $e0 preach)    ;; n 4 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot purpose.Member  [entity center; head other]  n 4  docs<= 4  distinct 3  eventive 0
(Member $x0 purpose)    ;; n 2 docs 2  e.g. tierB-000376 tierB-001177
(And (Member $x0 purpose) (Member $x0 single))    ;; n 1 docs 1  e.g. tierB-001177
(And (Member $x0 purpose) (Member $x0 true))    ;; n 1 docs 1  e.g. tierB-000376

;; ---- slot rain.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 rain)    ;; n 4 docs 4  e.g. tierB-000498 tierB-000841

;; ---- slot region.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 region)    ;; n 4 docs 4  e.g. tierC-000095 tierC-000096

;; ---- slot replace.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 replace)    ;; n 4 docs 4  e.g. tierC-000099 tierC-000100

;; ---- slot require.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 require)    ;; n 4 docs 4  e.g. tierB-000607 tierB-001436

;; ---- slot river.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 river)    ;; n 4 docs 4  e.g. tierB-000416 tierB-000468

;; ---- slot sea.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 sea)    ;; n 4 docs 4  e.g. tierB-000134 tierB-000767

;; ---- slot ship.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 ship)    ;; n 4 docs 4  e.g. tierB-000100 tierB-000605

;; ---- slot sound.Member  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(Member $x0 sound)    ;; n 3 docs 3  e.g. tierB-001537 tierB-001894
(And (Member $x0 sound) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierB-001537

;; ---- slot southern.LocatedIn  [entity center; head other]  n 4  docs<= 4  distinct 2  eventive 0
(And (Member $x0 southern) (LocatedIn $x0 india))    ;; n 2 docs 2  e.g. tierC-000135 tierC-000136
(And (Member $x0 southern) (LocatedIn $x0 north_africa))    ;; n 2 docs 2  e.g. tierC-000279 tierC-000280

;; ---- slot southern.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 southern)    ;; n 4 docs 4  e.g. tierC-000135 tierC-000136

;; ---- slot spend.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 spend)    ;; n 4 docs 4  e.g. tierB-000883 tierB-001146

;; ---- slot star.Member  [event center; head other]  n 4  docs<= 2  distinct 1  eventive 0
(Member $e0 star)    ;; n 4 docs 2  e.g. tierC-000137 tierC-000138

;; ---- slot store.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 store)    ;; n 4 docs 4  e.g. tierB-000218 tierB-000324

;; ---- slot street.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 street)    ;; n 4 docs 4  e.g. tierB-000202 tierB-000882

;; ---- slot sun.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 sun)    ;; n 4 docs 4  e.g. tierB-000825 tierB-001218

;; ---- slot tell.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 tell)    ;; n 4 docs 4  e.g. tierB-000742 tierB-000745

;; ---- slot train.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 train)    ;; n 4 docs 4  e.g. tierB-000238 tierB-000900

;; ---- slot use.To  [event center; head other]  n 4  docs<= 4  distinct 4  eventive 4
(And (Member $e0 use) (To $e0 $e1) (Member $e1 develop))    ;; n 1 docs 1  e.g. tierB-000404
(And (Member $e0 use) (To $e0 $e1) (Member $e1 learn))    ;; n 1 docs 1  e.g. tierB-000282
(And (Member $e0 use) (To $e0 $e1) (Member $e1 make))    ;; n 1 docs 1  e.g. tierB-001431
(And (Member $e0 use) (To $e0 $e1) (Member $e1 roast))    ;; n 1 docs 1  e.g. tierB-001304

;; ---- slot war.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 war)    ;; n 4 docs 4  e.g. tierB-001204 tierB-001324

;; ---- slot war.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 war)    ;; n 4 docs 4  e.g. tierB-000624 tierB-001536

;; ---- slot way.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 way)    ;; n 4 docs 4  e.g. tierB-000138 tierB-001190

;; ---- slot welcome.Member  [event center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $e0 welcome)    ;; n 4 docs 4  e.g. tierB-001787 tierB-001868

;; ---- slot wind.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 wind)    ;; n 4 docs 4  e.g. tierB-000062 tierB-001306

;; ---- slot windshield.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 windshield)    ;; n 4 docs 4  e.g. tierB-000265 tierB-000984

;; ---- slot work.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 work)    ;; n 4 docs 4  e.g. tierB-000879 tierB-001389

;; ---- slot world.Member  [entity center; head other]  n 4  docs<= 4  distinct 1  eventive 0
(Member $x0 world)    ;; n 4 docs 4  e.g. tierB-000108 tierB-001275

;; ---- slot abolish.Member  [event center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $e0 abolish)    ;; n 1 docs 1  e.g. tierB-001648
(And (Member $e0 abolish) (Member $e0 difficult))    ;; n 1 docs 1  e.g. tierB-001648
(And (Member $e0 abolish) (Member $e0 task))    ;; n 1 docs 1  e.g. tierB-001648

;; ---- slot accident.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 accident)    ;; n 3 docs 3  e.g. tierB-000033 tierB-000692

;; ---- slot active.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 active)    ;; n 3 docs 3  e.g. tierC-000080 tierC-000201

;; ---- slot affect.Member  [event center; head other]  n 3  docs<= 1  distinct 1  eventive 0
(Member $e0 affect)    ;; n 3 docs 1  e.g. tierB-001275

;; ---- slot air.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 air)    ;; n 2 docs 2  e.g. tierB-001531 tierB-001596
(And (Member $x0 air) (Member $x0 crisp))    ;; n 1 docs 1  e.g. tierB-001596

;; ---- slot alternating.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 alternating)    ;; n 1 docs 1  e.g. tierB-001652
(And (Member $x0 alternating) (Member $x0 black))    ;; n 1 docs 1  e.g. tierB-001652
(And (Member $x0 alternating) (Member $x0 gray))    ;; n 1 docs 1  e.g. tierB-001652

;; ---- slot approve.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 approve)    ;; n 3 docs 3  e.g. tierB-000037 tierB-000128

;; ---- slot army.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 army)    ;; n 3 docs 3  e.g. tierB-000411 tierB-000913

;; ---- slot asshole.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 asshole)    ;; n 1 docs 1  e.g. tierB-001198
(And (Member $x0 asshole) (Member $x0 insufferable))    ;; n 1 docs 1  e.g. tierB-001198
(And (Member $x0 asshole) (Member $x0 leader))    ;; n 1 docs 1  e.g. tierB-001198

;; ---- slot author.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 author)    ;; n 3 docs 3  e.g. tierB-000170 tierB-001843

;; ---- slot bake.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 bake)    ;; n 3 docs 3  e.g. tierB-000464 tierC-000197

;; ---- slot ball.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 ball)    ;; n 3 docs 3  e.g. tierB-000103 tierB-000343

;; ---- slot base.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 base)    ;; n 3 docs 3  e.g. tierB-001605 tierB-001610

;; ---- slot bat.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 bat)    ;; n 2 docs 2  e.g. tierB-000103 tierB-001209
(And (Member $x0 bat) (Member $x0 vampire))    ;; n 1 docs 1  e.g. tierB-001209

;; ---- slot beach.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 beach)    ;; n 3 docs 3  e.g. tierB-000221 tierB-001081

;; ---- slot beautiful.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 beautiful)    ;; n 3 docs 3  e.g. tierB-000565 tierB-000904

;; ---- slot bench.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 bench)    ;; n 3 docs 3  e.g. tierB-000305 tierC-000243

;; ---- slot bottle.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 bottle)    ;; n 1 docs 1  e.g. tierB-000165
(And (Member $x0 bottle) (Member $x0 lactose_free))    ;; n 1 docs 1  e.g. tierB-000165
(And (Member $x0 bottle) (Member $x0 yogurt))    ;; n 1 docs 1  e.g. tierB-000165

;; ---- slot bottom.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 bottom)    ;; n 3 docs 3  e.g. tierB-000172 tierB-001586

;; ---- slot bottom.PartOf  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $x0 bottom) (PartOf $x0 $x1) (Member $x1 page))    ;; n 2 docs 2  e.g. tierB-000172 tierB-001638
(And (Member $x0 bottom) (PartOf $x0 $x1) (Member $x1 stew_pot))    ;; n 1 docs 1  e.g. tierB-001586

;; ---- slot break_out.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 break_out)    ;; n 3 docs 3  e.g. tierB-001302 tierB-001641

;; ---- slot bridge.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 bridge)    ;; n 3 docs 3  e.g. tierB-000227 tierC-000125

;; ---- slot camera.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 camera)    ;; n 3 docs 3  e.g. tierB-000330 tierB-000619

;; ---- slot cause.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 cause)    ;; n 2 docs 2  e.g. tierB-000834 tierB-000919
(And (Member $x0 cause) (Member $x0 unknown))    ;; n 1 docs 1  e.g. tierB-000919

;; ---- slot celebrate.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 celebrate)    ;; n 3 docs 3  e.g. tierB-000303 tierC-000133

;; ---- slot church.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 church)    ;; n 3 docs 3  e.g. tierB-000143 tierB-000202

;; ---- slot clarify.Member  [event center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $e0 clarify)    ;; n 2 docs 2  e.g. tierC-000021 tierC-000022
(And (Member $e0 clarify) (Member $e0 task))    ;; n 1 docs 1  e.g. tierC-000022

;; ---- slot climb.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 climb)    ;; n 3 docs 3  e.g. tierB-000344 tierB-000930

;; ---- slot coast.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 coast)    ;; n 2 docs 2  e.g. tierB-000501 tierB-001784
(And (Member $x0 coast) (Member $x0 tropical))    ;; n 1 docs 1  e.g. tierB-000501

;; ---- slot coffee.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 coffee)    ;; n 2 docs 2  e.g. tierB-000156 tierB-000940
(And (Member $x0 coffee) (Member $x0 strong))    ;; n 1 docs 1  e.g. tierB-000156

;; ---- slot come_back.Member  [event center; head other]  n 3  docs<= 2  distinct 1  eventive 0
(Member $e0 come_back)    ;; n 3 docs 2  e.g. tierB-000337 tierB-000575

;; ---- slot competitive_activity.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 competitive_activity)    ;; n 1 docs 1  e.g. tierC-000148
(And (Member $x0 competitive_activity) (Member $x0 recreational_sport))    ;; n 1 docs 1  e.g. tierC-000148
(And (Member $x0 competitive_activity) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierC-000148

;; ---- slot compose.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 compose)    ;; n 3 docs 3  e.g. tierB-001575 tierC-000131

;; ---- slot concert.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 concert)    ;; n 3 docs 3  e.g. tierB-000387 tierB-000781

;; ---- slot cook.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 cook)    ;; n 3 docs 3  e.g. tierB-000462 tierB-000942

;; ---- slot couch.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 couch)    ;; n 3 docs 3  e.g. tierB-001003 tierC-000041

;; ---- slot cozy.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 cozy)    ;; n 1 docs 1  e.g. tierB-001573
(And (Member $x0 cozy) (Member $x0 living_room))    ;; n 1 docs 1  e.g. tierB-001573
(And (Member $x0 cozy) (Member $x0 theater))    ;; n 1 docs 1  e.g. tierB-001573

;; ---- slot crazy.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 crazy)    ;; n 1 docs 1  e.g. tierB-001480
(And (Member $x0 crazy) (Member $x0 lady))    ;; n 1 docs 1  e.g. tierB-001480
(And (Member $x0 crazy) (Member $x0 old))    ;; n 1 docs 1  e.g. tierB-001480

;; ---- slot cyanide.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 cyanide)    ;; n 1 docs 1  e.g. tierB-001995
(And (Member $x0 cyanide) (Member $x0 harmless))    ;; n 1 docs 1  e.g. tierB-001995
(And (Member $x0 cyanide) (Member $x0 trace))    ;; n 1 docs 1  e.g. tierB-001995

;; ---- slot dark.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 dark)    ;; n 2 docs 2  e.g. tierB-000148 tierB-001366
(And (Member $x0 dark) (Member $x0 room))    ;; n 1 docs 1  e.g. tierB-001366

;; ---- slot define.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 define)    ;; n 3 docs 3  e.g. tierB-001149 tierC-000261

;; ---- slot delicious.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 delicious)    ;; n 1 docs 1  e.g. tierB-001495
(And (Member $x0 delicious) (Member $x0 food))    ;; n 1 docs 1  e.g. tierB-001495
(And (Member $x0 delicious) (Member $x0 inexpensive))    ;; n 1 docs 1  e.g. tierB-001495

;; ---- slot demand.Member  [event center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $e0 demand)    ;; n 2 docs 2  e.g. tierB-000602 tierB-001032
(And (Member $e0 demand) (Member $e0 high))    ;; n 1 docs 1  e.g. tierB-000602

;; ---- slot desk.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 desk)    ;; n 3 docs 3  e.g. tierB-001002 tierB-001053

;; ---- slot destined.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 destined)    ;; n 1 docs 1  e.g. tierC-000009
(And (Member $x0 destined) (Member $x0 film))    ;; n 1 docs 1  e.g. tierC-000009
(And (Member $x0 destined) (Member $x0 syrian_film))    ;; n 1 docs 1  e.g. tierC-000009

;; ---- slot dictionary.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 dictionary)    ;; n 2 docs 2  e.g. tierB-001255 tierB-001329
(And (Member $x0 dictionary) (Member $x0 great))    ;; n 1 docs 1  e.g. tierB-001329

;; ---- slot different.GroupOf  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $x0 different) (GroupOf $x0 culture))    ;; n 2 docs 2  e.g. tierB-001022 tierB-001529
(And (Member $x0 different) (GroupOf $x0 language))    ;; n 1 docs 1  e.g. tierB-001529

;; ---- slot different.Member  [entity center; head other]  n 3  docs<= 2  distinct 1  eventive 0
(Member $x0 different)    ;; n 3 docs 2  e.g. tierB-001022 tierB-001529

;; ---- slot difficult.Member  [event center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $e0 difficult)    ;; n 2 docs 2  e.g. tierB-000925 tierB-001535
(And (Member $e0 difficult) (Member $e0 obtain))    ;; n 1 docs 1  e.g. tierB-001535

;; ---- slot display.Member  [event center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $e0 display)    ;; n 2 docs 2  e.g. tierB-001253 tierB-001318
(And (Member $e0 display) (Member $e0 popular))    ;; n 1 docs 1  e.g. tierB-001318

;; ---- slot drive.Member  [event center; head other]  n 3  docs<= 2  distinct 1  eventive 0
(Member $e0 drive)    ;; n 3 docs 2  e.g. tierB-000426 tierB-001430

;; ---- slot earth.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 earth)    ;; n 2 docs 2  e.g. tierB-001322 tierB-001582
(And (Member $x0 earth) (Member $x0 red))    ;; n 1 docs 1  e.g. tierB-001582

;; ---- slot encourage.Member  [event center; head other]  n 3  docs<= 2  distinct 1  eventive 0
(Member $e0 encourage)    ;; n 3 docs 2  e.g. tierC-000107 tierC-000108

;; ---- slot endeavor.Member  [event center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $e0 endeavor)    ;; n 1 docs 1  e.g. tierB-000538
(And (Member $e0 endeavor) (Member $e0 noble))    ;; n 1 docs 1  e.g. tierB-000538
(And (Member $e0 endeavor) (Member $e0 shoplift))    ;; n 1 docs 1  e.g. tierB-000538

;; ---- slot event.Member  [event center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $e0 event)    ;; n 2 docs 2  e.g. tierB-000559 tierB-000808
(And (Member $e0 event) (Member $e0 unexpected))    ;; n 1 docs 1  e.g. tierB-000808

;; ---- slot father.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 father)    ;; n 3 docs 3  e.g. tierB-001743 tierC-000123

;; ---- slot feel.Member  [event center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $e0 feel)    ;; n 2 docs 2  e.g. tierB-000261 tierB-000534
(And (Member $e0 feel) (Member $e0 light_headed))    ;; n 1 docs 1  e.g. tierB-000534

;; ---- slot fibrous.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 fibrous)    ;; n 1 docs 1  e.g. tierB-001846
(And (Member $x0 fibrous) (Member $x0 soft))    ;; n 1 docs 1  e.g. tierB-001846
(And (Member $x0 fibrous) (Member $x0 texture))    ;; n 1 docs 1  e.g. tierB-001846

;; ---- slot fight.Against  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(And (Member $x0 fight) (Against $x0 death))    ;; n 1 docs 1  e.g. tierB-001610
(And (Member $x0 fight) (Against $x0 fate))    ;; n 1 docs 1  e.g. tierB-001610
(And (Member $x0 fight) (Against $x0 nature))    ;; n 1 docs 1  e.g. tierB-001610

;; ---- slot fight.Member  [event center; head other]  n 3  docs<= 2  distinct 1  eventive 0
(Member $e0 fight)    ;; n 3 docs 2  e.g. tierB-001379 tierB-001629

;; ---- slot freedom_of_association.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 freedom_of_association)    ;; n 1 docs 1  e.g. tierB-000521
(And (Member $x0 freedom_of_association) (Member $x0 freedom_of_peaceful_assembly))    ;; n 1 docs 1  e.g. tierB-000521
(And (Member $x0 freedom_of_association) (Member $x0 right))    ;; n 1 docs 1  e.g. tierB-000521

;; ---- slot fund.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 fund)    ;; n 3 docs 3  e.g. tierC-000217 tierC-000218

;; ---- slot gate.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 gate)    ;; n 2 docs 2  e.g. tierB-000455 tierB-001741
(And (Member $x0 gate) (Member $x0 narrow))    ;; n 1 docs 1  e.g. tierB-001741

;; ---- slot go.To  [event center; head other]  n 3  docs<= 3  distinct 2  eventive 3
(And (Member $e0 go) (To $e0 $e1) (Member $e1 talk))    ;; n 2 docs 2  e.g. tierC-000209 tierC-000210
(And (Member $e0 go) (To $e0 $e1) (Member $e1 see))    ;; n 1 docs 1  e.g. tierB-000115

;; ---- slot grow.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 grow)    ;; n 3 docs 3  e.g. tierB-000228 tierB-001384

;; ---- slot hard.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 hard)    ;; n 2 docs 2  e.g. tierB-000795 tierB-001980
(And (Member $x0 hard) (Member $x0 work))    ;; n 1 docs 1  e.g. tierB-001980

;; ---- slot hard.Member  [event center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $e0 hard)    ;; n 2 docs 2  e.g. tierB-001339 tierB-001523
(And (Member $e0 hard) (Member $e0 make))    ;; n 1 docs 1  e.g. tierB-001339

;; ---- slot hat.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 hat)    ;; n 1 docs 1  e.g. tierB-000596
(And (Member $x0 hat) (Member $x0 limp))    ;; n 1 docs 1  e.g. tierB-000596
(And (Member $x0 hat) (Member $x0 wet))    ;; n 1 docs 1  e.g. tierB-000596

;; ---- slot headquarters.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 headquarters)    ;; n 3 docs 3  e.g. tierB-000285 tierC-000197

;; ---- slot hold_up.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 hold_up)    ;; n 3 docs 3  e.g. tierB-000329 tierB-000692

;; ---- slot influence.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 influence)    ;; n 3 docs 3  e.g. tierC-000257 tierC-000258

;; ---- slot king.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 king)    ;; n 3 docs 3  e.g. tierB-000248 tierB-000551

;; ---- slot know.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 know)    ;; n 3 docs 3  e.g. tierB-000689 tierB-001449

;; ---- slot layer.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 layer)    ;; n 1 docs 1  e.g. tierB-000208
(And (Member $x0 layer) (Member $x0 oil))    ;; n 1 docs 1  e.g. tierB-000208
(And (Member $x0 layer) (Member $x0 thin))    ;; n 1 docs 1  e.g. tierB-000208

;; ---- slot learn.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 learn)    ;; n 3 docs 3  e.g. tierB-000229 tierB-000282

;; ---- slot leave.Result  [event center; head other]  n 3  docs<= 3  distinct 3  eventive 3
(And (Member $e0 leave) (Result $e0 $e1) (Member $e1 on))    ;; n 1 docs 1  e.g. tierB-000004
(And (Member $e0 leave) (Result $e0 $e1) (Member $e1 open))    ;; n 1 docs 1  e.g. tierB-000425
(And (Member $e0 leave) (Result $e0 $e1) (Member $e1 unlocked))    ;; n 1 docs 1  e.g. tierB-000747

;; ---- slot living_room.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 living_room)    ;; n 2 docs 2  e.g. tierB-001670 tierB-001938
(And (Member $x0 living_room) (Member $x0 spacious))    ;; n 1 docs 1  e.g. tierB-001938

;; ---- slot mammoth.Member  [event center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $e0 mammoth)    ;; n 1 docs 1  e.g. tierB-001257
(And (Member $e0 mammoth) (Member $e0 task))    ;; n 1 docs 1  e.g. tierB-001257
(And (Member $e0 mammoth) (Member $e0 try))    ;; n 1 docs 1  e.g. tierB-001257

;; ---- slot marry.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 marry)    ;; n 3 docs 3  e.g. tierB-000478 tierC-000075

;; ---- slot mean.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 mean)    ;; n 3 docs 3  e.g. tierB-000759 tierB-001149

;; ---- slot mess.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 mess)    ;; n 1 docs 1  e.g. tierB-001123
(And (Member $x0 mess) (Member $x0 place))    ;; n 1 docs 1  e.g. tierB-001123
(And (Member $x0 mess) (Member $x0 whole))    ;; n 1 docs 1  e.g. tierB-001123

;; ---- slot method.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 method)    ;; n 3 docs 3  e.g. tierB-000625 tierC-000061

;; ---- slot moist.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 moist)    ;; n 1 docs 1  e.g. tierC-000340
(And (Member $x0 moist) (Member $x0 natural_lowland_forest))    ;; n 1 docs 1  e.g. tierC-000340
(And (Member $x0 moist) (Member $x0 plantation))    ;; n 1 docs 1  e.g. tierC-000340

;; ---- slot morning.Member  [entity center; head other]  n 3  docs<= 2  distinct 1  eventive 0
(Member $x0 morning)    ;; n 3 docs 2  e.g. tierB-000229 tierB-000511

;; ---- slot mosque.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 mosque)    ;; n 2 docs 2  e.g. tierB-000665 tierB-001554
(And (Member $x0 mosque) (Member $x0 old))    ;; n 1 docs 1  e.g. tierB-000665

;; ---- slot mountain.Member  [entity center; head other]  n 3  docs<= 2  distinct 1  eventive 0
(Member $x0 mountain)    ;; n 3 docs 2  e.g. tierB-000045 tierB-000054

;; ---- slot museum.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 museum)    ;; n 2 docs 2  e.g. tierB-001423 tierB-001653
(And (Member $x0 museum) (Member $x0 worth))    ;; n 1 docs 1  e.g. tierB-001653

;; ---- slot name.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 name)    ;; n 3 docs 3  e.g. tierB-000139 tierC-000111

;; ---- slot neighbouring.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 neighbouring)    ;; n 1 docs 1  e.g. tierC-000117
(And (Member $x0 neighbouring) (Member $x0 other))    ;; n 1 docs 1  e.g. tierC-000117
(And (Member $x0 neighbouring) (Member $x0 sunni))    ;; n 1 docs 1  e.g. tierC-000117

;; ---- slot on.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 on)    ;; n 2 docs 2  e.g. tierB-000004 tierB-001051
(And (Member $x0 on) (Member $x0 program))    ;; n 1 docs 1  e.g. tierB-001051

;; ---- slot opportunity.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 opportunity)    ;; n 3 docs 3  e.g. tierB-000252 tierB-000332

;; ---- slot orchestra.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 orchestra)    ;; n 3 docs 3  e.g. tierB-001087 tierC-000341

;; ---- slot page.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 page)    ;; n 3 docs 3  e.g. tierB-000172 tierB-001250

;; ---- slot paint.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 paint)    ;; n 3 docs 3  e.g. tierB-000455 tierC-000293

;; ---- slot patient.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 patient)    ;; n 3 docs 3  e.g. tierB-000049 tierB-001263

;; ---- slot personality.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 personality)    ;; n 3 docs 3  e.g. tierB-001462 tierC-000227

;; ---- slot pick_up.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 pick_up)    ;; n 3 docs 3  e.g. tierB-000334 tierB-001040

;; ---- slot pie.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 pie)    ;; n 2 docs 2  e.g. tierB-000464 tierB-001745
(And (Member $x0 pie) (Member $x0 scrumptious))    ;; n 1 docs 1  e.g. tierB-000464

;; ---- slot plane.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 plane)    ;; n 3 docs 3  e.g. tierB-000045 tierB-000132

;; ---- slot plot.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 plot)    ;; n 2 docs 2  e.g. tierB-001555 tierB-001964
(And (Member $x0 plot) (Member $x0 predictable))    ;; n 1 docs 1  e.g. tierB-001555

;; ---- slot police.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 police)    ;; n 3 docs 3  e.g. tierB-000150 tierB-000256

;; ---- slot pull.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 pull)    ;; n 3 docs 3  e.g. tierB-000470 tierB-001120

;; ---- slot race.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 race)    ;; n 3 docs 3  e.g. tierB-000145 tierC-000029

;; ---- slot rag.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 rag)    ;; n 1 docs 1  e.g. tierB-001143
(And (Member $x0 rag) (Member $x0 smelly))    ;; n 1 docs 1  e.g. tierB-001143
(And (Member $x0 rag) (Member $x0 terrible))    ;; n 1 docs 1  e.g. tierB-001143

;; ---- slot reach.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 reach)    ;; n 3 docs 3  e.g. tierB-000117 tierB-001082

;; ---- slot read.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 read)    ;; n 3 docs 3  e.g. tierB-000783 tierB-001221

;; ---- slot recipe.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 recipe)    ;; n 2 docs 2  e.g. tierB-000312 tierB-000892
(And (Member $x0 recipe) (Member $x0 traditional))    ;; n 1 docs 1  e.g. tierB-000312

;; ---- slot recreational_sport.Member  [entity center; head other]  n 3  docs<= 3  distinct 3  eventive 0
(Member $x0 recreational_sport)    ;; n 1 docs 1  e.g. tierC-000147
(And (Member $x0 recreational_sport) (Member $x0 sporting_activity))    ;; n 1 docs 1  e.g. tierC-000147
(And (Member $x0 recreational_sport) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierC-000147

;; ---- slot recreational_sport.Member  [event center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $e0 recreational_sport)    ;; n 2 docs 2  e.g. tierC-000147 tierC-000148
(And (Member $e0 recreational_sport) (Member $e0 sporting_activity))    ;; n 1 docs 1  e.g. tierC-000147

;; ---- slot report.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 report)    ;; n 3 docs 3  e.g. tierB-000224 tierB-000306

;; ---- slot return.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 return)    ;; n 3 docs 3  e.g. tierB-000688 tierC-000255

;; ---- slot rope.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 rope)    ;; n 2 docs 2  e.g. tierB-000392 tierB-000737
(And (Member $x0 rope) (Member $x0 weak))    ;; n 1 docs 1  e.g. tierB-000737

;; ---- slot rule.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 rule)    ;; n 3 docs 3  e.g. tierB-000311 tierC-000095

;; ---- slot see.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 see)    ;; n 3 docs 3  e.g. tierB-000115 tierB-000686

;; ---- slot shine.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 shine)    ;; n 3 docs 3  e.g. tierB-001218 tierB-001933

;; ---- slot shoot.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 shoot)    ;; n 3 docs 3  e.g. tierB-000256 tierB-000813

;; ---- slot small.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 small)    ;; n 2 docs 2  e.g. tierB-000975 tierB-001651
(And (Member $x0 small) (Member $x0 token))    ;; n 1 docs 1  e.g. tierB-001651

;; ---- slot snow.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 snow)    ;; n 3 docs 3  e.g. tierB-000154 tierB-000445

;; ---- slot solve.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 solve)    ;; n 3 docs 3  e.g. tierB-000935 tierB-001202

;; ---- slot spider.Member  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(Member $x0 spider)    ;; n 2 docs 2  e.g. tierB-000503 tierB-000734
(And (Member $x0 spider) (Member $x0 vegetarian))    ;; n 1 docs 1  e.g. tierB-000734

;; ---- slot station.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 station)    ;; n 3 docs 3  e.g. tierB-000081 tierB-000706

;; ---- slot stick.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 stick)    ;; n 3 docs 3  e.g. tierB-000383 tierB-000482

;; ---- slot storm.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 storm)    ;; n 3 docs 3  e.g. tierB-000134 tierB-000775

;; ---- slot story.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 story)    ;; n 3 docs 3  e.g. tierB-001280 tierC-000177

;; ---- slot succeed.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 succeed)    ;; n 3 docs 3  e.g. tierC-000075 tierC-000100

;; ---- slot sugar.Member  [entity center; head other]  n 3  docs<= 2  distinct 1  eventive 0
(Member $x0 sugar)    ;; n 3 docs 2  e.g. tierB-000541 tierB-001243

;; ---- slot suggest.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 suggest)    ;; n 3 docs 3  e.g. tierB-000700 tierC-000017

;; ---- slot take_off.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 take_off)    ;; n 3 docs 3  e.g. tierB-000132 tierB-000147

;; ---- slot take_over.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 take_over)    ;; n 3 docs 3  e.g. tierB-001234 tierC-000109

;; ---- slot teacher.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 teacher)    ;; n 3 docs 3  e.g. tierB-000700 tierB-000749

;; ---- slot thing.LocatedIn  [entity center; head other]  n 3  docs<= 3  distinct 2  eventive 0
(And (Member $x0 thing) (LocatedIn $x0 $x1) (Member $x1 hill))    ;; n 2 docs 2  e.g. tierC-000343 tierC-000344
(And (Member $x0 thing) (LocatedIn $x0 $x1) (Member $x1 closet))    ;; n 1 docs 1  e.g. tierB-000756

;; ---- slot treaty.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 treaty)    ;; n 3 docs 3  e.g. tierB-000128 tierB-000437

;; ---- slot understand.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 understand)    ;; n 3 docs 3  e.g. tierB-000114 tierB-000816

;; ---- slot wait.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 wait)    ;; n 3 docs 3  e.g. tierB-000002 tierB-000712

;; ---- slot water.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 water)    ;; n 3 docs 3  e.g. tierB-000032 tierB-001271

;; ---- slot wear.Member  [event center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $e0 wear)    ;; n 3 docs 3  e.g. tierB-001318 tierB-001396

;; ---- slot wood.Member  [entity center; head other]  n 3  docs<= 3  distinct 1  eventive 0
(Member $x0 wood)    ;; n 3 docs 3  e.g. tierB-000039 tierB-001055

;; ---- slot <unclassed>.Before  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Before $x0 $e1) (Member $e1 return))    ;; n 2 docs 2  e.g. tierC-000255 tierC-000256

;; ---- slot <unclassed>.From  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (From $x0 $x1) (Member $x1 country))    ;; n 1 docs 1  e.g. tierB-000622
(From $x0 god)    ;; n 1 docs 1  e.g. tierB-000424

;; ---- slot <unclassed>.Of  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 1
(And (Of $x0 $e1) (Member $e1 look))    ;; n 1 docs 1  e.g. tierB-001985
(And (Of $x0 $x1) (Member $x1 measure))    ;; n 1 docs 1  e.g. tierB-000409

;; ---- slot <unclassed>.On  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(On $x0 campus)    ;; n 1 docs 1  e.g. tierB-001066
(And (On $x0 $x1) (Member $x1 desk))    ;; n 1 docs 1  e.g. tierB-001186

;; ---- slot <unclassed>.To  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (To $x0 $x1) (Member $x1 city))    ;; n 1 docs 1  e.g. tierB-000913
(And (To $x0 $x1) (Member $x1 marry))    ;; n 1 docs 1  e.g. tierB-001673

;; ---- slot <unclassed>.With  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(With $x0 west_virginia)    ;; n 2 docs 2  e.g. tierC-000255 tierC-000256

;; ---- slot abundant.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 abundant)    ;; n 1 docs 1  e.g. tierB-001254
(And (Member $x0 abundant) (Member $x0 nutrition))    ;; n 1 docs 1  e.g. tierB-001254

;; ---- slot actress.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 actress)    ;; n 2 docs 2  e.g. tierB-001156 tierB-001547

;; ---- slot actual.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 actual)    ;; n 1 docs 1  e.g. tierB-001336
(And (Member $x0 actual) (Member $x0 fact))    ;; n 1 docs 1  e.g. tierB-001336

;; ---- slot adaptor.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 adaptor)    ;; n 1 docs 1  e.g. tierB-001873
(And (Member $x0 adaptor) (Member $x0 old))    ;; n 1 docs 1  e.g. tierB-001873

;; ---- slot add.To  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 add) (To $e0 $x1) (Member $x1 personality))    ;; n 2 docs 2  e.g. tierC-000227 tierC-000228

;; ---- slot address.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 address)    ;; n 2 docs 2  e.g. tierB-000816 tierC-000137

;; ---- slot advice.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 advice)    ;; n 1 docs 1  e.g. tierB-000137
(And (Member $x0 advice) (Member $x0 good))    ;; n 1 docs 1  e.g. tierB-000137

;; ---- slot affair.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 affair)    ;; n 1 docs 1  e.g. tierB-000235
(And (Member $x0 affair) (Member $x0 strange))    ;; n 1 docs 1  e.g. tierB-000235

;; ---- slot afloat.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 afloat)    ;; n 1 docs 1  e.g. tierB-001179
(And (Member $x0 afloat) (Member $x0 business))    ;; n 1 docs 1  e.g. tierB-001179

;; ---- slot aging.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 aging)    ;; n 1 docs 1  e.g. tierB-000617
(And (Member $x0 aging) (Member $x0 population))    ;; n 1 docs 1  e.g. tierB-000617

;; ---- slot album.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 album)    ;; n 2 docs 2  e.g. tierC-000103 tierC-000104

;; ---- slot all.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 all)    ;; n 1 docs 1  e.g. tierB-000988
(And (Member $x0 all) (Member $x0 cosmos))    ;; n 1 docs 1  e.g. tierB-000988

;; ---- slot allotted.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 allotted)    ;; n 1 docs 1  e.g. tierB-001062
(And (Member $x0 allotted) (Member $x0 time))    ;; n 1 docs 1  e.g. tierB-001062

;; ---- slot amazing.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 amazing)    ;; n 1 docs 1  e.g. tierB-000954
(And (Member $x0 amazing) (Member $x0 collection))    ;; n 1 docs 1  e.g. tierB-000954

;; ---- slot ancient.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 ancient)    ;; n 1 docs 1  e.g. tierB-001848
(And (Member $x0 ancient) (Member $x0 law))    ;; n 1 docs 1  e.g. tierB-001848

;; ---- slot annoying.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 annoying)    ;; n 1 docs 1  e.g. tierB-000587
(And (Member $e0 annoying) (Member $e0 yell))    ;; n 1 docs 1  e.g. tierB-000587

;; ---- slot answer.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 answer)    ;; n 1 docs 1  e.g. tierB-000997
(And (Member $x0 answer) (Member $x0 no))    ;; n 1 docs 1  e.g. tierB-000997

;; ---- slot apartment.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 apartment)    ;; n 1 docs 1  e.g. tierB-001201
(And (Member $x0 apartment) (Member $x0 expensive))    ;; n 1 docs 1  e.g. tierB-001201

;; ---- slot appetizing.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 appetizing)    ;; n 1 docs 1  e.g. tierB-000734
(And (Member $x0 appetizing) (Member $x0 bug))    ;; n 1 docs 1  e.g. tierB-000734

;; ---- slot apple.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 apple)    ;; n 2 docs 2  e.g. tierB-000458 tierB-001340

;; ---- slot appropriate.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 appropriate)    ;; n 1 docs 1  e.g. tierB-000870
(And (Member $x0 appropriate) (Member $x0 customer_service_helpline))    ;; n 1 docs 1  e.g. tierB-000870

;; ---- slot area.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 area)    ;; n 2 docs 2  e.g. tierB-000096 tierB-001225

;; ---- slot arm.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 arm)    ;; n 1 docs 1  e.g. tierC-000008
(And (Member $x0 arm) (Member $x0 central))    ;; n 1 docs 1  e.g. tierC-000008

;; ---- slot aroma.Possession  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 aroma) (Possession $x0 coffee))    ;; n 1 docs 1  e.g. tierB-001403
(And (Member $x0 aroma) (Possession $x0 croissant))    ;; n 1 docs 1  e.g. tierB-001403

;; ---- slot arrange.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 arrange)    ;; n 2 docs 2  e.g. tierC-000349 tierC-000350

;; ---- slot arrest.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 arrest)    ;; n 2 docs 2  e.g. tierB-000770 tierB-001600

;; ---- slot aspect.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 aspect)    ;; n 1 docs 1  e.g. tierB-001537
(And (Member $x0 aspect) (Member $x0 scientific))    ;; n 1 docs 1  e.g. tierB-001537

;; ---- slot assistant.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 assistant)    ;; n 2 docs 2  e.g. tierC-000151 tierC-000152

;; ---- slot attack.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 attack)    ;; n 2 docs 2  e.g. tierB-001096 tierB-001212

;; ---- slot attempt.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 attempt)    ;; n 2 docs 1  e.g. tierB-000166

;; ---- slot attention.From  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 attention) (From $x0 $x1) (Member $x1 mainstream_media))    ;; n 1 docs 1  e.g. tierC-000178
(And (Member $x0 attention) (From $x0 $x1) (Member $x1 social_media))    ;; n 1 docs 1  e.g. tierC-000178

;; ---- slot attract.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 attract)    ;; n 2 docs 2  e.g. tierC-000177 tierC-000178

;; ---- slot attractive.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 attractive)    ;; n 1 docs 1  e.g. tierB-001874
(And (Member $x0 attractive) (Member $x0 profession))    ;; n 1 docs 1  e.g. tierB-001874

;; ---- slot audience.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 audience)    ;; n 1 docs 1  e.g. tierB-001666
(And (Member $x0 audience) (Member $x0 large))    ;; n 1 docs 1  e.g. tierB-001666

;; ---- slot baby.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 baby)    ;; n 2 docs 2  e.g. tierB-000065 tierB-001039

;; ---- slot back_door.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 back_door)    ;; n 2 docs 2  e.g. tierB-000189 tierB-000500

;; ---- slot backward.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 backward)    ;; n 1 docs 1  e.g. tierB-001504
(And (Member $e0 backward) (Member $e0 country))    ;; n 1 docs 1  e.g. tierB-001504

;; ---- slot bacterium.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 bacterium)    ;; n 1 docs 1  e.g. tierB-001984
(And (Member $x0 bacterium) (Member $x0 new))    ;; n 1 docs 1  e.g. tierB-001984

;; ---- slot balance.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 balance)    ;; n 1 docs 1  e.g. tierC-000258
(And (Member $x0 balance) (Member $x0 international))    ;; n 1 docs 1  e.g. tierC-000258

;; ---- slot balloon.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 balloon)    ;; n 1 docs 1  e.g. tierB-000036
(And (Member $x0 balloon) (Member $x0 little))    ;; n 1 docs 1  e.g. tierB-000036

;; ---- slot ban.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 ban)    ;; n 2 docs 2  e.g. tierB-000309 tierB-000830

;; ---- slot band.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 band)    ;; n 2 docs 2  e.g. tierC-000179 tierC-000180

;; ---- slot barking.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 barking)    ;; n 1 docs 1  e.g. tierB-001479
(And (Member $x0 barking) (Member $x0 growling))    ;; n 1 docs 1  e.g. tierB-001479

;; ---- slot barometer.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 barometer)    ;; n 2 docs 2  e.g. tierC-000213 tierC-000214

;; ---- slot basement.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 basement)    ;; n 2 docs 2  e.g. tierB-000178 tierB-000385

;; ---- slot basket.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 basket)    ;; n 1 docs 1  e.g. tierB-000019
(And (Member $x0 basket) (Member $x0 red))    ;; n 1 docs 1  e.g. tierB-000019

;; ---- slot bathroom.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 bathroom)    ;; n 2 docs 2  e.g. tierB-001145 tierB-001185

;; ---- slot battle.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 battle)    ;; n 2 docs 2  e.g. tierB-000411 tierB-001522

;; ---- slot battle.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 battle)    ;; n 1 docs 1  e.g. tierB-001076
(And (Member $e0 battle) (Member $e0 climactic))    ;; n 1 docs 1  e.g. tierB-001076

;; ---- slot beast.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 beast)    ;; n 1 docs 1  e.g. tierB-000231
(And (Member $x0 beast) (Member $x0 crawling))    ;; n 1 docs 1  e.g. tierB-000231

;; ---- slot become.Before  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 become) (Before $e0 $e1) (Member $e1 cease))    ;; n 2 docs 2  e.g. tierC-000001 tierC-000002

;; ---- slot believe.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 believe)    ;; n 2 docs 2  e.g. tierC-000061 tierC-000062

;; ---- slot berber_speaking.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 berber_speaking)    ;; n 1 docs 1  e.g. tierB-000005
(And (Member $x0 berber_speaking) (Member $x0 population))    ;; n 1 docs 1  e.g. tierB-000005

;; ---- slot big.During  [entity center; head other]  n 2  docs<= 4  distinct 3  eventive 0
(And (Member $x0 big) (During $x0 $x1) (Member $x1 homecoming_game))    ;; n 2 (mass 1) docs 2  e.g. tierC-000019 tierC-000020
(And (Member $x0 big) (During $x0 $x1) (Member $x1 great))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000020
(And (Member $x0 big) (During $x0 $x1) (Member $x1 large))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000019

;; ---- slot bill.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 bill)    ;; n 2 docs 2  e.g. tierB-000640 tierB-000974

;; ---- slot bird.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 bird)    ;; n 2 docs 2  e.g. tierB-000924 tierB-001888

;; ---- slot birthday.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 birthday)    ;; n 2 docs 2  e.g. tierB-000303 tierB-000452

;; ---- slot black.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 black)    ;; n 2 docs 2  e.g. tierB-000476 tierB-001882

;; ---- slot block.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 block)    ;; n 2 docs 2  e.g. tierB-000622 tierB-000913

;; ---- slot border_section.LocatedIn  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 border_section) (LocatedIn $x0 kenya))    ;; n 1 docs 1  e.g. tierC-000217
(And (Member $x0 border_section) (LocatedIn $x0 lessos))    ;; n 1 docs 1  e.g. tierC-000217

;; ---- slot borrow.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 borrow)    ;; n 2 docs 2  e.g. tierC-000237 tierC-000238

;; ---- slot brain_haemorrhage.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 brain_haemorrhage)    ;; n 1 docs 1  e.g. tierB-001498
(And (Member $x0 brain_haemorrhage) (Member $x0 severe))    ;; n 1 docs 1  e.g. tierB-001498

;; ---- slot brand_new.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 brand_new)    ;; n 1 docs 1  e.g. tierB-000444
(And (Member $x0 brand_new) (Member $x0 ferrari))    ;; n 1 docs 1  e.g. tierB-000444

;; ---- slot break.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 break)    ;; n 2 docs 2  e.g. tierB-000320 tierC-000244

;; ---- slot broadcast.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 broadcast)    ;; n 2 docs 2  e.g. tierB-000903 tierB-001007

;; ---- slot burn.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 burn)    ;; n 2 docs 2  e.g. tierB-000196 tierB-001882

;; ---- slot burst.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 burst)    ;; n 2 docs 2  e.g. tierB-000369 tierB-001765

;; ---- slot cabin.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 cabin)    ;; n 1 docs 1  e.g. tierB-000647
(And (Member $x0 cabin) (Member $x0 small))    ;; n 1 docs 1  e.g. tierB-000647

;; ---- slot cake.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 cake)    ;; n 2 docs 2  e.g. tierB-000916 tierB-001518

;; ---- slot call.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 call)    ;; n 2 docs 2  e.g. tierB-000239 tierB-000547

;; ---- slot calm.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 calm)    ;; n 1 docs 1  e.g. tierB-000618
(And (Member $x0 calm) (Member $x0 water))    ;; n 1 docs 1  e.g. tierB-000618

;; ---- slot car_dealer.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 car_dealer)    ;; n 1 docs 1  e.g. tierB-001693
(And (Member $x0 car_dealer) (Member $x0 local))    ;; n 1 docs 1  e.g. tierB-001693

;; ---- slot careless.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 careless)    ;; n 1 docs 1  e.g. tierB-001452
(And (Member $x0 careless) (Member $x0 mistake))    ;; n 1 docs 1  e.g. tierB-001452

;; ---- slot caretaker.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 caretaker)    ;; n 2 docs 2  e.g. tierC-000337 tierC-000338

;; ---- slot caretaker.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 caretaker) (Possession $x0 breakheart_hill))    ;; n 2 docs 2  e.g. tierC-000337 tierC-000338

;; ---- slot cat.LocatedIn  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 cat) (LocatedIn $x0 $x1) (Member $x1 sheet))    ;; n 1 docs 1  e.g. tierB-001193
(And (Member $x0 cat) (LocatedIn $x0 there))    ;; n 1 docs 1  e.g. tierB-001607

;; ---- slot catch.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 catch)    ;; n 2 docs 2  e.g. tierB-000222 tierB-001900

;; ---- slot catchy.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 catchy)    ;; n 1 docs 1  e.g. tierB-000509
(And (Member $x0 catchy) (Member $x0 tune))    ;; n 1 docs 1  e.g. tierB-000509

;; ---- slot cease.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 cease)    ;; n 2 docs 2  e.g. tierC-000001 tierC-000002

;; ---- slot ceiling.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 ceiling)    ;; n 2 docs 2  e.g. tierB-000687 tierB-001925

;; ---- slot celebrated.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 celebrated)    ;; n 1 docs 1  e.g. tierC-000013
(And (Member $e0 celebrated) (Member $e0 warrior))    ;; n 1 docs 1  e.g. tierC-000013

;; ---- slot cell_phone.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 cell_phone)    ;; n 1 docs 1  e.g. tierB-001168
(And (Member $x0 cell_phone) (Member $x0 new))    ;; n 1 docs 1  e.g. tierB-001168

;; ---- slot cemetery.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 cemetery)    ;; n 2 docs 2  e.g. tierB-000143 tierB-001950

;; ---- slot chandelier.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 chandelier)    ;; n 1 docs 1  e.g. tierB-001925
(And (Member $x0 chandelier) (Member $x0 large))    ;; n 1 docs 1  e.g. tierB-001925

;; ---- slot change.Member  [entity center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $x0 change)    ;; n 2 docs 1  e.g. tierB-000663

;; ---- slot chapel.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 chapel) (PartOf $x0 $x1) (Member $x1 listed_building))    ;; n 2 docs 2  e.g. tierC-000115 tierC-000116

;; ---- slot cheese.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 cheese)    ;; n 1 docs 1  e.g. tierB-001032
(And (Member $x0 cheese) (Member $x0 extra))    ;; n 1 docs 1  e.g. tierB-001032

;; ---- slot chicken.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 chicken)    ;; n 2 docs 2  e.g. tierB-000616 tierB-001304

;; ---- slot choice_of_words.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 choice_of_words)    ;; n 1 docs 1  e.g. tierB-000558
(And (Member $x0 choice_of_words) (Member $x0 good))    ;; n 1 docs 1  e.g. tierB-000558

;; ---- slot church.LocatedIn  [entity center; head other]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $x0 church) (LocatedIn $x0 $x1) (Member $x1 edge))    ;; n 1 docs 1  e.g. tierB-000739
(And (Member $x0 church) (LocatedIn $x0 $x1) (Member $x1 other))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000202
(And (Member $x0 church) (LocatedIn $x0 $x1) (Member $x1 side))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000202

;; ---- slot claim.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 claim)    ;; n 2 docs 2  e.g. tierB-000191 tierB-001542

;; ---- slot clean.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 clean)    ;; n 2 docs 2  e.g. tierB-001143 tierB-001231

;; ---- slot clicking.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 clicking)    ;; n 1 docs 1  e.g. tierB-000951
(And (Member $x0 clicking) (Member $x0 sound))    ;; n 1 docs 1  e.g. tierB-000951

;; ---- slot close.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 close)    ;; n 1 docs 1  e.g. tierB-000987
(And (Member $x0 close) (Member $x0 look))    ;; n 1 docs 1  e.g. tierB-000987

;; ---- slot cloth.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 cloth)    ;; n 2 docs 2  e.g. tierB-000047 tierB-000091

;; ---- slot coffee_brand.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 coffee_brand)    ;; n 1 docs 1  e.g. tierB-000975
(And (Member $x0 coffee_brand) (Member $x0 indie))    ;; n 1 docs 1  e.g. tierB-000975

;; ---- slot collapse.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 collapse)    ;; n 2 docs 2  e.g. tierB-000082 tierB-001567

;; ---- slot come_in.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 come_in)    ;; n 2 docs 2  e.g. tierB-000296 tierB-000500

;; ---- slot comfortable.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 comfortable)    ;; n 1 docs 1  e.g. tierB-000371
(And (Member $x0 comfortable) (Member $x0 house))    ;; n 1 docs 1  e.g. tierB-000371

;; ---- slot commit.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 commit)    ;; n 2 docs 2  e.g. tierB-001204 tierB-001858

;; ---- slot committee.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 committee) (GroupOf $x0 engineer))    ;; n 1 docs 1  e.g. tierB-000533
(And (Member $x0 committee) (GroupOf $x0 scientist))    ;; n 1 docs 1  e.g. tierB-000533

;; ---- slot common.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 common)    ;; n 1 docs 1  e.g. tierC-000136
(And (Member $x0 common) (Member $x0 view))    ;; n 1 docs 1  e.g. tierC-000136

;; ---- slot complicated.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 complicated)    ;; n 1 docs 1  e.g. tierB-001189
(And (Member $x0 complicated) (Member $x0 problem))    ;; n 1 docs 1  e.g. tierB-001189

;; ---- slot conical.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 conical)    ;; n 1 docs 1  e.g. tierB-001919
(And (Member $x0 conical) (Member $x0 roof))    ;; n 1 docs 1  e.g. tierB-001919

;; ---- slot conservative.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 conservative)    ;; n 1 docs 1  e.g. tierB-001817
(And (Member $x0 conservative) (Member $x0 revolutionary))    ;; n 1 docs 1  e.g. tierB-001817

;; ---- slot contact.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 contact)    ;; n 2 docs 2  e.g. tierC-000017 tierC-000018

;; ---- slot continue.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 continue)    ;; n 2 docs 2  e.g. tierB-000930 tierB-001977

;; ---- slot converse.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 converse)    ;; n 1 docs 1  e.g. tierB-001006
(And (Member $x0 converse) (Member $x0 true))    ;; n 1 docs 1  e.g. tierB-001006

;; ---- slot convert.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 convert)    ;; n 1 docs 1  e.g. tierB-000092
(And (Member $e0 convert) (Member $e0 wonderful))    ;; n 1 docs 1  e.g. tierB-000092

;; ---- slot cool.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 cool)    ;; n 1 docs 1  e.g. tierB-001307
(And (Member $x0 cool) (Member $x0 stuff))    ;; n 1 docs 1  e.g. tierB-001307

;; ---- slot corporation.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 corporation)    ;; n 1 docs 1  e.g. tierB-000538
(And (Member $x0 corporation) (Member $x0 massive))    ;; n 1 docs 1  e.g. tierB-000538

;; ---- slot correct.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 correct)    ;; n 1 docs 1  e.g. tierB-000555
(And (Member $x0 correct) (Member $x0 procedure))    ;; n 1 docs 1  e.g. tierB-000555

;; ---- slot cost.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 cost)    ;; n 2 docs 2  e.g. tierB-000617 tierB-001532

;; ---- slot cost.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 cost)    ;; n 2 docs 2  e.g. tierB-001452 tierB-001460

;; ---- slot cost.Possession  [entity center; head other]  n 2  docs<= 3  distinct 3  eventive 1
(And (Member $x0 cost) (Possession $x0 $e1) (Member $e1 finance))    ;; n 1 docs 1  e.g. tierB-001532
(And (Member $x0 cost) (Possession $x0 $x1) (Member $x1 aging))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000617
(And (Member $x0 cost) (Possession $x0 $x1) (Member $x1 population))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000617

;; ---- slot counter_space.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 counter_space)    ;; n 1 docs 1  e.g. tierB-001663
(And (Member $x0 counter_space) (Member $x0 extra))    ;; n 1 docs 1  e.g. tierB-001663

;; ---- slot counteract.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 counteract)    ;; n 2 docs 1  e.g. tierB-000516

;; ---- slot cozy.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 cozy)    ;; n 1 docs 1  e.g. tierB-001573
(And (Member $e0 cozy) (Member $e0 theater))    ;; n 1 docs 1  e.g. tierB-001573

;; ---- slot cracked.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 cracked)    ;; n 1 docs 1  e.g. tierB-001845
(And (Member $x0 cracked) (Member $x0 exe_file))    ;; n 1 docs 1  e.g. tierB-001845

;; ---- slot creaking.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 creaking)    ;; n 1 docs 1  e.g. tierB-000805
(And (Member $x0 creaking) (Member $x0 sound))    ;; n 1 docs 1  e.g. tierB-000805

;; ---- slot critic.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 critic)    ;; n 1 docs 1  e.g. tierB-000602
(And (Member $x0 critic) (Member $x0 young))    ;; n 1 docs 1  e.g. tierB-000602

;; ---- slot crow.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 crow)    ;; n 2 docs 2  e.g. tierB-001333 tierB-001655

;; ---- slot crucial.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 crucial)    ;; n 1 docs 1  e.g. tierB-000816
(And (Member $x0 crucial) (Member $x0 role))    ;; n 1 docs 1  e.g. tierB-000816

;; ---- slot curse.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 curse)    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot curse.To  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 2
(And (Member $e0 curse) (To $e0 $e1) (Member $e1 avoid))    ;; n 1 docs 1  e.g. tierC-000124
(And (Member $e0 curse) (To $e0 $e1) (Member $e1 prevent))    ;; n 1 docs 1  e.g. tierC-000123

;; ---- slot dance.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 dance)    ;; n 1 docs 1  e.g. tierB-001735
(And (Member $x0 dance) (Member $x0 little))    ;; n 1 docs 1  e.g. tierB-001735

;; ---- slot dancer.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 dancer)    ;; n 1 docs 1  e.g. tierB-000991
(And (Member $x0 dancer) (Member $x0 fantastic))    ;; n 1 docs 1  e.g. tierB-000991

;; ---- slot deafening.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 deafening)    ;; n 1 docs 1  e.g. tierB-001398
(And (Member $e0 deafening) (Member $e0 roar))    ;; n 1 docs 1  e.g. tierB-001398

;; ---- slot deal_with.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 deal_with)    ;; n 2 docs 2  e.g. tierB-000398 tierB-000555

;; ---- slot death_toll.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 death_toll)    ;; n 1 docs 1  e.g. tierB-000743
(And (Member $x0 death_toll) (Member $x0 unsettling))    ;; n 1 docs 1  e.g. tierB-000743

;; ---- slot decision.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 decision)    ;; n 2 docs 2  e.g. tierB-001339 tierB-001797

;; ---- slot deductible.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 deductible)    ;; n 1 docs 1  e.g. tierB-001758
(And (Member $x0 deductible) (Member $x0 high))    ;; n 1 docs 1  e.g. tierB-001758

;; ---- slot deep.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 deep)    ;; n 1 docs 1  e.g. tierB-000383
(And (Member $x0 deep) (Member $x0 snow))    ;; n 1 docs 1  e.g. tierB-000383

;; ---- slot degrading.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 degrading)    ;; n 1 docs 1  e.g. tierB-000768
(And (Member $x0 degrading) (Member $x0 lyric))    ;; n 1 docs 1  e.g. tierB-000768

;; ---- slot delayed.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 delayed)    ;; n 1 docs 1  e.g. tierB-000808
(And (Member $x0 delayed) (Member $x0 train))    ;; n 1 docs 1  e.g. tierB-000808

;; ---- slot dense.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 dense)    ;; n 1 docs 1  e.g. tierB-000329
(And (Member $x0 dense) (Member $x0 fog))    ;; n 1 docs 1  e.g. tierB-000329

;; ---- slot derivative.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 derivative)    ;; n 1 docs 1  e.g. tierB-000932
(And (Member $x0 derivative) (Member $x0 system))    ;; n 1 docs 1  e.g. tierB-000932

;; ---- slot deserve.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 deserve)    ;; n 2 docs 2  e.g. tierB-000628 tierB-001294

;; ---- slot desire.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 desire)    ;; n 1 docs 1  e.g. tierB-000840
(And (Member $x0 desire) (Member $x0 horizontal))    ;; n 1 docs 1  e.g. tierB-000840

;; ---- slot destroy.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 destroy)    ;; n 2 docs 2  e.g. tierB-000799 tierB-001163

;; ---- slot develop.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 develop)    ;; n 2 docs 2  e.g. tierB-000404 tierC-000349

;; ---- slot difference.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 difference)    ;; n 2 docs 2  e.g. tierB-000025 tierB-001455

;; ---- slot disappear.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 disappear)    ;; n 2 docs 2  e.g. tierB-000265 tierB-001752

;; ---- slot discipline.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 discipline)    ;; n 1 docs 1  e.g. tierC-000158
(And (Member $x0 discipline) (Member $x0 lax))    ;; n 1 docs 1  e.g. tierC-000158

;; ---- slot dishtowel.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 dishtowel)    ;; n 1 docs 1  e.g. tierB-000927
(And (Member $x0 dishtowel) (Member $x0 wet))    ;; n 1 docs 1  e.g. tierB-000927

;; ---- slot diverse.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 diverse)    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot double.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 double)    ;; n 2 docs 2  e.g. tierC-000055 tierC-000056

;; ---- slot downtown_area.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 downtown_area)    ;; n 1 docs 1  e.g. tierB-001313
(And (Member $x0 downtown_area) (Member $x0 heart))    ;; n 1 docs 1  e.g. tierB-001313

;; ---- slot drastic.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 drastic) (GroupOf $x0 measure))    ;; n 2 docs 2  e.g. tierB-000120 tierB-001591

;; ---- slot drastic.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 drastic)    ;; n 2 docs 2  e.g. tierB-000120 tierB-001591

;; ---- slot dream.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 dream)    ;; n 1 docs 1  e.g. tierB-000855
(And (Member $x0 dream) (Member $x0 weird))    ;; n 1 docs 1  e.g. tierB-000855

;; ---- slot dress.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 dress)    ;; n 2 docs 2  e.g. tierB-000028 tierB-001295

;; ---- slot due.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 due)    ;; n 1 docs 1  e.g. tierB-000315
(And (Member $x0 due) (Member $x0 plane))    ;; n 1 docs 1  e.g. tierB-000315

;; ---- slot due.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 due)    ;; n 2 docs 2  e.g. tierB-000315 tierB-000900

;; ---- slot ear_canal.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 ear_canal)    ;; n 2 docs 2  e.g. tierB-000278 tierB-000715

;; ---- slot early.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 early)    ;; n 1 docs 1  e.g. tierB-001901
(And (Member $x0 early) (Member $x0 morning_light))    ;; n 1 docs 1  e.g. tierB-001901

;; ---- slot easterly.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 easterly)    ;; n 1 docs 1  e.g. tierB-001163
(And (Member $x0 easterly) (Member $x0 wind))    ;; n 1 docs 1  e.g. tierB-001163

;; ---- slot eccentricity.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 eccentricity)    ;; n 1 docs 1  e.g. tierB-001213
(And (Member $x0 eccentricity) (Member $x0 mental_illness))    ;; n 1 docs 1  e.g. tierB-001213

;; ---- slot eerie.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 eerie)    ;; n 1 docs 1  e.g. tierB-000665
(And (Member $x0 eerie) (Member $x0 feeling))    ;; n 1 docs 1  e.g. tierB-000665

;; ---- slot elegant.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 elegant)    ;; n 1 docs 1  e.g. tierB-001627
(And (Member $x0 elegant) (Member $x0 logic))    ;; n 1 docs 1  e.g. tierB-001627

;; ---- slot element.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 element)    ;; n 1 docs 1  e.g. tierB-001807
(And (Member $x0 element) (Member $x0 translatable))    ;; n 1 docs 1  e.g. tierB-001807

;; ---- slot elevator.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 elevator)    ;; n 2 docs 2  e.g. tierB-001408 tierB-001612

;; ---- slot empty.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 empty)    ;; n 1 docs 1  e.g. tierB-001818
(And (Member $x0 empty) (Member $x0 place))    ;; n 1 docs 1  e.g. tierB-001818

;; ---- slot end.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 end)    ;; n 2 docs 2  e.g. tierB-000108 tierB-001921

;; ---- slot endorse.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 endorse)    ;; n 2 docs 2  e.g. tierC-000159 tierC-000355

;; ---- slot enlarged.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 enlarged)    ;; n 1 docs 1  e.g. tierB-001013
(And (Member $x0 enlarged) (Member $x0 social_horizon))    ;; n 1 docs 1  e.g. tierB-001013

;; ---- slot enough.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 enough)    ;; n 1 docs 1  e.g. tierB-001545
(And (Member $x0 enough) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierB-001545

;; ---- slot entertaining.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 entertaining)    ;; n 1 docs 1  e.g. tierB-001889
(And (Member $x0 entertaining) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierB-001889

;; ---- slot entrance.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 entrance)    ;; n 2 docs 2  e.g. tierB-000081 tierB-001108

;; ---- slot episode.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 episode)    ;; n 2 docs 2  e.g. tierC-000297 tierC-000298

;; ---- slot escape.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 escape)    ;; n 2 docs 2  e.g. tierB-000412 tierB-000772

;; ---- slot establish.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 establish)    ;; n 2 docs 2  e.g. tierB-000034 tierB-000373

;; ---- slot established.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 established)    ;; n 2 docs 2  e.g. tierC-000287 tierC-000288

;; ---- slot examine.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 examine)    ;; n 2 docs 2  e.g. tierB-001122 tierB-001836

;; ---- slot excellent.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 excellent)    ;; n 1 docs 1  e.g. tierB-000568
(And (Member $e0 excellent) (Member $e0 health))    ;; n 1 docs 1  e.g. tierB-000568

;; ---- slot exe_file.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 exe_file)    ;; n 1 docs 1  e.g. tierB-001845
(And (Member $x0 exe_file) (Member $x0 original))    ;; n 1 docs 1  e.g. tierB-001845

;; ---- slot exhibit.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 exhibit)    ;; n 2 docs 2  e.g. tierC-000235 tierC-000236

;; ---- slot exile.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 exile)    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot exile.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 exile) (Possession $x0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000047 tierC-000048

;; ---- slot expand.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 expand)    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot expand.To  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 expand) (To $e0 $e1) (Member $e1 bake))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot expedition.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 expedition)    ;; n 2 docs 2  e.g. tierC-000171 tierC-000172

;; ---- slot expensive.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 expensive)    ;; n 1 docs 1  e.g. tierB-000370
(And (Member $x0 expensive) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierB-000370

;; ---- slot exploitative.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 exploitative)    ;; n 1 docs 1  e.g. tierB-001447
(And (Member $x0 exploitative) (Member $x0 system))    ;; n 1 docs 1  e.g. tierB-001447

;; ---- slot facade.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 facade)    ;; n 1 docs 1  e.g. tierB-000545
(And (Member $x0 facade) (Member $x0 nightmare))    ;; n 1 docs 1  e.g. tierB-000545

;; ---- slot face.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 face)    ;; n 1 docs 1  e.g. tierB-001287
(And (Member $x0 face) (Member $x0 lacerated))    ;; n 1 docs 1  e.g. tierB-001287

;; ---- slot face.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 face)    ;; n 2 docs 2  e.g. tierB-000767 tierB-001401

;; ---- slot fact.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 fact)    ;; n 2 docs 2  e.g. tierB-000949 tierB-001232

;; ---- slot faint.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 faint)    ;; n 1 docs 1  e.g. tierB-001384
(And (Member $x0 faint) (Member $x0 sound))    ;; n 1 docs 1  e.g. tierB-001384

;; ---- slot famous.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 famous)    ;; n 2 docs 2  e.g. tierB-001627 tierB-001898

;; ---- slot farmer.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 farmer)    ;; n 2 docs 2  e.g. tierB-000291 tierB-001689

;; ---- slot fast.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 fast)    ;; n 1 docs 1  e.g. tierB-001556
(And (Member $x0 fast) (Member $x0 tempo))    ;; n 1 docs 1  e.g. tierB-001556

;; ---- slot father.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 father) (Possession $x0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot female.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 female)    ;; n 1 docs 1  e.g. tierB-001205
(And (Member $x0 female) (Member $x0 giraffe))    ;; n 1 docs 1  e.g. tierB-001205

;; ---- slot fence.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 fence)    ;; n 2 docs 2  e.g. tierB-001183 tierB-001685

;; ---- slot fight.TimeAtLeast  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fight) (TimeAtLeast $e0 <term:Year>))    ;; n 2 docs 1  e.g. tierB-001629

;; ---- slot fight.TimeAtMost  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fight) (TimeAtMost $e0 <term:Year>))    ;; n 2 docs 1  e.g. tierB-001629

;; ---- slot fill.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 fill)    ;; n 2 docs 2  e.g. tierB-000016 tierB-001403

;; ---- slot finalized.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 finalized)    ;; n 1 docs 1  e.g. tierB-001484
(And (Member $x0 finalized) (Member $x0 plan))    ;; n 1 docs 1  e.g. tierB-001484

;; ---- slot finance.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 finance)    ;; n 2 docs 2  e.g. tierB-001532 tierC-000246

;; ---- slot fine.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 fine)    ;; n 1 docs 1  e.g. tierB-001383
(And (Member $x0 fine) (Member $x0 line))    ;; n 1 docs 1  e.g. tierB-001383

;; ---- slot firewood.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 firewood)    ;; n 1 docs 1  e.g. tierB-001349
(And (Member $x0 firewood) (Member $x0 pile))    ;; n 1 docs 1  e.g. tierB-001349

;; ---- slot first_team.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 first_team)    ;; n 2 docs 2  e.g. tierC-000243 tierC-000244

;; ---- slot fish.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 fish)    ;; n 1 docs 1  e.g. tierB-001268
(And (Member $x0 fish) (Member $x0 red))    ;; n 1 docs 1  e.g. tierB-001268

;; ---- slot flame.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 flame)    ;; n 1 docs 1  e.g. tierB-001977
(And (Member $x0 flame) (Member $x0 fragile))    ;; n 1 docs 1  e.g. tierB-001977

;; ---- slot flat.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 flat)    ;; n 1 docs 1  e.g. tierB-000356
(And (Member $x0 flat) (Member $x0 top))    ;; n 1 docs 1  e.g. tierB-000356

;; ---- slot flight.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 flight)    ;; n 2 docs 2  e.g. tierB-000308 tierB-000717

;; ---- slot flower.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 flower)    ;; n 2 docs 2  e.g. tierB-000923 tierB-000977

;; ---- slot fly.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 fly)    ;; n 1 docs 1  e.g. tierB-001196
(And (Member $x0 fly) (Member $x0 simple))    ;; n 1 docs 1  e.g. tierB-001196

;; ---- slot foot.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 foot)    ;; n 2 docs 2  e.g. tierC-000003 tierC-000004

;; ---- slot foot.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 foot) (PartOf $x0 bay_street))    ;; n 2 docs 2  e.g. tierC-000003 tierC-000004

;; ---- slot formal.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 formal)    ;; n 1 docs 1  e.g. tierB-000866
(And (Member $x0 formal) (Member $x0 setting))    ;; n 1 docs 1  e.g. tierB-000866

;; ---- slot former.LocatedIn  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 former) (LocatedIn $x0 chongqing))    ;; n 2 docs 2  e.g. tierC-000167 tierC-000168

;; ---- slot fortified.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 fortified)    ;; n 1 docs 1  e.g. tierB-000146
(And (Member $x0 fortified) (Member $x0 russian))    ;; n 1 docs 1  e.g. tierB-000146

;; ---- slot fountain.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 fountain)    ;; n 1 docs 1  e.g. tierB-001760
(And (Member $x0 fountain) (Member $x0 full))    ;; n 1 docs 1  e.g. tierB-001760

;; ---- slot fox.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 fox)    ;; n 2 docs 2  e.g. tierB-000423 tierB-001399

;; ---- slot fragrant.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 fragrant)    ;; n 1 docs 1  e.g. tierB-000058
(And (Member $x0 fragrant) (Member $x0 heather))    ;; n 1 docs 1  e.g. tierB-000058

;; ---- slot freedom_movement.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 freedom_movement)    ;; n 1 docs 1  e.g. tierB-000654
(And (Member $x0 freedom_movement) (Member $x0 gusher))    ;; n 1 docs 1  e.g. tierB-000654

;; ---- slot full_scale.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 full_scale)    ;; n 1 docs 1  e.g. tierB-001222
(And (Member $x0 full_scale) (Member $x0 invasion))    ;; n 1 docs 1  e.g. tierB-001222

;; ---- slot funny.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 funny)    ;; n 1 docs 1  e.g. tierB-001993
(And (Member $x0 funny) (Member $x0 joke))    ;; n 1 docs 1  e.g. tierB-001993

;; ---- slot future.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 future)    ;; n 1 docs 1  e.g. tierB-001557
(And (Member $x0 future) (Member $x0 mystery))    ;; n 1 docs 1  e.g. tierB-001557

;; ---- slot gamma_function.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 gamma_function)    ;; n 1 docs 1  e.g. tierB-001951
(And (Member $x0 gamma_function) (Member $x0 generalization))    ;; n 1 docs 1  e.g. tierB-001951

;; ---- slot gather.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 gather)    ;; n 2 docs 2  e.g. tierB-000258 tierB-001911

;; ---- slot gazelle.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 gazelle)    ;; n 2 docs 2  e.g. tierB-001197 tierB-001836

;; ---- slot geological.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 geological)    ;; n 1 docs 1  e.g. tierC-000033
(And (Member $x0 geological) (Member $x0 party))    ;; n 1 docs 1  e.g. tierC-000033

;; ---- slot giant.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 giant)    ;; n 1 docs 1  e.g. tierB-000187
(And (Member $x0 giant) (Member $x0 invisible))    ;; n 1 docs 1  e.g. tierB-000187

;; ---- slot give_up.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 give_up)    ;; n 2 docs 2  e.g. tierB-000947 tierC-000112

;; ---- slot glass.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 glass)    ;; n 1 docs 1  e.g. tierB-000269
(And (Member $x0 glass) (Member $x0 real))    ;; n 1 docs 1  e.g. tierB-000269

;; ---- slot global.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 global)    ;; n 1 docs 1  e.g. tierB-001668
(And (Member $x0 global) (Member $x0 problem))    ;; n 1 docs 1  e.g. tierB-001668

;; ---- slot glory.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 glory)    ;; n 1 docs 1  e.g. tierB-000040
(And (Member $x0 glory) (Member $x0 lost))    ;; n 1 docs 1  e.g. tierB-000040

;; ---- slot go_back.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 go_back)    ;; n 2 docs 2  e.g. tierB-001058 tierB-001743

;; ---- slot go_down.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 go_down)    ;; n 2 docs 2  e.g. tierB-000825 tierB-001793

;; ---- slot goat.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 goat)    ;; n 2 docs 2  e.g. tierB-001153 tierB-001904

;; ---- slot gorgeous.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 gorgeous)    ;; n 1 docs 1  e.g. tierB-000501
(And (Member $x0 gorgeous) (Member $x0 physiognomy))    ;; n 1 docs 1  e.g. tierB-000501

;; ---- slot govern.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 govern)    ;; n 2 docs 2  e.g. tierB-000359 tierB-000934

;; ---- slot government.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 government) (PartOf $x0 kenya))    ;; n 1 docs 1  e.g. tierC-000245
(And (Member $x0 government) (PartOf $x0 uganda))    ;; n 1 docs 1  e.g. tierC-000217

;; ---- slot grow.Result  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 2
(And (Member $e0 grow) (Result $e0 $e1) (Member $e1 faint))    ;; n 1 docs 1  e.g. tierB-001384
(And (Member $e0 grow) (Result $e0 $e1) (Member $e1 large))    ;; n 1 docs 1  e.g. tierB-000228

;; ---- slot guard.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 guard)    ;; n 2 docs 2  e.g. tierB-001718 tierB-001926

;; ---- slot gym.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 gym)    ;; n 1 docs 1  e.g. tierB-000316
(And (Member $x0 gym) (Member $x0 huge))    ;; n 1 docs 1  e.g. tierB-000316

;; ---- slot hamburger.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 hamburger)    ;; n 2 docs 2  e.g. tierB-000449 tierB-001558

;; ---- slot hang.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 hang)    ;; n 2 docs 2  e.g. tierB-001303 tierB-001925

;; ---- slot happy.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 happy)    ;; n 1 docs 1  e.g. tierB-001454
(And (Member $x0 happy) (Member $x0 spirit))    ;; n 1 docs 1  e.g. tierB-001454

;; ---- slot hate.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 hate)    ;; n 2 docs 2  e.g. tierB-000009 tierB-001180

;; ---- slot head.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 head)    ;; n 2 docs 2  e.g. tierB-001396 tierB-001412

;; ---- slot headquarters.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 headquarters) (PartOf $x0 $x1) (Member $x1 company))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot hefty.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 hefty)    ;; n 1 docs 1  e.g. tierB-001454
(And (Member $x0 hefty) (Member $x0 salary))    ;; n 1 docs 1  e.g. tierB-001454

;; ---- slot hidden.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 hidden)    ;; n 2 docs 2  e.g. tierB-000758 tierB-000979

;; ---- slot hide.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 hide)    ;; n 2 docs 2  e.g. tierB-000381 tierB-000502

;; ---- slot high_pitched.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 high_pitched)    ;; n 1 docs 1  e.g. tierB-000073
(And (Member $x0 high_pitched) (Member $x0 noise))    ;; n 1 docs 1  e.g. tierB-000073

;; ---- slot hiking_path.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 hiking_path)    ;; n 1 docs 1  e.g. tierB-000008
(And (Member $x0 hiking_path) (Member $x0 secluded))    ;; n 1 docs 1  e.g. tierB-000008

;; ---- slot history.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 history)    ;; n 1 docs 1  e.g. tierB-000408
(And (Member $x0 history) (Member $x0 rich))    ;; n 1 docs 1  e.g. tierB-000408

;; ---- slot hit.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 hit)    ;; n 2 docs 2  e.g. tierB-000506 tierB-001001

;; ---- slot homecoming_game.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 homecoming_game)    ;; n 1 docs 1  e.g. tierC-000019
(And (Member $x0 homecoming_game) (Member $x0 large))    ;; n 1 docs 1  e.g. tierC-000019

;; ---- slot hooded_crow.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 hooded_crow)    ;; n 1 docs 1  e.g. tierB-001652
(And (Member $x0 hooded_crow) (Member $x0 unmistakeable))    ;; n 1 docs 1  e.g. tierB-001652

;; ---- slot hope.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 hope)    ;; n 2 docs 2  e.g. tierC-000029 tierC-000030

;; ---- slot horn.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 horn)    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072

;; ---- slot horrible.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 horrible)    ;; n 1 docs 1  e.g. tierB-000232
(And (Member $x0 horrible) (Member $x0 tragedy))    ;; n 1 docs 1  e.g. tierB-000232

;; ---- slot horrible.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 horrible)    ;; n 1 docs 1  e.g. tierB-000489
(And (Member $e0 horrible) (Member $e0 thing))    ;; n 1 docs 1  e.g. tierB-000489

;; ---- slot hour.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 hour)    ;; n 1 docs 1  e.g. tierB-000903
(And (Member $x0 hour) (Member $x0 late))    ;; n 1 docs 1  e.g. tierB-000903

;; ---- slot house.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 house) (PartOf $x0 $x1) (Member $x1 listed_building))    ;; n 2 docs 2  e.g. tierC-000115 tierC-000116

;; ---- slot human.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 human)    ;; n 1 docs 1  e.g. tierB-001888
(And (Member $x0 human) (Member $x0 voice))    ;; n 1 docs 1  e.g. tierB-001888

;; ---- slot hurricane.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 hurricane)    ;; n 2 docs 2  e.g. tierC-000353 tierC-000354

;; ---- slot hybrid.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 hybrid)    ;; n 1 docs 1  e.g. tierB-000535
(And (Member $x0 hybrid) (Member $x0 plant))    ;; n 1 docs 1  e.g. tierB-000535

;; ---- slot id_card.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 id_card)    ;; n 1 docs 1  e.g. tierB-001566
(And (Member $x0 id_card) (Member $x0 valid))    ;; n 1 docs 1  e.g. tierB-001566

;; ---- slot identity.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 identity)    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072

;; ---- slot identity.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 identity) (Possession $x0 herald))    ;; n 2 docs 2  e.g. tierC-000071 tierC-000072

;; ---- slot important.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 important)    ;; n 1 docs 1  e.g. tierB-000089
(And (Member $x0 important) (Member $x0 role))    ;; n 1 docs 1  e.g. tierB-000089

;; ---- slot improve.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 improve)    ;; n 2 docs 2  e.g. tierB-001065 tierB-001816

;; ---- slot in_fashion.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 in_fashion)    ;; n 1 docs 1  e.g. tierB-001896
(And (Member $x0 in_fashion) (Member $x0 style))    ;; n 1 docs 1  e.g. tierB-001896

;; ---- slot indigenous.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 indigenous) (GroupOf $x0 people))    ;; n 1 docs 1  e.g. tierC-000002
(And (Member $x0 indigenous) (GroupOf $x0 person))    ;; n 1 docs 1  e.g. tierC-000001

;; ---- slot indigenous.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 indigenous)    ;; n 2 docs 2  e.g. tierC-000001 tierC-000002

;; ---- slot inherit.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 inherit)    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114

;; ---- slot injure.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 injure)    ;; n 2 docs 2  e.g. tierB-000725 tierB-001017

;; ---- slot inomaru.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 inomaru)    ;; n 1 docs 1  e.g. tierC-000237
(And (Member $x0 inomaru) (Member $x0 person))    ;; n 1 docs 1  e.g. tierC-000237

;; ---- slot intense.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 intense)    ;; n 1 docs 1  e.g. tierB-000352
(And (Member $x0 intense) (Member $x0 noise))    ;; n 1 docs 1  e.g. tierB-000352

;; ---- slot internal_politics.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 internal_politics)    ;; n 1 docs 1  e.g. tierB-000819
(And (Member $x0 internal_politics) (Member $x0 intriguing))    ;; n 1 docs 1  e.g. tierB-000819

;; ---- slot intruder.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 intruder)    ;; n 2 docs 2  e.g. tierB-000401 tierB-001090

;; ---- slot inverted.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 inverted)    ;; n 1 docs 1  e.g. tierB-000831
(And (Member $x0 inverted) (Member $x0 philippine_flag))    ;; n 1 docs 1  e.g. tierB-000831

;; ---- slot invitation.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 invitation)    ;; n 2 docs 2  e.g. tierB-000328 tierB-001152

;; ---- slot island.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 island)    ;; n 2 docs 2  e.g. tierB-000230 tierB-000514

;; ---- slot isostructural.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 isostructural)    ;; n 1 docs 1  e.g. tierC-000164
(And (Member $x0 isostructural) (Member $x0 potassium_salt))    ;; n 1 docs 1  e.g. tierC-000164

;; ---- slot issue.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 issue)    ;; n 2 docs 2  e.g. tierB-000662 tierB-001300

;; ---- slot jar.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 jar)    ;; n 2 docs 2  e.g. tierB-000135 tierB-000815

;; ---- slot job.LocatedIn  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 job) (LocatedIn $x0 seychelles))    ;; n 2 docs 2  e.g. tierC-000303 tierC-000304

;; ---- slot job.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 job)    ;; n 2 docs 2  e.g. tierC-000303 tierC-000304

;; ---- slot join.Before  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 join) (Before $e0 $e1) (Member $e1 take_over))    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot join.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 join)    ;; n 2 docs 2  e.g. tierC-000109 tierC-000110

;; ---- slot junction.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 junction)    ;; n 2 docs 2  e.g. tierB-001267 tierB-001277

;; ---- slot keep.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 keep)    ;; n 2 docs 2  e.g. tierB-001809 tierB-001933

;; ---- slot kidnap.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 kidnap)    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot lady.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 lady)    ;; n 2 docs 2  e.g. tierB-001114 tierB-001636

;; ---- slot lake.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 lake)    ;; n 2 docs 2  e.g. tierB-000618 tierB-001268

;; ---- slot lakeside_road.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 lakeside_road)    ;; n 1 docs 1  e.g. tierB-001906
(And (Member $x0 lakeside_road) (Member $x0 parallel))    ;; n 1 docs 1  e.g. tierB-001906

;; ---- slot last.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 last)    ;; n 1 docs 1  e.g. tierB-000657
(And (Member $x0 last) (Member $x0 part))    ;; n 1 docs 1  e.g. tierB-000657

;; ---- slot laugh.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 laugh)    ;; n 2 docs 2  e.g. tierB-001147 tierB-001316

;; ---- slot leader.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 leader)    ;; n 1 docs 1  e.g. tierB-001063
(And (Member $x0 leader) (Member $x0 sadist))    ;; n 1 docs 1  e.g. tierB-001063

;; ---- slot let.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 let)    ;; n 2 docs 2  e.g. tierB-000410 tierB-001687

;; ---- slot lift.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 lift)    ;; n 1 docs 1  e.g. tierB-000792
(And (Member $x0 lift) (Member $x0 other))    ;; n 1 docs 1  e.g. tierB-000792

;; ---- slot light.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 light)    ;; n 2 docs 2  e.g. tierB-001642 tierB-001997

;; ---- slot like.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 like)    ;; n 2 docs 2  e.g. tierB-000160 tierB-001485

;; ---- slot local.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 local)    ;; n 1 docs 1  e.g. tierB-001716
(And (Member $x0 local) (Member $x0 population))    ;; n 1 docs 1  e.g. tierB-001716

;; ---- slot long.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 long)    ;; n 1 docs 1  e.g. tierB-000530
(And (Member $x0 long) (Member $x0 trousers))    ;; n 1 docs 1  e.g. tierB-000530

;; ---- slot lose.To  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $e0 lose) (To $e0 chuck_robb))    ;; n 1 docs 1  e.g. tierC-000162
(And (Member $e0 lose) (To $e0 robb))    ;; n 1 docs 1  e.g. tierC-000161

;; ---- slot love.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 love)    ;; n 2 docs 2  e.g. tierB-001330 tierB-001815

;; ---- slot lure.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 lure)    ;; n 2 docs 2  e.g. tierC-000269 tierC-000270

;; ---- slot main.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 main)    ;; n 1 docs 1  e.g. tierC-000179
(And (Member $x0 main) (Member $x0 songwriting_unit))    ;; n 1 docs 1  e.g. tierC-000179

;; ---- slot main_square.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 main_square)    ;; n 1 docs 1  e.g. tierB-001731
(And (Member $x0 main_square) (Member $x0 next_door))    ;; n 1 docs 1  e.g. tierB-001731

;; ---- slot maintain.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 maintain)    ;; n 2 docs 2  e.g. tierB-001239 tierB-001864

;; ---- slot majority.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 majority)    ;; n 1 docs 1  e.g. tierB-000974
(And (Member $x0 majority) (Member $x0 overwhelming))    ;; n 1 docs 1  e.g. tierB-000974

;; ---- slot means.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 means)    ;; n 1 docs 1  e.g. tierB-001738
(And (Member $x0 means) (Member $x0 other))    ;; n 1 docs 1  e.g. tierB-001738

;; ---- slot mela.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 mela)    ;; n 2 docs 2  e.g. tierC-000133 tierC-000134

;; ---- slot mental.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 mental)    ;; n 1 docs 1  e.g. tierC-000234
(And (Member $x0 mental) (Member $x0 world))    ;; n 1 docs 1  e.g. tierC-000234

;; ---- slot mesmerizing.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 mesmerizing)    ;; n 1 docs 1  e.g. tierB-000208
(And (Member $x0 mesmerizing) (Member $x0 sheen))    ;; n 1 docs 1  e.g. tierB-000208

;; ---- slot middle.LocatedIn  [entity center; head other]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $x0 middle) (LocatedIn $x0 $x1) (Member $x1 forest))    ;; n 1 docs 1  e.g. tierB-000141
(And (Member $x0 middle) (LocatedIn $x0 $x1) (Member $x1 ocean))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001257
(And (Member $x0 middle) (LocatedIn $x0 $x1) (Member $x1 vast))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001257

;; ---- slot middle.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 middle) (PartOf $x0 $x1) (Member $x1 desert))    ;; n 1 docs 1  e.g. tierB-000524
(And (Member $x0 middle) (PartOf $x0 $x1) (Member $x1 room))    ;; n 1 docs 1  e.g. tierB-001925

;; ---- slot milk.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 milk)    ;; n 2 docs 2  e.g. tierB-000326 tierB-001855

;; ---- slot ministry.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 ministry)    ;; n 2 docs 2  e.g. tierC-000007 tierC-000008

;; ---- slot modern.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 modern)    ;; n 1 docs 1  e.g. tierB-001966
(And (Member $e0 modern) (Member $e0 street))    ;; n 1 docs 1  e.g. tierB-001966

;; ---- slot motive.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 motive)    ;; n 1 docs 1  e.g. tierB-001212
(And (Member $x0 motive) (Member $x0 unclear))    ;; n 1 docs 1  e.g. tierB-001212

;; ---- slot mouse.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 mouse)    ;; n 2 docs 2  e.g. tierB-000693 tierB-001515

;; ---- slot move_back.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 move_back)    ;; n 2 docs 2  e.g. tierC-000121 tierC-000122

;; ---- slot narrow.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 narrow)    ;; n 1 docs 1  e.g. tierB-000983
(And (Member $x0 narrow) (Member $x0 road))    ;; n 1 docs 1  e.g. tierB-000983

;; ---- slot nasty.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 nasty)    ;; n 1 docs 1  e.g. tierB-000358
(And (Member $x0 nasty) (Member $x0 personality))    ;; n 1 docs 1  e.g. tierB-000358

;; ---- slot natural.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 natural)    ;; n 1 docs 1  e.g. tierB-000599
(And (Member $x0 natural) (Member $x0 treatment))    ;; n 1 docs 1  e.g. tierB-000599

;; ---- slot need.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 need)    ;; n 1 docs 1  e.g. tierB-001578
(And (Member $x0 need) (Member $x0 urgent))    ;; n 1 docs 1  e.g. tierB-001578

;; ---- slot new.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 new) (GroupOf $x0 medicine))    ;; n 1 docs 1  e.g. tierB-001589
(And (Member $x0 new) (GroupOf $x0 possibility))    ;; n 1 docs 1  e.g. tierB-000958

;; ---- slot newspaper.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 newspaper)    ;; n 2 docs 2  e.g. tierB-000784 tierB-001416

;; ---- slot nice.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 nice)    ;; n 1 docs 1  e.g. tierB-001103
(And (Member $x0 nice) (Member $x0 taste))    ;; n 1 docs 1  e.g. tierB-001103

;; ---- slot noise.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 noise)    ;; n 1 docs 1  e.g. tierB-000695
(And (Member $x0 noise) (Member $x0 ticking))    ;; n 1 docs 1  e.g. tierB-000695

;; ---- slot nominate.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 nominate)    ;; n 2 docs 2  e.g. tierC-000009 tierC-000010

;; ---- slot northeastern.LocatedIn  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 northeastern) (LocatedIn $x0 colombia))    ;; n 2 docs 2  e.g. tierC-000263 tierC-000264

;; ---- slot northeastern.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 northeastern)    ;; n 2 docs 2  e.g. tierC-000263 tierC-000264

;; ---- slot notebook.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 notebook)    ;; n 2 docs 2  e.g. tierB-000914 tierB-001078

;; ---- slot occur.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 occur)    ;; n 2 docs 2  e.g. tierC-000149 tierC-000150

;; ---- slot offer.Because  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 offer) (Because $e0 $e1) (Member $e1 want))    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312

;; ---- slot offer.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 offer)    ;; n 2 docs 2  e.g. tierC-000311 tierC-000312

;; ---- slot okay.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 okay)    ;; n 1 docs 1  e.g. tierB-001679
(And (Member $e0 okay) (Member $e0 taunt))    ;; n 1 docs 1  e.g. tierB-001679

;; ---- slot on.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 on)    ;; n 2 docs 2  e.g. tierB-000004 tierB-001051

;; ---- slot order.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 order)    ;; n 2 docs 2  e.g. tierB-000705 tierB-001222

;; ---- slot organise.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 organise)    ;; n 2 docs 2  e.g. tierC-000133 tierC-000134

;; ---- slot out_of_stock.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 out_of_stock)    ;; n 1 docs 1  e.g. tierB-001045
(And (Member $x0 out_of_stock) (Member $x0 product))    ;; n 1 docs 1  e.g. tierB-001045

;; ---- slot out_of_the_question.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 out_of_the_question)    ;; n 1 docs 1  e.g. tierB-000842
(And (Member $x0 out_of_the_question) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierB-000842

;; ---- slot outrageous.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 outrageous)    ;; n 1 docs 1  e.g. tierB-000694
(And (Member $x0 outrageous) (Member $x0 truth))    ;; n 1 docs 1  e.g. tierB-000694

;; ---- slot own.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 own)    ;; n 2 docs 2  e.g. tierB-000145 tierB-001698

;; ---- slot ox.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 ox)    ;; n 1 docs 1  e.g. tierB-001490
(And (Member $x0 ox) (Member $x0 sturdy))    ;; n 1 docs 1  e.g. tierB-001490

;; ---- slot pack.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 pack)    ;; n 2 docs 2  e.g. tierB-001063 tierB-001198

;; ---- slot packed.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 packed)    ;; n 1 docs 1  e.g. tierB-000917
(And (Member $x0 packed) (Member $x0 restaurant))    ;; n 1 docs 1  e.g. tierB-000917

;; ---- slot paper_factory.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 paper_factory)    ;; n 2 docs 2  e.g. tierC-000045 tierC-000292

;; ---- slot paper_mill.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 paper_mill)    ;; n 2 docs 2  e.g. tierC-000046 tierC-000291

;; ---- slot parade.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 parade)    ;; n 2 docs 2  e.g. tierB-000379 tierB-001357

;; ---- slot parenthetic.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 parenthetic)    ;; n 1 docs 1  e.g. tierB-000926
(And (Member $x0 parenthetic) (Member $x0 style))    ;; n 1 docs 1  e.g. tierB-000926

;; ---- slot park.Near  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 park) (Near $x0 $x1) (Member $x1 foot))    ;; n 2 docs 2  e.g. tierC-000003 tierC-000004

;; ---- slot park.SouthOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 park) (SouthOf $x0 queens_quay))    ;; n 2 docs 2  e.g. tierC-000003 tierC-000004

;; ---- slot partner.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 partner)    ;; n 1 docs 1  e.g. tierC-000017
(And (Member $x0 partner) (Member $x0 potential))    ;; n 1 docs 1  e.g. tierC-000017

;; ---- slot party.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 party)    ;; n 2 docs 1  e.g. tierB-000012

;; ---- slot pastry.Member  [entity center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $x0 pastry)    ;; n 2 docs 1  e.g. tierB-001745

;; ---- slot pencil_portrait.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 pencil_portrait)    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot pencil_portrait.Of  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 pencil_portrait) (Of $x0 john_higgins))    ;; n 2 docs 2  e.g. tierC-000293 tierC-000294

;; ---- slot perfume.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 perfume)    ;; n 1 docs 1  e.g. tierB-000085
(And (Member $x0 perfume) (Member $x0 pleasant))    ;; n 1 docs 1  e.g. tierB-000085

;; ---- slot permitted.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 permitted)    ;; n 1 docs 1  e.g. tierB-000669
(And (Member $x0 permitted) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierB-000669

;; ---- slot personality.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 personality) (Possession $x0 holly_golightly))    ;; n 2 docs 2  e.g. tierC-000227 tierC-000228

;; ---- slot pharyngeal_part.Behind  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 pharyngeal_part) (Behind $x0 $x1) (Member $x1 mouth))    ;; n 1 docs 1  e.g. tierB-000802
(And (Member $x0 pharyngeal_part) (Behind $x0 $x1) (Member $x1 nose))    ;; n 1 docs 1  e.g. tierB-000802

;; ---- slot picture.Of  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 picture) (Of $x0 $x1) (Member $x1 fugitive))    ;; n 1 docs 1  e.g. tierB-001070
(And (Member $x0 picture) (Of $x0 $x1) (Member $x1 royal_family))    ;; n 1 docs 1  e.g. tierB-001423

;; ---- slot pitch.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 pitch)    ;; n 1 docs 1  e.g. tierB-001854
(And (Member $x0 pitch) (Member $x0 straight))    ;; n 1 docs 1  e.g. tierB-001854

;; ---- slot play.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 play)    ;; n 2 docs 2  e.g. tierB-000523 tierB-001932

;; ---- slot pleasant.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 pleasant)    ;; n 1 docs 1  e.g. tierB-001763
(And (Member $x0 pleasant) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierB-001763

;; ---- slot plenty.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 plenty)    ;; n 1 docs 1  e.g. tierB-000180
(And (Member $x0 plenty) (Member $x0 rain))    ;; n 1 docs 1  e.g. tierB-000180

;; ---- slot plow.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 plow)    ;; n 2 docs 2  e.g. tierB-001490 tierB-001501

;; ---- slot point.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 point)    ;; n 2 docs 2  e.g. tierB-000826 tierB-000828

;; ---- slot political.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 political)    ;; n 1 docs 1  e.g. tierB-001534
(And (Member $x0 political) (Member $x0 settlement))    ;; n 1 docs 1  e.g. tierB-001534

;; ---- slot positive.Member  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $e0 positive)    ;; n 1 docs 1  e.g. tierB-001948
(And (Member $e0 positive) (Member $e0 toxicology_testing))    ;; n 1 docs 1  e.g. tierB-001948

;; ---- slot post.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 post)    ;; n 2 docs 2  e.g. tierC-000025 tierC-000026

;; ---- slot powder.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 powder)    ;; n 1 docs 1  e.g. tierB-000887
(And (Member $x0 powder) (Member $x0 soluble))    ;; n 1 docs 1  e.g. tierB-000887

;; ---- slot practice.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 practice)    ;; n 1 docs 1  e.g. tierB-000093
(And (Member $x0 practice) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierB-000093

;; ---- slot predictable.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 predictable)    ;; n 1 docs 1  e.g. tierB-001380
(And (Member $x0 predictable) (Member $x0 result))    ;; n 1 docs 1  e.g. tierB-001380

;; ---- slot presented.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 presented)    ;; n 1 docs 1  e.g. tierC-000214
(And (Member $x0 presented) (Member $x0 scale))    ;; n 1 docs 1  e.g. tierC-000214

;; ---- slot president.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 president)    ;; n 2 docs 2  e.g. tierB-001726 tierC-000054

;; ---- slot press.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 press)    ;; n 2 docs 2  e.g. tierB-000201 tierB-001494

;; ---- slot presumption.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 presumption)    ;; n 1 docs 1  e.g. tierB-001223
(And (Member $x0 presumption) (Member $x0 strong))    ;; n 1 docs 1  e.g. tierB-001223

;; ---- slot prevent.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 prevent)    ;; n 2 docs 2  e.g. tierB-001471 tierC-000123

;; ---- slot print.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 print)    ;; n 2 docs 2  e.g. tierC-000231 tierC-000232

;; ---- slot public.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 public)    ;; n 1 docs 1  e.g. tierB-000979
(And (Member $x0 public) (Member $x0 view))    ;; n 1 docs 1  e.g. tierB-000979

;; ---- slot push.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 push)    ;; n 1 docs 1  e.g. tierB-001453
(And (Member $x0 push) (Member $x0 strong))    ;; n 1 docs 1  e.g. tierB-001453

;; ---- slot railroad.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 railroad)    ;; n 2 docs 2  e.g. tierB-000582 tierB-001064

;; ---- slot recent.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 recent)    ;; n 1 docs 1  e.g. tierB-001359
(And (Member $x0 recent) (Member $x0 survey))    ;; n 1 docs 1  e.g. tierB-001359

;; ---- slot red.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 red)    ;; n 1 docs 1  e.g. tierB-000832
(And (Member $x0 red) (Member $x0 yellow))    ;; n 1 docs 1  e.g. tierB-000832

;; ---- slot red.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 red)    ;; n 2 docs 2  e.g. tierB-000832 tierB-001582

;; ---- slot reduced.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 reduced)    ;; n 1 docs 1  e.g. tierC-000069
(And (Member $x0 reduced) (Member $x0 speed_limit))    ;; n 1 docs 1  e.g. tierC-000069

;; ---- slot reflect.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 reflect)    ;; n 2 docs 2  e.g. tierC-000113 tierC-000114

;; ---- slot region.From  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 region) (From $x0 new_jersey))    ;; n 2 docs 2  e.g. tierC-000223 tierC-000224

;; ---- slot region.To  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 region) (To $x0 virginia))    ;; n 2 docs 2  e.g. tierC-000223 tierC-000224

;; ---- slot religion.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 religion)    ;; n 2 docs 2  e.g. tierC-000257 tierC-000258

;; ---- slot religion.Possession  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 religion) (Possession $x0 $x1) (Member $x1 person))    ;; n 2 docs 2  e.g. tierC-000257 tierC-000258

;; ---- slot remain.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 remain)    ;; n 2 docs 2  e.g. tierB-001320 tierC-000121

;; ---- slot repeat.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 repeat)    ;; n 2 docs 2  e.g. tierB-000147 tierB-001804

;; ---- slot repetition.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 repetition)    ;; n 1 docs 1  e.g. tierB-000608
(And (Member $x0 repetition) (Member $x0 secret))    ;; n 1 docs 1  e.g. tierB-000608

;; ---- slot represent.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 represent)    ;; n 2 docs 2  e.g. tierC-000007 tierC-000008

;; ---- slot result.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 result)    ;; n 2 docs 2  e.g. tierB-000407 tierB-001994

;; ---- slot reveal.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 reveal)    ;; n 2 docs 2  e.g. tierB-001359 tierB-001881

;; ---- slot right.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 right)    ;; n 2 docs 2  e.g. tierB-000902 tierB-001180

;; ---- slot roast.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 roast)    ;; n 2 docs 2  e.g. tierB-000921 tierB-001304

;; ---- slot roll.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 roll)    ;; n 2 docs 2  e.g. tierB-000942 tierB-001228

;; ---- slot roof.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 roof)    ;; n 2 docs 2  e.g. tierB-000633 tierB-001110

;; ---- slot run.But  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 run) (But $e0 $e1) (Member $e1 lose))    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162

;; ---- slot run_out.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 run_out)    ;; n 2 docs 2  e.g. tierB-000656 tierB-001446

;; ---- slot russian_market.For  [entity center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(And (Member $x0 russian_market) (For $x0 shopping))    ;; n 2 docs 1  e.g. tierC-000321

;; ---- slot russian_market.Member  [entity center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $x0 russian_market)    ;; n 2 docs 1  e.g. tierC-000321

;; ---- slot salty.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 salty)    ;; n 1 docs 1  e.g. tierB-001142
(And (Member $x0 salty) (Member $x0 thing))    ;; n 1 docs 1  e.g. tierB-001142

;; ---- slot sauce.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 sauce)    ;; n 2 docs 2  e.g. tierB-000174 tierB-000462

;; ---- slot scarecrow.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 scarecrow)    ;; n 1 docs 1  e.g. tierB-001630
(And (Member $x0 scarecrow) (Member $x0 talk))    ;; n 1 docs 1  e.g. tierB-001630

;; ---- slot scent.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 scent)    ;; n 2 docs 2  e.g. tierB-001531 tierB-001900

;; ---- slot scent.Possession  [entity center; head other]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $x0 scent) (Possession $x0 $x1) (Member $x1 rat))    ;; n 1 docs 1  e.g. tierB-001900
(And (Member $x0 scent) (Possession $x0 $x1) (Member $x1 fresh))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001531
(And (Member $x0 scent) (Possession $x0 $x1) (Member $x1 rain))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001531

;; ---- slot school.GroupOf  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $x0 school) (GroupOf $x0 fish))    ;; n 2 docs 2  e.g. tierB-000782 tierB-001008

;; ---- slot sculpture.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 sculpture)    ;; n 1 docs 1  e.g. tierB-001569
(And (Member $x0 sculpture) (Member $x0 valuable))    ;; n 1 docs 1  e.g. tierB-001569

;; ---- slot season.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 season)    ;; n 2 docs 2  e.g. tierB-000733 tierB-001692

;; ---- slot second.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 second)    ;; n 1 docs 1  e.g. tierB-000342
(And (Member $x0 second) (Member $x0 time_unit))    ;; n 1 docs 1  e.g. tierB-000342

;; ---- slot seduce.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 seduce)    ;; n 2 docs 2  e.g. tierC-000041 tierC-000042

;; ---- slot select.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 select)    ;; n 2 docs 2  e.g. tierC-000303 tierC-000304

;; ---- slot sell.Before  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 2
(And (Member $e0 sell) (Before $e0 $e1) (Member $e1 expand))    ;; n 2 docs 2  e.g. tierC-000197 tierC-000198

;; ---- slot send.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 send)    ;; n 2 docs 2  e.g. tierB-000666 tierB-000715

;; ---- slot series.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 series)    ;; n 2 docs 2  e.g. tierC-000229 tierC-000230

;; ---- slot serious.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 serious)    ;; n 1 docs 1  e.g. tierB-001797
(And (Member $x0 serious) (Member $x0 wide))    ;; n 1 docs 1  e.g. tierB-001797

;; ---- slot set.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 set)    ;; n 2 docs 2  e.g. tierB-001974 tierB-001976

;; ---- slot shelf.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 shelf)    ;; n 2 docs 2  e.g. tierB-000868 tierB-001364

;; ---- slot shift.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 shift)    ;; n 1 docs 1  e.g. tierB-001603
(And (Member $x0 shift) (Member $x0 whole))    ;; n 1 docs 1  e.g. tierB-001603

;; ---- slot ship.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 ship)    ;; n 2 docs 2  e.g. tierC-000203 tierC-000204

;; ---- slot shop.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 shop)    ;; n 2 docs 2  e.g. tierB-000167 tierB-001181

;; ---- slot shore.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 shore)    ;; n 2 docs 2  e.g. tierB-001283 tierB-001906

;; ---- slot sidewalk.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 sidewalk)    ;; n 2 docs 2  e.g. tierB-001157 tierB-001245

;; ---- slot sit.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 sit)    ;; n 2 docs 2  e.g. tierB-000922 tierB-001685

;; ---- slot site.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 site)    ;; n 2 docs 2  e.g. tierB-000144 tierB-000450

;; ---- slot small.Of  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 small) (Of $x0 love))    ;; n 1 docs 1  e.g. tierB-001651
(And (Member $x0 small) (Of $x0 respect))    ;; n 1 docs 1  e.g. tierB-001651

;; ---- slot smell.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 smell)    ;; n 2 docs 2  e.g. tierB-000423 tierB-001517

;; ---- slot smoke_and_mirrors.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 smoke_and_mirrors)    ;; n 1 docs 1  e.g. tierB-000090
(And (Member $x0 smoke_and_mirrors) (Member $x0 world))    ;; n 1 docs 1  e.g. tierB-000090

;; ---- slot soul_piercing.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 soul_piercing)    ;; n 1 docs 1  e.g. tierB-001861
(And (Member $x0 soul_piercing) (Member $x0 stare))    ;; n 1 docs 1  e.g. tierB-001861

;; ---- slot speaker.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 speaker)    ;; n 2 docs 1  e.g. tierC-000078

;; ---- slot specify.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 specify)    ;; n 2 docs 2  e.g. tierC-000267 tierC-000268

;; ---- slot spokesman.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 spokesman)    ;; n 2 docs 1  e.g. tierC-000077

;; ---- slot spot.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 spot)    ;; n 2 docs 2  e.g. tierB-000316 tierB-001257

;; ---- slot spread.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 spread)    ;; n 2 docs 2  e.g. tierB-000047 tierB-001113

;; ---- slot stab.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 stab)    ;; n 2 docs 2  e.g. tierC-000123 tierC-000124

;; ---- slot stab.To  [event center; head other]  n 2  docs<= 2  distinct 2  eventive 2
(And (Member $e0 stab) (To $e0 $e1) (Member $e1 avoid))    ;; n 1 docs 1  e.g. tierC-000124
(And (Member $e0 stab) (To $e0 $e1) (Member $e1 prevent))    ;; n 1 docs 1  e.g. tierC-000123

;; ---- slot stamp_collection.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 stamp_collection)    ;; n 1 docs 1  e.g. tierB-000510
(And (Member $x0 stamp_collection) (Member $x0 valuable))    ;; n 1 docs 1  e.g. tierB-000510

;; ---- slot stance.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 stance)    ;; n 1 docs 1  e.g. tierB-001533
(And (Member $x0 stance) (Member $x0 syncretic))    ;; n 1 docs 1  e.g. tierB-001533

;; ---- slot state.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 state)    ;; n 2 docs 2  e.g. tierC-000353 tierC-000354

;; ---- slot stay.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 stay)    ;; n 2 docs 2  e.g. tierB-000647 tierC-000122

;; ---- slot steal.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 steal)    ;; n 2 docs 2  e.g. tierB-000400 tierB-000628

;; ---- slot stone.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 stone)    ;; n 1 docs 1  e.g. tierB-001282
(And (Member $x0 stone) (Member $x0 worthless))    ;; n 1 docs 1  e.g. tierB-001282

;; ---- slot stretch.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 stretch)    ;; n 1 docs 1  e.g. tierB-001792
(And (Member $x0 stretch) (Member $x0 unsurfaced))    ;; n 1 docs 1  e.g. tierB-001792

;; ---- slot strike.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 strike)    ;; n 2 docs 2  e.g. tierB-000354 tierB-000653

;; ---- slot suburb.LocatedIn  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 suburb) (LocatedIn $x0 boston))    ;; n 1 docs 1  e.g. tierB-000707
(And (Member $x0 suburb) (LocatedIn $x0 tokyo))    ;; n 1 docs 1  e.g. tierB-000489

;; ---- slot suburb.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 suburb)    ;; n 2 docs 2  e.g. tierB-000489 tierB-000707

;; ---- slot sugar.LocatedIn  [entity center; head other]  n 2  docs<= 3  distinct 3  eventive 0
(And (Member $x0 sugar) (LocatedIn $x0 $x1) (Member $x1 body))    ;; n 1 docs 1  e.g. tierB-001243
(And (Member $x0 sugar) (LocatedIn $x0 $x1) (Member $x1 black))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000541
(And (Member $x0 sugar) (LocatedIn $x0 $x1) (Member $x1 box))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000541

;; ---- slot sunny.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 sunny)    ;; n 1 docs 1  e.g. tierB-000121
(And (Member $x0 sunny) (Member $x0 valley))    ;; n 1 docs 1  e.g. tierB-000121

;; ---- slot support.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 support)    ;; n 2 docs 2  e.g. tierC-000160 tierC-000356

;; ---- slot system.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 system)    ;; n 2 docs 2  e.g. tierB-001134 tierB-001931

;; ---- slot take_care_for.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 take_care_for)    ;; n 2 docs 1  e.g. tierB-000198

;; ---- slot teach.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 teach)    ;; n 2 docs 2  e.g. tierB-000749 tierB-001612

;; ---- slot team.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 team)    ;; n 2 docs 2  e.g. tierB-000374 tierB-001720

;; ---- slot term.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 term)    ;; n 2 docs 2  e.g. tierC-000161 tierC-000162

;; ---- slot thank.For  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 2
(And (Member $x0 thank) (For $x0 $e1) (Member $e1 agree))    ;; n 1 docs 1  e.g. tierB-001686
(And (Member $x0 thank) (For $x0 $e1) (Member $e1 point_out))    ;; n 1 docs 1  e.g. tierB-001455

;; ---- slot thank.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 thank)    ;; n 2 docs 2  e.g. tierB-001455 tierB-001686

;; ---- slot theater.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 theater)    ;; n 2 docs 2  e.g. tierB-001108 tierB-001266

;; ---- slot throw.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 throw)    ;; n 2 docs 2  e.g. tierB-000340 tierB-001023

;; ---- slot tire.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 tire)    ;; n 2 docs 2  e.g. tierB-000236 tierB-001421

;; ---- slot top.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 top)    ;; n 2 docs 2  e.g. tierB-000208 tierB-001166

;; ---- slot top.PartOf  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 top) (PartOf $x0 mt_fuji))    ;; n 1 docs 1  e.g. tierB-001166
(And (Member $x0 top) (PartOf $x0 $x1) (Member $x1 soup))    ;; n 1 docs 1  e.g. tierB-000208

;; ---- slot transform.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 transform)    ;; n 2 docs 2  e.g. tierB-001209 tierB-001573

;; ---- slot transform.Result  [event center; head other]  n 2  docs<= 3  distinct 3  eventive 2
(And (Member $e0 transform) (Result $e0 $e1) (Member $e1 bat))    ;; n 1 docs 1  e.g. tierB-001209
(And (Member $e0 transform) (Result $e0 $e1) (Member $e1 cozy))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001573
(And (Member $e0 transform) (Result $e0 $e1) (Member $e1 theater))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001573

;; ---- slot translate.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 translate)    ;; n 2 docs 2  e.g. tierB-000310 tierB-001270

;; ---- slot trouser.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 trouser)    ;; n 1 docs 1  e.g. tierB-000367
(And (Member $x0 trouser) (Member $x0 yellow))    ;; n 1 docs 1  e.g. tierB-000367

;; ---- slot truck.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 truck)    ;; n 2 docs 2  e.g. tierB-000659 tierB-001027

;; ---- slot truth.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 truth)    ;; n 2 docs 2  e.g. tierB-000745 tierB-001223

;; ---- slot tunnel.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 tunnel)    ;; n 2 docs 2  e.g. tierC-000125 tierC-000126

;; ---- slot turn_off.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 turn_off)    ;; n 2 docs 2  e.g. tierB-001106 tierC-000315

;; ---- slot university.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 university)    ;; n 2 docs 2  e.g. tierB-000292 tierB-001986

;; ---- slot usual.Member  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(Member $x0 usual)    ;; n 1 docs 1  e.g. tierC-000135
(And (Member $x0 usual) (Member $x0 view))    ;; n 1 docs 1  e.g. tierC-000135

;; ---- slot vending_machine.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 vending_machine)    ;; n 2 docs 2  e.g. tierB-001325 tierB-001354

;; ---- slot verdict.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 verdict)    ;; n 2 docs 2  e.g. tierB-001082 tierB-001930

;; ---- slot visit.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 visit)    ;; n 2 docs 2  e.g. tierB-000985 tierB-001653

;; ---- slot voice.Member  [event center; head other]  n 2  docs<= 1  distinct 1  eventive 0
(Member $e0 voice)    ;; n 2 docs 1  e.g. tierC-000093

;; ---- slot western.LocatedIn  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 western) (LocatedIn $x0 china))    ;; n 1 docs 1  e.g. tierC-000144
(And (Member $x0 western) (LocatedIn $x0 europe))    ;; n 1 docs 1  e.g. tierC-000279

;; ---- slot western.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 western)    ;; n 2 docs 2  e.g. tierC-000144 tierC-000279

;; ---- slot widespread.But  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(And (Member $e0 widespread) (But $e0 <term:SameDegree>))    ;; n 2 docs 2  e.g. tierC-000097 tierC-000098

;; ---- slot widespread.Member  [event center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $e0 widespread)    ;; n 2 docs 2  e.g. tierC-000097 tierC-000098

;; ---- slot work.Possession  [entity center; head other]  n 2  docs<= 2  distinct 2  eventive 0
(And (Member $x0 work) (Possession $x0 $x1))    ;; n 1 docs 1  e.g. tierC-000236
(And (Member $x0 work) (Possession $x0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierC-000235

;; ---- slot writer.Member  [entity center; head other]  n 2  docs<= 2  distinct 1  eventive 0
(Member $x0 writer)    ;; n 2 docs 2  e.g. tierB-000728 tierB-000926

;; ---- slot <unclassed>.Atop  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Atop $x0 $x1) (Member $x1 head))    ;; n 1 docs 1  e.g. tierB-001412

;; ---- slot <unclassed>.CardinalityAtLeast  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(CardinalityAtLeast $x0 <num>)    ;; n 1 docs 1  e.g. tierB-000579

;; ---- slot <unclassed>.CardinalityAtMost  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(CardinalityAtMost $x0 <num>)    ;; n 1 docs 1  e.g. tierB-001286

;; ---- slot <unclassed>.For  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (For $x0 $x1) (Member $x1 accident))    ;; n 1 docs 1  e.g. tierB-001806

;; ---- slot <unclassed>.In  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (In $x0 $x1) (Member $x1 election))    ;; n 1 docs 1  e.g. tierB-001616

;; ---- slot <unclassed>.Inheritance  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Inheritance $x0 <term:can>)    ;; n 1 docs 1  e.g. tierB-000467

;; ---- slot <unclassed>.RatherThan  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (RatherThan $x0 $x1) (Member $x1 live))    ;; n 1 docs 1  e.g. tierB-000405

;; ---- slot <unclassed>.RestOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (RestOf $x0 $x1) (Member $x1 cake))    ;; n 1 docs 1  e.g. tierB-001518

;; ---- slot <unclassed>.ThanksTo  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(ThanksTo $x0 genetic_engineering)    ;; n 1 docs 1  e.g. tierB-001780

;; ---- slot absent.Because  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 absent) (Because $e0 $e1) (Member $e1 illness))    ;; n 1 docs 1  e.g. tierB-001625

;; ---- slot absent.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 absent)    ;; n 1 docs 1  e.g. tierB-001625

;; ---- slot absorb.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 absorb)    ;; n 1 docs 1  e.g. tierB-001902

;; ---- slot absorbed.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 absorbed)    ;; n 1 docs 1  e.g. tierB-000783

;; ---- slot abuse.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 abuse)    ;; n 1 docs 1  e.g. tierB-001773

;; ---- slot accept.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 accept)    ;; n 1 docs 1  e.g. tierB-000328

;; ---- slot accident.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 accident)    ;; n 1 docs 1  e.g. tierB-001277

;; ---- slot accomplish.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 accomplish)    ;; n 1 docs 1  e.g. tierB-001974

;; ---- slot according.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 according)    ;; n 1 docs 1  e.g. tierB-001680

;; ---- slot accrete.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 accrete)    ;; n 1 docs 1  e.g. tierB-001283

;; ---- slot accuse.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 accuse)    ;; n 1 docs 1  e.g. tierB-000548

;; ---- slot achieve.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 achieve)    ;; n 1 docs 1  e.g. tierB-000139

;; ---- slot act.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 act)    ;; n 1 docs 1  e.g. tierB-001346

;; ---- slot ad.For  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 ad) (For $x0 $x1) (Member $x1 movie))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001253
(And (Member $x0 ad) (For $x0 $x1) (Member $x1 upcoming))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001253

;; ---- slot ad.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ad)    ;; n 1 docs 1  e.g. tierB-001253

;; ---- slot add.During  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 add) (During $e0 $e1) (Member $e1 print))    ;; n 1 docs 1  e.g. tierC-000231

;; ---- slot admission.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 admission)    ;; n 1 docs 1  e.g. tierB-001953

;; ---- slot adorn.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 adorn)    ;; n 1 docs 1  e.g. tierB-001132

;; ---- slot advise.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 advise)    ;; n 1 docs 1  e.g. tierB-000793

;; ---- slot aeroplane.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 aeroplane)    ;; n 1 docs 1  e.g. tierB-000230

;; ---- slot aesthetic_salon.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 aesthetic_salon)    ;; n 1 docs 1  e.g. tierB-001857

;; ---- slot afloat.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 afloat)    ;; n 1 docs 1  e.g. tierB-001179

;; ---- slot afraid.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 afraid)    ;; n 1 docs 1  e.g. tierB-001090

;; ---- slot agree.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 agree)    ;; n 1 docs 1  e.g. tierB-001686

;; ---- slot airplane.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 airplane)    ;; n 1 docs 1  e.g. tierB-001471

;; ---- slot alarmed.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 alarmed)    ;; n 1 docs 1  e.g. tierB-001079

;; ---- slot algerian_government.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 algerian_government)    ;; n 1 docs 1  e.g. tierB-000268

;; ---- slot alien.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 alien)    ;; n 1 docs 1  e.g. tierB-000469

;; ---- slot alive.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 alive)    ;; n 1 docs 1  e.g. tierB-001332

;; ---- slot all_right.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 all_right)    ;; n 1 docs 1  e.g. tierB-000051

;; ---- slot alternating.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 alternating) (GroupOf $x0 splotch))    ;; n 1 docs 1  e.g. tierB-001652

;; ---- slot alternating.PartOf  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 alternating) (PartOf $x0 $x1) (Member $x1 hooded_crow))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001652
(And (Member $x0 alternating) (PartOf $x0 $x1) (Member $x1 unmistakeable))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001652

;; ---- slot american_assistance.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 american_assistance)    ;; n 1 docs 1  e.g. tierB-000969

;; ---- slot american_phone_number.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 american_phone_number)    ;; n 1 docs 1  e.g. tierB-000607

;; ---- slot anger.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 anger)    ;; n 1 docs 1  e.g. tierB-001669

;; ---- slot angry.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 angry)    ;; n 1 docs 1  e.g. tierB-001363

;; ---- slot animal.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 animal)    ;; n 1 docs 1  e.g. tierB-001461

;; ---- slot annex.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 annex)    ;; n 1 docs 1  e.g. tierB-000709

;; ---- slot announce.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 announce)    ;; n 1 docs 1  e.g. tierB-001697

;; ---- slot answer.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 answer)    ;; n 1 docs 1  e.g. tierB-001426

;; ---- slot answer_to.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 answer_to)    ;; n 1 docs 1  e.g. tierB-001416

;; ---- slot ant.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ant)    ;; n 1 docs 1  e.g. tierB-000036

;; ---- slot anti_trans_movement.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 anti_trans_movement)    ;; n 1 docs 1  e.g. tierB-001549

;; ---- slot antinomic.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 antinomic)    ;; n 1 docs 1  e.g. tierB-000952

;; ---- slot antinomic.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 antinomic) (To $e0 freedom_of_worship))    ;; n 1 docs 1  e.g. tierB-000952

;; ---- slot apartheid_system.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 apartheid_system)    ;; n 1 docs 1  e.g. tierB-001611

;; ---- slot apologize.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 apologize)    ;; n 1 docs 1  e.g. tierB-000239

;; ---- slot app.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 app)    ;; n 1 docs 1  e.g. tierB-000607

;; ---- slot appeal.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 appeal)    ;; n 1 docs 1  e.g. tierB-001930

;; ---- slot applaud.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 applaud)    ;; n 1 docs 1  e.g. tierB-001052

;; ---- slot apple.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 apple) (LocatedIn $x0 $x1) (Member $x1 book))    ;; n 1 docs 1  e.g. tierB-000458

;; ---- slot apply.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 apply)    ;; n 1 docs 1  e.g. tierB-001728

;; ---- slot arm.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 arm) (PartOf $x0 $x1) (Member $x1 ministry))    ;; n 1 docs 1  e.g. tierC-000008

;; ---- slot army.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 army) (PartOf $x0 persia))    ;; n 1 docs 1  e.g. tierC-000158

;; ---- slot aroma.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 aroma)    ;; n 1 docs 1  e.g. tierB-001403

;; ---- slot around.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 around)    ;; n 1 docs 1  e.g. tierB-000836

;; ---- slot arrival.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 arrival)    ;; n 1 docs 1  e.g. tierB-000005

;; ---- slot arrow.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 arrow)    ;; n 1 docs 1  e.g. tierB-001190

;; ---- slot ascend.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 ascend)    ;; n 1 docs 1  e.g. tierB-000826

;; ---- slot ashamed.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 ashamed)    ;; n 1 docs 1  e.g. tierB-001568

;; ---- slot ask.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 ask)    ;; n 1 docs 1  e.g. tierB-001449

;; ---- slot assailant.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 assailant)    ;; n 1 docs 1  e.g. tierB-001262

;; ---- slot assault.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 assault)    ;; n 1 docs 1  e.g. tierB-000213

;; ---- slot asshole.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 asshole) (Possession $x0 $x1) (Member $x1 pack))    ;; n 1 docs 1  e.g. tierB-001198

;; ---- slot assistant.During  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 assistant) (During $e0 lagrand))    ;; n 1 docs 1  e.g. tierC-000152

;; ---- slot attend.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 attend)    ;; n 1 docs 1  e.g. tierB-001584

;; ---- slot attractive.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 attractive)    ;; n 1 docs 1  e.g. tierB-001874

;; ---- slot attractive.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 attractive) (To $e0 woman))    ;; n 1 docs 1  e.g. tierB-001874

;; ---- slot attribute.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 attribute)    ;; n 1 docs 1  e.g. tierB-000834

;; ---- slot auditorium.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 auditorium)    ;; n 1 docs 1  e.g. tierB-001286

;; ---- slot authenticity.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 authenticity)    ;; n 1 docs 1  e.g. tierB-000122

;; ---- slot authenticity.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 authenticity) (Possession $x0 $x1) (Member $x1 language))    ;; n 1 docs 1  e.g. tierB-000122

;; ---- slot avoid.Possession  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 avoid) (Possession $e0 hipster_subculture))    ;; n 1 docs 1  e.g. tierB-000674

;; ---- slot award.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 award)    ;; n 1 docs 1  e.g. tierB-000962

;; ---- slot award.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 award)    ;; n 1 docs 1  e.g. tierB-001101

;; ---- slot away_team.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 away_team)    ;; n 1 docs 1  e.g. tierB-001345

;; ---- slot back.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 back)    ;; n 1 docs 1  e.g. tierB-001044

;; ---- slot back.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 back) (PartOf $x0 $x1) (Member $x1 store))    ;; n 1 docs 1  e.g. tierB-001044

;; ---- slot backyard.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 backyard)    ;; n 1 docs 1  e.g. tierB-001091

;; ---- slot bad.To  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 bad) (To $x0 $x1) (Member $x1 village))    ;; n 1 docs 1  e.g. tierB-001958

;; ---- slot bag.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 bag)    ;; n 1 docs 1  e.g. tierB-001765

;; ---- slot bakery.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 bakery) (LocatedIn $x0 $x1) (Member $x1 corner))    ;; n 1 docs 1  e.g. tierB-001821

;; ---- slot bakery.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 bakery)    ;; n 1 docs 1  e.g. tierB-001821

;; ---- slot baking_powder.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 baking_powder)    ;; n 1 docs 1  e.g. tierB-001297

;; ---- slot balance.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 balance) (Possession $x0 political_power))    ;; n 1 docs 1  e.g. tierC-000258

;; ---- slot banach_mackey_topology.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 banach_mackey_topology)    ;; n 1 docs 1  e.g. tierC-000005

;; ---- slot bang.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 bang)    ;; n 1 docs 1  e.g. tierB-000189

;; ---- slot bank.Around  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 bank) (Around $x0 $x1) (Member $x1 corner))    ;; n 1 docs 1  e.g. tierB-001917

;; ---- slot bank.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 bank) (GroupOf $x0 document))    ;; n 1 docs 1  e.g. tierB-000931

;; ---- slot banking_industry.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 banking_industry)    ;; n 1 docs 1  e.g. tierB-001133

;; ---- slot barbershop.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 barbershop)    ;; n 1 docs 1  e.g. tierB-001435

;; ---- slot barbershop.Opposite  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 barbershop) (Opposite $x0 $x1) (Member $x1 bank))    ;; n 1 docs 1  e.g. tierB-001435

;; ---- slot barking.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 barking) (GroupOf $x0 noise))    ;; n 1 docs 1  e.g. tierB-001479

;; ---- slot bask.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 bask)    ;; n 1 docs 1  e.g. tierB-001904

;; ---- slot bat.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 bat)    ;; n 1 docs 1  e.g. tierB-001209

;; ---- slot battle.PartOf  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 battle) (PartOf $e0 mahabharata))    ;; n 1 docs 1  e.g. tierB-001076

;; ---- slot beach_house.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 beach_house)    ;; n 1 docs 1  e.g. tierB-000571

;; ---- slot bear.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 bear)    ;; n 1 docs 1  e.g. tierB-000813

;; ---- slot beard.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 beard)    ;; n 1 docs 1  e.g. tierB-001512

;; ---- slot beautiful.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 beautiful) (GroupOf $x0 flower))    ;; n 1 docs 1  e.g. tierB-001450

;; ---- slot beautiful.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 beautiful) (LocatedIn $x0 $x1) (Member $x1 paper))    ;; n 1 docs 1  e.g. tierB-001822

;; ---- slot become.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 become) (To $e0 $e1) (Member $e1 borrow))    ;; n 1 docs 1  e.g. tierC-000238

;; ---- slot beget.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 beget)    ;; n 1 docs 1  e.g. tierB-000778

;; ---- slot bell.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 bell)    ;; n 1 docs 1  e.g. tierB-000726

;; ---- slot bench.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 bench) (LocatedIn $x0 $x1) (Member $x1 square))    ;; n 1 docs 1  e.g. tierB-000305

;; ---- slot beset.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 beset)    ;; n 1 docs 1  e.g. tierB-001424

;; ---- slot better.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 better)    ;; n 1 docs 1  e.g. tierB-001016

;; ---- slot big.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 big) (GroupOf $x0 animal))    ;; n 1 docs 1  e.g. tierB-001833

;; ---- slot big.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 big) (LocatedIn $x0 $x1) (Member $x1 corner))    ;; n 1 docs 1  e.g. tierB-000912

;; ---- slot big.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 big)    ;; n 1 docs 1  e.g. tierB-001851

;; ---- slot billboard.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 billboard)    ;; n 1 docs 1  e.g. tierB-001253

;; ---- slot bird_dropping.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 bird_dropping)    ;; n 1 docs 1  e.g. tierB-001230

;; ---- slot bite.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 bite)    ;; n 1 docs 1  e.g. tierB-001473

;; ---- slot black.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 black) (GroupOf $x0 wooden_table))    ;; n 1 docs 1  e.g. tierB-001509

;; ---- slot black.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 black) (LocatedIn $x0 $x1) (Member $x1 restaurant))    ;; n 1 docs 1  e.g. tierB-001509

;; ---- slot blend_in.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 blend_in)    ;; n 1 docs 1  e.g. tierB-001117

;; ---- slot blog.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 blog)    ;; n 1 docs 1  e.g. tierB-001404

;; ---- slot blood.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 blood)    ;; n 1 docs 1  e.g. tierB-001360

;; ---- slot bloom.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 bloom)    ;; n 1 docs 1  e.g. tierB-001814

;; ---- slot blue.For  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 blue) (For $x0 door))    ;; n 1 docs 1  e.g. tierB-001264

;; ---- slot blue.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 blue) (GroupOf $x0 pocket))    ;; n 1 docs 1  e.g. tierB-001940

;; ---- slot bodhi_tree.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 bodhi_tree)    ;; n 1 docs 1  e.g. tierB-001377

;; ---- slot body.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 body)    ;; n 1 docs 1  e.g. tierB-001243

;; ---- slot boil_down.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 boil_down)    ;; n 1 docs 1  e.g. tierB-000093

;; ---- slot boil_down.To  [event center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 boil_down) (To $e0 $x1) (Member $x1 practice))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000093
(And (Member $e0 boil_down) (To $e0 $x1) (Member $x1 thing))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000093

;; ---- slot book.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 book)    ;; n 1 docs 1  e.g. tierB-000717

;; ---- slot border.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 border)    ;; n 1 docs 1  e.g. tierB-000696

;; ---- slot border.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 border)    ;; n 1 docs 1  e.g. tierB-000601

;; ---- slot border_incident.Before  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 border_incident) (Before $x0 $e1) (Member $e1 order))    ;; n 1 docs 1  e.g. tierB-001222

;; ---- slot border_incident.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 border_incident)    ;; n 1 docs 1  e.g. tierB-001222

;; ---- slot border_section.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 border_section)    ;; n 1 docs 1  e.g. tierC-000217

;; ---- slot bottom_field.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 bottom_field)    ;; n 1 docs 1  e.g. tierB-000291

;; ---- slot break.But  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 break) (But $e0 $e1) (Member $e1 find))    ;; n 1 docs 1  e.g. tierC-000244

;; ---- slot break_into.But  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 break_into) (But $e0 $e1) (Member $e1 find))    ;; n 1 docs 1  e.g. tierC-000243

;; ---- slot break_into.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 break_into)    ;; n 1 docs 1  e.g. tierC-000243

;; ---- slot breaking_point.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 breaking_point)    ;; n 1 docs 1  e.g. tierB-001276

;; ---- slot breaking_point.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 breaking_point) (Possession $x0 $x1) (Member $x1 space_mission))    ;; n 1 docs 1  e.g. tierB-001276

;; ---- slot breeze.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 breeze)    ;; n 1 docs 1  e.g. tierB-001961

;; ---- slot bring_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 bring_out)    ;; n 1 docs 1  e.g. tierB-000466

;; ---- slot british_ship.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 british_ship)    ;; n 1 docs 1  e.g. tierB-000636

;; ---- slot brush_aside.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 brush_aside)    ;; n 1 docs 1  e.g. tierB-001172

;; ---- slot bud.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 bud)    ;; n 1 docs 1  e.g. tierB-001394

;; ---- slot build_up.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 build_up)    ;; n 1 docs 1  e.g. tierB-000936

;; ---- slot burglary_conviction.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 burglary_conviction)    ;; n 1 docs 1  e.g. tierB-001786

;; ---- slot burn.Result  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 burn) (Result $e0 $e1) (Member $e1 black))    ;; n 1 docs 1  e.g. tierB-001882

;; ---- slot burnish.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 burnish)    ;; n 1 docs 1  e.g. tierB-001130

;; ---- slot burrow.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 burrow)    ;; n 1 docs 1  e.g. tierB-001308

;; ---- slot bus_ride.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 bus_ride)    ;; n 1 docs 1  e.g. tierB-000017

;; ---- slot bus_schedule.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 bus_schedule)    ;; n 1 docs 1  e.g. tierB-000560

;; ---- slot business_climate.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 business_climate)    ;; n 1 docs 1  e.g. tierB-000086

;; ---- slot business_climate.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 business_climate) (Possession $x0 algeria))    ;; n 1 docs 1  e.g. tierB-000086

;; ---- slot bustle.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 bustle)    ;; n 1 docs 1  e.g. tierB-001966

;; ---- slot busy.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 busy) (LocatedIn $x0 $x1) (Member $x1 garden))    ;; n 1 docs 1  e.g. tierB-001208

;; ---- slot butterfly.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 butterfly)    ;; n 1 docs 1  e.g. tierB-000977

;; ---- slot button.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 button)    ;; n 1 docs 1  e.g. tierB-000201

;; ---- slot calf.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 calf)    ;; n 1 docs 1  e.g. tierB-001205

;; ---- slot calf.Possession  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 calf) (Possession $x0 $x1) (Member $x1 female))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001205
(And (Member $x0 calf) (Possession $x0 $x1) (Member $x1 giraffe))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001205

;; ---- slot call_for.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 call_for)    ;; n 1 docs 1  e.g. tierB-000120

;; ---- slot call_off.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 call_off)    ;; n 1 docs 1  e.g. tierB-000498

;; ---- slot calm.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 calm) (PartOf $x0 $x1) (Member $x1 lake))    ;; n 1 docs 1  e.g. tierB-000618

;; ---- slot camera.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 camera) (LocatedIn $x0 $x1) (Member $x1 table))    ;; n 1 docs 1  e.g. tierB-000619

;; ---- slot campaigner.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 campaigner)    ;; n 1 docs 1  e.g. tierB-000830

;; ---- slot campaigner.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 campaigner) (PartOf $x0 amnesty_international))    ;; n 1 docs 1  e.g. tierB-000830

;; ---- slot campfire.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 campfire)    ;; n 1 docs 1  e.g. tierB-001023

;; ---- slot capital.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 capital)    ;; n 1 docs 1  e.g. tierB-001342

;; ---- slot captain.LocatedIn  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 captain) (LocatedIn $e0 $x1) (Member $x1 ship))    ;; n 1 docs 1  e.g. tierB-000835

;; ---- slot captain.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 captain)    ;; n 1 docs 1  e.g. tierB-000835

;; ---- slot capture.TimeAtLeast  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 capture) (TimeAtLeast $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-000215

;; ---- slot capture.TimeAtMost  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 capture) (TimeAtMost $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-000215

;; ---- slot care.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 care)    ;; n 1 docs 1  e.g. tierB-000049

;; ---- slot careless.Only  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 careless) (Only $x0 $e1) (Member $e1 cost))    ;; n 1 docs 1  e.g. tierB-001452

;; ---- slot carry.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 carry)    ;; n 1 docs 1  e.g. tierB-001181

;; ---- slot carry_forward.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 carry_forward)    ;; n 1 docs 1  e.g. tierB-001638

;; ---- slot carry_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 carry_out)    ;; n 1 docs 1  e.g. tierB-000774

;; ---- slot case.During  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 case) (During $e0 $x1) (Member $x1 night_shift))    ;; n 1 docs 1  e.g. tierB-000844

;; ---- slot case.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 case)    ;; n 1 docs 1  e.g. tierB-001600

;; ---- slot case.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 case)    ;; n 1 docs 1  e.g. tierB-000844

;; ---- slot catastrophe.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 catastrophe)    ;; n 1 docs 1  e.g. tierB-001024

;; ---- slot catch_hold_of.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 catch_hold_of)    ;; n 1 docs 1  e.g. tierB-001798

;; ---- slot cause.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 cause) (Possession $x0 $x1) (Member $x1 wreck))    ;; n 1 docs 1  e.g. tierB-000919

;; ---- slot cave.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 cave)    ;; n 1 docs 1  e.g. tierB-000163

;; ---- slot caw.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 caw)    ;; n 1 docs 1  e.g. tierB-001655

;; ---- slot cell.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 cell)    ;; n 1 docs 1  e.g. tierB-001926

;; ---- slot cemetery_chapel.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 cemetery_chapel)    ;; n 1 docs 1  e.g. tierB-001626

;; ---- slot central_arm.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 central_arm)    ;; n 1 docs 1  e.g. tierC-000007

;; ---- slot central_arm.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 central_arm) (PartOf $x0 $x1) (Member $x1 ministry))    ;; n 1 docs 1  e.g. tierC-000007

;; ---- slot ceo.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ceo)    ;; n 1 docs 1  e.g. tierB-001101

;; ---- slot chance.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 chance)    ;; n 1 docs 1  e.g. tierB-000730

;; ---- slot change_mind.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 change_mind)    ;; n 1 docs 1  e.g. tierC-000012

;; ---- slot changing_room.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 changing_room)    ;; n 1 docs 1  e.g. tierB-001593

;; ---- slot channel.Communicate  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 channel) (Communicate $x0 $x1) (Member $x1 sea))    ;; n 1 docs 1  e.g. tierB-001296

;; ---- slot channel.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 channel)    ;; n 1 docs 1  e.g. tierB-001296

;; ---- slot chant.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 chant)    ;; n 1 docs 1  e.g. tierB-001169

;; ---- slot character.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 character)    ;; n 1 docs 1  e.g. tierB-001601

;; ---- slot cheap.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 cheap) (GroupOf $x0 excuse))    ;; n 1 docs 1  e.g. tierB-000370

;; ---- slot cheap.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 cheap)    ;; n 1 docs 1  e.g. tierB-000370

;; ---- slot cheap.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 cheap)    ;; n 1 docs 1  e.g. tierB-000370

;; ---- slot cheap.Only  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 cheap) (Only $x0 $e1) (Member $e1 get))    ;; n 1 docs 1  e.g. tierB-000370

;; ---- slot check.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 check)    ;; n 1 docs 1  e.g. tierB-000363

;; ---- slot check_in.For  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 check_in) (For $x0 $e1) (Member $e1 flight))    ;; n 1 docs 1  e.g. tierB-000308

;; ---- slot check_in.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 check_in)    ;; n 1 docs 1  e.g. tierB-000308

;; ---- slot chemical_agent.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 chemical_agent)    ;; n 1 docs 1  e.g. tierB-001431

;; ---- slot chest.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 chest)    ;; n 1 docs 1  e.g. tierB-001650

;; ---- slot chewing_gum.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 chewing_gum)    ;; n 1 docs 1  e.g. tierB-000482

;; ---- slot chicken_fried_steak.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 chicken_fried_steak)    ;; n 1 docs 1  e.g. tierB-000998

;; ---- slot child.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 child) (Possession $x0 $x1) (Member $x1 lady))    ;; n 1 docs 1  e.g. tierB-001114

;; ---- slot chili.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 chili)    ;; n 1 docs 1  e.g. tierB-000174

;; ---- slot choose.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 choose)    ;; n 1 docs 1  e.g. tierB-000610

;; ---- slot church.AcrossTheStreetFrom  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 church) (AcrossTheStreetFrom $x0 $x1) (Member $x1 cemetery))    ;; n 1 docs 1  e.g. tierB-000143

;; ---- slot city_centre.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 city_centre)    ;; n 1 docs 1  e.g. tierB-001163

;; ---- slot clarify.Possession  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 clarify) (Possession $e0 philosophy))    ;; n 1 docs 1  e.g. tierC-000022

;; ---- slot class.CardinalityAtMost  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 class) (CardinalityAtMost $x0 <num>))    ;; n 1 docs 1  e.g. tierB-001644

;; ---- slot class.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 class) (GroupOf $x0 student))    ;; n 1 docs 1  e.g. tierB-001644

;; ---- slot class.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 class)    ;; n 1 docs 1  e.g. tierB-000631

;; ---- slot classroom.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 classroom)    ;; n 1 docs 1  e.g. tierB-001219

;; ---- slot clear.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 clear) (GroupOf $x0 fact))    ;; n 1 docs 1  e.g. tierB-001093

;; ---- slot clearing.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 clearing)    ;; n 1 docs 1  e.g. tierB-001319

;; ---- slot clever.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 clever)    ;; n 1 docs 1  e.g. tierB-000898

;; ---- slot clock.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 clock)    ;; n 1 docs 1  e.g. tierB-000354

;; ---- slot closed.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 closed) (GroupOf $x0 door))    ;; n 1 docs 1  e.g. tierB-001474

;; ---- slot closed.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 closed)    ;; n 1 docs 1  e.g. tierB-001474

;; ---- slot closet.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 closet)    ;; n 1 docs 1  e.g. tierB-000756

;; ---- slot club.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 club)    ;; n 1 docs 1  e.g. tierB-001953

;; ---- slot coach.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 coach)    ;; n 1 docs 1  e.g. tierB-001720

;; ---- slot coalition.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 coalition)    ;; n 1 docs 1  e.g. tierB-000359

;; ---- slot coconut.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 coconut)    ;; n 1 docs 1  e.g. tierB-001750

;; ---- slot cold.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 cold) (LocatedIn $x0 istanbul))    ;; n 1 docs 1  e.g. tierB-000205

;; ---- slot cold.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 cold)    ;; n 1 docs 1  e.g. tierB-000362

;; ---- slot collaborate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 collaborate)    ;; n 1 docs 1  e.g. tierB-000166

;; ---- slot college.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 college)    ;; n 1 docs 1  e.g. tierB-000846

;; ---- slot colonization.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 colonization)    ;; n 1 docs 1  e.g. tierB-000710

;; ---- slot color.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 color)    ;; n 1 docs 1  e.g. tierB-000722

;; ---- slot color.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 color) (Possession $x0 $x1) (Member $x1 sky))    ;; n 1 docs 1  e.g. tierB-000722

;; ---- slot combination.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 combination)    ;; n 1 docs 1  e.g. tierB-000989

;; ---- slot combine.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 combine)    ;; n 1 docs 1  e.g. tierB-000371

;; ---- slot combine.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 combine) (To $e0 $e1) (Member $e1 make))    ;; n 1 docs 1  e.g. tierB-000371

;; ---- slot come_along.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 come_along)    ;; n 1 docs 1  e.g. tierB-000765

;; ---- slot come_into_force.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 come_into_force)    ;; n 1 docs 1  e.g. tierB-000437

;; ---- slot come_together.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 come_together)    ;; n 1 docs 1  e.g. tierB-001867

;; ---- slot come_together.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 come_together) (To $e0 $e1) (Member $e1 build))    ;; n 1 docs 1  e.g. tierB-001867

;; ---- slot come_up.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 come_up)    ;; n 1 docs 1  e.g. tierB-000078

;; ---- slot come_up.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 come_up) (To $e0 $e1) (Member $e1 talk))    ;; n 1 docs 1  e.g. tierB-000078

;; ---- slot comic.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 comic)    ;; n 1 docs 1  e.g. tierB-001221

;; ---- slot commit.During  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 commit) (During $e0 $x1) (Member $x1 war))    ;; n 1 docs 1  e.g. tierB-001204

;; ---- slot committee.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 committee)    ;; n 1 docs 1  e.g. tierB-000533

;; ---- slot common.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 common)    ;; n 1 docs 1  e.g. tierC-000136

;; ---- slot company.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 company) (LocatedIn $x0 eskisehir))    ;; n 1 docs 1  e.g. tierC-000046

;; ---- slot compare.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 compare)    ;; n 1 docs 1  e.g. tierB-001177

;; ---- slot compare.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 compare) (To $e0 $x1) (Member $x1 computer))    ;; n 1 docs 1  e.g. tierB-001177

;; ---- slot compassionate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 compassionate)    ;; n 1 docs 1  e.g. tierB-000496

;; ---- slot competitive_activity.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 competitive_activity)    ;; n 1 docs 1  e.g. tierC-000148

;; ---- slot complain.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 complain)    ;; n 1 docs 1  e.g. tierB-001365

;; ---- slot complete.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 complete)    ;; n 1 docs 1  e.g. tierB-001031

;; ---- slot complete.TimeAtMost  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 complete) (TimeAtMost $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-001031

;; ---- slot concept.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 concept)    ;; n 1 docs 1  e.g. tierB-000388

;; ---- slot concert_hall.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 concert_hall)    ;; n 1 docs 1  e.g. tierB-001332

;; ---- slot conclusion.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 conclusion)    ;; n 1 docs 1  e.g. tierB-001963

;; ---- slot condition.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 condition)    ;; n 1 docs 1  e.g. tierB-000599

;; ---- slot conductor.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 conductor)    ;; n 1 docs 1  e.g. tierB-001087

;; ---- slot confess.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 confess)    ;; n 1 docs 1  e.g. tierB-000240

;; ---- slot confess.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 confess) (To $e0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-000240

;; ---- slot conform.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 conform)    ;; n 1 docs 1  e.g. tierB-000674

;; ---- slot conform.To  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 conform) (To $x0 societal_norm))    ;; n 1 docs 1  e.g. tierB-000674

;; ---- slot confront.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 confront)    ;; n 1 docs 1  e.g. tierB-000401

;; ---- slot confusion.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 confusion)    ;; n 1 docs 1  e.g. tierB-000481

;; ---- slot conquest.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 conquest)    ;; n 1 docs 1  e.g. tierB-001031

;; ---- slot conquest.Start  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 conquest) (Start $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-001031

;; ---- slot conservative.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 conservative)    ;; n 1 docs 1  e.g. tierB-001817

;; ---- slot consideration.Before  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 consideration) (Before $x0 $e1) (Member $e1 decide))    ;; n 1 docs 1  e.g. tierB-001544

;; ---- slot consideration.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 consideration)    ;; n 1 docs 1  e.g. tierB-001544

;; ---- slot consist.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 consist)    ;; n 1 docs 1  e.g. tierB-001519

;; ---- slot constitute.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 constitute)    ;; n 1 docs 1  e.g. tierB-000673

;; ---- slot construct.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 construct)    ;; n 1 docs 1  e.g. tierB-001064

;; ---- slot consult.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 consult)    ;; n 1 docs 1  e.g. tierB-001079

;; ---- slot continue.Despite  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 continue) (Despite $e0 $x1) (Member $x1 hardship))    ;; n 1 docs 1  e.g. tierB-001977

;; ---- slot conversation.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 conversation)    ;; n 1 docs 1  e.g. tierB-000034

;; ---- slot cook.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 cook)    ;; n 1 docs 1  e.g. tierB-000864

;; ---- slot cookie_jar.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 cookie_jar)    ;; n 1 docs 1  e.g. tierB-000338

;; ---- slot cool.But  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 cool) (But $e0 $e1) (Member $e1 hot))    ;; n 1 docs 1  e.g. tierB-000463

;; ---- slot cool.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 cool)    ;; n 1 docs 1  e.g. tierB-000463

;; ---- slot correct.For  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 correct) (For $x0 $e1) (Member $e1 deal_with))    ;; n 1 docs 1  e.g. tierB-000555

;; ---- slot costume_style.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 costume_style)    ;; n 1 docs 1  e.g. tierB-001272

;; ---- slot couple.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 couple)    ;; n 1 docs 1  e.g. tierB-000828

;; ---- slot courage.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 courage)    ;; n 1 docs 1  e.g. tierB-000745

;; ---- slot course.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 course)    ;; n 1 docs 1  e.g. tierB-001803

;; ---- slot course.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 course) (Possession $x0 history))    ;; n 1 docs 1  e.g. tierB-001803

;; ---- slot courtyard.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 courtyard)    ;; n 1 docs 1  e.g. tierB-000809

;; ---- slot couscous.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 couscous) (LocatedIn $x0 $x1) (Member $x1 table))    ;; n 1 docs 1  e.g. tierB-001410

;; ---- slot couscous.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 couscous)    ;; n 1 docs 1  e.g. tierB-001410

;; ---- slot cow.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 cow)    ;; n 1 docs 1  e.g. tierB-000889

;; ---- slot crack.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 crack) (LocatedIn $x0 $x1) (Member $x1 windshield))    ;; n 1 docs 1  e.g. tierB-000265

;; ---- slot crack.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 crack)    ;; n 1 docs 1  e.g. tierB-000265

;; ---- slot crack_down.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 crack_down)    ;; n 1 docs 1  e.g. tierB-000097

;; ---- slot crackle.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 crackle)    ;; n 1 docs 1  e.g. tierB-001023

;; ---- slot crash.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 crash)    ;; n 1 docs 1  e.g. tierB-000176

;; ---- slot creature.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 creature)    ;; n 1 docs 1  e.g. tierB-001412

;; ---- slot crocodile.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 crocodile)    ;; n 1 docs 1  e.g. tierB-000470

;; ---- slot crop.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 crop)    ;; n 1 docs 1  e.g. tierB-000775

;; ---- slot cross.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 cross)    ;; n 1 docs 1  e.g. tierB-000227

;; ---- slot crow.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 crow)    ;; n 1 docs 1  e.g. tierB-001675

;; ---- slot crowd.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 crowd) (GroupOf $x0 person))    ;; n 1 docs 1  e.g. tierB-001108

;; ---- slot crowd.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 crowd)    ;; n 1 docs 1  e.g. tierB-000991

;; ---- slot cry.During  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 cry) (During $e0 $e1) (Member $e1 hide))    ;; n 1 docs 1  e.g. tierB-000502

;; ---- slot cry.Result  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 cry) (Result $e0 $e1) (Member $e1 sleep))    ;; n 1 docs 1  e.g. tierB-001538

;; ---- slot cultural_heritage.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 cultural_heritage) (GroupOf $x0 settlement))    ;; n 1 docs 1  e.g. tierB-001864

;; ---- slot cultural_heritage.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 cultural_heritage)    ;; n 1 docs 1  e.g. tierB-001864

;; ---- slot cup.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 cup)    ;; n 1 docs 1  e.g. tierB-000269

;; ---- slot customer.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 customer)    ;; n 1 docs 1  e.g. tierB-001623

;; ---- slot cut_down.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 cut_down)    ;; n 1 docs 1  e.g. tierB-000277

;; ---- slot cyberattack.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 cyberattack)    ;; n 1 docs 1  e.g. tierB-001275

;; ---- slot dad.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 dad)    ;; n 1 docs 1  e.g. tierB-000575

;; ---- slot dam.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 dam)    ;; n 1 docs 1  e.g. tierB-000032

;; ---- slot damage.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 damage)    ;; n 1 docs 1  e.g. tierB-000775

;; ---- slot damp.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 damp)    ;; n 1 docs 1  e.g. tierB-000911

;; ---- slot dance.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 dance)    ;; n 1 docs 1  e.g. tierB-000962

;; ---- slot darkness.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 darkness)    ;; n 1 docs 1  e.g. tierB-000507

;; ---- slot dead.From  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 dead) (From $x0 $x1) (Member $x1 cemetery))    ;; n 1 docs 1  e.g. tierB-001950

;; ---- slot dead.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 dead)    ;; n 1 docs 1  e.g. tierB-000256

;; ---- slot deal.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 deal)    ;; n 1 docs 1  e.g. tierB-001960

;; ---- slot deck.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 deck) (GroupOf $x0 card))    ;; n 1 docs 1  e.g. tierB-000101

;; ---- slot deck.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 deck)    ;; n 1 docs 1  e.g. tierB-000101

;; ---- slot decrease.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 decrease)    ;; n 1 docs 1  e.g. tierB-001359

;; ---- slot deficit.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 deficit)    ;; n 1 docs 1  e.g. tierB-001648

;; ---- slot degrading.About  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 degrading) (About $x0 woman))    ;; n 1 docs 1  e.g. tierB-000768

;; ---- slot delicious.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 delicious) (LocatedIn $x0 here))    ;; n 1 docs 1  e.g. tierB-001495

;; ---- slot deliver.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 deliver)    ;; n 1 docs 1  e.g. tierB-000598

;; ---- slot delivery.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 delivery)    ;; n 1 docs 1  e.g. tierB-001952

;; ---- slot demolish.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 demolish)    ;; n 1 docs 1  e.g. tierB-000471

;; ---- slot demon.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 demon)    ;; n 1 docs 1  e.g. tierB-001649

;; ---- slot demonstrate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 demonstrate)    ;; n 1 docs 1  e.g. tierB-001996

;; ---- slot depart.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 depart)    ;; n 1 docs 1  e.g. tierB-001927

;; ---- slot department.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 department) (LocatedIn $x0 $x1) (Member $x1 northeastern))    ;; n 1 docs 1  e.g. tierC-000264

;; ---- slot department.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 department)    ;; n 1 docs 1  e.g. tierC-000264

;; ---- slot department.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 department) (Possession $x0 santander))    ;; n 1 docs 1  e.g. tierC-000264

;; ---- slot departure.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 departure)    ;; n 1 docs 1  e.g. tierB-000308

;; ---- slot derivative.Possession  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 derivative) (Possession $x0 $x1) (Member $x1 original))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000932
(And (Member $x0 derivative) (Possession $x0 $x1) (Member $x1 turing_machine))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000932

;; ---- slot description.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 description) (LocatedIn $x0 $x1) (Member $x1 newspaper))    ;; n 1 docs 1  e.g. tierB-001416

;; ---- slot description.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 description)    ;; n 1 docs 1  e.g. tierB-001416

;; ---- slot desert.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 desert)    ;; n 1 docs 1  e.g. tierB-000524

;; ---- slot desk.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 desk) (LocatedIn $x0 $x1) (Member $x1 room))    ;; n 1 docs 1  e.g. tierB-001002

;; ---- slot desperate.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 desperate) (GroupOf $x0 person))    ;; n 1 docs 1  e.g. tierB-001539

;; ---- slot desperate.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 desperate)    ;; n 1 docs 1  e.g. tierB-001539

;; ---- slot desperate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 desperate)    ;; n 1 docs 1  e.g. tierB-001539

;; ---- slot destined.For  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 destined) (For $x0 oscar))    ;; n 1 docs 1  e.g. tierC-000009

;; ---- slot destroy.TimeAtLeast  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 destroy) (TimeAtLeast $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-000799

;; ---- slot destroy.TimeAtMost  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 destroy) (TimeAtMost $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-000799

;; ---- slot detailed.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 detailed) (GroupOf $x0 description))    ;; n 1 docs 1  e.g. tierB-001262

;; ---- slot detailed.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 detailed)    ;; n 1 docs 1  e.g. tierB-001262

;; ---- slot detailed.Of  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 detailed) (Of $x0 $x1) (Member $x1 assailant))    ;; n 1 docs 1  e.g. tierB-001262

;; ---- slot device.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 device)    ;; n 1 docs 1  e.g. tierB-000870

;; ---- slot devil.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 devil)    ;; n 1 docs 1  e.g. tierB-001147

;; ---- slot devote.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 devote)    ;; n 1 docs 1  e.g. tierB-000229

;; ---- slot devote.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 devote) (To $e0 $e1) (Member $e1 learn))    ;; n 1 docs 1  e.g. tierB-000229

;; ---- slot dictate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 dictate)    ;; n 1 docs 1  e.g. tierB-001389

;; ---- slot dictator.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 dictator)    ;; n 1 docs 1  e.g. tierB-001222

;; ---- slot die_down.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 die_down)    ;; n 1 docs 1  e.g. tierB-000062

;; ---- slot die_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 die_out)    ;; n 1 docs 1  e.g. tierB-001443

;; ---- slot differ.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 differ)    ;; n 1 docs 1  e.g. tierB-000629

;; ---- slot difficult.But  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 difficult) (But $e0 $x1) (Member $x1 go_back))    ;; n 1 docs 1  e.g. tierB-000925

;; ---- slot digest.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 digest)    ;; n 1 docs 1  e.g. tierB-001995

;; ---- slot diner.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 diner)    ;; n 1 docs 1  e.g. tierB-000998

;; ---- slot dining_room.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 dining_room)    ;; n 1 docs 1  e.g. tierB-001670

;; ---- slot dinner.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 dinner)    ;; n 1 docs 1  e.g. tierB-000168

;; ---- slot dinner_table.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 dinner_table)    ;; n 1 docs 1  e.g. tierB-001143

;; ---- slot diplomatic_crisis.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 diplomatic_crisis)    ;; n 1 docs 1  e.g. tierB-000969

;; ---- slot diplomatic_crisis.With  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 diplomatic_crisis) (With $x0 china))    ;; n 1 docs 1  e.g. tierB-000969

;; ---- slot direct.Of  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 direct) (Of $x0 caesium))    ;; n 1 docs 1  e.g. tierC-000068

;; ---- slot direct.With  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 direct) (With $x0 halogen))    ;; n 1 docs 1  e.g. tierC-000068

;; ---- slot director.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 director)    ;; n 1 docs 1  e.g. tierB-000064

;; ---- slot discipline.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 discipline) (LocatedIn $x0 $x1) (Member $x1 army))    ;; n 1 docs 1  e.g. tierC-000158

;; ---- slot discussion.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 discussion)    ;; n 1 docs 1  e.g. tierB-001963

;; ---- slot dismantle.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 dismantle)    ;; n 1 docs 1  e.g. tierB-001611

;; ---- slot display.Also  [event center; head other]  n 1  docs<= 2  distinct 2  eventive 1
(And (Member $e0 display) (Also $e0 $e1) (Member $e1 display))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001318
(And (Member $e0 display) (Also $e0 $e1) (Member $e1 popular))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001318

;; ---- slot dispute.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 dispute)    ;; n 1 docs 1  e.g. tierB-001534

;; ---- slot dissolve.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 dissolve)    ;; n 1 docs 1  e.g. tierC-000099

;; ---- slot distinguish.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 distinguish)    ;; n 1 docs 1  e.g. tierB-001445

;; ---- slot distort.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 distort)    ;; n 1 docs 1  e.g. tierB-001240

;; ---- slot distribute.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 distribute)    ;; n 1 docs 1  e.g. tierB-000485

;; ---- slot district.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 district) (LocatedIn $x0 canton_thurgau))    ;; n 1 docs 1  e.g. tierC-000156

;; ---- slot district.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 district)    ;; n 1 docs 1  e.g. tierC-000156

;; ---- slot district.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 district) (Possession $x0 frauenfeld))    ;; n 1 docs 1  e.g. tierC-000156

;; ---- slot divide.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 divide)    ;; n 1 docs 1  e.g. tierB-000824

;; ---- slot division.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 division)    ;; n 1 docs 1  e.g. tierB-001113

;; ---- slot do_away_with.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 do_away_with)    ;; n 1 docs 1  e.g. tierB-001226

;; ---- slot do_the_trick.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 do_the_trick)    ;; n 1 docs 1  e.g. tierB-001507

;; ---- slot do_time.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 do_time)    ;; n 1 docs 1  e.g. tierB-001786

;; ---- slot doctor.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 doctor)    ;; n 1 docs 1  e.g. tierB-000203

;; ---- slot document.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 document)    ;; n 1 docs 1  e.g. tierB-000555

;; ---- slot dog_feed.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 dog_feed)    ;; n 1 docs 1  e.g. tierB-001446

;; ---- slot donkey.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 donkey)    ;; n 1 docs 1  e.g. tierB-001983

;; ---- slot door.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 door) (PartOf $x0 $x1) (Member $x1 cell))    ;; n 1 docs 1  e.g. tierB-001926

;; ---- slot dough.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 dough) (LocatedIn $x0 $x1) (Member $x1 fridge))    ;; n 1 docs 1  e.g. tierB-000512

;; ---- slot dough.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 dough)    ;; n 1 docs 1  e.g. tierB-000512

;; ---- slot downtown_area.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 downtown_area) (PartOf $x0 $x1) (Member $x1 city))    ;; n 1 docs 1  e.g. tierB-001313

;; ---- slot drip.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 drip)    ;; n 1 docs 1  e.g. tierB-001110

;; ---- slot driver.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 driver)    ;; n 1 docs 1  e.g. tierB-000237

;; ---- slot drop.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 drop)    ;; n 1 docs 1  e.g. tierB-001465

;; ---- slot drum.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 drum)    ;; n 1 docs 1  e.g. tierC-000109

;; ---- slot dung_ball.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 dung_ball)    ;; n 1 docs 1  e.g. tierB-001735

;; ---- slot dung_ball.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 dung_ball) (Possession $x0 $x1) (Member $x1 dung_beetle))    ;; n 1 docs 1  e.g. tierB-001735

;; ---- slot dung_beetle.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 dung_beetle)    ;; n 1 docs 1  e.g. tierB-001735

;; ---- slot dwarf_planet.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 dwarf_planet)    ;; n 1 docs 1  e.g. tierB-001866

;; ---- slot eagle.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 eagle)    ;; n 1 docs 1  e.g. tierB-000121

;; ---- slot eardrum.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 eardrum)    ;; n 1 docs 1  e.g. tierB-000715

;; ---- slot earthenware_bowl.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 earthenware_bowl)    ;; n 1 docs 1  e.g. tierB-000016

;; ---- slot eat.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 eat)    ;; n 1 docs 1  e.g. tierB-000407

;; ---- slot eat_away.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 eat_away)    ;; n 1 docs 1  e.g. tierB-000249

;; ---- slot economics_magazine.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 economics_magazine)    ;; n 1 docs 1  e.g. tierB-001637

;; ---- slot edge.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 edge) (LocatedIn $x0 $x1) (Member $x1 town))    ;; n 1 docs 1  e.g. tierB-000739

;; ---- slot edge.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 edge)    ;; n 1 docs 1  e.g. tierB-000739

;; ---- slot editorial_staff.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 editorial_staff)    ;; n 1 docs 1  e.g. tierB-001448

;; ---- slot effect.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 effect)    ;; n 1 docs 1  e.g. tierB-000790

;; ---- slot effective.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 effective)    ;; n 1 docs 1  e.g. tierB-000786

;; ---- slot elect.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 elect)    ;; n 1 docs 1  e.g. tierB-001066

;; ---- slot election.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 election)    ;; n 1 docs 1  e.g. tierB-001616

;; ---- slot elegant.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 elegant) (Possession $x0 chinese))    ;; n 1 docs 1  e.g. tierB-001627

;; ---- slot emerge.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 emerge)    ;; n 1 docs 1  e.g. tierB-001838

;; ---- slot emergency_room.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 emergency_room)    ;; n 1 docs 1  e.g. tierB-000588

;; ---- slot enable.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 enable)    ;; n 1 docs 1  e.g. tierB-001445

;; ---- slot enclosure.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 enclosure)    ;; n 1 docs 1  e.g. tierB-001773

;; ---- slot enemy.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 enemy)    ;; n 1 docs 1  e.g. tierB-001688

;; ---- slot energy.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 energy)    ;; n 1 docs 1  e.g. tierB-000107

;; ---- slot engineer.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 engineer)    ;; n 1 docs 1  e.g. tierC-000350

;; ---- slot enough.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 enough)    ;; n 1 docs 1  e.g. tierB-001164

;; ---- slot enter.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 enter)    ;; n 1 docs 1  e.g. tierB-001566

;; ---- slot entrance.Around  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 entrance) (Around $x0 $x1) (Member $x1 corner))    ;; n 1 docs 1  e.g. tierB-000081

;; ---- slot entrance.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 entrance) (PartOf $x0 $x1) (Member $x1 theater))    ;; n 1 docs 1  e.g. tierB-001108

;; ---- slot entrance.To  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 entrance) (To $x0 $x1) (Member $x1 station))    ;; n 1 docs 1  e.g. tierB-000081

;; ---- slot environment.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 environment)    ;; n 1 docs 1  e.g. tierB-001151

;; ---- slot escort.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 escort)    ;; n 1 docs 1  e.g. tierB-000111

;; ---- slot esperanto_alphabet.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 esperanto_alphabet)    ;; n 1 docs 1  e.g. tierB-001605

;; ---- slot ethical_dilemma.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ethical_dilemma)    ;; n 1 docs 1  e.g. tierB-001661

;; ---- slot evaporate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 evaporate)    ;; n 1 docs 1  e.g. tierB-000251

;; ---- slot evening.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 evening)    ;; n 1 docs 1  e.g. tierB-000511

;; ---- slot event.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 event) (Before $e0 memorial_day))    ;; n 1 docs 1  e.g. tierB-000559

;; ---- slot event.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 event)    ;; n 1 docs 1  e.g. tierB-000258

;; ---- slot evil.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 evil)    ;; n 1 docs 1  e.g. tierB-000697

;; ---- slot evil.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 evil) (PartOf $x0 $x1) (Member $x1 evil))    ;; n 1 docs 1  e.g. tierB-000697

;; ---- slot evil_eye.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 evil_eye)    ;; n 1 docs 1  e.g. tierB-000453

;; ---- slot exam.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 exam)    ;; n 1 docs 1  e.g. tierB-001879

;; ---- slot excavate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 excavate)    ;; n 1 docs 1  e.g. tierB-000374

;; ---- slot exceed.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 exceed)    ;; n 1 docs 1  e.g. tierC-000194

;; ---- slot excitement.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 excitement)    ;; n 1 docs 1  e.g. tierB-001113

;; ---- slot excitement.Over  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 excitement) (Over $x0 $x1) (Member $x1 new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001113
(And (Member $x0 excitement) (Over $x0 $x1) (Member $x1 product))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001113

;; ---- slot exist.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 exist)    ;; n 1 docs 1  e.g. tierB-001671

;; ---- slot exit.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 exit)    ;; n 1 docs 1  e.g. tierB-000111

;; ---- slot expensive.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 expensive)    ;; n 1 docs 1  e.g. tierB-000370

;; ---- slot explain.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 explain)    ;; n 1 docs 1  e.g. tierB-000087

;; ---- slot explode.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 explode)    ;; n 1 docs 1  e.g. tierB-001669

;; ---- slot exterior.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 exterior)    ;; n 1 docs 1  e.g. tierB-000641

;; ---- slot exterior.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 exterior) (PartOf $x0 $x1) (Member $x1 cabinet))    ;; n 1 docs 1  e.g. tierB-000641

;; ---- slot extradition_clause.Also  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 extradition_clause) (Also $x0 $e1) (Member $e1 include))    ;; n 1 docs 1  e.g. tierB-001878

;; ---- slot extradition_clause.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 extradition_clause)    ;; n 1 docs 1  e.g. tierB-001878

;; ---- slot facade.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 facade) (PartOf $x0 $x1) (Member $x1 house))    ;; n 1 docs 1  e.g. tierB-000545

;; ---- slot factorial_function.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 factorial_function)    ;; n 1 docs 1  e.g. tierB-001951

;; ---- slot factory.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 factory)    ;; n 1 docs 1  e.g. tierB-001187

;; ---- slot fade.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 fade)    ;; n 1 docs 1  e.g. tierB-000685

;; ---- slot fail.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 fail)    ;; n 1 docs 1  e.g. tierB-001591

;; ---- slot faint.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 faint)    ;; n 1 docs 1  e.g. tierB-001384

;; ---- slot faint.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 faint) (Possession $x0 $x1) (Member $x1 train))    ;; n 1 docs 1  e.g. tierB-001384

;; ---- slot fair.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 fair)    ;; n 1 docs 1  e.g. tierB-001587

;; ---- slot fairy_tale.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 fairy_tale)    ;; n 1 docs 1  e.g. tierB-000783

;; ---- slot falcon.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 falcon)    ;; n 1 docs 1  e.g. tierB-000852

;; ---- slot fall.Result  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 fall) (Result $e0 $e1) (Member $e1 silent))    ;; n 1 docs 1  e.g. tierB-000609

;; ---- slot fall.Start  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 fall) (Start $e0 this_morning))    ;; n 1 docs 1  e.g. tierB-001905

;; ---- slot falling_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 falling_out)    ;; n 1 docs 1  e.g. tierB-000828

;; ---- slot fame.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 fame)    ;; n 1 docs 1  e.g. tierB-001310

;; ---- slot family_business.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 family_business)    ;; n 1 docs 1  e.g. tierB-001094

;; ---- slot fan.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 fan)    ;; n 1 docs 1  e.g. tierB-001163

;; ---- slot farm.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 farm)    ;; n 1 docs 1  e.g. tierB-001580

;; ---- slot fast.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 fast) (PartOf $x0 $x1) (Member $x1 song))    ;; n 1 docs 1  e.g. tierB-001556

;; ---- slot fear.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 fear)    ;; n 1 docs 1  e.g. tierB-001609

;; ---- slot federal_parliament.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 federal_parliament)    ;; n 1 docs 1  e.g. tierB-001762

;; ---- slot festival.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 festival)    ;; n 1 docs 1  e.g. tierB-001061

;; ---- slot fibrous.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 fibrous) (Possession $x0 persimmon))    ;; n 1 docs 1  e.g. tierB-001846

;; ---- slot fight.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 fight)    ;; n 1 docs 1  e.g. tierB-001610

;; ---- slot finalize.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 finalize)    ;; n 1 docs 1  e.g. tierB-001964

;; ---- slot fine.From  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 fine) (From $x0 love))    ;; n 1 docs 1  e.g. tierB-001383

;; ---- slot fine.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 fine)    ;; n 1 docs 1  e.g. tierB-001526

;; ---- slot fine.To  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 fine) (To $x0 hate))    ;; n 1 docs 1  e.g. tierB-001383

;; ---- slot fire.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 fire)    ;; n 1 docs 1  e.g. tierB-001824

;; ---- slot fishing_boat.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 fishing_boat)    ;; n 1 docs 1  e.g. tierB-000688

;; ---- slot flag.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 flag)    ;; n 1 docs 1  e.g. tierB-000831

;; ---- slot flag.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 flag) (Possession $x0 vila_velha))    ;; n 1 docs 1  e.g. tierB-000831

;; ---- slot flat.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 flat) (PartOf $x0 $x1) (Member $x1 hill))    ;; n 1 docs 1  e.g. tierB-000356

;; ---- slot flavor.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 flavor)    ;; n 1 docs 1  e.g. tierB-000466

;; ---- slot float.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 float)    ;; n 1 docs 1  e.g. tierB-000416

;; ---- slot floor.Only  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 floor) (Only $x0 $e1) (Member $e1 stop))    ;; n 1 docs 1  e.g. tierB-000792

;; ---- slot floor.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 floor) (PartOf $x0 $x1) (Member $x1 holy_place))    ;; n 1 docs 1  e.g. tierB-001125

;; ---- slot flow.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 flow)    ;; n 1 docs 1  e.g. tierB-001691

;; ---- slot fly_away.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 fly_away)    ;; n 1 docs 1  e.g. tierB-001675

;; ---- slot focusing_system.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 focusing_system)    ;; n 1 docs 1  e.g. tierB-000330

;; ---- slot focusing_system.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 focusing_system) (PartOf $x0 $x1) (Member $x1 camera))    ;; n 1 docs 1  e.g. tierB-000330

;; ---- slot fog.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 fog)    ;; n 1 docs 1  e.g. tierB-000702

;; ---- slot folder.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 folder)    ;; n 1 docs 1  e.g. tierB-000216

;; ---- slot foliage.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 foliage)    ;; n 1 docs 1  e.g. tierB-001961

;; ---- slot foment.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 foment)    ;; n 1 docs 1  e.g. tierB-000969

;; ---- slot food.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 food) (LocatedIn $x0 australia))    ;; n 1 docs 1  e.g. tierB-000862

;; ---- slot football_game.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 football_game)    ;; n 1 docs 1  e.g. tierB-001921

;; ---- slot force.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 force)    ;; n 1 docs 1  e.g. tierC-000041

;; ---- slot foreign_language.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 foreign_language)    ;; n 1 docs 1  e.g. tierB-001980

;; ---- slot foreign_minister.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 foreign_minister)    ;; n 1 docs 1  e.g. tierB-001584

;; ---- slot formula.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 formula)    ;; n 1 docs 1  e.g. tierB-001203

;; ---- slot fortified.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 fortified) (GroupOf $x0 position))    ;; n 1 docs 1  e.g. tierB-000146

;; ---- slot fortified.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 fortified) (LocatedIn $x0 crimea))    ;; n 1 docs 1  e.g. tierB-000146

;; ---- slot fortune.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 fortune)    ;; n 1 docs 1  e.g. tierB-001460

;; ---- slot found.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 found)    ;; n 1 docs 1  e.g. tierC-000176

;; ---- slot freeze.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 freeze)    ;; n 1 docs 1  e.g. tierB-001379

;; ---- slot freeze.On  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 freeze) (On $x0 wage_hike))    ;; n 1 docs 1  e.g. tierB-001379

;; ---- slot freeze_over.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 freeze_over)    ;; n 1 docs 1  e.g. tierB-000572

;; ---- slot freight_train.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 freight_train)    ;; n 1 docs 1  e.g. tierB-000329

;; ---- slot french.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 french)    ;; n 1 docs 1  e.g. tierC-000001

;; ---- slot fridge.Of  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 fridge) (Of $x0 food))    ;; n 1 docs 1  e.g. tierB-000918

;; ---- slot frost.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 frost)    ;; n 1 docs 1  e.g. tierB-000506

;; ---- slot fugitive.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 fugitive)    ;; n 1 docs 1  e.g. tierB-001070

;; ---- slot full.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 full) (Possession $x0 venezuela))    ;; n 1 docs 1  e.g. tierB-000861

;; ---- slot full_moon.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 full_moon)    ;; n 1 docs 1  e.g. tierB-000686

;; ---- slot funeral.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 funeral)    ;; n 1 docs 1  e.g. tierB-000126

;; ---- slot funeral_prayer.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 funeral_prayer)    ;; n 1 docs 1  e.g. tierB-001626

;; ---- slot gallows.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 gallows)    ;; n 1 docs 1  e.g. tierB-000427

;; ---- slot game.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 game)    ;; n 1 docs 1  e.g. tierB-000259

;; ---- slot gamma_function.Of  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 gamma_function) (Of $x0 $x1) (Member $x1 factorial_function))    ;; n 1 docs 1  e.g. tierB-001951

;; ---- slot gap.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 gap) (LocatedIn $x0 $x1) (Member $x1 fence))    ;; n 1 docs 1  e.g. tierB-001183

;; ---- slot gap.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 gap)    ;; n 1 docs 1  e.g. tierB-001183

;; ---- slot garden_ivy.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 garden_ivy)    ;; n 1 docs 1  e.g. tierB-001392

;; ---- slot gas_station.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 gas_station)    ;; n 1 docs 1  e.g. tierB-000797

;; ---- slot gather.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 gather) (To $e0 $e1) (Member $e1 watch))    ;; n 1 docs 1  e.g. tierB-000258

;; ---- slot generate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 generate)    ;; n 1 docs 1  e.g. tierB-000107

;; ---- slot get_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 get_out)    ;; n 1 docs 1  e.g. tierB-000138

;; ---- slot get_rid_of.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 get_rid_of)    ;; n 1 docs 1  e.g. tierB-000262

;; ---- slot ghost.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ghost)    ;; n 1 docs 1  e.g. tierB-001366

;; ---- slot giraffe.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 giraffe)    ;; n 1 docs 1  e.g. tierB-000725

;; ---- slot girl.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 girl) (Possession $x0 $x1) (Member $x1 story))    ;; n 1 docs 1  e.g. tierB-001280

;; ---- slot give_off.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 give_off)    ;; n 1 docs 1  e.g. tierB-000085

;; ---- slot glitch.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 glitch)    ;; n 1 docs 1  e.g. tierB-001931

;; ---- slot global.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 global) (Possession $x0 comprehension))    ;; n 1 docs 1  e.g. tierB-001668

;; ---- slot glory.In  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 glory) (In $x0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000040

;; ---- slot glory.Over  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 glory) (Over $x0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000040

;; ---- slot glow.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 glow)    ;; n 1 docs 1  e.g. tierB-000708

;; ---- slot glow.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 glow) (Possession $x0 $x1) (Member $x1 light))    ;; n 1 docs 1  e.g. tierB-000708

;; ---- slot go.Result  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 go) (Result $e0 $e1) (Member $e1 cold))    ;; n 1 docs 1  e.g. tierB-000362

;; ---- slot go_above_and_beyond.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 go_above_and_beyond)    ;; n 1 docs 1  e.g. tierB-000273

;; ---- slot go_around.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 go_around)    ;; n 1 docs 1  e.g. tierB-001547

;; ---- slot go_back.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 go_back)    ;; n 1 docs 1  e.g. tierB-000925

;; ---- slot go_in.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 go_in)    ;; n 1 docs 1  e.g. tierB-000363

;; ---- slot go_into_effect.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 go_into_effect)    ;; n 1 docs 1  e.g. tierB-001924

;; ---- slot go_off.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 go_off)    ;; n 1 docs 1  e.g. tierB-001756

;; ---- slot go_on.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 go_on)    ;; n 1 docs 1  e.g. tierB-001756

;; ---- slot go_on_sale.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 go_on_sale)    ;; n 1 docs 1  e.g. tierB-001513

;; ---- slot go_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 go_out)    ;; n 1 docs 1  e.g. tierB-000720

;; ---- slot go_without_saying.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 go_without_saying)    ;; n 1 docs 1  e.g. tierB-000657

;; ---- slot goalkeeper.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 goalkeeper)    ;; n 1 docs 1  e.g. tierB-001508

;; ---- slot golden_opportunity.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 golden_opportunity)    ;; n 1 docs 1  e.g. tierB-001486

;; ---- slot golem.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 golem)    ;; n 1 docs 1  e.g. tierB-001706

;; ---- slot golf_course.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 golf_course)    ;; n 1 docs 1  e.g. tierB-000042

;; ---- slot good.End  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 good) (End $e0 today))    ;; n 1 docs 1  e.g. tierB-001238

;; ---- slot good.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 good) (LocatedIn $x0 $x1) (Member $x1 city))    ;; n 1 docs 1  e.g. tierB-000546

;; ---- slot gorgeous.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 gorgeous) (Possession $x0 $x1) (Member $x1 landscape))    ;; n 1 docs 1  e.g. tierB-000501

;; ---- slot governor.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 governor)    ;; n 1 docs 1  e.g. tierB-000985

;; ---- slot graft_point.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 graft_point)    ;; n 1 docs 1  e.g. tierB-000479

;; ---- slot grandmother.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 grandmother)    ;; n 1 docs 1  e.g. tierB-000864

;; ---- slot grasp.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 grasp)    ;; n 1 docs 1  e.g. tierB-001572

;; ---- slot gray.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 gray)    ;; n 1 docs 1  e.g. tierB-000611

;; ---- slot great.For  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 great) (For $x0 boston))    ;; n 1 docs 1  e.g. tierB-000522

;; ---- slot great.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 great) (GroupOf $x0 symphony))    ;; n 1 docs 1  e.g. tierB-001575

;; ---- slot great.Inheritance  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 great) (Inheritance $x0 great))    ;; n 1 docs 1  e.g. tierB-001575

;; ---- slot greenery.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 greenery)    ;; n 1 docs 1  e.g. tierB-001132

;; ---- slot group.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 group) (GroupOf $x0 two_spirit_native_american))    ;; n 1 docs 1  e.g. tierB-001357

;; ---- slot guarantee.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 guarantee)    ;; n 1 docs 1  e.g. tierB-001069

;; ---- slot guardsman.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 guardsman)    ;; n 1 docs 1  e.g. tierB-000213

;; ---- slot gusher.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 gusher)    ;; n 1 docs 1  e.g. tierB-000654

;; ---- slot gusty.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 gusty) (GroupOf $x0 wind))    ;; n 1 docs 1  e.g. tierB-001754

;; ---- slot gusty.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 gusty)    ;; n 1 docs 1  e.g. tierB-001754

;; ---- slot hallway.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hallway)    ;; n 1 docs 1  e.g. tierB-000951

;; ---- slot hamster.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hamster)    ;; n 1 docs 1  e.g. tierB-000672

;; ---- slot hand.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hand)    ;; n 1 docs 1  e.g. tierB-001639

;; ---- slot hand_over.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 hand_over)    ;; n 1 docs 1  e.g. tierB-000150

;; ---- slot hang_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 hang_out)    ;; n 1 docs 1  e.g. tierB-000075

;; ---- slot happy.But  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 happy) (But $e0 $x1))    ;; n 1 docs 1  e.g. tierB-001832

;; ---- slot happy.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 happy)    ;; n 1 docs 1  e.g. tierB-001832

;; ---- slot hard.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 hard) (GroupOf $x0 habit))    ;; n 1 docs 1  e.g. tierB-000795

;; ---- slot harp.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 harp)    ;; n 1 docs 1  e.g. tierB-000648

;; ---- slot hatred.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 hatred) (LocatedIn $x0 $x1) (Member $x1 room))    ;; n 1 docs 1  e.g. tierB-000263

;; ---- slot hatred.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hatred)    ;; n 1 docs 1  e.g. tierB-000263

;; ---- slot have.Cleft  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 have) (Cleft $e0 $e1) (Member $e1 better))    ;; n 1 docs 1  e.g. tierB-001016

;; ---- slot have.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 have) (To $e0 $e1) (Member $e1 win))    ;; n 1 docs 1  e.g. tierB-000730

;; ---- slot hazardous.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 hazardous)    ;; n 1 docs 1  e.g. tierB-001754

;; ---- slot head.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 head)    ;; n 1 docs 1  e.g. tierB-001055

;; ---- slot head.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 head) (PartOf $x0 $x1) (Member $x1 creature))    ;; n 1 docs 1  e.g. tierB-001412

;; ---- slot health_care.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 health_care)    ;; n 1 docs 1  e.g. tierB-001716

;; ---- slot health_care.Possession  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 health_care) (Possession $x0 $x1) (Member $x1 local))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001716
(And (Member $x0 health_care) (Possession $x0 $x1) (Member $x1 population))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001716

;; ---- slot healthy.Because  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 healthy) (Because $x0 $e1) (Member $e1 healthy))    ;; n 1 docs 1  e.g. tierB-001710

;; ---- slot healthy.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 healthy)    ;; n 1 docs 1  e.g. tierB-001710

;; ---- slot healthy.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 healthy)    ;; n 1 docs 1  e.g. tierB-001710

;; ---- slot heat.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 heat)    ;; n 1 docs 1  e.g. tierB-000403

;; ---- slot heir.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 heir) (GroupOf $x0 english))    ;; n 1 docs 1  e.g. tierB-000968

;; ---- slot heir.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 heir)    ;; n 1 docs 1  e.g. tierB-000968

;; ---- slot heir.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 heir) (Possession $x0 freedom))    ;; n 1 docs 1  e.g. tierB-000968

;; ---- slot help.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 help)    ;; n 1 docs 1  e.g. tierC-000072

;; ---- slot help.Of  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 help) (Of $x0 karen))    ;; n 1 docs 1  e.g. tierC-000072

;; ---- slot high.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 high)    ;; n 1 docs 1  e.g. tierB-001937

;; ---- slot hike.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 hike)    ;; n 1 docs 1  e.g. tierB-000008

;; ---- slot hill.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hill)    ;; n 1 docs 1  e.g. tierB-000356

;; ---- slot hint.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 hint)    ;; n 1 docs 1  e.g. tierB-001596

;; ---- slot hit_on.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 hit_on)    ;; n 1 docs 1  e.g. tierB-000013

;; ---- slot hold.End  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 hold) (End $e0 dawn))    ;; n 1 docs 1  e.g. tierC-000284

;; ---- slot hole.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hole)    ;; n 1 docs 1  e.g. tierB-000693

;; ---- slot holy_place.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 holy_place)    ;; n 1 docs 1  e.g. tierB-001125

;; ---- slot homentropic_current.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 homentropic_current)    ;; n 1 docs 1  e.g. tierC-000154

;; ---- slot homentropic_flow.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 homentropic_flow)    ;; n 1 docs 1  e.g. tierC-000153

;; ---- slot homestretch.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 homestretch)    ;; n 1 docs 1  e.g. tierB-001860

;; ---- slot honorary_knighthood.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 honorary_knighthood)    ;; n 1 docs 1  e.g. tierB-001595

;; ---- slot hope.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hope)    ;; n 1 docs 1  e.g. tierB-001977

;; ---- slot horse.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 horse) (LocatedIn $x0 $x1) (Member $x1 farm))    ;; n 1 docs 1  e.g. tierB-001580

;; ---- slot horse_radish.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 horse_radish)    ;; n 1 docs 1  e.g. tierB-000733

;; ---- slot hospitable.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 hospitable) (GroupOf $x0 native))    ;; n 1 docs 1  e.g. tierB-000718

;; ---- slot hospitable.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hospitable)    ;; n 1 docs 1  e.g. tierB-000718

;; ---- slot hospital.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hospital)    ;; n 1 docs 1  e.g. tierB-000219

;; ---- slot host.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 host)    ;; n 1 docs 1  e.g. tierB-001868

;; ---- slot hot.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 hot)    ;; n 1 docs 1  e.g. tierB-000463

;; ---- slot hot_dog.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hot_dog)    ;; n 1 docs 1  e.g. tierB-000400

;; ---- slot hotel.From  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 hotel) (From $x0 here))    ;; n 1 docs 1  e.g. tierB-000149

;; ---- slot house.Across  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 house) (Across $x0 $x1) (Member $x1 street))    ;; n 1 docs 1  e.g. tierB-000882

;; ---- slot house.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 house) (LocatedIn $x0 $x1) (Member $x1 middle))    ;; n 1 docs 1  e.g. tierB-000524

;; ---- slot house.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 house) (Possession $x0 arakkal))    ;; n 1 docs 1  e.g. tierC-000095

;; ---- slot housing_market.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 housing_market) (LocatedIn $x0 us))    ;; n 1 docs 1  e.g. tierB-001567

;; ---- slot housing_market.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 housing_market)    ;; n 1 docs 1  e.g. tierB-001567

;; ---- slot huge.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 huge) (LocatedIn $x0 morocco))    ;; n 1 docs 1  e.g. tierB-001206

;; ---- slot human_barricade.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 human_barricade)    ;; n 1 docs 1  e.g. tierB-000780

;; ---- slot human_brain.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 human_brain)    ;; n 1 docs 1  e.g. tierB-001243

;; ---- slot human_condition.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 human_condition)    ;; n 1 docs 1  e.g. tierB-000477

;; ---- slot hungry.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 hungry) (GroupOf $x0 child))    ;; n 1 docs 1  e.g. tierB-000723

;; ---- slot hungry.Inheritance  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 hungry) (Inheritance $x0 hungry))    ;; n 1 docs 1  e.g. tierB-000723

;; ---- slot hungry.SubsetOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 hungry) (SubsetOf $x0 $x1) (Member $x1 child))    ;; n 1 docs 1  e.g. tierB-000723

;; ---- slot hunter.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hunter)    ;; n 1 docs 1  e.g. tierB-001399

;; ---- slot hunting_dog.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hunting_dog)    ;; n 1 docs 1  e.g. tierB-001055

;; ---- slot hush_of_anticipation.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 hush_of_anticipation)    ;; n 1 docs 1  e.g. tierB-001975

;; ---- slot ice.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ice)    ;; n 1 docs 1  e.g. tierB-001451

;; ---- slot identify.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 identify)    ;; n 1 docs 1  e.g. tierB-001191

;; ---- slot illegal.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 illegal)    ;; n 1 docs 1  e.g. tierB-001880

;; ---- slot illegal.TimeAtLeast  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 illegal) (TimeAtLeast $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-001880

;; ---- slot illegal.TimeAtMost  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 illegal) (TimeAtMost $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-001880

;; ---- slot illness.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 illness)    ;; n 1 docs 1  e.g. tierB-001625

;; ---- slot illumine.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 illumine)    ;; n 1 docs 1  e.g. tierB-001061

;; ---- slot illustrate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 illustrate)    ;; n 1 docs 1  e.g. tierC-000232

;; ---- slot image.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 image)    ;; n 1 docs 1  e.g. tierB-001130

;; ---- slot image.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 image) (Possession $x0 $x1) (Member $x1 company))    ;; n 1 docs 1  e.g. tierB-001130

;; ---- slot imam.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 imam) (LocatedIn $x0 there))    ;; n 1 docs 1  e.g. tierB-000003

;; ---- slot imam.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 imam)    ;; n 1 docs 1  e.g. tierB-000003

;; ---- slot imitate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 imitate)    ;; n 1 docs 1  e.g. tierB-001888

;; ---- slot implement.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 implement)    ;; n 1 docs 1  e.g. tierB-000281

;; ---- slot implement.Start  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 implement) (Start $e0 next_month))    ;; n 1 docs 1  e.g. tierB-000281

;; ---- slot implore.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 implore)    ;; n 1 docs 1  e.g. tierC-000043

;; ---- slot important.In  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 important) (In $x0 $e1) (Member $e1 create))    ;; n 1 docs 1  e.g. tierB-000089

;; ---- slot imprison.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 imprison)    ;; n 1 docs 1  e.g. tierB-000610

;; ---- slot in_charge_of.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 in_charge_of)    ;; n 1 docs 1  e.g. tierB-001171

;; ---- slot in_fashion.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 in_fashion)    ;; n 1 docs 1  e.g. tierB-001896

;; ---- slot in_fashion.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 in_fashion) (Possession $x0 hat))    ;; n 1 docs 1  e.g. tierB-001896

;; ---- slot increase.Despite  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 increase) (Despite $e0 $x1) (Member $x1 steel))    ;; n 1 docs 1  e.g. tierB-000690

;; ---- slot incubate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 incubate)    ;; n 1 docs 1  e.g. tierB-000217

;; ---- slot indicate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 indicate)    ;; n 1 docs 1  e.g. tierB-001190

;; ---- slot indigenous.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 indigenous)    ;; n 1 docs 1  e.g. tierC-000001

;; ---- slot indonesian.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 indonesian) (GroupOf $x0 immigrant))    ;; n 1 docs 1  e.g. tierC-000351

;; ---- slot indonesian.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 indonesian)    ;; n 1 docs 1  e.g. tierC-000351

;; ---- slot industrial_output.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 industrial_output)    ;; n 1 docs 1  e.g. tierB-000690

;; ---- slot industrialization.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 industrialization)    ;; n 1 docs 1  e.g. tierC-000087

;; ---- slot informal_economy.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 informal_economy)    ;; n 1 docs 1  e.g. tierB-001388

;; ---- slot ingredient.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ingredient)    ;; n 1 docs 1  e.g. tierB-000750

;; ---- slot injure.During  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 injure) (During $e0 $x1) (Member $x1 film))    ;; n 1 docs 1  e.g. tierB-001017

;; ---- slot inmate.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 inmate)    ;; n 1 docs 1  e.g. tierB-001786

;; ---- slot inomaru.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 inomaru)    ;; n 1 docs 1  e.g. tierC-000237

;; ---- slot install.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 install) (Before $e0 $x1))    ;; n 1 docs 1  e.g. tierB-001845

;; ---- slot install.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 install)    ;; n 1 docs 1  e.g. tierB-001845

;; ---- slot insurance.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 insurance)    ;; n 1 docs 1  e.g. tierB-001758

;; ---- slot international_balance_of_political_power.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 international_balance_of_political_power)    ;; n 1 docs 1  e.g. tierC-000257

;; ---- slot into.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 into)    ;; n 1 docs 1  e.g. tierB-000603

;; ---- slot investigate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 investigate)    ;; n 1 docs 1  e.g. tierB-001355

;; ---- slot investigation.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 investigation)    ;; n 1 docs 1  e.g. tierB-001589

;; ---- slot involve.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 involve)    ;; n 1 docs 1  e.g. tierB-001222

;; ---- slot involved.During  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 involved) (During $e0 $x1) (Member $x1 battle))    ;; n 1 docs 1  e.g. tierB-000411

;; ---- slot involved.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 involved)    ;; n 1 docs 1  e.g. tierB-000411

;; ---- slot iron_bar.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 iron_bar)    ;; n 1 docs 1  e.g. tierB-000249

;; ---- slot isostructural.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 isostructural) (Possession $x0 technetium))    ;; n 1 docs 1  e.g. tierC-000164

;; ---- slot israeli_military_ship.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 israeli_military_ship)    ;; n 1 docs 1  e.g. tierB-000581

;; ---- slot issue.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 issue)    ;; n 1 docs 1  e.g. tierB-000997

;; ---- slot issue.Start  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 issue) (Start $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-000997

;; ---- slot ivory.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ivory)    ;; n 1 docs 1  e.g. tierC-000114

;; ---- slot jail.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 jail)    ;; n 1 docs 1  e.g. tierB-000867

;; ---- slot joke.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 joke)    ;; n 1 docs 1  e.g. tierB-001989

;; ---- slot jungle.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 jungle)    ;; n 1 docs 1  e.g. tierB-000994

;; ---- slot jury.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 jury)    ;; n 1 docs 1  e.g. tierB-001082

;; ---- slot keep.During  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 keep) (During $e0 $e1) (Member $e1 make))    ;; n 1 docs 1  e.g. tierB-001809

;; ---- slot keep_a_clean_sheet.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 keep_a_clean_sheet)    ;; n 1 docs 1  e.g. tierB-001508

;; ---- slot keep_away.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 keep_away)    ;; n 1 docs 1  e.g. tierB-001837

;; ---- slot keeper.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 keeper)    ;; n 1 docs 1  e.g. tierB-000631

;; ---- slot ketchup.Equivalent  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 ketchup) (Equivalent $x0 $x1) (Member $x1 tomato))    ;; n 1 docs 1  e.g. tierB-001067

;; ---- slot ketchup.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ketchup)    ;; n 1 docs 1  e.g. tierB-001067

;; ---- slot key_in.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 key_in)    ;; n 1 docs 1  e.g. tierB-001922

;; ---- slot key_in.To  [event center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 key_in) (To $e0 $x1) (Member $x1 action))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001922
(And (Member $e0 key_in) (To $e0 $x1) (Member $x1 onscreen))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001922

;; ---- slot kick.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 kick)    ;; n 1 docs 1  e.g. tierB-001092

;; ---- slot kick_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 kick_out)    ;; n 1 docs 1  e.g. tierB-000438

;; ---- slot kill.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 kill) (Before $e0 $e1) (Member $e1 escape))    ;; n 1 docs 1  e.g. tierB-000412

;; ---- slot kill_time.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 kill_time)    ;; n 1 docs 1  e.g. tierB-000504

;; ---- slot kind.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 kind)    ;; n 1 docs 1  e.g. tierB-000496

;; ---- slot kindness.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 kindness) (LocatedIn $x0 $x1) (Member $x1 room))    ;; n 1 docs 1  e.g. tierB-000263

;; ---- slot kindness.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 kindness)    ;; n 1 docs 1  e.g. tierB-000263

;; ---- slot king.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 king)    ;; n 1 docs 1  e.g. tierB-001809

;; ---- slot kit_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 kit_out)    ;; n 1 docs 1  e.g. tierB-001429

;; ---- slot kitchen_island.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 kitchen_island)    ;; n 1 docs 1  e.g. tierB-001663

;; ---- slot knob.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 knob)    ;; n 1 docs 1  e.g. tierB-000446

;; ---- slot knock.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 knock)    ;; n 1 docs 1  e.g. tierB-000751

;; ---- slot knock.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 knock)    ;; n 1 docs 1  e.g. tierB-001899

;; ---- slot kushikatsu_restaurant.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 kushikatsu_restaurant) (LocatedIn $x0 osaka))    ;; n 1 docs 1  e.g. tierB-001707

;; ---- slot kushikatsu_restaurant.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 kushikatsu_restaurant)    ;; n 1 docs 1  e.g. tierB-001707

;; ---- slot lady.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 lady) (LocatedIn $x0 next_door))    ;; n 1 docs 1  e.g. tierB-001114

;; ---- slot lair.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 lair)    ;; n 1 docs 1  e.g. tierB-000423

;; ---- slot lair.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 lair) (Possession $x0 $x1) (Member $x1 fox))    ;; n 1 docs 1  e.g. tierB-000423

;; ---- slot land.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 land)    ;; n 1 docs 1  e.g. tierB-001835

;; ---- slot landing.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 landing)    ;; n 1 docs 1  e.g. tierB-000147

;; ---- slot landscape.LocatedIn  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 landscape) (LocatedIn $x0 $x1) (Member $x1 coast))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000501
(And (Member $x0 landscape) (LocatedIn $x0 $x1) (Member $x1 tropical))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000501

;; ---- slot landscape.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 landscape)    ;; n 1 docs 1  e.g. tierB-000501

;; ---- slot large.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 large)    ;; n 1 docs 1  e.g. tierB-000228

;; ---- slot latin_alphabet.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 latin_alphabet)    ;; n 1 docs 1  e.g. tierB-001605

;; ---- slot law_of_reciprocity.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 law_of_reciprocity)    ;; n 1 docs 1  e.g. tierB-000281

;; ---- slot lawyer.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 lawyer)    ;; n 1 docs 1  e.g. tierB-000492

;; ---- slot lax.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 lax)    ;; n 1 docs 1  e.g. tierC-000158

;; ---- slot lay.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 lay)    ;; n 1 docs 1  e.g. tierB-001624

;; ---- slot lay_waste_to.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 lay_waste_to)    ;; n 1 docs 1  e.g. tierB-001695

;; ---- slot layer.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 layer) (LocatedIn $x0 $x1) (Member $x1 top))    ;; n 1 docs 1  e.g. tierB-000208

;; ---- slot lead_to.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 lead_to)    ;; n 1 docs 1  e.g. tierB-001669

;; ---- slot leader.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 leader) (Possession $x0 $x1) (Member $x1 pack))    ;; n 1 docs 1  e.g. tierB-001063

;; ---- slot leak.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 leak) (LocatedIn $x0 $x1) (Member $x1 roof))    ;; n 1 docs 1  e.g. tierB-001110

;; ---- slot leak.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 leak)    ;; n 1 docs 1  e.g. tierB-001110

;; ---- slot leak.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 leak)    ;; n 1 docs 1  e.g. tierB-000888

;; ---- slot leave_a_lot_to_be_desired.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 leave_a_lot_to_be_desired)    ;; n 1 docs 1  e.g. tierB-000306

;; ---- slot leave_behind.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 leave_behind)    ;; n 1 docs 1  e.g. tierB-000133

;; ---- slot legal.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 legal) (GroupOf $x0 activity))    ;; n 1 docs 1  e.g. tierC-000040

;; ---- slot legal.Inheritance  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 legal) (Inheritance $x0 legal))    ;; n 1 docs 1  e.g. tierC-000040

;; ---- slot legal.SubsetOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 legal) (SubsetOf $x0 $x1) (Member $x1 activity))    ;; n 1 docs 1  e.g. tierC-000040

;; ---- slot legalize.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 legalize)    ;; n 1 docs 1  e.g. tierB-000840

;; ---- slot legislation.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 legislation)    ;; n 1 docs 1  e.g. tierB-000673

;; ---- slot let_go.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 let_go)    ;; n 1 docs 1  e.g. tierB-000091

;; ---- slot letter.From  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 letter) (From $x0 canada))    ;; n 1 docs 1  e.g. tierB-001859

;; ---- slot letter.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 letter)    ;; n 1 docs 1  e.g. tierB-001859

;; ---- slot library.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 library)    ;; n 1 docs 1  e.g. tierB-000931

;; ---- slot lick.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 lick)    ;; n 1 docs 1  e.g. tierB-001586

;; ---- slot lid.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 lid)    ;; n 1 docs 1  e.g. tierB-000135

;; ---- slot life.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 life)    ;; n 1 docs 1  e.g. tierB-000729

;; ---- slot life.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 life)    ;; n 1 docs 1  e.g. tierB-000284

;; ---- slot life_experience.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 life_experience)    ;; n 1 docs 1  e.g. tierB-001909

;; ---- slot liftoff.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 liftoff)    ;; n 1 docs 1  e.g. tierB-000107

;; ---- slot light.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 light) (PartOf $x0 $x1) (Member $x1 song))    ;; n 1 docs 1  e.g. tierB-001556

;; ---- slot lightning_bolt.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 lightning_bolt)    ;; n 1 docs 1  e.g. tierB-000653

;; ---- slot limited_edition.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 limited_edition)    ;; n 1 docs 1  e.g. tierB-000170

;; ---- slot limp.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 limp)    ;; n 1 docs 1  e.g. tierB-000596

;; ---- slot line.From  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 line) (From $x0 $x1) (Member $x1 bottom))    ;; n 1 docs 1  e.g. tierB-000172

;; ---- slot line.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 line) (GroupOf $x0 freight_car))    ;; n 1 docs 1  e.g. tierB-001120

;; ---- slot line.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 line)    ;; n 1 docs 1  e.g. tierB-001684

;; ---- slot linger.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 linger)    ;; n 1 docs 1  e.g. tierB-001531

;; ---- slot lion_attack.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 lion_attack)    ;; n 1 docs 1  e.g. tierB-000725

;; ---- slot liquor_store.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 liquor_store)    ;; n 1 docs 1  e.g. tierB-001801

;; ---- slot list.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 list)    ;; n 1 docs 1  e.g. tierB-001918

;; ---- slot list.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 list)    ;; n 1 docs 1  e.g. tierB-000750

;; ---- slot listen.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 listen)    ;; n 1 docs 1  e.g. tierB-000137

;; ---- slot lithium_ion.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 lithium_ion)    ;; n 1 docs 1  e.g. tierB-000701

;; ---- slot live.As  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 live) (As $x0 rabbit))    ;; n 1 docs 1  e.g. tierB-000405

;; ---- slot live.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 live)    ;; n 1 docs 1  e.g. tierB-000405

;; ---- slot living_room.NextTo  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 living_room) (NextTo $x0 $x1) (Member $x1 dining_room))    ;; n 1 docs 1  e.g. tierB-001670

;; ---- slot lobby.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 lobby)    ;; n 1 docs 1  e.g. tierB-001133

;; ---- slot lock.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 lock)    ;; n 1 docs 1  e.g. tierB-001326

;; ---- slot locked.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 locked)    ;; n 1 docs 1  e.g. tierB-000880

;; ---- slot locker_room.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 locker_room)    ;; n 1 docs 1  e.g. tierB-001517

;; ---- slot locomotive.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 locomotive)    ;; n 1 docs 1  e.g. tierB-001120

;; ---- slot look_into.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 look_into)    ;; n 1 docs 1  e.g. tierB-000574

;; ---- slot look_up.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 look_up)    ;; n 1 docs 1  e.g. tierB-000539

;; ---- slot loudspeaker.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 loudspeaker)    ;; n 1 docs 1  e.g. tierB-000193

;; ---- slot low.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 low) (LocatedIn $x0 $x1) (Member $x1 city))    ;; n 1 docs 1  e.g. tierC-000070

;; ---- slot magpie.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 magpie)    ;; n 1 docs 1  e.g. tierB-000852

;; ---- slot main_meal.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 main_meal)    ;; n 1 docs 1  e.g. tierB-001519

;; ---- slot main_meal.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 main_meal) (Possession $x0 $x1) (Member $x1 day))    ;; n 1 docs 1  e.g. tierB-001519

;; ---- slot mainstream_media.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mainstream_media)    ;; n 1 docs 1  e.g. tierC-000178

;; ---- slot make.But  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 make) (But $e0 $x1))    ;; n 1 docs 1  e.g. tierB-000964

;; ---- slot make_up.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 make_up)    ;; n 1 docs 1  e.g. tierB-000360

;; ---- slot man.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 man) (LocatedIn $x0 $x1) (Member $x1 changing_room))    ;; n 1 docs 1  e.g. tierB-001593

;; ---- slot manager.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 manager)    ;; n 1 docs 1  e.g. tierB-001512

;; ---- slot manager.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 manager) (Possession $x0 $x1) (Member $x1 store))    ;; n 1 docs 1  e.g. tierB-001512

;; ---- slot map.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 map) (LocatedIn $x0 $x1) (Member $x1 wall))    ;; n 1 docs 1  e.g. tierB-000837

;; ---- slot map.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 map)    ;; n 1 docs 1  e.g. tierB-000837

;; ---- slot marathon.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 marathon)    ;; n 1 docs 1  e.g. tierB-001033

;; ---- slot march.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 march)    ;; n 1 docs 1  e.g. tierB-001357

;; ---- slot market.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 market)    ;; n 1 docs 1  e.g. tierB-001018

;; ---- slot marry.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 marry)    ;; n 1 docs 1  e.g. tierB-001673

;; ---- slot mask.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mask)    ;; n 1 docs 1  e.g. tierB-001801

;; ---- slot mass.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 mass) (GroupOf $x0 man))    ;; n 1 docs 1  e.g. tierB-000243

;; ---- slot mass.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mass)    ;; n 1 docs 1  e.g. tierB-000243

;; ---- slot master.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 master)    ;; n 1 docs 1  e.g. tierB-001980

;; ---- slot mat.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mat)    ;; n 1 docs 1  e.g. tierB-001753

;; ---- slot match.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 match)    ;; n 1 docs 1  e.g. tierB-001083

;; ---- slot materialize.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 materialize)    ;; n 1 docs 1  e.g. tierB-001366

;; ---- slot mature.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 mature)    ;; n 1 docs 1  e.g. tierB-001434

;; ---- slot meat.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 meat)    ;; n 1 docs 1  e.g. tierB-000921

;; ---- slot medication.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 medication)    ;; n 1 docs 1  e.g. tierB-001102

;; ---- slot meditate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 meditate)    ;; n 1 docs 1  e.g. tierB-001377

;; ---- slot meeting.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 meeting)    ;; n 1 docs 1  e.g. tierB-000378

;; ---- slot mela.Also  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 mela) (Also $x0 $e1) (Member $e1 celebrate))    ;; n 1 docs 1  e.g. tierC-000133

;; ---- slot melt.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 melt)    ;; n 1 docs 1  e.g. tierB-001451

;; ---- slot melt_away.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 melt_away)    ;; n 1 docs 1  e.g. tierB-000154

;; ---- slot menacing.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 menacing) (GroupOf $x0 crash))    ;; n 1 docs 1  e.g. tierB-001228

;; ---- slot menacing.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 menacing)    ;; n 1 docs 1  e.g. tierB-001228

;; ---- slot mental_world.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mental_world)    ;; n 1 docs 1  e.g. tierC-000233

;; ---- slot mention.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 mention)    ;; n 1 docs 1  e.g. tierB-000483

;; ---- slot merchant_ship.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 merchant_ship)    ;; n 1 docs 1  e.g. tierB-001990

;; ---- slot merge.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 merge)    ;; n 1 docs 1  e.g. tierC-000104

;; ---- slot metaphor.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 metaphor)    ;; n 1 docs 1  e.g. tierB-001884

;; ---- slot meteorite.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 meteorite)    ;; n 1 docs 1  e.g. tierB-000585

;; ---- slot metropolis.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 metropolis)    ;; n 1 docs 1  e.g. tierB-001359

;; ---- slot mile.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mile)    ;; n 1 docs 1  e.g. tierB-000508

;; ---- slot milestone.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 milestone)    ;; n 1 docs 1  e.g. tierB-000649

;; ---- slot mill.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mill)    ;; n 1 docs 1  e.g. tierB-001271

;; ---- slot mind.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mind)    ;; n 1 docs 1  e.g. tierC-000011

;; ---- slot mind.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 mind) (PartOf $x0 cameron))    ;; n 1 docs 1  e.g. tierC-000011

;; ---- slot miracle.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 miracle)    ;; n 1 docs 1  e.g. tierB-000264

;; ---- slot miss.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 miss)    ;; n 1 docs 1  e.g. tierB-000508

;; ---- slot missing.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 missing) (Before $e0 $e1) (Member $e1 return))    ;; n 1 docs 1  e.g. tierB-000688

;; ---- slot missing.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 missing)    ;; n 1 docs 1  e.g. tierB-000688

;; ---- slot misunderstand.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 misunderstand)    ;; n 1 docs 1  e.g. tierB-000865

;; ---- slot mix.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 mix)    ;; n 1 docs 1  e.g. tierC-000103

;; ---- slot mobile_phone.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mobile_phone)    ;; n 1 docs 1  e.g. tierB-001341

;; ---- slot model.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 model)    ;; n 1 docs 1  e.g. tierB-001421

;; ---- slot modest.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 modest)    ;; n 1 docs 1  e.g. tierB-001667

;; ---- slot moist.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 moist) (GroupOf $x0 habitat))    ;; n 1 docs 1  e.g. tierC-000340

;; ---- slot moist.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 moist) (Possession $x0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierC-000340

;; ---- slot mole.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mole)    ;; n 1 docs 1  e.g. tierB-001308

;; ---- slot mom.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mom)    ;; n 1 docs 1  e.g. tierB-000575

;; ---- slot monster.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 monster)    ;; n 1 docs 1  e.g. tierB-001798

;; ---- slot moon.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 moon)    ;; n 1 docs 1  e.g. tierB-000889

;; ---- slot morgue.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 morgue)    ;; n 1 docs 1  e.g. tierB-001352

;; ---- slot morning.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 morning) (PartOf $x0 $x1) (Member $x1 morning))    ;; n 1 docs 1  e.g. tierB-000229

;; ---- slot morning.RestOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 morning) (RestOf $x0 $x1) (Member $x1 morning))    ;; n 1 docs 1  e.g. tierB-000229

;; ---- slot mother.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mother)    ;; n 1 docs 1  e.g. tierB-000720

;; ---- slot mother_bird.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mother_bird)    ;; n 1 docs 1  e.g. tierB-000217

;; ---- slot motive.For  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 motive) (For $x0 $x1) (Member $x1 attack))    ;; n 1 docs 1  e.g. tierB-001212

;; ---- slot motorway.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 motorway)    ;; n 1 docs 1  e.g. tierB-001267

;; ---- slot mount.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 mount)    ;; n 1 docs 1  e.g. tierB-000981

;; ---- slot mouth.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 mouth)    ;; n 1 docs 1  e.g. tierB-000802

;; ---- slot movie.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 movie) (LocatedIn $x0 space))    ;; n 1 docs 1  e.g. tierB-001965

;; ---- slot msm_model.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 msm_model)    ;; n 1 docs 1  e.g. tierC-000267

;; ---- slot mull_over.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 mull_over)    ;; n 1 docs 1  e.g. tierB-000162

;; ---- slot municipality.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 municipality)    ;; n 1 docs 1  e.g. tierB-001239

;; ---- slot muslim_community.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 muslim_community)    ;; n 1 docs 1  e.g. tierB-001972

;; ---- slot muslim_house.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 muslim_house)    ;; n 1 docs 1  e.g. tierC-000096

;; ---- slot muslim_house.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 muslim_house) (Possession $x0 arakkal))    ;; n 1 docs 1  e.g. tierC-000096

;; ---- slot muzzle.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 muzzle)    ;; n 1 docs 1  e.g. tierB-000349

;; ---- slot name.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 name) (Possession $x0 french_dahomey))    ;; n 1 docs 1  e.g. tierB-000139

;; ---- slot nation.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 nation)    ;; n 1 docs 1  e.g. tierB-001330

;; ---- slot national_fibre_optic_network_project.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 national_fibre_optic_network_project)    ;; n 1 docs 1  e.g. tierB-000192

;; ---- slot natural.For  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 natural) (For $x0 $x1) (Member $x1 condition))    ;; n 1 docs 1  e.g. tierB-000599

;; ---- slot necessary.Cardinality  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 necessary) (Cardinality $x0 <num>))    ;; n 1 docs 1  e.g. tierB-000892

;; ---- slot necessary.For  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 necessary) (For $x0 $x1) (Member $x1 recipe))    ;; n 1 docs 1  e.g. tierB-000892

;; ---- slot necessary.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 necessary) (GroupOf $x0 onion))    ;; n 1 docs 1  e.g. tierB-000892

;; ---- slot necessary.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 necessary)    ;; n 1 docs 1  e.g. tierB-000892

;; ---- slot necklace.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 necklace)    ;; n 1 docs 1  e.g. tierB-000453

;; ---- slot nectar.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 nectar)    ;; n 1 docs 1  e.g. tierB-000734

;; ---- slot nectar.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 nectar) (Possession $x0 plant))    ;; n 1 docs 1  e.g. tierB-000734

;; ---- slot need.For  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 need) (For $x0 water))    ;; n 1 docs 1  e.g. tierB-001578

;; ---- slot negotiation.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 negotiation)    ;; n 1 docs 1  e.g. tierB-001474

;; ---- slot neighbouring.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 neighbouring) (GroupOf $x0 community))    ;; n 1 docs 1  e.g. tierC-000117

;; ---- slot nest.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 nest)    ;; n 1 docs 1  e.g. tierB-000633

;; ---- slot nether_millstone.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 nether_millstone)    ;; n 1 docs 1  e.g. tierB-000627

;; ---- slot network.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 network) (GroupOf $x0 well))    ;; n 1 docs 1  e.g. tierB-000063

;; ---- slot network.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 network)    ;; n 1 docs 1  e.g. tierB-000063

;; ---- slot new.But  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 new) (But $e0 $e1) (Member $e1 old))    ;; n 1 docs 1  e.g. tierB-001337

;; ---- slot new.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 new)    ;; n 1 docs 1  e.g. tierB-001337

;; ---- slot news.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 news)    ;; n 1 docs 1  e.g. tierB-001875

;; ---- slot nice.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 nice)    ;; n 1 docs 1  e.g. tierB-000960

;; ---- slot night.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 night)    ;; n 1 docs 1  e.g. tierB-001048

;; ---- slot night_shift.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 night_shift)    ;; n 1 docs 1  e.g. tierB-000844

;; ---- slot nomination.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 nomination)    ;; n 1 docs 1  e.g. tierB-000552

;; ---- slot northern_hemisphere.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 northern_hemisphere)    ;; n 1 docs 1  e.g. tierB-000980

;; ---- slot nose.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 nose)    ;; n 1 docs 1  e.g. tierB-000802

;; ---- slot novelist.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 novelist)    ;; n 1 docs 1  e.g. tierB-001666

;; ---- slot nurse.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 nurse)    ;; n 1 docs 1  e.g. tierB-000028

;; ---- slot objective.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 objective)    ;; n 1 docs 1  e.g. tierB-001974

;; ---- slot oblige.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 oblige)    ;; n 1 docs 1  e.g. tierC-000042

;; ---- slot observe.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 observe)    ;; n 1 docs 1  e.g. tierB-001911

;; ---- slot office.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 office)    ;; n 1 docs 1  e.g. tierB-001619

;; ---- slot oil_filter.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 oil_filter)    ;; n 1 docs 1  e.g. tierB-000888

;; ---- slot old.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 old)    ;; n 1 docs 1  e.g. tierB-001337

;; ---- slot on.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 on) (GroupOf $x0 light))    ;; n 1 docs 1  e.g. tierB-000004

;; ---- slot onion.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 onion)    ;; n 1 docs 1  e.g. tierB-001837

;; ---- slot ooze.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 ooze)    ;; n 1 docs 1  e.g. tierB-001287

;; ---- slot opposition.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 opposition)    ;; n 1 docs 1  e.g. tierB-001885

;; ---- slot option.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 option)    ;; n 1 docs 1  e.g. tierB-000158

;; ---- slot order.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 order)    ;; n 1 docs 1  e.g. tierB-001952

;; ---- slot organisation.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 organisation)    ;; n 1 docs 1  e.g. tierB-000769

;; ---- slot origin.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 origin)    ;; n 1 docs 1  e.g. tierB-001774

;; ---- slot origin.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 origin) (Possession $x0 sudanese_food))    ;; n 1 docs 1  e.g. tierB-001774

;; ---- slot original.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 original) (PartOf $x0 playstation))    ;; n 1 docs 1  e.g. tierB-000992

;; ---- slot originate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 originate)    ;; n 1 docs 1  e.g. tierB-001272

;; ---- slot other.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 other) (PartOf $x0 $x1) (Member $x1 street))    ;; n 1 docs 1  e.g. tierB-000202

;; ---- slot out_of_stock.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 out_of_stock)    ;; n 1 docs 1  e.g. tierB-001045

;; ---- slot out_of_the_question.Also  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 out_of_the_question) (Also $x0 $e1) (Member $e1 out_of_the_question))    ;; n 1 docs 1  e.g. tierB-000842

;; ---- slot out_of_the_question.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 out_of_the_question)    ;; n 1 docs 1  e.g. tierB-000842

;; ---- slot outperform.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 outperform)    ;; n 1 docs 1  e.g. tierC-000193

;; ---- slot outside.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 outside)    ;; n 1 docs 1  e.g. tierB-001091

;; ---- slot oven.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 oven)    ;; n 1 docs 1  e.g. tierB-000403

;; ---- slot ovenware.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ovenware)    ;; n 1 docs 1  e.g. tierB-001372

;; ---- slot pace.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 pace)    ;; n 1 docs 1  e.g. tierB-001072

;; ---- slot packed.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 packed)    ;; n 1 docs 1  e.g. tierB-000917

;; ---- slot painting.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 painting)    ;; n 1 docs 1  e.g. tierB-001542

;; ---- slot pancreas.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 pancreas)    ;; n 1 docs 1  e.g. tierB-001358

;; ---- slot paper.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 paper)    ;; n 1 docs 1  e.g. tierB-001822

;; ---- slot paradise.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 paradise)    ;; n 1 docs 1  e.g. tierB-001135

;; ---- slot paragraph.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 paragraph)    ;; n 1 docs 1  e.g. tierB-001104

;; ---- slot parallel.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 parallel)    ;; n 1 docs 1  e.g. tierB-001906

;; ---- slot parallel.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 parallel) (To $e0 $x1) (Member $x1 shore))    ;; n 1 docs 1  e.g. tierB-001906

;; ---- slot parcel.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 parcel)    ;; n 1 docs 1  e.g. tierB-001827

;; ---- slot paris_train.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 paris_train)    ;; n 1 docs 1  e.g. tierB-001992

;; ---- slot park.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 park) (LocatedIn $x0 issaquah_creek))    ;; n 1 docs 1  e.g. tierC-000063

;; ---- slot park.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 park)    ;; n 1 docs 1  e.g. tierB-000197

;; ---- slot parking.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 parking)    ;; n 1 docs 1  e.g. tierB-000945

;; ---- slot parking_lot.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 parking_lot)    ;; n 1 docs 1  e.g. tierB-000713

;; ---- slot part.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 part)    ;; n 1 docs 1  e.g. tierB-001825

;; ---- slot part.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 part) (PartOf $x0 $x1) (Member $x1 bush))    ;; n 1 docs 1  e.g. tierB-001825

;; ---- slot particle_accelerator.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 particle_accelerator)    ;; n 1 docs 1  e.g. tierB-000863

;; ---- slot pass_by.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 pass_by)    ;; n 1 docs 1  e.g. tierB-000094

;; ---- slot pastry.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 pastry) (PartOf $x0 $x1) (Member $x1 pastry))    ;; n 1 docs 1  e.g. tierB-001745

;; ---- slot pastry.RestOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 pastry) (RestOf $x0 $x1) (Member $x1 pastry))    ;; n 1 docs 1  e.g. tierB-001745

;; ---- slot pay.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 pay)    ;; n 1 docs 1  e.g. tierB-001603

;; ---- slot pay_off.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 pay_off)    ;; n 1 docs 1  e.g. tierB-001200

;; ---- slot peek.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 peek)    ;; n 1 docs 1  e.g. tierB-000693

;; ---- slot peel.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 peel)    ;; n 1 docs 1  e.g. tierB-000942

;; ---- slot pen.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 pen)    ;; n 1 docs 1  e.g. tierB-001078

;; ---- slot penetrate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 penetrate)    ;; n 1 docs 1  e.g. tierB-000561

;; ---- slot performance.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 performance)    ;; n 1 docs 1  e.g. tierB-000875

;; ---- slot person.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 person) (Possession $x0 new_york_stock_exchange))    ;; n 1 docs 1  e.g. tierC-000053

;; ---- slot pharyngeal_part.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 pharyngeal_part)    ;; n 1 docs 1  e.g. tierB-000802

;; ---- slot pharyngeal_part.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 pharyngeal_part) (PartOf $x0 $x1) (Member $x1 throat))    ;; n 1 docs 1  e.g. tierB-000802

;; ---- slot phone_number.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 phone_number)    ;; n 1 docs 1  e.g. tierB-001979

;; ---- slot photography_walk.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 photography_walk)    ;; n 1 docs 1  e.g. tierB-000791

;; ---- slot phrase.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 phrase)    ;; n 1 docs 1  e.g. tierB-000866

;; ---- slot pilot.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 pilot)    ;; n 1 docs 1  e.g. tierB-000950

;; ---- slot pitch.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 pitch) (Possession $x0 chang_yong_lim))    ;; n 1 docs 1  e.g. tierB-001854

;; ---- slot pizza.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 pizza)    ;; n 1 docs 1  e.g. tierB-001032

;; ---- slot pizza_dough.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 pizza_dough)    ;; n 1 docs 1  e.g. tierB-000942

;; ---- slot place.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 place)    ;; n 1 docs 1  e.g. tierB-001952

;; ---- slot plan.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 plan)    ;; n 1 docs 1  e.g. tierB-000037

;; ---- slot planet.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 planet)    ;; n 1 docs 1  e.g. tierB-000906

;; ---- slot plant.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 plant)    ;; n 1 docs 1  e.g. tierB-000714

;; ---- slot plaster.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 plaster)    ;; n 1 docs 1  e.g. tierB-001070

;; ---- slot plastic_cup.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 plastic_cup)    ;; n 1 docs 1  e.g. tierB-000269

;; ---- slot platform.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 platform)    ;; n 1 docs 1  e.g. tierB-000757

;; ---- slot playoff.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 playoff)    ;; n 1 docs 1  e.g. tierB-001375

;; ---- slot pleasant.In  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 pleasant) (In $x0 life))    ;; n 1 docs 1  e.g. tierB-001763

;; ---- slot plot.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 plot) (PartOf $x0 $x1) (Member $x1 book))    ;; n 1 docs 1  e.g. tierB-001964

;; ---- slot plummet.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 plummet)    ;; n 1 docs 1  e.g. tierB-000005

;; ---- slot point.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 point)    ;; n 1 docs 1  e.g. tierB-000882

;; ---- slot point_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 point_out)    ;; n 1 docs 1  e.g. tierB-001455

;; ---- slot poison.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 poison)    ;; n 1 docs 1  e.g. tierB-001037

;; ---- slot polish.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 polish)    ;; n 1 docs 1  e.g. tierB-000938

;; ---- slot pollute.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 pollute)    ;; n 1 docs 1  e.g. tierB-001151

;; ---- slot pool.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 pool)    ;; n 1 docs 1  e.g. tierB-001091

;; ---- slot pop.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 pop)    ;; n 1 docs 1  e.g. tierB-001023

;; ---- slot popular.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 popular)    ;; n 1 docs 1  e.g. tierB-000066

;; ---- slot population_density.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 population_density) (LocatedIn $x0 $x1) (Member $x1 metropolis))    ;; n 1 docs 1  e.g. tierB-001359

;; ---- slot population_density.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 population_density)    ;; n 1 docs 1  e.g. tierB-001359

;; ---- slot portrait.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 portrait)    ;; n 1 docs 1  e.g. tierB-001540

;; ---- slot portrayal.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 portrayal)    ;; n 1 docs 1  e.g. tierC-000302

;; ---- slot pose.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 pose)    ;; n 1 docs 1  e.g. tierB-001661

;; ---- slot possess.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 possess)    ;; n 1 docs 1  e.g. tierB-000510

;; ---- slot post.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 post)    ;; n 1 docs 1  e.g. tierC-000069

;; ---- slot postman.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 postman)    ;; n 1 docs 1  e.g. tierB-000598

;; ---- slot postpone.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 postpone)    ;; n 1 docs 1  e.g. tierB-001381

;; ---- slot potassium_salt.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 potassium_salt)    ;; n 1 docs 1  e.g. tierC-000163

;; ---- slot potential_partner.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 potential_partner)    ;; n 1 docs 1  e.g. tierC-000018

;; ---- slot power_station.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 power_station)    ;; n 1 docs 1  e.g. tierB-001260

;; ---- slot power_station.Only  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 power_station) (Only $x0 $e1) (Member $e1 provide))    ;; n 1 docs 1  e.g. tierB-001260

;; ---- slot powerful.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 powerful)    ;; n 1 docs 1  e.g. tierB-000206

;; ---- slot practice.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 practice)    ;; n 1 docs 1  e.g. tierB-001720

;; ---- slot pray.End  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 pray) (End $e0 dawn))    ;; n 1 docs 1  e.g. tierC-000283

;; ---- slot pray.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 pray)    ;; n 1 docs 1  e.g. tierC-000283

;; ---- slot prefer.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 prefer)    ;; n 1 docs 1  e.g. tierB-000734

;; ---- slot prefer.To  [event center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $e0 prefer) (To $e0 $x1) (Member $x1 appetizing))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000734
(And (Member $e0 prefer) (To $e0 $x1) (Member $x1 bug))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000734

;; ---- slot prepare.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 prepare)    ;; n 1 docs 1  e.g. tierB-000274

;; ---- slot presented_in_scale.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 presented_in_scale)    ;; n 1 docs 1  e.g. tierC-000213

;; ---- slot president.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 president) (Possession $x0 nyse_group))    ;; n 1 docs 1  e.g. tierC-000054

;; ---- slot presumption.Against  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 presumption) (Against $x0 $x1) (Member $x1 truth))    ;; n 1 docs 1  e.g. tierB-001223

;; ---- slot pretty.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 pretty) (GroupOf $x0 flower))    ;; n 1 docs 1  e.g. tierB-000615

;; ---- slot pretty.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 pretty) (LocatedIn $x0 $x1) (Member $x1 garden))    ;; n 1 docs 1  e.g. tierB-000615

;; ---- slot pretty.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 pretty)    ;; n 1 docs 1  e.g. tierB-000615

;; ---- slot price.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 price)    ;; n 1 docs 1  e.g. tierB-000930

;; ---- slot priest.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 priest)    ;; n 1 docs 1  e.g. tierB-001626

;; ---- slot prison_kitchen.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 prison_kitchen)    ;; n 1 docs 1  e.g. tierB-000867

;; ---- slot proclaim.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 proclaim)    ;; n 1 docs 1  e.g. tierB-001533

;; ---- slot produce.During  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 produce) (During $e0 $e1) (Member $e1 digest))    ;; n 1 docs 1  e.g. tierB-001995

;; ---- slot professional.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 professional) (GroupOf $x0 group))    ;; n 1 docs 1  e.g. tierC-000330

;; ---- slot professional.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 professional)    ;; n 1 docs 1  e.g. tierC-000330

;; ---- slot professor.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 professor)    ;; n 1 docs 1  e.g. tierB-000705

;; ---- slot program.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 program)    ;; n 1 docs 1  e.g. tierB-000109

;; ---- slot program.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 program)    ;; n 1 docs 1  e.g. tierB-000109

;; ---- slot project.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 project)    ;; n 1 docs 1  e.g. tierB-001532

;; ---- slot promise.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 promise)    ;; n 1 docs 1  e.g. tierB-000663

;; ---- slot proposition.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 proposition)    ;; n 1 docs 1  e.g. tierB-000744

;; ---- slot protect.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 protect)    ;; n 1 docs 1  e.g. tierB-001396

;; ---- slot prove.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 prove)    ;; n 1 docs 1  e.g. tierB-000786

;; ---- slot prove.Result  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 prove) (Result $e0 $e1) (Member $e1 effective))    ;; n 1 docs 1  e.g. tierB-000786

;; ---- slot provincial_capital.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 provincial_capital)    ;; n 1 docs 1  e.g. tierC-000347

;; ---- slot provincial_capital.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 provincial_capital) (PartOf $x0 manila))    ;; n 1 docs 1  e.g. tierC-000347

;; ---- slot pull_over.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 pull_over)    ;; n 1 docs 1  e.g. tierB-001526

;; ---- slot pulse.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 pulse)    ;; n 1 docs 1  e.g. tierB-000193

;; ---- slot punishment.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 punishment)    ;; n 1 docs 1  e.g. tierB-000877

;; ---- slot purchase.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 purchase)    ;; n 1 docs 1  e.g. tierB-001623

;; ---- slot purchase.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 purchase)    ;; n 1 docs 1  e.g. tierB-000015

;; ---- slot purpose.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 purpose)    ;; n 1 docs 1  e.g. tierB-001740

;; ---- slot purpose.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 purpose) (Possession $x0 sex))    ;; n 1 docs 1  e.g. tierB-000376

;; ---- slot purpose.Possession  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 purpose) (Possession $e0 greek_drama))    ;; n 1 docs 1  e.g. tierB-001740

;; ---- slot push_around.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 push_around)    ;; n 1 docs 1  e.g. tierB-001961

;; ---- slot put.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 put)    ;; n 1 docs 1  e.g. tierB-001037

;; ---- slot put_a_stop_to.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 put_a_stop_to)    ;; n 1 docs 1  e.g. tierB-000389

;; ---- slot put_down.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 put_down)    ;; n 1 docs 1  e.g. tierB-000323

;; ---- slot put_off.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 put_off)    ;; n 1 docs 1  e.g. tierB-000259

;; ---- slot put_together.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 put_together)    ;; n 1 docs 1  e.g. tierB-000759

;; ---- slot put_together.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 put_together) (To $e0 $e1) (Member $e1 mean))    ;; n 1 docs 1  e.g. tierB-000759

;; ---- slot put_up.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 put_up)    ;; n 1 docs 1  e.g. tierB-000762

;; ---- slot pyrite.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 pyrite)    ;; n 1 docs 1  e.g. tierC-000266

;; ---- slot pyrite.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 pyrite) (PartOf $x0 $x1) (Member $x1 rock))    ;; n 1 docs 1  e.g. tierC-000266

;; ---- slot pyrite_content.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 pyrite_content)    ;; n 1 docs 1  e.g. tierC-000265

;; ---- slot pyrite_content.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 pyrite_content) (Possession $x0 $x1) (Member $x1 rock))    ;; n 1 docs 1  e.g. tierC-000265

;; ---- slot quagmire.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 quagmire)    ;; n 1 docs 1  e.g. tierB-001579

;; ---- slot question.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 question)    ;; n 1 docs 1  e.g. tierB-001621

;; ---- slot rabbit.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 rabbit)    ;; n 1 docs 1  e.g. tierB-001551

;; ---- slot railroad.Parallel  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 railroad) (Parallel $x0 $x1) (Member $x1 road))    ;; n 1 docs 1  e.g. tierB-000582

;; ---- slot railway_crossing.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 railway_crossing)    ;; n 1 docs 1  e.g. tierB-001027

;; ---- slot rain.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rain)    ;; n 1 docs 1  e.g. tierB-000593

;; ---- slot rainwater.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 rainwater)    ;; n 1 docs 1  e.g. tierB-000251

;; ---- slot raise_the_dead.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 raise_the_dead)    ;; n 1 docs 1  e.g. tierB-000156

;; ---- slot random.Cardinality  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 random) (Cardinality $x0 <num>))    ;; n 1 docs 1  e.g. tierC-000261

;; ---- slot random.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 random) (GroupOf $x0 way))    ;; n 1 docs 1  e.g. tierC-000261

;; ---- slot random.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 random)    ;; n 1 docs 1  e.g. tierC-000261

;; ---- slot rat.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 rat)    ;; n 1 docs 1  e.g. tierB-001900

;; ---- slot rate.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 rate)    ;; n 1 docs 1  e.g. tierB-000710

;; ---- slot rate.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 rate) (Possession $x0 $e1) (Member $e1 colonization))    ;; n 1 docs 1  e.g. tierB-000710

;; ---- slot reason.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 reason)    ;; n 1 docs 1  e.g. tierB-000114

;; ---- slot rebel.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rebel)    ;; n 1 docs 1  e.g. tierB-000248

;; ---- slot recall.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 recall)    ;; n 1 docs 1  e.g. tierB-000853

;; ---- slot receive.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 receive) (To $e0 $e1) (Member $e1 reside))    ;; n 1 docs 1  e.g. tierB-001035

;; ---- slot reclassify.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 reclassify)    ;; n 1 docs 1  e.g. tierB-001866

;; ---- slot reclassify.Result  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 reclassify) (Result $e0 $e1) (Member $e1 dwarf_planet))    ;; n 1 docs 1  e.g. tierB-001866

;; ---- slot recognize.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 recognize)    ;; n 1 docs 1  e.g. tierB-001864

;; ---- slot rectify.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rectify)    ;; n 1 docs 1  e.g. tierB-001912

;; ---- slot red.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 red) (GroupOf $x0 leaf))    ;; n 1 docs 1  e.g. tierB-000832

;; ---- slot redeem.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 redeem)    ;; n 1 docs 1  e.g. tierB-000252

;; ---- slot refer.As  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 refer) (As $x0 pedotransfer_function))    ;; n 1 docs 1  e.g. tierC-000206

;; ---- slot refer.In  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 refer) (In $x0 $x1) (Member $x1 context))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000206
(And (Member $x0 refer) (In $x0 $x1) (Member $x1 non_spatial))    ;; n 1 (mass 0.5) docs 1  e.g. tierC-000206

;; ---- slot refer.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 refer)    ;; n 1 docs 1  e.g. tierC-000206

;; ---- slot refer.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 refer)    ;; n 1 docs 1  e.g. tierC-000205

;; ---- slot refer.To  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 refer) (To $x0 $x1) (Member $x1 predictive_function))    ;; n 1 docs 1  e.g. tierC-000206

;; ---- slot refuse.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 refuse)    ;; n 1 docs 1  e.g. tierB-000910

;; ---- slot registration_period.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 registration_period)    ;; n 1 docs 1  e.g. tierB-001853

;; ---- slot relate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 relate)    ;; n 1 docs 1  e.g. tierC-000040

;; ---- slot relate.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 relate) (To $e0 prostitution))    ;; n 1 docs 1  e.g. tierC-000040

;; ---- slot relax.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 relax)    ;; n 1 docs 1  e.g. tierB-001767

;; ---- slot relief.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 relief)    ;; n 1 docs 1  e.g. tierB-000536

;; ---- slot remain.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 remain) (Before $e0 $e1) (Member $e1 move_back))    ;; n 1 docs 1  e.g. tierC-000121

;; ---- slot remove.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 remove)    ;; n 1 docs 1  e.g. tierB-000366

;; ---- slot rent.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rent)    ;; n 1 docs 1  e.g. tierB-000571

;; ---- slot repair.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 repair)    ;; n 1 docs 1  e.g. tierB-001134

;; ---- slot repetition.To  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 repetition) (To $x0 $e1) (Member $e1 learn))    ;; n 1 docs 1  e.g. tierB-000608

;; ---- slot representation.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 representation)    ;; n 1 docs 1  e.g. tierC-000271

;; ---- slot republic.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 republic)    ;; n 1 docs 1  e.g. tierB-001809

;; ---- slot reputation.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 reputation)    ;; n 1 docs 1  e.g. tierB-000492

;; ---- slot reputation.Of  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 reputation) (Of $x0 <term:Member>))    ;; n 1 docs 1  e.g. tierB-000492

;; ---- slot request.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 request)    ;; n 1 docs 1  e.g. tierB-000969

;; ---- slot require.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 require) (To $e0 $x1) (Member $x1 enter))    ;; n 1 docs 1  e.g. tierB-001566

;; ---- slot rescue.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rescue)    ;; n 1 docs 1  e.g. tierB-000196

;; ---- slot reside.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 reside)    ;; n 1 docs 1  e.g. tierB-001035

;; ---- slot resin.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 resin)    ;; n 1 docs 1  e.g. tierB-001161

;; ---- slot rest.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rest)    ;; n 1 docs 1  e.g. tierB-000963

;; ---- slot rest_area.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 rest_area)    ;; n 1 docs 1  e.g. tierB-000125

;; ---- slot restaurant.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 restaurant)    ;; n 1 docs 1  e.g. tierB-001509

;; ---- slot restrict.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 restrict)    ;; n 1 docs 1  e.g. tierB-000288

;; ---- slot result.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 result)    ;; n 1 docs 1  e.g. tierB-000744

;; ---- slot retail_chain.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 retail_chain)    ;; n 1 docs 1  e.g. tierB-000525

;; ---- slot revamp.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 revamp)    ;; n 1 docs 1  e.g. tierB-001966

;; ---- slot revamp.Result  [event center; head other]  n 1  docs<= 2  distinct 2  eventive 1
(And (Member $e0 revamp) (Result $e0 $e1) (Member $e1 modern))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001966
(And (Member $e0 revamp) (Result $e0 $e1) (Member $e1 street))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001966

;; ---- slot revolution.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 revolution)    ;; n 1 docs 1  e.g. tierB-001817

;; ---- slot rewrite.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rewrite)    ;; n 1 docs 1  e.g. tierB-001622

;; ---- slot rice_crop.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 rice_crop)    ;; n 1 docs 1  e.g. tierB-001387

;; ---- slot ricochet.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 ricochet)    ;; n 1 docs 1  e.g. tierB-000103

;; ---- slot ride.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 ride)    ;; n 1 docs 1  e.g. tierB-001543

;; ---- slot rider.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 rider)    ;; n 1 docs 1  e.g. tierB-000981

;; ---- slot right.To  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 right) (To $x0 self_determination))    ;; n 1 docs 1  e.g. tierB-000902

;; ---- slot ring.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 ring)    ;; n 1 docs 1  e.g. tierB-000002

;; ---- slot riot.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 riot)    ;; n 1 docs 1  e.g. tierB-000323

;; ---- slot rip.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rip)    ;; n 1 docs 1  e.g. tierB-001894

;; ---- slot road.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 road) (LocatedIn $x0 left))    ;; n 1 docs 1  e.g. tierB-000635

;; ---- slot road.Parallel  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 road) (Parallel $x0 $x1) (Member $x1 river))    ;; n 1 docs 1  e.g. tierB-000468

;; ---- slot roasted.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 roasted) (GroupOf $x0 bean))    ;; n 1 docs 1  e.g. tierB-000975

;; ---- slot roasted.LocatedIn  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 roasted) (LocatedIn $x0 $x1) (Member $x1 burlap_sack))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000975
(And (Member $x0 roasted) (LocatedIn $x0 $x1) (Member $x1 small))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000975

;; ---- slot roasted.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 roasted)    ;; n 1 docs 1  e.g. tierB-000975

;; ---- slot roasted.Possession  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 roasted) (Possession $x0 $x1) (Member $x1 coffee_brand))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000975
(And (Member $x0 roasted) (Possession $x0 $x1) (Member $x1 indie))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-000975

;; ---- slot rob.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rob)    ;; n 1 docs 1  e.g. tierB-001917

;; ---- slot robber.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 robber)    ;; n 1 docs 1  e.g. tierB-000213

;; ---- slot rock.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 rock)    ;; n 1 docs 1  e.g. tierB-000340

;; ---- slot rocket.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 rocket)    ;; n 1 docs 1  e.g. tierB-001789

;; ---- slot roll_over.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 roll_over)    ;; n 1 docs 1  e.g. tierB-001892

;; ---- slot roller.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 roller)    ;; n 1 docs 1  e.g. tierB-000942

;; ---- slot room.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 room) (Possession $x0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-000966

;; ---- slot rotten.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 rotten) (GroupOf $x0 apple))    ;; n 1 docs 1  e.g. tierB-000384

;; ---- slot rotten.Inheritance  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 rotten) (Inheritance $x0 rotten))    ;; n 1 docs 1  e.g. tierB-000384

;; ---- slot rotten.SubsetOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 rotten) (SubsetOf $x0 $x1) (Member $x1 apple))    ;; n 1 docs 1  e.g. tierB-000384

;; ---- slot rough.Because  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 rough) (Because $e0 $x1) (Member $x1 storm))    ;; n 1 docs 1  e.g. tierB-000134

;; ---- slot rough.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rough)    ;; n 1 docs 1  e.g. tierB-000134

;; ---- slot round.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 round)    ;; n 1 docs 1  e.g. tierB-001860

;; ---- slot royal_chapel.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 royal_chapel)    ;; n 1 docs 1  e.g. tierB-001696

;; ---- slot royal_family.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 royal_family)    ;; n 1 docs 1  e.g. tierB-001423

;; ---- slot rumor.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 rumor)    ;; n 1 docs 1  e.g. tierB-000644

;; ---- slot rumor.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rumor)    ;; n 1 docs 1  e.g. tierB-001547

;; ---- slot rumour.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 rumour)    ;; n 1 docs 1  e.g. tierB-000810

;; ---- slot run_around.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 run_around)    ;; n 1 docs 1  e.g. tierB-000001

;; ---- slot run_away.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 run_away)    ;; n 1 docs 1  e.g. tierB-000406

;; ---- slot rush.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 rush)    ;; n 1 docs 1  e.g. tierB-000588

;; ---- slot russian_market.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 russian_market) (LocatedIn $x0 $x1) (Member $x1 pakistani_block))    ;; n 1 docs 1  e.g. tierC-000321

;; ---- slot russian_market.Similar  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 russian_market) (Similar $x0 $x1) (Member $x1 russian_market))    ;; n 1 docs 1  e.g. tierC-000321

;; ---- slot russian_speech.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 russian_speech)    ;; n 1 docs 1  e.g. tierB-000777

;; ---- slot sacrifice.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sacrifice)    ;; n 1 docs 1  e.g. tierB-001761

;; ---- slot sad.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sad)    ;; n 1 docs 1  e.g. tierB-000542

;; ---- slot sail.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sail)    ;; n 1 docs 1  e.g. tierB-000618

;; ---- slot sale.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sale)    ;; n 1 docs 1  e.g. tierB-000288

;; ---- slot salesman.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 salesman)    ;; n 1 docs 1  e.g. tierB-001996

;; ---- slot salmon.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 salmon)    ;; n 1 docs 1  e.g. tierB-001692

;; ---- slot save.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 save)    ;; n 1 docs 1  e.g. tierB-001285

;; ---- slot scaffolding.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 scaffolding)    ;; n 1 docs 1  e.g. tierB-001306

;; ---- slot scandal.Before  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 scandal) (Before $x0 $e1) (Member $e1 try))    ;; n 1 docs 1  e.g. tierB-001130

;; ---- slot scandal.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 scandal)    ;; n 1 docs 1  e.g. tierB-001130

;; ---- slot scanty.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 scanty)    ;; n 1 docs 1  e.g. tierB-001387

;; ---- slot scare.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 scare)    ;; n 1 docs 1  e.g. tierB-000634

;; ---- slot scarecrow.About  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 scarecrow) (About $x0 world_war))    ;; n 1 docs 1  e.g. tierB-001630

;; ---- slot scene.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 scene)    ;; n 1 docs 1  e.g. tierB-001132

;; ---- slot scenery.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 scenery)    ;; n 1 docs 1  e.g. tierB-001503

;; ---- slot schedule.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 schedule)    ;; n 1 docs 1  e.g. tierB-001389

;; ---- slot schedule.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 schedule)    ;; n 1 docs 1  e.g. tierB-000903

;; ---- slot school_janitor.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 school_janitor)    ;; n 1 docs 1  e.g. tierB-001219

;; ---- slot scorch.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 scorch)    ;; n 1 docs 1  e.g. tierB-001246

;; ---- slot screenplay.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 screenplay)    ;; n 1 docs 1  e.g. tierC-000090

;; ---- slot screw.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 screw)    ;; n 1 docs 1  e.g. tierB-000135

;; ---- slot script.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 script)    ;; n 1 docs 1  e.g. tierC-000089

;; ---- slot search.For  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 search) (For $x0 $x1) (Member $x1 medicine))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001589
(And (Member $x0 search) (For $x0 $x1) (Member $x1 new))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001589

;; ---- slot search.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 search)    ;; n 1 docs 1  e.g. tierB-001589

;; ---- slot search.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 search)    ;; n 1 docs 1  e.g. tierB-000441

;; ---- slot season.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 season)    ;; n 1 docs 1  e.g. tierC-000243

;; ---- slot second_year_class.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 second_year_class)    ;; n 1 docs 1  e.g. tierB-001171

;; ---- slot secret.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 secret)    ;; n 1 docs 1  e.g. tierB-001320

;; ---- slot seek.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 seek)    ;; n 1 docs 1  e.g. tierB-001953

;; ---- slot sentence.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 sentence)    ;; n 1 docs 1  e.g. tierB-000142

;; ---- slot sentence.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sentence)    ;; n 1 docs 1  e.g. tierB-000427

;; ---- slot serious.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 serious) (GroupOf $x0 consequence))    ;; n 1 docs 1  e.g. tierB-001797

;; ---- slot servant.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 servant)    ;; n 1 docs 1  e.g. tierB-001231

;; ---- slot set.Result  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 set) (Result $e0 $e1) (Member $e1 straight))    ;; n 1 docs 1  e.g. tierB-001976

;; ---- slot set_fire_to.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 set_fire_to)    ;; n 1 docs 1  e.g. tierB-001887

;; ---- slot set_sail.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 set_sail)    ;; n 1 docs 1  e.g. tierB-000605

;; ---- slot set_up.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 set_up)    ;; n 1 docs 1  e.g. tierB-001870

;; ---- slot settle.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 settle)    ;; n 1 docs 1  e.g. tierB-000977

;; ---- slot share.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 share)    ;; n 1 docs 1  e.g. tierB-000696

;; ---- slot shed_light.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 shed_light)    ;; n 1 docs 1  e.g. tierB-001589

;; ---- slot sheep.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 sheep)    ;; n 1 docs 1  e.g. tierB-001773

;; ---- slot sheet.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 sheet)    ;; n 1 docs 1  e.g. tierB-001193

;; ---- slot shoot.Result  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 shoot) (Result $e0 $e1) (Member $e1 dead))    ;; n 1 docs 1  e.g. tierB-000256

;; ---- slot shop.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 shop)    ;; n 1 docs 1  e.g. tierB-000720

;; ---- slot shopkeeper.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 shopkeeper)    ;; n 1 docs 1  e.g. tierB-000091

;; ---- slot shopping_arcade.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 shopping_arcade)    ;; n 1 docs 1  e.g. tierB-001541

;; ---- slot shoreline.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 shoreline)    ;; n 1 docs 1  e.g. tierB-000584

;; ---- slot short.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 short) (GroupOf $x0 day))    ;; n 1 docs 1  e.g. tierB-001658

;; ---- slot short.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 short)    ;; n 1 docs 1  e.g. tierB-001658

;; ---- slot short.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 short)    ;; n 1 docs 1  e.g. tierB-001658

;; ---- slot shortening.But  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 shortening) (But $e0 $e1) (Member $e1 use))    ;; n 1 docs 1  e.g. tierB-001314

;; ---- slot shortening.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 shortening)    ;; n 1 docs 1  e.g. tierB-001314

;; ---- slot shot.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 shot)    ;; n 1 docs 1  e.g. tierB-000421

;; ---- slot shoulder.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 shoulder)    ;; n 1 docs 1  e.g. tierB-000349

;; ---- slot show.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 show)    ;; n 1 docs 1  e.g. tierB-000465

;; ---- slot show_sole.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 show_sole)    ;; n 1 docs 1  e.g. tierB-000482

;; ---- slot show_up.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 show_up)    ;; n 1 docs 1  e.g. tierB-001152

;; ---- slot shut.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 shut)    ;; n 1 docs 1  e.g. tierB-000302

;; ---- slot sight.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 sight)    ;; n 1 docs 1  e.g. tierB-000678

;; ---- slot sight_read.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sight_read)    ;; n 1 docs 1  e.g. tierB-001847

;; ---- slot sign.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sign)    ;; n 1 docs 1  e.g. tierB-000170

;; ---- slot silence.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 silence)    ;; n 1 docs 1  e.g. tierB-001885

;; ---- slot silent.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 silent)    ;; n 1 docs 1  e.g. tierB-000609

;; ---- slot singer.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 singer)    ;; n 1 docs 1  e.g. tierB-000850

;; ---- slot sink.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 sink)    ;; n 1 docs 1  e.g. tierB-000818

;; ---- slot sink.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sink)    ;; n 1 docs 1  e.g. tierB-000581

;; ---- slot sister.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 sister)    ;; n 1 docs 1  e.g. tierB-001362

;; ---- slot sister.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 sister) (PartOf $x0 $x1) (Member $x1 sister))    ;; n 1 docs 1  e.g. tierB-001362

;; ---- slot sit_down.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sit_down)    ;; n 1 docs 1  e.g. tierB-000305

;; ---- slot situation.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 situation)    ;; n 1 docs 1  e.g. tierB-000120

;; ---- slot skeleton.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 skeleton)    ;; n 1 docs 1  e.g. tierB-000936

;; ---- slot slavery.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 slavery)    ;; n 1 docs 1  e.g. tierB-000735

;; ---- slot slavery.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 slavery) (Possession $x0 pleasure))    ;; n 1 docs 1  e.g. tierB-000735

;; ---- slot sleep.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 sleep) (Before $e0 $e1) (Member $e1 break_out))    ;; n 1 docs 1  e.g. tierB-001302

;; ---- slot small.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 small) (GroupOf $x0 burlap_sack))    ;; n 1 docs 1  e.g. tierB-000975

;; ---- slot smell.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 smell)    ;; n 1 docs 1  e.g. tierB-001230

;; ---- slot smell.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 smell) (Possession $x0 $x1) (Member $x1 bird_dropping))    ;; n 1 docs 1  e.g. tierB-001230

;; ---- slot smile.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 smile)    ;; n 1 docs 1  e.g. tierB-000210

;; ---- slot smoke.From  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 smoke) (From $x0 factory))    ;; n 1 docs 1  e.g. tierB-001303

;; ---- slot smoke.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 smoke)    ;; n 1 docs 1  e.g. tierB-001303

;; ---- slot smoke.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 smoke)    ;; n 1 docs 1  e.g. tierB-000947

;; ---- slot snack.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 snack)    ;; n 1 docs 1  e.g. tierB-001325

;; ---- slot snake.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 snake)    ;; n 1 docs 1  e.g. tierB-001854

;; ---- slot snare.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 snare)    ;; n 1 docs 1  e.g. tierB-000222

;; ---- slot snowstorm.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 snowstorm)    ;; n 1 docs 1  e.g. tierB-000296

;; ---- slot soar.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 soar)    ;; n 1 docs 1  e.g. tierB-001333

;; ---- slot soccer_game.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 soccer_game)    ;; n 1 docs 1  e.g. tierB-001007

;; ---- slot social_media.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 social_media)    ;; n 1 docs 1  e.g. tierC-000178

;; ---- slot society.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 society)    ;; n 1 docs 1  e.g. tierB-001482

;; ---- slot sociologist.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 sociologist)    ;; n 1 docs 1  e.g. tierB-000963

;; ---- slot soft_drink.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 soft_drink)    ;; n 1 docs 1  e.g. tierB-000449

;; ---- slot software.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 software)    ;; n 1 docs 1  e.g. tierB-000557

;; ---- slot soil.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 soil)    ;; n 1 docs 1  e.g. tierB-000291

;; ---- slot soldier.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 soldier)    ;; n 1 docs 1  e.g. tierB-000067

;; ---- slot soluble.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 soluble)    ;; n 1 docs 1  e.g. tierB-000887

;; ---- slot sorry.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sorry)    ;; n 1 docs 1  e.g. tierB-001258

;; ---- slot sound.From  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 sound) (From $x0 $x1) (Member $x1 aspect))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001537
(And (Member $x0 sound) (From $x0 $x1) (Member $x1 scientific))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001537

;; ---- slot soup.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 soup)    ;; n 1 docs 1  e.g. tierB-000208

;; ---- slot southeastern_corner.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 southeastern_corner) (LocatedIn $x0 egypt))    ;; n 1 docs 1  e.g. tierB-001049

;; ---- slot southeastern_corner.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 southeastern_corner)    ;; n 1 docs 1  e.g. tierB-001049

;; ---- slot sow.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sow)    ;; n 1 docs 1  e.g. tierB-001689

;; ---- slot space_mission.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 space_mission)    ;; n 1 docs 1  e.g. tierB-001276

;; ---- slot speak_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 speak_out)    ;; n 1 docs 1  e.g. tierB-001972

;; ---- slot speaker.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 speaker) (Before $e0 $e1) (Member $e1 speaker))    ;; n 1 docs 1  e.g. tierC-000078

;; ---- slot species.KindProperty  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 species) (KindProperty $x0 endangered))    ;; n 1 docs 1  e.g. tierB-000597

;; ---- slot species.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 species)    ;; n 1 docs 1  e.g. tierB-000597

;; ---- slot speeder.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 speeder)    ;; n 1 docs 1  e.g. tierB-001526

;; ---- slot spell_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 spell_out)    ;; n 1 docs 1  e.g. tierB-000555

;; ---- slot spokesman.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 spokesman) (Before $e0 $e1) (Member $e1 spokesman))    ;; n 1 docs 1  e.g. tierC-000077

;; ---- slot spotlight.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 spotlight)    ;; n 1 docs 1  e.g. tierB-000955

;; ---- slot spring.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 spring)    ;; n 1 docs 1  e.g. tierB-001440

;; ---- slot squad.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 squad)    ;; n 1 docs 1  e.g. tierB-001782

;; ---- slot square.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 square)    ;; n 1 docs 1  e.g. tierB-000305

;; ---- slot squirrel.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 squirrel)    ;; n 1 docs 1  e.g. tierB-001563

;; ---- slot stable.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 stable)    ;; n 1 docs 1  e.g. tierB-001771

;; ---- slot stage.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 stage)    ;; n 1 docs 1  e.g. tierC-000092

;; ---- slot stall.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 stall)    ;; n 1 docs 1  e.g. tierB-000577

;; ---- slot stance.In  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 stance) (In $x0 religion))    ;; n 1 docs 1  e.g. tierB-001533

;; ---- slot stand.During  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 stand) (During $e0 $e1) (Member $e1 pass))    ;; n 1 docs 1  e.g. tierB-001782

;; ---- slot start.TimeAtLeast  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 start) (TimeAtLeast $e0 <term:Hour>))    ;; n 1 docs 1  e.g. tierB-000465

;; ---- slot statue.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 statue) (LocatedIn $x0 trafalgar_square))    ;; n 1 docs 1  e.g. tierB-001042

;; ---- slot statue.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 statue)    ;; n 1 docs 1  e.g. tierB-001042

;; ---- slot statue.Of  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 statue) (Of $x0 nelson))    ;; n 1 docs 1  e.g. tierB-001042

;; ---- slot stay.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 stay) (Before $e0 $e1) (Member $e1 move_back))    ;; n 1 docs 1  e.g. tierC-000122

;; ---- slot steel.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 steel)    ;; n 1 docs 1  e.g. tierB-000690

;; ---- slot stereo.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 stereo)    ;; n 1 docs 1  e.g. tierB-001074

;; ---- slot stew_pot.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 stew_pot)    ;; n 1 docs 1  e.g. tierB-001586

;; ---- slot stone_wall.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 stone_wall)    ;; n 1 docs 1  e.g. tierB-001005

;; ---- slot storehouse.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 storehouse)    ;; n 1 docs 1  e.g. tierB-000485

;; ---- slot storeroom.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 storeroom)    ;; n 1 docs 1  e.g. tierB-000372

;; ---- slot stork.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 stork)    ;; n 1 docs 1  e.g. tierB-000633

;; ---- slot storm.Before  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 storm) (Before $x0 $e1) (Member $e1 linger))    ;; n 1 docs 1  e.g. tierB-001531

;; ---- slot story.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 story) (Before $e0 now))    ;; n 1 docs 1  e.g. tierB-000967

;; ---- slot story.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 story)    ;; n 1 docs 1  e.g. tierB-000967

;; ---- slot straight.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 straight) (GroupOf $x0 boy))    ;; n 1 docs 1  e.g. tierB-001976

;; ---- slot straight.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 straight)    ;; n 1 docs 1  e.g. tierB-001976

;; ---- slot straight.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 straight)    ;; n 1 docs 1  e.g. tierB-001976

;; ---- slot street_vendor.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 street_vendor)    ;; n 1 docs 1  e.g. tierB-000400

;; ---- slot stretch.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 stretch) (PartOf $x0 road))    ;; n 1 docs 1  e.g. tierB-001792

;; ---- slot strew.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 strew)    ;; n 1 docs 1  e.g. tierB-000757

;; ---- slot string.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 string)    ;; n 1 docs 1  e.g. tierB-001871

;; ---- slot strong_force.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 strong_force)    ;; n 1 docs 1  e.g. tierB-001823

;; ---- slot struggle.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 struggle)    ;; n 1 docs 1  e.g. tierB-000171

;; ---- slot struggle.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 struggle) (To $e0 $e1) (Member $e1 avoid))    ;; n 1 docs 1  e.g. tierB-000171

;; ---- slot stuck.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 stuck)    ;; n 1 docs 1  e.g. tierB-000589

;; ---- slot student_teacher_relation.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 student_teacher_relation)    ;; n 1 docs 1  e.g. tierB-001065

;; ---- slot study.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 study)    ;; n 1 docs 1  e.g. tierB-001438

;; ---- slot study.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 study) (To $e0 $e1) (Member $e1 doctor))    ;; n 1 docs 1  e.g. tierB-000203

;; ---- slot stunt_double.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 stunt_double)    ;; n 1 docs 1  e.g. tierB-001017

;; ---- slot suffer.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 suffer)    ;; n 1 docs 1  e.g. tierB-001498

;; ---- slot sugar.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 sugar) (PartOf $x0 $x1) (Member $x1 sugar))    ;; n 1 docs 1  e.g. tierB-001243

;; ---- slot summer.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 summer)    ;; n 1 docs 1  e.g. tierB-000094

;; ---- slot sunlight.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 sunlight)    ;; n 1 docs 1  e.g. tierB-001904

;; ---- slot supermarket.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 supermarket)    ;; n 1 docs 1  e.g. tierB-000204

;; ---- slot surrealist_movement.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 surrealist_movement)    ;; n 1 docs 1  e.g. tierB-000438

;; ---- slot surround.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 surround)    ;; n 1 docs 1  e.g. tierB-001005

;; ---- slot surroundings.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 surroundings)    ;; n 1 docs 1  e.g. tierB-001836

;; ---- slot surroundings.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 surroundings) (Possession $x0 $x1) (Member $x1 gazelle))    ;; n 1 docs 1  e.g. tierB-001836

;; ---- slot survivor.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 survivor)    ;; n 1 docs 1  e.g. tierB-000033

;; ---- slot survivor.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 survivor) (Possession $x0 $x1) (Member $x1 accident))    ;; n 1 docs 1  e.g. tierB-000033

;; ---- slot sushi.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 sushi)    ;; n 1 docs 1  e.g. tierB-000733

;; ---- slot suspect.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 suspect)    ;; n 1 docs 1  e.g. tierB-001600

;; ---- slot sweep_away.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 sweep_away)    ;; n 1 docs 1  e.g. tierB-000018

;; ---- slot swiss_keyboard.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 swiss_keyboard)    ;; n 1 docs 1  e.g. tierB-000127

;; ---- slot switch_off.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 switch_off)    ;; n 1 docs 1  e.g. tierC-000316

;; ---- slot symphony.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 symphony)    ;; n 1 docs 1  e.g. tierB-001575

;; ---- slot symphony.PartOf  [entity center; head other]  n 1  docs<= 2  distinct 2  eventive 0
(And (Member $x0 symphony) (PartOf $x0 $x1) (Member $x1 great))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001575
(And (Member $x0 symphony) (PartOf $x0 $x1) (Member $x1 symphony))    ;; n 1 (mass 0.5) docs 1  e.g. tierB-001575

;; ---- slot take.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 take) (To $e0 $e1) (Member $e1 redeem))    ;; n 1 docs 1  e.g. tierB-000252

;; ---- slot take_down.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 take_down)    ;; n 1 docs 1  e.g. tierB-001423

;; ---- slot take_off.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 take_off) (To $e0 $e1) (Member $e1 repeat))    ;; n 1 docs 1  e.g. tierB-000147

;; ---- slot take_part.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 take_part)    ;; n 1 docs 1  e.g. tierB-001033

;; ---- slot talk.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 talk)    ;; n 1 docs 1  e.g. tierB-001584

;; ---- slot tape_recorder.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 tape_recorder)    ;; n 1 docs 1  e.g. tierB-001041

;; ---- slot task.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 task)    ;; n 1 docs 1  e.g. tierC-000021

;; ---- slot task.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 task) (Possession $x0 philosophy))    ;; n 1 docs 1  e.g. tierC-000021

;; ---- slot teem.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 teem)    ;; n 1 docs 1  e.g. tierB-001397

;; ---- slot telephone_call.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 telephone_call)    ;; n 1 docs 1  e.g. tierB-001182

;; ---- slot teleport.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 teleport)    ;; n 1 docs 1  e.g. tierB-000029

;; ---- slot temperature.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 temperature)    ;; n 1 docs 1  e.g. tierB-001681

;; ---- slot terrorize.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 terrorize)    ;; n 1 docs 1  e.g. tierB-000096

;; ---- slot text.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 text)    ;; n 1 docs 1  e.g. tierB-001210

;; ---- slot thief.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 thief)    ;; n 1 docs 1  e.g. tierB-000150

;; ---- slot thing.Also  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 thing) (Also $x0 $e1) (Member $e1 add))    ;; n 1 docs 1  e.g. tierC-000228

;; ---- slot thing.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 thing) (Possession $x0 $x1) (Member $x1 person))    ;; n 1 docs 1  e.g. tierB-001613

;; ---- slot think.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 think)    ;; n 1 docs 1  e.g. tierB-001160

;; ---- slot thought.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 thought)    ;; n 1 docs 1  e.g. tierB-001216

;; ---- slot thrive.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 thrive)    ;; n 1 docs 1  e.g. tierB-000858

;; ---- slot throat.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 throat)    ;; n 1 docs 1  e.g. tierB-000802

;; ---- slot thud.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 thud)    ;; n 1 docs 1  e.g. tierB-000343

;; ---- slot thunder.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 thunder)    ;; n 1 docs 1  e.g. tierB-000634

;; ---- slot tick_away.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 tick_away)    ;; n 1 docs 1  e.g. tierB-001062

;; ---- slot ticket.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ticket)    ;; n 1 docs 1  e.g. tierB-000556

;; ---- slot tie.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 tie)    ;; n 1 docs 1  e.g. tierB-000392

;; ---- slot tie.Result  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 tie) (Result $e0 $e1) (Member $e1 together))    ;; n 1 docs 1  e.g. tierB-000392

;; ---- slot tiger.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 tiger)    ;; n 1 docs 1  e.g. tierB-001001

;; ---- slot till.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 till)    ;; n 1 docs 1  e.g. tierB-000291

;; ---- slot time.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 time)    ;; n 1 docs 1  e.g. tierB-000883

;; ---- slot tire.From  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 tire) (From $x0 $x1) (Member $x1 model))    ;; n 1 docs 1  e.g. tierB-001421

;; ---- slot together.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 together) (GroupOf $x0 bodyguard))    ;; n 1 docs 1  e.g. tierB-000392

;; ---- slot together.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 together)    ;; n 1 docs 1  e.g. tierB-000392

;; ---- slot together.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 together)    ;; n 1 docs 1  e.g. tierB-000392

;; ---- slot tomb.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 tomb)    ;; n 1 docs 1  e.g. tierB-000579

;; ---- slot top.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 top)    ;; n 1 docs 1  e.g. tierB-001757

;; ---- slot topple.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 topple)    ;; n 1 docs 1  e.g. tierB-001886

;; ---- slot torture.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 torture)    ;; n 1 docs 1  e.g. tierB-001138

;; ---- slot total.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 total) (LocatedIn $x0 $x1) (Member $x1 bottom))    ;; n 1 docs 1  e.g. tierB-001638

;; ---- slot total.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 total)    ;; n 1 docs 1  e.g. tierB-001638

;; ---- slot tourist.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 tourist) (GroupOf $x0 reveller))    ;; n 1 docs 1  e.g. tierB-001941

;; ---- slot tourist.Inheritance  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 tourist) (Inheritance $x0 tourist))    ;; n 1 docs 1  e.g. tierB-001941

;; ---- slot tourist.SubsetOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 tourist) (SubsetOf $x0 $x1) (Member $x1 reveller))    ;; n 1 docs 1  e.g. tierB-001941

;; ---- slot tower.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 tower)    ;; n 1 docs 1  e.g. tierB-001919

;; ---- slot traffic.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 traffic)    ;; n 1 docs 1  e.g. tierB-001222

;; ---- slot trail.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 trail)    ;; n 1 docs 1  e.g. tierB-001759

;; ---- slot tranquilliser_dart.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 tranquilliser_dart)    ;; n 1 docs 1  e.g. tierB-001001

;; ---- slot translation.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 translation)    ;; n 1 docs 1  e.g. tierB-000122

;; ---- slot travel_adaptor.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 travel_adaptor)    ;; n 1 docs 1  e.g. tierB-000419

;; ---- slot treat.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 treat)    ;; n 1 docs 1  e.g. tierB-001636

;; ---- slot treeline.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 treeline)    ;; n 1 docs 1  e.g. tierB-001949

;; ---- slot treetop.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 treetop)    ;; n 1 docs 1  e.g. tierB-001655

;; ---- slot trunk.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 trunk)    ;; n 1 docs 1  e.g. tierB-000083

;; ---- slot trunk.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 trunk) (PartOf $x0 $x1) (Member $x1 car))    ;; n 1 docs 1  e.g. tierB-000083

;; ---- slot truth.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 truth) (Possession $x0 $x1) (Member $x1 thing))    ;; n 1 docs 1  e.g. tierB-001223

;; ---- slot try_on.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 try_on)    ;; n 1 docs 1  e.g. tierB-000021

;; ---- slot tunnel.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 tunnel) (LocatedIn $x0 denmark))    ;; n 1 docs 1  e.g. tierC-000126

;; ---- slot turn_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 turn_out)    ;; n 1 docs 1  e.g. tierB-001550

;; ---- slot type_ia_supernova.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 type_ia_supernova)    ;; n 1 docs 1  e.g. tierB-001015

;; ---- slot typhoon.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 typhoon)    ;; n 1 docs 1  e.g. tierB-001697

;; ---- slot ukrainian_army.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 ukrainian_army)    ;; n 1 docs 1  e.g. tierB-001098

;; ---- slot uncomfortable.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 uncomfortable)    ;; n 1 docs 1  e.g. tierB-000325

;; ---- slot unfold.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 unfold)    ;; n 1 docs 1  e.g. tierB-001557

;; ---- slot union.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 union)    ;; n 1 docs 1  e.g. tierB-001667

;; ---- slot university.From  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 university) (From $x0 here))    ;; n 1 docs 1  e.g. tierB-001986

;; ---- slot university.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 university) (Possession $x0 bologna))    ;; n 1 docs 1  e.g. tierB-000292

;; ---- slot unknown.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 unknown)    ;; n 1 docs 1  e.g. tierB-000919

;; ---- slot unlocked.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 unlocked)    ;; n 1 docs 1  e.g. tierB-000747

;; ---- slot unwilling.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 unwilling)    ;; n 1 docs 1  e.g. tierB-000124

;; ---- slot update.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 update)    ;; n 1 docs 1  e.g. tierB-000557

;; ---- slot upper_millstone.Between  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 upper_millstone) (Between $x0 $x1) (Member $x1 nether_millstone))    ;; n 1 docs 1  e.g. tierB-000627

;; ---- slot upper_millstone.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 upper_millstone)    ;; n 1 docs 1  e.g. tierB-000627

;; ---- slot uprising.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 uprising)    ;; n 1 docs 1  e.g. tierB-000182

;; ---- slot upset.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 upset)    ;; n 1 docs 1  e.g. tierB-001657

;; ---- slot use.End  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 use) (End $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-000908

;; ---- slot use.Start  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $e0 use) (Start $e0 <term:Year>))    ;; n 1 docs 1  e.g. tierB-000908

;; ---- slot usual.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 usual)    ;; n 1 docs 1  e.g. tierC-000135

;; ---- slot van.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 van)    ;; n 1 docs 1  e.g. tierB-000426

;; ---- slot vanish.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 vanish)    ;; n 1 docs 1  e.g. tierB-000955

;; ---- slot various.GroupOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 various) (GroupOf $x0 calendar))    ;; n 1 docs 1  e.g. tierB-000089

;; ---- slot various.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 various)    ;; n 1 docs 1  e.g. tierB-000089

;; ---- slot veneer.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 veneer)    ;; n 1 docs 1  e.g. tierB-001809

;; ---- slot veneer.Only  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $x0 veneer) (Only $x0 $e1) (Member $e1 keep))    ;; n 1 docs 1  e.g. tierB-001809

;; ---- slot veneer.PartOf  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 veneer) (PartOf $x0 $x1) (Member $x1 republic))    ;; n 1 docs 1  e.g. tierB-001809

;; ---- slot veranda.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 veranda)    ;; n 1 docs 1  e.g. tierB-001132

;; ---- slot vindicate.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 vindicate)    ;; n 1 docs 1  e.g. tierB-000409

;; ---- slot vine.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 vine)    ;; n 1 docs 1  e.g. tierB-001107

;; ---- slot virus.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 virus)    ;; n 1 docs 1  e.g. tierB-000786

;; ---- slot vitamin_pill.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 vitamin_pill)    ;; n 1 docs 1  e.g. tierB-001254

;; ---- slot voice.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 voice)    ;; n 1 docs 1  e.g. tierB-000365

;; ---- slot vomit.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 vomit)    ;; n 1 docs 1  e.g. tierB-000199

;; ---- slot waiting_room.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 waiting_room)    ;; n 1 docs 1  e.g. tierB-001849

;; ---- slot wake.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 wake)    ;; n 1 docs 1  e.g. tierB-000909

;; ---- slot war.On  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 war) (On $x0 ukraine))    ;; n 1 docs 1  e.g. tierB-001444

;; ---- slot war.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 war) (Possession $x0 russia))    ;; n 1 docs 1  e.g. tierB-001444

;; ---- slot ward_off.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 ward_off)    ;; n 1 docs 1  e.g. tierB-000453

;; ---- slot warrior.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 warrior)    ;; n 1 docs 1  e.g. tierC-000014

;; ---- slot water.From  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 water) (From $x0 $x1) (Member $x1 mill))    ;; n 1 docs 1  e.g. tierB-001271

;; ---- slot water.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 water) (LocatedIn $x0 $x1) (Member $x1 dam))    ;; n 1 docs 1  e.g. tierB-000032

;; ---- slot water_source.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 water_source)    ;; n 1 docs 1  e.g. tierB-000304

;; ---- slot watermelon_season.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 watermelon_season)    ;; n 1 docs 1  e.g. tierB-000699

;; ---- slot wax.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 wax)    ;; n 1 docs 1  e.g. tierB-000447

;; ---- slot way.To  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 way) (To $x0 success))    ;; n 1 docs 1  e.g. tierB-001635

;; ---- slot weak_arens_space_topology.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 weak_arens_space_topology)    ;; n 1 docs 1  e.g. tierC-000005

;; ---- slot wear.To  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 wear) (To $e0 $e1) (Member $e1 protect))    ;; n 1 docs 1  e.g. tierB-001396

;; ---- slot weather.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 weather) (LocatedIn $x0 england))    ;; n 1 docs 1  e.g. tierB-001491

;; ---- slot weave.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 weave)    ;; n 1 docs 1  e.g. tierB-001677

;; ---- slot web.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 web)    ;; n 1 docs 1  e.g. tierB-001677

;; ---- slot web.Possession  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 web) (Possession $x0 time))    ;; n 1 docs 1  e.g. tierB-001677

;; ---- slot web_page.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 web_page)    ;; n 1 docs 1  e.g. tierB-000762

;; ---- slot week.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 week)    ;; n 1 docs 1  e.g. tierB-001374

;; ---- slot weird_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 weird_out)    ;; n 1 docs 1  e.g. tierB-000254

;; ---- slot welcome_back.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 welcome_back)    ;; n 1 docs 1  e.g. tierB-000554

;; ---- slot well.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 well)    ;; n 1 docs 1  e.g. tierB-001037

;; ---- slot west.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 west)    ;; n 1 docs 1  e.g. tierB-000995

;; ---- slot wet.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 wet)    ;; n 1 docs 1  e.g. tierB-000596

;; ---- slot while.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 while)    ;; n 1 docs 1  e.g. tierB-000978

;; ---- slot whisper.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 whisper)    ;; n 1 docs 1  e.g. tierB-001632

;; ---- slot white.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 white)    ;; n 1 docs 1  e.g. tierB-001431

;; ---- slot wild_boar.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 wild_boar)    ;; n 1 docs 1  e.g. tierB-000222

;; ---- slot wilson.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 wilson)    ;; n 1 docs 1  e.g. tierC-000277

;; ---- slot wind.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 wind)    ;; n 1 docs 1  e.g. tierB-001107

;; ---- slot window.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 window)    ;; n 1 docs 1  e.g. tierB-001899

;; ---- slot wine.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 wine)    ;; n 1 docs 1  e.g. tierB-000057

;; ---- slot winner.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 winner)    ;; n 1 docs 1  e.g. tierB-001693

;; ---- slot winter_festival.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 winter_festival)    ;; n 1 docs 1  e.g. tierB-000962

;; ---- slot wither.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 wither)    ;; n 1 docs 1  e.g. tierB-001240

;; ---- slot wolf.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 wolf)    ;; n 1 docs 1  e.g. tierB-001473

;; ---- slot woman.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 woman)    ;; n 1 docs 1  e.g. tierB-001907

;; ---- slot wood_floor.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 wood_floor)    ;; n 1 docs 1  e.g. tierB-000805

;; ---- slot word.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 word)    ;; n 1 docs 1  e.g. tierB-000152

;; ---- slot word_processor.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 word_processor)    ;; n 1 docs 1  e.g. tierB-001177

;; ---- slot work.Before  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 work) (Before $e0 $e1) (Member $e1 repair))    ;; n 1 docs 1  e.g. tierB-001134

;; ---- slot work.During  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 1
(And (Member $e0 work) (During $e0 $e1) (Member $e1 jail))    ;; n 1 docs 1  e.g. tierB-000867

;; ---- slot work_out.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 work_out)    ;; n 1 docs 1  e.g. tierB-000316

;; ---- slot work_through.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 work_through)    ;; n 1 docs 1  e.g. tierB-000118

;; ---- slot workshop.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 workshop)    ;; n 1 docs 1  e.g. tierB-000704

;; ---- slot worry.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 worry)    ;; n 1 docs 1  e.g. tierB-001784

;; ---- slot wound.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 wound)    ;; n 1 docs 1  e.g. tierB-000028

;; ---- slot wound.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 wound)    ;; n 1 docs 1  e.g. tierB-000771

;; ---- slot wreak.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 wreak)    ;; n 1 docs 1  e.g. tierB-001706

;; ---- slot wreck.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 wreck)    ;; n 1 docs 1  e.g. tierB-000919

;; ---- slot wriggle.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 wriggle)    ;; n 1 docs 1  e.g. tierB-001854

;; ---- slot x_ray.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 x_ray)    ;; n 1 docs 1  e.g. tierB-001122

;; ---- slot yard.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 yard)    ;; n 1 docs 1  e.g. tierB-001234

;; ---- slot yellow.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 yellow)    ;; n 1 docs 1  e.g. tierB-000832

;; ---- slot yield.Member  [event center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $e0 yield)    ;; n 1 docs 1  e.g. tierB-001453

;; ---- slot yogurt_bottle.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 yogurt_bottle)    ;; n 1 docs 1  e.g. tierB-000595

;; ---- slot zombie.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 zombie)    ;; n 1 docs 1  e.g. tierB-000345

;; ---- slot zoo.LocatedIn  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(And (Member $x0 zoo) (LocatedIn $x0 prague))    ;; n 1 docs 1  e.g. tierB-001660

;; ---- slot zoo.Member  [entity center; head other]  n 1  docs<= 1  distinct 1  eventive 0
(Member $x0 zoo)    ;; n 1 docs 1  e.g. tierB-001660

;; ==================== slot-merge signals (8; ppmi cosine >= 0.5, >= 2 shared informative fillers, slot n >= 3) ====================

;; cross-event  accompany.Agent ~ appear.Agent  cosine 0.60 (raw 0.76)  support 4  shared: person sister
;;   A e.g. tierC-000127 tierC-000128   B e.g. tierC-000050 tierC-000259
(And (Member $e0 accompany) (Agent $e0 $x1))
(And (Member $e0 appear) (Agent $e0 $x1))

;; cross-event  portray.Agent ~ win.Agent  cosine 0.51 (raw 0.69)  support 5  shared: james_woods wilson
;;   A e.g. tierC-000301 tierC-000277   B e.g. tierC-000302 tierB-000730
(And (Member $e0 portray) (Agent $e0 $x1))
(And (Member $e0 win) (Agent $e0 $x1))

;; cross-role  welcome.Agent ~ welcome.Theme  cosine 0.67 (raw 0.67)  support 3  shared: industrialization whig
;;   A e.g. tierC-000087 tierC-000088   B e.g. tierB-001868 tierC-000088
(And (Member $e0 welcome) (Agent $e0 $x1))
(And (Member $e0 welcome) (Theme $e0 $x1))

;; cross-role  portray.Agent ~ portray.Theme  cosine 0.58 (raw 0.44)  support 5  shared: james_woods wilson
;;   A e.g. tierC-000301 tierC-000277   B e.g. tierC-000278 tierC-000247
(And (Member $e0 portray) (Agent $e0 $x1))
(And (Member $e0 portray) (Theme $e0 $x1))

;; cross-role  find.Agent ~ find.Theme  cosine 0.50 (raw 0.42)  support 4  shared: couper pietro
;;   A e.g. tierC-000243 tierC-000244   B e.g. tierB-000706 tierB-000579
(And (Member $e0 find) (Agent $e0 $x1))
(And (Member $e0 find) (Theme $e0 $x1))

;; cross-both  die.Patient ~ sleep.Agent  cosine 1.00 (raw 0.99)  support 3  shared: family person
;;   A e.g. tierB-000838 tierB-001967   B e.g. tierB-001302 tierC-000041
(And (Member $e0 die) (Patient $e0 $x1))
(And (Member $e0 sleep) (Agent $e0 $x1))

;; cross-both  portray.Theme ~ win.Agent  cosine 0.54 (raw 0.60)  support 5  shared: james_woods wilson
;;   A e.g. tierC-000277 tierC-000278   B e.g. tierC-000301 tierC-000302
(And (Member $e0 portray) (Theme $e0 $x1))
(And (Member $e0 win) (Agent $e0 $x1))

;; cross-entity-class  destined.Member ~ film.Member  cosine 0.76 (raw 0.70)  support 3  shared: film syrian_film
;;   A e.g. tierC-000009   B e.g. tierB-000505 tierB-001017
(And (Member $x0 destined) (Member $x0 $x1))
(And (Member $x0 film) (Member $x0 $x1))

;; ==================== #23 flip witnesses, candidate-eligible (29; prompt-undetermined classes, ENTITY fillers) ====================
;; PROVISIONAL role-canonicalization candidates, minority -> majority role (tie -> Patient);
;; NOT rules: build_candidates carries them to the gauntlet (role-bridge card, same_relation
;; question, prompt_side_evidence filing). Witnesses: A under Theme | B under Patient.

;; get  Theme 3 / Patient 7  shared: —  witnesses: tierB-000418|tierB-000206 tierB-000418|tierB-000370 tierB-000418|tierB-000748
(Implication (And (Member $e get) (Theme $e $x)) (And (Member $e get) (Patient $e $x)))

;; leave  Theme 3 / Patient 3  shared: —  witnesses: tierB-000704|tierB-000004 tierB-000704|tierB-000425 tierB-000704|tierB-000747
(Implication (And (Member $e leave) (Theme $e $x)) (And (Member $e leave) (Patient $e $x)))

;; do  Theme 2 / Patient 4  shared: thing  witnesses: tierB-001236|tierB-001520 tierB-001236|tierB-001721 tierB-001729|tierB-001520
(Implication (And (Member $e do) (Theme $e $x)) (And (Member $e do) (Patient $e $x)))

;; take  Theme 10 / Patient 2  shared: —  witnesses: tierB-000252|tierB-001077 tierB-000252|tierB-001102 tierB-000309|tierB-001077
(Implication (And (Member $e take) (Patient $e $x)) (And (Member $e take) (Theme $e $x)))

;; arrange  Theme 1 / Patient 1  shared: session  witnesses: tierC-000349|tierC-000350
(Implication (And (Member $e arrange) (Theme $e $x)) (And (Member $e arrange) (Patient $e $x)))

;; base  Theme 2 / Patient 1  shared: —  witnesses: tierB-001610|tierB-001605 tierB-001928|tierB-001605
(Implication (And (Member $e base) (Patient $e $x)) (And (Member $e base) (Theme $e $x)))

;; become  Theme 1 / Patient 11  shared: inomaru  witnesses: tierC-000238|tierC-000237 tierC-000238|tierB-000352 tierC-000238|tierB-000740
(Implication (And (Member $e become) (Theme $e $x)) (And (Member $e become) (Patient $e $x)))

;; cause  Theme 1 / Patient 4  shared: —  witnesses: tierB-001875|tierB-000775 tierB-001875|tierB-000805 tierB-001875|tierB-001089
(Implication (And (Member $e cause) (Theme $e $x)) (And (Member $e cause) (Patient $e $x)))

;; celebrate  Theme 2 / Patient 1  shared: mela  witnesses: tierC-000133|tierC-000134 tierB-000303|tierC-000134
(Implication (And (Member $e celebrate) (Patient $e $x)) (And (Member $e celebrate) (Theme $e $x)))

;; clarify  Theme 1 / Patient 1  shared: —  witnesses: tierC-000021|tierC-000022
(Implication (And (Member $e clarify) (Theme $e $x)) (And (Member $e clarify) (Patient $e $x)))

;; conduct  Theme 3 / Patient 1  shared: —  witnesses: tierB-000177|tierC-000284 tierC-000341|tierC-000284 tierC-000342|tierC-000284
(Implication (And (Member $e conduct) (Patient $e $x)) (And (Member $e conduct) (Theme $e $x)))

;; connect  Theme 4 / Patient 1  shared: —  witnesses: tierB-001071|tierB-000063 tierC-000037|tierB-000063 tierC-000038|tierB-000063
(Implication (And (Member $e connect) (Patient $e $x)) (And (Member $e connect) (Theme $e $x)))

;; cover  Theme 1 / Patient 3  shared: —  witnesses: tierB-000702|tierB-000809 tierB-000702|tierB-001166 tierB-000702|tierB-001541
(Implication (And (Member $e cover) (Theme $e $x)) (And (Member $e cover) (Patient $e $x)))

;; develop  Theme 1 / Patient 1  shared: —  witnesses: tierC-000349|tierB-000404
(Implication (And (Member $e develop) (Theme $e $x)) (And (Member $e develop) (Patient $e $x)))

;; direct  Theme 1 / Patient 5  shared: —  witnesses: tierB-001087|tierC-000010 tierB-001087|tierC-000091 tierB-001087|tierC-000138
(Implication (And (Member $e direct) (Theme $e $x)) (And (Member $e direct) (Patient $e $x)))

;; draw  Theme 1 / Patient 2  shared: —  witnesses: tierB-000781|tierC-000293 tierB-000781|tierC-000294
(Implication (And (Member $e draw) (Theme $e $x)) (And (Member $e draw) (Patient $e $x)))

;; hold  Theme 1 / Patient 3  shared: —  witnesses: tierB-001266|tierB-000378 tierB-001266|tierC-000283 tierB-001266|tierC-000284
(Implication (And (Member $e hold) (Theme $e $x)) (And (Member $e hold) (Patient $e $x)))

;; hold_up  Theme 2 / Patient 1  shared: —  witnesses: tierB-000329|tierB-000692 tierB-001801|tierB-000692
(Implication (And (Member $e hold_up) (Patient $e $x)) (And (Member $e hold_up) (Theme $e $x)))

;; influence  Theme 1 / Patient 2  shared: religion  witnesses: tierC-000258|tierC-000257 tierC-000258|tierC-000351
(Implication (And (Member $e influence) (Theme $e $x)) (And (Member $e influence) (Patient $e $x)))

;; make  Theme 1 / Patient 20  shared: —  witnesses: tierB-000173|tierB-000025 tierB-000173|tierB-000073 tierB-000173|tierB-000269
(Implication (And (Member $e make) (Theme $e $x)) (And (Member $e make) (Patient $e $x)))

;; pass  Theme 2 / Patient 1  shared: —  witnesses: tierB-000649|tierB-001782 tierB-001762|tierB-001782
(Implication (And (Member $e pass) (Patient $e $x)) (And (Member $e pass) (Theme $e $x)))

;; pick_up  Theme 2 / Patient 1  shared: —  witnesses: tierB-000334|tierB-001072 tierB-001040|tierB-001072
(Implication (And (Member $e pick_up) (Patient $e $x)) (And (Member $e pick_up) (Theme $e $x)))

;; play  Theme 8 / Patient 1  shared: series  witnesses: tierC-000230|tierC-000229 tierB-000089|tierC-000229 tierB-000648|tierC-000229
(Implication (And (Member $e play) (Patient $e $x)) (And (Member $e play) (Theme $e $x)))

;; reach  Theme 2 / Patient 1  shared: —  witnesses: tierB-000117|tierB-001082 tierB-001488|tierB-001082
(Implication (And (Member $e reach) (Patient $e $x)) (And (Member $e reach) (Theme $e $x)))

;; spend  Theme 3 / Patient 1  shared: —  witnesses: tierB-001146|tierB-000883 tierC-000047|tierB-000883 tierC-000048|tierB-000883
(Implication (And (Member $e spend) (Patient $e $x)) (And (Member $e spend) (Theme $e $x)))

;; spread  Theme 1 / Patient 1  shared: —  witnesses: tierB-000047|tierB-001113
(Implication (And (Member $e spread) (Theme $e $x)) (And (Member $e spread) (Patient $e $x)))

;; start  Theme 1 / Patient 10  shared: —  witnesses: tierB-000043|tierB-000192 tierB-000043|tierB-000265 tierB-000043|tierB-000465
(Implication (And (Member $e start) (Theme $e $x)) (And (Member $e start) (Patient $e $x)))

;; strike  Theme 1 / Patient 1  shared: —  witnesses: tierB-000354|tierB-000653
(Implication (And (Member $e strike) (Theme $e $x)) (And (Member $e strike) (Patient $e $x)))

;; take_over  Theme 2 / Patient 1  shared: —  witnesses: tierC-000109|tierB-001234 tierC-000110|tierB-001234
(Implication (And (Member $e take_over) (Patient $e $x)) (And (Member $e take_over) (Theme $e $x)))

;; ==================== D.3 diagnostics (0; parse-error path, never candidates) ====================
;; none — every prompt-determined class present carries only its licensed roles
