;; FUSE-NF §4.3.1 frequent patterns — readable MeTTa RENDERING (never loaded: a
;; pattern is a conjunctive query over variables, not an assertion).
;; 4391 patterns over 1950 records (canon fusenf-canon/4); k=4, min_support=3; sorted by document support desc
;; then pattern id. $e#/$x#/$f# = event/entity/function skolem variables, $v# = lifted
;; content constants (same $v = same value). patterns2.jsonl is the record of truth.

;; p200001  star  support 1211 (occ 2030)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000003 tierB-000004 tierB-000005
(Member $x0 $v0)

;; p200002  star  support 1028 (occ 1316)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000001 tierB-000002 tierB-000004
(Member $e0 $v0)

;; p200003  star  support 569 (occ 639)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000001 tierB-000002 tierB-000005
(And (Member $e0 $v0) (Past $e0))

;; p200004  star  support 569 (occ 632)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000002 tierB-000005
(Past $e0)

;; p200005  kindlevel  support 456 (occ 789)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000005 tierB-000008 tierB-000015
(Inheritance $v0 $v1)

;; p200006  star  support 404 (occ 459)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000004 tierB-000005 tierB-000016
(GroupOf $x0 $v0)

;; p200007  star  support 333 (occ 411)  size 2  lifted 2  nisurp 1.258  tiers tierB
;;   e.g. tierB-000005 tierB-000008 tierB-000019
(And (Member $x0 $v0) (Member $x0 $v1))

;; p200008  star  support 317 (occ 362)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000005 tierB-000018 tierB-000028
(And (Agent $e0 $x0) (Member $e0 $v0))

;; p200009  star  support 317 (occ 359)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000018 tierB-000028
(Agent $e0 $x0)

;; p200010  star  support 267 (occ 284)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000004 tierB-000005 tierB-000016
(And (Member $e0 $v0) (Patient $e0 $x0))

;; p200011  star  support 267 (occ 280)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000005 tierB-000016
(Patient $e0 $x0)

;; p200012  star  support 245 (occ 258)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000018 tierB-000021 tierB-000037
(Theme $e0 $x0)

;; p200013  star  support 244 (occ 260)  size 2  lifted 1  nisurp 0.471  tiers tierB
;;   e.g. tierB-000018 tierB-000021 tierB-000037
(And (Member $e0 $v0) (Theme $e0 $x0))

;; p200014  cross  support 230 (occ 294)  size 3  lifted 2  nisurp 0.144  tiers tierB
;;   e.g. tierB-000028 tierB-000036 tierB-000045
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p200015  star  support 230 (occ 291)  size 2  lifted 1  nisurp 0.144  tiers tierB  dominated
;;   e.g. tierB-000028 tierB-000036 tierB-000045
(And (Agent $e0 $x0) (Member $x0 $v0))

;; p200016  star  support 214 (occ 279)  size 2  lifted 1  nisurp 0.225  tiers tierB
;;   e.g. tierB-000004 tierB-000005 tierB-000016
(And (Member $x0 $v0) (Patient $e0 $x0))

;; p200017  cross  support 213 (occ 282)  size 3  lifted 2  nisurp 0.222  tiers tierB
;;   e.g. tierB-000004 tierB-000005 tierB-000016
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p200018  star  support 212 (occ 265)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000001 tierB-000002 tierB-000004
(And (Agent $e0 $v0) (Member $e0 $v1))

;; p200019  star  support 212 (occ 265)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000002 tierB-000004
(Agent $e0 $v0)

;; p200020  star  support 190 (occ 206)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000018 tierB-000045 tierB-000049
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e0))

;; p200021  star  support 190 (occ 205)  size 2  lifted 0  nisurp 0.513  tiers tierB  dominated
;;   e.g. tierB-000018 tierB-000045 tierB-000049
(And (Agent $e0 $x0) (Past $e0))

;; p200022  cross  support 188 (occ 253)  size 3  lifted 2  nisurp 0.194  tiers tierB
;;   e.g. tierB-000021 tierB-000037 tierB-000047
(And (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0))

;; p200023  star  support 188 (occ 251)  size 2  lifted 1  nisurp 0.191  tiers tierB  dominated
;;   e.g. tierB-000021 tierB-000037 tierB-000047
(And (Member $x0 $v0) (Theme $e0 $x0))

;; p200024  kindlevel  support 185 (occ 254)  size 2  lifted 3  nisurp 0.424  tiers tierB
;;   e.g. tierB-000005 tierB-000015 tierB-000060
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2))

;; p200025  cross  support 174 (occ 237)  size 2  lifted 2  nisurp 0.627  tiers tierB
;;   e.g. tierB-000008 tierB-000016 tierB-000042
(And (Inheritance $v0 $v1) (Member $x0 $v0))

;; p200026  star  support 151 (occ 156)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000005 tierB-000018 tierB-000034
(And (Member $e0 $v0) (Past $e0) (Patient $e0 $x0))

;; p200027  star  support 151 (occ 154)  size 2  lifted 0  nisurp 0.484  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000018 tierB-000034
(And (Past $e0) (Patient $e0 $x0))

;; p200028  star  support 145 (occ 152)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000001 tierB-000008 tierB-000013
(And (Member $e0 $v0) (Ongoing $e0))

;; p200029  star  support 145 (occ 149)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000008 tierB-000013
(Ongoing $e0)

;; p200030  star  support 139 (occ 158)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000001 tierB-000002 tierB-000008
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p200031  star  support 139 (occ 158)  size 2  lifted 1  nisurp 0.555  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000002 tierB-000008
(And (Agent $e0 $v0) (Past $e0))

;; p200032  cross  support 138 (occ 168)  size 4  lifted 2  nisurp 0.145  tiers tierB
;;   e.g. tierB-000045 tierB-000049 tierB-000073
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p200033  cross  support 138 (occ 167)  size 3  lifted 1  nisurp 0.145  tiers tierB  dominated
;;   e.g. tierB-000045 tierB-000049 tierB-000073
(And (Agent $e0 $x0) (Member $x0 $v0) (Past $e0))

;; p200034  kindlevel  support 138 (occ 189)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000031 tierB-000044 tierB-000046
(Member $v0 $v1)

;; p200035  star  support 129 (occ 143)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000004 tierB-000040 tierB-000124
(And (Experiencer $e0 $x0) (Member $e0 $v0))

;; p200036  star  support 129 (occ 139)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000040 tierB-000124
(Experiencer $e0 $x0)

;; p200037  cross  support 117 (occ 146)  size 3  lifted 1  nisurp 0.199  tiers tierB
;;   e.g. tierB-000005 tierB-000056 tierB-000063
(And (Member $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p200038  cross  support 116 (occ 147)  size 4  lifted 2  nisurp 0.192  tiers tierB
;;   e.g. tierB-000005 tierB-000056 tierB-000063
(And (Member $e0 $v0) (Member $x0 $v1) (Past $e0) (Patient $e0 $x0))

;; p200039  star  support 114 (occ 119)  size 3  lifted 1  nisurp 0.373  tiers tierB
;;   e.g. tierB-000018 tierB-000021 tierB-000047
(And (Member $e0 $v0) (Past $e0) (Theme $e0 $x0))

;; p200040  star  support 114 (occ 119)  size 2  lifted 0  nisurp 0.373  tiers tierB  dominated
;;   e.g. tierB-000018 tierB-000021 tierB-000047
(And (Past $e0) (Theme $e0 $x0))

;; p200041  star  support 109 (occ 173)  size 2  lifted 1  nisurp 0.265  tiers tierB
;;   e.g. tierB-000004 tierB-000134 tierB-000144
(And (Experiencer $e0 $x0) (Member $x0 $v0))

;; p200042  cross  support 103 (occ 137)  size 3  lifted 2  nisurp 0.222  tiers tierB
;;   e.g. tierB-000134 tierB-000144 tierB-000152
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p200043  cross  support 94 (occ 109)  size 3  lifted 2  nisurp 0.301  tiers tierB
;;   e.g. tierB-000005 tierB-000018 tierB-000063
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1))

;; p200044  star  support 94 (occ 108)  size 2  lifted 1  nisurp 0.301  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000018 tierB-000063
(And (Agent $e0 $x0) (GroupOf $x0 $v0))

;; p200045  star  support 94 (occ 97)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000001 tierB-000005 tierB-000012
(Manner $e0 $v0)

;; p200046  star  support 93 (occ 102)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000008 tierB-000034 tierB-000036
(And (Location $e0 $x0) (Member $e0 $v0))

;; p200047  star  support 93 (occ 96)  size 2  lifted 2  nisurp 0.467  tiers tierB
;;   e.g. tierB-000001 tierB-000005 tierB-000012
(And (Manner $e0 $v0) (Member $e0 $v1))

;; p200048  star  support 93 (occ 98)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000034 tierB-000036
(Location $e0 $x0)

;; p200049  star  support 89 (occ 92)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000018 tierB-000091 tierB-000101
(And (Agent $e0 $x0) (Member $e0 $v0) (Theme $e0 $x1))

;; p200050  star  support 89 (occ 92)  size 2  lifted 0  nisurp 0.552  tiers tierB  dominated
;;   e.g. tierB-000018 tierB-000091 tierB-000101
(And (Agent $e0 $x0) (Theme $e0 $x1))

;; p200051  cross  support 87 (occ 112)  size 4  lifted 2  nisurp 0.186  tiers tierB
;;   e.g. tierB-000021 tierB-000047 tierB-000080
(And (Member $e0 $v0) (Member $x0 $v1) (Past $e0) (Theme $e0 $x0))

;; p200052  cross  support 87 (occ 112)  size 3  lifted 1  nisurp 0.186  tiers tierB  dominated
;;   e.g. tierB-000021 tierB-000047 tierB-000080
(And (Member $x0 $v0) (Past $e0) (Theme $e0 $x0))

;; p200053  cross  support 86 (occ 106)  size 3  lifted 2  nisurp 0.328  tiers tierB
;;   e.g. tierB-000008 tierB-000034 tierB-000036
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p200054  star  support 86 (occ 103)  size 2  lifted 1  nisurp 0.328  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000034 tierB-000036
(And (Location $e0 $x0) (Member $x0 $v0))

;; p200055  star  support 84 (occ 99)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000013 tierB-000015 tierB-000026
(And (Member $e0 $v0) (Theme $e0 $v1))

;; p200056  star  support 84 (occ 97)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000013 tierB-000015 tierB-000026
(Theme $e0 $v0)

;; p200057  star  support 77 (occ 84)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000012 tierB-000051 tierB-000100
(And (Member $e0 $v0) (Time $e0 $v1))

;; p200058  star  support 77 (occ 82)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000051 tierB-000100
(Time $e0 $v0)

;; p200059  star  support 75 (occ 76)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000023 tierB-000055 tierB-000080
(Member $x0 thing)

;; p200060  star  support 73 (occ 81)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000009 tierB-000044 tierB-000051
(Experiencer $e0 $v0)

;; p200061  star  support 72 (occ 83)  size 2  lifted 2  nisurp 0.466  tiers tierB
;;   e.g. tierB-000009 tierB-000044 tierB-000051
(And (Experiencer $e0 $v0) (Member $e0 $v1))

;; p200062  cross  support 70 (occ 78)  size 4  lifted 2  nisurp 0.210  tiers tierB
;;   e.g. tierB-000091 tierB-000101 tierB-000120
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x1))

;; p200063  cross  support 70 (occ 78)  size 3  lifted 1  nisurp 0.210  tiers tierB  dominated
;;   e.g. tierB-000091 tierB-000101 tierB-000120
(And (Agent $e0 $x0) (Member $x0 $v0) (Theme $e0 $x1))

;; p200064  cross  support 68 (occ 87)  size 4  lifted 2  nisurp 0.187  tiers tierB
;;   e.g. tierB-000091 tierB-000120 tierB-000145
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p200065  cross  support 68 (occ 87)  size 3  lifted 1  nisurp 0.187  tiers tierB  dominated
;;   e.g. tierB-000091 tierB-000120 tierB-000145
(And (Agent $e0 $x0) (Member $x1 $v0) (Theme $e0 $x1))

;; p200066  star  support 68 (occ 70)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000008 tierB-000058 tierB-000083
(Degree $x0 $v0 $v1)

;; p200067  star  support 67 (occ 71)  size 2  lifted 1  nisurp 0.242  tiers tierB
;;   e.g. tierB-000018 tierB-000066 tierB-000089
(And (GroupOf $x0 $v0) (Theme $e0 $x0))

;; p200068  cross  support 66 (occ 71)  size 3  lifted 2  nisurp 0.234  tiers tierB
;;   e.g. tierB-000018 tierB-000066 tierB-000089
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Theme $e0 $x0))

;; p200069  cross  support 66 (occ 73)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Member $e0 $v0) (Member $e1 $v1) (Theme $e0 $e1))

;; p200070  star  support 66 (occ 71)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Member $e0 $v0) (Theme $e0 $e1))

;; p200071  star  support 66 (occ 71)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Member $e0 $v0) (Theme $e1 $e0))

;; p200072  star  support 66 (occ 69)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(Theme $e0 $e1)

;; p200073  star  support 64 (occ 69)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000096 tierB-000098 tierB-000206
(And (Member $e0 $v0) (Patient $e0 $v1))

;; p200074  star  support 64 (occ 68)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000096 tierB-000098 tierB-000206
(Patient $e0 $v0)

;; p200075  cross  support 63 (occ 68)  size 3  lifted 2  nisurp 0.122  tiers tierB
;;   e.g. tierB-000004 tierB-000018 tierB-000034
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p200076  star  support 63 (occ 68)  size 2  lifted 1  nisurp 0.122  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000018 tierB-000034
(And (GroupOf $x0 $v0) (Patient $e0 $x0))

;; p200077  star  support 62 (occ 66)  size 2  lifted 3  nisurp 0.319  tiers tierB
;;   e.g. tierB-000008 tierB-000058 tierB-000083
(And (Degree $x0 $v0 $v1) (Member $x0 $v2))

;; p200078  star  support 61 (occ 64)  size 3  lifted 1  nisurp 0.288  tiers tierB
;;   e.g. tierB-000028 tierB-000063 tierB-000073
(And (Agent $e0 $x0) (Member $e0 $v0) (Patient $e0 $x1))

;; p200079  star  support 61 (occ 63)  size 2  lifted 0  nisurp 0.288  tiers tierB  dominated
;;   e.g. tierB-000028 tierB-000063 tierB-000073
(And (Agent $e0 $x0) (Patient $e0 $x1))

;; p200080  star  support 61 (occ 72)  size 2  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000019 tierB-000032 tierB-000116
(And (LocatedIn $x0 $x1) (Member $x1 $v0))

;; p200081  star  support 61 (occ 64)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000019 tierB-000032 tierB-000116
(LocatedIn $x0 $x1)

;; p200082  star  support 59 (occ 79)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000134 tierB-000167 tierB-000322
(Past (Member $x0 $v0))

;; p200083  star  support 58 (occ 64)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000008 tierB-000034 tierB-000045
(And (Location $e0 $x0) (Member $e0 $v0) (Past $e0))

;; p200084  star  support 58 (occ 63)  size 2  lifted 0  nisurp 0.532  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000034 tierB-000045
(And (Location $e0 $x0) (Past $e0))

;; p200085  star  support 56 (occ 57)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000028 tierB-000036 tierB-000098
(And (Agent $e0 $x0) (Member $e0 $v0) (Ongoing $e0))

;; p200086  star  support 56 (occ 56)  size 2  lifted 0  nisurp 0.579  tiers tierB  dominated
;;   e.g. tierB-000028 tierB-000036 tierB-000098
(And (Agent $e0 $x0) (Ongoing $e0))

;; p200087  cross  support 55 (occ 59)  size 4  lifted 2  nisurp 0.284  tiers tierB
;;   e.g. tierB-000018 tierB-000063 tierB-000097
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Past $e0))

;; p200088  cross  support 55 (occ 67)  size 4  lifted 2  nisurp 0.345  tiers tierB
;;   e.g. tierB-000008 tierB-000034 tierB-000045
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p200089  cross  support 55 (occ 59)  size 3  lifted 1  nisurp 0.284  tiers tierB  dominated
;;   e.g. tierB-000018 tierB-000063 tierB-000097
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Past $e0))

;; p200090  cross  support 55 (occ 66)  size 3  lifted 1  nisurp 0.345  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000034 tierB-000045
(And (Location $e0 $x0) (Member $x0 $v0) (Past $e0))

;; p200091  cross  support 52 (occ 66)  size 4  lifted 2  nisurp 0.272  tiers tierB
;;   e.g. tierB-000028 tierB-000063 tierB-000073
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Patient $e0 $x1))

;; p200092  cross  support 52 (occ 71)  size 4  lifted 2  nisurp 0.164  tiers tierB
;;   e.g. tierB-000091 tierB-000120 tierB-000145
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p200093  cross  support 52 (occ 55)  size 4  lifted 3  nisurp -0.576  tiers tierB
;;   e.g. tierB-000089 tierB-000137 tierB-000334
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Theme $e0 $x0))

;; p200094  cross  support 52 (occ 65)  size 3  lifted 1  nisurp 0.272  tiers tierB  dominated
;;   e.g. tierB-000028 tierB-000063 tierB-000073
(And (Agent $e0 $x0) (Member $x1 $v0) (Patient $e0 $x1))

;; p200095  star  support 52 (occ 55)  size 3  lifted 2  nisurp -0.195  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-000137 tierB-000334
(And (Member $x0 $v0) (Member $x0 $v1) (Theme $e0 $x0))

;; p200096  cross  support 50 (occ 58)  size 4  lifted 3  nisurp -0.519  tiers tierB
;;   e.g. tierB-000005 tierB-000056 tierB-000073
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p200097  star  support 50 (occ 58)  size 3  lifted 2  nisurp -0.088  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000056 tierB-000073
(And (Member $x0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p200098  star  support 49 (occ 52)  size 3  lifted 2  nisurp 0.456  tiers tierB
;;   e.g. tierB-000021 tierB-000047 tierB-000089
(And (Agent $e0 $v0) (Member $e0 $v1) (Theme $e0 $x0))

;; p200099  star  support 49 (occ 52)  size 3  lifted 2  nisurp 0.440  tiers tierB
;;   e.g. tierB-000001 tierB-000005 tierB-000012
(And (Manner $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p200100  star  support 49 (occ 52)  size 2  lifted 1  nisurp 0.456  tiers tierB  dominated
;;   e.g. tierB-000021 tierB-000047 tierB-000089
(And (Agent $e0 $v0) (Theme $e0 $x0))

;; p200101  star  support 49 (occ 52)  size 2  lifted 1  nisurp 0.440  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000005 tierB-000012
(And (Manner $e0 $v0) (Past $e0))

;; p200102  cross  support 48 (occ 53)  size 3  lifted 3  nisurp -0.152  tiers tierB
;;   e.g. tierB-000170 tierB-000189 tierB-000192
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Member $x0 $v0))

;; p200103  star  support 48 (occ 61)  size 3  lifted 2  nisurp -0.410  tiers tierB
;;   e.g. tierB-000261 tierB-000315 tierB-000362
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x0 $v1))

;; p200104  star  support 48 (occ 48)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000040 tierB-000111 tierB-000135
(And (Goal $e0 $x0) (Member $e0 $v0))

;; p200105  star  support 48 (occ 49)  size 2  lifted 2  nisurp 0.120  tiers tierB
;;   e.g. tierB-000008 tierB-000058 tierB-000083
(And (Degree $x0 $v0 $v1) (Member $x0 $v0))

;; p200106  star  support 48 (occ 48)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000040 tierB-000111 tierB-000135
(Goal $e0 $x0)

;; p200107  star  support 47 (occ 50)  size 3  lifted 3  nisurp 0.181  tiers tierB
;;   e.g. tierB-000008 tierB-000058 tierB-000083
(And (Degree $x0 $v0 $v1) (Member $x0 $v0) (Member $x0 $v2))

;; p200108  cross  support 46 (occ 57)  size 4  lifted 2  nisurp 0.176  tiers tierB
;;   e.g. tierB-000028 tierB-000073 tierB-000170
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x1))

;; p200109  cross  support 46 (occ 56)  size 3  lifted 1  nisurp 0.176  tiers tierB  dominated
;;   e.g. tierB-000028 tierB-000073 tierB-000170
(And (Agent $e0 $x0) (Member $x0 $v0) (Patient $e0 $x1))

;; p200110  star  support 46 (occ 47)  size 4  lifted 1  nisurp 0.435  tiers tierB
;;   e.g. tierB-000018 tierB-000091 tierB-000145
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e0) (Theme $e0 $x1))

;; p200111  star  support 46 (occ 47)  size 3  lifted 0  nisurp 0.435  tiers tierB  dominated
;;   e.g. tierB-000018 tierB-000091 tierB-000145
(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p200112  cross  support 45 (occ 49)  size 3  lifted 2  nisurp 0.338  tiers tierB
;;   e.g. tierB-000040 tierB-000111 tierB-000135
(And (Goal $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p200113  star  support 45 (occ 47)  size 2  lifted 1  nisurp 0.793  tiers tierB
;;   e.g. tierB-000101 tierB-000133 tierB-000267
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0))

;; p200114  star  support 45 (occ 49)  size 2  lifted 1  nisurp 0.338  tiers tierB  dominated
;;   e.g. tierB-000040 tierB-000111 tierB-000135
(And (Goal $e0 $x0) (Member $x0 $v0))

;; p200115  star  support 45 (occ 47)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000133 tierB-000267
(Cardinality $x0 <num>)

;; p200116  star  support 44 (occ 56)  size 2  lifted 2  nisurp 4.702  tiers tierB
;;   e.g. tierB-000004 tierB-000063 tierB-000089
(And (GroupOf $x0 $v0) (Member $x0 $v1))

;; p200117  star  support 44 (occ 60)  size 2  lifted 2  nisurp 0.167  tiers tierB
;;   e.g. tierB-000134 tierB-000167 tierB-000365
(And (Member $x0 $v0) (Past (Member $x0 $v1)))

;; p200118  cross  support 43 (occ 46)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Member $e0 $v0) (Member $e1 $v1) (Past $e0) (Theme $e0 $e1))

;; p200119  cross  support 43 (occ 46)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Member $e0 $v0) (Past $e1) (Theme $e1 $e0))

;; p200120  star  support 43 (occ 45)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Member $e0 $v0) (Past $e0) (Theme $e0 $e1))

;; p200121  star  support 43 (occ 45)  size 2  lifted 0  nisurp 0.552  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Past $e0) (Theme $e0 $e1))

;; p200122  cross  support 42 (occ 46)  size 2  lifted 1  nisurp 14.200  tiers tierB
;;   e.g. tierB-000004 tierB-000109 tierB-000315
(And (Member $e0 $v0) (Member $x0 $v0))

;; p200123  star  support 42 (occ 47)  size 3  lifted 1  nisurp 0.104  tiers tierB
;;   e.g. tierB-000124 tierB-000134 tierB-000191
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Past $e0))

;; p200124  star  support 42 (occ 46)  size 2  lifted 0  nisurp 0.104  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000134 tierB-000191
(And (Experiencer $e0 $x0) (Past $e0))

;; p200125  cross  support 41 (occ 45)  size 3  lifted 1  nisurp -0.932  tiers tierB
;;   e.g. tierB-000004 tierB-000315 tierB-000362
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v0))

;; p200126  cross  support 41 (occ 58)  size 2  lifted 2  nisurp 1.304  tiers tierB
;;   e.g. tierB-000005 tierB-000063 tierB-000097
(And (GroupOf $x0 $v0) (Inheritance $v0 $v1))

;; p200127  star  support 41 (occ 43)  size 4  lifted 1  nisurp 0.365  tiers tierB
;;   e.g. tierB-000063 tierB-000073 tierB-000170
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e0) (Patient $e0 $x1))

;; p200128  star  support 41 (occ 42)  size 3  lifted 0  nisurp 0.365  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000073 tierB-000170
(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $x1))

;; p200129  cross  support 39 (occ 58)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000028 tierB-000073 tierB-000170
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Patient $e0 $x1))

;; p200130  cross  support 39 (occ 50)  size 4  lifted 3  nisurp 0.220  tiers tierB
;;   e.g. tierB-000021 tierB-000047 tierB-000089
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Theme $e0 $x0))

;; p200131  cross  support 39 (occ 50)  size 3  lifted 2  nisurp 0.220  tiers tierB  dominated
;;   e.g. tierB-000021 tierB-000047 tierB-000089
(And (Agent $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0))

;; p200132  star  support 38 (occ 39)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000083 tierB-000172 tierB-000202
(PartOf $x0 $x1)

;; p200133  cross  support 37 (occ 38)  size 4  lifted 2  nisurp 0.154  tiers tierB
;;   e.g. tierB-000018 tierB-000034 tierB-000063
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Past $e0) (Patient $e0 $x0))

;; p200134  cross  support 37 (occ 38)  size 3  lifted 1  nisurp 0.154  tiers tierB  dominated
;;   e.g. tierB-000018 tierB-000034 tierB-000063
(And (GroupOf $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p200135  cross  support 37 (occ 90)  size 3  lifted 2  nisurp 0.377  tiers tierB
;;   e.g. tierB-000012 tierB-000030 tierB-000075
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1))

;; p200136  cross  support 37 (occ 45)  size 2  lifted 1  nisurp 0.377  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000030 tierB-000075
(And (Agent $e0 $v0) (Agent $e1 $v0))

;; p200137  star  support 37 (occ 37)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(And (Goal $e0 $x0) (Member $e0 $v0) (Past $e0))

;; p200138  star  support 37 (occ 39)  size 3  lifted 1  nisurp -0.143  tiers tierB
;;   e.g. tierB-000001 tierB-000008 tierB-000117
(And (Member $e0 $v0) (Ongoing $e0) (Past $e0))

;; p200139  star  support 37 (occ 43)  size 3  lifted 2  nisurp 0.393  tiers tierB
;;   e.g. tierB-000012 tierB-000132 tierB-000237
(And (Member $e0 $v0) (Past $e0) (Time $e0 $v1))

;; p200140  star  support 37 (occ 37)  size 2  lifted 0  nisurp 0.622  tiers tierB  dominated
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(And (Goal $e0 $x0) (Past $e0))

;; p200141  star  support 37 (occ 39)  size 2  lifted 0  nisurp 0.143  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000008 tierB-000117
(And (Ongoing $e0) (Past $e0))

;; p200142  star  support 37 (occ 41)  size 2  lifted 1  nisurp 0.393  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000132 tierB-000237
(And (Past $e0) (Time $e0 $v0))

;; p200143  cross  support 36 (occ 38)  size 4  lifted 1  nisurp 0.206  tiers tierB
;;   e.g. tierB-000091 tierB-000145 tierB-000340
(And (Agent $e0 $x0) (Member $x0 $v0) (Past $e0) (Theme $e0 $x1))

;; p200144  cross  support 36 (occ 51)  size 3  lifted 2  nisurp -0.052  tiers tierB
;;   e.g. tierB-000032 tierB-000141 tierB-000202
(And (LocatedIn $x0 $x1) (Member $x0 $v0) (Member $x1 $v1))

;; p200145  cross  support 36 (occ 41)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000004 tierB-000206 tierB-000228
(And (Member $e0 $v0) (Member $e1 $v1) (Result $e0 $e1))

;; p200146  star  support 36 (occ 47)  size 2  lifted 1  nisurp 0.052  tiers tierB  dominated
;;   e.g. tierB-000032 tierB-000141 tierB-000202
(And (LocatedIn $x0 $x1) (Member $x0 $v0))

;; p200147  star  support 36 (occ 38)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000206 tierB-000228
(And (Member $e0 $v0) (Result $e0 $e1))

;; p200148  star  support 36 (occ 41)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000206 tierB-000228
(And (Member $e0 $v0) (Result $e1 $e0))

;; p200149  star  support 36 (occ 38)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000206 tierB-000228
(Result $e0 $e1)

;; p200150  cross  support 35 (occ 40)  size 4  lifted 2  nisurp 0.006  tiers tierB
;;   e.g. tierB-000028 tierB-000036 tierB-000231
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Ongoing $e0))

;; p200151  cross  support 35 (occ 43)  size 4  lifted 2  nisurp -0.828  tiers tierB
;;   e.g. tierB-000315 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v0) (Member $x0 $v1))

;; p200152  cross  support 35 (occ 51)  size 4  lifted 2  nisurp 0.091  tiers tierB
;;   e.g. tierB-000134 tierB-000339 tierB-000411
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p200153  cross  support 35 (occ 40)  size 3  lifted 1  nisurp 0.006  tiers tierB  dominated
;;   e.g. tierB-000028 tierB-000036 tierB-000231
(And (Agent $e0 $x0) (Member $x0 $v0) (Ongoing $e0))

;; p200154  cross  support 35 (occ 51)  size 3  lifted 1  nisurp 0.091  tiers tierB  dominated
;;   e.g. tierB-000134 tierB-000339 tierB-000411
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Past $e0))

;; p200155  cross  support 35 (occ 43)  size 3  lifted 2  nisurp -0.255  tiers tierB  dominated
;;   e.g. tierB-000315 tierB-000362 tierB-000370
(And (Member $e0 $v0) (Member $x0 $v0) (Member $x0 $v1))

;; p200156  cross  support 35 (occ 47)  size 3  lifted 3  nisurp 1.225  tiers tierB
;;   e.g. tierB-000008 tierB-000342 tierB-000510
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Member $x0 $v2))

;; p200157  star  support 35 (occ 37)  size 3  lifted 1  nisurp 0.433  tiers tierB
;;   e.g. tierB-000028 tierB-000062 tierB-000154
(And (Member $e0 $v0) (Ongoing $e0) (Patient $e0 $x0))

;; p200158  star  support 35 (occ 37)  size 2  lifted 0  nisurp 0.433  tiers tierB  dominated
;;   e.g. tierB-000028 tierB-000062 tierB-000154
(And (Ongoing $e0) (Patient $e0 $x0))

;; p200159  star  support 35 (occ 35)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000066 tierB-000142 tierB-000162
(Member $e0 have)

;; p200160  cross  support 34 (occ 37)  size 4  lifted 2  nisurp 0.324  tiers tierB
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(And (Goal $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p200161  cross  support 34 (occ 37)  size 3  lifted 1  nisurp 0.324  tiers tierB  dominated
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(And (Goal $e0 $x0) (Member $x0 $v0) (Past $e0))

;; p200162  star  support 34 (occ 36)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000063 tierB-000197 tierB-000227
(Location $e0 $v0)

;; p200163  cross  support 33 (occ 40)  size 4  lifted 1  nisurp 0.228  tiers tierB
;;   e.g. tierB-000063 tierB-000073 tierB-000170
(And (Agent $e0 $x0) (Member $x1 $v0) (Past $e0) (Patient $e0 $x1))

;; p200164  cross  support 33 (occ 43)  size 4  lifted 1  nisurp 0.134  tiers tierB
;;   e.g. tierB-000091 tierB-000145 tierB-000340
(And (Agent $e0 $x0) (Member $x1 $v0) (Past $e0) (Theme $e0 $x1))

;; p200165  cross  support 33 (occ 40)  size 4  lifted 3  nisurp 0.302  tiers tierB
;;   e.g. tierB-000012 tierB-000030 tierB-000075
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Member $e1 $v2))

;; p200166  cross  support 33 (occ 45)  size 4  lifted 3  nisurp -0.509  tiers tierB
;;   e.g. tierB-000016 tierB-000170 tierB-000192
(And (Inheritance $v0 $v1) (Member $e0 $v2) (Member $x0 $v0) (Patient $e0 $x0))

;; p200167  cross  support 33 (occ 45)  size 3  lifted 2  nisurp -0.278  tiers tierB  dominated
;;   e.g. tierB-000016 tierB-000170 tierB-000192
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Patient $e0 $x0))

;; p200168  star  support 33 (occ 34)  size 4  lifted 2  nisurp 0.471  tiers tierB
;;   e.g. tierB-000021 tierB-000047 tierB-000089
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e0) (Theme $e0 $x0))

;; p200169  star  support 33 (occ 34)  size 3  lifted 1  nisurp 0.471  tiers tierB  dominated
;;   e.g. tierB-000021 tierB-000047 tierB-000089
(And (Agent $e0 $v0) (Past $e0) (Theme $e0 $x0))

;; p200170  star  support 33 (occ 34)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000001 tierB-000008 tierB-000013
(And (Agent $e0 $v0) (Member $e0 $v1) (Ongoing $e0))

;; p200171  star  support 33 (occ 33)  size 2  lifted 0  nisurp 0.867  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000066 tierB-000142 tierB-000162
(And (Member $e0 have) (Theme $e0 $x0))

;; p200172  star  support 33 (occ 34)  size 2  lifted 1  nisurp 0.522  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000008 tierB-000013
(And (Agent $e0 $v0) (Ongoing $e0))

;; p200173  star  support 33 (occ 37)  size 2  lifted 2  nisurp 0.457  tiers tierB
;;   e.g. tierB-000063 tierB-000197 tierB-000227
(And (Location $e0 $v0) (Member $e0 $v1))

;; p200174  kindlevel  support 32 (occ 38)  size 2  lifted 3  nisurp 0.695  tiers tierB
;;   e.g. tierB-000105 tierB-000186 tierB-000266
(And (Member $v0 $v1) (Member $v0 $v2))

;; p200175  star  support 32 (occ 32)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000082 tierB-000100 tierB-000108
(And (Future $e0) (Member $e0 $v0))

;; p200176  star  support 32 (occ 35)  size 2  lifted 1  nisurp 0.263  tiers tierB
;;   e.g. tierB-000083 tierB-000172 tierB-000202
(And (Member $x0 $v0) (PartOf $x1 $x0))

;; p200177  star  support 32 (occ 39)  size 2  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000122 tierB-000246 tierB-000423
(And (Member $x0 $v0) (Possession $x1 $x0))

;; p200178  star  support 32 (occ 32)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000082 tierB-000100 tierB-000108
(Future $e0)

;; p200179  star  support 32 (occ 32)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000122 tierB-000246 tierB-000423
(Possession $x0 $x1)

;; p200180  cross  support 31 (occ 39)  size 4  lifted 1  nisurp 0.179  tiers tierB
;;   e.g. tierB-000073 tierB-000170 tierB-000208
(And (Agent $e0 $x0) (Member $x0 $v0) (Past $e0) (Patient $e0 $x1))

;; p200181  star  support 31 (occ 33)  size 3  lifted 2  nisurp 0.313  tiers tierB
;;   e.g. tierB-000009 tierB-000061 tierB-000079
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p200182  star  support 31 (occ 32)  size 3  lifted 2  nisurp 0.398  tiers tierB
;;   e.g. tierB-000209 tierB-000228 tierB-000256
(And (Member $e0 $v0) (Past $e0) (Patient $e0 $v1))

;; p200183  star  support 31 (occ 33)  size 2  lifted 1  nisurp 0.313  tiers tierB  dominated
;;   e.g. tierB-000009 tierB-000061 tierB-000079
(And (Experiencer $e0 $v0) (Past $e0))

;; p200184  star  support 31 (occ 33)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000103 tierB-000138 tierB-000230
(And (Member $e0 $v0) (Source $e0 $x0))

;; p200185  star  support 31 (occ 41)  size 2  lifted 1  nisurp 0.239  tiers tierB
;;   e.g. tierB-000083 tierB-000172 tierB-000202
(And (Member $x0 $v0) (PartOf $x0 $x1))

;; p200186  star  support 31 (occ 32)  size 2  lifted 1  nisurp 0.398  tiers tierB  dominated
;;   e.g. tierB-000209 tierB-000228 tierB-000256
(And (Past $e0) (Patient $e0 $v0))

;; p200187  star  support 31 (occ 31)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000103 tierB-000138 tierB-000230
(Source $e0 $x0)

;; p200188  cross  support 30 (occ 43)  size 4  lifted 3  nisurp -0.465  tiers tierB
;;   e.g. tierB-000222 tierB-000281 tierB-000329
(And (Inheritance $v0 $v1) (Member $e0 $v2) (Member $x0 $v0) (Theme $e0 $x0))

;; p200189  cross  support 30 (occ 43)  size 3  lifted 2  nisurp -0.271  tiers tierB  dominated
;;   e.g. tierB-000222 tierB-000281 tierB-000329
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Theme $e0 $x0))

;; p200190  star  support 30 (occ 36)  size 3  lifted 2  nisurp 0.183  tiers tierB
;;   e.g. tierB-000029 tierB-000043 tierB-000111
(And (Member $e0 $v0) (Past $e0) (Theme $e0 $v1))

;; p200191  star  support 30 (occ 36)  size 2  lifted 1  nisurp 0.183  tiers tierB  dominated
;;   e.g. tierB-000029 tierB-000043 tierB-000111
(And (Past $e0) (Theme $e0 $v0))

;; p200192  star  support 30 (occ 33)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000040 tierB-000126 tierB-000191
(GroupOf $x0 person)

;; p200193  cross  support 29 (occ 49)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000030 tierB-000075
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Past $e0))

;; p200194  cross  support 29 (occ 49)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000012 tierB-000030 tierB-000075
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Past $e1))

;; p200195  cross  support 29 (occ 29)  size 4  lifted 2  nisurp 0.186  tiers tierB
;;   e.g. tierB-000018 tierB-000133 tierB-000162
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Past $e0) (Theme $e0 $x0))

;; p200196  cross  support 29 (occ 49)  size 3  lifted 1  nisurp 0.479  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000030 tierB-000075
(And (Agent $e0 $v0) (Agent $e1 $v0) (Past $e0))

;; p200197  cross  support 29 (occ 29)  size 3  lifted 1  nisurp 0.186  tiers tierB  dominated
;;   e.g. tierB-000018 tierB-000133 tierB-000162
(And (GroupOf $x0 $v0) (Past $e0) (Theme $e0 $x0))

;; p200198  cross  support 29 (occ 38)  size 3  lifted 2  nisurp 0.336  tiers tierB
;;   e.g. tierB-000103 tierB-000138 tierB-000230
(And (Member $e0 $v0) (Member $x0 $v1) (Source $e0 $x0))

;; p200199  cross  support 29 (occ 47)  size 3  lifted 2  nisurp 0.315  tiers tierB
;;   e.g. tierB-000122 tierB-000423 tierB-000501
(And (Member $x0 $v0) (Member $x1 $v1) (Possession $x0 $x1))

;; p200200  star  support 29 (occ 30)  size 3  lifted 2  nisurp -0.001  tiers tierB
;;   e.g. tierB-000004 tierB-000025 tierB-000056
(And (Agent $e0 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p200201  star  support 29 (occ 30)  size 2  lifted 1  nisurp 0.001  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000025 tierB-000056
(And (Agent $e0 $v0) (Patient $e0 $x0))

;; p200202  star  support 29 (occ 40)  size 2  lifted 1  nisurp 0.315  tiers tierB  dominated
;;   e.g. tierB-000122 tierB-000423 tierB-000501
(And (Member $x0 $v0) (Possession $x0 $x1))

;; p200203  star  support 29 (occ 34)  size 2  lifted 1  nisurp 0.336  tiers tierB  dominated
;;   e.g. tierB-000103 tierB-000138 tierB-000230
(And (Member $x0 $v0) (Source $e0 $x0))

;; p200204  star  support 29 (occ 30)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000146 tierB-000205 tierB-000262
(LocatedIn $x0 $v0)

;; p200205  cross  support 28 (occ 35)  size 4  lifted 2  nisurp 0.268  tiers tierB
;;   e.g. tierB-000021 tierB-000047 tierB-000089
(And (Agent $e0 $v0) (Member $x0 $v1) (Past $e0) (Theme $e0 $x0))

;; p200206  cross  support 28 (occ 33)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000019 tierB-000116 tierB-000153
(And (GroupOf $x0 $v0) (LocatedIn $x0 $x1) (Member $x1 $v1))

;; p200207  kindlevel  support 28 (occ 28)  size 1  lifted 3  nisurp —  tiers tierB
;;   e.g. tierB-000041 tierB-000072 tierB-000131
(Degree $v0 $v1 $v2)

;; p200208  star  support 28 (occ 29)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000005 tierB-000094 tierB-000194
(And (Manner $e0 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p200209  star  support 28 (occ 33)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000013 tierB-000026 tierB-000029
(And (Agent $e0 $v0) (Member $e0 $v1) (Theme $e0 $v2))

;; p200210  star  support 28 (occ 29)  size 2  lifted 1  nisurp 0.549  tiers tierB  dominated
;;   e.g. tierB-000019 tierB-000116 tierB-000153
(And (GroupOf $x0 $v0) (LocatedIn $x0 $x1))

;; p200211  star  support 28 (occ 29)  size 2  lifted 1  nisurp 0.540  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000094 tierB-000194
(And (Manner $e0 $v0) (Patient $e0 $x0))

;; p200212  star  support 28 (occ 33)  size 2  lifted 2  nisurp 0.674  tiers tierB  dominated
;;   e.g. tierB-000013 tierB-000026 tierB-000029
(And (Agent $e0 $v0) (Theme $e0 $v1))

;; p200213  cross  support 27 (occ 37)  size 4  lifted 2  nisurp 0.195  tiers tierB
;;   e.g. tierB-000028 tierB-000062 tierB-000154
(And (Member $e0 $v0) (Member $x0 $v1) (Ongoing $e0) (Patient $e0 $x0))

;; p200214  cross  support 27 (occ 74)  size 3  lifted 1  nisurp -0.473  tiers tierB
;;   e.g. tierB-000101 tierB-000258 tierB-000277
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0))

;; p200215  cross  support 27 (occ 37)  size 3  lifted 1  nisurp 0.195  tiers tierB  dominated
;;   e.g. tierB-000028 tierB-000062 tierB-000154
(And (Member $x0 $v0) (Ongoing $e0) (Patient $e0 $x0))

;; p200216  cross  support 27 (occ 30)  size 3  lifted 2  nisurp 0.010  tiers tierB
;;   e.g. tierB-000004 tierB-000040 tierB-000124
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1))

;; p200217  star  support 27 (occ 29)  size 3  lifted 1  nisurp 0.440  tiers tierB
;;   e.g. tierB-000036 tierB-000045 tierB-000121
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 $v0))

;; p200218  star  support 27 (occ 37)  size 2  lifted 0  nisurp 0.909  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000258 tierB-000277
(And (Agent $e0 $x0) (Agent $e1 $x0))

;; p200219  star  support 27 (occ 29)  size 2  lifted 0  nisurp 0.440  tiers tierB  dominated
;;   e.g. tierB-000036 tierB-000045 tierB-000121
(And (Agent $e0 $x0) (Location $e0 $x1))

;; p200220  star  support 27 (occ 30)  size 2  lifted 1  nisurp 0.010  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000040 tierB-000124
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0))

;; p200221  star  support 27 (occ 35)  size 2  lifted 2  nisurp 19.072  tiers tierB
;;   e.g. tierB-000092 tierB-000282 tierB-000489
(And (Member $e0 $v0) (Member $e0 $v1))

;; p200222  cross  support 26 (occ 31)  size 4  lifted 2  nisurp 0.321  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e1 $v1) (Patient $e1 $x0))

;; p200223  cross  support 26 (occ 52)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Member $x0 $v1) (Patient $e1 $x0))

;; p200224  cross  support 26 (occ 27)  size 4  lifted 2  nisurp -0.488  tiers tierB
;;   e.g. tierB-000005 tierB-000056 tierB-000073
(And (Member $x0 $v0) (Member $x0 $v1) (Past $e0) (Patient $e0 $x0))

;; p200225  cross  support 26 (occ 31)  size 3  lifted 1  nisurp 0.321  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Patient $e1 $x0))

;; p200226  cross  support 26 (occ 29)  size 3  lifted 1  nisurp 0.321  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Patient $e1 $x0))

;; p200227  star  support 26 (occ 52)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Patient $e1 $x0))

;; p200228  star  support 26 (occ 27)  size 3  lifted 2  nisurp 0.412  tiers tierB
;;   e.g. tierB-000049 tierB-000238 tierB-000268
(And (Agent $e0 $x0) (Manner $e0 $v0) (Member $e0 $v1))

;; p200229  star  support 26 (occ 29)  size 2  lifted 0  nisurp 0.321  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Patient $e1 $x0))

;; p200230  star  support 26 (occ 27)  size 2  lifted 1  nisurp 0.412  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-000238 tierB-000268
(And (Agent $e0 $x0) (Manner $e0 $v0))

;; p200231  star  support 26 (occ 26)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000037 tierB-000080 tierB-000144
(And (Member $e0 $v0) (Obligated $e0))

;; p200232  star  support 26 (occ 26)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000037 tierB-000080 tierB-000144
(Obligated $e0)

;; p200233  cross  support 25 (occ 27)  size 4  lifted 2  nisurp 0.262  tiers tierB
;;   e.g. tierB-000018 tierB-000101 tierB-000120
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Member $e0 $v1) (Theme $e0 $x1))

;; p200234  cross  support 25 (occ 32)  size 4  lifted 2  nisurp 0.329  tiers tierB
;;   e.g. tierB-000036 tierB-000045 tierB-000121
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 $v0) (Member $x1 $v1))

;; p200235  cross  support 25 (occ 34)  size 4  lifted 3  nisurp -0.473  tiers tierB
;;   e.g. tierB-000156 tierB-000208 tierB-000231
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p200236  cross  support 25 (occ 27)  size 3  lifted 1  nisurp 0.262  tiers tierB  dominated
;;   e.g. tierB-000018 tierB-000101 tierB-000120
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Theme $e0 $x1))

;; p200237  cross  support 25 (occ 32)  size 3  lifted 1  nisurp 0.329  tiers tierB  dominated
;;   e.g. tierB-000036 tierB-000045 tierB-000121
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 $v0))

;; p200238  cross  support 25 (occ 30)  size 2  lifted 2  nisurp 0.793  tiers tierB
;;   e.g. tierB-000044 tierB-000051 tierB-000203
(And (Experiencer $e0 $v0) (Member $v0 $v1))

;; p200239  star  support 25 (occ 27)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000008 tierB-000036 tierB-000096
(And (Location $e0 $x0) (Member $e0 $v0) (Ongoing $e0))

;; p200240  star  support 25 (occ 33)  size 3  lifted 2  nisurp 1.165  tiers tierB  dominated
;;   e.g. tierB-000156 tierB-000208 tierB-000231
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x0 $v1))

;; p200241  star  support 25 (occ 29)  size 3  lifted 3  nisurp 7.272  tiers tierB
;;   e.g. tierB-000165 tierB-000208 tierB-000391
(And (Member $x0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p200242  star  support 25 (occ 27)  size 2  lifted 0  nisurp 0.723  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000036 tierB-000096
(And (Location $e0 $x0) (Ongoing $e0))

;; p200243  cross  support 24 (occ 30)  size 4  lifted 2  nisurp -0.687  tiers tierB
;;   e.g. tierB-000258 tierB-000277 tierB-000470
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Member $e1 $v1))

;; p200244  cross  support 24 (occ 25)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000098 tierB-000225 tierB-000274
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Ongoing $e0))

;; p200245  cross  support 24 (occ 25)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000288 tierB-000470 tierB-000485
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 $v1) (Theme $e0 $e1))

;; p200246  cross  support 24 (occ 34)  size 4  lifted 3  nisurp -0.473  tiers tierB
;;   e.g. tierB-000268 tierB-000688 tierB-000715
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $e0 $v2) (Member $x0 $v0))

;; p200247  cross  support 24 (occ 24)  size 3  lifted 1  nisurp 0.517  tiers tierB  dominated
;;   e.g. tierB-000098 tierB-000225 tierB-000274
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Ongoing $e0))

;; p200248  cross  support 24 (occ 25)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000288 tierB-000470 tierB-000485
(And (Agent $e0 $x0) (Member $e1 $v0) (Theme $e0 $e1))

;; p200249  cross  support 24 (occ 32)  size 3  lifted 2  nisurp 0.031  tiers tierB
;;   e.g. tierB-000004 tierB-000025 tierB-000056
(And (Agent $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p200250  cross  support 24 (occ 34)  size 3  lifted 2  nisurp 0.179  tiers tierB  dominated
;;   e.g. tierB-000268 tierB-000688 tierB-000715
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0))

;; p200251  cross  support 24 (occ 26)  size 3  lifted 2  nisurp 0.451  tiers tierB
;;   e.g. tierB-000044 tierB-000051 tierB-000203
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $v0 $v1))

;; p200252  cross  support 24 (occ 28)  size 2  lifted 2  nisurp 2.031  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-000051 tierB-000203
(And (Member $e0 $v1) (Member $v0 $v1))

;; p200253  kindlevel  support 24 (occ 30)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000011 tierB-000079 tierB-000276
(Past (Member $v0 $v1))

;; p200254  star  support 24 (occ 24)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000288 tierB-000470 tierB-000485
(And (Agent $e0 $x0) (Member $e0 $v0) (Theme $e0 $e1))

;; p200255  star  support 24 (occ 28)  size 3  lifted 2  nisurp 0.431  tiers tierB
;;   e.g. tierB-000231 tierB-000236 tierB-000268
(And (Agent $e0 $x0) (Member $e0 $v0) (Theme $e0 $v1))

;; p200256  star  support 24 (occ 24)  size 2  lifted 0  nisurp 0.553  tiers tierB  dominated
;;   e.g. tierB-000288 tierB-000470 tierB-000485
(And (Agent $e0 $x0) (Theme $e0 $e1))

;; p200257  star  support 24 (occ 28)  size 2  lifted 1  nisurp 0.431  tiers tierB  dominated
;;   e.g. tierB-000231 tierB-000236 tierB-000268
(And (Agent $e0 $x0) (Theme $e0 $v0))

;; p200258  star  support 24 (occ 30)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000012 tierB-000018 tierB-000029
(And (Goal $e0 $v0) (Member $e0 $v1))

;; p200259  star  support 24 (occ 29)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000018 tierB-000029
(Goal $e0 $v0)

;; p200260  cross  support 23 (occ 44)  size 4  lifted 1  nisurp -0.343  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-000277 tierB-000470
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Past $e0))

;; p200261  cross  support 23 (occ 44)  size 4  lifted 1  nisurp -0.343  tiers tierB
;;   e.g. tierB-000258 tierB-000277 tierB-000470
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Past $e1))

;; p200262  cross  support 23 (occ 26)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v0) (Result $e1 $e0))

;; p200263  cross  support 23 (occ 27)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e1 $v1) (Result $e1 $e0))

;; p200264  cross  support 23 (occ 47)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Member $x0 $v1) (Result $e1 $e0))

;; p200265  cross  support 23 (occ 30)  size 4  lifted 2  nisurp -0.190  tiers tierB
;;   e.g. tierB-000170 tierB-000192 tierB-000249
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p200266  cross  support 23 (occ 26)  size 4  lifted 2  nisurp 0.028  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Member $e0 $v0) (Member $e1 $v1) (Member $x0 $v0) (Result $e1 $e0))

;; p200267  cross  support 23 (occ 25)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Member $e0 $v0) (Member $e1 $v1) (Past $e0) (Result $e0 $e1))

;; p200268  cross  support 23 (occ 28)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000008 tierB-000047 tierB-000048
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $e0 $v1) (Member $x0 $v2))

;; p200269  cross  support 23 (occ 31)  size 4  lifted 3  nisurp -0.011  tiers tierB
;;   e.g. tierB-000004 tierB-000025 tierB-000056
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p200270  cross  support 23 (occ 44)  size 3  lifted 0  nisurp -0.343  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-000277 tierB-000470
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0))

;; p200271  cross  support 23 (occ 25)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Result $e1 $e0))

;; p200272  cross  support 23 (occ 47)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Result $e1 $e0))

;; p200273  cross  support 23 (occ 26)  size 3  lifted 1  nisurp 0.028  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Member $e0 $v0) (Member $x0 $v0) (Result $e1 $e0))

;; p200274  cross  support 23 (occ 25)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Member $e0 $v0) (Past $e1) (Result $e1 $e0))

;; p200275  cross  support 23 (occ 28)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000047 tierB-000048
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $x0 $v1))

;; p200276  cross  support 23 (occ 36)  size 3  lifted 2  nisurp 0.136  tiers tierB
;;   e.g. tierB-000083 tierB-000172 tierB-000202
(And (Member $x0 $v0) (Member $x1 $v1) (PartOf $x0 $x1))

;; p200277  cross  support 23 (occ 33)  size 2  lifted 1  nisurp 22.563  tiers tierB
;;   e.g. tierB-000012 tierB-000030 tierB-000044
(And (Member $e0 $v0) (Member $e1 $v0))

;; p200278  star  support 23 (occ 23)  size 3  lifted 0  nisurp 0.874  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Member $e0 have) (Theme $e0 $x1))

;; p200279  star  support 23 (occ 27)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Result $e1 $e0))

;; p200280  star  support 23 (occ 23)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Member $e0 $v0) (Theme $e0 $x1))

;; p200281  star  support 23 (occ 23)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Member $e0 $v0) (Past $e0) (Result $e0 $e1))

;; p200282  star  support 23 (occ 23)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000047 tierB-000048
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $e0 $v1))

;; p200283  star  support 23 (occ 25)  size 2  lifted 0  nisurp 0.896  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Result $e1 $e0))

;; p200284  star  support 23 (occ 23)  size 2  lifted 0  nisurp 0.982  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Member $e0 have))

;; p200285  star  support 23 (occ 23)  size 2  lifted 0  nisurp 0.874  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Theme $e0 $x1))

;; p200286  star  support 23 (occ 23)  size 2  lifted 0  nisurp 0.543  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Past $e0) (Result $e0 $e1))

;; p200287  star  support 23 (occ 23)  size 2  lifted 1  nisurp 0.560  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000047 tierB-000048
(And (Agent $e0 $v0) (Location $e0 $x0))

;; p200288  star  support 23 (occ 23)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Member $e0 $v0))

;; p200289  star  support 23 (occ 23)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(Holder $e0 $x0)

;; p200290  star  support 23 (occ 25)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000040 tierB-000086 tierB-000139
(Possession $x0 $v0)

;; p200291  cross  support 22 (occ 26)  size 4  lifted 1  nisurp 0.266  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v0) (Patient $e1 $x0))

;; p200292  cross  support 22 (occ 26)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Patient $e1 $x0) (Result $e1 $e0))

;; p200293  cross  support 22 (occ 24)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Patient $e1 $x0) (Result $e1 $e0))

;; p200294  cross  support 22 (occ 44)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Patient $e1 $x0) (Result $e1 $e0))

;; p200295  cross  support 22 (occ 24)  size 4  lifted 1  nisurp 0.351  tiers tierB  signal conj-pattern
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Member $e0 have) (Member $x0 $v0) (Theme $e0 $x1))

;; p200296  cross  support 22 (occ 25)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Member $e0 $v0) (Member $x0 $v0) (Patient $e1 $x0) (Result $e1 $e0))

;; p200297  cross  support 22 (occ 31)  size 4  lifted 2  nisurp 0.266  tiers tierB
;;   e.g. tierB-000362 tierB-000370 tierB-000425
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Patient $e1 $x0))

;; p200298  cross  support 22 (occ 24)  size 4  lifted 2  nisurp 0.351  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x1))

;; p200299  cross  support 22 (occ 26)  size 4  lifted 2  nisurp -0.862  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Member $e0 $v0) (Member $e1 $v1) (Member $x0 $v0) (Patient $e1 $x0))

;; p200300  cross  support 22 (occ 23)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Member $e0 $v0) (Member $e1 $v1) (Ongoing $e0) (Theme $e1 $e0))

;; p200301  cross  support 22 (occ 26)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Member $e0 $v0) (Member $e1 $v1) (Patient $e0 $x0) (Result $e0 $e1))

;; p200302  cross  support 22 (occ 44)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Result $e0 $e1))

;; p200303  cross  support 22 (occ 25)  size 4  lifted 3  nisurp 0.266  tiers tierB
;;   e.g. tierB-000049 tierB-000238 tierB-000268
(And (Agent $e0 $x0) (Manner $e0 $v0) (Member $e0 $v1) (Member $x0 $v2))

;; p200304  cross  support 22 (occ 26)  size 4  lifted 3  nisurp 0.210  tiers tierB
;;   e.g. tierB-000005 tierB-000094 tierB-000389
(And (Manner $e0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p200305  cross  support 22 (occ 24)  size 3  lifted 0  nisurp 0.857  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Experiencer $e0 $x0) (Patient $e1 $x0) (Result $e1 $e0))

;; p200306  cross  support 22 (occ 24)  size 3  lifted 1  nisurp 0.351  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Member $e0 have) (Member $x0 $v0))

;; p200307  cross  support 22 (occ 24)  size 3  lifted 1  nisurp 0.351  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Member $x0 $v0) (Theme $e0 $x1))

;; p200308  cross  support 22 (occ 26)  size 3  lifted 1  nisurp -0.739  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Member $e0 $v0) (Member $x0 $v0) (Patient $e1 $x0))

;; p200309  cross  support 22 (occ 22)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Member $e0 $v0) (Ongoing $e1) (Theme $e0 $e1))

;; p200310  cross  support 22 (occ 26)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Member $e0 $v0) (Patient $e1 $x0) (Result $e1 $e0))

;; p200311  cross  support 22 (occ 39)  size 3  lifted 1  nisurp 0.069  tiers tierB  signal conj-pattern
;;   e.g. tierB-000358 tierB-000408 tierB-000492
(And (Member $e0 have) (Member $x0 $v0) (Theme $e0 $x0))

;; p200312  cross  support 22 (occ 44)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Member $x0 $v0) (Patient $e0 $x0) (Result $e0 $e1))

;; p200313  cross  support 22 (occ 25)  size 3  lifted 2  nisurp 0.266  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-000238 tierB-000268
(And (Agent $e0 $x0) (Manner $e0 $v0) (Member $x0 $v1))

;; p200314  cross  support 22 (occ 24)  size 3  lifted 2  nisurp 0.351  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p200315  cross  support 22 (occ 26)  size 3  lifted 2  nisurp 0.210  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000094 tierB-000389
(And (Manner $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p200316  cross  support 22 (occ 22)  size 2  lifted 1  nisurp 33.185  tiers tierB
;;   e.g. tierB-000024 tierB-000054 tierB-000088
(And (Member $x0 $v0) (Member $x1 $v0))

;; p200317  kindlevel  support 22 (occ 25)  size 3  lifted 4  nisurp 0.134  tiers tierB
;;   e.g. tierB-000068 tierB-000184 tierB-000430
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Inheritance $v0 $v3))

;; p200318  kindlevel  support 22 (occ 27)  size 2  lifted 3  nisurp 0.766  tiers tierB
;;   e.g. tierB-000038 tierB-000099 tierB-000151
(And (Inheritance $v0 $v1) (Patient $v0 $v2))

;; p200319  kindlevel  support 22 (occ 24)  size 1  lifted 2  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000038 tierB-000099 tierB-000151
(Patient $v0 $v1)

;; p200320  star  support 22 (occ 23)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Member $e0 $v0) (Ongoing $e0) (Theme $e1 $e0))

;; p200321  star  support 22 (occ 24)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Member $e0 $v0) (Patient $e0 $x0) (Result $e0 $e1))

;; p200322  star  support 22 (occ 22)  size 2  lifted 0  nisurp 0.777  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Ongoing $e0) (Theme $e1 $e0))

;; p200323  star  support 22 (occ 24)  size 2  lifted 0  nisurp 0.776  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000362 tierB-000370
(And (Patient $e0 $x0) (Result $e0 $e1))

;; p200324  star  support 22 (occ 24)  size 2  lifted 1  nisurp 0.351  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000408 tierB-000492
(And (Holder $e0 $x0) (Member $x0 $v0))

;; p200325  star  support 22 (occ 22)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000025 tierB-000073 tierB-000173
(Member $e0 make)

;; p200326  cross  support 21 (occ 25)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Theme $e0 $e1))

;; p200327  cross  support 21 (occ 25)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Agent $e0 $v0) (Member $e1 $v1) (Theme $e0 $e1))

;; p200328  kindlevel  support 21 (occ 24)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000038 tierB-000197 tierB-000276
(Inheritance $v0 (can $v1))

;; p200329  star  support 21 (occ 25)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Agent $e0 $v0) (Member $e0 $v1) (Theme $e0 $e1))

;; p200330  star  support 21 (occ 25)  size 2  lifted 1  nisurp 0.658  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Agent $e0 $v0) (Theme $e0 $e1))

;; p200331  cross  support 20 (occ 22)  size 4  lifted 2  nisurp 0.078  tiers tierB
;;   e.g. tierB-000018 tierB-000101 tierB-000258
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Theme $e0 $x1))

;; p200332  cross  support 20 (occ 23)  size 4  lifted 2  nisurp 0.224  tiers tierB
;;   e.g. tierB-000101 tierB-000120 tierB-000339
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Member $x0 $v1) (Theme $e0 $x1))

;; p200333  cross  support 20 (occ 21)  size 4  lifted 2  nisurp 0.464  tiers tierB
;;   e.g. tierB-000160 tierB-000166 tierB-000339
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 $v1) (Theme $e1 $e0))

;; p200334  cross  support 20 (occ 26)  size 4  lifted 2  nisurp 0.224  tiers tierB
;;   e.g. tierB-000008 tierB-000036 tierB-000096
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Ongoing $e0))

;; p200335  cross  support 20 (occ 22)  size 3  lifted 1  nisurp 0.078  tiers tierB  dominated
;;   e.g. tierB-000018 tierB-000101 tierB-000258
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Theme $e0 $x1))

;; p200336  cross  support 20 (occ 21)  size 3  lifted 1  nisurp 0.464  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000166 tierB-000339
(And (Agent $e0 $x0) (Member $e1 $v0) (Theme $e1 $e0))

;; p200337  cross  support 20 (occ 26)  size 3  lifted 1  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000036 tierB-000096
(And (Location $e0 $x0) (Member $x0 $v0) (Ongoing $e0))

;; p200338  cross  support 20 (occ 20)  size 2  lifted 1  nisurp 3.185  tiers tierB
;;   e.g. tierB-000124 tierB-000133 tierB-000196
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0))

;; p200339  kindlevel  support 20 (occ 21)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000031 tierB-000186 tierB-000289
(Possession $v0 $v1)

;; p200340  star  support 20 (occ 24)  size 4  lifted 2  nisurp 0.193  tiers tierB
;;   e.g. tierB-000362 tierB-000370 tierB-000425
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Patient $e1 $x0))

;; p200341  star  support 20 (occ 21)  size 3  lifted 1  nisurp 0.464  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000166 tierB-000339
(And (Agent $e0 $x0) (Member $e0 $v0) (Theme $e1 $e0))

;; p200342  star  support 20 (occ 22)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000001 tierB-000012 tierB-000053
(And (Agent $e0 $v0) (Manner $e0 $v1) (Member $e0 $v2))

;; p200343  star  support 20 (occ 21)  size 2  lifted 0  nisurp 0.464  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000166 tierB-000339
(And (Agent $e0 $x0) (Theme $e1 $e0))

;; p200344  star  support 20 (occ 22)  size 2  lifted 2  nisurp 0.489  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000012 tierB-000053
(And (Agent $e0 $v0) (Manner $e0 $v1))

;; p200345  star  support 20 (occ 31)  size 2  lifted 2  nisurp 0.286  tiers tierB
;;   e.g. tierB-000086 tierB-000139 tierB-000292
(And (Member $x0 $v0) (Possession $x0 $v1))

;; p200346  cross  support 19 (occ 68)  size 4  lifted 2  nisurp -0.535  tiers tierB
;;   e.g. tierB-000101 tierB-000470 tierB-000628
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p200347  cross  support 19 (occ 22)  size 4  lifted 2  nisurp 0.117  tiers tierB
;;   e.g. tierB-000036 tierB-000045 tierB-000121
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 $v0) (Member $x0 $v1))

;; p200348  cross  support 19 (occ 26)  size 4  lifted 2  nisurp 0.248  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000370 tierB-000425
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Result $e1 $e0))

;; p200349  cross  support 19 (occ 24)  size 4  lifted 2  nisurp 0.248  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000370 tierB-000425
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Result $e1 $e0))

;; p200350  cross  support 19 (occ 24)  size 4  lifted 2  nisurp 0.248  tiers tierB
;;   e.g. tierB-000362 tierB-000370 tierB-000425
(And (Member $e0 $v0) (Member $x0 $v0) (Member $x0 $v1) (Result $e1 $e0))

;; p200351  cross  support 19 (occ 23)  size 4  lifted 3  nisurp 0.215  tiers tierB
;;   e.g. tierB-000231 tierB-000236 tierB-000268
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $v2))

;; p200352  cross  support 19 (occ 22)  size 3  lifted 1  nisurp 0.117  tiers tierB  dominated
;;   e.g. tierB-000036 tierB-000045 tierB-000121
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 $v0))

;; p200353  cross  support 19 (occ 23)  size 3  lifted 2  nisurp 0.215  tiers tierB  dominated
;;   e.g. tierB-000231 tierB-000236 tierB-000268
(And (Agent $e0 $x0) (Member $x0 $v0) (Theme $e0 $v1))

;; p200354  cross  support 19 (occ 31)  size 3  lifted 3  nisurp -0.034  tiers tierB
;;   e.g. tierB-000015 tierB-000043 tierB-000118
(And (Inheritance $v0 $v1) (Member $e0 $v2) (Theme $e0 $v0))

;; p200355  cross  support 19 (occ 29)  size 2  lifted 2  nisurp 0.034  tiers tierB  dominated
;;   e.g. tierB-000015 tierB-000043 tierB-000118
(And (Inheritance $v0 $v1) (Theme $e0 $v0))

;; p200356  kindlevel  support 19 (occ 29)  size 2  lifted 3  nisurp 0.699  tiers tierB
;;   e.g. tierB-000110 tierB-000177 tierB-000382
(And (Inheritance $v0 $v1) (Member $v2 $v0))

;; p200357  star  support 19 (occ 34)  size 3  lifted 1  nisurp -0.117  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000470 tierB-000628
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 $v0))

;; p200358  star  support 19 (occ 19)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000103 tierB-000138 tierB-000338
(And (Member $e0 $v0) (Past $e0) (Source $e0 $x0))

;; p200359  star  support 19 (occ 19)  size 2  lifted 0  nisurp 0.524  tiers tierB  dominated
;;   e.g. tierB-000103 tierB-000138 tierB-000338
(And (Past $e0) (Source $e0 $x0))

;; p200360  star  support 19 (occ 19)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000025 tierB-000156 tierB-000299
(And (Can $e0) (Member $e0 $v0))

;; p200361  star  support 19 (occ 19)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000025 tierB-000156 tierB-000299
(Can $e0)

;; p200362  star  support 19 (occ 19)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000043 tierB-000192 tierB-000199
(Member $e0 start)

;; p200363  cross  support 18 (occ 23)  size 4  lifted 2  nisurp -0.802  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000370 tierB-000425
(And (Member $e0 $v0) (Member $x0 $v0) (Member $x0 $v1) (Patient $e1 $x0))

;; p200364  cross  support 18 (occ 20)  size 4  lifted 2  nisurp 0.344  tiers tierB
;;   e.g. tierB-000103 tierB-000138 tierB-000338
(And (Member $e0 $v0) (Member $x0 $v1) (Past $e0) (Source $e0 $x0))

;; p200365  cross  support 18 (occ 24)  size 4  lifted 2  nisurp 0.241  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000370 tierB-000425
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e1 $x0) (Result $e1 $e0))

;; p200366  cross  support 18 (occ 21)  size 4  lifted 2  nisurp -0.322  tiers tierB
;;   e.g. tierB-000089 tierB-000334 tierB-000367
(And (Member $x0 $v0) (Member $x0 $v1) (Past $e0) (Theme $e0 $x0))

;; p200367  cross  support 18 (occ 21)  size 4  lifted 2  nisurp 0.241  tiers tierB
;;   e.g. tierB-000362 tierB-000370 tierB-000425
(And (Member $x0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Result $e0 $e1))

;; p200368  cross  support 18 (occ 20)  size 3  lifted 1  nisurp 0.344  tiers tierB  dominated
;;   e.g. tierB-000103 tierB-000138 tierB-000338
(And (Member $x0 $v0) (Past $e0) (Source $e0 $x0))

;; p200369  cross  support 18 (occ 19)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Member $e0 $v0) (Member $e1 $v1) (To $e0 $e1))

;; p200370  star  support 18 (occ 26)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000134 tierB-000411 tierB-000565
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Past (Member $x0 $v1)))

;; p200371  star  support 18 (occ 18)  size 3  lifted 2  nisurp 0.414  tiers tierB
;;   e.g. tierB-000108 tierB-000378 tierB-000389
(And (Member $e0 $v0) (Patient $e0 $x0) (Time $e0 $v1))

;; p200372  star  support 18 (occ 18)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000008 tierB-000058 tierB-000085
(And (Degree $x0 $v0 very) (Member $x0 $v0))

;; p200373  star  support 18 (occ 20)  size 2  lifted 1  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000134 tierB-000411 tierB-000565
(And (Experiencer $e0 $x0) (Past (Member $x0 $v0)))

;; p200374  star  support 18 (occ 18)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000009 tierB-000114 tierB-000174
(And (Member $e0 $v0) (Stimulus $e0 $x0))

;; p200375  star  support 18 (occ 19)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Member $e0 $v0) (To $e0 $e1))

;; p200376  star  support 18 (occ 18)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Member $e0 $v0) (To $e1 $e0))

;; p200377  star  support 18 (occ 18)  size 2  lifted 1  nisurp 0.414  tiers tierB  dominated
;;   e.g. tierB-000108 tierB-000378 tierB-000389
(And (Patient $e0 $x0) (Time $e0 $v0))

;; p200378  star  support 18 (occ 18)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000009 tierB-000114 tierB-000174
(Stimulus $e0 $x0)

;; p200379  star  support 18 (occ 18)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(To $e0 $e1)

;; p200380  star  support 18 (occ 18)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000058 tierB-000085
(Degree $x0 $v0 very)

;; p200381  cross  support 17 (occ 18)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Member $e0 $v0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))

;; p200382  cross  support 17 (occ 17)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Member $e0 $v0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))

;; p200383  cross  support 17 (occ 20)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000008 tierB-000047 tierB-000125
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $x0 $v1) (Past $e0))

;; p200384  cross  support 17 (occ 20)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Agent $e0 $v0) (Member $e1 $v1) (Past $e0) (Theme $e0 $e1))

;; p200385  cross  support 17 (occ 23)  size 4  lifted 2  nisurp 0.087  tiers tierB
;;   e.g. tierB-000036 tierB-000045 tierB-000121
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 $v0) (Member $x1 $v1))

;; p200386  cross  support 17 (occ 19)  size 4  lifted 2  nisurp -0.600  tiers tierB
;;   e.g. tierB-000555 tierB-000768 tierB-001032
(And (Agent $e0 $x0) (Member $x1 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p200387  cross  support 17 (occ 24)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000134 tierB-000411 tierB-000565
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Past $e0) (Past (Member $x0 $v1)))

;; p200388  cross  support 17 (occ 17)  size 4  lifted 2  nisurp 0.196  tiers tierB  signal conj-pattern
;;   e.g. tierB-000358 tierB-000408 tierB-000665
(And (Member $e0 have) (Member $x0 $v0) (Member $x0 $v1) (Theme $e0 $x0))

;; p200389  cross  support 17 (occ 24)  size 4  lifted 3  nisurp -0.317  tiers tierB
;;   e.g. tierB-000261 tierB-000596 tierB-000602
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p200390  cross  support 17 (occ 17)  size 3  lifted 0  nisurp 0.622  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Ongoing $e0) (Past $e1) (Theme $e1 $e0))

;; p200391  cross  support 17 (occ 19)  size 3  lifted 1  nisurp 0.691  tiers tierB  dominated
;;   e.g. tierB-000134 tierB-000411 tierB-000565
(And (Experiencer $e0 $x0) (Past $e0) (Past (Member $x0 $v0)))

;; p200392  cross  support 17 (occ 19)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $e0 $v2) (Member $v0 $v1) (Patient $e0 $v0))

;; p200393  cross  support 17 (occ 19)  size 2  lifted 2  nisurp 0.734  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $v0 $v1) (Patient $e0 $v0))

;; p200394  star  support 17 (occ 17)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000047 tierB-000125
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $e0 $v1) (Past $e0))

;; p200395  star  support 17 (occ 20)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e0) (Theme $e0 $e1))

;; p200396  star  support 17 (occ 18)  size 4  lifted 2  nisurp 0.461  tiers tierB
;;   e.g. tierB-000049 tierB-000238 tierB-000345
(And (Agent $e0 $x0) (Manner $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p200397  star  support 17 (occ 17)  size 3  lifted 1  nisurp 0.605  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000047 tierB-000125
(And (Agent $e0 $v0) (Location $e0 $x0) (Past $e0))

;; p200398  star  support 17 (occ 20)  size 3  lifted 1  nisurp 0.639  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000087
(And (Agent $e0 $v0) (Past $e0) (Theme $e0 $e1))

;; p200399  star  support 17 (occ 18)  size 3  lifted 1  nisurp 0.461  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-000238 tierB-000345
(And (Agent $e0 $x0) (Manner $e0 $v0) (Past $e0))

;; p200400  star  support 17 (occ 17)  size 3  lifted 2  nisurp 0.342  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000008 tierB-000058 tierB-000085
(And (Degree $x0 $v0 very) (Member $x0 $v0) (Member $x0 $v1))

;; p200401  star  support 17 (occ 17)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000001 tierB-000075 tierB-000144
(And (Manner $e0 $v0) (Member $e0 $v1) (Ongoing $e0))

;; p200402  star  support 17 (occ 17)  size 2  lifted 1  nisurp 0.589  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000075 tierB-000144
(And (Manner $e0 $v0) (Ongoing $e0))

;; p200403  star  support 17 (occ 17)  size 2  lifted 1  nisurp 0.305  tiers tierB
;;   e.g. tierB-000128 tierB-000163 tierB-000328
(And (Manner $e0 $v0) (Theme $e0 $x0))

;; p200404  star  support 17 (occ 17)  size 2  lifted 2  nisurp 0.342  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000058 tierB-000085
(And (Degree $x0 $v0 very) (Member $x0 $v1))

;; p200405  star  support 17 (occ 23)  size 2  lifted 2  nisurp 0.059  tiers tierB
;;   e.g. tierB-000146 tierB-000205 tierB-000489
(And (LocatedIn $x0 $v0) (Member $x0 $v1))

;; p200406  star  support 17 (occ 20)  size 2  lifted 2  nisurp 0.895  tiers tierB
;;   e.g. tierB-000322 tierB-000503 tierB-000567
(And (Past (Member $x0 $v0)) (Past (Member $x0 $v1)))

;; p200407  star  support 17 (occ 17)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000089 tierB-000268 tierB-000282
(Member $e0 use)

;; p200408  star  support 17 (occ 17)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000048 tierB-000293 tierB-000371
(Member $x0 house)

;; p200409  cross  support 16 (occ 17)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000166 tierB-000339 tierB-000410
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e1) (Theme $e1 $e0))

;; p200410  cross  support 16 (occ 16)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000470 tierB-000485 tierB-000738
(And (Agent $e0 $x0) (Member $e1 $v0) (Past $e0) (Theme $e0 $e1))

;; p200411  cross  support 16 (occ 17)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000166 tierB-000339 tierB-000410
(And (Agent $e0 $x0) (Member $e1 $v0) (Past $e1) (Theme $e1 $e0))

;; p200412  cross  support 16 (occ 17)  size 4  lifted 1  nisurp 0.440  tiers tierB
;;   e.g. tierB-000134 tierB-000411 tierB-000565
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Past $e0) (Past (Member $x0 $v0)))

;; p200413  cross  support 16 (occ 29)  size 4  lifted 1  nisurp 0.107  tiers tierB  signal conj-pattern
;;   e.g. tierB-000408 tierB-000492 tierB-000665
(And (Holder $e0 $x0) (Member $e0 have) (Member $x1 $v0) (Theme $e0 $x1))

;; p200414  cross  support 16 (occ 18)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 $v0) (Member $x1 $v1))

;; p200415  cross  support 16 (occ 21)  size 4  lifted 2  nisurp 0.119  tiers tierB
;;   e.g. tierB-000258 tierB-000648 tierB-000710
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p200416  cross  support 16 (occ 22)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000134 tierB-000411 tierB-000565
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past (Member $x0 $v0)))

;; p200417  cross  support 16 (occ 29)  size 4  lifted 2  nisurp 0.107  tiers tierB  dominated
;;   e.g. tierB-000408 tierB-000492 tierB-000665
(And (Holder $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p200418  cross  support 16 (occ 32)  size 4  lifted 2  nisurp 0.146  tiers tierB  dominated
;;   e.g. tierB-000408 tierB-000492 tierB-000665
(And (Holder $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p200419  cross  support 16 (occ 22)  size 4  lifted 2  nisurp 0.198  tiers tierB  dominated
;;   e.g. tierB-000134 tierB-000411 tierB-000565
(And (Member $e0 $v0) (Member $x0 $v1) (Past $e0) (Past (Member $x0 $v0)))

;; p200420  cross  support 16 (occ 16)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(And (Agent $e0 $v0) (Goal $e0 $x0) (Member $e0 $v1) (Member $x0 $v2))

;; p200421  cross  support 16 (occ 20)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000030 tierB-000075 tierB-000107
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Theme $e1 $e0))

;; p200422  cross  support 16 (occ 20)  size 4  lifted 3  nisurp 0.301  tiers tierB
;;   e.g. tierB-000108 tierB-000378 tierB-000389
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Time $e0 $v2))

;; p200423  cross  support 16 (occ 17)  size 3  lifted 0  nisurp 0.563  tiers tierB  dominated
;;   e.g. tierB-000166 tierB-000339 tierB-000410
(And (Agent $e0 $x0) (Past $e1) (Theme $e1 $e0))

;; p200424  cross  support 16 (occ 18)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $x1 $v0))

;; p200425  cross  support 16 (occ 17)  size 3  lifted 1  nisurp 0.407  tiers tierB  dominated
;;   e.g. tierB-000134 tierB-000411 tierB-000565
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Past (Member $x0 $v0)))

;; p200426  cross  support 16 (occ 16)  size 3  lifted 1  nisurp 0.793  tiers tierB
;;   e.g. tierB-000124 tierB-000133 tierB-000196
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (SubsetOf $x0 $x1))

;; p200427  cross  support 16 (occ 29)  size 3  lifted 1  nisurp 0.107  tiers tierB  dominated
;;   e.g. tierB-000408 tierB-000492 tierB-000665
(And (Holder $e0 $x0) (Member $x1 $v0) (Theme $e0 $x1))

;; p200428  cross  support 16 (occ 17)  size 3  lifted 1  nisurp -0.076  tiers tierB  dominated
;;   e.g. tierB-000134 tierB-000411 tierB-000565
(And (Member $e0 $v0) (Past $e0) (Past (Member $x0 $v0)))

;; p200429  cross  support 16 (occ 16)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(And (Agent $e0 $v0) (Goal $e0 $x0) (Member $x0 $v1))

;; p200430  cross  support 16 (occ 20)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000107
(And (Agent $e0 $v0) (Member $e1 $v1) (Theme $e1 $e0))

;; p200431  cross  support 16 (occ 22)  size 3  lifted 2  nisurp -0.379  tiers tierB  dominated
;;   e.g. tierB-000134 tierB-000411 tierB-000565
(And (Member $e0 $v0) (Member $x0 $v1) (Past (Member $x0 $v0)))

;; p200432  cross  support 16 (occ 20)  size 3  lifted 2  nisurp 0.301  tiers tierB
;;   e.g. tierB-000009 tierB-000114 tierB-000174
(And (Member $e0 $v0) (Member $x0 $v1) (Stimulus $e0 $x0))

;; p200433  cross  support 16 (occ 20)  size 3  lifted 2  nisurp 0.301  tiers tierB  dominated
;;   e.g. tierB-000108 tierB-000378 tierB-000389
(And (Member $x0 $v0) (Patient $e0 $x0) (Time $e0 $v1))

;; p200434  cross  support 16 (occ 17)  size 2  lifted 1  nisurp 0.944  tiers tierB  dominated
;;   e.g. tierB-000134 tierB-000411 tierB-000565
(And (Member $e0 $v0) (Past (Member $x0 $v0)))

;; p200435  star  support 16 (occ 16)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-000485 tierB-000738
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e0) (Theme $e0 $e1))

;; p200436  star  support 16 (occ 16)  size 3  lifted 0  nisurp 0.562  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-000485 tierB-000738
(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $e1))

;; p200437  star  support 16 (occ 16)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 $v0))

;; p200438  star  support 16 (occ 16)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(And (Agent $e0 $v0) (Goal $e0 $x0) (Member $e0 $v1))

;; p200439  star  support 16 (occ 20)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000107
(And (Agent $e0 $v0) (Member $e0 $v1) (Theme $e1 $e0))

;; p200440  star  support 16 (occ 17)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000144 tierB-000168 tierB-000495
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Time $e0 $v1))

;; p200441  star  support 16 (occ 16)  size 3  lifted 2  nisurp 0.265  tiers tierB
;;   e.g. tierB-000128 tierB-000163 tierB-000328
(And (Manner $e0 $v0) (Member $e0 $v1) (Theme $e0 $x0))

;; p200442  star  support 16 (occ 16)  size 2  lifted 0  nisurp 0.512  tiers tierB  dominated
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(And (Agent $e0 $x0) (Goal $e0 $x1))

;; p200443  star  support 16 (occ 16)  size 2  lifted 1  nisurp 0.674  tiers tierB  dominated
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(And (Agent $e0 $v0) (Goal $e0 $x0))

;; p200444  star  support 16 (occ 20)  size 2  lifted 1  nisurp 0.551  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000107
(And (Agent $e0 $v0) (Theme $e1 $e0))

;; p200445  star  support 16 (occ 16)  size 2  lifted 1  nisurp 0.682  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000168 tierB-000495
(And (Experiencer $e0 $x0) (Time $e0 $v0))

;; p200446  star  support 16 (occ 16)  size 2  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000133 tierB-000196
(And (GroupOf $x0 $v0) (SubsetOf $x0 $x1))

;; p200447  star  support 16 (occ 16)  size 2  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000133 tierB-000196
(And (GroupOf $x0 $v0) (SubsetOf $x1 $x0))

;; p200448  star  support 16 (occ 20)  size 2  lifted 1  nisurp 0.301  tiers tierB  dominated
;;   e.g. tierB-000009 tierB-000114 tierB-000174
(And (Member $x0 $v0) (Stimulus $e0 $x0))

;; p200449  star  support 16 (occ 16)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000133 tierB-000196
(SubsetOf $x0 $x1)

;; p200450  cross  support 15 (occ 40)  size 4  lifted 1  nisurp -0.496  tiers tierB
;;   e.g. tierB-000470 tierB-000720 tierB-000782
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 $v0) (Past $e0))

;; p200451  cross  support 15 (occ 15)  size 4  lifted 1  nisurp 0.365  tiers tierB
;;   e.g. tierB-000018 tierB-000379 tierB-000462
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Past $e0) (Theme $e0 $x1))

;; p200452  cross  support 15 (occ 15)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(And (Agent $e0 $v0) (Goal $e0 $x0) (Member $x0 $v1) (Past $e0))

;; p200453  cross  support 15 (occ 16)  size 4  lifted 2  nisurp 0.142  tiers tierB
;;   e.g. tierB-000063 tierB-000085 tierB-000277
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x1))

;; p200454  cross  support 15 (occ 19)  size 4  lifted 2  nisurp 0.006  tiers tierB  dominated
;;   e.g. tierB-000288 tierB-000470 tierB-000673
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $e1))

;; p200455  cross  support 15 (occ 20)  size 4  lifted 2  nisurp 0.006  tiers tierB
;;   e.g. tierB-000288 tierB-000470 tierB-000673
(And (Agent $e0 $x0) (Member $e1 $v0) (Member $x0 $v1) (Theme $e0 $e1))

;; p200456  cross  support 15 (occ 19)  size 4  lifted 3  nisurp -0.341  tiers tierB
;;   e.g. tierB-000008 tierB-000125 tierB-000189
(And (Inheritance $v0 $v1) (Location $e0 $x0) (Member $e0 $v2) (Member $x0 $v0))

;; p200457  cross  support 15 (occ 16)  size 3  lifted 1  nisurp 0.142  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000085 tierB-000277
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Patient $e0 $x1))

;; p200458  cross  support 15 (occ 19)  size 3  lifted 1  nisurp 0.006  tiers tierB  dominated
;;   e.g. tierB-000288 tierB-000470 tierB-000673
(And (Agent $e0 $x0) (Member $x0 $v0) (Theme $e0 $e1))

;; p200459  cross  support 15 (occ 19)  size 3  lifted 2  nisurp -0.341  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000125 tierB-000189
(And (Inheritance $v0 $v1) (Location $e0 $x0) (Member $x0 $v0))

;; p200460  cross  support 15 (occ 19)  size 3  lifted 3  nisurp -0.000  tiers tierB
;;   e.g. tierB-000048 tierB-000105 tierB-000128
(And (Agent $e0 $v0) (Member $e0 $v2) (Member $v0 $v1))

;; p200461  cross  support 15 (occ 19)  size 2  lifted 2  nisurp 0.000  tiers tierB  dominated
;;   e.g. tierB-000048 tierB-000105 tierB-000128
(And (Agent $e0 $v0) (Member $v0 $v1))

;; p200462  kindlevel  support 15 (occ 21)  size 2  lifted 3  nisurp 6.109  tiers tierB
;;   e.g. tierB-000039 tierB-000076 tierB-000179
(And (Inheritance $v0 $v1) (Inheritance $v2 $v1))

;; p200463  star  support 15 (occ 15)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(And (Agent $e0 $v0) (Goal $e0 $x0) (Member $e0 $v1) (Past $e0))

;; p200464  star  support 15 (occ 15)  size 4  lifted 2  nisurp -0.269  tiers tierB
;;   e.g. tierB-000056 tierB-000109 tierB-000139
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e0) (Patient $e0 $x0))

;; p200465  star  support 15 (occ 15)  size 3  lifted 1  nisurp 0.689  tiers tierB  dominated
;;   e.g. tierB-000111 tierB-000178 tierB-000204
(And (Agent $e0 $v0) (Goal $e0 $x0) (Past $e0))

;; p200466  star  support 15 (occ 15)  size 3  lifted 1  nisurp -0.269  tiers tierB  dominated
;;   e.g. tierB-000056 tierB-000109 tierB-000139
(And (Agent $e0 $v0) (Past $e0) (Patient $e0 $x0))

;; p200467  star  support 15 (occ 17)  size 3  lifted 1  nisurp 0.360  tiers tierB
;;   e.g. tierB-000144 tierB-000963 tierB-000997
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Ongoing $e0))

;; p200468  star  support 15 (occ 18)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000012 tierB-000018 tierB-000029
(And (Goal $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p200469  star  support 15 (occ 17)  size 2  lifted 0  nisurp 0.360  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000963 tierB-000997
(And (Experiencer $e0 $x0) (Ongoing $e0))

;; p200470  star  support 15 (occ 15)  size 2  lifted 0  nisurp 0.799  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000025 tierB-000073 tierB-000269
(And (Member $e0 make) (Patient $e0 $x0))

;; p200471  star  support 15 (occ 17)  size 2  lifted 1  nisurp 0.533  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000018 tierB-000029
(And (Goal $e0 $v0) (Past $e0))

;; p200472  star  support 15 (occ 16)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000263 tierB-000344 tierB-000670
(Member $x0 room)

;; p200473  star  support 15 (occ 16)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000017 tierB-000023 tierB-000033
(Member $x0 $v0) ~NEG

;; p200474  cross  support 14 (occ 16)  size 4  lifted 1  nisurp 0.286  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Past $e1) (Patient $e1 $x0))

;; p200475  cross  support 14 (occ 15)  size 4  lifted 1  nisurp 0.286  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Past $e1) (Patient $e1 $x0))

;; p200476  cross  support 14 (occ 28)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Past $e1) (Patient $e1 $x0))

;; p200477  cross  support 14 (occ 18)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000117
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Theme $e0 $e1))

;; p200478  cross  support 14 (occ 18)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000030 tierB-000075 tierB-000117
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Theme $e1 $e0))

;; p200479  cross  support 14 (occ 18)  size 4  lifted 2  nisurp -0.090  tiers tierB
;;   e.g. tierB-000056 tierB-000109 tierB-000139
(And (Agent $e0 $v0) (Member $x0 $v1) (Past $e0) (Patient $e0 $x0))

;; p200480  cross  support 14 (occ 15)  size 4  lifted 2  nisurp 0.246  tiers tierB
;;   e.g. tierB-000049 tierB-000238 tierB-000345
(And (Agent $e0 $x0) (Manner $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p200481  cross  support 14 (occ 20)  size 4  lifted 2  nisurp -0.479  tiers tierB
;;   e.g. tierB-000208 tierB-000231 tierB-000765
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Past $e0))

;; p200482  cross  support 14 (occ 15)  size 4  lifted 2  nisurp 0.159  tiers tierB
;;   e.g. tierB-000034 tierB-000217 tierB-000291
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x1))

;; p200483  cross  support 14 (occ 14)  size 4  lifted 2  nisurp 0.354  tiers tierB
;;   e.g. tierB-000107 tierB-000265 tierB-000455
(And (Member $e0 $v0) (Member $e1 $v1) (Patient $e0 $x0) (Theme $e1 $e0))

;; p200484  cross  support 14 (occ 15)  size 3  lifted 0  nisurp 0.286  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0))

;; p200485  cross  support 14 (occ 18)  size 3  lifted 1  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000117
(And (Agent $e0 $v0) (Agent $e1 $v0) (Theme $e0 $e1))

;; p200486  cross  support 14 (occ 15)  size 3  lifted 1  nisurp 0.159  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000217 tierB-000291
(And (Location $e0 $x0) (Member $x0 $v0) (Patient $e0 $x1))

;; p200487  cross  support 14 (occ 14)  size 3  lifted 1  nisurp 0.354  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000265 tierB-000455
(And (Member $e0 $v0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p200488  cross  support 14 (occ 15)  size 3  lifted 3  nisurp -0.315  tiers tierB
;;   e.g. tierB-000005 tierB-000063 tierB-000097
(And (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Inheritance $v0 $v2))

;; p200489  kindlevel  support 14 (occ 14)  size 2  lifted 3  nisurp 0.859  tiers tierB
;;   e.g. tierB-000072 tierB-000206 tierB-000266
(And (Degree $v0 $v1 $v2) (Member $v0 $v1))

;; p200490  kindlevel  support 14 (occ 15)  size 1  lifted 3  nisurp —  tiers tierB
;;   e.g. tierB-000050 tierB-000185 tierB-000245
(More $v0 $v1 $v2)

;; p200491  star  support 14 (occ 16)  size 4  lifted 1  nisurp 0.327  tiers tierB
;;   e.g. tierB-000045 tierB-000291 tierB-000305
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 $v0) (Past $e0))

;; p200492  star  support 14 (occ 14)  size 4  lifted 2  nisurp 0.262  tiers tierB
;;   e.g. tierB-000001 tierB-000008 tierB-000117
(And (Agent $e0 $v0) (Member $e0 $v1) (Ongoing $e0) (Past $e0))

;; p200493  star  support 14 (occ 16)  size 3  lifted 0  nisurp 0.327  tiers tierB  dominated
;;   e.g. tierB-000045 tierB-000291 tierB-000305
(And (Agent $e0 $x0) (Location $e0 $x1) (Past $e0))

;; p200494  star  support 14 (occ 14)  size 3  lifted 1  nisurp 0.262  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000008 tierB-000117
(And (Agent $e0 $v0) (Ongoing $e0) (Past $e0))

;; p200495  star  support 14 (occ 14)  size 3  lifted 1  nisurp 0.090  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000217 tierB-000291
(And (Location $e0 $x0) (Member $e0 $v0) (Patient $e0 $x1))

;; p200496  star  support 14 (occ 14)  size 3  lifted 1  nisurp -0.301  tiers tierB
;;   e.g. tierB-000416 tierB-000520 tierB-000574
(And (Member $e0 $v0) (Ongoing $e0) (Theme $e0 $x0))

;; p200497  star  support 14 (occ 14)  size 3  lifted 1  nisurp 0.354  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000265 tierB-000455
(And (Member $e0 $v0) (Patient $e0 $x0) (Theme $e1 $e0))

;; p200498  star  support 14 (occ 14)  size 2  lifted 0  nisurp 0.090  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000217 tierB-000291
(And (Location $e0 $x0) (Patient $e0 $x1))

;; p200499  star  support 14 (occ 14)  size 2  lifted 0  nisurp 0.604  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000043 tierB-000192 tierB-000199
(And (Member $e0 start) (Past $e0))

;; p200500  star  support 14 (occ 14)  size 2  lifted 0  nisurp 0.301  tiers tierB  dominated
;;   e.g. tierB-000416 tierB-000520 tierB-000574
(And (Ongoing $e0) (Theme $e0 $x0))

;; p200501  star  support 14 (occ 14)  size 2  lifted 0  nisurp 0.354  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000265 tierB-000455
(And (Patient $e0 $x0) (Theme $e1 $e0))

;; p200502  star  support 14 (occ 14)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000016 tierB-000222 tierB-000392
(And (Instrument $e0 $x0) (Member $e0 $v0))

;; p200503  star  support 14 (occ 15)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000150 tierB-000485 tierB-000547
(And (Member $e0 $v0) (Recipient $e0 $x0))

;; p200504  star  support 14 (occ 14)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000145 tierB-000162 tierB-000333
(And (Holder $e0 $v0) (Member $e0 $v1))

;; p200505  star  support 14 (occ 14)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000016 tierB-000222 tierB-000392
(Instrument $e0 $x0)

;; p200506  star  support 14 (occ 15)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000012 tierB-000115 tierB-000204
(Member $e0 go)

;; p200507  star  support 14 (occ 14)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000056 tierB-000425 tierB-000446
(Member $x0 door)

;; p200508  star  support 14 (occ 15)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000150 tierB-000485 tierB-000547
(Recipient $e0 $x0)

;; p200509  star  support 14 (occ 14)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000145 tierB-000162 tierB-000333
(Holder $e0 $v0)

;; p200510  cross  support 13 (occ 15)  size 4  lifted 1  nisurp 0.238  tiers tierB
;;   e.g. tierB-000012 tierB-000030 tierB-000139
(And (Agent $e0 $v0) (Agent $e1 $v0) (Past $e0) (Past $e1))

;; p200511  cross  support 13 (occ 15)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $x1 $v0) (Past $e0))

;; p200512  cross  support 13 (occ 17)  size 4  lifted 1  nisurp 0.312  tiers tierB
;;   e.g. tierB-000045 tierB-000291 tierB-000305
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 $v0) (Past $e0))

;; p200513  cross  support 13 (occ 14)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Past $e1) (Result $e1 $e0))

;; p200514  cross  support 13 (occ 13)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Past $e1) (Result $e1 $e0))

;; p200515  cross  support 13 (occ 26)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Past $e1) (Result $e1 $e0))

;; p200516  cross  support 13 (occ 13)  size 4  lifted 1  nisurp -0.099  tiers tierB
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Member $e0 $v0) (Member $x0 $v0) (Past $e1) (Result $e1 $e0))

;; p200517  cross  support 13 (occ 16)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000117
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e1) (Theme $e1 $e0))

;; p200518  cross  support 13 (occ 16)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000030 tierB-000075 tierB-000117
(And (Agent $e0 $v0) (Member $e1 $v1) (Past $e1) (Theme $e1 $e0))

;; p200519  cross  support 13 (occ 18)  size 4  lifted 2  nisurp 0.171  tiers tierB
;;   e.g. tierB-000063 tierB-000085 tierB-000277
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $x1 $v1) (Patient $e0 $x1))

;; p200520  cross  support 13 (occ 16)  size 4  lifted 2  nisurp 0.045  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000470
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e1 $e0))

;; p200521  cross  support 13 (occ 16)  size 4  lifted 2  nisurp 0.045  tiers tierB
;;   e.g. tierB-000160 tierB-000339 tierB-000470
(And (Agent $e0 $x0) (Member $e1 $v0) (Member $x0 $v1) (Theme $e1 $e0))

;; p200522  cross  support 13 (occ 14)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $v0 $v1) (Result $e1 $e0))

;; p200523  cross  support 13 (occ 18)  size 4  lifted 2  nisurp 0.283  tiers tierB
;;   e.g. tierB-000144 tierB-000963 tierB-000997
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Ongoing $e0))

;; p200524  cross  support 13 (occ 13)  size 4  lifted 2  nisurp 0.236  tiers tierB
;;   e.g. tierB-000408 tierB-000665 tierB-000926
(And (Holder $e0 $x0) (Member $x1 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p200525  cross  support 13 (occ 14)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Patient $e1 $v0))

;; p200526  cross  support 13 (occ 14)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Result $e1 $e0))

;; p200527  cross  support 13 (occ 14)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e1 $v2) (Member $v0 $v1) (Result $e1 $e0))

;; p200528  cross  support 13 (occ 16)  size 4  lifted 3  nisurp 0.236  tiers tierB
;;   e.g. tierB-000144 tierB-000168 tierB-000495
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Time $e0 $v2))

;; p200529  cross  support 13 (occ 14)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $e0 $v1) (Member $e1 $v2) (Member $v0 $v1) (Result $e1 $e0))

;; p200530  cross  support 13 (occ 13)  size 3  lifted 0  nisurp 0.484  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Experiencer $e0 $x0) (Past $e1) (Result $e1 $e0))

;; p200531  cross  support 13 (occ 16)  size 3  lifted 1  nisurp 0.640  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000075 tierB-000117
(And (Agent $e0 $v0) (Past $e1) (Theme $e1 $e0))

;; p200532  cross  support 13 (occ 16)  size 3  lifted 1  nisurp 0.045  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000470
(And (Agent $e0 $x0) (Member $x0 $v0) (Theme $e1 $e0))

;; p200533  cross  support 13 (occ 19)  size 3  lifted 1  nisurp 0.283  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000963 tierB-000997
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Ongoing $e0))

;; p200534  cross  support 13 (occ 13)  size 3  lifted 1  nisurp 0.474  tiers tierB  signal conj-pattern
;;   e.g. tierB-000066 tierB-000142 tierB-000162
(And (GroupOf $x0 $v0) (Member $e0 have) (Theme $e0 $x0))

;; p200535  cross  support 13 (occ 20)  size 3  lifted 1  nisurp 0.283  tiers tierB  signal conj-pattern
;;   e.g. tierB-000025 tierB-000073 tierB-000269
(And (Member $e0 make) (Member $x0 $v0) (Patient $e0 $x0))

;; p200536  cross  support 13 (occ 14)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Patient $e1 $v0))

;; p200537  cross  support 13 (occ 13)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e1 $v1) (Patient $e1 $v0))

;; p200538  cross  support 13 (occ 13)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e1 $v1) (Result $e1 $e0))

;; p200539  cross  support 13 (occ 14)  size 3  lifted 2  nisurp 0.929  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $v0 $v1) (Result $e1 $e0))

;; p200540  cross  support 13 (occ 18)  size 3  lifted 2  nisurp 0.236  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000168 tierB-000495
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Time $e0 $v1))

;; p200541  cross  support 13 (occ 14)  size 3  lifted 2  nisurp 0.804  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $e0 $v1) (Member $v0 $v1) (Result $e1 $e0))

;; p200542  cross  support 13 (occ 13)  size 2  lifted 1  nisurp 0.816  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Patient $e1 $v0))

;; p200543  star  support 13 (occ 13)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 $v0) (Past $e0))

;; p200544  star  support 13 (occ 14)  size 4  lifted 2  nisurp 0.371  tiers tierB
;;   e.g. tierB-000005 tierB-000094 tierB-000196
(And (Manner $e0 $v0) (Member $e0 $v1) (Past $e0) (Patient $e0 $x0))

;; p200545  star  support 13 (occ 13)  size 3  lifted 0  nisurp 0.537  tiers tierB  dominated
;;   e.g. tierB-000324 tierB-000387 tierB-000462
(And (Agent $e0 $x0) (Goal $e0 $x1) (Past $e0))

;; p200546  star  support 13 (occ 14)  size 3  lifted 1  nisurp 0.371  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000094 tierB-000196
(And (Manner $e0 $v0) (Past $e0) (Patient $e0 $x0))

;; p200547  star  support 13 (occ 13)  size 3  lifted 2  nisurp 0.200  tiers tierB
;;   e.g. tierB-000098 tierB-000256 tierB-000345
(And (Agent $e0 $x0) (Member $e0 $v0) (Patient $e0 $v1))

;; p200548  star  support 13 (occ 14)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Result $e1 $e0))

;; p200549  star  support 13 (occ 13)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000145 tierB-000162 tierB-000333
(And (Holder $e0 $v0) (Member $e0 $v1) (Theme $e0 $x0))

;; p200550  star  support 13 (occ 13)  size 2  lifted 1  nisurp 0.200  tiers tierB  dominated
;;   e.g. tierB-000098 tierB-000256 tierB-000345
(And (Agent $e0 $x0) (Patient $e0 $v0))

;; p200551  star  support 13 (occ 13)  size 2  lifted 1  nisurp 0.896  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Result $e1 $e0))

;; p200552  star  support 13 (occ 13)  size 2  lifted 1  nisurp 0.865  tiers tierB  dominated
;;   e.g. tierB-000145 tierB-000162 tierB-000333
(And (Holder $e0 $v0) (Theme $e0 $x0))

;; p200553  star  support 13 (occ 14)  size 2  lifted 2  nisurp 0.538  tiers tierB
;;   e.g. tierB-000146 tierB-000262 tierB-000364
(And (GroupOf $x0 $v0) (LocatedIn $x0 $v1))

;; p200554  star  support 13 (occ 14)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000206 tierB-000370 tierB-000418
(Member $e0 get)

;; p200555  star  support 13 (occ 13)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000288 tierB-000728 tierB-000958
(Member $x0 new)

;; p200556  star  support 13 (occ 13)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000316 tierB-000338 tierB-000628
(Member $x0 person)

;; p200557  star  support 13 (occ 14)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000107 tierB-000174 tierB-000263
(Degree $x0 quantity $v0)

;; p200558  cross  support 12 (occ 12)  size 4  lifted 0  nisurp 0.465  tiers tierB
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Experiencer $e0 $x0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))

;; p200559  cross  support 12 (occ 15)  size 4  lifted 1  nisurp 0.660  tiers tierB
;;   e.g. tierB-000030 tierB-000075 tierB-000117
(And (Agent $e0 $v0) (Agent $e1 $v0) (Past $e0) (Theme $e0 $e1))

;; p200560  cross  support 12 (occ 14)  size 4  lifted 1  nisurp 0.241  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000720 tierB-000738
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Ongoing $e0))

;; p200561  cross  support 12 (occ 14)  size 4  lifted 1  nisurp 0.241  tiers tierB
;;   e.g. tierB-000485 tierB-000720 tierB-000738
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Ongoing $e1))

;; p200562  cross  support 12 (occ 12)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-000485 tierB-000738
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Theme $e0 $e1))

;; p200563  cross  support 12 (occ 12)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000470 tierB-000485 tierB-000738
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Theme $e1 $e0))

;; p200564  cross  support 12 (occ 18)  size 4  lifted 1  nisurp -0.837  tiers tierB
;;   e.g. tierB-000012 tierB-000030 tierB-000166
(And (Member $e0 $v0) (Member $e1 $v0) (Past $e0) (Past $e1))

;; p200565  cross  support 12 (occ 13)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000199 tierB-000265 tierB-000465
(And (Member $e0 $v0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))

;; p200566  cross  support 12 (occ 13)  size 4  lifted 1  nisurp -0.860  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Member $e0 $v0) (Member $x0 $v0) (Past $e1) (Patient $e1 $x0))

;; p200567  cross  support 12 (occ 13)  size 4  lifted 1  nisurp 0.465  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Member $e0 $v0) (Past $e1) (Patient $e1 $x0) (Result $e1 $e0))

;; p200568  cross  support 12 (occ 23)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Member $x0 $v0) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p200569  cross  support 12 (occ 13)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $v0 $v1) (Patient $e1 $v0))

;; p200570  cross  support 12 (occ 13)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Patient $e1 $v0) (Result $e1 $e0))

;; p200571  cross  support 12 (occ 12)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e1 $v1) (Patient $e1 $v0) (Result $e1 $e0))

;; p200572  cross  support 12 (occ 13)  size 4  lifted 2  nisurp 0.929  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $v0 $v1) (Patient $e1 $v0) (Result $e1 $e0))

;; p200573  cross  support 12 (occ 15)  size 4  lifted 2  nisurp -0.165  tiers tierB
;;   e.g. tierB-000520 tierB-000574 tierB-000713
(And (Member $e0 $v0) (Member $x0 $v1) (Ongoing $e0) (Theme $e0 $x0))

;; p200574  cross  support 12 (occ 13)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $e0 $v1) (Member $v0 $v1) (Patient $e1 $v0) (Result $e1 $e0))

;; p200575  cross  support 12 (occ 17)  size 4  lifted 3  nisurp 0.243  tiers tierB
;;   e.g. tierB-000100 tierB-000132 tierB-000237
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Time $e0 $v2))

;; p200576  cross  support 12 (occ 13)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $e1 $v2) (Member $v0 $v1) (Patient $e1 $v0))

;; p200577  cross  support 12 (occ 12)  size 4  lifted 3  nisurp -0.473  tiers tierB
;;   e.g. tierB-000008 tierB-000036 tierB-000048
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p200578  cross  support 12 (occ 13)  size 4  lifted 3  nisurp 0.172  tiers tierB
;;   e.g. tierB-000128 tierB-000163 tierB-000328
(And (Manner $e0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Theme $e0 $x0))

;; p200579  cross  support 12 (occ 13)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $e0 $v0) (Member $e1 $v1) (Patient $e0 $v2) (Result $e0 $e1))

;; p200580  cross  support 12 (occ 13)  size 4  lifted 3  nisurp 0.253  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $e0 $v1) (Member $e1 $v2) (Member $v0 $v1) (Patient $e1 $v0))

;; p200581  cross  support 12 (occ 13)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $e0 $v2) (Member $v0 $v1) (Patient $e0 $v0) (Result $e0 $e1))

;; p200582  cross  support 12 (occ 14)  size 3  lifted 0  nisurp 0.241  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000720 tierB-000738
(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0))

;; p200583  cross  support 12 (occ 12)  size 3  lifted 0  nisurp 0.675  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-000485 tierB-000738
(And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $e1))

;; p200584  cross  support 12 (occ 12)  size 3  lifted 0  nisurp 0.926  tiers tierB  dominated
;;   e.g. tierB-000199 tierB-000265 tierB-000465
(And (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))

;; p200585  cross  support 12 (occ 12)  size 3  lifted 1  nisurp 0.963  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Patient $e1 $v0) (Result $e1 $e0))

;; p200586  cross  support 12 (occ 36)  size 3  lifted 1  nisurp -0.441  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000030 tierB-000166
(And (Member $e0 $v0) (Member $e1 $v0) (Past $e0))

;; p200587  cross  support 12 (occ 13)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000199 tierB-000265 tierB-000465
(And (Member $e0 $v0) (Member $e1 start) (Theme $e1 $e0))

;; p200588  cross  support 12 (occ 15)  size 3  lifted 1  nisurp -0.165  tiers tierB  dominated
;;   e.g. tierB-000520 tierB-000574 tierB-000713
(And (Member $x0 $v0) (Ongoing $e0) (Theme $e0 $x0))

;; p200589  cross  support 12 (occ 17)  size 3  lifted 2  nisurp 0.243  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000132 tierB-000237
(And (Agent $e0 $x0) (Member $x0 $v0) (Time $e0 $v1))

;; p200590  cross  support 12 (occ 13)  size 3  lifted 2  nisurp 0.923  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Experiencer $e0 $v0) (Member $v0 $v1) (Patient $e1 $v0))

;; p200591  cross  support 12 (occ 13)  size 3  lifted 2  nisurp 0.120  tiers tierB  dominated
;;   e.g. tierB-000128 tierB-000163 tierB-000328
(And (Manner $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0))

;; p200592  cross  support 12 (occ 13)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $e0 $v0) (Patient $e1 $v1) (Result $e1 $e0))

;; p200593  cross  support 12 (occ 13)  size 3  lifted 2  nisurp 0.253  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $e0 $v1) (Member $v0 $v1) (Patient $e1 $v0))

;; p200594  cross  support 12 (occ 13)  size 3  lifted 2  nisurp 0.929  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $v0 $v1) (Patient $e0 $v0) (Result $e0 $e1))

;; p200595  kindlevel  support 12 (occ 20)  size 2  lifted 3  nisurp 7.886  tiers tierB
;;   e.g. tierB-000428 tierB-000532 tierB-000543
(And (Inheritance $v0 $v1) (Inheritance $v2 $v0))

;; p200596  kindlevel  support 12 (occ 15)  size 2  lifted 3  nisurp 0.882  tiers tierB
;;   e.g. tierB-000031 tierB-000186 tierB-000346
(And (Member $v0 $v1) (Possession $v0 $v2))

;; p200597  star  support 12 (occ 12)  size 4  lifted 1  nisurp -0.362  tiers tierB
;;   e.g. tierB-000231 tierB-000381 tierB-000426
(And (Agent $e0 $x0) (Member $e0 $v0) (Ongoing $e0) (Past $e0))

;; p200598  star  support 12 (occ 12)  size 4  lifted 1  nisurp 0.465  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Member $e0 $v0) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p200599  star  support 12 (occ 13)  size 4  lifted 3  nisurp 0.442  tiers tierB
;;   e.g. tierB-000001 tierB-000012 tierB-000087
(And (Agent $e0 $v0) (Manner $e0 $v1) (Member $e0 $v2) (Past $e0))

;; p200600  star  support 12 (occ 12)  size 3  lifted 0  nisurp -0.362  tiers tierB  dominated
;;   e.g. tierB-000231 tierB-000381 tierB-000426
(And (Agent $e0 $x0) (Ongoing $e0) (Past $e0))

;; p200601  star  support 12 (occ 12)  size 3  lifted 0  nisurp 0.465  tiers tierB  dominated
;;   e.g. tierB-000362 tierB-000392 tierB-000425
(And (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p200602  star  support 12 (occ 13)  size 3  lifted 2  nisurp 0.442  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000012 tierB-000087
(And (Agent $e0 $v0) (Manner $e0 $v1) (Past $e0))

;; p200603  star  support 12 (occ 15)  size 3  lifted 2  nisurp -0.043  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000132 tierB-000237
(And (Agent $e0 $x0) (Member $e0 $v0) (Time $e0 $v1))

;; p200604  star  support 12 (occ 12)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000009 tierB-000114 tierB-000189
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Stimulus $e0 $x0))

;; p200605  star  support 12 (occ 12)  size 3  lifted 2  nisurp 0.173  tiers tierB
;;   e.g. tierB-000063 tierB-000237 tierB-000373
(And (Location $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p200606  star  support 12 (occ 12)  size 3  lifted 2  nisurp 0.324  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000036 tierB-000048
(And (Location $e0 $x0) (Member $x0 $v0) (Member $x0 $v1))

;; p200607  star  support 12 (occ 12)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000096 tierB-000098 tierB-000325
(And (Member $e0 $v0) (Ongoing $e0) (Patient $e0 $v1))

;; p200608  star  support 12 (occ 12)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Member $e0 $v0) (Patient $e0 $v1) (Result $e0 $e1))

;; p200609  star  support 12 (occ 13)  size 3  lifted 3  nisurp 0.420  tiers tierB
;;   e.g. tierB-000096 tierB-000209 tierB-000325
(And (Agent $e0 $v0) (Member $e0 $v1) (Patient $e0 $v2))

;; p200610  star  support 12 (occ 14)  size 3  lifted 3  nisurp 0.302  tiers tierB
;;   e.g. tierB-000012 tierB-000212 tierB-000311
(And (Agent $e0 $v0) (Member $e0 $v1) (Time $e0 $v2))

;; p200611  star  support 12 (occ 12)  size 2  lifted 0  nisurp 0.946  tiers tierB  dominated
;;   e.g. tierB-000199 tierB-000265 tierB-000465
(And (Member $e0 start) (Theme $e0 $e1))

;; p200612  star  support 12 (occ 15)  size 2  lifted 1  nisurp 0.043  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000132 tierB-000237
(And (Agent $e0 $x0) (Time $e0 $v0))

;; p200613  star  support 12 (occ 12)  size 2  lifted 1  nisurp 0.944  tiers tierB  dominated
;;   e.g. tierB-000009 tierB-000114 tierB-000189
(And (Experiencer $e0 $v0) (Stimulus $e0 $x0))

;; p200614  star  support 12 (occ 12)  size 2  lifted 1  nisurp 0.173  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000237 tierB-000373
(And (Location $e0 $v0) (Past $e0))

;; p200615  star  support 12 (occ 12)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000144 tierB-000744 tierB-000880
(And (Member $e0 $v0) (Time $e0 now))

;; p200616  star  support 12 (occ 12)  size 2  lifted 1  nisurp 0.603  tiers tierB  dominated
;;   e.g. tierB-000096 tierB-000098 tierB-000325
(And (Ongoing $e0) (Patient $e0 $v0))

;; p200617  star  support 12 (occ 12)  size 2  lifted 1  nisurp 0.901  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000228 tierB-000256
(And (Patient $e0 $v0) (Result $e0 $e1))

;; p200618  star  support 12 (occ 13)  size 2  lifted 2  nisurp 0.420  tiers tierB  dominated
;;   e.g. tierB-000096 tierB-000209 tierB-000325
(And (Agent $e0 $v0) (Patient $e0 $v1))

;; p200619  star  support 12 (occ 14)  size 2  lifted 2  nisurp 0.302  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000212 tierB-000311
(And (Agent $e0 $v0) (Time $e0 $v1))

;; p200620  star  support 12 (occ 12)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000206 tierB-000238 tierB-000313
(And (Every $e0 <num> $v0) (Member $e0 $v1))

;; p200621  star  support 12 (occ 13)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000091 tierB-000274 tierB-000556
(And (For $e0 $v0) (Member $e0 $v1))

;; p200622  star  support 12 (occ 12)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000067 tierB-000199 tierB-000326
(And (In $e0 $v0) (Member $e0 $v1))

;; p200623  star  support 12 (occ 14)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000369 tierB-000554 tierB-000757
(And (Instrument $e0 $v0) (Member $e0 $v1))

;; p200624  star  support 12 (occ 13)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000410 tierB-000587 tierB-000634
(GroupOf $x0 child)

;; p200625  star  support 12 (occ 12)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000152 tierB-000238 tierB-000255
(Member $e0 come)

;; p200626  star  support 12 (occ 12)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000307 tierB-000650 tierB-000843
(Member $x0 problem)

;; p200627  star  support 12 (occ 12)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000205 tierB-000351 tierB-000429
(Member $x0 weather)

;; p200628  star  support 12 (occ 12)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000016 tierB-000126 tierB-000285
(Past (LocatedIn $x0 $x1))

;; p200629  star  support 12 (occ 12)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000744 tierB-000880
(Time $e0 now)

;; p200630  star  support 12 (occ 12)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000238 tierB-000313
(Every $e0 <num> $v0)

;; p200631  star  support 12 (occ 12)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000091 tierB-000274 tierB-000556
(For $e0 $v0)

;; p200632  star  support 12 (occ 12)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000067 tierB-000199 tierB-000326
(In $e0 $v0)

;; p200633  star  support 12 (occ 14)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000369 tierB-000554 tierB-000757
(Instrument $e0 $v0)

;; p200634  star  support 12 (occ 12)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000004 tierB-000253 tierB-000584
(Measure $e0 $v0 <num> $v1)

;; p200635  star  support 12 (occ 14)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000037 tierB-000057 tierB-000149
(Measure $x0 $v0 <num> $v1)

;; p200636  star  support 12 (occ 13)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000158 tierB-000439 tierB-000650
(Most $v0 $x0 $v1)

;; p200637  star  support 12 (occ 12)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000167 tierB-000505 tierB-000536
(Past (Degree $x0 $v0 $v1))

;; p200638  cross  support 11 (occ 13)  size 4  lifted 0  nisurp -0.683  tiers tierB
;;   e.g. tierB-000277 tierB-000942 tierB-001023
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Past $e1))

;; p200639  cross  support 11 (occ 26)  size 4  lifted 2  nisurp -0.389  tiers tierB
;;   e.g. tierB-000101 tierB-000258 tierB-000277
(And (Agent $e0 $x0) (Agent $e1 $x0) (GroupOf $x0 $v0) (Member $e0 $v1))

;; p200640  cross  support 11 (occ 12)  size 4  lifted 2  nisurp -0.149  tiers tierB
;;   e.g. tierB-000063 tierB-000338 tierB-000506
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Member $e0 $v1) (Patient $e0 $x1))

;; p200641  cross  support 11 (occ 11)  size 4  lifted 2  nisurp -0.326  tiers tierB
;;   e.g. tierB-000073 tierB-000085 tierB-000208
(And (Agent $e0 $x0) (Member $x1 $v0) (Member $x1 $v1) (Patient $e0 $x1))

;; p200642  cross  support 11 (occ 12)  size 4  lifted 2  nisurp 0.341  tiers tierB
;;   e.g. tierB-000194 tierB-000217 tierB-000262
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Ongoing $e0) (Patient $e0 $x0))

;; p200643  cross  support 11 (occ 13)  size 4  lifted 2  nisurp -0.169  tiers tierB
;;   e.g. tierB-000008 tierB-000125 tierB-000189
(And (Inheritance $v0 $v1) (Location $e0 $x0) (Member $x0 $v0) (Past $e0))

;; p200644  cross  support 11 (occ 17)  size 4  lifted 2  nisurp -0.420  tiers tierB
;;   e.g. tierB-000222 tierB-000329 tierB-000571
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Past $e0) (Theme $e0 $x0))

;; p200645  cross  support 11 (occ 13)  size 4  lifted 2  nisurp 0.210  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000265 tierB-000455
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Theme $e1 $e0))

;; p200646  cross  support 11 (occ 13)  size 4  lifted 2  nisurp 0.210  tiers tierB
;;   e.g. tierB-000107 tierB-000265 tierB-000455
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e1 $x0) (Theme $e0 $e1))

;; p200647  cross  support 11 (occ 19)  size 4  lifted 3  nisurp -0.681  tiers tierB
;;   e.g. tierB-000005 tierB-000063 tierB-000097
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Member $e0 $v2))

;; p200648  cross  support 11 (occ 14)  size 4  lifted 3  nisurp 0.323  tiers tierB
;;   e.g. tierB-000009 tierB-000114 tierB-000189
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Stimulus $e0 $x0))

;; p200649  cross  support 11 (occ 12)  size 4  lifted 3  nisurp -0.403  tiers tierB
;;   e.g. tierB-000215 tierB-000333 tierB-000379
(And (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Member $e0 $v2) (Theme $e0 $x0))

;; p200650  cross  support 11 (occ 12)  size 4  lifted 3  nisurp -0.535  tiers tierB
;;   e.g. tierB-000222 tierB-000607 tierB-000636
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Member $x0 $v0) (Theme $e0 $x0))

;; p200651  cross  support 11 (occ 12)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Member $e0 $v2) (Member $v0 $v1) (Past $e0) (Patient $e0 $v0))

;; p200652  cross  support 11 (occ 12)  size 3  lifted 1  nisurp -0.149  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000338 tierB-000506
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Patient $e0 $x1))

;; p200653  cross  support 11 (occ 12)  size 3  lifted 1  nisurp 0.341  tiers tierB  dominated
;;   e.g. tierB-000194 tierB-000217 tierB-000262
(And (GroupOf $x0 $v0) (Ongoing $e0) (Patient $e0 $x0))

;; p200654  cross  support 11 (occ 13)  size 3  lifted 1  nisurp 0.210  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000265 tierB-000455
(And (Member $x0 $v0) (Patient $e0 $x0) (Theme $e1 $e0))

;; p200655  cross  support 11 (occ 25)  size 3  lifted 2  nisurp -0.773  tiers tierB
;;   e.g. tierB-000012 tierB-000030 tierB-000166
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 $v1))

;; p200656  cross  support 11 (occ 19)  size 3  lifted 2  nisurp -0.394  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000063 tierB-000097
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Inheritance $v0 $v1))

;; p200657  cross  support 11 (occ 14)  size 3  lifted 2  nisurp 0.323  tiers tierB  dominated
;;   e.g. tierB-000009 tierB-000114 tierB-000189
(And (Experiencer $e0 $v0) (Member $x0 $v1) (Stimulus $e0 $x0))

;; p200658  cross  support 11 (occ 12)  size 3  lifted 2  nisurp -0.424  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000333 tierB-000379
(And (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Theme $e0 $x0))

;; p200659  cross  support 11 (occ 12)  size 3  lifted 2  nisurp 0.549  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Member $v0 $v1) (Past $e0) (Patient $e0 $v0))

;; p200660  kindlevel  support 11 (occ 18)  size 2  lifted 3  nisurp 8.694  tiers tierB
;;   e.g. tierB-000184 tierB-000234 tierB-000540
(And (Inheritance $v0 $v1) (Inheritance $v1 $v2))

;; p200661  kindlevel  support 11 (occ 13)  size 1  lifted 3  nisurp —  tiers tierB
;;   e.g. tierB-000110 tierB-000544 tierB-000614
(Most $v0 $v1 $v2)

;; p200662  star  support 11 (occ 13)  size 4  lifted 3  nisurp 0.257  tiers tierB
;;   e.g. tierB-000029 tierB-000043 tierB-000111
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e0) (Theme $e0 $v2))

;; p200663  star  support 11 (occ 13)  size 3  lifted 1  nisurp -0.389  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000258 tierB-000277
(And (Agent $e0 $x0) (Agent $e1 $x0) (GroupOf $x0 $v0))

;; p200664  star  support 11 (occ 14)  size 3  lifted 1  nisurp 0.441  tiers tierB
;;   e.g. tierB-000602 tierB-000963 tierB-001003
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 $v0))

;; p200665  star  support 11 (occ 11)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000082 tierB-000108 tierB-000378
(And (Future $e0) (Member $e0 $v0) (Patient $e0 $x0))

;; p200666  star  support 11 (occ 13)  size 3  lifted 2  nisurp 0.257  tiers tierB  dominated
;;   e.g. tierB-000029 tierB-000043 tierB-000111
(And (Agent $e0 $v0) (Past $e0) (Theme $e0 $v1))

;; p200667  star  support 11 (occ 13)  size 2  lifted 0  nisurp 0.441  tiers tierB  dominated
;;   e.g. tierB-000602 tierB-000963 tierB-001003
(And (Experiencer $e0 $x0) (Location $e0 $x1))

;; p200668  star  support 11 (occ 11)  size 2  lifted 0  nisurp 0.602  tiers tierB  dominated
;;   e.g. tierB-000082 tierB-000108 tierB-000378
(And (Future $e0) (Patient $e0 $x0))

;; p200669  star  support 11 (occ 12)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000044 tierB-000049 tierB-000107
(And (For $e0 $x0) (Member $e0 $v0))

;; p200670  star  support 11 (occ 11)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000005 tierB-000094 tierB-000128
(And (Manner $e0 quickly) (Member $e0 $v0))

;; p200671  star  support 11 (occ 12)  size 2  lifted 1  nisurp 0.266  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000288 tierB-000728 tierB-001113
(And (Member $x0 $v0) (Member $x0 new))

;; p200672  star  support 11 (occ 11)  size 2  lifted 1  nisurp 0.323  tiers tierB
;;   e.g. tierB-000016 tierB-000126 tierB-000285
(And (Member $x0 $v0) (Past (LocatedIn $x1 $x0)))

;; p200673  star  support 11 (occ 11)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000152 tierB-000298 tierB-000366
(And (Member $e0 $v0) (Source $e0 $v1))

;; p200674  star  support 11 (occ 11)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000079 tierB-000115 tierB-000603
(And (Member $e0 $v0) (Stimulus $e0 $v1))

;; p200675  star  support 11 (occ 12)  size 2  lifted 2  nisurp 0.323  tiers tierB
;;   e.g. tierB-000158 tierB-000439 tierB-000650
(And (Member $x0 $v0) (Most $v1 $x0 $v0))

;; p200676  star  support 11 (occ 11)  size 2  lifted 3  nisurp 0.425  tiers tierB
;;   e.g. tierB-000004 tierB-000253 tierB-000584
(And (Measure $e0 $v0 <num> $v1) (Member $e0 $v2))

;; p200677  star  support 11 (occ 13)  size 2  lifted 3  nisurp 0.323  tiers tierB
;;   e.g. tierB-000037 tierB-000057 tierB-000149
(And (Measure $x0 $v0 <num> $v1) (Member $x0 $v2))

;; p200678  star  support 11 (occ 12)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-000049 tierB-000107
(For $e0 $x0)

;; p200679  star  support 11 (occ 11)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000162 tierB-000483 tierB-001020
(GroupOf $x0 thing)

;; p200680  star  support 11 (occ 11)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000094 tierB-000128
(Manner $e0 quickly)

;; p200681  star  support 11 (occ 11)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000117 tierB-000216 tierB-000400
(Member $e0 try)

;; p200682  star  support 11 (occ 11)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000793 tierB-001182 tierB-001316
(Member $x0 man)

;; p200683  star  support 11 (occ 11)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000494 tierB-000576 tierB-000589
(Member $x0 place)

;; p200684  star  support 11 (occ 11)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000016 tierB-000047 tierB-000335
(Member $x0 table)

;; p200685  star  support 11 (occ 11)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000083 tierB-000244 tierB-000407
(Degree $x0 $v0 excessive)

;; p200686  star  support 11 (occ 13)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000237 tierB-000331 tierB-000443
(Directive (Member $x0 $v0))

;; p200687  star  support 11 (occ 11)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000152 tierB-000298 tierB-000366
(Source $e0 $v0)

;; p200688  star  support 11 (occ 11)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000079 tierB-000115 tierB-000603
(Stimulus $e0 $v0)

;; p200689  cross  support 10 (occ 12)  size 4  lifted 0  nisurp 0.454  tiers tierB
;;   e.g. tierB-000485 tierB-000720 tierB-000738
(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Past $e1))

;; p200690  cross  support 10 (occ 10)  size 4  lifted 0  nisurp 0.650  tiers tierB
;;   e.g. tierB-000470 tierB-000485 tierB-000738
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e1))

;; p200691  cross  support 10 (occ 13)  size 4  lifted 1  nisurp 0.084  tiers tierB
;;   e.g. tierB-000258 tierB-000277 tierB-000485
(And (Agent $e0 $x0) (Agent $e1 $x0) (GroupOf $x0 $v0) (Past $e0))

;; p200692  cross  support 10 (occ 10)  size 4  lifted 1  nisurp 0.151  tiers tierB
;;   e.g. tierB-000063 tierB-000277 tierB-000780
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Past $e0) (Patient $e0 $x1))

;; p200693  cross  support 10 (occ 10)  size 4  lifted 1  nisurp 0.047  tiers tierB
;;   e.g. tierB-000018 tierB-000658 tierB-001068
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Past $e0) (Theme $e0 $x1))

;; p200694  cross  support 10 (occ 12)  size 4  lifted 1  nisurp 0.131  tiers tierB
;;   e.g. tierB-000045 tierB-000291 tierB-000305
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 $v0) (Past $e0))

;; p200695  cross  support 10 (occ 13)  size 4  lifted 1  nisurp 0.006  tiers tierB
;;   e.g. tierB-000339 tierB-000470 tierB-000830
(And (Agent $e0 $x0) (Member $x0 $v0) (Past $e1) (Theme $e1 $e0))

;; p200696  cross  support 10 (occ 11)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000100 tierB-000453 tierB-000930
(And (Agent $e0 $x0) (Future $e0) (Member $e0 $v0) (Member $x0 $v1))

;; p200697  cross  support 10 (occ 11)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Past $e1) (Result $e1 $e0))

;; p200698  cross  support 10 (occ 10)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Experiencer $e0 $v0) (Member $e1 $v1) (Past $e1) (Result $e1 $e0))

;; p200699  cross  support 10 (occ 11)  size 4  lifted 2  nisurp 0.621  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Experiencer $e0 $v0) (Member $v0 $v1) (Past $e1) (Result $e1 $e0))

;; p200700  cross  support 10 (occ 16)  size 4  lifted 2  nisurp 0.317  tiers tierB
;;   e.g. tierB-000602 tierB-000963 tierB-001003
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 $v0) (Member $x0 $v1))

;; p200701  cross  support 10 (occ 11)  size 4  lifted 2  nisurp 0.322  tiers tierB
;;   e.g. tierB-000215 tierB-000379 tierB-000579
(And (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Past $e0) (Theme $e0 $x0))

;; p200702  cross  support 10 (occ 10)  size 4  lifted 2  nisurp -0.722  tiers tierB
;;   e.g. tierB-000063 tierB-000265 tierB-000302
(And (Member $e0 $v0) (Member $e1 $v1) (Patient $e0 $x0) (Patient $e1 $x0))

;; p200703  cross  support 10 (occ 11)  size 4  lifted 2  nisurp 0.621  tiers tierB
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Member $e0 $v1) (Member $v0 $v1) (Past $e1) (Result $e1 $e0))

;; p200704  cross  support 10 (occ 11)  size 4  lifted 3  nisurp 0.217  tiers tierB
;;   e.g. tierB-000107 tierB-000115 tierB-000203
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Member $e1 $v2))

;; p200705  cross  support 10 (occ 11)  size 4  lifted 3  nisurp -0.015  tiers tierB
;;   e.g. tierB-000162 tierB-000198 tierB-000215
(And (Agent $e0 $v0) (GroupOf $x0 $v1) (Member $e0 $v2) (Theme $e0 $x0))

;; p200706  cross  support 10 (occ 15)  size 4  lifted 3  nisurp -0.682  tiers tierB
;;   e.g. tierB-000004 tierB-000063 tierB-000089
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p200707  cross  support 10 (occ 13)  size 4  lifted 3  nisurp -0.709  tiers tierB
;;   e.g. tierB-000089 tierB-000120 tierB-000795
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Theme $e0 $x0))

;; p200708  cross  support 10 (occ 15)  size 4  lifted 3  nisurp 0.193  tiers tierB
;;   e.g. tierB-000145 tierB-000358 tierB-000510
(And (Holder $e0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Theme $e0 $x0))

;; p200709  cross  support 10 (occ 11)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000453 tierB-000930
(And (Agent $e0 $x0) (Future $e0) (Member $x0 $v0))

;; p200710  cross  support 10 (occ 10)  size 3  lifted 1  nisurp 0.621  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Experiencer $e0 $v0) (Past $e1) (Result $e1 $e0))

;; p200711  cross  support 10 (occ 14)  size 3  lifted 1  nisurp 0.317  tiers tierB  dominated
;;   e.g. tierB-000602 tierB-000963 tierB-001003
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x0 $v0))

;; p200712  cross  support 10 (occ 10)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(And (Member $e0 $v0) (Member $x0 door) (Patient $e0 $x0))

;; p200713  cross  support 10 (occ 20)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000265 tierB-000302
(And (Member $e0 $v0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p200714  cross  support 10 (occ 11)  size 3  lifted 2  nisurp 0.206  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000115 tierB-000203
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1))

;; p200715  cross  support 10 (occ 11)  size 3  lifted 2  nisurp 0.217  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000115 tierB-000203
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e1 $v1))

;; p200716  cross  support 10 (occ 11)  size 3  lifted 2  nisurp -0.015  tiers tierB  dominated
;;   e.g. tierB-000162 tierB-000198 tierB-000215
(And (Agent $e0 $v0) (GroupOf $x0 $v1) (Theme $e0 $x0))

;; p200717  cross  support 10 (occ 15)  size 3  lifted 2  nisurp 0.317  tiers tierB
;;   e.g. tierB-000044 tierB-000049 tierB-000107
(And (For $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p200718  cross  support 10 (occ 15)  size 3  lifted 2  nisurp 0.193  tiers tierB  dominated
;;   e.g. tierB-000145 tierB-000358 tierB-000510
(And (Holder $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0))

;; p200719  cross  support 10 (occ 11)  size 3  lifted 2  nisurp 0.131  tiers tierB
;;   e.g. tierB-000150 tierB-000547 tierB-000715
(And (Member $e0 $v0) (Member $x0 $v1) (Recipient $e0 $x0))

;; p200720  cross  support 10 (occ 11)  size 2  lifted 1  nisurp 0.206  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000115 tierB-000203
(And (Agent $e0 $v0) (Experiencer $e1 $v0))

;; p200721  kindlevel  support 10 (occ 12)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000136 tierB-000675 tierB-000758
(Inheritance $v0 $v1) ~NEG

;; p200722  kindlevel  support 10 (occ 13)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000084 tierB-000140 tierB-000480
(LocatedIn $v0 $v1)

;; p200723  star  support 10 (occ 10)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000453 tierB-000930
(And (Agent $e0 $x0) (Future $e0) (Member $e0 $v0))

;; p200724  star  support 10 (occ 10)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000005 tierB-000094 tierB-000128
(And (Manner $e0 quickly) (Member $e0 $v0) (Past $e0))

;; p200725  star  support 10 (occ 10)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000025 tierB-000319 tierB-000824
(And (Agent $e0 $v0) (Can $e0) (Member $e0 $v1))

;; p200726  star  support 10 (occ 15)  size 3  lifted 2  nisurp -0.398  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000063 tierB-000089
(And (GroupOf $x0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p200727  star  support 10 (occ 13)  size 3  lifted 2  nisurp -0.447  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-000120 tierB-000795
(And (GroupOf $x0 $v0) (Member $x0 $v1) (Theme $e0 $x0))

;; p200728  star  support 10 (occ 10)  size 3  lifted 2  nisurp 0.033  tiers tierB
;;   e.g. tierB-000299 tierB-000303 tierB-000571
(And (Member $e0 $v0) (Theme $e0 $x0) (Time $e0 $v1))

;; p200729  star  support 10 (occ 10)  size 2  lifted 0  nisurp 0.480  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000453 tierB-000930
(And (Agent $e0 $x0) (Future $e0))

;; p200730  star  support 10 (occ 10)  size 2  lifted 0  nisurp 0.679  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000094 tierB-000128
(And (Manner $e0 quickly) (Past $e0))

;; p200731  star  support 10 (occ 11)  size 2  lifted 0  nisurp 0.592  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000012 tierB-000115 tierB-000204
(And (Member $e0 go) (Past $e0))

;; p200732  star  support 10 (occ 10)  size 2  lifted 0  nisurp 0.021  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000162 tierB-000665 tierB-000730
(And (Member $e0 have) (Past $e0))

;; p200733  star  support 10 (occ 10)  size 2  lifted 0  nisurp 0.808  tiers tierB  dominated
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(And (Member $x0 door) (Patient $e0 $x0))

;; p200734  star  support 10 (occ 10)  size 2  lifted 0  nisurp 2.656  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000265 tierB-000302
(And (Patient $e0 $x0) (Patient $e1 $x0))

;; p200735  star  support 10 (occ 10)  size 2  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000025 tierB-000319 tierB-000824
(And (Agent $e0 $v0) (Can $e0))

;; p200736  star  support 10 (occ 15)  size 2  lifted 1  nisurp 0.317  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-000049 tierB-000107
(And (For $e0 $x0) (Member $x0 $v0))

;; p200737  star  support 10 (occ 10)  size 2  lifted 1  nisurp 0.975  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000162 tierB-000333 tierB-000358
(And (Holder $e0 $v0) (Member $e0 have))

;; p200738  star  support 10 (occ 10)  size 2  lifted 1  nisurp 0.927  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000268 tierB-000282 tierB-000404
(And (Member $e0 use) (Theme $e0 $v0))

;; p200739  star  support 10 (occ 12)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000024 tierB-000137 tierB-000527
(And (Member $x0 $v0) (Member $x0 good))

;; p200740  star  support 10 (occ 11)  size 2  lifted 1  nisurp 0.131  tiers tierB  dominated
;;   e.g. tierB-000150 tierB-000547 tierB-000715
(And (Member $x0 $v0) (Recipient $e0 $x0))

;; p200741  star  support 10 (occ 10)  size 2  lifted 1  nisurp 0.033  tiers tierB  dominated
;;   e.g. tierB-000299 tierB-000303 tierB-000571
(And (Theme $e0 $x0) (Time $e0 $v0))

;; p200742  star  support 10 (occ 10)  size 2  lifted 2  nisurp 0.964  tiers tierB
;;   e.g. tierB-000167 tierB-000505 tierB-000536
(And (Past (Degree $x0 $v0 $v1)) (Past (Member $x0 $v0)))

;; p200743  star  support 10 (occ 10)  size 2  lifted 3  nisurp 0.255  tiers tierB
;;   e.g. tierB-000167 tierB-000505 tierB-000536
(And (Member $x0 $v0) (Past (Degree $x0 $v1 $v2)))

;; p200744  star  support 10 (occ 10)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000075 tierB-000173 tierB-000182
(Member $e0 begin)

;; p200745  star  support 10 (occ 10)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000004 tierB-000100 tierB-000298
(Member $e0 leave)

;; p200746  star  support 10 (occ 10)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000252 tierB-000309 tierB-000942
(Member $e0 take)

;; p200747  star  support 10 (occ 11)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000295 tierB-000458 tierB-000703
(Member $x0 book)

;; p200748  star  support 10 (occ 10)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000024 tierB-000073 tierB-000250
(Member $x0 cat)

;; p200749  star  support 10 (occ 12)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000024 tierB-000137 tierB-000527
(Member $x0 good)

;; p200750  star  support 10 (occ 11)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000176 tierB-000277 tierB-000668
(Member $x0 tree)

;; p200751  star  support 10 (occ 11)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000104 tierB-000168 tierB-000740
(Future (Member $x0 $v0))

;; p200752  star  support 10 (occ 10)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000088 tierB-000267 tierB-000269
(More $v0 $x0 $x1)

;; p200753  star  support 10 (occ 14)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000187 tierB-000655 tierB-000989
(PartOf $v0 $x0)

;; p200754  cross  support 9 (occ 9)  size 4  lifted 0  nisurp 0.611  tiers tierB  signal conj-pattern
;;   e.g. tierB-000199 tierB-000265 tierB-000534
(And (Member $e0 start) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))

;; p200755  cross  support 9 (occ 12)  size 4  lifted 1  nisurp 0.172  tiers tierB
;;   e.g. tierB-000720 tierB-000782 tierB-000942
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 $v0) (Ongoing $e0))

;; p200756  cross  support 9 (occ 12)  size 4  lifted 1  nisurp 0.172  tiers tierB
;;   e.g. tierB-000470 tierB-000942 tierB-001052
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 $v0) (Theme $e0 $e1))

;; p200757  cross  support 9 (occ 9)  size 4  lifted 1  nisurp 0.056  tiers tierB
;;   e.g. tierB-000063 tierB-000338 tierB-000506
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Past $e0) (Patient $e0 $x1))

;; p200758  cross  support 9 (occ 9)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000738 tierB-000930
(And (Agent $e0 $x0) (Member $e0 $v0) (Ongoing $e1) (Theme $e0 $e1))

;; p200759  cross  support 9 (occ 9)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000485 tierB-000738 tierB-000930
(And (Agent $e0 $x0) (Member $e1 $v0) (Ongoing $e1) (Theme $e0 $e1))

;; p200760  cross  support 9 (occ 10)  size 4  lifted 1  nisurp -0.140  tiers tierB
;;   e.g. tierB-000231 tierB-000381 tierB-000426
(And (Agent $e0 $x0) (Member $x0 $v0) (Ongoing $e0) (Past $e0))

;; p200761  cross  support 9 (occ 9)  size 4  lifted 1  nisurp 0.611  tiers tierB
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Experiencer $e0 $v0) (Past $e1) (Patient $e1 $v0) (Result $e1 $e0))

;; p200762  cross  support 9 (occ 9)  size 4  lifted 1  nisurp 0.470  tiers tierB  signal conj-pattern
;;   e.g. tierB-000142 tierB-000494 tierB-000797
(And (GroupOf $x0 $v0) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))

;; p200763  cross  support 9 (occ 10)  size 4  lifted 1  nisurp 0.163  tiers tierB
;;   e.g. tierB-000034 tierB-000291 tierB-000383
(And (Location $e0 $x0) (Member $x0 $v0) (Past $e0) (Patient $e0 $x1))

;; p200764  cross  support 9 (occ 10)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000199 tierB-000265 tierB-000534
(And (Member $e0 $v0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))

;; p200765  cross  support 9 (occ 10)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000117 tierB-000171
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Ongoing $e0))

;; p200766  cross  support 9 (occ 10)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000075 tierB-000117 tierB-000171
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Ongoing $e1))

;; p200767  cross  support 9 (occ 11)  size 4  lifted 2  nisurp 0.408  tiers tierB  dominated
;;   e.g. tierB-000137 tierB-000147 tierB-000198
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Theme $e0 $x0))

;; p200768  cross  support 9 (occ 11)  size 4  lifted 2  nisurp 0.408  tiers tierB
;;   e.g. tierB-000137 tierB-000147 tierB-000198
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Theme $e1 $x0))

;; p200769  cross  support 9 (occ 10)  size 4  lifted 2  nisurp -0.104  tiers tierB  dominated
;;   e.g. tierB-000462 tierB-000470 tierB-001055
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 $v0) (Member $x0 $v1))

;; p200770  cross  support 9 (occ 10)  size 4  lifted 2  nisurp -0.104  tiers tierB
;;   e.g. tierB-000462 tierB-000470 tierB-001055
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $x0 $v0) (Member $x1 $v1))

;; p200771  cross  support 9 (occ 9)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000359 tierB-000991 tierB-001125
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Location $e0 $x1) (Member $e0 $v1))

;; p200772  cross  support 9 (occ 11)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000359 tierB-000991 tierB-001125
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Location $e0 $x1) (Member $x1 $v1))

;; p200773  cross  support 9 (occ 9)  size 4  lifted 2  nisurp 0.448  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000738 tierB-000830
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Theme $e0 $e1))

;; p200774  cross  support 9 (occ 9)  size 4  lifted 2  nisurp 0.448  tiers tierB
;;   e.g. tierB-000485 tierB-000738 tierB-000830
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e1 $v1) (Theme $e0 $e1))

;; p200775  cross  support 9 (occ 12)  size 4  lifted 2  nisurp -0.222  tiers tierB
;;   e.g. tierB-000688 tierB-001001 tierB-001055
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0) (Past $e0))

;; p200776  cross  support 9 (occ 11)  size 4  lifted 2  nisurp -0.605  tiers tierB
;;   e.g. tierB-000607 tierB-000713 tierB-000783
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $x1 $v0) (Theme $e0 $x1))

;; p200777  cross  support 9 (occ 10)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Past $e1) (Patient $e1 $v0))

;; p200778  cross  support 9 (occ 9)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Experiencer $e0 $v0) (Member $e1 $v1) (Past $e1) (Patient $e1 $v0))

;; p200779  cross  support 9 (occ 10)  size 4  lifted 2  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Experiencer $e0 $v0) (Member $v0 $v1) (Past $e1) (Patient $e1 $v0))

;; p200780  cross  support 9 (occ 11)  size 4  lifted 2  nisurp 0.241  tiers tierB
;;   e.g. tierB-001003 tierB-001041 tierB-001078
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 $v0) (Member $x1 $v1))

;; p200781  cross  support 9 (occ 9)  size 4  lifted 2  nisurp 0.470  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000494 tierB-000797
(And (GroupOf $x0 $v0) (Holder $e0 $x1) (Member $e0 $v1) (Theme $e0 $x0))

;; p200782  cross  support 9 (occ 10)  size 4  lifted 2  nisurp -0.134  tiers tierB  dominated
;;   e.g. tierB-000291 tierB-000383 tierB-000403
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Patient $e0 $x1))

;; p200783  cross  support 9 (occ 11)  size 4  lifted 2  nisurp -0.049  tiers tierB
;;   e.g. tierB-000291 tierB-000383 tierB-000403
(And (Location $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Patient $e0 $x1))

;; p200784  cross  support 9 (occ 12)  size 4  lifted 2  nisurp 0.103  tiers tierB
;;   e.g. tierB-000005 tierB-000094 tierB-000389
(And (Manner $e0 $v0) (Member $x0 $v1) (Past $e0) (Patient $e0 $x0))

;; p200785  cross  support 9 (occ 10)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Member $e0 $v0) (Past $e1) (Patient $e1 $v1) (Result $e1 $e0))

;; p200786  cross  support 9 (occ 10)  size 4  lifted 2  nisurp 0.356  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Member $e0 $v1) (Member $v0 $v1) (Past $e1) (Patient $e1 $v0))

;; p200787  cross  support 9 (occ 10)  size 4  lifted 2  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Member $v0 $v1) (Past $e0) (Patient $e0 $v0) (Result $e0 $e1))

;; p200788  cross  support 9 (occ 12)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000139 tierB-000171
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Theme $e0 $v2))

;; p200789  cross  support 9 (occ 12)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000117 tierB-000139 tierB-000171
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Theme $e1 $v2))

;; p200790  cross  support 9 (occ 10)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000004 tierB-000325 tierB-000392
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Result $e0 $e1))

;; p200791  cross  support 9 (occ 10)  size 4  lifted 3  nisurp 0.103  tiers tierB
;;   e.g. tierB-000256 tierB-000345 tierB-000692
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $v2))

;; p200792  cross  support 9 (occ 10)  size 4  lifted 3  nisurp -0.473  tiers tierB
;;   e.g. tierB-000419 tierB-000654 tierB-000688
(And (Experiencer $e0 $x0) (Inheritance $v0 $v1) (Member $e0 $v2) (Member $x0 $v0))

;; p200793  cross  support 9 (occ 12)  size 4  lifted 3  nisurp -0.637  tiers tierB
;;   e.g. tierB-000677 tierB-000680 tierB-000799
(And (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Member $e0 $v2) (Patient $e0 $x0))

;; p200794  cross  support 9 (occ 11)  size 4  lifted 3  nisurp -0.381  tiers tierB
;;   e.g. tierB-000170 tierB-000192 tierB-000581
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Member $x0 $v0) (Patient $e0 $x0))

;; p200795  cross  support 9 (occ 12)  size 4  lifted 3  nisurp 0.221  tiers tierB
;;   e.g. tierB-000043 tierB-000292 tierB-000309
(And (Inheritance $v0 $v1) (Member $e0 $v2) (Past $e0) (Theme $e0 $v0))

;; p200796  cross  support 9 (occ 12)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000117 tierB-000173 tierB-000288
(And (Member $e0 $v0) (Member $e1 $v1) (Theme $e0 $e1) (Theme $e1 $v2))

;; p200797  cross  support 9 (occ 10)  size 4  lifted 3  nisurp 0.175  tiers tierB
;;   e.g. tierB-000303 tierB-000571 tierB-001171
(And (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0) (Time $e0 $v2))

;; p200798  cross  support 9 (occ 14)  size 4  lifted 3  nisurp -0.623  tiers tierB
;;   e.g. tierB-000501 tierB-000678 tierB-000919
(And (Member $x0 $v0) (Member $x0 $v1) (Member $x1 $v2) (Possession $x0 $x1))

;; p200799  cross  support 9 (occ 9)  size 4  lifted 4  nisurp 0.115  tiers tierB
;;   e.g. tierB-000015 tierB-000118 tierB-000268
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Member $e0 $v3) (Theme $e0 $v0))

;; p200800  cross  support 9 (occ 9)  size 3  lifted 0  nisurp 0.603  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000738 tierB-000930
(And (Agent $e0 $x0) (Ongoing $e1) (Theme $e0 $e1))

;; p200801  cross  support 9 (occ 10)  size 3  lifted 1  nisurp 0.601  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000117 tierB-000171
(And (Agent $e0 $v0) (Agent $e1 $v0) (Ongoing $e0))

;; p200802  cross  support 9 (occ 11)  size 3  lifted 1  nisurp 0.408  tiers tierB  dominated
;;   e.g. tierB-000137 tierB-000147 tierB-000198
(And (Agent $e0 $v0) (Agent $e1 $v0) (Theme $e0 $x0))

;; p200803  cross  support 9 (occ 10)  size 3  lifted 1  nisurp -0.104  tiers tierB  dominated
;;   e.g. tierB-000462 tierB-000470 tierB-001055
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $x0 $v0))

;; p200804  cross  support 9 (occ 9)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000359 tierB-000991 tierB-001125
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Location $e0 $x1))

;; p200805  cross  support 9 (occ 9)  size 3  lifted 1  nisurp 0.448  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000738 tierB-000830
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Theme $e0 $e1))

;; p200806  cross  support 9 (occ 11)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000316 tierB-000338 tierB-000628
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 person))

;; p200807  cross  support 9 (occ 9)  size 3  lifted 1  nisurp 0.579  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Experiencer $e0 $v0) (Past $e1) (Patient $e1 $v0))

;; p200808  cross  support 9 (occ 11)  size 3  lifted 1  nisurp 0.241  tiers tierB  dominated
;;   e.g. tierB-001003 tierB-001041 tierB-001078
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x1 $v0))

;; p200809  cross  support 9 (occ 9)  size 3  lifted 1  nisurp 0.470  tiers tierB  dominated
;;   e.g. tierB-000142 tierB-000494 tierB-000797
(And (GroupOf $x0 $v0) (Holder $e0 $x1) (Theme $e0 $x0))

;; p200810  cross  support 9 (occ 10)  size 3  lifted 1  nisurp -0.121  tiers tierB  dominated
;;   e.g. tierB-000291 tierB-000383 tierB-000403
(And (Location $e0 $x0) (Member $x1 $v0) (Patient $e0 $x1))

;; p200811  cross  support 9 (occ 10)  size 3  lifted 1  nisurp -0.043  tiers tierB  signal conj-pattern
;;   e.g. tierB-000080 tierB-000252 tierB-000865
(And (Member $e0 $v0) (Member $x0 thing) (Theme $e0 $x0))

;; p200812  cross  support 9 (occ 12)  size 3  lifted 2  nisurp 0.662  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000139 tierB-000171
(And (Agent $e0 $v0) (Agent $e1 $v0) (Theme $e0 $v1))

;; p200813  cross  support 9 (occ 10)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000325 tierB-000392
(And (Agent $e0 $v0) (Member $e1 $v1) (Result $e0 $e1))

;; p200814  cross  support 9 (occ 10)  size 3  lifted 2  nisurp 0.103  tiers tierB  dominated
;;   e.g. tierB-000256 tierB-000345 tierB-000692
(And (Agent $e0 $x0) (Member $x0 $v0) (Patient $e0 $v1))

;; p200815  cross  support 9 (occ 9)  size 3  lifted 2  nisurp 0.279  tiers tierB  dominated
;;   e.g. tierB-000419 tierB-000654 tierB-000688
(And (Experiencer $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0))

;; p200816  cross  support 9 (occ 12)  size 3  lifted 2  nisurp -0.376  tiers tierB  dominated
;;   e.g. tierB-000677 tierB-000680 tierB-000799
(And (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Patient $e0 $x0))

;; p200817  cross  support 9 (occ 12)  size 3  lifted 2  nisurp 0.221  tiers tierB  dominated
;;   e.g. tierB-000043 tierB-000292 tierB-000309
(And (Inheritance $v0 $v1) (Past $e0) (Theme $e0 $v0))

;; p200818  cross  support 9 (occ 12)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000288
(And (Member $e0 $v0) (Theme $e0 $e1) (Theme $e1 $v1))

;; p200819  cross  support 9 (occ 10)  size 3  lifted 2  nisurp 0.175  tiers tierB  dominated
;;   e.g. tierB-000303 tierB-000571 tierB-001171
(And (Member $x0 $v0) (Theme $e0 $x0) (Time $e0 $v1))

;; p200820  cross  support 9 (occ 9)  size 3  lifted 3  nisurp 0.115  tiers tierB  dominated
;;   e.g. tierB-000015 tierB-000118 tierB-000268
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Theme $e0 $v0))

;; p200821  cross  support 9 (occ 12)  size 3  lifted 3  nisurp -0.473  tiers tierB
;;   e.g. tierB-000404 tierB-000456 tierB-000539
(And (Inheritance $v0 $v1) (Member $e0 $v2) (Patient $e0 $v0))

;; p200822  cross  support 9 (occ 11)  size 2  lifted 2  nisurp 0.663  tiers tierB  dominated
;;   e.g. tierB-000404 tierB-000456 tierB-000539
(And (Inheritance $v0 $v1) (Patient $e0 $v0))

;; p200823  star  support 9 (occ 9)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000036 tierB-000316 tierB-000381
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 $v0) (Ongoing $e0))

;; p200824  star  support 9 (occ 9)  size 4  lifted 1  nisurp 0.218  tiers tierB
;;   e.g. tierB-000520 tierB-000713 tierB-000784
(And (Agent $e0 $x0) (Member $e0 $v0) (Ongoing $e0) (Theme $e0 $x1))

;; p200825  star  support 9 (occ 11)  size 4  lifted 1  nisurp 0.190  tiers tierB
;;   e.g. tierB-000008 tierB-000148 tierB-000381
(And (Location $e0 $x0) (Member $e0 $v0) (Ongoing $e0) (Past $e0))

;; p200826  star  support 9 (occ 9)  size 4  lifted 1  nisurp 0.118  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000291 tierB-000383
(And (Location $e0 $x0) (Member $e0 $v0) (Past $e0) (Patient $e0 $x1))

;; p200827  star  support 9 (occ 12)  size 4  lifted 2  nisurp 0.091  tiers tierB
;;   e.g. tierB-000231 tierB-000354 tierB-000769
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e0) (Theme $e0 $v1))

;; p200828  star  support 9 (occ 9)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Member $e0 $v0) (Past $e0) (Patient $e0 $v1) (Result $e0 $e1))

;; p200829  star  support 9 (occ 9)  size 3  lifted 0  nisurp 0.548  tiers tierB  dominated
;;   e.g. tierB-000036 tierB-000316 tierB-000381
(And (Agent $e0 $x0) (Location $e0 $x1) (Ongoing $e0))

;; p200830  star  support 9 (occ 9)  size 3  lifted 0  nisurp 0.218  tiers tierB  dominated
;;   e.g. tierB-000520 tierB-000713 tierB-000784
(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $x1))

;; p200831  star  support 9 (occ 11)  size 3  lifted 0  nisurp 0.190  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000148 tierB-000381
(And (Location $e0 $x0) (Ongoing $e0) (Past $e0))

;; p200832  star  support 9 (occ 9)  size 3  lifted 0  nisurp 0.118  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000291 tierB-000383
(And (Location $e0 $x0) (Past $e0) (Patient $e0 $x1))

;; p200833  star  support 9 (occ 9)  size 3  lifted 0  nisurp -0.070  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000162 tierB-000665 tierB-000730
(And (Member $e0 have) (Past $e0) (Theme $e0 $x0))

;; p200834  star  support 9 (occ 9)  size 3  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000199 tierB-000265 tierB-000534
(And (Member $e0 start) (Past $e0) (Theme $e0 $e1))

;; p200835  star  support 9 (occ 9)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000485 tierB-000715 tierB-000769
(And (Agent $e0 $x0) (Member $e0 $v0) (Recipient $e0 $x1))

;; p200836  star  support 9 (occ 12)  size 3  lifted 1  nisurp 0.091  tiers tierB  dominated
;;   e.g. tierB-000231 tierB-000354 tierB-000769
(And (Agent $e0 $x0) (Past $e0) (Theme $e0 $v0))

;; p200837  star  support 9 (occ 9)  size 3  lifted 1  nisurp 0.860  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000162 tierB-000333 tierB-000358
(And (Holder $e0 $v0) (Member $e0 have) (Theme $e0 $x0))

;; p200838  star  support 9 (occ 9)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000222 tierB-000392 tierB-000444
(And (Instrument $e0 $x0) (Member $e0 $v0) (Past $e0))

;; p200839  star  support 9 (occ 9)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000037 tierB-000080 tierB-000246
(And (Member $e0 $v0) (Obligated $e0) (Theme $e0 $x0))

;; p200840  star  support 9 (occ 10)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000150 tierB-000769 tierB-000775
(And (Member $e0 $v0) (Past $e0) (Recipient $e0 $x0))

;; p200841  star  support 9 (occ 9)  size 3  lifted 1  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000228 tierB-000256 tierB-000325
(And (Past $e0) (Patient $e0 $v0) (Result $e0 $e1))

;; p200842  star  support 9 (occ 9)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000325 tierB-000392
(And (Agent $e0 $v0) (Member $e0 $v1) (Result $e0 $e1))

;; p200843  star  support 9 (occ 10)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000288
(And (Member $e0 $v0) (Theme $e0 $v1) (Theme $e1 $e0))

;; p200844  star  support 9 (occ 13)  size 3  lifted 2  nisurp -0.393  tiers tierB  dominated
;;   e.g. tierB-000501 tierB-000678 tierB-000919
(And (Member $x0 $v0) (Member $x0 $v1) (Possession $x0 $x1))

;; p200845  star  support 9 (occ 9)  size 3  lifted 3  nisurp 0.310  tiers tierB
;;   e.g. tierB-000167 tierB-000505 tierB-000536
(And (Member $x0 $v0) (Past (Degree $x0 $v1 $v2)) (Past (Member $x0 $v1)))

;; p200846  star  support 9 (occ 11)  size 2  lifted 0  nisurp 0.765  tiers tierB  dominated
;;   e.g. tierB-000316 tierB-000338 tierB-000628
(And (Agent $e0 $x0) (Member $x0 person))

;; p200847  star  support 9 (occ 9)  size 2  lifted 0  nisurp 0.747  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000715 tierB-000769
(And (Agent $e0 $x0) (Recipient $e0 $x1))

;; p200848  star  support 9 (occ 9)  size 2  lifted 0  nisurp 0.546  tiers tierB  dominated
;;   e.g. tierB-000222 tierB-000392 tierB-000444
(And (Instrument $e0 $x0) (Past $e0))

;; p200849  star  support 9 (occ 9)  size 2  lifted 0  nisurp 0.287  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000073 tierB-000325 tierB-000539
(And (Member $e0 make) (Past $e0))

;; p200850  star  support 9 (occ 9)  size 2  lifted 0  nisurp 0.711  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000192 tierB-000265 tierB-000654
(And (Member $e0 start) (Patient $e0 $x0))

;; p200851  star  support 9 (occ 10)  size 2  lifted 0  nisurp 0.047  tiers tierB  dominated
;;   e.g. tierB-000080 tierB-000252 tierB-000865
(And (Member $x0 thing) (Theme $e0 $x0))

;; p200852  star  support 9 (occ 9)  size 2  lifted 0  nisurp 0.637  tiers tierB  dominated
;;   e.g. tierB-000037 tierB-000080 tierB-000246
(And (Obligated $e0) (Theme $e0 $x0))

;; p200853  star  support 9 (occ 10)  size 2  lifted 0  nisurp 0.546  tiers tierB  dominated
;;   e.g. tierB-000150 tierB-000769 tierB-000775
(And (Past $e0) (Recipient $e0 $x0))

;; p200854  star  support 9 (occ 10)  size 2  lifted 1  nisurp 0.831  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000012 tierB-000115 tierB-000204
(And (Agent $e0 $v0) (Member $e0 go))

;; p200855  star  support 9 (occ 10)  size 2  lifted 1  nisurp 0.734  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000025 tierB-000173 tierB-000325
(And (Agent $e0 $v0) (Member $e0 make))

;; p200856  star  support 9 (occ 9)  size 2  lifted 1  nisurp 0.565  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000325 tierB-000392
(And (Agent $e0 $v0) (Result $e0 $e1))

;; p200857  star  support 9 (occ 9)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000370 tierB-000792 tierB-000797
(And (Member $e0 $v0) (Only $x0 $e0))

;; p200858  star  support 9 (occ 9)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000495 tierB-000517 tierB-001521
(And (Member $e0 $v0) (Probably $e0))

;; p200859  star  support 9 (occ 10)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000267 tierB-000334 tierB-000471
(And (Member $x0 $v0) (Member $x0 old))

;; p200860  star  support 9 (occ 9)  size 2  lifted 1  nisurp 4.175  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000082 tierB-000093 tierB-000370
(And (Member $x0 $v0) (Member $x0 thing))

;; p200861  star  support 9 (occ 10)  size 2  lifted 1  nisurp 0.684  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000288
(And (Theme $e0 $e1) (Theme $e1 $v0))

;; p200862  star  support 9 (occ 10)  size 2  lifted 2  nisurp 0.103  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000107 tierB-000174 tierB-000263
(And (Degree $x0 quantity $v0) (Member $x0 $v1))

;; p200863  star  support 9 (occ 9)  size 2  lifted 2  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000004 tierB-000253 tierB-000593
(And (Measure $e0 duration <num> $v0) (Member $e0 $v1))

;; p200864  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000194 tierB-000456 tierB-000609
(Member $e0 fall)

;; p200865  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000176 tierB-000189 tierB-000421
(Member $e0 hear)

;; p200866  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000061 tierB-000086 tierB-000107
(Member $e0 need)

;; p200867  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000089 tierB-000160 tierB-000648
(Member $e0 play)

;; p200868  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000203 tierB-000225 tierB-000253
(Member $e0 study)

;; p200869  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000144 tierB-000212 tierB-000419
(Member $e0 work)

;; p200870  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000872 tierB-000904 tierB-001016
(Member $x0 beautiful)

;; p200871  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000083 tierB-000190 tierB-000327
(Member $x0 car)

;; p200872  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000153 tierB-000546 tierB-000680
(Member $x0 city)

;; p200873  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000340 tierB-000537 tierB-000871
(Member $x0 dog)

;; p200874  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000267 tierB-000334 tierB-000471
(Member $x0 old)

;; p200875  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000294 tierB-000468 tierB-000582
(Member $x0 road)

;; p200876  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000792 tierB-000797
(Only $x0 $e0)

;; p200877  star  support 9 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000495 tierB-000517 tierB-001521
(Probably $e0)

;; p200878  star  support 9 (occ 9)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000253 tierB-000593
(Measure $e0 duration <num> $v0)

;; p200879  star  support 9 (occ 13)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000065 tierB-000495 tierB-000662
(Probably (Member $x0 $v0))

;; p200880  star  support 9 (occ 9)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000053 tierB-000426 tierB-000481
(Degree $e0 $v0 $v1)

;; p200881  cross  support 8 (occ 8)  size 4  lifted 0  nisurp 0.817  tiers tierB
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(And (Agent $e0 $x0) (Agent $e1 $x0) (Ongoing $e0) (Theme $e1 $e0))

;; p200882  cross  support 8 (occ 8)  size 4  lifted 1  nisurp 0.586  tiers tierB
;;   e.g. tierB-000485 tierB-000738 tierB-000830
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Past $e0) (Theme $e0 $e1))

;; p200883  cross  support 8 (occ 8)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(And (Agent $e0 $x0) (Member $e1 $v0) (Ongoing $e0) (Theme $e1 $e0))

;; p200884  cross  support 8 (occ 11)  size 4  lifted 1  nisurp -0.242  tiers tierB
;;   e.g. tierB-000470 tierB-000942 tierB-001052
(And (Agent $e0 $x0) (Member $x0 $v0) (Past $e0) (Theme $e0 $e1))

;; p200885  cross  support 8 (occ 11)  size 4  lifted 1  nisurp 0.301  tiers tierB
;;   e.g. tierB-000520 tierB-000713 tierB-001068
(And (Agent $e0 $x0) (Member $x1 $v0) (Ongoing $e0) (Theme $e0 $x1))

;; p200886  cross  support 8 (occ 12)  size 4  lifted 2  nisurp 0.301  tiers tierB
;;   e.g. tierB-000137 tierB-000147 tierB-000252
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $x0 $v1) (Theme $e0 $x0))

;; p200887  cross  support 8 (occ 9)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000325 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Member $e1 $v1) (Past $e0) (Result $e0 $e1))

;; p200888  cross  support 8 (occ 9)  size 4  lifted 2  nisurp -0.191  tiers tierB
;;   e.g. tierB-000338 tierB-000506 tierB-000634
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Member $x0 $v1) (Patient $e0 $x1))

;; p200889  cross  support 8 (occ 9)  size 4  lifted 2  nisurp 0.301  tiers tierB
;;   e.g. tierB-000715 tierB-000769 tierB-000775
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Recipient $e0 $x1))

;; p200890  cross  support 8 (occ 10)  size 4  lifted 2  nisurp -0.572  tiers tierB
;;   e.g. tierB-000208 tierB-001163 tierB-001285
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Patient $e0 $x1))

;; p200891  cross  support 8 (occ 13)  size 4  lifted 2  nisurp 0.319  tiers tierB
;;   e.g. tierB-000132 tierB-000237 tierB-000238
(And (Agent $e0 $x0) (Member $x0 $v0) (Past $e0) (Time $e0 $v1))

;; p200892  cross  support 8 (occ 10)  size 4  lifted 2  nisurp 0.296  tiers tierB
;;   e.g. tierB-000101 tierB-000133 tierB-000379
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Member $e0 $v1) (Theme $e0 $x0))

;; p200893  cross  support 8 (occ 10)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000009 tierB-000189 tierB-000421
(And (Experiencer $e0 $v0) (Member $x0 $v1) (Past $e0) (Stimulus $e0 $x0))

;; p200894  cross  support 8 (occ 11)  size 4  lifted 2  nisurp 0.224  tiers tierB
;;   e.g. tierB-001003 tierB-001041 tierB-001078
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x0 $v0) (Member $x1 $v1))

;; p200895  cross  support 8 (occ 15)  size 4  lifted 2  nisurp -0.197  tiers tierB
;;   e.g. tierB-000596 tierB-000783 tierB-000786
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Past $e0))

;; p200896  cross  support 8 (occ 10)  size 4  lifted 2  nisurp 0.146  tiers tierB
;;   e.g. tierB-000082 tierB-000108 tierB-000378
(And (Future $e0) (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p200897  cross  support 8 (occ 8)  size 4  lifted 2  nisurp 0.793  tiers tierB
;;   e.g. tierB-000124 tierB-000196 tierB-000384
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (ProportionOf $x0 $x1 $v1) (SubsetOf $x0 $x1))

;; p200898  cross  support 8 (occ 8)  size 4  lifted 2  nisurp 0.301  tiers tierB
;;   e.g. tierB-000142 tierB-000494 tierB-000797
(And (GroupOf $x0 $v0) (Holder $e0 $x1) (Member $x1 $v1) (Theme $e0 $x0))

;; p200899  cross  support 8 (occ 8)  size 4  lifted 2  nisurp 0.344  tiers tierB
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Member $e0 $v0) (Member $e1 $v1) (Past $e0) (To $e0 $e1))

;; p200900  cross  support 8 (occ 10)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000009 tierB-000189 tierB-000421
(And (Member $e0 $v0) (Member $x0 $v1) (Past $e0) (Stimulus $e0 $x0))

;; p200901  cross  support 8 (occ 20)  size 4  lifted 2  nisurp -0.591  tiers tierB
;;   e.g. tierB-000063 tierB-000265 tierB-000302
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Patient $e1 $x0))

;; p200902  cross  support 8 (occ 9)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000103 tierB-000338 tierB-000677
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x1) (Source $e0 $x0))

;; p200903  cross  support 8 (occ 9)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (To $e0 $e1))

;; p200904  cross  support 8 (occ 9)  size 4  lifted 3  nisurp -0.431  tiers tierB
;;   e.g. tierB-000089 tierB-000137 tierB-000334
(And (Agent $e0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Theme $e0 $x0))

;; p200905  cross  support 8 (occ 8)  size 4  lifted 3  nisurp -0.298  tiers tierB
;;   e.g. tierB-000268 tierB-001013 tierB-001098
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Member $x0 $v0))

;; p200906  cross  support 8 (occ 11)  size 4  lifted 3  nisurp -0.379  tiers tierB
;;   e.g. tierB-000024 tierB-000871 tierB-001294
(And (Member $x0 $v0) (Member $x0 $v1) (Member $x1 $v0) (Member $x1 $v2))

;; p200907  cross  support 8 (occ 9)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000410 tierB-000587 tierB-000648
(And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 $v0))

;; p200908  cross  support 8 (occ 10)  size 3  lifted 1  nisurp 0.390  tiers tierB  signal conj-pattern
;;   e.g. tierB-000248 tierB-000258 tierB-000548
(And (Agent $e0 $x0) (GroupOf $x0 person) (Member $e0 $v0))

;; p200909  cross  support 8 (occ 9)  size 3  lifted 1  nisurp 0.301  tiers tierB  dominated
;;   e.g. tierB-000715 tierB-000769 tierB-000775
(And (Agent $e0 $x0) (Member $x0 $v0) (Recipient $e0 $x1))

;; p200910  cross  support 8 (occ 10)  size 3  lifted 1  nisurp 0.296  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000133 tierB-000379
(And (Cardinality $x0 <num>) (Member $e0 $v0) (Theme $e0 $x0))

;; p200911  cross  support 8 (occ 10)  size 3  lifted 1  nisurp 0.146  tiers tierB  dominated
;;   e.g. tierB-000082 tierB-000108 tierB-000378
(And (Future $e0) (Member $x0 $v0) (Patient $e0 $x0))

;; p200912  cross  support 8 (occ 8)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000117 tierB-000400 tierB-000470
(And (Member $e0 $v0) (Member $e1 try) (Theme $e1 $e0))

;; p200913  cross  support 8 (occ 8)  size 3  lifted 1  nisurp 0.344  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Member $e0 $v0) (Past $e1) (To $e1 $e0))

;; p200914  cross  support 8 (occ 10)  size 3  lifted 1  nisurp 0.301  tiers tierB  signal conj-pattern
;;   e.g. tierB-000192 tierB-000265 tierB-000654
(And (Member $e0 start) (Member $x0 $v0) (Patient $e0 $x0))

;; p200915  cross  support 8 (occ 10)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000009 tierB-000189 tierB-000421
(And (Member $x0 $v0) (Past $e0) (Stimulus $e0 $x0))

;; p200916  cross  support 8 (occ 9)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000103 tierB-000338 tierB-000677
(And (Member $x0 $v0) (Patient $e0 $x1) (Source $e0 $x0))

;; p200917  cross  support 8 (occ 9)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Agent $e0 $v0) (Member $e1 $v1) (To $e0 $e1))

;; p200918  cross  support 8 (occ 8)  size 3  lifted 2  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000384
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (ProportionOf $x0 $x1 $v1))

;; p200919  cross  support 8 (occ 9)  size 3  lifted 2  nisurp -0.473  tiers tierB
;;   e.g. tierB-000381 tierB-000602 tierB-000963
(And (GroupOf $x0 $v0) (Location $e0 $x0) (Member $e0 $v1))

;; p200920  cross  support 8 (occ 12)  size 3  lifted 2  nisurp -0.087  tiers tierB
;;   e.g. tierB-000222 tierB-000392 tierB-000444
(And (Instrument $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p200921  cross  support 8 (occ 15)  size 3  lifted 2  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000024 tierB-000871 tierB-001294
(And (Member $x0 $v0) (Member $x0 $v1) (Member $x1 $v0))

;; p200922  cross  support 8 (occ 8)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000206 tierB-000325 tierB-000603
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Member $e0 $v1))

;; p200923  cross  support 8 (occ 8)  size 2  lifted 1  nisurp 30.362  tiers tierB
;;   e.g. tierB-000267 tierB-000295 tierB-000697
(And (GroupOf $x0 $v0) (Member $x1 $v0))

;; p200924  cross  support 8 (occ 8)  size 2  lifted 3  nisurp 0.869  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-000603
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0))

;; p200925  cross  support 8 (occ 8)  size 2  lifted 3  nisurp 0.845  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-000603
(And (Degree $v0 $v1 $v2) (Member $e0 $v1))

;; p200926  kindlevel  support 8 (occ 10)  size 3  lifted 4  nisurp -0.445  tiers tierB
;;   e.g. tierB-000177 tierB-000382 tierB-000432
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Member $v3 $v0))

;; p200927  kindlevel  support 8 (occ 14)  size 2  lifted 3  nisurp 0.386  tiers tierB
;;   e.g. tierB-000197 tierB-000276 tierB-000431
(And (Inheritance $v0 $v1) (Inheritance $v0 (can $v2)))

;; p200928  kindlevel  support 8 (occ 10)  size 2  lifted 3  nisurp 0.970  tiers tierB
;;   e.g. tierB-000038 tierB-000197 tierB-000553
(And (Inheritance $v0 (can $v1)) (Patient $v1 $v2))

;; p200929  kindlevel  support 8 (occ 11)  size 2  lifted 3  nisurp 0.911  tiers tierB
;;   e.g. tierB-000084 tierB-000140 tierB-000480
(And (LocatedIn $v0 $v1) (Member $v0 $v2))

;; p200930  kindlevel  support 8 (occ 10)  size 2  lifted 3  nisurp 0.903  tiers tierB
;;   e.g. tierB-000110 tierB-000544 tierB-000800
(And (Member $v0 $v1) (Most $v2 $v0 $v1))

;; p200931  kindlevel  support 8 (occ 11)  size 1  lifted 3  nisurp —  tiers tierB
;;   e.g. tierB-000131 tierB-000639 tierB-000860
(ConditionalProperty $v0 $v1 $v2)

;; p200932  star  support 8 (occ 8)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(And (Agent $e0 $x0) (Member $e0 $v0) (Ongoing $e0) (Theme $e1 $e0))

;; p200933  star  support 8 (occ 8)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e0) (Result $e0 $e1))

;; p200934  star  support 8 (occ 11)  size 4  lifted 2  nisurp 0.062  tiers tierB  dominated
;;   e.g. tierB-000132 tierB-000237 tierB-000238
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e0) (Time $e0 $v1))

;; p200935  star  support 8 (occ 8)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000009 tierB-000189 tierB-000421
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Past $e0) (Stimulus $e0 $x0))

;; p200936  star  support 8 (occ 8)  size 4  lifted 2  nisurp 0.230  tiers tierB
;;   e.g. tierB-000128 tierB-000163 tierB-000328
(And (Manner $e0 $v0) (Member $e0 $v1) (Past $e0) (Theme $e0 $x0))

;; p200937  star  support 8 (occ 9)  size 4  lifted 3  nisurp 0.314  tiers tierB
;;   e.g. tierB-000012 tierB-000311 tierB-000327
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e0) (Time $e0 $v2))

;; p200938  star  support 8 (occ 8)  size 3  lifted 0  nisurp 0.553  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e1 $e0))

;; p200939  star  support 8 (occ 9)  size 3  lifted 1  nisurp 0.672  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000012 tierB-000115 tierB-000204
(And (Agent $e0 $v0) (Member $e0 go) (Past $e0))

;; p200940  star  support 8 (occ 8)  size 3  lifted 1  nisurp 0.672  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Past $e0) (Result $e0 $e1))

;; p200941  star  support 8 (occ 11)  size 3  lifted 1  nisurp 0.062  tiers tierB  dominated
;;   e.g. tierB-000132 tierB-000237 tierB-000238
(And (Agent $e0 $x0) (Past $e0) (Time $e0 $v0))

;; p200942  star  support 8 (occ 10)  size 3  lifted 1  nisurp 0.293  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000133 tierB-000379
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Theme $e0 $x0))

;; p200943  star  support 8 (occ 8)  size 3  lifted 1  nisurp 0.562  tiers tierB  dominated
;;   e.g. tierB-000009 tierB-000189 tierB-000421
(And (Experiencer $e0 $v0) (Past $e0) (Stimulus $e0 $x0))

;; p200944  star  support 8 (occ 8)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000281 tierB-000453 tierB-000790
(And (Future $e0) (Member $e0 $v0) (Theme $e0 $x0))

;; p200945  star  support 8 (occ 8)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000016 tierB-000392 tierB-000733
(And (Instrument $e0 $x0) (Member $e0 $v0) (Patient $e0 $x1))

;; p200946  star  support 8 (occ 8)  size 3  lifted 1  nisurp 0.230  tiers tierB  dominated
;;   e.g. tierB-000128 tierB-000163 tierB-000328
(And (Manner $e0 $v0) (Past $e0) (Theme $e0 $x0))

;; p200947  star  support 8 (occ 8)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(And (Manner $e0 quickly) (Member $e0 $v0) (Patient $e0 $x0))

;; p200948  star  support 8 (occ 8)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000813 tierB-001143 tierB-001520
(And (Member $e0 $v0) (Obligated $e0) (Patient $e0 $x0))

;; p200949  star  support 8 (occ 8)  size 3  lifted 1  nisurp 0.344  tiers tierB  dominated
;;   e.g. tierB-000009 tierB-000189 tierB-000421
(And (Member $e0 $v0) (Past $e0) (Stimulus $e0 $x0))

;; p200950  star  support 8 (occ 8)  size 3  lifted 1  nisurp 0.344  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Member $e0 $v0) (Past $e0) (To $e0 $e1))

;; p200951  star  support 8 (occ 8)  size 3  lifted 1  nisurp 0.469  tiers tierB  dominated
;;   e.g. tierB-000103 tierB-000338 tierB-000677
(And (Member $e0 $v0) (Patient $e0 $x0) (Source $e0 $x1))

;; p200952  star  support 8 (occ 10)  size 3  lifted 1  nisurp -0.224  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000265 tierB-000302
(And (Member $x0 $v0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p200953  star  support 8 (occ 9)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Agent $e0 $v0) (Member $e0 $v1) (To $e0 $e1))

;; p200954  star  support 8 (occ 9)  size 3  lifted 2  nisurp 0.314  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000311 tierB-000327
(And (Agent $e0 $v0) (Past $e0) (Time $e0 $v1))

;; p200955  star  support 8 (occ 9)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000091 tierB-000605 tierB-000667
(And (For $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p200956  star  support 8 (occ 8)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000100 tierB-000108 tierB-000168
(And (Future $e0) (Member $e0 $v0) (Time $e0 $v1))

;; p200957  star  support 8 (occ 8)  size 3  lifted 2  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000384
(And (GroupOf $x0 $v0) (ProportionOf $x0 $x1 $v1) (SubsetOf $x0 $x1))

;; p200958  star  support 8 (occ 8)  size 3  lifted 2  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000384
(And (GroupOf $x0 $v0) (ProportionOf $x1 $x0 $v1) (SubsetOf $x1 $x0))

;; p200959  star  support 8 (occ 8)  size 3  lifted 2  nisurp 0.302  tiers tierB
;;   e.g. tierB-000019 tierB-000202 tierB-000501
(And (LocatedIn $x0 $x1) (Member $x1 $v0) (Member $x1 $v1))

;; p200960  star  support 8 (occ 10)  size 3  lifted 3  nisurp 2.416  tiers tierB
;;   e.g. tierB-000146 tierB-000832 tierB-000931
(And (GroupOf $x0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p200961  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.756  tiers tierB  dominated
;;   e.g. tierB-000410 tierB-000587 tierB-000648
(And (Agent $e0 $x0) (GroupOf $x0 child))

;; p200962  star  support 8 (occ 10)  size 2  lifted 0  nisurp 0.390  tiers tierB  dominated
;;   e.g. tierB-000248 tierB-000258 tierB-000548
(And (Agent $e0 $x0) (GroupOf $x0 person))

;; p200963  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.553  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000073 tierB-000998 tierB-001182
(And (Agent $e0 $x0) (Member $e0 make))

;; p200964  star  support 8 (occ 10)  size 2  lifted 0  nisurp 0.293  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000133 tierB-000379
(And (Cardinality $x0 <num>) (Theme $e0 $x0))

;; p200965  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.497  tiers tierB  dominated
;;   e.g. tierB-000281 tierB-000453 tierB-000790
(And (Future $e0) (Theme $e0 $x0))

;; p200966  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.760  tiers tierB  dominated
;;   e.g. tierB-000016 tierB-000392 tierB-000733
(And (Instrument $e0 $x0) (Patient $e0 $x1))

;; p200967  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.812  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(And (Manner $e0 quickly) (Patient $e0 $x0))

;; p200968  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.635  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000075 tierB-000173 tierB-000182
(And (Member $e0 begin) (Past $e0))

;; p200969  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.672  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000176 tierB-000189 tierB-000421
(And (Member $e0 hear) (Past $e0))

;; p200970  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.599  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000117 tierB-000216 tierB-000400
(And (Member $e0 try) (Past $e0))

;; p200971  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.954  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000400 tierB-000470
(And (Member $e0 try) (Theme $e0 $e1))

;; p200972  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.555  tiers tierB  dominated
;;   e.g. tierB-000813 tierB-001143 tierB-001520
(And (Obligated $e0) (Patient $e0 $x0))

;; p200973  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.344  tiers tierB  dominated
;;   e.g. tierB-000009 tierB-000189 tierB-000421
(And (Past $e0) (Stimulus $e0 $x0))

;; p200974  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.344  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Past $e0) (To $e0 $e1))

;; p200975  star  support 8 (occ 8)  size 2  lifted 0  nisurp 0.469  tiers tierB  dominated
;;   e.g. tierB-000103 tierB-000338 tierB-000677
(And (Patient $e0 $x0) (Source $e0 $x1))

;; p200976  star  support 8 (occ 8)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000147 tierB-000337 tierB-000588
(And (Again $e0) (Member $e0 $v0))

;; p200977  star  support 8 (occ 9)  size 2  lifted 1  nisurp 0.755  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Agent $e0 $v0) (To $e0 $e1))

;; p200978  star  support 8 (occ 8)  size 2  lifted 1  nisurp 0.958  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000189 tierB-000421 tierB-000659
(And (Experiencer $e0 $v0) (Member $e0 hear))

;; p200979  star  support 8 (occ 8)  size 2  lifted 1  nisurp 0.562  tiers tierB  dominated
;;   e.g. tierB-000091 tierB-000605 tierB-000667
(And (For $e0 $v0) (Past $e0))

;; p200980  star  support 8 (occ 8)  size 2  lifted 1  nisurp 0.842  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000108 tierB-000168
(And (Future $e0) (Time $e0 $v0))

;; p200981  star  support 8 (occ 8)  size 2  lifted 1  nisurp 1.409  tiers tierB  dominated
;;   e.g. tierB-000381 tierB-000602 tierB-000963
(And (GroupOf $x0 $v0) (Location $e0 $x0))

;; p200982  star  support 8 (occ 8)  size 2  lifted 1  nisurp 0.016  tiers tierB
;;   e.g. tierB-000714 tierB-001066 tierB-001246
(And (GroupOf $x0 $v0) (PartOf $x0 $x1))

;; p200983  star  support 8 (occ 12)  size 2  lifted 1  nisurp 0.087  tiers tierB  dominated
;;   e.g. tierB-000222 tierB-000392 tierB-000444
(And (Instrument $e0 $x0) (Member $x0 $v0))

;; p200984  star  support 8 (occ 9)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000298 tierB-000302 tierB-000315
(And (Member $e0 $v0) (Time $e0 (Hour <num>)))

;; p200985  star  support 8 (occ 9)  size 2  lifted 1  nisurp 0.301  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000872 tierB-000904 tierB-001016
(And (Member $x0 $v0) (Member $x0 beautiful))

;; p200986  star  support 8 (occ 12)  size 2  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000093 tierB-000240 tierB-000734
(And (Member $x0 $v0) (To $e0 $x0))

;; p200987  star  support 8 (occ 8)  size 2  lifted 1  nisurp 0.992  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000384
(And (ProportionOf $x0 $x1 $v0) (SubsetOf $x0 $x1))

;; p200988  star  support 8 (occ 8)  size 2  lifted 2  nisurp 0.146  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000083 tierB-000244 tierB-000407
(And (Degree $x0 $v0 excessive) (Member $x0 $v1))

;; p200989  star  support 8 (occ 9)  size 2  lifted 2  nisurp 0.224  tiers tierB
;;   e.g. tierB-000104 tierB-000168 tierB-000740
(And (Future (Member $x0 $v0)) (Member $x0 $v1))

;; p200990  star  support 8 (occ 8)  size 2  lifted 2  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000384
(And (GroupOf $x0 $v0) (ProportionOf $x0 $x1 $v1))

;; p200991  star  support 8 (occ 8)  size 2  lifted 2  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000384
(And (GroupOf $x0 $v0) (ProportionOf $x1 $x0 $v1))

;; p200992  star  support 8 (occ 11)  size 2  lifted 2  nisurp 0.224  tiers tierB
;;   e.g. tierB-000088 tierB-000267 tierB-000269
(And (Member $x0 $v0) (More $v1 $x0 $x1))

;; p200993  star  support 8 (occ 11)  size 2  lifted 2  nisurp 0.224  tiers tierB
;;   e.g. tierB-000088 tierB-000269 tierB-000663
(And (Member $x0 $v0) (More $v1 $x1 $x0))

;; p200994  star  support 8 (occ 8)  size 2  lifted 3  nisurp 0.407  tiers tierB
;;   e.g. tierB-000053 tierB-000426 tierB-000481
(And (Degree $e0 $v0 $v1) (Member $e0 $v2))

;; p200995  star  support 8 (occ 8)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000147 tierB-000337 tierB-000588
(Again $e0)

;; p200996  star  support 8 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(Member $e0 live)

;; p200997  star  support 8 (occ 8)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000036 tierB-000148 tierB-000324
(Member $e0 walk)

;; p200998  star  support 8 (occ 8)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000322 tierB-000615 tierB-000677
(Member $x0 garden)

;; p200999  star  support 8 (occ 8)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000456 tierB-000722 tierB-000937
(Member $x0 sky)

;; p201000  star  support 8 (occ 9)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000298 tierB-000302 tierB-000315
(Time $e0 (Hour <num>))

;; p201001  star  support 8 (occ 8)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000093 tierB-000240 tierB-000734
(To $e0 $x0)

;; p201002  star  support 8 (occ 8)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000384
(ProportionOf $x0 $x1 $v0)

;; p201003  cross  support 7 (occ 7)  size 4  lifted 0  nisurp 0.605  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(And (Agent $e0 $x0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))

;; p201004  cross  support 7 (occ 7)  size 4  lifted 0  nisurp 0.605  tiers tierB
;;   e.g. tierB-000485 tierB-000738 tierB-000942
(And (Agent $e0 $x0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))

;; p201005  cross  support 7 (occ 7)  size 4  lifted 0  nisurp 0.708  tiers tierB  signal conj-pattern
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Member $e0 begin) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))

;; p201006  cross  support 7 (occ 8)  size 4  lifted 1  nisurp 0.625  tiers tierB
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Agent $e0 $v0) (Agent $e1 $v0) (Ongoing $e0) (Past $e1))

;; p201007  cross  support 7 (occ 8)  size 4  lifted 1  nisurp -0.153  tiers tierB
;;   e.g. tierB-000462 tierB-001055 tierB-001219
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $x0 $v0) (Past $e0))

;; p201008  cross  support 7 (occ 8)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000248 tierB-000258 tierB-000548
(And (Agent $e0 $x0) (GroupOf $x0 person) (Member $e0 $v0) (Past $e0))

;; p201009  cross  support 7 (occ 8)  size 4  lifted 1  nisurp 0.202  tiers tierB
;;   e.g. tierB-000036 tierB-000316 tierB-000381
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 $v0) (Ongoing $e0))

;; p201010  cross  support 7 (occ 9)  size 4  lifted 1  nisurp 0.202  tiers tierB
;;   e.g. tierB-000036 tierB-000316 tierB-000942
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 $v0) (Ongoing $e0))

;; p201011  cross  support 7 (occ 11)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000073 tierB-000998 tierB-001182
(And (Agent $e0 $x0) (Member $e0 make) (Member $x1 $v0) (Patient $e0 $x1))

;; p201012  cross  support 7 (occ 10)  size 4  lifted 1  nisurp 0.166  tiers tierB
;;   e.g. tierB-000008 tierB-000148 tierB-000676
(And (Location $e0 $x0) (Member $x0 $v0) (Ongoing $e0) (Past $e0))

;; p201013  cross  support 7 (occ 7)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Member $e0 $v0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))

;; p201014  cross  support 7 (occ 7)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Member $e0 $v0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))

;; p201015  cross  support 7 (occ 7)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000265 tierB-000930 tierB-000942
(And (Member $e0 $v0) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201016  cross  support 7 (occ 7)  size 4  lifted 1  nisurp 0.159  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000858 tierB-000942
(And (Member $e0 $v0) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201017  cross  support 7 (occ 7)  size 4  lifted 1  nisurp 0.159  tiers tierB
;;   e.g. tierB-000265 tierB-000858 tierB-000942
(And (Member $e0 $v0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))

;; p201018  cross  support 7 (occ 8)  size 4  lifted 2  nisurp 0.257  tiers tierB  dominated
;;   e.g. tierB-000115 tierB-000867 tierB-001079
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Past $e0))

;; p201019  cross  support 7 (occ 8)  size 4  lifted 2  nisurp 0.267  tiers tierB
;;   e.g. tierB-000115 tierB-000867 tierB-001079
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e1 $v1) (Past $e0))

;; p201020  cross  support 7 (occ 7)  size 4  lifted 2  nisurp -0.722  tiers tierB
;;   e.g. tierB-000160 tierB-000339 tierB-000688
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0) (Member $e1 $v1))

;; p201021  cross  support 7 (occ 7)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000324 tierB-000387 tierB-001058
(And (Agent $e0 $x0) (Goal $e0 $x1) (GroupOf $x0 $v0) (Member $e0 $v1))

;; p201022  cross  support 7 (occ 9)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000324 tierB-000387 tierB-001058
(And (Agent $e0 $x0) (Goal $e0 $x1) (GroupOf $x0 $v0) (Member $x1 $v1))

;; p201023  cross  support 7 (occ 13)  size 4  lifted 2  nisurp -0.722  tiers tierB
;;   e.g. tierB-000097 tierB-000830 tierB-000858
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Past $e0))

;; p201024  cross  support 7 (occ 8)  size 4  lifted 2  nisurp 0.408  tiers tierB  dominated
;;   e.g. tierB-000166 tierB-000410 tierB-000485
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Theme $e1 $e0))

;; p201025  cross  support 7 (occ 8)  size 4  lifted 2  nisurp 0.408  tiers tierB
;;   e.g. tierB-000166 tierB-000410 tierB-000485
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e1 $v1) (Theme $e1 $e0))

;; p201026  cross  support 7 (occ 9)  size 4  lifted 2  nisurp -0.569  tiers tierB
;;   e.g. tierB-000975 tierB-001005 tierB-001243
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0) (Theme $e0 $x1))

;; p201027  cross  support 7 (occ 8)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000079 tierB-000496 tierB-000542
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Past $e0) (Past (Member $v0 $v1)))

;; p201028  cross  support 7 (occ 10)  size 4  lifted 2  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(And (Experiencer $e0 $v0) (Member $e0 hear) (Member $x0 $v1) (Stimulus $e0 $x0))

;; p201029  cross  support 7 (occ 8)  size 4  lifted 2  nisurp -0.934  tiers tierB
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Member $x0 $v1))

;; p201030  cross  support 7 (occ 7)  size 4  lifted 2  nisurp -0.243  tiers tierB
;;   e.g. tierB-000124 tierB-000191 tierB-000689
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Past $e0))

;; p201031  cross  support 7 (occ 8)  size 4  lifted 2  nisurp 0.290  tiers tierB
;;   e.g. tierB-000281 tierB-000453 tierB-000790
(And (Future $e0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0))

;; p201032  cross  support 7 (occ 8)  size 4  lifted 2  nisurp 0.120  tiers tierB
;;   e.g. tierB-000135 tierB-000176 tierB-000482
(And (Goal $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x1))

;; p201033  cross  support 7 (occ 7)  size 4  lifted 2  nisurp 0.290  tiers tierB
;;   e.g. tierB-000016 tierB-000392 tierB-000733
(And (Instrument $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Patient $e0 $x1))

;; p201034  cross  support 7 (occ 8)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000325 tierB-000370 tierB-000748
(And (Member $e0 $v0) (Member $e1 $v1) (Ongoing $e0) (Result $e0 $e1))

;; p201035  cross  support 7 (occ 7)  size 4  lifted 2  nisurp 0.290  tiers tierB
;;   e.g. tierB-000813 tierB-001143 tierB-001520
(And (Member $e0 $v0) (Member $x0 $v1) (Obligated $e0) (Patient $e0 $x0))

;; p201036  cross  support 7 (occ 7)  size 4  lifted 2  nisurp 0.202  tiers tierB
;;   e.g. tierB-000037 tierB-000080 tierB-000303
(And (Member $e0 $v0) (Member $x0 $v1) (Obligated $e0) (Theme $e0 $x0))

;; p201037  cross  support 7 (occ 8)  size 4  lifted 2  nisurp 0.202  tiers tierB
;;   e.g. tierB-000150 tierB-000775 tierB-000793
(And (Member $e0 $v0) (Member $x0 $v1) (Past $e0) (Recipient $e0 $x0))

;; p201038  cross  support 7 (occ 9)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000246 tierB-000423 tierB-000722
(And (Member $e0 $v0) (Member $x0 $v1) (Possession $x1 $x0) (Theme $e0 $x1))

;; p201039  cross  support 7 (occ 7)  size 4  lifted 2  nisurp -0.153  tiers tierB  signal conj-pattern
;;   e.g. tierB-000073 tierB-000371 tierB-000951
(And (Member $e0 make) (Member $x0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p201040  cross  support 7 (occ 8)  size 4  lifted 2  nisurp -0.516  tiers tierB
;;   e.g. tierB-000370 tierB-000685 tierB-000748
(And (Member $x0 $v0) (Member $x0 $v1) (Ongoing $e0) (Patient $e0 $x0))

;; p201041  cross  support 7 (occ 7)  size 4  lifted 3  nisurp 0.021  tiers tierB
;;   e.g. tierB-000004 tierB-000262 tierB-000392
(And (Agent $e0 $v0) (GroupOf $x0 $v1) (Member $e0 $v2) (Patient $e0 $x0))

;; p201042  cross  support 7 (occ 8)  size 4  lifted 3  nisurp 0.232  tiers tierB
;;   e.g. tierB-000008 tierB-000125 tierB-000805
(And (Agent $e0 $v0) (Inheritance $v1 $v2) (Location $e0 $x0) (Member $x0 $v1))

;; p201043  cross  support 7 (occ 8)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000078 tierB-000147 tierB-000171
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (To $e1 $e0))

;; p201044  cross  support 7 (occ 8)  size 4  lifted 3  nisurp -0.405  tiers tierB
;;   e.g. tierB-000128 tierB-000148 tierB-001079
(And (Agent $e0 $v0) (Member $e0 $v2) (Member $v0 $v1) (Past $e0))

;; p201045  cross  support 7 (occ 7)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000206 tierB-000325 tierB-000898
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Member $e0 $v1) (Member $v0 $v1))

;; p201046  cross  support 7 (occ 7)  size 4  lifted 3  nisurp 0.171  tiers tierB
;;   e.g. tierB-000194 tierB-000196 tierB-001295
(And (GroupOf $x0 $v0) (Manner $e0 $v1) (Member $e0 $v2) (Patient $e0 $x0))

;; p201047  cross  support 7 (occ 8)  size 4  lifted 3  nisurp -0.372  tiers tierB
;;   e.g. tierB-000510 tierB-000819 tierB-001168
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Member $x0 $v2) (Theme $e0 $x0))

;; p201048  cross  support 7 (occ 9)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000369 tierB-000757 tierB-000809
(And (Instrument $e0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p201049  cross  support 7 (occ 11)  size 4  lifted 3  nisurp -0.379  tiers tierB
;;   e.g. tierB-000208 tierB-000524 tierB-000546
(And (LocatedIn $x0 $x1) (Member $x0 $v0) (Member $x0 $v1) (Member $x1 $v2))

;; p201050  cross  support 7 (occ 7)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000087 tierB-000465 tierB-000717
(And (Manner $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Theme $e0 $e1))

;; p201051  cross  support 7 (occ 13)  size 4  lifted 3  nisurp -0.424  tiers tierB
;;   e.g. tierB-000202 tierB-000356 tierB-000545
(And (Member $x0 $v0) (Member $x0 $v1) (Member $x1 $v2) (PartOf $x0 $x1))

;; p201052  cross  support 7 (occ 9)  size 4  lifted 4  nisurp 0.065  tiers tierB
;;   e.g. tierB-000043 tierB-000292 tierB-000309
(And (Agent $e0 $v0) (Inheritance $v1 $v2) (Member $e0 $v3) (Theme $e0 $v1))

;; p201053  cross  support 7 (occ 7)  size 4  lifted 4  nisurp 0.169  tiers tierB
;;   e.g. tierB-000819 tierB-000831 tierB-001013
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Member $x0 $v0) (Member $x0 $v3))

;; p201054  cross  support 7 (occ 8)  size 3  lifted 0  nisurp 0.582  tiers tierB  dominated
;;   e.g. tierB-000248 tierB-000258 tierB-000548
(And (Agent $e0 $x0) (GroupOf $x0 person) (Past $e0))

;; p201055  cross  support 7 (occ 7)  size 3  lifted 0  nisurp 0.926  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))

;; p201056  cross  support 7 (occ 7)  size 3  lifted 0  nisurp 0.159  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000858 tierB-000942
(And (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201057  cross  support 7 (occ 8)  size 3  lifted 1  nisurp 0.257  tiers tierB  dominated
;;   e.g. tierB-000115 tierB-000867 tierB-001079
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Past $e0))

;; p201058  cross  support 7 (occ 7)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000688
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0))

;; p201059  cross  support 7 (occ 7)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000688
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e1 $v0))

;; p201060  cross  support 7 (occ 7)  size 3  lifted 1  nisurp 0.526  tiers tierB  dominated
;;   e.g. tierB-000324 tierB-000387 tierB-001058
(And (Agent $e0 $x0) (Goal $e0 $x1) (GroupOf $x0 $v0))

;; p201061  cross  support 7 (occ 8)  size 3  lifted 1  nisurp 0.408  tiers tierB  dominated
;;   e.g. tierB-000166 tierB-000410 tierB-000485
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Theme $e1 $e0))

;; p201062  cross  support 7 (occ 21)  size 3  lifted 1  nisurp -0.466  tiers tierB
;;   e.g. tierB-000101 tierB-000575 tierB-001275
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 $v0))

;; p201063  cross  support 7 (occ 7)  size 3  lifted 1  nisurp -0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000770 tierB-000978 tierB-001507
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 thing))

;; p201064  cross  support 7 (occ 7)  size 3  lifted 1  nisurp 0.114  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000191 tierB-000689
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Past $e0))

;; p201065  cross  support 7 (occ 8)  size 3  lifted 1  nisurp 0.290  tiers tierB  dominated
;;   e.g. tierB-000281 tierB-000453 tierB-000790
(And (Future $e0) (Member $x0 $v0) (Theme $e0 $x0))

;; p201066  cross  support 7 (occ 8)  size 3  lifted 1  nisurp 0.120  tiers tierB  dominated
;;   e.g. tierB-000135 tierB-000176 tierB-000482
(And (Goal $e0 $x0) (Member $x0 $v0) (Patient $e0 $x1))

;; p201067  cross  support 7 (occ 7)  size 3  lifted 1  nisurp 0.290  tiers tierB  dominated
;;   e.g. tierB-000016 tierB-000392 tierB-000733
(And (Instrument $e0 $x0) (Member $x1 $v0) (Patient $e0 $x1))

;; p201068  cross  support 7 (occ 7)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Member $e0 $v0) (Member $e1 begin) (Theme $e1 $e0))

;; p201069  cross  support 7 (occ 8)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Member $e0 $v0) (Member $e1 make) (Result $e1 $e0))

;; p201070  cross  support 7 (occ 7)  size 3  lifted 1  nisurp -0.467  tiers tierB  signal conj-pattern
;;   e.g. tierB-000082 tierB-000370 tierB-000389
(And (Member $e0 $v0) (Member $x0 thing) (Patient $e0 $x0))

;; p201071  cross  support 7 (occ 8)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-000370 tierB-000748
(And (Member $e0 $v0) (Ongoing $e1) (Result $e1 $e0))

;; p201072  cross  support 7 (occ 7)  size 3  lifted 1  nisurp 0.428  tiers tierB  dominated
;;   e.g. tierB-000246 tierB-000423 tierB-000722
(And (Member $e0 $v0) (Possession $x0 $x1) (Theme $e0 $x0))

;; p201073  cross  support 7 (occ 10)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(And (Member $e0 hear) (Member $x0 $v0) (Stimulus $e0 $x0))

;; p201074  cross  support 7 (occ 7)  size 3  lifted 1  nisurp 0.290  tiers tierB  dominated
;;   e.g. tierB-000813 tierB-001143 tierB-001520
(And (Member $x0 $v0) (Obligated $e0) (Patient $e0 $x0))

;; p201075  cross  support 7 (occ 7)  size 3  lifted 1  nisurp 0.202  tiers tierB  dominated
;;   e.g. tierB-000037 tierB-000080 tierB-000303
(And (Member $x0 $v0) (Obligated $e0) (Theme $e0 $x0))

;; p201076  cross  support 7 (occ 8)  size 3  lifted 1  nisurp 0.202  tiers tierB  dominated
;;   e.g. tierB-000150 tierB-000775 tierB-000793
(And (Member $x0 $v0) (Past $e0) (Recipient $e0 $x0))

;; p201077  cross  support 7 (occ 9)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000246 tierB-000423 tierB-000722
(And (Member $x0 $v0) (Possession $x1 $x0) (Theme $e0 $x1))

;; p201078  cross  support 7 (occ 7)  size 3  lifted 2  nisurp 0.021  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000262 tierB-000392
(And (Agent $e0 $v0) (GroupOf $x0 $v1) (Patient $e0 $x0))

;; p201079  cross  support 7 (occ 8)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000147 tierB-000171
(And (Agent $e0 $v0) (Member $e1 $v1) (To $e1 $e0))

;; p201080  cross  support 7 (occ 8)  size 3  lifted 2  nisurp -0.375  tiers tierB  dominated
;;   e.g. tierB-000128 tierB-000148 tierB-001079
(And (Agent $e0 $v0) (Member $v0 $v1) (Past $e0))

;; p201081  cross  support 7 (occ 8)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000079 tierB-000496 tierB-000542
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Past (Member $v0 $v1)))

;; p201082  cross  support 7 (occ 10)  size 3  lifted 2  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000079 tierB-000496 tierB-000542
(And (Experiencer $e0 $v0) (Past $e0) (Past (Member $v0 $v1)))

;; p201083  cross  support 7 (occ 7)  size 3  lifted 2  nisurp 0.171  tiers tierB  dominated
;;   e.g. tierB-000194 tierB-000196 tierB-001295
(And (GroupOf $x0 $v0) (Manner $e0 $v1) (Patient $e0 $x0))

;; p201084  cross  support 7 (occ 8)  size 3  lifted 2  nisurp 0.243  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Member $x0 $v1))

;; p201085  cross  support 7 (occ 9)  size 3  lifted 2  nisurp 0.053  tiers tierB
;;   e.g. tierB-000714 tierB-001246 tierB-001461
(And (GroupOf $x0 $v0) (Member $x1 $v1) (PartOf $x0 $x1))

;; p201086  cross  support 7 (occ 9)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000369 tierB-000757 tierB-000809
(And (Instrument $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p201087  cross  support 7 (occ 7)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000087 tierB-000465 tierB-000717
(And (Manner $e0 $v0) (Member $e1 $v1) (Theme $e0 $e1))

;; p201088  cross  support 7 (occ 10)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000093 tierB-000240 tierB-000734
(And (Member $e0 $v0) (Member $x0 $v1) (To $e0 $x0))

;; p201089  cross  support 7 (occ 8)  size 3  lifted 2  nisurp -0.000  tiers tierB  dominated
;;   e.g. tierB-000079 tierB-000496 tierB-000542
(And (Member $e0 $v0) (Past $e0) (Past (Member $v1 $v0)))

;; p201090  cross  support 7 (occ 9)  size 3  lifted 3  nisurp 0.065  tiers tierB  dominated
;;   e.g. tierB-000043 tierB-000292 tierB-000309
(And (Agent $e0 $v0) (Inheritance $v1 $v2) (Theme $e0 $v1))

;; p201091  cross  support 7 (occ 7)  size 3  lifted 3  nisurp 0.919  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-000898
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Member $v0 $v1))

;; p201092  cross  support 7 (occ 7)  size 3  lifted 3  nisurp -0.054  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-000898
(And (Degree $v0 $v1 $v2) (Member $e0 $v1) (Member $v0 $v1))

;; p201093  cross  support 7 (occ 8)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000588 tierB-001517 tierB-001573
(And (Inheritance $v0 room) (Member $x0 $v0))

;; p201094  cross  support 7 (occ 10)  size 2  lifted 2  nisurp 0.872  tiers tierB  dominated
;;   e.g. tierB-000079 tierB-000496 tierB-000542
(And (Experiencer $e0 $v0) (Past (Member $v0 $v1)))

;; p201095  cross  support 7 (occ 8)  size 2  lifted 2  nisurp 0.807  tiers tierB  dominated
;;   e.g. tierB-000079 tierB-000496 tierB-000542
(And (Member $e0 $v0) (Past (Member $v1 $v0)))

;; p201096  cross  support 7 (occ 11)  size 2  lifted 2  nisurp 0.899  tiers tierB
;;   e.g. tierB-000187 tierB-000655 tierB-001020
(And (Member $v0 $v1) (PartOf $v0 $x0))

;; p201097  kindlevel  support 7 (occ 10)  size 3  lifted 4  nisurp 0.733  tiers tierB
;;   e.g. tierB-000038 tierB-000197 tierB-000553
(And (Inheritance $v0 $v1) (Inheritance $v2 (can $v0)) (Patient $v0 $v3))

;; p201098  kindlevel  support 7 (occ 7)  size 2  lifted 2  nisurp 0.990  tiers tierB
;;   e.g. tierB-000031 tierB-000346 tierB-000472
(And (Member $v0 capital) (Possession $v0 $v1))

;; p201099  kindlevel  support 7 (occ 10)  size 2  lifted 3  nisurp 0.298  tiers tierB  dominated
;;   e.g. tierB-000038 tierB-000197 tierB-000553
(And (Inheritance $v0 $v1) (Inheritance $v2 (can $v0)))

;; p201100  kindlevel  support 7 (occ 10)  size 2  lifted 4  nisurp 0.065  tiers tierB
;;   e.g. tierB-000395 tierB-000843 tierB-001015
(And (Degree $v0 $v1 $v2) (Inheritance $v0 $v3))

;; p201101  kindlevel  support 7 (occ 8)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000588 tierB-001517 tierB-001573
(Inheritance $v0 room)

;; p201102  kindlevel  support 7 (occ 7)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000031 tierB-000346 tierB-000472
(Member $v0 capital)

;; p201103  star  support 7 (occ 7)  size 4  lifted 1  nisurp -0.095  tiers tierB
;;   e.g. tierB-000028 tierB-000942 tierB-001182
(And (Agent $e0 $x0) (Member $e0 $v0) (Ongoing $e0) (Patient $e0 $x1))

;; p201104  star  support 7 (occ 7)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(And (Manner $e0 quickly) (Member $e0 $v0) (Past $e0) (Patient $e0 $x0))

;; p201105  star  support 7 (occ 7)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000930 tierB-000942
(And (Member $e0 $v0) (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))

;; p201106  star  support 7 (occ 7)  size 4  lifted 2  nisurp 0.148  tiers tierB
;;   e.g. tierB-000389 tierB-000932 tierB-000964
(And (Member $e0 $v0) (Past $e0) (Patient $e0 $x0) (Time $e0 $v1))

;; p201107  star  support 7 (occ 8)  size 4  lifted 3  nisurp 0.348  tiers tierB
;;   e.g. tierB-000209 tierB-000325 tierB-000539
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e0) (Patient $e0 $v2))

;; p201108  star  support 7 (occ 7)  size 3  lifted 0  nisurp 0.652  tiers tierB  dominated
;;   e.g. tierB-000073 tierB-000998 tierB-001182
(And (Agent $e0 $x0) (Member $e0 make) (Patient $e0 $x1))

;; p201109  star  support 7 (occ 7)  size 3  lifted 0  nisurp -0.095  tiers tierB  dominated
;;   e.g. tierB-000028 tierB-000942 tierB-001182
(And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $x1))

;; p201110  star  support 7 (occ 7)  size 3  lifted 0  nisurp 0.666  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(And (Manner $e0 quickly) (Past $e0) (Patient $e0 $x0))

;; p201111  star  support 7 (occ 7)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Member $e0 begin) (Past $e0) (Theme $e0 $e1))

;; p201112  star  support 7 (occ 7)  size 3  lifted 0  nisurp 0.570  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000930 tierB-000942
(And (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))

;; p201113  star  support 7 (occ 7)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000147 tierB-000337 tierB-000588
(And (Again $e0) (Member $e0 $v0) (Past $e0))

;; p201114  star  support 7 (occ 7)  size 3  lifted 1  nisurp 0.666  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000189 tierB-000421 tierB-000659
(And (Experiencer $e0 $v0) (Member $e0 hear) (Past $e0))

;; p201115  star  support 7 (occ 7)  size 3  lifted 1  nisurp 0.963  tiers tierB  dominated
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(And (Experiencer $e0 $v0) (Member $e0 hear) (Stimulus $e0 $x0))

;; p201116  star  support 7 (occ 7)  size 3  lifted 1  nisurp 0.061  tiers tierB  dominated
;;   e.g. tierB-000135 tierB-000176 tierB-000482
(And (Goal $e0 $x0) (Member $e0 $v0) (Patient $e0 $x1))

;; p201117  star  support 7 (occ 7)  size 3  lifted 1  nisurp -0.473  tiers tierB
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(And (Location $e0 $x0) (Member $e0 $v0) (Theme $e0 $x1))

;; p201118  star  support 7 (occ 8)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-000370 tierB-000748
(And (Member $e0 $v0) (Ongoing $e0) (Result $e0 $e1))

;; p201119  star  support 7 (occ 7)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Member $e0 $v0) (Past $e0) (Through $e0 $x0))

;; p201120  star  support 7 (occ 7)  size 3  lifted 1  nisurp 0.148  tiers tierB  dominated
;;   e.g. tierB-000389 tierB-000932 tierB-000964
(And (Past $e0) (Patient $e0 $x0) (Time $e0 $v0))

;; p201121  star  support 7 (occ 8)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000147 tierB-000171
(And (Agent $e0 $v0) (Member $e0 $v1) (To $e1 $e0))

;; p201122  star  support 7 (occ 8)  size 3  lifted 2  nisurp 0.348  tiers tierB  dominated
;;   e.g. tierB-000209 tierB-000325 tierB-000539
(And (Agent $e0 $v0) (Past $e0) (Patient $e0 $v1))

;; p201123  star  support 7 (occ 8)  size 3  lifted 2  nisurp 0.443  tiers tierB
;;   e.g. tierB-000100 tierB-000575 tierB-000688
(And (Agent $e0 $x0) (Goal $e0 $v0) (Member $e0 $v1))

;; p201124  star  support 7 (occ 7)  size 3  lifted 2  nisurp 0.290  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000083 tierB-000244 tierB-000530
(And (Degree $x0 $v0 excessive) (Member $x0 $v0) (Member $x0 $v1))

;; p201125  star  support 7 (occ 10)  size 3  lifted 2  nisurp -0.584  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Member $x0 $v1))

;; p201126  star  support 7 (occ 9)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000554 tierB-000757 tierB-001245
(And (Instrument $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p201127  star  support 7 (occ 8)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000369 tierB-000757 tierB-000809
(And (Instrument $e0 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p201128  star  support 7 (occ 11)  size 3  lifted 2  nisurp 0.488  tiers tierB  dominated
;;   e.g. tierB-000208 tierB-000524 tierB-000546
(And (LocatedIn $x0 $x1) (Member $x0 $v0) (Member $x0 $v1))

;; p201129  star  support 7 (occ 7)  size 3  lifted 2  nisurp 0.335  tiers tierB
;;   e.g. tierB-000063 tierB-000378 tierB-000653
(And (Location $e0 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p201130  star  support 7 (occ 7)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000087 tierB-000465 tierB-000717
(And (Manner $e0 $v0) (Member $e0 $v1) (Theme $e0 $e1))

;; p201131  star  support 7 (occ 7)  size 3  lifted 2  nisurp 0.126  tiers tierB
;;   e.g. tierB-000092 tierB-000489 tierB-000808
(And (Member $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p201132  star  support 7 (occ 8)  size 3  lifted 2  nisurp 0.108  tiers tierB
;;   e.g. tierB-000013 tierB-000026 tierB-000173
(And (Member $e0 $v0) (Ongoing $e0) (Theme $e0 $v1))

;; p201133  star  support 7 (occ 10)  size 3  lifted 2  nisurp -0.073  tiers tierB  dominated
;;   e.g. tierB-000202 tierB-000356 tierB-000545
(And (Member $x0 $v0) (Member $x0 $v1) (PartOf $x0 $x1))

;; p201134  star  support 7 (occ 7)  size 3  lifted 2  nisurp -0.219  tiers tierB
;;   e.g. tierB-000246 tierB-000617 tierB-000932
(And (Member $x0 $v0) (Member $x0 $v1) (Possession $x1 $x0))

;; p201135  star  support 7 (occ 9)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000012 tierB-000029 tierB-000078
(And (Agent $e0 $v0) (Goal $e0 $v1) (Member $e0 $v2))

;; p201136  star  support 7 (occ 10)  size 3  lifted 3  nisurp -0.439  tiers tierB
;;   e.g. tierB-000376 tierB-000861 tierB-001627
(And (Member $x0 $v0) (Member $x0 $v1) (Possession $x0 $v2))

;; p201137  star  support 7 (occ 11)  size 3  lifted 3  nisurp -0.508  tiers tierB
;;   e.g. tierB-000503 tierB-000567 tierB-000646
(And (Member $x0 $v0) (Past (Member $x0 $v1)) (Past (Member $x0 $v2)))

;; p201138  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.666  tiers tierB  dominated
;;   e.g. tierB-000147 tierB-000337 tierB-000588
(And (Again $e0) (Past $e0))

;; p201139  star  support 7 (occ 7)  size 2  lifted 0  nisurp 1.996  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000688
(And (Agent $e0 $x0) (Experiencer $e1 $x0))

;; p201140  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.742  tiers tierB  dominated
;;   e.g. tierB-000770 tierB-000978 tierB-001507
(And (Agent $e0 $x0) (Member $x0 thing))

;; p201141  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.061  tiers tierB  dominated
;;   e.g. tierB-000135 tierB-000176 tierB-000482
(And (Goal $e0 $x0) (Patient $e0 $x1))

;; p201142  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.669  tiers tierB  dominated
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(And (Location $e0 $x0) (Theme $e0 $x1))

;; p201143  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.952  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Member $e0 begin) (Theme $e0 $e1))

;; p201144  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.500  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000238 tierB-000255 tierB-000277
(And (Member $e0 come) (Past $e0))

;; p201145  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.824  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000194 tierB-000609 tierB-000779
(And (Member $e0 fall) (Patient $e0 $x0))

;; p201146  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.988  tiers tierB  dominated
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(And (Member $e0 hear) (Stimulus $e0 $x0))

;; p201147  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.863  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000067 tierB-000393 tierB-000412
(And (Member $e0 kill) (Patient $e0 $x0))

;; p201148  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.766  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000173 tierB-000325 tierB-000951
(And (Member $e0 make) (Ongoing $e0))

;; p201149  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.942  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Member $e0 make) (Result $e0 $e1))

;; p201150  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.583  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000252 tierB-000309 tierB-000942
(And (Member $e0 take) (Past $e0))

;; p201151  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.666  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000148 tierB-000324 tierB-000805
(And (Member $e0 walk) (Past $e0))

;; p201152  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.467  tiers tierB  dominated
;;   e.g. tierB-000082 tierB-000370 tierB-000389
(And (Member $x0 thing) (Patient $e0 $x0))

;; p201153  star  support 7 (occ 8)  size 2  lifted 0  nisurp 0.618  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-000370 tierB-000748
(And (Ongoing $e0) (Result $e0 $e1))

;; p201154  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Past $e0) (Through $e0 $x0))

;; p201155  star  support 7 (occ 7)  size 2  lifted 0  nisurp 0.426  tiers tierB  dominated
;;   e.g. tierB-000246 tierB-000423 tierB-000722
(And (Possession $x0 $x1) (Theme $e0 $x0))

;; p201156  star  support 7 (occ 8)  size 2  lifted 1  nisurp 0.720  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000147 tierB-000171
(And (Agent $e0 $v0) (To $e1 $e0))

;; p201157  star  support 7 (occ 8)  size 2  lifted 1  nisurp 0.443  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000575 tierB-000688
(And (Agent $e0 $x0) (Goal $e0 $v0))

;; p201158  star  support 7 (occ 7)  size 2  lifted 1  nisurp 0.024  tiers tierB  dominated
;;   e.g. tierB-000083 tierB-000244 tierB-000530
(And (Degree $x0 $v0 excessive) (Member $x0 $v0))

;; p201159  star  support 7 (occ 9)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000411 tierB-000774 tierB-001033
(And (In $e0 $x0) (Member $e0 $v0))

;; p201160  star  support 7 (occ 9)  size 2  lifted 1  nisurp 0.500  tiers tierB  dominated
;;   e.g. tierB-000554 tierB-000757 tierB-001245
(And (Instrument $e0 $v0) (Past $e0))

;; p201161  star  support 7 (occ 8)  size 2  lifted 1  nisurp 0.765  tiers tierB  dominated
;;   e.g. tierB-000369 tierB-000757 tierB-000809
(And (Instrument $e0 $v0) (Patient $e0 $x0))

;; p201162  star  support 7 (occ 7)  size 2  lifted 1  nisurp 0.335  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000378 tierB-000653
(And (Location $e0 $v0) (Patient $e0 $x0))

;; p201163  star  support 7 (occ 7)  size 2  lifted 1  nisurp 0.545  tiers tierB  dominated
;;   e.g. tierB-000087 tierB-000465 tierB-000717
(And (Manner $e0 $v0) (Theme $e0 $e1))

;; p201164  star  support 7 (occ 7)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Member $e0 $v0) (Through $e0 $x0))

;; p201165  star  support 7 (occ 7)  size 2  lifted 1  nisurp 0.398  tiers tierB  dominated
;;   e.g. tierB-000093 tierB-000240 tierB-000734
(And (Member $e0 $v0) (To $e0 $x0))

;; p201166  star  support 7 (occ 8)  size 2  lifted 1  nisurp 0.065  tiers tierB
;;   e.g. tierB-000016 tierB-000285 tierB-000560
(And (Member $x0 $v0) (Past (LocatedIn $x0 $x1)))

;; p201167  star  support 7 (occ 8)  size 2  lifted 1  nisurp 0.108  tiers tierB  dominated
;;   e.g. tierB-000013 tierB-000026 tierB-000173
(And (Ongoing $e0) (Theme $e0 $v0))

;; p201168  star  support 7 (occ 9)  size 2  lifted 2  nisurp 0.627  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000029 tierB-000078
(And (Agent $e0 $v0) (Goal $e0 $v1))

;; p201169  star  support 7 (occ 7)  size 2  lifted 2  nisurp 0.626  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000842 tierB-000960 tierB-001021
(And (Degree $x0 $v0 $v1) (Member $x0 thing))

;; p201170  star  support 7 (occ 9)  size 2  lifted 2  nisurp 0.202  tiers tierB
;;   e.g. tierB-000065 tierB-000495 tierB-000662
(And (Member $x0 $v0) (Probably (Member $x0 $v1)))

;; p201171  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000411 tierB-000774 tierB-001033
(In $e0 $x0)

;; p201172  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000098 tierB-000139 tierB-000517
(Member $e0 change)

;; p201173  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000067 tierB-000393 tierB-000412
(Member $e0 kill)

;; p201174  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000056 tierB-000302 tierB-000425
(Member $e0 open)

;; p201175  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001003 tierB-001302 tierB-001334
(Member $e0 sleep)

;; p201176  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(Member $e0 turn)

;; p201177  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000083 tierB-000746 tierB-000890
(Member $x0 big)

;; p201178  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000762 tierB-000853 tierB-000986
(Member $x0 company)

;; p201179  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000009 tierB-000368 tierB-000403
(Member $x0 food)

;; p201180  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000408 tierB-000739 tierB-001058
(Member $x0 town)

;; p201181  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000032 tierB-000618 tierB-000650
(Member $x0 water)

;; p201182  star  support 7 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(Through $e0 $x0)

;; p201183  star  support 7 (occ 7)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000235 tierB-000509 tierB-000960
(Degree $x0 $v0 really)

;; p201184  star  support 7 (occ 7)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000210 tierB-000504 tierB-000629
(Only $v0 $e0)

;; p201185  star  support 7 (occ 8)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000005 tierB-000172 tierB-000421
(Ordinal $x0 <num> $v0)

;; p201186  cross  support 6 (occ 8)  size 4  lifted 1  nisurp -0.653  tiers tierB  dominated
;;   e.g. tierB-000277 tierB-000942 tierB-001130
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Patient $e0 $x1))

;; p201187  cross  support 6 (occ 8)  size 4  lifted 1  nisurp -0.653  tiers tierB  dominated
;;   e.g. tierB-000277 tierB-000942 tierB-001130
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Patient $e1 $x1))

;; p201188  cross  support 6 (occ 10)  size 4  lifted 1  nisurp -0.409  tiers tierB
;;   e.g. tierB-000277 tierB-000942 tierB-001130
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x1 $v0) (Patient $e0 $x1))

;; p201189  cross  support 6 (occ 6)  size 4  lifted 1  nisurp 0.551  tiers tierB
;;   e.g. tierB-000324 tierB-000387 tierB-001058
(And (Agent $e0 $x0) (Goal $e0 $x1) (GroupOf $x0 $v0) (Past $e0))

;; p201190  cross  support 6 (occ 7)  size 4  lifted 1  nisurp 0.448  tiers tierB
;;   e.g. tierB-000166 tierB-000410 tierB-000485
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Past $e1) (Theme $e1 $e0))

;; p201191  cross  support 6 (occ 7)  size 4  lifted 1  nisurp 0.201  tiers tierB
;;   e.g. tierB-000028 tierB-000942 tierB-001182
(And (Agent $e0 $x0) (Member $x0 $v0) (Ongoing $e0) (Patient $e0 $x1))

;; p201192  cross  support 6 (occ 7)  size 4  lifted 1  nisurp 0.069  tiers tierB
;;   e.g. tierB-000930 tierB-000942 tierB-001052
(And (Agent $e0 $x0) (Member $x0 $v0) (Ongoing $e1) (Theme $e0 $e1))

;; p201193  cross  support 6 (occ 7)  size 4  lifted 1  nisurp -0.024  tiers tierB
;;   e.g. tierB-000028 tierB-000942 tierB-001182
(And (Agent $e0 $x0) (Member $x1 $v0) (Ongoing $e0) (Patient $e0 $x1))

;; p201194  cross  support 6 (occ 6)  size 4  lifted 1  nisurp 0.793  tiers tierB
;;   e.g. tierB-000133 tierB-000320 tierB-000761
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (GroupOf $x1 $v0) (SubsetOf $x0 $x1))

;; p201195  cross  support 6 (occ 7)  size 4  lifted 1  nisurp 0.240  tiers tierB
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Patient $e1 $x0) (Result $e1 $e0))

;; p201196  cross  support 6 (occ 8)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-001041 tierB-001078 tierB-001303
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x0 $v0) (Past $e0))

;; p201197  cross  support 6 (occ 8)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-001041 tierB-001078 tierB-001303
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x1 $v0) (Past $e0))

;; p201198  cross  support 6 (occ 6)  size 4  lifted 1  nisurp -0.061  tiers tierB
;;   e.g. tierB-000291 tierB-000383 tierB-001027
(And (Location $e0 $x0) (Member $x1 $v0) (Past $e0) (Patient $e0 $x1))

;; p201199  cross  support 6 (occ 6)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(And (Member $e0 $v0) (Member $x0 door) (Past $e0) (Patient $e0 $x0))

;; p201200  cross  support 6 (occ 7)  size 4  lifted 1  nisurp -0.744  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000265 tierB-000654
(And (Member $e0 $v0) (Past $e0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p201201  cross  support 6 (occ 7)  size 4  lifted 1  nisurp -0.744  tiers tierB
;;   e.g. tierB-000063 tierB-000265 tierB-000654
(And (Member $e0 $v0) (Past $e1) (Patient $e0 $x0) (Patient $e1 $x0))

;; p201202  cross  support 6 (occ 8)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(And (Member $e0 hear) (Member $x0 $v0) (Past $e0) (Stimulus $e0 $x0))

;; p201203  cross  support 6 (occ 6)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000103 tierB-000338 tierB-000725
(And (Member $x0 $v0) (Past $e0) (Patient $e0 $x1) (Source $e0 $x0))

;; p201204  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000147 tierB-000171
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (To $e0 $e1))

;; p201205  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000078 tierB-000147 tierB-000171
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (To $e1 $e0))

;; p201206  cross  support 6 (occ 8)  size 4  lifted 2  nisurp 0.562  tiers tierB
;;   e.g. tierB-000117 tierB-000139 tierB-000173
(And (Agent $e0 $v0) (Agent $e1 $v0) (Past $e0) (Theme $e1 $v1))

;; p201207  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000203 tierB-001079 tierB-001185
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e1 $v1) (Member $v0 $v1))

;; p201208  cross  support 6 (occ 16)  size 4  lifted 2  nisurp -0.878  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000030 tierB-000166
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 $v1) (Past $e0))

;; p201209  cross  support 6 (occ 16)  size 4  lifted 2  nisurp -0.878  tiers tierB
;;   e.g. tierB-000012 tierB-000030 tierB-000166
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 $v1) (Past $e1))

;; p201210  cross  support 6 (occ 13)  size 4  lifted 2  nisurp 0.350  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-000485 tierB-000628
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Theme $e0 $v1))

;; p201211  cross  support 6 (occ 13)  size 4  lifted 2  nisurp 0.350  tiers tierB
;;   e.g. tierB-000470 tierB-000485 tierB-000628
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Theme $e1 $v1))

;; p201212  cross  support 6 (occ 8)  size 4  lifted 2  nisurp -0.354  tiers tierB
;;   e.g. tierB-000170 tierB-000762 tierB-000780
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $x1 $v0) (Patient $e0 $x1))

;; p201213  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.069  tiers tierB  dominated
;;   e.g. tierB-000715 tierB-000775 tierB-000793
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Recipient $e0 $x1))

;; p201214  cross  support 6 (occ 8)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000715 tierB-000775 tierB-000793
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Recipient $e0 $x1))

;; p201215  cross  support 6 (occ 6)  size 4  lifted 2  nisurp 0.245  tiers tierB
;;   e.g. tierB-000256 tierB-000345 tierB-000692
(And (Agent $e0 $x0) (Member $x0 $v0) (Past $e0) (Patient $e0 $v1))

;; p201216  cross  support 6 (occ 9)  size 4  lifted 2  nisurp 0.009  tiers tierB
;;   e.g. tierB-000231 tierB-000354 tierB-000769
(And (Agent $e0 $x0) (Member $x0 $v0) (Past $e0) (Theme $e0 $v1))

;; p201217  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.102  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e1 $x0))

;; p201218  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.206  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Result $e1 $e0))

;; p201219  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.102  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Member $e1 $v1) (Patient $e1 $x0))

;; p201220  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.206  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Member $e1 $v1) (Result $e1 $e0))

;; p201221  cross  support 6 (occ 9)  size 4  lifted 2  nisurp 0.206  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Member $x0 $v1) (Result $e1 $e0))

;; p201222  cross  support 6 (occ 6)  size 4  lifted 2  nisurp -0.364  tiers tierB
;;   e.g. tierB-000419 tierB-000688 tierB-001041
(And (Experiencer $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0) (Past $e0))

;; p201223  cross  support 6 (occ 6)  size 4  lifted 2  nisurp 0.272  tiers tierB
;;   e.g. tierB-000160 tierB-000339 tierB-000455
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e1 $v1) (Theme $e0 $e1))

;; p201224  cross  support 6 (occ 6)  size 4  lifted 2  nisurp 0.122  tiers tierB  dominated
;;   e.g. tierB-000135 tierB-000176 tierB-000482
(And (Goal $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Patient $e0 $x1))

;; p201225  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.177  tiers tierB
;;   e.g. tierB-000135 tierB-000176 tierB-000482
(And (Goal $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Patient $e0 $x1))

;; p201226  cross  support 6 (occ 7)  size 4  lifted 2  nisurp -0.840  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Member $x0 $v1) (Patient $e1 $x0))

;; p201227  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.206  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Member $x0 $v1) (Result $e1 $e0))

;; p201228  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.240  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0) (Result $e0 $e1))

;; p201229  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.240  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e1 $x0) (Result $e1 $e0))

;; p201230  cross  support 6 (occ 9)  size 4  lifted 2  nisurp 0.240  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (GroupOf $x0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Result $e0 $e1))

;; p201231  cross  support 6 (occ 10)  size 4  lifted 2  nisurp 0.069  tiers tierB  signal conj-pattern
;;   e.g. tierB-000358 tierB-000730 tierB-000819
(And (Holder $e0 $v0) (Member $e0 have) (Member $x0 $v1) (Theme $e0 $x0))

;; p201232  cross  support 6 (occ 10)  size 4  lifted 2  nisurp 0.069  tiers tierB
;;   e.g. tierB-000222 tierB-000392 tierB-000444
(And (Instrument $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p201233  cross  support 6 (occ 6)  size 4  lifted 2  nisurp -0.618  tiers tierB
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x1))

;; p201234  cross  support 6 (occ 6)  size 4  lifted 2  nisurp -0.494  tiers tierB
;;   e.g. tierB-000047 tierB-000704 tierB-000962
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p201235  cross  support 6 (occ 6)  size 4  lifted 2  nisurp -0.416  tiers tierB
;;   e.g. tierB-000008 tierB-000383 tierB-000524
(And (Location $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Past $e0))

;; p201236  cross  support 6 (occ 8)  size 4  lifted 2  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(And (Manner $e0 quickly) (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p201237  cross  support 6 (occ 6)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000259 tierB-000903 tierB-001031
(And (Member $e0 $v0) (Member $e1 $v1) (Past $e0) (Patient $e0 $e1))

;; p201238  cross  support 6 (occ 6)  size 4  lifted 2  nisurp -0.506  tiers tierB
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Member $e0 $v0) (Member $e1 $v1) (Patient $e0 $x0) (Theme $e0 $e1))

;; p201239  cross  support 6 (occ 8)  size 4  lifted 2  nisurp 0.276  tiers tierB
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Member $e0 $v0) (Member $x0 $v1) (Past $e0) (Through $e0 $x0))

;; p201240  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000470
(And (Member $e0 $v0) (Past $e0) (Theme $e0 $e1) (Theme $e1 $v1))

;; p201241  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000117 tierB-000173 tierB-000470
(And (Member $e0 $v0) (Past $e1) (Theme $e0 $v1) (Theme $e1 $e0))

;; p201242  cross  support 6 (occ 7)  size 4  lifted 2  nisurp 0.222  tiers tierB
;;   e.g. tierB-000389 tierB-000932 tierB-001520
(And (Member $x0 $v0) (Past $e0) (Patient $e0 $x0) (Time $e0 $v1))

;; p201243  cross  support 6 (occ 7)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000203 tierB-001079 tierB-001185
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v2) (Member $v0 $v1))

;; p201244  cross  support 6 (occ 7)  size 4  lifted 3  nisurp -0.318  tiers tierB  dominated
;;   e.g. tierB-000203 tierB-001079 tierB-001185
(And (Agent $e0 $v0) (Member $e0 $v2) (Member $e1 $v1) (Member $v0 $v1))

;; p201245  cross  support 6 (occ 7)  size 4  lifted 3  nisurp -0.175  tiers tierB
;;   e.g. tierB-000056 tierB-000371 tierB-000425
(And (Agent $e0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p201246  cross  support 6 (occ 7)  size 4  lifted 3  nisurp 0.102  tiers tierB
;;   e.g. tierB-000782 tierB-000801 tierB-001008
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Manner $e0 $v1) (Member $e0 $v2))

;; p201247  cross  support 6 (occ 9)  size 4  lifted 3  nisurp 0.260  tiers tierB
;;   e.g. tierB-000268 tierB-000715 tierB-000888
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0) (Theme $e0 $v2))

;; p201248  cross  support 6 (occ 7)  size 4  lifted 3  nisurp -0.130  tiers tierB
;;   e.g. tierB-000338 tierB-000400 tierB-000438
(And (Inheritance $v0 $v1) (Member $e0 $v2) (Member $x0 $v0) (Source $e0 $x0))

;; p201249  cross  support 6 (occ 7)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000410 tierB-000465 tierB-000610
(And (Member $e0 $v0) (Member $e1 $v1) (Patient $e0 $v2) (Theme $e1 $e0))

;; p201250  cross  support 6 (occ 7)  size 4  lifted 3  nisurp -0.434  tiers tierB
;;   e.g. tierB-000617 tierB-000932 tierB-000975
(And (Member $x0 $v0) (Member $x0 $v1) (Member $x1 $v2) (Possession $x1 $x0))

;; p201251  cross  support 6 (occ 7)  size 4  lifted 4  nisurp -0.415  tiers tierB
;;   e.g. tierB-000085 tierB-000107 tierB-000352
(And (Degree $x0 $v0 $v1) (Member $e0 $v2) (Member $x0 $v3) (Patient $e0 $x0))

;; p201252  cross  support 6 (occ 8)  size 3  lifted 0  nisurp -0.384  tiers tierB  dominated
;;   e.g. tierB-000277 tierB-000942 tierB-001130
(And (Agent $e0 $x0) (Agent $e1 $x0) (Patient $e0 $x1))

;; p201253  cross  support 6 (occ 6)  size 3  lifted 0  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(And (Member $x0 door) (Past $e0) (Patient $e0 $x0))

;; p201254  cross  support 6 (occ 7)  size 3  lifted 0  nisurp -0.514  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000265 tierB-000654
(And (Past $e0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p201255  cross  support 6 (occ 7)  size 3  lifted 1  nisurp 0.855  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000147 tierB-000171
(And (Agent $e0 $v0) (Agent $e1 $v0) (To $e0 $e1))

;; p201256  cross  support 6 (occ 13)  size 3  lifted 1  nisurp 0.350  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-000485 tierB-000628
(And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $v0))

;; p201257  cross  support 6 (occ 9)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-001182 tierB-001416 tierB-001773
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 man))

;; p201258  cross  support 6 (occ 6)  size 3  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000073 tierB-000998 tierB-001182
(And (Agent $e0 $x0) (Member $e0 make) (Member $x0 $v0))

;; p201259  cross  support 6 (occ 7)  size 3  lifted 1  nisurp 0.069  tiers tierB  dominated
;;   e.g. tierB-000715 tierB-000775 tierB-000793
(And (Agent $e0 $x0) (Member $x1 $v0) (Recipient $e0 $x1))

;; p201260  cross  support 6 (occ 6)  size 3  lifted 1  nisurp -0.554  tiers tierB  dominated
;;   e.g. tierB-000133 tierB-000320 tierB-000761
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (GroupOf $x1 $v0))

;; p201261  cross  support 6 (occ 6)  size 3  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000133 tierB-000320 tierB-000761
(And (Cardinality $x0 <num>) (GroupOf $x1 $v0) (SubsetOf $x0 $x1))

;; p201262  cross  support 6 (occ 7)  size 3  lifted 1  nisurp 0.206  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Result $e1 $e0))

;; p201263  cross  support 6 (occ 6)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000191 tierB-001160 tierB-001485
(And (Experiencer $e0 $x0) (GroupOf $x0 person) (Member $e0 $v0))

;; p201264  cross  support 6 (occ 6)  size 3  lifted 1  nisurp 0.272  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000455
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Theme $e0 $e1))

;; p201265  cross  support 6 (occ 6)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(And (Goal $e0 $x0) (Member $e0 go) (Member $x0 $v0))

;; p201266  cross  support 6 (occ 6)  size 3  lifted 1  nisurp 0.122  tiers tierB  dominated
;;   e.g. tierB-000135 tierB-000176 tierB-000482
(And (Goal $e0 $x0) (Member $x1 $v0) (Patient $e0 $x1))

;; p201267  cross  support 6 (occ 7)  size 3  lifted 1  nisurp 0.240  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (GroupOf $x0 $v0) (Patient $e0 $x0) (Result $e0 $e1))

;; p201268  cross  support 6 (occ 10)  size 3  lifted 1  nisurp 0.069  tiers tierB  dominated
;;   e.g. tierB-000222 tierB-000392 tierB-000444
(And (Instrument $e0 $x0) (Member $x0 $v0) (Past $e0))

;; p201269  cross  support 6 (occ 9)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(And (Location $e0 $x0) (Member $e0 live) (Member $x0 $v0))

;; p201270  cross  support 6 (occ 6)  size 3  lifted 1  nisurp -0.276  tiers tierB  dominated
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(And (Location $e0 $x0) (Member $x0 $v0) (Theme $e0 $x1))

;; p201271  cross  support 6 (occ 6)  size 3  lifted 1  nisurp -0.276  tiers tierB  dominated
;;   e.g. tierB-000047 tierB-000704 tierB-000962
(And (Location $e0 $x0) (Member $x1 $v0) (Theme $e0 $x1))

;; p201272  cross  support 6 (occ 8)  size 3  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(And (Manner $e0 quickly) (Member $x0 $v0) (Patient $e0 $x0))

;; p201273  cross  support 6 (occ 6)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000259 tierB-000903 tierB-001031
(And (Member $e0 $v0) (Past $e1) (Patient $e1 $e0))

;; p201274  cross  support 6 (occ 6)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Member $e0 $v0) (Patient $e1 $x0) (Theme $e1 $e0))

;; p201275  cross  support 6 (occ 7)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000252 tierB-000942 tierB-000978
(And (Member $e0 take) (Member $x0 $v0) (Theme $e0 $x0))

;; p201276  cross  support 6 (occ 8)  size 3  lifted 1  nisurp 0.276  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Member $x0 $v0) (Past $e0) (Through $e0 $x0))

;; p201277  cross  support 6 (occ 7)  size 3  lifted 1  nisurp 0.562  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000470
(And (Past $e0) (Theme $e0 $e1) (Theme $e1 $v0))

;; p201278  cross  support 6 (occ 6)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000805 tierB-000969 tierB-001547
(And (Agent $e0 $e1) (Member $e0 $v0) (Member $e1 $v1))

;; p201279  cross  support 6 (occ 7)  size 3  lifted 2  nisurp 0.547  tiers tierB  dominated
;;   e.g. tierB-000203 tierB-001079 tierB-001185
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $v0 $v1))

;; p201280  cross  support 6 (occ 7)  size 3  lifted 2  nisurp -0.318  tiers tierB  dominated
;;   e.g. tierB-000203 tierB-001079 tierB-001185
(And (Agent $e0 $v0) (Member $e1 $v1) (Member $v0 $v1))

;; p201281  cross  support 6 (occ 7)  size 3  lifted 2  nisurp 0.102  tiers tierB  dominated
;;   e.g. tierB-000782 tierB-000801 tierB-001008
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Manner $e0 $v1))

;; p201282  cross  support 6 (occ 6)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000016 tierB-001132 tierB-001228
(And (GroupOf $x0 $v0) (Instrument $e0 $x0) (Member $e0 $v1))

;; p201283  cross  support 6 (occ 8)  size 3  lifted 2  nisurp 0.758  tiers tierB
;;   e.g. tierB-000655 tierB-001020 tierB-001069
(And (GroupOf $x0 $v0) (Member $v1 $v0) (PartOf $v1 $x0))

;; p201284  cross  support 6 (occ 7)  size 3  lifted 2  nisurp -0.130  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000400 tierB-000438
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Source $e0 $x0))

;; p201285  cross  support 6 (occ 9)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000230 tierB-000831 tierB-001135
(And (Like $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p201286  cross  support 6 (occ 6)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000259 tierB-000903 tierB-001031
(And (Member $e0 $v0) (Member $e1 $v1) (Patient $e0 $e1))

;; p201287  cross  support 6 (occ 8)  size 3  lifted 2  nisurp 0.276  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Member $e0 $v0) (Member $x0 $v1) (Through $e0 $x0))

;; p201288  cross  support 6 (occ 6)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000410 tierB-000465 tierB-000610
(And (Member $e0 $v0) (Patient $e1 $v1) (Theme $e0 $e1))

;; p201289  cross  support 6 (occ 7)  size 3  lifted 2  nisurp -0.139  tiers tierB
;;   e.g. tierB-000016 tierB-000285 tierB-000560
(And (Member $x0 $v0) (Member $x1 $v1) (Past (LocatedIn $x0 $x1)))

;; p201290  cross  support 6 (occ 6)  size 3  lifted 3  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000085 tierB-000107 tierB-000352
(And (Degree $x0 $v0 $v1) (Member $e0 $v2) (Patient $e0 $x0))

;; p201291  cross  support 6 (occ 8)  size 2  lifted 2  nisurp 3.765  tiers tierB  dominated
;;   e.g. tierB-000655 tierB-001020 tierB-001069
(And (GroupOf $x0 $v0) (Member $v1 $v0))

;; p201292  kindlevel  support 6 (occ 8)  size 3  lifted 4  nisurp -0.571  tiers tierB
;;   e.g. tierB-000184 tierB-000570 tierB-000613
(And (Inheritance $v0 $v1) (Inheritance $v1 $v2) (Inheritance $v1 $v3))

;; p201293  kindlevel  support 6 (occ 6)  size 2  lifted 3  nisurp 0.091  tiers tierB
;;   e.g. tierB-000041 tierB-000843 tierB-001232
(And (Degree $v0 $v1 $v2) (Inheritance $v0 $v1))

;; p201294  kindlevel  support 6 (occ 6)  size 2  lifted 3  nisurp 0.221  tiers tierB
;;   e.g. tierB-000289 tierB-000807 tierB-000821
(And (Inheritance $v0 $v1) (Possession $v1 $v2))

;; p201295  kindlevel  support 6 (occ 6)  size 2  lifted 3  nisurp 0.628  tiers tierB
;;   e.g. tierB-000044 tierB-000187 tierB-000519
(And (Member $v0 $v1) (Member $v2 $v1))

;; p201296  kindlevel  support 6 (occ 6)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000591 tierB-000898 tierB-001368
(Degree $v0 $v1 very)

;; p201297  star  support 6 (occ 6)  size 4  lifted 1  nisurp 0.660  tiers tierB  dominated
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(And (Experiencer $e0 $v0) (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))

;; p201298  star  support 6 (occ 8)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000963 tierB-001041 tierB-001078
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 $v0) (Ongoing $e0))

;; p201299  star  support 6 (occ 8)  size 4  lifted 1  nisurp 0.360  tiers tierB  dominated
;;   e.g. tierB-001041 tierB-001078 tierB-001303
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $e0 $v0) (Past $e0))

;; p201300  star  support 6 (occ 6)  size 4  lifted 1  nisurp -0.214  tiers tierB
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(And (Location $e0 $x0) (Member $e0 $v0) (Past $e0) (Theme $e0 $x1))

;; p201301  star  support 6 (occ 6)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000103 tierB-000338 tierB-000725
(And (Member $e0 $v0) (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))

;; p201302  star  support 6 (occ 6)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000426 tierB-000520 tierB-000801
(And (Agent $e0 $x0) (Manner $e0 $v0) (Member $e0 $v1) (Ongoing $e0))

;; p201303  star  support 6 (occ 6)  size 4  lifted 2  nisurp -0.039  tiers tierB  dominated
;;   e.g. tierB-000256 tierB-000345 tierB-000692
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e0) (Patient $e0 $v1))

;; p201304  star  support 6 (occ 7)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000189 tierB-000589 tierB-000676
(And (Experiencer $e0 $v0) (Location $e0 $x0) (Member $e0 $v1) (Past $e0))

;; p201305  star  support 6 (occ 9)  size 4  lifted 2  nisurp 0.102  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Member $x0 $v1) (Patient $e1 $x0))

;; p201306  star  support 6 (occ 7)  size 4  lifted 2  nisurp 0.222  tiers tierB
;;   e.g. tierB-000565 tierB-000631 tierB-000808
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Past $e0) (Time $e0 $v1))

;; p201307  star  support 6 (occ 6)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000063 tierB-000653 tierB-001077
(And (Location $e0 $v0) (Member $e0 $v1) (Past $e0) (Patient $e0 $x0))

;; p201308  star  support 6 (occ 7)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000012 tierB-000029 tierB-000078
(And (Agent $e0 $v0) (Goal $e0 $v1) (Member $e0 $v2) (Past $e0))

;; p201309  star  support 6 (occ 8)  size 3  lifted 0  nisurp 0.724  tiers tierB  dominated
;;   e.g. tierB-000963 tierB-001041 tierB-001078
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0))

;; p201310  star  support 6 (occ 8)  size 3  lifted 0  nisurp 0.360  tiers tierB  dominated
;;   e.g. tierB-001041 tierB-001078 tierB-001303
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Past $e0))

;; p201311  star  support 6 (occ 6)  size 3  lifted 0  nisurp -0.214  tiers tierB  dominated
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(And (Location $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p201312  star  support 6 (occ 6)  size 3  lifted 0  nisurp 0.660  tiers tierB  dominated
;;   e.g. tierB-000189 tierB-000421 tierB-000681
(And (Member $e0 hear) (Past $e0) (Stimulus $e0 $x0))

;; p201313  star  support 6 (occ 6)  size 3  lifted 0  nisurp 0.566  tiers tierB  dominated
;;   e.g. tierB-000103 tierB-000338 tierB-000725
(And (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))

;; p201314  star  support 6 (occ 6)  size 3  lifted 1  nisurp 0.539  tiers tierB  dominated
;;   e.g. tierB-000426 tierB-000520 tierB-000801
(And (Agent $e0 $x0) (Manner $e0 $v0) (Ongoing $e0))

;; p201315  star  support 6 (occ 6)  size 3  lifted 1  nisurp 0.160  tiers tierB
;;   e.g. tierB-000338 tierB-000485 tierB-000693
(And (Agent $e0 $x0) (Member $e0 $v0) (Source $e0 $x1))

;; p201316  star  support 6 (occ 6)  size 3  lifted 1  nisurp -0.039  tiers tierB  dominated
;;   e.g. tierB-000256 tierB-000345 tierB-000692
(And (Agent $e0 $x0) (Past $e0) (Patient $e0 $v0))

;; p201317  star  support 6 (occ 6)  size 3  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000133 tierB-000320 tierB-000761
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (SubsetOf $x0 $x1))

;; p201318  star  support 6 (occ 7)  size 3  lifted 1  nisurp 0.638  tiers tierB  dominated
;;   e.g. tierB-000189 tierB-000589 tierB-000676
(And (Experiencer $e0 $v0) (Location $e0 $x0) (Past $e0))

;; p201319  star  support 6 (occ 7)  size 3  lifted 1  nisurp 0.102  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000370 tierB-000392
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Patient $e1 $x0))

;; p201320  star  support 6 (occ 6)  size 3  lifted 1  nisurp 0.272  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000455
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Theme $e0 $e1))

;; p201321  star  support 6 (occ 6)  size 3  lifted 1  nisurp 0.222  tiers tierB  dominated
;;   e.g. tierB-000565 tierB-000631 tierB-000808
(And (Experiencer $e0 $x0) (Past $e0) (Time $e0 $v0))

;; p201322  star  support 6 (occ 6)  size 3  lifted 1  nisurp -0.005  tiers tierB
;;   e.g. tierB-000462 tierB-000834 tierB-001023
(And (Goal $e0 $x0) (Member $e0 $v0) (Theme $e0 $x1))

;; p201323  star  support 6 (occ 6)  size 3  lifted 1  nisurp 0.561  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000653 tierB-001077
(And (Location $e0 $v0) (Past $e0) (Patient $e0 $x0))

;; p201324  star  support 6 (occ 6)  size 3  lifted 1  nisurp -0.264  tiers tierB
;;   e.g. tierB-000080 tierB-000147 tierB-001143
(And (Member $e0 $v0) (Obligated $e0) (Past $e0))

;; p201325  star  support 6 (occ 6)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000259 tierB-000903 tierB-001031
(And (Member $e0 $v0) (Past $e0) (Patient $e0 $e1))

;; p201326  star  support 6 (occ 6)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000237 tierB-000327 tierB-000565
(And (Member $e0 $v0) (Past $e0) (Time $e0 yesterday))

;; p201327  star  support 6 (occ 6)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Member $e0 $v0) (Patient $e0 $x0) (Theme $e0 $e1))

;; p201328  star  support 6 (occ 7)  size 3  lifted 2  nisurp 0.660  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000029 tierB-000078
(And (Agent $e0 $v0) (Goal $e0 $v1) (Past $e0))

;; p201329  star  support 6 (occ 6)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000091 tierB-000274 tierB-000556
(And (Agent $e0 $x0) (For $e0 $v0) (Member $e0 $v1))

;; p201330  star  support 6 (occ 6)  size 3  lifted 2  nisurp 0.276  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000842 tierB-001021 tierB-001142
(And (Degree $x0 $v0 $v1) (Member $x0 $v0) (Member $x0 thing))

;; p201331  star  support 6 (occ 7)  size 3  lifted 2  nisurp 0.420  tiers tierB  dominated
;;   e.g. tierB-000189 tierB-000589 tierB-000676
(And (Experiencer $e0 $v0) (Location $e0 $x0) (Member $e0 $v1))

;; p201332  star  support 6 (occ 6)  size 3  lifted 2  nisurp 0.319  tiers tierB
;;   e.g. tierB-000145 tierB-000162 tierB-000730
(And (Holder $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p201333  star  support 6 (occ 6)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000144 tierB-000268 tierB-000398
(And (Manner $e0 $v0) (Member $e0 $v1) (Obligated $e0))

;; p201334  star  support 6 (occ 7)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000410 tierB-000465 tierB-000610
(And (Member $e0 $v0) (Patient $e0 $v1) (Theme $e1 $e0))

;; p201335  star  support 6 (occ 8)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000485 tierB-000715 tierB-000769
(And (Member $e0 $v0) (Recipient $e0 $x0) (Theme $e0 $v1))

;; p201336  star  support 6 (occ 7)  size 3  lifted 3  nisurp -0.379  tiers tierB  dominated
;;   e.g. tierB-000085 tierB-000107 tierB-000352
(And (Degree $x0 $v0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p201337  star  support 6 (occ 6)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000345 tierB-000465 tierB-001217
(And (Manner $e0 $v0) (Member $e0 $v1) (Patient $e0 $v2))

;; p201338  star  support 6 (occ 7)  size 3  lifted 3  nisurp 0.325  tiers tierB
;;   e.g. tierB-000053 tierB-000254 tierB-000268
(And (Manner $e0 $v0) (Member $e0 $v1) (Theme $e0 $v2))

;; p201339  star  support 6 (occ 6)  size 3  lifted 3  nisurp 0.381  tiers tierB
;;   e.g. tierB-000144 tierB-000212 tierB-000238
(And (Manner $e0 $v0) (Member $e0 $v1) (Time $e0 $v2))

;; p201340  star  support 6 (occ 8)  size 3  lifted 3  nisurp 0.679  tiers tierB
;;   e.g. tierB-000567 tierB-000654 tierB-000783
(And (Member $x0 $v0) (Member $x0 $v1) (Past (Member $x0 $v2)))

;; p201341  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.675  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000238 tierB-000277 tierB-000387
(And (Agent $e0 $x0) (Member $e0 come))

;; p201342  star  support 6 (occ 9)  size 2  lifted 0  nisurp 0.702  tiers tierB  dominated
;;   e.g. tierB-001182 tierB-001416 tierB-001773
(And (Agent $e0 $x0) (Member $x0 man))

;; p201343  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.160  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000485 tierB-000693
(And (Agent $e0 $x0) (Source $e0 $x1))

;; p201344  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.939  tiers tierB  dominated
;;   e.g. tierB-000133 tierB-000320 tierB-000761
(And (Cardinality $x0 <num>) (SubsetOf $x0 $x1))

;; p201345  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.669  tiers tierB  dominated
;;   e.g. tierB-000191 tierB-001160 tierB-001485
(And (Experiencer $e0 $x0) (GroupOf $x0 person))

;; p201346  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.272  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000455
(And (Experiencer $e0 $x0) (Theme $e0 $e1))

;; p201347  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.943  tiers tierB  dominated
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(And (Goal $e0 $x0) (Member $e0 go))

;; p201348  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.005  tiers tierB  dominated
;;   e.g. tierB-000462 tierB-000834 tierB-001023
(And (Goal $e0 $x0) (Theme $e0 $x1))

;; p201349  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.936  tiers tierB  dominated
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(And (Location $e0 $x0) (Member $e0 live))

;; p201350  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000215 tierB-000636 tierB-000852
(And (Member $e0 capture) (Past $e0))

;; p201351  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.562  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000456 tierB-000609 tierB-000779
(And (Member $e0 fall) (Past $e0))

;; p201352  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.368  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000577 tierB-000672 tierB-000890
(And (Member $e0 get) (Past $e0))

;; p201353  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.791  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000942 tierB-000978
(And (Member $e0 take) (Theme $e0 $x0))

;; p201354  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.840  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(And (Member $e0 turn) (Patient $e0 $x0))

;; p201355  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.644  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000089 tierB-000866 tierB-000938
(And (Member $e0 use) (Theme $e0 $x0))

;; p201356  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.264  tiers tierB  dominated
;;   e.g. tierB-000080 tierB-000147 tierB-001143
(And (Obligated $e0) (Past $e0))

;; p201357  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000259 tierB-000903 tierB-001031
(And (Past $e0) (Patient $e0 $e1))

;; p201358  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000237 tierB-000327 tierB-000565
(And (Past $e0) (Time $e0 yesterday))

;; p201359  star  support 6 (occ 6)  size 2  lifted 0  nisurp 0.506  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Patient $e0 $x0) (Theme $e0 $e1))

;; p201360  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000805 tierB-000969 tierB-001547
(And (Agent $e0 $e1) (Member $e0 $v0))

;; p201361  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000805 tierB-000969 tierB-001547
(And (Agent $e0 $e1) (Member $e1 $v0))

;; p201362  star  support 6 (occ 7)  size 2  lifted 1  nisurp 0.855  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000048 tierB-000524 tierB-000707
(And (Agent $e0 $v0) (Member $e0 live))

;; p201363  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.837  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000203 tierB-000253 tierB-000292
(And (Agent $e0 $v0) (Member $e0 study))

;; p201364  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.801  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000117 tierB-000216 tierB-000400
(And (Agent $e0 $v0) (Member $e0 try))

;; p201365  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.675  tiers tierB  dominated
;;   e.g. tierB-000091 tierB-000274 tierB-000556
(And (Agent $e0 $x0) (For $e0 $v0))

;; p201366  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000034 tierB-000218 tierB-000616
(And (Already $e0) (Member $e0 $v0))

;; p201367  star  support 6 (occ 7)  size 2  lifted 1  nisurp 0.420  tiers tierB  dominated
;;   e.g. tierB-000189 tierB-000589 tierB-000676
(And (Experiencer $e0 $v0) (Location $e0 $x0))

;; p201368  star  support 6 (occ 7)  size 2  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000599 tierB-000892 tierB-001212
(And (For $x0 $x1) (Member $x1 $v0))

;; p201369  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.517  tiers tierB  dominated
;;   e.g. tierB-000016 tierB-001132 tierB-001228
(And (GroupOf $x0 $v0) (Instrument $e0 $x0))

;; p201370  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.312  tiers tierB
;;   e.g. tierB-000641 tierB-000697 tierB-001066
(And (GroupOf $x0 $v0) (PartOf $x1 $x0))

;; p201371  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.319  tiers tierB  dominated
;;   e.g. tierB-000145 tierB-000162 tierB-000730
(And (Holder $e0 $v0) (Past $e0))

;; p201372  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001135
(And (Like $e0 $x0) (Member $e0 $v0))

;; p201373  star  support 6 (occ 9)  size 2  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001135
(And (Like $e0 $x0) (Member $x0 $v0))

;; p201374  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.791  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000268 tierB-000398
(And (Manner $e0 $v0) (Obligated $e0))

;; p201375  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000097 tierB-000201 tierB-000790
(And (Member $e0 $v0) (On $e0 $x0))

;; p201376  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000259 tierB-000903 tierB-001031
(And (Member $e0 $v0) (Patient $e0 $e1))

;; p201377  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000259 tierB-000903 tierB-001031
(And (Member $e0 $v0) (Patient $e1 $e0))

;; p201378  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000237 tierB-000327 tierB-000565
(And (Member $e0 $v0) (Time $e0 yesterday))

;; p201379  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.880  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000325 tierB-000539 tierB-001431
(And (Member $e0 make) (Patient $e0 $v0))

;; p201380  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.276  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000083 tierB-000746 tierB-000890
(And (Member $x0 $v0) (Member $x0 big))

;; p201381  star  support 6 (occ 7)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000230 tierB-000316 tierB-000576
(And (Member $x0 $v0) (Member $x0 huge))

;; p201382  star  support 6 (occ 7)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000082 tierB-001123 tierB-001169
(And (Member $x0 $v0) (Member $x0 whole))

;; p201383  star  support 6 (occ 8)  size 2  lifted 1  nisurp 0.276  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Member $x0 $v0) (Through $e0 $x0))

;; p201384  star  support 6 (occ 6)  size 2  lifted 1  nisurp 0.639  tiers tierB  dominated
;;   e.g. tierB-000410 tierB-000465 tierB-000610
(And (Patient $e0 $v0) (Theme $e1 $e0))

;; p201385  star  support 6 (occ 8)  size 2  lifted 1  nisurp 0.899  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000715 tierB-000769
(And (Recipient $e0 $x0) (Theme $e0 $v0))

;; p201386  star  support 6 (occ 6)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000105 tierB-000672 tierB-000908
(And (Beneficiary $e0 $v0) (Member $e0 $v1))

;; p201387  star  support 6 (occ 6)  size 2  lifted 2  nisurp 0.552  tiers tierB  dominated
;;   e.g. tierB-000085 tierB-000107 tierB-000352
(And (Degree $x0 $v0 $v1) (Patient $e0 $x0))

;; p201388  star  support 6 (occ 6)  size 2  lifted 2  nisurp 0.276  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000235 tierB-000509 tierB-000960
(And (Degree $x0 $v0 really) (Member $x0 $v1))

;; p201389  star  support 6 (occ 8)  size 2  lifted 2  nisurp 0.655  tiers tierB  dominated
;;   e.g. tierB-000655 tierB-001020 tierB-001069
(And (GroupOf $x0 $v0) (PartOf $v1 $x0))

;; p201390  star  support 6 (occ 6)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000297 tierB-000561 tierB-000611
(And (Like $e0 $v0) (Member $e0 $v1))

;; p201391  star  support 6 (occ 6)  size 2  lifted 2  nisurp 0.486  tiers tierB  dominated
;;   e.g. tierB-000345 tierB-000465 tierB-001217
(And (Manner $e0 $v0) (Patient $e0 $v1))

;; p201392  star  support 6 (occ 7)  size 2  lifted 2  nisurp 0.325  tiers tierB  dominated
;;   e.g. tierB-000053 tierB-000254 tierB-000268
(And (Manner $e0 $v0) (Theme $e0 $v1))

;; p201393  star  support 6 (occ 6)  size 2  lifted 2  nisurp 0.381  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000212 tierB-000238
(And (Manner $e0 $v0) (Time $e0 $v1))

;; p201394  star  support 6 (occ 6)  size 2  lifted 2  nisurp 0.416  tiers tierB
;;   e.g. tierB-000253 tierB-000593 tierB-000690
(And (Measure $e0 $v0 <num> $v1) (Past $e0))

;; p201395  star  support 6 (occ 6)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000387 tierB-000559 tierB-000791
(And (Member $e0 $v0) (Time $e0 (Weekday $v1)))

;; p201396  star  support 6 (occ 6)  size 2  lifted 2  nisurp 0.553  tiers tierB
;;   e.g. tierB-000839 tierB-000859 tierB-001006
(And (Member $x0 $v0) (Member $x0 $v1) ~NEG)

;; p201397  star  support 6 (occ 7)  size 2  lifted 2  nisurp 0.553  tiers tierB
;;   e.g. tierB-000023 tierB-000214 tierB-001499
(And (Member $x0 $v0) ~NEG (Member $x0 $v1))

;; p201398  star  support 6 (occ 6)  size 2  lifted 3  nisurp 1.348  tiers tierB
;;   e.g. tierB-000146 tierB-000518 tierB-000604
(And (Degree $x0 $v0 $v1) (GroupOf $x0 $v2))

;; p201399  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000805 tierB-000969 tierB-001547
(Agent $e0 $e1)

;; p201400  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000218 tierB-000616
(Already $e0)

;; p201401  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000599 tierB-000892 tierB-001212
(For $x0 $x1)

;; p201402  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000172 tierB-000622 tierB-001271
(From $x0 $x1)

;; p201403  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000387 tierB-000656 tierB-000712
(GroupOf $x0 student)

;; p201404  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001135
(Like $e0 $x0)

;; p201405  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000636 tierB-000852
(Member $e0 capture)

;; p201406  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000775 tierB-000805 tierB-001089
(Member $e0 cause)

;; p201407  star  support 6 (occ 8)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000079 tierB-000188 tierB-000218
(Member $e0 close)

;; p201408  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001236 tierB-001520 tierB-001721
(Member $e0 do)

;; p201409  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000299 tierB-000319 tierB-000858
(Member $e0 help)

;; p201410  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000257 tierB-000326 tierB-000784
(Member $e0 sell)

;; p201411  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000078 tierB-000327 tierB-000550
(Member $e0 talk)

;; p201412  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000258 tierB-000520 tierB-000651
(Member $e0 watch)

;; p201413  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000305 tierB-000337 tierB-000340
(Member $x0 boy)

;; p201414  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000160 tierB-001021 tierB-001114
(Member $x0 child)

;; p201415  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000687 tierB-000792 tierB-000798
(Member $x0 floor)

;; p201416  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000145 tierB-000383 tierB-000981
(Member $x0 horse)

;; p201417  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000316 tierB-000576
(Member $x0 huge)

;; p201418  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000561 tierB-000685 tierB-000708
(Member $x0 light)

;; p201419  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000180 tierB-000498 tierB-000841
(Member $x0 rain)

;; p201420  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000297 tierB-000546 tierB-000782
(Member $x0 school)

;; p201421  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000805 tierB-000951 tierB-001384
(Member $x0 sound)

;; p201422  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000202 tierB-000882 tierB-001111
(Member $x0 street)

;; p201423  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000261 tierB-000343 tierB-000560
(Member $x0 wall)

;; p201424  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000082 tierB-001123 tierB-001169
(Member $x0 whole)

;; p201425  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000097 tierB-000201 tierB-000790
(On $e0 $x0)

;; p201426  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000259 tierB-000903 tierB-001031
(Patient $e0 $e1)

;; p201427  star  support 6 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000237 tierB-000327 tierB-000565
(Time $e0 yesterday)

;; p201428  star  support 6 (occ 6)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000105 tierB-000672 tierB-000908
(Beneficiary $e0 $v0)

;; p201429  star  support 6 (occ 6)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000172 tierB-000237 tierB-000635
(Directive (And (Member $x0 $v0) (Theme $x0 $x1)))

;; p201430  star  support 6 (occ 6)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000149 tierB-000424 tierB-001303
(From $x0 $v0)

;; p201431  star  support 6 (occ 6)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000297 tierB-000561 tierB-000611
(Like $e0 $v0)

;; p201432  star  support 6 (occ 9)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000388 tierB-000957 tierB-001014
(Might (Member $x0 $v0))

;; p201433  star  support 6 (occ 6)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000387 tierB-000559 tierB-000791
(Time $e0 (Weekday $v0))

;; p201434  cross  support 5 (occ 7)  size 4  lifted 0  nisurp -0.189  tiers tierB
;;   e.g. tierB-000277 tierB-000942 tierB-001735
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Patient $e1 $x1))

;; p201435  cross  support 5 (occ 5)  size 4  lifted 0  nisurp 0.671  tiers tierB  signal conj-pattern
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(And (Member $e0 start) (Ongoing $e1) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201436  cross  support 5 (occ 5)  size 4  lifted 0  nisurp 0.808  tiers tierB
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Ongoing $e0) (Patient $e0 $x0) (Patient $e1 $x0) (Theme $e1 $e0))

;; p201437  cross  support 5 (occ 6)  size 4  lifted 1  nisurp 0.271  tiers tierB
;;   e.g. tierB-000147 tierB-000367 tierB-000400
(And (Agent $e0 $v0) (Agent $e1 $v0) (Past $e0) (Theme $e1 $x0))

;; p201438  cross  support 5 (occ 15)  size 4  lifted 1  nisurp -0.537  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000942 tierB-001219
(And (Agent $e0 $x0) (Agent $e1 $x0) (Agent $e2 $x0) (Member $e0 $v0))

;; p201439  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.220  tiers tierB
;;   e.g. tierB-000485 tierB-000738 tierB-000782
(And (Agent $e0 $x0) (Agent $e1 $x0) (GroupOf $x0 $v0) (Ongoing $e0))

;; p201440  cross  support 5 (occ 5)  size 4  lifted 1  nisurp -0.365  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000688 tierB-000712
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0) (Past $e1))

;; p201441  cross  support 5 (occ 5)  size 4  lifted 1  nisurp -0.365  tiers tierB
;;   e.g. tierB-000339 tierB-000688 tierB-000712
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e1 $v0) (Past $e1))

;; p201442  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.420  tiers tierB
;;   e.g. tierB-000991 tierB-001245 tierB-001357
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Location $e0 $x1) (Past $e0))

;; p201443  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000305 tierB-000337 tierB-000340
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 boy) (Past $e0))

;; p201444  cross  support 5 (occ 6)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000338 tierB-000747 tierB-001813
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 person) (Past $e0))

;; p201445  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000338 tierB-000747 tierB-001887
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 person) (Patient $e0 $x1))

;; p201446  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.343  tiers tierB  dominated
;;   e.g. tierB-000858 tierB-000942 tierB-001130
(And (Agent $e0 $x0) (Member $e0 $v0) (Patient $e1 $x1) (Theme $e0 $e1))

;; p201447  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.131  tiers tierB  signal conj-pattern
;;   e.g. tierB-000073 tierB-000998 tierB-001182
(And (Agent $e0 $x0) (Member $e0 make) (Member $x0 $v0) (Patient $e0 $x1))

;; p201448  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.343  tiers tierB
;;   e.g. tierB-000858 tierB-000942 tierB-001130
(And (Agent $e0 $x0) (Member $e1 $v0) (Patient $e1 $x1) (Theme $e0 $e1))

;; p201449  cross  support 5 (occ 5)  size 4  lifted 1  nisurp -0.118  tiers tierB
;;   e.g. tierB-000520 tierB-000713 tierB-000784
(And (Agent $e0 $x0) (Member $x0 $v0) (Ongoing $e0) (Theme $e0 $x1))

;; p201450  cross  support 5 (occ 6)  size 4  lifted 1  nisurp 0.006  tiers tierB
;;   e.g. tierB-000942 tierB-001052 tierB-001169
(And (Agent $e0 $x0) (Member $x0 $v0) (Ongoing $e0) (Theme $e1 $e0))

;; p201451  cross  support 5 (occ 6)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000769 tierB-000775 tierB-000793
(And (Agent $e0 $x0) (Member $x0 $v0) (Past $e0) (Recipient $e0 $x1))

;; p201452  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000338 tierB-000693 tierB-000781
(And (Agent $e0 $x0) (Member $x0 $v0) (Past $e0) (Source $e0 $x1))

;; p201453  cross  support 5 (occ 7)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Agent $e0 $x0) (Member $x1 $v0) (Past $e0) (Through $e0 $x1))

;; p201454  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.303  tiers tierB  dominated
;;   e.g. tierB-000320 tierB-000779 tierB-000838
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p201455  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.303  tiers tierB
;;   e.g. tierB-000320 tierB-000779 tierB-000838
(And (Cardinality $x0 <num>) (Member $e0 $v0) (Past $e0) (Patient $e0 $x0))

;; p201456  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.963  tiers tierB  signal conj-pattern
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Experiencer $e0 $v0) (Member $e1 make) (Patient $e1 $v0) (Result $e1 $e0))

;; p201457  cross  support 5 (occ 8)  size 4  lifted 1  nisurp 0.255  tiers tierB
;;   e.g. tierB-000963 tierB-001041 tierB-001078
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x0 $v0) (Ongoing $e0))

;; p201458  cross  support 5 (occ 7)  size 4  lifted 1  nisurp 0.255  tiers tierB
;;   e.g. tierB-001041 tierB-001078 tierB-001685
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Member $x1 $v0) (Ongoing $e0))

;; p201459  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(And (Goal $e0 $x0) (Member $e0 go) (Member $x0 $v0) (Past $e0))

;; p201460  cross  support 5 (occ 5)  size 4  lifted 1  nisurp -0.382  tiers tierB
;;   e.g. tierB-000047 tierB-000579 tierB-000704
(And (Location $e0 $x0) (Member $x0 $v0) (Past $e0) (Theme $e0 $x1))

;; p201461  cross  support 5 (occ 5)  size 4  lifted 1  nisurp -0.118  tiers tierB
;;   e.g. tierB-000047 tierB-000704 tierB-000962
(And (Location $e0 $x0) (Member $x1 $v0) (Past $e0) (Theme $e0 $x1))

;; p201462  cross  support 5 (occ 7)  size 4  lifted 1  nisurp 0.131  tiers tierB  signal conj-pattern
;;   e.g. tierB-000005 tierB-000094 tierB-001062
(And (Manner $e0 quickly) (Member $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p201463  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000265 tierB-000654 tierB-001446
(And (Member $e0 $v0) (Member $e1 start) (Patient $e0 $x0) (Patient $e1 $x0))

;; p201464  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(And (Member $e0 $v0) (Member $e1 start) (Patient $e0 $x0) (Theme $e1 $e0))

;; p201465  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000117 tierB-000400 tierB-000470
(And (Member $e0 $v0) (Member $e1 try) (Past $e1) (Theme $e1 $e0))

;; p201466  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.123  tiers tierB  signal conj-pattern
;;   e.g. tierB-000080 tierB-000252 tierB-000865
(And (Member $e0 $v0) (Member $x0 thing) (Past $e0) (Theme $e0 $x0))

;; p201467  cross  support 5 (occ 6)  size 4  lifted 1  nisurp 0.042  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Member $e0 $v0) (Ongoing $e0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p201468  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.398  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Member $e0 $v0) (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))

;; p201469  cross  support 5 (occ 6)  size 4  lifted 1  nisurp 0.042  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Member $e0 $v0) (Ongoing $e1) (Patient $e0 $x0) (Patient $e1 $x0))

;; p201470  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.398  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Member $e0 $v0) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))

;; p201471  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Member $e0 $v0) (Patient $e0 $x0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201472  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Member $e0 $v0) (Patient $e0 $x0) (Patient $e1 $x0) (Theme $e1 $e0))

;; p201473  cross  support 5 (occ 9)  size 4  lifted 1  nisurp -0.284  tiers tierB  signal conj-pattern
;;   e.g. tierB-000665 tierB-000730 tierB-000855
(And (Member $e0 have) (Member $x0 $v0) (Past $e0) (Theme $e0 $x0))

;; p201474  cross  support 5 (occ 6)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000192 tierB-000265 tierB-000654
(And (Member $e0 start) (Member $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p201475  cross  support 5 (occ 6)  size 4  lifted 1  nisurp 0.131  tiers tierB
;;   e.g. tierB-000265 tierB-000930 tierB-000942
(And (Member $x0 $v0) (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))

;; p201476  cross  support 5 (occ 8)  size 4  lifted 1  nisurp -0.638  tiers tierB
;;   e.g. tierB-000063 tierB-000265 tierB-000654
(And (Member $x0 $v0) (Past $e0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p201477  cross  support 5 (occ 5)  size 4  lifted 1  nisurp 0.056  tiers tierB
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(And (Member $x0 $v0) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201478  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.946  tiers tierB
;;   e.g. tierB-000166 tierB-000198 tierB-000271
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Member $e1 $v1))

;; p201479  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000173 tierB-000371 tierB-000539
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Member $e1 make))

;; p201480  cross  support 5 (occ 6)  size 4  lifted 2  nisurp -0.013  tiers tierB  dominated
;;   e.g. tierB-000139 tierB-000371 tierB-000412
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p201481  cross  support 5 (occ 6)  size 4  lifted 2  nisurp -0.013  tiers tierB
;;   e.g. tierB-000139 tierB-000371 tierB-000412
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Patient $e1 $x0))

;; p201482  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.644  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001185 tierB-001538
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $v0 $v1) (Past $e0))

;; p201483  cross  support 5 (occ 5)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(And (Agent $e0 $v0) (Goal $e0 $x0) (Member $e0 go) (Member $x0 $v1))

;; p201484  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.367  tiers tierB
;;   e.g. tierB-000215 tierB-001023 tierB-001079
(And (Agent $e0 $v0) (GroupOf $x0 $v1) (Past $e0) (Theme $e0 $x0))

;; p201485  cross  support 5 (occ 7)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000008 tierB-000096 tierB-000148
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $x0 $v1) (Ongoing $e0))

;; p201486  cross  support 5 (occ 5)  size 4  lifted 2  nisurp 0.088  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000610 tierB-001079
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e0) (Patient $e1 $v0))

;; p201487  cross  support 5 (occ 6)  size 4  lifted 2  nisurp -0.037  tiers tierB
;;   e.g. tierB-001079 tierB-001185 tierB-001538
(And (Agent $e0 $v0) (Member $e1 $v1) (Member $v0 $v1) (Past $e0))

;; p201488  cross  support 5 (occ 5)  size 4  lifted 2  nisurp 0.088  tiers tierB
;;   e.g. tierB-000252 tierB-000610 tierB-001079
(And (Agent $e0 $v0) (Member $e1 $v1) (Past $e0) (Patient $e1 $v0))

;; p201489  cross  support 5 (occ 7)  size 4  lifted 2  nisurp 0.155  tiers tierB  dominated
;;   e.g. tierB-000782 tierB-001008 tierB-001629
(And (Agent $e0 $x0) (Agent $e1 $x0) (Manner $e0 $v0) (Member $e0 $v1))

;; p201490  cross  support 5 (occ 7)  size 4  lifted 2  nisurp 0.155  tiers tierB
;;   e.g. tierB-000782 tierB-001008 tierB-001629
(And (Agent $e0 $x0) (Agent $e1 $x0) (Manner $e0 $v0) (Member $e1 $v1))

;; p201491  cross  support 5 (occ 6)  size 4  lifted 2  nisurp -0.463  tiers tierB
;;   e.g. tierB-000359 tierB-000556 tierB-000738
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Member $e0 $v1))

;; p201492  cross  support 5 (occ 6)  size 4  lifted 2  nisurp -0.542  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000688
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p201493  cross  support 5 (occ 6)  size 4  lifted 2  nisurp -0.542  tiers tierB
;;   e.g. tierB-000160 tierB-000339 tierB-000688
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e1 $v0) (Member $x0 $v1))

;; p201494  cross  support 5 (occ 7)  size 4  lifted 2  nisurp -0.036  tiers tierB
;;   e.g. tierB-000018 tierB-000101 tierB-000658
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (GroupOf $x1 $v1) (Theme $e0 $x1))

;; p201495  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.610  tiers tierB
;;   e.g. tierB-000036 tierB-000121 tierB-000316
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 $v0) (Member $x1 $v1))

;; p201496  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.255  tiers tierB
;;   e.g. tierB-000426 tierB-000520 tierB-001008
(And (Agent $e0 $x0) (Manner $e0 $v0) (Member $x0 $v1) (Ongoing $e0))

;; p201497  cross  support 5 (occ 17)  size 4  lifted 2  nisurp -0.536  tiers tierB
;;   e.g. tierB-000101 tierB-000575 tierB-001275
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 $v0) (Member $x0 $v1))

;; p201498  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.171  tiers tierB
;;   e.g. tierB-000256 tierB-000747 tierB-001754
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 $v1) (Result $e0 $e1))

;; p201499  cross  support 5 (occ 10)  size 4  lifted 2  nisurp -0.040  tiers tierB  dominated
;;   e.g. tierB-000423 tierB-000975 tierB-001130
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Possession $x1 $x0))

;; p201500  cross  support 5 (occ 5)  size 4  lifted 2  nisurp 0.255  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000693 tierB-000781
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Source $e0 $x1))

;; p201501  cross  support 5 (occ 7)  size 4  lifted 2  nisurp 0.057  tiers tierB  dominated
;;   e.g. tierB-000423 tierB-000975 tierB-001130
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Possession $x1 $x0))

;; p201502  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.057  tiers tierB
;;   e.g. tierB-000338 tierB-000485 tierB-000693
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Source $e0 $x1))

;; p201503  cross  support 5 (occ 7)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Through $e0 $x1))

;; p201504  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.628  tiers tierB
;;   e.g. tierB-000231 tierB-001004 tierB-001169
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Ongoing $e0))

;; p201505  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.372  tiers tierB
;;   e.g. tierB-000783 tierB-000974 tierB-000975
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Theme $e0 $x1))

;; p201506  cross  support 5 (occ 8)  size 4  lifted 2  nisurp 0.057  tiers tierB
;;   e.g. tierB-000423 tierB-000975 tierB-001130
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Possession $x1 $x0))

;; p201507  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.232  tiers tierB  dominated
;;   e.g. tierB-000320 tierB-000779 tierB-000838
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p201508  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.255  tiers tierB
;;   e.g. tierB-000189 tierB-000589 tierB-000676
(And (Experiencer $e0 $v0) (Location $e0 $x0) (Member $x0 $v1) (Past $e0))

;; p201509  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $e1 make) (Patient $e1 $v0))

;; p201510  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $e1 make) (Result $e1 $e0))

;; p201511  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.929  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Experiencer $e0 $v0) (Member $e1 make) (Member $v0 $v1) (Patient $e1 $v0))

;; p201512  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.929  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Experiencer $e0 $v0) (Member $e1 make) (Member $v0 $v1) (Result $e1 $e0))

;; p201513  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.707  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-000832
(And (Experiencer $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0) (Member $e1 $v1))

;; p201514  cross  support 5 (occ 15)  size 4  lifted 2  nisurp -0.442  tiers tierB
;;   e.g. tierB-000596 tierB-000786 tierB-000832
(And (Experiencer $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p201515  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000230 tierB-000744 tierB-000826
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Source $e0 $x1))

;; p201516  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.255  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000455
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $e1))

;; p201517  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000565 tierB-000631 tierB-000808
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Past (Member $x0 $v0)) (Time $e0 $v1))

;; p201518  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.255  tiers tierB
;;   e.g. tierB-000160 tierB-000339 tierB-000455
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Member $x0 $v1) (Theme $e0 $e1))

;; p201519  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.241  tiers tierB  dominated
;;   e.g. tierB-000565 tierB-000631 tierB-000808
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Past $e0) (Time $e0 $v1))

;; p201520  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000565 tierB-000631 tierB-000808
(And (Experiencer $e0 $x0) (Past $e0) (Past (Member $x0 $v0)) (Time $e0 $v1))

;; p201521  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.131  tiers tierB
;;   e.g. tierB-000462 tierB-001023 tierB-001037
(And (Goal $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x1))

;; p201522  cross  support 5 (occ 7)  size 4  lifted 2  nisurp -0.672  tiers tierB
;;   e.g. tierB-000680 tierB-000799 tierB-000965
(And (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Past $e0) (Patient $e0 $x0))

;; p201523  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.036  tiers tierB
;;   e.g. tierB-000381 tierB-000963 tierB-001299
(And (GroupOf $x0 $v0) (Location $e0 $x0) (Member $e0 $v1) (Ongoing $e0))

;; p201524  cross  support 5 (occ 5)  size 4  lifted 2  nisurp 0.399  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000217 tierB-000838
(And (GroupOf $x0 $v0) (Location $e0 $x1) (Member $e0 $v1) (Patient $e0 $x0))

;; p201525  cross  support 5 (occ 5)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000034 tierB-000217 tierB-000838
(And (GroupOf $x0 $v0) (Location $e0 $x1) (Member $x1 $v1) (Patient $e0 $x0))

;; p201526  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.263  tiers tierB
;;   e.g. tierB-000699 tierB-000942 tierB-001182
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Ongoing $e0) (Patient $e0 $x0))

;; p201527  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.158  tiers tierB
;;   e.g. tierB-000338 tierB-000438 tierB-000725
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Past $e0) (Source $e0 $x0))

;; p201528  cross  support 5 (occ 5)  size 4  lifted 2  nisurp -0.460  tiers tierB
;;   e.g. tierB-000047 tierB-000704 tierB-000962
(And (Location $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p201529  cross  support 5 (occ 5)  size 4  lifted 2  nisurp 0.006  tiers tierB
;;   e.g. tierB-000128 tierB-000163 tierB-000328
(And (Manner $e0 $v0) (Member $x0 $v1) (Past $e0) (Theme $e0 $x0))

;; p201530  cross  support 5 (occ 5)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000176 tierB-000316 tierB-000659
(And (Member $e0 $v0) (Member $e1 $v1) (Past $e0) (Stimulus $e0 $e1))

;; p201531  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Member $e0 $v0) (Member $e1 make) (Patient $e1 $v1) (Result $e1 $e0))

;; p201532  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x0 new) (Theme $e0 $x0))

;; p201533  cross  support 5 (occ 5)  size 4  lifted 2  nisurp 0.131  tiers tierB  dominated
;;   e.g. tierB-000423 tierB-000722 tierB-000975
(And (Member $e0 $v0) (Member $x0 $v1) (Possession $x0 $x1) (Theme $e0 $x0))

;; p201534  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.708  tiers tierB
;;   e.g. tierB-000565 tierB-000631 tierB-000808
(And (Member $e0 $v0) (Past $e0) (Past (Member $x0 $v0)) (Time $e0 $v1))

;; p201535  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Member $e0 $v1) (Member $e1 make) (Member $v0 $v1) (Patient $e1 $v0))

;; p201536  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.901  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Member $e0 $v1) (Member $e1 make) (Member $v0 $v1) (Result $e1 $e0))

;; p201537  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.929  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Member $e0 make) (Member $v0 $v1) (Patient $e0 $v0) (Result $e0 $e1))

;; p201538  cross  support 5 (occ 6)  size 4  lifted 2  nisurp 0.131  tiers tierB
;;   e.g. tierB-000423 tierB-000722 tierB-000975
(And (Member $x0 $v0) (Member $x1 $v1) (Possession $x0 $x1) (Theme $e0 $x0))

;; p201539  cross  support 5 (occ 7)  size 4  lifted 3  nisurp -0.946  tiers tierB
;;   e.g. tierB-000012 tierB-000030 tierB-000209
(And (Agent $e0 $v0) (Agent $e1 $v1) (Member $e0 $v2) (Member $e1 $v2))

;; p201540  cross  support 5 (occ 6)  size 4  lifted 3  nisurp 0.485  tiers tierB
;;   e.g. tierB-000043 tierB-000292 tierB-000309
(And (Agent $e0 $v0) (Inheritance $v1 $v2) (Past $e0) (Theme $e0 $v1))

;; p201541  cross  support 5 (occ 5)  size 4  lifted 3  nisurp -0.739  tiers tierB
;;   e.g. tierB-000008 tierB-000048 tierB-000524
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $x0 $v1) (Member $x0 $v2))

;; p201542  cross  support 5 (occ 5)  size 4  lifted 3  nisurp -0.392  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000610 tierB-001079
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Patient $e1 $v0))

;; p201543  cross  support 5 (occ 6)  size 4  lifted 3  nisurp 0.131  tiers tierB
;;   e.g. tierB-000100 tierB-000575 tierB-000688
(And (Agent $e0 $x0) (Goal $e0 $v0) (Member $e0 $v1) (Member $x0 $v2))

;; p201544  cross  support 5 (occ 6)  size 4  lifted 3  nisurp -0.688  tiers tierB
;;   e.g. tierB-000005 tierB-000063 tierB-000097
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Inheritance $v0 $v2))

;; p201545  cross  support 5 (occ 9)  size 4  lifted 3  nisurp -0.473  tiers tierB
;;   e.g. tierB-000101 tierB-000782 tierB-001008
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Member $x0 $v2))

;; p201546  cross  support 5 (occ 5)  size 4  lifted 3  nisurp 0.383  tiers tierB
;;   e.g. tierB-000098 tierB-000410 tierB-001089
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $v2))

;; p201547  cross  support 5 (occ 7)  size 4  lifted 3  nisurp 0.005  tiers tierB
;;   e.g. tierB-000485 tierB-000622 tierB-001035
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Theme $e0 $v2))

;; p201548  cross  support 5 (occ 8)  size 4  lifted 3  nisurp -0.122  tiers tierB
;;   e.g. tierB-000268 tierB-000715 tierB-001098
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $e0 $v2) (Theme $e0 $v0))

;; p201549  cross  support 5 (occ 6)  size 4  lifted 3  nisurp 0.255  tiers tierB  dominated
;;   e.g. tierB-000189 tierB-000589 tierB-000676
(And (Experiencer $e0 $v0) (Location $e0 $x0) (Member $e0 $v1) (Member $x0 $v2))

;; p201550  cross  support 5 (occ 5)  size 4  lifted 3  nisurp -0.615  tiers tierB
;;   e.g. tierB-000808 tierB-000880 tierB-000904
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Time $e0 $v2))

;; p201551  cross  support 5 (occ 8)  size 4  lifted 3  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000565 tierB-000631 tierB-000808
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Past (Member $x0 $v1)) (Time $e0 $v2))

;; p201552  cross  support 5 (occ 6)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000040 tierB-000344 tierB-001563
(And (Goal $e0 $x0) (Manner $e0 $v0) (Member $e0 $v1) (Member $x0 $v2))

;; p201553  cross  support 5 (occ 5)  size 4  lifted 3  nisurp -0.242  tiers tierB
;;   e.g. tierB-000358 tierB-000510 tierB-000819
(And (Holder $e0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Theme $e0 $x0))

;; p201554  cross  support 5 (occ 6)  size 4  lifted 3  nisurp -0.356  tiers tierB
;;   e.g. tierB-000932 tierB-000975 tierB-001230
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Member $x1 $v2) (Possession $x1 $x0))

;; p201555  cross  support 5 (occ 5)  size 4  lifted 3  nisurp 0.131  tiers tierB
;;   e.g. tierB-000063 tierB-000378 tierB-000653
(And (Location $e0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p201556  cross  support 5 (occ 7)  size 4  lifted 3  nisurp 0.276  tiers tierB
;;   e.g. tierB-000271 tierB-000516 tierB-001046
(And (Member $e0 $v0) (Member $e1 $v0) (Theme $e0 $v1) (Theme $e1 $v2))

;; p201557  cross  support 5 (occ 6)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000282 tierB-000404 tierB-001035
(And (Member $e0 $v0) (Member $e1 $v1) (Theme $e0 $v2) (To $e0 $e1))

;; p201558  cross  support 5 (occ 7)  size 4  lifted 3  nisurp -0.473  tiers tierB
;;   e.g. tierB-000538 tierB-000979 tierB-001287
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Source $e0 $x0))

;; p201559  cross  support 5 (occ 8)  size 4  lifted 3  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000565 tierB-000631 tierB-000808
(And (Member $e0 $v0) (Member $x0 $v1) (Past (Member $x0 $v0)) (Time $e0 $v2))

;; p201560  cross  support 5 (occ 5)  size 3  lifted 0  nisurp -0.365  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000688 tierB-000712
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Past $e1))

;; p201561  cross  support 5 (occ 5)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000305 tierB-000337 tierB-000340
(And (Agent $e0 $x0) (Member $x0 boy) (Past $e0))

;; p201562  cross  support 5 (occ 6)  size 3  lifted 0  nisurp 0.475  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000747 tierB-001813
(And (Agent $e0 $x0) (Member $x0 person) (Past $e0))

;; p201563  cross  support 5 (occ 5)  size 3  lifted 0  nisurp 0.753  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000747 tierB-001887
(And (Agent $e0 $x0) (Member $x0 person) (Patient $e0 $x1))

;; p201564  cross  support 5 (occ 5)  size 3  lifted 0  nisurp 0.343  tiers tierB  dominated
;;   e.g. tierB-000858 tierB-000942 tierB-001130
(And (Agent $e0 $x0) (Patient $e1 $x1) (Theme $e0 $e1))

;; p201565  cross  support 5 (occ 5)  size 3  lifted 0  nisurp 0.303  tiers tierB  dominated
;;   e.g. tierB-000320 tierB-000779 tierB-000838
(And (Cardinality $x0 <num>) (Past $e0) (Patient $e0 $x0))

;; p201566  cross  support 5 (occ 5)  size 3  lifted 0  nisurp 0.753  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000654 tierB-001446
(And (Member $e0 start) (Patient $e0 $x0) (Patient $e1 $x0))

;; p201567  cross  support 5 (occ 5)  size 3  lifted 0  nisurp 0.671  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(And (Member $e0 start) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201568  cross  support 5 (occ 5)  size 3  lifted 0  nisurp 0.123  tiers tierB  dominated
;;   e.g. tierB-000080 tierB-000252 tierB-000865
(And (Member $x0 thing) (Past $e0) (Theme $e0 $x0))

;; p201569  cross  support 5 (occ 6)  size 3  lifted 0  nisurp 0.042  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Ongoing $e0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p201570  cross  support 5 (occ 5)  size 3  lifted 0  nisurp 0.398  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))

;; p201571  cross  support 5 (occ 5)  size 3  lifted 0  nisurp 0.617  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Patient $e0 $x0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201572  cross  support 5 (occ 6)  size 3  lifted 1  nisurp 0.804  tiers tierB  dominated
;;   e.g. tierB-000173 tierB-000371 tierB-000539
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 make))

;; p201573  cross  support 5 (occ 6)  size 3  lifted 1  nisurp -0.013  tiers tierB  dominated
;;   e.g. tierB-000139 tierB-000371 tierB-000412
(And (Agent $e0 $v0) (Agent $e1 $v0) (Patient $e0 $x0))

;; p201574  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.088  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000610 tierB-001079
(And (Agent $e0 $v0) (Past $e0) (Patient $e1 $v0))

;; p201575  cross  support 5 (occ 7)  size 3  lifted 1  nisurp 0.155  tiers tierB  dominated
;;   e.g. tierB-000782 tierB-001008 tierB-001629
(And (Agent $e0 $x0) (Agent $e1 $x0) (Manner $e0 $v0))

;; p201576  cross  support 5 (occ 6)  size 3  lifted 1  nisurp -0.463  tiers tierB  dominated
;;   e.g. tierB-000359 tierB-000556 tierB-000738
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 $v0))

;; p201577  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000305 tierB-000337 tierB-000340
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 boy))

;; p201578  cross  support 5 (occ 7)  size 3  lifted 1  nisurp -0.040  tiers tierB  dominated
;;   e.g. tierB-000423 tierB-000975 tierB-001130
(And (Agent $e0 $x0) (Member $e0 $v0) (Possession $x1 $x0))

;; p201579  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000100 tierB-000298 tierB-000713
(And (Agent $e0 $x0) (Member $e0 leave) (Member $x0 $v0))

;; p201580  cross  support 5 (occ 5)  size 3  lifted 1  nisurp -0.171  tiers tierB  dominated
;;   e.g. tierB-000256 tierB-000747 tierB-001754
(And (Agent $e0 $x0) (Member $e1 $v0) (Result $e0 $e1))

;; p201581  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.255  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000693 tierB-000781
(And (Agent $e0 $x0) (Member $x0 $v0) (Source $e0 $x1))

;; p201582  cross  support 5 (occ 6)  size 3  lifted 1  nisurp 0.057  tiers tierB  dominated
;;   e.g. tierB-000423 tierB-000975 tierB-001130
(And (Agent $e0 $x0) (Member $x1 $v0) (Possession $x1 $x0))

;; p201583  cross  support 5 (occ 6)  size 3  lifted 1  nisurp 0.057  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000485 tierB-000693
(And (Agent $e0 $x0) (Member $x1 $v0) (Source $e0 $x1))

;; p201584  cross  support 5 (occ 7)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Agent $e0 $x0) (Member $x1 $v0) (Through $e0 $x1))

;; p201585  cross  support 5 (occ 5)  size 3  lifted 1  nisurp -0.232  tiers tierB  dominated
;;   e.g. tierB-000320 tierB-000779 tierB-000838
(And (Cardinality $x0 <num>) (Member $e0 $v0) (Patient $e0 $x0))

;; p201586  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.955  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Experiencer $e0 $v0) (Member $e1 make) (Patient $e1 $v0))

;; p201587  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.948  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Experiencer $e0 $v0) (Member $e1 make) (Result $e1 $e0))

;; p201588  cross  support 5 (occ 10)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-000832
(And (Experiencer $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0))

;; p201589  cross  support 5 (occ 6)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000744 tierB-000826
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Source $e0 $x1))

;; p201590  cross  support 5 (occ 6)  size 3  lifted 1  nisurp 0.255  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000455
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Theme $e0 $e1))

;; p201591  cross  support 5 (occ 5)  size 3  lifted 1  nisurp -0.131  tiers tierB  dominated
;;   e.g. tierB-000462 tierB-001023 tierB-001037
(And (Goal $e0 $x0) (Member $x0 $v0) (Theme $e0 $x1))

;; p201592  cross  support 5 (occ 5)  size 3  lifted 1  nisurp -0.036  tiers tierB  dominated
;;   e.g. tierB-000381 tierB-000963 tierB-001299
(And (GroupOf $x0 $v0) (Location $e0 $x0) (Ongoing $e0))

;; p201593  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.399  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000217 tierB-000838
(And (GroupOf $x0 $v0) (Location $e0 $x1) (Patient $e0 $x0))

;; p201594  cross  support 5 (occ 6)  size 3  lifted 1  nisurp 0.178  tiers tierB  signal conj-pattern
;;   e.g. tierB-000196 tierB-000393 tierB-000412
(And (GroupOf $x0 person) (Member $e0 $v0) (Patient $e0 $x0))

;; p201595  cross  support 5 (occ 7)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000162 tierB-000483 tierB-001069
(And (GroupOf $x0 thing) (Member $e0 $v0) (Theme $e0 $x0))

;; p201596  cross  support 5 (occ 6)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000206 tierB-000370 tierB-000748
(And (Member $e0 $v0) (Member $e1 get) (Result $e1 $e0))

;; p201597  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000107 tierB-000114 tierB-000339
(And (Member $e0 $v0) (Member $e1 need) (Theme $e1 $e0))

;; p201598  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(And (Member $e0 $v0) (Member $x0 new) (Theme $e0 $x0))

;; p201599  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000805 tierB-000951 tierB-001384
(And (Member $e0 $v0) (Member $x0 sound) (Patient $e0 $x0))

;; p201600  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.049  tiers tierB
;;   e.g. tierB-000229 tierB-001066 tierB-001243
(And (Member $e0 $v0) (PartOf $x0 $x1) (Theme $e0 $x0))

;; p201601  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000176 tierB-000316 tierB-000659
(And (Member $e0 $v0) (Past $e1) (Stimulus $e1 $e0))

;; p201602  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000139 tierB-000517 tierB-001491
(And (Member $e0 change) (Member $x0 $v0) (Patient $e0 $x0))

;; p201603  cross  support 5 (occ 10)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000370 tierB-000748 tierB-000890
(And (Member $e0 get) (Member $x0 $v0) (Patient $e0 $x0))

;; p201604  cross  support 5 (occ 6)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000056 tierB-000302 tierB-001487
(And (Member $e0 open) (Member $x0 $v0) (Patient $e0 $x0))

;; p201605  cross  support 5 (occ 8)  size 3  lifted 1  nisurp 0.255  tiers tierB  signal conj-pattern
;;   e.g. tierB-000476 tierB-000654 tierB-000777
(And (Member $e0 turn) (Member $x0 $v0) (Patient $e0 $x0))

;; p201606  cross  support 5 (occ 5)  size 3  lifted 1  nisurp 0.255  tiers tierB  signal conj-pattern
;;   e.g. tierB-000089 tierB-000866 tierB-000938
(And (Member $e0 use) (Member $x0 $v0) (Theme $e0 $x0))

;; p201607  cross  support 5 (occ 5)  size 3  lifted 2  nisurp -0.392  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000610 tierB-001079
(And (Agent $e0 $v0) (Member $e0 $v1) (Patient $e1 $v0))

;; p201608  cross  support 5 (occ 5)  size 3  lifted 2  nisurp -0.392  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000610 tierB-001079
(And (Agent $e0 $v0) (Member $e1 $v1) (Patient $e1 $v0))

;; p201609  cross  support 5 (occ 6)  size 3  lifted 2  nisurp 0.131  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000575 tierB-000688
(And (Agent $e0 $x0) (Goal $e0 $v0) (Member $x0 $v1))

;; p201610  cross  support 5 (occ 5)  size 3  lifted 2  nisurp 0.383  tiers tierB  dominated
;;   e.g. tierB-000098 tierB-000410 tierB-001089
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Patient $e0 $v1))

;; p201611  cross  support 5 (occ 7)  size 3  lifted 2  nisurp 0.005  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000622 tierB-001035
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Theme $e0 $v1))

;; p201612  cross  support 5 (occ 8)  size 3  lifted 2  nisurp -0.122  tiers tierB  dominated
;;   e.g. tierB-000268 tierB-000715 tierB-001098
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Theme $e0 $v0))

;; p201613  cross  support 5 (occ 5)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000502 tierB-000867 tierB-001782
(And (During $e0 $e1) (Member $e0 $v0) (Member $e1 $v1))

;; p201614  cross  support 5 (occ 15)  size 3  lifted 2  nisurp 0.461  tiers tierB
;;   e.g. tierB-000114 tierB-000188 tierB-000496
(And (Experiencer $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1))

;; p201615  cross  support 5 (occ 6)  size 3  lifted 2  nisurp 0.255  tiers tierB  dominated
;;   e.g. tierB-000189 tierB-000589 tierB-000676
(And (Experiencer $e0 $v0) (Location $e0 $x0) (Member $x0 $v1))

;; p201616  cross  support 5 (occ 6)  size 3  lifted 2  nisurp 0.858  tiers tierB  dominated
;;   e.g. tierB-000565 tierB-000631 tierB-000808
(And (Experiencer $e0 $x0) (Past (Member $x0 $v0)) (Time $e0 $v1))

;; p201617  cross  support 5 (occ 8)  size 3  lifted 2  nisurp 0.255  tiers tierB
;;   e.g. tierB-000599 tierB-000892 tierB-001212
(And (For $x0 $x1) (Member $x0 $v0) (Member $x1 $v1))

;; p201618  cross  support 5 (occ 9)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000172 tierB-001271 tierB-001421
(And (From $x0 $x1) (Member $x0 $v0) (Member $x1 $v1))

;; p201619  cross  support 5 (occ 6)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000040 tierB-000344 tierB-001563
(And (Goal $e0 $x0) (Manner $e0 $v0) (Member $x0 $v1))

;; p201620  cross  support 5 (occ 5)  size 3  lifted 2  nisurp 0.296  tiers tierB
;;   e.g. tierB-000398 tierB-001426 tierB-001800
(And (GroupOf $x0 $v0) (Manner $e0 $v1) (Theme $e0 $x0))

;; p201621  cross  support 5 (occ 5)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000126 tierB-001108 tierB-001286
(And (GroupOf $x0 $v0) (Member $x1 $v1) (Past (LocatedIn $x0 $x1)))

;; p201622  cross  support 5 (occ 7)  size 3  lifted 2  nisurp 0.131  tiers tierB
;;   e.g. tierB-000774 tierB-001033 tierB-001482
(And (In $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p201623  cross  support 5 (occ 5)  size 3  lifted 2  nisurp -0.429  tiers tierB  dominated
;;   e.g. tierB-000932 tierB-000975 tierB-001230
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Possession $x1 $x0))

;; p201624  cross  support 5 (occ 5)  size 3  lifted 2  nisurp 0.131  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000378 tierB-000653
(And (Location $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p201625  cross  support 5 (occ 14)  size 3  lifted 2  nisurp -0.802  tiers tierB  dominated
;;   e.g. tierB-000271 tierB-000516 tierB-001046
(And (Member $e0 $v0) (Member $e1 $v0) (Theme $e0 $v1))

;; p201626  cross  support 5 (occ 5)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000176 tierB-000316 tierB-000659
(And (Member $e0 $v0) (Member $e1 $v1) (Stimulus $e0 $e1))

;; p201627  cross  support 5 (occ 6)  size 3  lifted 2  nisurp -0.118  tiers tierB
;;   e.g. tierB-000370 tierB-000792 tierB-001260
(And (Member $e0 $v0) (Member $x0 $v1) (Only $x0 $e0))

;; p201628  cross  support 5 (occ 8)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(And (Member $e0 $v0) (Member $x0 $v1) (Over $e0 $x0))

;; p201629  cross  support 5 (occ 6)  size 3  lifted 2  nisurp 0.534  tiers tierB  dominated
;;   e.g. tierB-000565 tierB-000631 tierB-000808
(And (Member $e0 $v0) (Past (Member $x0 $v0)) (Time $e0 $v1))

;; p201630  cross  support 5 (occ 5)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000282 tierB-000404 tierB-001035
(And (Member $e0 $v0) (Theme $e1 $v1) (To $e1 $e0))

;; p201631  cross  support 5 (occ 6)  size 3  lifted 2  nisurp 0.915  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Member $e0 make) (Member $v0 $v1) (Patient $e0 $v0))

;; p201632  cross  support 5 (occ 5)  size 3  lifted 2  nisurp 0.006  tiers tierB
;;   e.g. tierB-000088 tierB-000663 tierB-000966
(And (Member $x0 $v0) (Member $x1 $v0) (More $v1 $x0 $x1))

;; p201633  cross  support 5 (occ 14)  size 3  lifted 3  nisurp -0.473  tiers tierB
;;   e.g. tierB-000371 tierB-001202 tierB-001246
(And (Agent $e0 $v0) (Inheritance $v0 $v1) (Member $e0 $v2))

;; p201634  cross  support 5 (occ 6)  size 3  lifted 3  nisurp -0.455  tiers tierB
;;   e.g. tierB-000836 tierB-001504 tierB-001627
(And (Experiencer $e0 $v0) (Member $e0 $v2) (Member $v0 $v1))

;; p201635  cross  support 5 (occ 5)  size 3  lifted 3  nisurp 0.053  tiers tierB
;;   e.g. tierB-000654 tierB-000688 tierB-001332
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Past (Member $x0 $v2)))

;; p201636  cross  support 5 (occ 6)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000227 tierB-000373 tierB-000585
(And (Location $e0 $v0) (Member $e0 $v2) (Member $v0 $v1))

;; p201637  cross  support 5 (occ 6)  size 3  lifted 3  nisurp -0.189  tiers tierB
;;   e.g. tierB-000366 tierB-000404 tierB-000601
(And (Member $e0 $v2) (Member $v0 $v1) (Theme $e0 $v0))

;; p201638  cross  support 5 (occ 5)  size 2  lifted 1  nisurp 0.392  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000610 tierB-001079
(And (Agent $e0 $v0) (Patient $e1 $v0))

;; p201639  cross  support 5 (occ 7)  size 2  lifted 1  nisurp 0.453  tiers tierB  dominated
;;   e.g. tierB-000114 tierB-000188 tierB-000496
(And (Experiencer $e0 $v0) (Experiencer $e1 $v0))

;; p201640  cross  support 5 (occ 14)  size 2  lifted 2  nisurp 8.915  tiers tierB  dominated
;;   e.g. tierB-000371 tierB-001202 tierB-001246
(And (Agent $e0 $v0) (Inheritance $v0 $v1))

;; p201641  cross  support 5 (occ 5)  size 2  lifted 2  nisurp 0.519  tiers tierB  dominated
;;   e.g. tierB-000227 tierB-000373 tierB-000585
(And (Location $e0 $v0) (Member $v0 $v1))

;; p201642  cross  support 5 (occ 6)  size 2  lifted 2  nisurp 0.189  tiers tierB  dominated
;;   e.g. tierB-000366 tierB-000404 tierB-000601
(And (Member $v0 $v1) (Theme $e0 $v0))

;; p201643  kindlevel  support 5 (occ 8)  size 3  lifted 4  nisurp 0.469  tiers tierB
;;   e.g. tierB-000843 tierB-001232 tierB-001472
(And (Degree $v0 $v1 $v2) (Inheritance $v0 $v1) (Inheritance $v0 $v3))

;; p201644  kindlevel  support 5 (occ 6)  size 3  lifted 4  nisurp -0.439  tiers tierB
;;   e.g. tierB-000543 tierB-001338 tierB-001468
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Inheritance $v3 $v0))

;; p201645  kindlevel  support 5 (occ 5)  size 3  lifted 4  nisurp -0.298  tiers tierB
;;   e.g. tierB-000179 tierB-000380 tierB-000454
(And (Inheritance $v0 $v1) (Inheritance $v2 $v1) (Inheritance $v2 $v3))

;; p201646  kindlevel  support 5 (occ 10)  size 2  lifted 3  nisurp 0.122  tiers tierB
;;   e.g. tierB-000276 tierB-000442 tierB-000992
(And (Inheritance $v0 $v1) (Past (Member $v2 $v0)))

;; p201647  kindlevel  support 5 (occ 5)  size 2  lifted 3  nisurp 0.703  tiers tierB
;;   e.g. tierB-000431 tierB-000432 tierB-001854
(And (Inheritance $v0 (can $v1)) (Member $v2 $v0))

;; p201648  kindlevel  support 5 (occ 5)  size 2  lifted 3  nisurp 0.941  tiers tierB
;;   e.g. tierB-000496 tierB-001155 tierB-001312
(And (Past (Member $v0 $v1)) (Past (Member $v0 $v2)))

;; p201649  kindlevel  support 5 (occ 8)  size 2  lifted 4  nisurp 0.626  tiers tierB
;;   e.g. tierB-000860 tierB-001414 tierB-001506
(And (ConditionalProperty $v0 $v1 $v2) (Inheritance $v2 $v3))

;; p201650  kindlevel  support 5 (occ 7)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000039 tierB-000322 tierB-000562
(Inheritance $v0 tree)

;; p201651  kindlevel  support 5 (occ 5)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000266 tierB-001328 tierB-001504
(Member $v0 country)

;; p201652  kindlevel  support 5 (occ 5)  size 1  lifted 3  nisurp —  tiers tierB
;;   e.g. tierB-000161 tierB-001057 tierB-001405
(ConditionalProperty $v0 (can $v1) $v2)

;; p201653  star  support 5 (occ 5)  size 4  lifted 0  nisurp -0.342  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(And (Holder $e0 $x0) (Member $e0 have) (Past $e0) (Theme $e0 $x1))

;; p201654  star  support 5 (occ 5)  size 4  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(And (Agent $e0 $v0) (Goal $e0 $x0) (Member $e0 go) (Past $e0))

;; p201655  star  support 5 (occ 6)  size 4  lifted 1  nisurp -0.216  tiers tierB
;;   e.g. tierB-000101 tierB-000942 tierB-001219
(And (Agent $e0 $x0) (Agent $e1 $x0) (Agent $e2 $x0) (Member $x0 $v0))

;; p201656  star  support 5 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000769 tierB-000775 tierB-000793
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e0) (Recipient $e0 $x1))

;; p201657  star  support 5 (occ 5)  size 4  lifted 1  nisurp 0.382  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000693 tierB-000781
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e0) (Source $e0 $x1))

;; p201658  star  support 5 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e0) (Through $e0 $x1))

;; p201659  star  support 5 (occ 5)  size 4  lifted 1  nisurp 0.070  tiers tierB
;;   e.g. tierB-000462 tierB-000834 tierB-001023
(And (Goal $e0 $x0) (Member $e0 $v0) (Past $e0) (Theme $e0 $x1))

;; p201660  star  support 5 (occ 5)  size 4  lifted 1  nisurp -0.342  tiers tierB  dominated
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(And (Holder $e0 $x0) (Member $e0 $v0) (Past $e0) (Theme $e0 $x1))

;; p201661  star  support 5 (occ 5)  size 4  lifted 2  nisurp 0.456  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000096 tierB-000148
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $e0 $v1) (Ongoing $e0))

;; p201662  star  support 5 (occ 5)  size 4  lifted 2  nisurp 0.241  tiers tierB
;;   e.g. tierB-000145 tierB-000162 tierB-000730
(And (Holder $e0 $v0) (Member $e0 $v1) (Past $e0) (Theme $e0 $x0))

;; p201663  star  support 5 (occ 5)  size 4  lifted 2  nisurp 0.008  tiers tierB
;;   e.g. tierB-000001 tierB-000426 tierB-000801
(And (Manner $e0 $v0) (Member $e0 $v1) (Ongoing $e0) (Past $e0))

;; p201664  star  support 5 (occ 5)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000194 tierB-000685 tierB-001048
(And (Manner $e0 $v0) (Member $e0 $v1) (Ongoing $e0) (Patient $e0 $x0))

;; p201665  star  support 5 (occ 5)  size 4  lifted 2  nisurp 0.070  tiers tierB
;;   e.g. tierB-000299 tierB-000571 tierB-001486
(And (Member $e0 $v0) (Past $e0) (Theme $e0 $x0) (Time $e0 $v1))

;; p201666  star  support 5 (occ 6)  size 4  lifted 3  nisurp -0.921  tiers tierB
;;   e.g. tierB-000654 tierB-000783 tierB-000808
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Past (Member $x0 $v2)))

;; p201667  star  support 5 (occ 5)  size 3  lifted 0  nisurp -0.122  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000942 tierB-001219
(And (Agent $e0 $x0) (Agent $e1 $x0) (Agent $e2 $x0))

;; p201668  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.650  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000238 tierB-000277 tierB-000387
(And (Agent $e0 $x0) (Member $e0 come) (Past $e0))

;; p201669  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.475  tiers tierB  dominated
;;   e.g. tierB-000769 tierB-000775 tierB-000793
(And (Agent $e0 $x0) (Past $e0) (Recipient $e0 $x1))

;; p201670  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.382  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000693 tierB-000781
(And (Agent $e0 $x0) (Past $e0) (Source $e0 $x1))

;; p201671  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Agent $e0 $x0) (Past $e0) (Through $e0 $x1))

;; p201672  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.650  tiers tierB  dominated
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(And (Goal $e0 $x0) (Member $e0 go) (Past $e0))

;; p201673  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.070  tiers tierB  dominated
;;   e.g. tierB-000462 tierB-000834 tierB-001023
(And (Goal $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p201674  star  support 5 (occ 5)  size 3  lifted 0  nisurp -0.342  tiers tierB  dominated
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(And (Holder $e0 $x0) (Member $e0 have) (Past $e0))

;; p201675  star  support 5 (occ 5)  size 3  lifted 0  nisurp -0.342  tiers tierB  dominated
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(And (Holder $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p201676  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000215 tierB-000636 tierB-000852
(And (Member $e0 capture) (Past $e0) (Theme $e0 $x0))

;; p201677  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.592  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000609 tierB-000779 tierB-001306
(And (Member $e0 fall) (Past $e0) (Patient $e0 $x0))

;; p201678  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.592  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000067 tierB-000412 tierB-001197
(And (Member $e0 kill) (Past $e0) (Patient $e0 $x0))

;; p201679  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.125  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000073 tierB-000964 tierB-001339
(And (Member $e0 make) (Past $e0) (Patient $e0 $x0))

;; p201680  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.475  tiers tierB  dominated
;;   e.g. tierB-000192 tierB-000265 tierB-000654
(And (Member $e0 start) (Past $e0) (Patient $e0 $x0))

;; p201681  star  support 5 (occ 5)  size 3  lifted 0  nisurp 0.533  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000400 tierB-000470
(And (Member $e0 try) (Past $e0) (Theme $e0 $e1))

;; p201682  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.870  tiers tierB  dominated
;;   e.g. tierB-000204 tierB-000219 tierB-000576
(And (Agent $e0 $v0) (Goal $e0 $x0) (Member $e0 go))

;; p201683  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.456  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-000096 tierB-000148
(And (Agent $e0 $v0) (Location $e0 $x0) (Ongoing $e0))

;; p201684  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.475  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000325 tierB-000539 tierB-001504
(And (Agent $e0 $v0) (Member $e0 make) (Past $e0))

;; p201685  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.650  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000117 tierB-000216 tierB-000400
(And (Agent $e0 $v0) (Member $e0 try) (Past $e0))

;; p201686  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000148 tierB-000805 tierB-000929
(And (Agent $e0 $v0) (Member $e0 walk) (Past $e0))

;; p201687  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.382  tiers tierB
;;   e.g. tierB-000156 tierB-000556 tierB-000745
(And (Agent $e0 $x0) (Can $e0) (Member $e0 $v0))

;; p201688  star  support 5 (occ 6)  size 3  lifted 1  nisurp -0.463  tiers tierB  dominated
;;   e.g. tierB-000359 tierB-000556 tierB-000738
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 $v0))

;; p201689  star  support 5 (occ 6)  size 3  lifted 1  nisurp -0.131  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-000688
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $x0 $v0))

;; p201690  star  support 5 (occ 5)  size 3  lifted 1  nisurp -0.171  tiers tierB  dominated
;;   e.g. tierB-000256 tierB-000747 tierB-001754
(And (Agent $e0 $x0) (Member $e0 $v0) (Result $e0 $e1))

;; p201691  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Agent $e0 $x0) (Member $e0 $v0) (Through $e0 $x1))

;; p201692  star  support 5 (occ 8)  size 3  lifted 1  nisurp -0.040  tiers tierB  dominated
;;   e.g. tierB-000423 tierB-000975 tierB-001130
(And (Agent $e0 $x0) (Member $x0 $v0) (Possession $x1 $x0))

;; p201693  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000034 tierB-000218 tierB-000616
(And (Already $e0) (Member $e0 $v0) (Patient $e0 $x0))

;; p201694  star  support 5 (occ 5)  size 3  lifted 1  nisurp -0.232  tiers tierB  dominated
;;   e.g. tierB-000320 tierB-000779 tierB-000838
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Patient $e0 $x0))

;; p201695  star  support 5 (occ 10)  size 3  lifted 1  nisurp -0.379  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-000832
(And (Experiencer $e0 $x0) (Experiencer $e1 $x0) (Member $x0 $v0))

;; p201696  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000744 tierB-000826
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Source $e0 $x1))

;; p201697  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.416  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000162 tierB-000730 tierB-000855
(And (Holder $e0 $v0) (Member $e0 have) (Past $e0))

;; p201698  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.241  tiers tierB  dominated
;;   e.g. tierB-000145 tierB-000162 tierB-000730
(And (Holder $e0 $v0) (Past $e0) (Theme $e0 $x0))

;; p201699  star  support 5 (occ 5)  size 3  lifted 1  nisurp -0.342  tiers tierB  dominated
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(And (Holder $e0 $x0) (Member $e0 $v0) (Past $e0))

;; p201700  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000411 tierB-000774 tierB-001033
(And (In $e0 $x0) (Member $e0 $v0) (Past $e0))

;; p201701  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.008  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000426 tierB-000801
(And (Manner $e0 $v0) (Ongoing $e0) (Past $e0))

;; p201702  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.534  tiers tierB  dominated
;;   e.g. tierB-000194 tierB-000685 tierB-001048
(And (Manner $e0 $v0) (Ongoing $e0) (Patient $e0 $x0))

;; p201703  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000176 tierB-000316 tierB-000659
(And (Member $e0 $v0) (Past $e0) (Stimulus $e0 $e1))

;; p201704  star  support 5 (occ 6)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000139 tierB-000309 tierB-000373
(And (Member $e0 $v0) (Past $e0) (Time $e0 (Year <num>)))

;; p201705  star  support 5 (occ 6)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000215 tierB-000799 tierB-001031
(And (Member $e0 $v0) (Past $e0) (TimeAtMost $e0 (Year <num>)))

;; p201706  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.221  tiers tierB
;;   e.g. tierB-000400 tierB-000781 tierB-001325
(And (Member $e0 $v0) (Source $e0 $x0) (Theme $e0 $x1))

;; p201707  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.954  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001431 tierB-001504
(And (Member $e0 make) (Patient $e0 $v0) (Result $e0 $e1))

;; p201708  star  support 5 (occ 6)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(And (Member $x0 $v0) (Member $x0 new) (Theme $e0 $x0))

;; p201709  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.131  tiers tierB  dominated
;;   e.g. tierB-000423 tierB-000722 tierB-000975
(And (Member $x0 $v0) (Possession $x0 $x1) (Theme $e0 $x0))

;; p201710  star  support 5 (occ 5)  size 3  lifted 1  nisurp 0.070  tiers tierB  dominated
;;   e.g. tierB-000299 tierB-000571 tierB-001486
(And (Past $e0) (Theme $e0 $x0) (Time $e0 $v0))

;; p201711  star  support 5 (occ 5)  size 3  lifted 2  nisurp 0.435  tiers tierB
;;   e.g. tierB-000147 tierB-000257 tierB-001117
(And (Agent $e0 $v0) (Member $e0 $v1) (Obligated $e0))

;; p201712  star  support 5 (occ 9)  size 3  lifted 2  nisurp 0.431  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000782 tierB-001008
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $x0 $v1))

;; p201713  star  support 5 (occ 5)  size 3  lifted 2  nisurp -0.105  tiers tierB
;;   e.g. tierB-000063 tierB-000237 tierB-000830
(And (Agent $e0 $x0) (Location $e0 $v0) (Member $e0 $v1))

;; p201714  star  support 5 (occ 6)  size 3  lifted 2  nisurp -0.086  tiers tierB
;;   e.g. tierB-000534 tierB-000676 tierB-001299
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Ongoing $e0))

;; p201715  star  support 5 (occ 5)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000040 tierB-000344 tierB-001563
(And (Goal $e0 $x0) (Manner $e0 $v0) (Member $e0 $v1))

;; p201716  star  support 5 (occ 5)  size 3  lifted 2  nisurp 0.390  tiers tierB
;;   e.g. tierB-000096 tierB-000906 tierB-001283
(And (Location $e0 $x0) (Member $e0 $v0) (Patient $e0 $v1))

;; p201717  star  support 5 (occ 5)  size 3  lifted 2  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000253 tierB-000593 tierB-000778
(And (Measure $e0 duration <num> $v0) (Member $e0 $v1) (Past $e0))

;; p201718  star  support 5 (occ 5)  size 3  lifted 2  nisurp -0.145  tiers tierB
;;   e.g. tierB-000144 tierB-000212 tierB-000327
(And (Member $e0 $v0) (Ongoing $e0) (Time $e0 $v1))

;; p201719  star  support 5 (occ 5)  size 3  lifted 2  nisurp 0.358  tiers tierB
;;   e.g. tierB-000298 tierB-000476 tierB-000705
(And (Member $e0 $v0) (Past $e0) (Source $e0 $v1))

;; p201720  star  support 5 (occ 6)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000282 tierB-000404 tierB-001035
(And (Member $e0 $v0) (Theme $e0 $v1) (To $e0 $e1))

;; p201721  star  support 5 (occ 5)  size 3  lifted 2  nisurp 0.059  tiers tierB  dominated
;;   e.g. tierB-000538 tierB-000979 tierB-001287
(And (Member $x0 $v0) (Member $x0 $v1) (Source $e0 $x0))

;; p201722  star  support 5 (occ 5)  size 3  lifted 3  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000004 tierB-000253 tierB-000647
(And (Agent $e0 $v0) (Measure $e0 duration <num> $v1) (Member $e0 $v2))

;; p201723  star  support 5 (occ 5)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000053 tierB-000426 tierB-001295
(And (Degree $e0 $v0 $v1) (Manner $e0 $v0) (Member $e0 $v2))

;; p201724  star  support 5 (occ 7)  size 3  lifted 3  nisurp -0.009  tiers tierB
;;   e.g. tierB-000146 tierB-000205 tierB-001206
(And (LocatedIn $x0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p201725  star  support 5 (occ 5)  size 3  lifted 3  nisurp 0.300  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000593 tierB-000778
(And (Measure $e0 $v0 <num> $v1) (Member $e0 $v2) (Past $e0))

;; p201726  star  support 5 (occ 7)  size 3  lifted 3  nisurp 0.337  tiers tierB
;;   e.g. tierB-000311 tierB-000354 tierB-000598
(And (Member $e0 $v0) (Theme $e0 $v1) (Time $e0 $v2))

;; p201727  star  support 5 (occ 5)  size 3  lifted 4  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000253 tierB-000647
(And (Agent $e0 $v0) (Measure $e0 $v1 <num> $v2) (Member $e0 $v3))

;; p201728  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.382  tiers tierB  dominated
;;   e.g. tierB-000156 tierB-000556 tierB-000745
(And (Agent $e0 $x0) (Can $e0))

;; p201729  star  support 5 (occ 6)  size 2  lifted 0  nisurp 0.463  tiers tierB  dominated
;;   e.g. tierB-000359 tierB-000556 tierB-000738
(And (Agent $e0 $x0) (Cardinality $x0 <num>))

;; p201730  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.805  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000775 tierB-001089 tierB-001283
(And (Agent $e0 $x0) (Member $e0 cause))

;; p201731  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.675  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000298 tierB-000713
(And (Agent $e0 $x0) (Member $e0 leave))

;; p201732  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.707  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000160 tierB-000648 tierB-001125
(And (Agent $e0 $x0) (Member $e0 play))

;; p201733  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.805  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000258 tierB-000520 tierB-001205
(And (Agent $e0 $x0) (Member $e0 watch))

;; p201734  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.805  tiers tierB  dominated
;;   e.g. tierB-000305 tierB-000337 tierB-000340
(And (Agent $e0 $x0) (Member $x0 boy))

;; p201735  star  support 5 (occ 6)  size 2  lifted 0  nisurp 0.040  tiers tierB  dominated
;;   e.g. tierB-000423 tierB-000975 tierB-001130
(And (Agent $e0 $x0) (Possession $x1 $x0))

;; p201736  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.171  tiers tierB  dominated
;;   e.g. tierB-000256 tierB-000747 tierB-001754
(And (Agent $e0 $x0) (Result $e0 $e1))

;; p201737  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.772  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000656 tierB-000782
(And (Agent $e0 $x0) (Through $e0 $x1))

;; p201738  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.836  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000218 tierB-000616
(And (Already $e0) (Patient $e0 $x0))

;; p201739  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.232  tiers tierB  dominated
;;   e.g. tierB-000320 tierB-000779 tierB-000838
(And (Cardinality $x0 <num>) (Patient $e0 $x0))

;; p201740  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.707  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-000832
(And (Experiencer $e0 $x0) (Experiencer $e1 $x0))

;; p201741  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.907  tiers tierB  signal subtree-collapse
;;   e.g. tierB-001003 tierB-001334 tierB-001753
(And (Experiencer $e0 $x0) (Member $e0 sleep))

;; p201742  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.590  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000744 tierB-000826
(And (Experiencer $e0 $x0) (Source $e0 $x1))

;; p201743  star  support 5 (occ 6)  size 2  lifted 0  nisurp 0.178  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000393 tierB-000412
(And (GroupOf $x0 person) (Patient $e0 $x0))

;; p201744  star  support 5 (occ 6)  size 2  lifted 0  nisurp 0.724  tiers tierB  dominated
;;   e.g. tierB-000162 tierB-000483 tierB-001069
(And (GroupOf $x0 thing) (Theme $e0 $x0))

;; p201745  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.342  tiers tierB  dominated
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(And (Holder $e0 $x0) (Past $e0))

;; p201746  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.592  tiers tierB  dominated
;;   e.g. tierB-000411 tierB-000774 tierB-001033
(And (In $e0 $x0) (Past $e0))

;; p201747  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.849  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000636 tierB-000852
(And (Member $e0 capture) (Theme $e0 $x0))

;; p201748  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.808  tiers tierB  dominated
;;   e.g. tierB-000139 tierB-000517 tierB-001491
(And (Member $e0 change) (Patient $e0 $x0))

;; p201749  star  support 5 (occ 7)  size 2  lifted 0  nisurp 0.874  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000101 tierB-000454 tierB-000768
(And (Member $e0 contain) (Theme $e0 $x0))

;; p201750  star  support 5 (occ 6)  size 2  lifted 0  nisurp 0.807  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000370 tierB-000748 tierB-001185
(And (Member $e0 get) (Ongoing $e0))

;; p201751  star  support 5 (occ 6)  size 2  lifted 0  nisurp 0.644  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-000890
(And (Member $e0 get) (Patient $e0 $x0))

;; p201752  star  support 5 (occ 6)  size 2  lifted 0  nisurp 0.952  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000370 tierB-000748
(And (Member $e0 get) (Result $e0 $e1))

;; p201753  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.592  tiers tierB  dominated
;;   e.g. tierB-000067 tierB-000412 tierB-001197
(And (Member $e0 kill) (Past $e0))

;; p201754  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.416  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000298 tierB-000425 tierB-000704
(And (Member $e0 leave) (Past $e0))

;; p201755  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.939  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000114 tierB-000339
(And (Member $e0 need) (Theme $e0 $e1))

;; p201756  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.808  tiers tierB  dominated
;;   e.g. tierB-000056 tierB-000302 tierB-001487
(And (Member $e0 open) (Patient $e0 $x0))

;; p201757  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.849  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000326 tierB-000784 tierB-000975
(And (Member $e0 sell) (Theme $e0 $x0))

;; p201758  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.896  tiers tierB  signal subtree-collapse
;;   e.g. tierB-001302 tierB-001334 tierB-001753
(And (Member $e0 sleep) (Ongoing $e0))

;; p201759  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000676 tierB-000712 tierB-001299
(And (Member $e0 stand) (Past $e0))

;; p201760  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.866  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000203 tierB-000225 tierB-001084
(And (Member $e0 study) (Ongoing $e0))

;; p201761  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.592  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(And (Member $e0 turn) (Past $e0))

;; p201762  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.475  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000419 tierB-000867 tierB-001515
(And (Member $e0 work) (Past $e0))

;; p201763  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.673  tiers tierB  dominated
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(And (Member $x0 new) (Theme $e0 $x0))

;; p201764  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.836  tiers tierB  dominated
;;   e.g. tierB-000805 tierB-000951 tierB-001384
(And (Member $x0 sound) (Patient $e0 $x0))

;; p201765  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.045  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-001066 tierB-001243
(And (PartOf $x0 $x1) (Theme $e0 $x0))

;; p201766  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000176 tierB-000316 tierB-000659
(And (Past $e0) (Stimulus $e0 $e1))

;; p201767  star  support 5 (occ 6)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000139 tierB-000309 tierB-000373
(And (Past $e0) (Time $e0 (Year <num>)))

;; p201768  star  support 5 (occ 6)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000799 tierB-001031
(And (Past $e0) (TimeAtMost $e0 (Year <num>)))

;; p201769  star  support 5 (occ 5)  size 2  lifted 0  nisurp 0.221  tiers tierB  dominated
;;   e.g. tierB-000400 tierB-000781 tierB-001325
(And (Source $e0 $x0) (Theme $e0 $x1))

;; p201770  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.783  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000004 tierB-000425 tierB-000564
(And (Agent $e0 $v0) (Member $e0 leave))

;; p201771  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.826  tiers tierB  dominated
;;   e.g. tierB-000148 tierB-000805 tierB-000929
(And (Agent $e0 $v0) (Member $e0 walk))

;; p201772  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.435  tiers tierB  dominated
;;   e.g. tierB-000147 tierB-000257 tierB-001117
(And (Agent $e0 $v0) (Obligated $e0))

;; p201773  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.105  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000237 tierB-000830
(And (Agent $e0 $x0) (Location $e0 $v0))

;; p201774  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-000867 tierB-001782
(And (During $e0 $e1) (Member $e0 $v0))

;; p201775  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-000867 tierB-001782
(And (During $e0 $e1) (Member $e1 $v0))

;; p201776  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.086  tiers tierB  dominated
;;   e.g. tierB-000534 tierB-000676 tierB-001299
(And (Experiencer $e0 $v0) (Ongoing $e0))

;; p201777  star  support 5 (occ 7)  size 2  lifted 1  nisurp 0.255  tiers tierB  dominated
;;   e.g. tierB-000599 tierB-000892 tierB-001212
(And (For $x0 $x1) (Member $x0 $v0))

;; p201778  star  support 5 (occ 7)  size 2  lifted 1  nisurp 0.255  tiers tierB  dominated
;;   e.g. tierB-000172 tierB-001271 tierB-001421
(And (From $x0 $x1) (Member $x0 $v0))

;; p201779  star  support 5 (occ 6)  size 2  lifted 1  nisurp 0.255  tiers tierB  dominated
;;   e.g. tierB-000172 tierB-001271 tierB-001421
(And (From $x0 $x1) (Member $x1 $v0))

;; p201780  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.537  tiers tierB  dominated
;;   e.g. tierB-000040 tierB-000344 tierB-001563
(And (Goal $e0 $x0) (Manner $e0 $v0))

;; p201781  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.503  tiers tierB  dominated
;;   e.g. tierB-000126 tierB-001108 tierB-001286
(And (GroupOf $x0 $v0) (Past (LocatedIn $x0 $x1)))

;; p201782  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.131  tiers tierB  dominated
;;   e.g. tierB-000774 tierB-001033 tierB-001482
(And (In $e0 $x0) (Member $x0 $v0))

;; p201783  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.390  tiers tierB  dominated
;;   e.g. tierB-000096 tierB-000906 tierB-001283
(And (Location $e0 $x0) (Patient $e0 $v0))

;; p201784  star  support 5 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000237 tierB-000378 tierB-000653
(And (Location $e0 here) (Member $e0 $v0))

;; p201785  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.475  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000593 tierB-000778
(And (Measure $e0 duration <num> $v0) (Past $e0))

;; p201786  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000253 tierB-000778 tierB-001084
(And (Measure $e0 duration <num> year) (Member $e0 $v0))

;; p201787  star  support 5 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(And (Member $e0 $v0) (Over $e0 $x0))

;; p201788  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000089 tierB-000919 tierB-001016
(And (Member $e0 $v0) (Still $e0))

;; p201789  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000176 tierB-000316 tierB-000659
(And (Member $e0 $v0) (Stimulus $e0 $e1))

;; p201790  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000176 tierB-000316 tierB-000659
(And (Member $e0 $v0) (Stimulus $e1 $e0))

;; p201791  star  support 5 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000139 tierB-000309 tierB-000373
(And (Member $e0 $v0) (Time $e0 (Year <num>)))

;; p201792  star  support 5 (occ 7)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000495 tierB-000631 tierB-000808
(And (Member $e0 $v0) (Time $e0 today))

;; p201793  star  support 5 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000799 tierB-001031
(And (Member $e0 $v0) (TimeAtMost $e0 (Year <num>)))

;; p201794  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000748 tierB-000790 tierB-001594
(And (Member $x0 $v0) (Member $x0 bad))

;; p201795  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000367 tierB-000937 tierB-001124
(And (Member $x0 $v0) (Member $x0 blue))

;; p201796  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000796 tierB-000861 tierB-000918
(And (Member $x0 $v0) (Member $x0 full))

;; p201797  star  support 5 (occ 5)  size 2  lifted 1  nisurp 1.111  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000048 tierB-000371 tierB-000441
(And (Member $x0 $v0) (Member $x0 house))

;; p201798  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.366  tiers tierB  signal subtree-collapse
;;   e.g. tierB-001316 tierB-001568 tierB-001593
(And (Member $x0 $v0) (Member $x0 man))

;; p201799  star  support 5 (occ 6)  size 2  lifted 1  nisurp 0.366  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000604 tierB-001123 tierB-001196
(And (Member $x0 $v0) (Member $x0 place))

;; p201800  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.490  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000650 tierB-001189 tierB-001432
(And (Member $x0 $v0) (Member $x0 problem))

;; p201801  star  support 5 (occ 6)  size 2  lifted 1  nisurp 0.118  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000792 tierB-001260
(And (Member $x0 $v0) (Only $x0 $e0))

;; p201802  star  support 5 (occ 7)  size 2  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(And (Member $x0 $v0) (Over $e0 $x0))

;; p201803  star  support 5 (occ 6)  size 2  lifted 1  nisurp 0.885  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000023 tierB-000839 tierB-000859
(And (Member $x0 $v0) ~NEG (Member $x0 thing))

;; p201804  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.145  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000212 tierB-000327
(And (Ongoing $e0) (Time $e0 $v0))

;; p201805  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.358  tiers tierB  dominated
;;   e.g. tierB-000298 tierB-000476 tierB-000705
(And (Past $e0) (Source $e0 $v0))

;; p201806  star  support 5 (occ 5)  size 2  lifted 1  nisurp 0.845  tiers tierB  dominated
;;   e.g. tierB-000282 tierB-000404 tierB-001035
(And (Theme $e0 $v0) (To $e0 $e1))

;; p201807  star  support 5 (occ 5)  size 2  lifted 2  nisurp 0.804  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000253 tierB-000647
(And (Agent $e0 $v0) (Measure $e0 duration <num> $v1))

;; p201808  star  support 5 (occ 5)  size 2  lifted 2  nisurp 0.913  tiers tierB  dominated
;;   e.g. tierB-000053 tierB-000426 tierB-001295
(And (Degree $e0 $v0 $v1) (Manner $e0 $v0))

;; p201809  star  support 5 (occ 6)  size 2  lifted 2  nisurp 0.255  tiers tierB
;;   e.g. tierB-000172 tierB-000237 tierB-000635
(And (Directive (And (Member $x0 $v0) (Theme $x0 $x1))) (Member $x1 $v1))

;; p201810  star  support 5 (occ 6)  size 2  lifted 2  nisurp 0.255  tiers tierB
;;   e.g. tierB-000149 tierB-001303 tierB-001383
(And (From $x0 $v0) (Member $x0 $v1))

;; p201811  star  support 5 (occ 5)  size 2  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000778 tierB-001084
(And (Measure $e0 $v0 <num> year) (Member $e0 $v1))

;; p201812  star  support 5 (occ 8)  size 2  lifted 2  nisurp 0.255  tiers tierB
;;   e.g. tierB-000388 tierB-000957 tierB-001014
(And (Member $x0 $v0) (Might (Member $x0 $v1)))

;; p201813  star  support 5 (occ 5)  size 2  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000141 tierB-000504 tierB-001185
(And (Member $x0 $v0) (Past (LocatedIn $v1 $x0)))

;; p201814  star  support 5 (occ 7)  size 2  lifted 2  nisurp 0.337  tiers tierB  dominated
;;   e.g. tierB-000311 tierB-000354 tierB-000598
(And (Theme $e0 $v0) (Time $e0 $v1))

;; p201815  star  support 5 (occ 5)  size 2  lifted 3  nisurp 0.739  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000253 tierB-000647
(And (Agent $e0 $v0) (Measure $e0 $v1 <num> $v2))

;; p201816  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-000867 tierB-001782
(During $e0 $e1)

;; p201817  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000295 tierB-000705 tierB-000959
(GroupOf $x0 book)

;; p201818  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001316 tierB-001457 tierB-001530
(GroupOf $x0 boy)

;; p201819  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001252 tierB-001284 tierB-001697
(GroupOf $x0 cloud)

;; p201820  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000085 tierB-000615 tierB-001450
(GroupOf $x0 flower)

;; p201821  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000237 tierB-000378 tierB-000653
(Location $e0 here)

;; p201822  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000778 tierB-001084
(Measure $e0 duration <num> year)

;; p201823  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000352 tierB-000740 tierB-001079
(Member $e0 become)

;; p201824  star  support 5 (occ 7)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000454 tierB-000768
(Member $e0 contain)

;; p201825  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000338 tierB-000410 tierB-000616
(Member $e0 eat)

;; p201826  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000230 tierB-000297 tierB-000831
(Member $e0 look)

;; p201827  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000769 tierB-001260 tierB-001262
(Member $e0 provide)

;; p201828  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000080 tierB-000865 tierB-001441
(Member $e0 say)

;; p201829  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000676 tierB-000712 tierB-001299
(Member $e0 stand)

;; p201830  star  support 5 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000030 tierB-000125 tierB-000792
(Member $e0 stop)

;; p201831  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000313 tierB-000782 tierB-001008
(Member $e0 swim)

;; p201832  star  support 5 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000434 tierB-000667 tierB-000830
(Member $e0 travel)

;; p201833  star  support 5 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000250 tierB-000626 tierB-000846
(Member $e0 want)

;; p201834  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000748 tierB-000790 tierB-001594
(Member $x0 bad)

;; p201835  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000302 tierB-000931 tierB-001435
(Member $x0 bank)

;; p201836  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000476 tierB-000541 tierB-001509
(Member $x0 black)

;; p201837  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000367 tierB-000937 tierB-001124
(Member $x0 blue)

;; p201838  star  support 5 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000083 tierB-000475 tierB-000541
(Member $x0 box)

;; p201839  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000081 tierB-000912 tierB-001821
(Member $x0 corner)

;; p201840  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000838 tierB-000890 tierB-000922
(Member $x0 fire)

;; p201841  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000233 tierB-000369 tierB-000386
(Member $x0 fridge)

;; p201842  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000796 tierB-000861 tierB-000918
(Member $x0 full)

;; p201843  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000122 tierB-000608 tierB-000728
(Member $x0 language)

;; p201844  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000238 tierB-000808 tierB-000900
(Member $x0 train)

;; p201845  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000138 tierB-001190 tierB-001459
(Member $x0 way)

;; p201846  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000062 tierB-001163 tierB-001306
(Member $x0 wind)

;; p201847  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000090 tierB-000108 tierB-001275
(Member $x0 world)

;; p201848  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000409 tierB-001070 tierB-001262
(Of $x0 $x1)

;; p201849  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(Over $e0 $x0)

;; p201850  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-000919 tierB-001016
(Still $e0)

;; p201851  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000176 tierB-000316 tierB-000659
(Stimulus $e0 $e1)

;; p201852  star  support 5 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000139 tierB-000309 tierB-000373
(Time $e0 (Year <num>))

;; p201853  star  support 5 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000495 tierB-000631 tierB-000808
(Time $e0 today)

;; p201854  star  support 5 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000799 tierB-001031
(TimeAtMost $e0 (Year <num>))

;; p201855  star  support 5 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000224 tierB-000439 tierB-000726
(Yet $e0)

;; p201856  star  support 5 (occ 5)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000053 tierB-001295 tierB-001708
(Degree $e0 $v0 very)

;; p201857  star  support 5 (occ 5)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000778 tierB-001084
(Measure $e0 $v0 <num> year)

;; p201858  star  support 5 (occ 5)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000141 tierB-000504 tierB-001185
(Past (LocatedIn $v0 $x0))

;; p201859  cross  support 4 (occ 9)  size 4  lifted 0  nisurp -0.255  tiers tierB
;;   e.g. tierB-000942 tierB-001219 tierB-001275
(And (Agent $e0 $x0) (Agent $e1 $x0) (Agent $e2 $x0) (Past $e0))

;; p201860  cross  support 4 (occ 4)  size 4  lifted 0  nisurp 0.926  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 start) (Ongoing $e1))

;; p201861  cross  support 4 (occ 6)  size 4  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 start) (Past $e0))

;; p201862  cross  support 4 (occ 4)  size 4  lifted 0  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 start) (Theme $e0 $e1))

;; p201863  cross  support 4 (occ 4)  size 4  lifted 0  nisurp 0.512  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Member $e0 start) (Ongoing $e1) (Theme $e0 $e1))

;; p201864  cross  support 4 (occ 4)  size 4  lifted 0  nisurp 0.512  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Member $e1 start) (Ongoing $e0) (Theme $e1 $e0))

;; p201865  cross  support 4 (occ 4)  size 4  lifted 0  nisurp 0.634  tiers tierB  signal conj-pattern
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Member $e1 start) (Past $e1) (Theme $e1 $e0))

;; p201866  cross  support 4 (occ 4)  size 4  lifted 0  nisurp 0.635  tiers tierB  signal conj-pattern
;;   e.g. tierB-000338 tierB-000747 tierB-001887
(And (Agent $e0 $x0) (Member $x0 person) (Past $e0) (Patient $e0 $x1))

;; p201867  cross  support 4 (occ 4)  size 4  lifted 0  nisurp 0.452  tiers tierB
;;   e.g. tierB-000858 tierB-000942 tierB-001697
(And (Agent $e0 $x0) (Past $e0) (Patient $e1 $x1) (Theme $e0 $e1))

;; p201868  cross  support 4 (occ 4)  size 4  lifted 0  nisurp 0.907  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001446 tierB-001816
(And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Patient $e1 $x0))

;; p201869  cross  support 4 (occ 4)  size 4  lifted 0  nisurp 0.589  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001446 tierB-001816
(And (Member $e0 start) (Ongoing $e1) (Patient $e0 $x0) (Theme $e0 $e1))

;; p201870  cross  support 4 (occ 4)  size 4  lifted 0  nisurp 0.829  tiers tierB  signal conj-pattern
;;   e.g. tierB-000265 tierB-001446 tierB-001816
(And (Member $e0 start) (Patient $e0 $x0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201871  cross  support 4 (occ 4)  size 4  lifted 0  nisurp 0.418  tiers tierB
;;   e.g. tierB-000265 tierB-000942 tierB-001394
(And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Theme $e1 $e0))

;; p201872  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.635  tiers tierB  signal conj-pattern
;;   e.g. tierB-000173 tierB-000539 tierB-000951
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 make) (Past $e1))

;; p201873  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.891  tiers tierB  signal conj-pattern
;;   e.g. tierB-000117 tierB-000400 tierB-000547
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 try) (Theme $e0 $e1))

;; p201874  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.740  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Agent $e0 $v0) (Agent $e1 $v0) (Ongoing $e0) (Theme $e1 $e0))

;; p201875  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.089  tiers tierB
;;   e.g. tierB-000252 tierB-000367 tierB-000962
(And (Agent $e0 $v0) (Agent $e1 $v0) (Past $e0) (Theme $e0 $x0))

;; p201876  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.402  tiers tierB
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Experiencer $e1 $x0) (Patient $e0 $x0) (Result $e0 $e1))

;; p201877  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.538  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Agent $e0 $v0) (Ongoing $e0) (Past $e1) (Theme $e1 $e0))

;; p201878  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.538  tiers tierB
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Agent $e0 $v0) (Ongoing $e1) (Past $e0) (Theme $e0 $e1))

;; p201879  cross  support 4 (occ 10)  size 4  lifted 1  nisurp -0.097  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001275 tierB-001735
(And (Agent $e0 $x0) (Agent $e1 $x0) (Location $e0 $x1) (Member $e0 $v0))

;; p201880  cross  support 4 (occ 10)  size 4  lifted 1  nisurp -0.097  tiers tierB
;;   e.g. tierB-000942 tierB-001275 tierB-001735
(And (Agent $e0 $x0) (Agent $e1 $x0) (Location $e0 $x1) (Member $e1 $v0))

;; p201881  cross  support 4 (occ 6)  size 4  lifted 1  nisurp 0.367  tiers tierB
;;   e.g. tierB-001008 tierB-001629 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Manner $e0 $v0) (Past $e1))

;; p201882  cross  support 4 (occ 6)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Member $e1 start))

;; p201883  cross  support 4 (occ 11)  size 4  lifted 1  nisurp -0.553  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000258 tierB-000942
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Theme $e0 $x1))

;; p201884  cross  support 4 (occ 11)  size 4  lifted 1  nisurp -0.553  tiers tierB
;;   e.g. tierB-000101 tierB-000258 tierB-000942
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Theme $e1 $x1))

;; p201885  cross  support 4 (occ 8)  size 4  lifted 1  nisurp -0.426  tiers tierB
;;   e.g. tierB-000942 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 $v0) (Patient $e0 $x1))

;; p201886  cross  support 4 (occ 11)  size 4  lifted 1  nisurp 0.415  tiers tierB
;;   e.g. tierB-000470 tierB-000485 tierB-001275
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e1 $v0))

;; p201887  cross  support 4 (occ 5)  size 4  lifted 1  nisurp -0.422  tiers tierB
;;   e.g. tierB-000339 tierB-000688 tierB-000783
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $x0 $v0) (Past $e1))

;; p201888  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.246  tiers tierB
;;   e.g. tierB-001068 tierB-001122 tierB-001379
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Ongoing $e0) (Theme $e0 $x1))

;; p201889  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000587 tierB-001125 tierB-001433
(And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 $v0) (Ongoing $e0))

;; p201890  cross  support 4 (occ 12)  size 4  lifted 1  nisurp -0.727  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-001275 tierB-001618
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 $v0) (Past $e0))

;; p201891  cross  support 4 (occ 12)  size 4  lifted 1  nisurp -0.727  tiers tierB
;;   e.g. tierB-000575 tierB-001275 tierB-001618
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 $v0) (Past $e1))

;; p201892  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 start) (Theme $e1 $e0))

;; p201893  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000073 tierB-000381 tierB-001183
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 cat) (Past $e0))

;; p201894  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-001182 tierB-001773 tierB-001803
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 man) (Patient $e0 $x1))

;; p201895  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001251 tierB-001693 tierB-001762
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x1 new) (Theme $e0 $x1))

;; p201896  cross  support 4 (occ 6)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000101 tierB-000768 tierB-001254
(And (Agent $e0 $x0) (Member $e0 contain) (Member $x0 $v0) (Theme $e0 $x1))

;; p201897  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Member $e0 start) (Member $e1 $v0) (Theme $e0 $e1))

;; p201898  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.224  tiers tierB
;;   e.g. tierB-000500 tierB-000782 tierB-001153
(And (Agent $e0 $x0) (Member $x0 $v0) (Past $e0) (Through $e0 $x1))

;; p201899  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.224  tiers tierB  signal conj-pattern
;;   e.g. tierB-000747 tierB-001887 tierB-001962
(And (Agent $e0 $x0) (Member $x0 person) (Member $x1 $v0) (Patient $e0 $x1))

;; p201900  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-001251 tierB-001693 tierB-001762
(And (Agent $e0 $x0) (Member $x1 $v0) (Member $x1 new) (Theme $e0 $x1))

;; p201901  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.224  tiers tierB
;;   e.g. tierB-000775 tierB-000793 tierB-001452
(And (Agent $e0 $x0) (Member $x1 $v0) (Past $e0) (Recipient $e0 $x1))

;; p201902  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.224  tiers tierB
;;   e.g. tierB-000338 tierB-000693 tierB-001655
(And (Agent $e0 $x0) (Member $x1 $v0) (Past $e0) (Source $e0 $x1))

;; p201903  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.224  tiers tierB
;;   e.g. tierB-000942 tierB-001130 tierB-001697
(And (Agent $e0 $x0) (Member $x1 $v0) (Patient $e1 $x1) (Theme $e0 $e1))

;; p201904  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.793  tiers tierB  signal conj-pattern
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Member $e0 have) (Theme $e0 $x0))

;; p201905  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.342  tiers tierB  dominated
;;   e.g. tierB-000133 tierB-000379 tierB-000797
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Past $e0) (Theme $e0 $x0))

;; p201906  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.342  tiers tierB
;;   e.g. tierB-000133 tierB-000379 tierB-000797
(And (Cardinality $x0 <num>) (Member $e0 $v0) (Past $e0) (Theme $e0 $x0))

;; p201907  cross  support 4 (occ 6)  size 4  lifted 1  nisurp 0.305  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-001625
(And (Experiencer $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0) (Past $e0))

;; p201908  cross  support 4 (occ 6)  size 4  lifted 1  nisurp 0.305  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-001625
(And (Experiencer $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0) (Past $e1))

;; p201909  cross  support 4 (occ 12)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000596 tierB-000786 tierB-001625
(And (Experiencer $e0 $x0) (Experiencer $e1 $x0) (Member $x0 $v0) (Past $e0))

;; p201910  cross  support 4 (occ 6)  size 4  lifted 1  nisurp 0.052  tiers tierB
;;   e.g. tierB-001041 tierB-001078 tierB-001397
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Ongoing $e0) (Past $e0))

;; p201911  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000324 tierB-000929 tierB-001044
(And (Goal $e0 $x0) (Member $e0 walk) (Member $x0 $v0) (Past $e0))

;; p201912  cross  support 4 (occ 5)  size 4  lifted 1  nisurp -0.164  tiers tierB
;;   e.g. tierB-000482 tierB-001453 tierB-001579
(And (Goal $e0 $x0) (Member $x0 $v0) (Past $e0) (Patient $e0 $x1))

;; p201913  cross  support 4 (occ 4)  size 4  lifted 1  nisurp -0.068  tiers tierB
;;   e.g. tierB-000462 tierB-001023 tierB-001037
(And (Goal $e0 $x0) (Member $x0 $v0) (Past $e0) (Theme $e0 $x1))

;; p201914  cross  support 4 (occ 5)  size 4  lifted 1  nisurp -0.800  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (Past $e0) (Patient $e0 $x0))

;; p201915  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.452  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p201916  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.793  tiers tierB  signal conj-pattern
;;   e.g. tierB-000799 tierB-001111 tierB-001628
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (ProportionOf $x0 $x1 most) (SubsetOf $x0 $x1))

;; p201917  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.052  tiers tierB  signal conj-pattern
;;   e.g. tierB-000162 tierB-000797 tierB-001412
(And (GroupOf $x0 $v0) (Member $e0 have) (Past $e0) (Theme $e0 $x0))

;; p201918  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.690  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (GroupOf $x0 $v0) (Past $e0) (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p201919  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.690  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (GroupOf $x0 $v0) (Past $e0) (Patient $e0 $x1) (SubsetOf $x1 $x0))

;; p201920  cross  support 4 (occ 5)  size 4  lifted 1  nisurp -0.605  tiers tierB  dominated
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(And (Holder $e0 $x0) (Member $e0 have) (Member $x0 $v0) (Past $e0))

;; p201921  cross  support 4 (occ 5)  size 4  lifted 1  nisurp -0.605  tiers tierB
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(And (Holder $e0 $x0) (Member $x0 $v0) (Past $e0) (Theme $e0 $x1))

;; p201922  cross  support 4 (occ 6)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000047 tierB-000502 tierB-001041
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 table) (Past $e0))

;; p201923  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000370 tierB-000748 tierB-001185
(And (Member $e0 $v0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))

;; p201924  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000325 tierB-001504 tierB-001594
(And (Member $e0 $v0) (Member $e1 make) (Past $e1) (Result $e1 $e0))

;; p201925  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001446 tierB-001816
(And (Member $e0 $v0) (Member $e1 start) (Patient $e1 $x0) (Theme $e1 $e0))

;; p201926  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(And (Member $e0 $v0) (Member $x0 new) (Past $e0) (Theme $e0 $x0))

;; p201927  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000805 tierB-001384 tierB-001894
(And (Member $e0 $v0) (Member $x0 sound) (Past $e0) (Patient $e0 $x0))

;; p201928  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000409 tierB-001070 tierB-001262
(And (Member $e0 $v0) (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))

;; p201929  cross  support 4 (occ 5)  size 4  lifted 1  nisurp -0.846  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000087 tierB-001515
(And (Member $e0 $v0) (Past $e0) (Past $e1) (Theme $e0 $e1))

;; p201930  cross  support 4 (occ 5)  size 4  lifted 1  nisurp -0.846  tiers tierB
;;   e.g. tierB-000030 tierB-000087 tierB-001515
(And (Member $e0 $v0) (Past $e0) (Past $e1) (Theme $e1 $e0))

;; p201931  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (Member $e0 $v0) (Past $e0) (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p201932  cross  support 4 (occ 4)  size 4  lifted 1  nisurp -0.472  tiers tierB
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Member $e0 $v0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))

;; p201933  cross  support 4 (occ 4)  size 4  lifted 1  nisurp 0.224  tiers tierB  signal conj-pattern
;;   e.g. tierB-000636 tierB-000852 tierB-001342
(And (Member $e0 capture) (Member $x0 $v0) (Past $e0) (Theme $e0 $x0))

;; p201934  cross  support 4 (occ 8)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 get) (Member $x0 $v0) (Ongoing $e0) (Patient $e0 $x0))

;; p201935  cross  support 4 (occ 6)  size 4  lifted 1  nisurp 0.224  tiers tierB  signal conj-pattern
;;   e.g. tierB-000265 tierB-000654 tierB-001446
(And (Member $e0 start) (Member $x0 $v0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p201936  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.224  tiers tierB  signal conj-pattern
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(And (Member $e0 start) (Member $x0 $v0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p201937  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000252 tierB-000942 tierB-000987
(And (Member $e0 take) (Member $x0 $v0) (Past $e0) (Theme $e0 $x0))

;; p201938  cross  support 4 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(And (Member $x0 $v0) (Member $x0 new) (Past $e0) (Theme $e0 $x0))

;; p201939  cross  support 4 (occ 6)  size 4  lifted 1  nisurp -0.379  tiers tierB
;;   e.g. tierB-001068 tierB-001120 tierB-001221
(And (Member $x0 $v0) (Ongoing $e0) (Past $e0) (Theme $e0 $x0))

;; p201940  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000400 tierB-000547
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Member $e1 try))

;; p201941  cross  support 4 (occ 8)  size 4  lifted 2  nisurp -0.015  tiers tierB
;;   e.g. tierB-000139 tierB-000371 tierB-000951
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p201942  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.293  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Experiencer $e1 $x0) (Member $e0 $v1) (Patient $e0 $x0))

;; p201943  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.375  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Experiencer $e1 $x0) (Member $e0 $v1) (Result $e0 $e1))

;; p201944  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.293  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Experiencer $e1 $x0) (Member $e1 $v1) (Patient $e0 $x0))

;; p201945  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.375  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Experiencer $e1 $x0) (Member $e1 $v1) (Result $e0 $e1))

;; p201946  cross  support 4 (occ 6)  size 4  lifted 2  nisurp 0.293  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Experiencer $e1 $x0) (Member $x0 $v1) (Patient $e0 $x0))

;; p201947  cross  support 4 (occ 6)  size 4  lifted 2  nisurp 0.375  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Experiencer $e1 $x0) (Member $x0 $v1) (Result $e0 $e1))

;; p201948  cross  support 4 (occ 8)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000392 tierB-000444 tierB-000576
(And (Agent $e0 $v0) (Instrument $e0 $x0) (Member $x0 $v1) (Past $e0))

;; p201949  cross  support 4 (occ 6)  size 4  lifted 2  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000048 tierB-000524 tierB-000707
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $e0 live) (Member $x0 $v1))

;; p201950  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000400 tierB-000547
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 try) (Theme $e1 $e0))

;; p201951  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.402  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Agent $e0 $v0) (Member $e0 $v1) (Ongoing $e1) (Theme $e0 $e1))

;; p201952  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000147 tierB-000252
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e1) (To $e1 $e0))

;; p201953  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001504 tierB-001594
(And (Agent $e0 $v0) (Member $e0 make) (Member $e1 $v1) (Result $e0 $e1))

;; p201954  cross  support 4 (occ 9)  size 4  lifted 2  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000025 tierB-000371 tierB-000951
(And (Agent $e0 $v0) (Member $e0 make) (Member $x0 $v1) (Patient $e0 $x0))

;; p201955  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000400 tierB-000547
(And (Agent $e0 $v0) (Member $e0 try) (Member $e1 $v1) (Theme $e0 $e1))

;; p201956  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.844  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Member $e1 $v1) (Member $x0 $v1) (Patient $e0 $x0))

;; p201957  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.397  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Member $e1 $v1) (Member $x0 $v1) (Result $e0 $e1))

;; p201958  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.402  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Agent $e0 $v0) (Member $e1 $v1) (Ongoing $e0) (Theme $e1 $e0))

;; p201959  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.402  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Agent $e0 $v0) (Member $e1 $v1) (Ongoing $e1) (Theme $e0 $e1))

;; p201960  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.416  tiers tierB
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Agent $e0 $v0) (Member $e1 $v1) (Past $e0) (To $e0 $e1))

;; p201961  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000078 tierB-000147 tierB-000252
(And (Agent $e0 $v0) (Member $e1 $v1) (Past $e1) (To $e1 $e0))

;; p201962  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.402  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Member $e1 $v1) (Patient $e0 $x0) (Result $e0 $e1))

;; p201963  cross  support 4 (occ 6)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Result $e0 $e1))

;; p201964  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.708  tiers tierB
;;   e.g. tierB-000117 tierB-000173 tierB-000622
(And (Agent $e0 $v0) (Past $e0) (Theme $e0 $e1) (Theme $e1 $v1))

;; p201965  cross  support 4 (occ 8)  size 4  lifted 2  nisurp 0.106  tiers tierB
;;   e.g. tierB-000782 tierB-001008 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Manner $e0 $v0) (Member $x0 $v1))

;; p201966  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000049 tierB-000712 tierB-001663
(And (Agent $e0 $x0) (For $e0 $x1) (Member $e0 $v0) (Member $x1 $v1))

;; p201967  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000575 tierB-000688 tierB-001086
(And (Agent $e0 $x0) (Goal $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p201968  cross  support 4 (occ 6)  size 4  lifted 2  nisurp -0.572  tiers tierB
;;   e.g. tierB-000772 tierB-001035 tierB-001618
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (GroupOf $x1 $v0) (Member $e0 $v1))

;; p201969  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.119  tiers tierB
;;   e.g. tierB-000782 tierB-000801 tierB-001501
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Manner $e0 $v1) (Past $e0))

;; p201970  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.462  tiers tierB
;;   e.g. tierB-000379 tierB-000658 tierB-001120
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Inheritance $v0 $v1) (Theme $e0 $x1))

;; p201971  cross  support 4 (occ 5)  size 4  lifted 2  nisurp -0.775  tiers tierB
;;   e.g. tierB-000120 tierB-000975 tierB-001120
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p201972  cross  support 4 (occ 5)  size 4  lifted 2  nisurp -0.462  tiers tierB
;;   e.g. tierB-000291 tierB-001626 tierB-001735
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Location $e0 $x1) (Member $x1 $v0))

;; p201973  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.156  tiers tierB
;;   e.g. tierB-000520 tierB-000555 tierB-001800
(And (Agent $e0 $x0) (Manner $e0 $v0) (Member $x0 $v1) (Theme $e0 $x1))

;; p201974  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.061  tiers tierB  dominated
;;   e.g. tierB-000256 tierB-000747 tierB-001754
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Result $e0 $e1))

;; p201975  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000782 tierB-001153
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Through $e0 $x1))

;; p201976  cross  support 4 (occ 7)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Over $e0 $x1))

;; p201977  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000288 tierB-000470 tierB-000485
(And (Agent $e0 $x0) (Member $e0 $v0) (Theme $e0 $e1) (Theme $e1 $v1))

;; p201978  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.061  tiers tierB
;;   e.g. tierB-000256 tierB-000747 tierB-001754
(And (Agent $e0 $x0) (Member $e1 $v0) (Member $x0 $v1) (Result $e0 $e1))

;; p201979  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000288 tierB-000470 tierB-000485
(And (Agent $e0 $x0) (Member $e1 $v0) (Theme $e0 $e1) (Theme $e1 $v1))

;; p201980  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.788  tiers tierB
;;   e.g. tierB-000288 tierB-001169 tierB-001773
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Theme $e0 $e1))

;; p201981  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.145  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000693 tierB-001655
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Source $e0 $x1))

;; p201982  cross  support 4 (occ 6)  size 4  lifted 2  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000782 tierB-001153
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Through $e0 $x1))

;; p201983  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.224  tiers tierB
;;   e.g. tierB-000218 tierB-000616 tierB-001000
(And (Already $e0) (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p201984  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000412 tierB-000688 tierB-001134
(And (Before $e0 $e1) (Member $e0 $v0) (Member $e1 $v1) (Past $e1))

;; p201985  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000372 tierB-000794 tierB-000814
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (LocatedIn $x0 $x1) (Member $x1 $v1))

;; p201986  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000411 tierB-000844 tierB-001017
(And (During $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p201987  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001185 tierB-001754
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Ongoing $e1) (Result $e1 $e0))

;; p201988  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001185 tierB-001754
(And (Experiencer $e0 $v0) (Member $e1 $v1) (Ongoing $e1) (Result $e1 $e0))

;; p201989  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.758  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001185 tierB-001754
(And (Experiencer $e0 $v0) (Member $v0 $v1) (Ongoing $e1) (Result $e1 $e0))

;; p201990  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001517
(And (Experiencer $e0 $x0) (Like $e0 $x1) (Member $e0 $v0) (Member $x0 $v1))

;; p201991  cross  support 4 (occ 7)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001517
(And (Experiencer $e0 $x0) (Like $e0 $x1) (Member $e0 $v0) (Member $x1 $v1))

;; p201992  cross  support 4 (occ 7)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000230 tierB-000831 tierB-001517
(And (Experiencer $e0 $x0) (Like $e0 $x1) (Member $x0 $v0) (Member $x1 $v1))

;; p201993  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.973  tiers tierB
;;   e.g. tierB-000880 tierB-000904 tierB-000917
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v0) (Time $e0 $v1))

;; p201994  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000919 tierB-001384 tierB-001519
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Possession $x0 $x1))

;; p201995  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000144 tierB-000744 tierB-000880
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Time $e0 now))

;; p201996  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000919 tierB-001384 tierB-001519
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Possession $x0 $x1))

;; p201997  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000744 tierB-000826
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Source $e0 $x1))

;; p201998  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.591  tiers tierB
;;   e.g. tierB-000997 tierB-001045 tierB-001557
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Ongoing $e0))

;; p201999  cross  support 4 (occ 7)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000919 tierB-001384 tierB-001519
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Possession $x0 $x1))

;; p202000  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.224  tiers tierB
;;   e.g. tierB-000230 tierB-000744 tierB-000826
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Source $e0 $x1))

;; p202001  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000344 tierB-001563 tierB-001579
(And (Goal $e0 $x0) (Manner $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p202002  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.157  tiers tierB
;;   e.g. tierB-000834 tierB-001037 tierB-001132
(And (Goal $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p202003  cross  support 4 (occ 5)  size 4  lifted 2  nisurp -0.639  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p202004  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-001228 tierB-001250 tierB-001429
(And (GroupOf $x0 $v0) (Instrument $e0 $x0) (Member $e0 $v1) (Past $e0))

;; p202005  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000016 tierB-001132 tierB-001429
(And (GroupOf $x0 $v0) (Instrument $e0 $x0) (Member $e0 $v1) (Patient $e0 $x1))

;; p202006  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.692  tiers tierB
;;   e.g. tierB-000381 tierB-001070 tierB-001299
(And (GroupOf $x0 $v0) (Location $e0 $x0) (Member $e0 $v1) (Past $e0))

;; p202007  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.327  tiers tierB
;;   e.g. tierB-000196 tierB-001434 tierB-001501
(And (GroupOf $x0 $v0) (Manner $e0 $v1) (Past $e0) (Patient $e0 $x0))

;; p202008  cross  support 4 (occ 8)  size 4  lifted 2  nisurp -0.727  tiers tierB
;;   e.g. tierB-000063 tierB-001394 tierB-001816
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0) (Patient $e1 $x0))

;; p202009  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000677 tierB-000779
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0) (Source $e0 $x1))

;; p202010  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.452  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p202011  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.275  tiers tierB  dominated
;;   e.g. tierB-000858 tierB-001394 tierB-001816
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0) (Theme $e1 $e0))

;; p202012  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.452  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x1) (SubsetOf $x1 $x0))

;; p202013  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.275  tiers tierB
;;   e.g. tierB-000858 tierB-001394 tierB-001816
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e1 $x0) (Theme $e0 $e1))

;; p202014  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000338 tierB-000677 tierB-000779
(And (GroupOf $x0 $v0) (Member $x1 $v1) (Patient $e0 $x0) (Source $e0 $x1))

;; p202015  cross  support 4 (occ 6)  size 4  lifted 2  nisurp 0.224  tiers tierB
;;   e.g. tierB-000145 tierB-000730 tierB-000855
(And (Holder $e0 $v0) (Member $x0 $v1) (Past $e0) (Theme $e0 $x0))

;; p202016  cross  support 4 (occ 5)  size 4  lifted 2  nisurp -0.591  tiers tierB  dominated
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(And (Holder $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p202017  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.532  tiers tierB  signal conj-pattern
;;   e.g. tierB-000192 tierB-000654 tierB-000699
(And (Inheritance $v0 $v1) (Member $e0 start) (Member $x0 $v0) (Patient $e0 $x0))

;; p202018  cross  support 4 (occ 6)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000757 tierB-001582 tierB-001692
(And (Instrument $e0 $v0) (Member $x0 $v1) (Past $e0) (Patient $e0 $x0))

;; p202019  cross  support 4 (occ 5)  size 4  lifted 2  nisurp -0.673  tiers tierB
;;   e.g. tierB-000265 tierB-000680 tierB-001295
(And (LocatedIn $x0 $x1) (Member $e0 $v0) (Member $x1 $v1) (Patient $e0 $x0))

;; p202020  cross  support 4 (occ 8)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000202 tierB-000208 tierB-000524
(And (LocatedIn $x0 $x1) (Member $x0 $v0) (Member $x1 $v1) (PartOf $x1 $x2))

;; p202021  cross  support 4 (occ 7)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000202 tierB-000208 tierB-000524
(And (LocatedIn $x0 $x1) (Member $x0 $v0) (Member $x2 $v1) (PartOf $x1 $x2))

;; p202022  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000202 tierB-000208 tierB-000524
(And (LocatedIn $x0 $x1) (Member $x1 $v0) (Member $x2 $v1) (PartOf $x1 $x2))

;; p202023  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.069  tiers tierB
;;   e.g. tierB-000063 tierB-000653 tierB-001077
(And (Location $e0 $v0) (Member $x0 $v1) (Past $e0) (Patient $e0 $x0))

;; p202024  cross  support 4 (occ 6)  size 4  lifted 2  nisurp 0.213  tiers tierB
;;   e.g. tierB-000942 tierB-001257 tierB-001283
(And (Location $e0 $x0) (Member $e0 $v0) (Member $e1 $v1) (Theme $e1 $e0))

;; p202025  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.777  tiers tierB
;;   e.g. tierB-000008 tierB-000036 tierB-000316
(And (Location $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Ongoing $e0))

;; p202026  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000087 tierB-000717 tierB-001515
(And (Manner $e0 $v0) (Member $e1 $v1) (Past $e0) (Theme $e0 $e1))

;; p202027  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.224  tiers tierB
;;   e.g. tierB-000685 tierB-001048 tierB-001446
(And (Manner $e0 $v0) (Member $x0 $v1) (Ongoing $e0) (Patient $e0 $x0))

;; p202028  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.227  tiers tierB
;;   e.g. tierB-000117 tierB-001130 tierB-001557
(And (Member $e0 $v0) (Member $e1 $v1) (Ongoing $e0) (Theme $e0 $e1))

;; p202029  cross  support 4 (occ 5)  size 4  lifted 2  nisurp -0.722  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000087 tierB-001515
(And (Member $e0 $v0) (Member $e1 $v1) (Past $e0) (Theme $e1 $e0))

;; p202030  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.722  tiers tierB
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(And (Member $e0 $v0) (Member $e1 $v1) (Theme $e0 $e1) (Theme $e1 $x0))

;; p202031  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.722  tiers tierB
;;   e.g. tierB-000162 tierB-000636 tierB-001149
(And (Member $e0 $v0) (Member $e1 $v1) (Theme $e0 $x0) (Theme $e1 $x0))

;; p202032  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.435  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-000252 tierB-000730
(And (Member $e0 $v0) (Member $e1 $v1) (Theme $e0 $x0) (To $e0 $e1))

;; p202033  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.636  tiers tierB
;;   e.g. tierB-000229 tierB-000663 tierB-001243
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x1 $v1) (Theme $e0 $x0))

;; p202034  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000456 tierB-000485 tierB-000677
(And (Member $e0 $v0) (Member $x0 $v1) (Ongoing $e0) (Source $e0 $x0))

;; p202035  cross  support 4 (occ 6)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(And (Member $e0 $v0) (Member $x0 $v1) (Over $e0 $x0) (Past $e0))

;; p202036  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.030  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-001243 tierB-001586
(And (Member $e0 $v0) (Member $x0 $v1) (PartOf $x0 $x1) (Theme $e0 $x0))

;; p202037  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.001  tiers tierB
;;   e.g. tierB-000229 tierB-001243 tierB-001586
(And (Member $e0 $v0) (Member $x0 $v1) (PartOf $x1 $x0) (Theme $e0 $x1))

;; p202038  cross  support 4 (occ 4)  size 4  lifted 2  nisurp -0.242  tiers tierB  dominated
;;   e.g. tierB-000103 tierB-000725 tierB-001366
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Source $e0 $x1))

;; p202039  cross  support 4 (occ 5)  size 4  lifted 2  nisurp -0.509  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001446 tierB-001515
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Theme $e0 $e1))

;; p202040  cross  support 4 (occ 5)  size 4  lifted 2  nisurp -0.509  tiers tierB
;;   e.g. tierB-000265 tierB-001446 tierB-001515
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e1 $x0) (Theme $e1 $e0))

;; p202041  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.089  tiers tierB  dominated
;;   e.g. tierB-000400 tierB-001325 tierB-001540
(And (Member $e0 $v0) (Member $x0 $v1) (Source $e0 $x0) (Theme $e0 $x1))

;; p202042  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000400 tierB-001325 tierB-001540
(And (Member $e0 $v0) (Member $x0 $v1) (Source $e0 $x1) (Theme $e0 $x0))

;; p202043  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-000252 tierB-000730
(And (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0) (To $e0 $e1))

;; p202044  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000229 tierB-000252 tierB-000730
(And (Member $e0 $v0) (Member $x0 $v1) (Theme $e1 $x0) (To $e1 $e0))

;; p202045  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.758  tiers tierB
;;   e.g. tierB-000325 tierB-001185 tierB-001754
(And (Member $e0 $v1) (Member $v0 $v1) (Ongoing $e1) (Result $e1 $e0))

;; p202046  cross  support 4 (occ 4)  size 4  lifted 2  nisurp 0.224  tiers tierB  signal conj-pattern
;;   e.g. tierB-000370 tierB-000748 tierB-000890
(And (Member $e0 get) (Member $x0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p202047  cross  support 4 (occ 5)  size 4  lifted 2  nisurp -0.242  tiers tierB
;;   e.g. tierB-000103 tierB-000725 tierB-001366
(And (Member $x0 $v0) (Member $x1 $v1) (Patient $e0 $x0) (Source $e0 $x1))

;; p202048  cross  support 4 (occ 7)  size 4  lifted 2  nisurp 0.301  tiers tierB
;;   e.g. tierB-000400 tierB-001325 tierB-001540
(And (Member $x0 $v0) (Member $x1 $v1) (Source $e0 $x0) (Theme $e0 $x1))

;; p202049  cross  support 4 (occ 5)  size 4  lifted 2  nisurp 0.108  tiers tierB
;;   e.g. tierB-000571 tierB-001486 tierB-001762
(And (Member $x0 $v0) (Past $e0) (Theme $e0 $x0) (Time $e0 $v1))

;; p202050  cross  support 4 (occ 7)  size 4  lifted 3  nisurp 0.456  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000075 tierB-000947
(And (Agent $e0 $v0) (Agent $e1 $v0) (Manner $e0 $v1) (Member $e0 $v2))

;; p202051  cross  support 4 (occ 7)  size 4  lifted 3  nisurp 0.456  tiers tierB
;;   e.g. tierB-000012 tierB-000075 tierB-000947
(And (Agent $e0 $v0) (Agent $e1 $v0) (Manner $e0 $v1) (Member $e1 $v2))

;; p202052  cross  support 4 (occ 5)  size 4  lifted 3  nisurp 0.406  tiers tierB
;;   e.g. tierB-000215 tierB-001023 tierB-001079
(And (Agent $e0 $v0) (GroupOf $x0 $v1) (Inheritance $v1 $v2) (Theme $e0 $x0))

;; p202053  cross  support 4 (occ 6)  size 4  lifted 3  nisurp -0.353  tiers tierB
;;   e.g. tierB-000249 tierB-000581 tierB-000863
(And (Agent $e0 $v0) (Inheritance $v1 $v2) (Member $x0 $v1) (Patient $e0 $x0))

;; p202054  cross  support 4 (occ 5)  size 4  lifted 3  nisurp -0.406  tiers tierB
;;   e.g. tierB-000281 tierB-000571 tierB-001595
(And (Agent $e0 $v0) (Inheritance $v1 $v2) (Member $x0 $v1) (Theme $e0 $x0))

;; p202055  cross  support 4 (occ 8)  size 4  lifted 3  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000392 tierB-000444 tierB-000576
(And (Agent $e0 $v0) (Instrument $e0 $x0) (Member $e0 $v1) (Member $x0 $v2))

;; p202056  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000389 tierB-000466 tierB-000883
(And (Agent $e0 $v0) (Manner $e0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p202057  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.212  tiers tierB
;;   e.g. tierB-000138 tierB-000400 tierB-001325
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Source $e0 $x0))

;; p202058  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000622
(And (Agent $e0 $v0) (Member $e0 $v1) (Theme $e0 $e1) (Theme $e1 $v2))

;; p202059  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.416  tiers tierB
;;   e.g. tierB-000148 tierB-000203 tierB-001185
(And (Agent $e0 $v0) (Member $e0 $v2) (Member $v0 $v1) (Ongoing $e0))

;; p202060  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.133  tiers tierB
;;   e.g. tierB-000128 tierB-000137 tierB-001079
(And (Agent $e0 $v0) (Member $e0 $v2) (Member $v0 $v1) (Theme $e0 $x0))

;; p202061  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000622
(And (Agent $e0 $v0) (Member $e1 $v1) (Theme $e0 $e1) (Theme $e1 $v2))

;; p202062  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000238 tierB-000598 tierB-001528
(And (Agent $e0 $x0) (Every $e0 <num> $v0) (Member $e0 $v1) (Member $x0 $v2))

;; p202063  cross  support 4 (occ 5)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-001245 tierB-001433 tierB-001618
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Instrument $e0 $v1) (Member $e0 $v2))

;; p202064  cross  support 4 (occ 6)  size 4  lifted 3  nisurp -0.111  tiers tierB
;;   e.g. tierB-000268 tierB-000715 tierB-001098
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v2) (Theme $e0 $v0))

;; p202065  cross  support 4 (occ 5)  size 4  lifted 3  nisurp -0.673  tiers tierB
;;   e.g. tierB-000688 tierB-000770 tierB-000783
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past (Member $x0 $v2)))

;; p202066  cross  support 4 (occ 6)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000354 tierB-000598 tierB-001275
(And (Agent $e0 $x0) (Member $x0 $v0) (Theme $e0 $v1) (Time $e0 $v2))

;; p202067  cross  support 4 (occ 4)  size 4  lifted 3  nisurp -0.509  tiers tierB  dominated
;;   e.g. tierB-000085 tierB-000352 tierB-001476
(And (Degree $x0 $v0 $v1) (Member $e0 $v2) (Member $x0 $v0) (Patient $e0 $x0))

;; p202068  cross  support 4 (occ 5)  size 4  lifted 3  nisurp 0.335  tiers tierB
;;   e.g. tierB-000114 tierB-000496 tierB-000534
(And (Experiencer $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Member $e1 $v2))

;; p202069  cross  support 4 (occ 5)  size 4  lifted 3  nisurp 0.382  tiers tierB
;;   e.g. tierB-000107 tierB-000114 tierB-000534
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Theme $e0 $e1))

;; p202070  cross  support 4 (occ 4)  size 4  lifted 3  nisurp -0.052  tiers tierB
;;   e.g. tierB-000654 tierB-000688 tierB-001332
(And (Experiencer $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0) (Past (Member $x0 $v2)))

;; p202071  cross  support 4 (occ 6)  size 4  lifted 3  nisurp -0.723  tiers tierB
;;   e.g. tierB-000602 tierB-000808 tierB-001573
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e0 $v1) (Member $x0 $v2))

;; p202072  cross  support 4 (occ 7)  size 4  lifted 3  nisurp -0.680  tiers tierB
;;   e.g. tierB-000654 tierB-000808 tierB-001625
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past (Member $x0 $v2)))

;; p202073  cross  support 4 (occ 4)  size 4  lifted 3  nisurp -0.473  tiers tierB
;;   e.g. tierB-000040 tierB-001453 tierB-001534
(And (Goal $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p202074  cross  support 4 (occ 4)  size 4  lifted 3  nisurp -0.586  tiers tierB
;;   e.g. tierB-000019 tierB-000796 tierB-001196
(And (GroupOf $x0 $v0) (LocatedIn $x0 $x1) (Member $x1 $v1) (Member $x1 $v2))

;; p202075  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.171  tiers tierB
;;   e.g. tierB-000398 tierB-001426 tierB-001800
(And (GroupOf $x0 $v0) (Manner $e0 $v1) (Member $e0 $v2) (Theme $e0 $x0))

;; p202076  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.068  tiers tierB
;;   e.g. tierB-000832 tierB-000964 tierB-001814
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0) (Time $e0 $v2))

;; p202077  cross  support 4 (occ 6)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000485 tierB-000769 tierB-001046
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Recipient $e0 $x0) (Theme $e0 $v2))

;; p202078  cross  support 4 (occ 4)  size 4  lifted 3  nisurp -0.515  tiers tierB
;;   e.g. tierB-000189 tierB-000291 tierB-000980
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Location $e0 $x0) (Member $x0 $v0))

;; p202079  cross  support 4 (occ 4)  size 4  lifted 3  nisurp -0.379  tiers tierB
;;   e.g. tierB-000627 tierB-001605 tierB-001670
(And (Inheritance $v0 $v1) (Inheritance $v2 $v1) (Member $x0 $v0) (Member $x1 $v2))

;; p202080  cross  support 4 (occ 5)  size 4  lifted 3  nisurp -0.557  tiers tierB
;;   e.g. tierB-001276 tierB-001519 tierB-001716
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Member $x1 $v2) (Possession $x0 $x1))

;; p202081  cross  support 4 (occ 6)  size 4  lifted 3  nisurp 0.474  tiers tierB
;;   e.g. tierB-000571 tierB-001171 tierB-001486
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Theme $e0 $x0) (Time $e0 $v2))

;; p202082  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.242  tiers tierB
;;   e.g. tierB-000202 tierB-000501 tierB-000541
(And (LocatedIn $x0 $x1) (Member $x0 $v0) (Member $x1 $v1) (Member $x1 $v2))

;; p202083  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.224  tiers tierB
;;   e.g. tierB-000096 tierB-000906 tierB-001283
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $v2))

;; p202084  cross  support 4 (occ 6)  size 4  lifted 3  nisurp 0.074  tiers tierB
;;   e.g. tierB-000292 tierB-000706 tierB-001257
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $v2))

;; p202085  cross  support 4 (occ 4)  size 4  lifted 3  nisurp 0.205  tiers tierB
;;   e.g. tierB-000075 tierB-001446 tierB-001496
(And (Manner $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Theme $e1 $e0))

;; p202086  cross  support 4 (occ 4)  size 4  lifted 3  nisurp -0.743  tiers tierB  dominated
;;   e.g. tierB-000880 tierB-000904 tierB-000917
(And (Member $e0 $v0) (Member $x0 $v0) (Member $x0 $v1) (Time $e0 $v2))

;; p202087  cross  support 4 (occ 5)  size 4  lifted 3  nisurp -0.317  tiers tierB
;;   e.g. tierB-000783 tierB-000808 tierB-001164
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Past (Member $x0 $v0)))

;; p202088  cross  support 4 (occ 4)  size 4  lifted 3  nisurp -0.595  tiers tierB
;;   e.g. tierB-000681 tierB-000695 tierB-001141
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Stimulus $e0 $x0))

;; p202089  cross  support 4 (occ 5)  size 4  lifted 3  nisurp 0.315  tiers tierB
;;   e.g. tierB-000139 tierB-001677 tierB-001803
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Possession $x0 $v2))

;; p202090  cross  support 4 (occ 6)  size 4  lifted 4  nisurp 0.298  tiers tierB
;;   e.g. tierB-000539 tierB-000840 tierB-001858
(And (Agent $e0 $v0) (Inheritance $v1 $v2) (Member $e0 $v3) (Patient $e0 $v1))

;; p202091  cross  support 4 (occ 10)  size 3  lifted 0  nisurp -0.097  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001275 tierB-001735
(And (Agent $e0 $x0) (Agent $e1 $x0) (Location $e0 $x1))

;; p202092  cross  support 4 (occ 6)  size 3  lifted 0  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 start))

;; p202093  cross  support 4 (occ 11)  size 3  lifted 0  nisurp -0.152  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000258 tierB-000942
(And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $x1))

;; p202094  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.851  tiers tierB  dominated
;;   e.g. tierB-000587 tierB-001125 tierB-001433
(And (Agent $e0 $x0) (GroupOf $x0 child) (Ongoing $e0))

;; p202095  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.512  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Member $e1 start) (Theme $e1 $e0))

;; p202096  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000073 tierB-000381 tierB-001183
(And (Agent $e0 $x0) (Member $x0 cat) (Past $e0))

;; p202097  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.795  tiers tierB  dominated
;;   e.g. tierB-001182 tierB-001773 tierB-001803
(And (Agent $e0 $x0) (Member $x0 man) (Patient $e0 $x1))

;; p202098  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.797  tiers tierB  dominated
;;   e.g. tierB-001251 tierB-001693 tierB-001762
(And (Agent $e0 $x0) (Member $x1 new) (Theme $e0 $x1))

;; p202099  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.810  tiers tierB  dominated
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(And (Cardinality $x0 <num>) (Member $e0 have) (Theme $e0 $x0))

;; p202100  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.342  tiers tierB  dominated
;;   e.g. tierB-000133 tierB-000379 tierB-000797
(And (Cardinality $x0 <num>) (Past $e0) (Theme $e0 $x0))

;; p202101  cross  support 4 (occ 6)  size 3  lifted 0  nisurp 0.305  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-001625
(And (Experiencer $e0 $x0) (Experiencer $e1 $x0) (Past $e0))

;; p202102  cross  support 4 (occ 6)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000047 tierB-000502 tierB-001041
(And (Location $e0 $x0) (Member $x0 table) (Past $e0))

;; p202103  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.991  tiers tierB  signal conj-pattern
;;   e.g. tierB-000056 tierB-001487 tierB-001523
(And (Member $e0 open) (Member $x0 door) (Patient $e0 $x0))

;; p202104  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.635  tiers tierB  dominated
;;   e.g. tierB-001168 tierB-001251 tierB-001693
(And (Member $x0 new) (Past $e0) (Theme $e0 $x0))

;; p202105  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.635  tiers tierB  dominated
;;   e.g. tierB-000805 tierB-001384 tierB-001894
(And (Member $x0 sound) (Past $e0) (Patient $e0 $x0))

;; p202106  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000409 tierB-001070 tierB-001262
(And (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))

;; p202107  cross  support 4 (occ 5)  size 3  lifted 0  nisurp -0.708  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000087 tierB-001515
(And (Past $e0) (Past $e1) (Theme $e0 $e1))

;; p202108  cross  support 4 (occ 4)  size 3  lifted 0  nisurp 0.690  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (Past $e0) (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p202109  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000400 tierB-000547
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 try))

;; p202110  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.293  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Experiencer $e1 $x0) (Patient $e0 $x0))

;; p202111  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.375  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Experiencer $e1 $x0) (Result $e0 $e1))

;; p202112  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000400 tierB-000547
(And (Agent $e0 $v0) (Member $e1 try) (Theme $e1 $e0))

;; p202113  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.402  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Agent $e0 $v0) (Ongoing $e1) (Theme $e0 $e1))

;; p202114  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.489  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000147 tierB-000252
(And (Agent $e0 $v0) (Past $e1) (To $e1 $e0))

;; p202115  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-000712 tierB-001663
(And (Agent $e0 $x0) (For $e0 $x1) (Member $x1 $v0))

;; p202116  cross  support 4 (occ 6)  size 3  lifted 1  nisurp -0.187  tiers tierB  dominated
;;   e.g. tierB-000772 tierB-001035 tierB-001618
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (GroupOf $x1 $v0))

;; p202117  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.741  tiers tierB  signal conj-pattern
;;   e.g. tierB-000648 tierB-001125 tierB-001433
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 play))

;; p202118  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-001316 tierB-001457 tierB-001530
(And (Agent $e0 $x0) (GroupOf $x0 boy) (Member $e0 $v0))

;; p202119  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000387 tierB-000656 tierB-000712
(And (Agent $e0 $x0) (GroupOf $x0 student) (Member $e0 $v0))

;; p202120  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000073 tierB-000381 tierB-001183
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 cat))

;; p202121  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000762 tierB-000853 tierB-001130
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 company))

;; p202122  cross  support 4 (occ 6)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000768 tierB-001254
(And (Agent $e0 $x0) (Member $e0 contain) (Member $x0 $v0))

;; p202123  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000469 tierB-000470 tierB-001130
(And (Agent $e0 $x0) (Member $e0 try) (Member $x0 $v0))

;; p202124  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000268 tierB-000850 tierB-001098
(And (Agent $e0 $x0) (Member $e0 use) (Member $x0 $v0))

;; p202125  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.224  tiers tierB  signal conj-pattern
;;   e.g. tierB-000520 tierB-001205 tierB-001720
(And (Agent $e0 $x0) (Member $e0 watch) (Member $x0 $v0))

;; p202126  cross  support 4 (occ 4)  size 3  lifted 1  nisurp -0.061  tiers tierB  dominated
;;   e.g. tierB-000256 tierB-000747 tierB-001754
(And (Agent $e0 $x0) (Member $x0 $v0) (Result $e0 $e1))

;; p202127  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000500 tierB-000782 tierB-001153
(And (Agent $e0 $x0) (Member $x0 $v0) (Through $e0 $x1))

;; p202128  cross  support 4 (occ 6)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(And (Agent $e0 $x0) (Member $x1 $v0) (Over $e0 $x1))

;; p202129  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.634  tiers tierB  dominated
;;   e.g. tierB-000288 tierB-000470 tierB-000485
(And (Agent $e0 $x0) (Theme $e0 $e1) (Theme $e1 $v0))

;; p202130  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000218 tierB-000616 tierB-001000
(And (Already $e0) (Member $x0 $v0) (Patient $e0 $x0))

;; p202131  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001134
(And (Before $e0 $e1) (Member $e0 $v0) (Past $e1))

;; p202132  cross  support 4 (occ 4)  size 3  lifted 1  nisurp -0.954  tiers tierB
;;   e.g. tierB-000267 tierB-000697 tierB-001362
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Member $x1 $v0))

;; p202133  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000372 tierB-000794 tierB-000814
(And (Cardinality $x0 <num>) (LocatedIn $x0 $x1) (Member $x1 $v0))

;; p202134  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000411 tierB-000844 tierB-001017
(And (During $e0 $x0) (Member $x0 $v0) (Past $e0))

;; p202135  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.758  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001185 tierB-001754
(And (Experiencer $e0 $v0) (Ongoing $e1) (Result $e1 $e0))

;; p202136  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001517
(And (Experiencer $e0 $x0) (Like $e0 $x1) (Member $x0 $v0))

;; p202137  cross  support 4 (occ 7)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001517
(And (Experiencer $e0 $x0) (Like $e0 $x1) (Member $x1 $v0))

;; p202138  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.471  tiers tierB  dominated
;;   e.g. tierB-000919 tierB-001384 tierB-001519
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Possession $x0 $x1))

;; p202139  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.224  tiers tierB  signal conj-pattern
;;   e.g. tierB-001003 tierB-001334 tierB-001753
(And (Experiencer $e0 $x0) (Member $e0 sleep) (Member $x0 $v0))

;; p202140  cross  support 4 (occ 6)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000744 tierB-000880
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Time $e0 now))

;; p202141  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000919 tierB-001384 tierB-001519
(And (Experiencer $e0 $x0) (Member $x1 $v0) (Possession $x0 $x1))

;; p202142  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000744 tierB-000826
(And (Experiencer $e0 $x0) (Member $x1 $v0) (Source $e0 $x1))

;; p202143  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000324 tierB-000929 tierB-001044
(And (Goal $e0 $x0) (Member $e0 walk) (Member $x0 $v0))

;; p202144  cross  support 4 (occ 4)  size 3  lifted 1  nisurp -0.069  tiers tierB  dominated
;;   e.g. tierB-000834 tierB-001037 tierB-001132
(And (Goal $e0 $x0) (Member $x1 $v0) (Theme $e0 $x1))

;; p202145  cross  support 4 (occ 5)  size 3  lifted 1  nisurp -0.315  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (Patient $e0 $x0))

;; p202146  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000799 tierB-001111 tierB-001628
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (ProportionOf $x0 $x1 most))

;; p202147  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.534  tiers tierB  dominated
;;   e.g. tierB-001228 tierB-001250 tierB-001429
(And (GroupOf $x0 $v0) (Instrument $e0 $x0) (Past $e0))

;; p202148  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.586  tiers tierB  dominated
;;   e.g. tierB-000016 tierB-001132 tierB-001429
(And (GroupOf $x0 $v0) (Instrument $e0 $x0) (Patient $e0 $x1))

;; p202149  cross  support 4 (occ 4)  size 3  lifted 1  nisurp -0.416  tiers tierB  dominated
;;   e.g. tierB-000381 tierB-001070 tierB-001299
(And (GroupOf $x0 $v0) (Location $e0 $x0) (Past $e0))

;; p202150  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.637  tiers tierB  signal conj-pattern
;;   e.g. tierB-000393 tierB-000412 tierB-001047
(And (GroupOf $x0 $v0) (Member $e0 kill) (Patient $e0 $x0))

;; p202151  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.586  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000677 tierB-000779
(And (GroupOf $x0 $v0) (Patient $e0 $x0) (Source $e0 $x1))

;; p202152  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.275  tiers tierB  dominated
;;   e.g. tierB-000858 tierB-001394 tierB-001816
(And (GroupOf $x0 $v0) (Patient $e0 $x0) (Theme $e1 $e0))

;; p202153  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.452  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (GroupOf $x0 $v0) (Patient $e0 $x1) (SubsetOf $x1 $x0))

;; p202154  cross  support 4 (occ 5)  size 3  lifted 1  nisurp -0.224  tiers tierB  dominated
;;   e.g. tierB-000665 tierB-000797 tierB-001264
(And (Holder $e0 $x0) (Member $x0 $v0) (Past $e0))

;; p202155  cross  support 4 (occ 5)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000680 tierB-001295
(And (LocatedIn $x0 $x1) (Member $e0 $v0) (Patient $e0 $x0))

;; p202156  cross  support 4 (occ 7)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000202 tierB-000208 tierB-000524
(And (LocatedIn $x0 $x1) (Member $x0 $v0) (PartOf $x1 $x2))

;; p202157  cross  support 4 (occ 5)  size 3  lifted 1  nisurp -0.379  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000680 tierB-001295
(And (LocatedIn $x0 $x1) (Member $x1 $v0) (Patient $e0 $x0))

;; p202158  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000202 tierB-000208 tierB-000524
(And (LocatedIn $x0 $x1) (Member $x2 $v0) (PartOf $x1 $x2))

;; p202159  cross  support 4 (occ 6)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000047 tierB-000502 tierB-001041
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 table))

;; p202160  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(And (Location $e0 $x0) (Member $e0 walk) (Member $x0 $v0))

;; p202161  cross  support 4 (occ 6)  size 3  lifted 1  nisurp 0.213  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001257 tierB-001283
(And (Location $e0 $x0) (Member $e1 $v0) (Theme $e1 $e0))

;; p202162  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 2.031  tiers tierB
;;   e.g. tierB-000101 tierB-000188 tierB-001078
(And (Member $e0 $v0) (Member $e1 $v0) (Member $e2 $v0))

;; p202163  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Member $e0 $v0) (Member $e1 turn) (Result $e1 $e0))

;; p202164  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000282 tierB-000404 tierB-001304
(And (Member $e0 $v0) (Member $e1 use) (To $e1 $e0))

;; p202165  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.468  tiers tierB  signal conj-pattern
;;   e.g. tierB-000441 tierB-001005 tierB-001687
(And (Member $e0 $v0) (Member $x0 house) (Theme $e0 $x0))

;; p202166  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000176 tierB-000277 tierB-001476
(And (Member $e0 $v0) (Member $x0 tree) (Patient $e0 $x0))

;; p202167  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000409 tierB-001070 tierB-001262
(And (Member $e0 $v0) (Of $x0 $x1) (Theme $e0 $x0))

;; p202168  cross  support 4 (occ 4)  size 3  lifted 1  nisurp -0.227  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-001130 tierB-001557
(And (Member $e0 $v0) (Ongoing $e1) (Theme $e1 $e0))

;; p202169  cross  support 4 (occ 5)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000087 tierB-001515
(And (Member $e0 $v0) (Past $e1) (Theme $e0 $e1))

;; p202170  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.452  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (Member $e0 $v0) (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p202171  cross  support 4 (occ 4)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(And (Member $e0 $v0) (Theme $e0 $e1) (Theme $e1 $x0))

;; p202172  cross  support 4 (occ 8)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000162 tierB-000636 tierB-001149
(And (Member $e0 $v0) (Theme $e0 $x0) (Theme $e1 $x0))

;; p202173  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.435  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-000252 tierB-000730
(And (Member $e0 $v0) (Theme $e1 $x0) (To $e1 $e0))

;; p202174  cross  support 4 (occ 7)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000352 tierB-000740 tierB-001582
(And (Member $e0 become) (Member $x0 $v0) (Patient $e0 $x0))

;; p202175  cross  support 4 (occ 7)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000367 tierB-000368 tierB-000849
(And (Member $e0 buy) (Member $x0 $v0) (Theme $e0 $x0))

;; p202176  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000636 tierB-000852 tierB-001342
(And (Member $e0 capture) (Member $x0 $v0) (Theme $e0 $x0))

;; p202177  cross  support 4 (occ 7)  size 3  lifted 1  nisurp -0.087  tiers tierB  signal conj-pattern
;;   e.g. tierB-000609 tierB-001306 tierB-001476
(And (Member $e0 fall) (Member $x0 $v0) (Patient $e0 $x0))

;; p202178  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.224  tiers tierB  signal conj-pattern
;;   e.g. tierB-000326 tierB-000975 tierB-001168
(And (Member $e0 sell) (Member $x0 $v0) (Theme $e0 $x0))

;; p202179  cross  support 4 (occ 4)  size 3  lifted 1  nisurp -0.309  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-000663 tierB-001243
(And (Member $x0 $v0) (Member $x1 $v0) (Theme $e0 $x0))

;; p202180  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000485 tierB-000677
(And (Member $x0 $v0) (Ongoing $e0) (Source $e0 $x0))

;; p202181  cross  support 4 (occ 6)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(And (Member $x0 $v0) (Over $e0 $x0) (Past $e0))

;; p202182  cross  support 4 (occ 4)  size 3  lifted 1  nisurp -0.005  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-001243 tierB-001586
(And (Member $x0 $v0) (PartOf $x1 $x0) (Theme $e0 $x1))

;; p202183  cross  support 4 (occ 4)  size 3  lifted 1  nisurp -0.242  tiers tierB  dominated
;;   e.g. tierB-000103 tierB-000725 tierB-001366
(And (Member $x0 $v0) (Patient $e0 $x0) (Source $e0 $x1))

;; p202184  cross  support 4 (occ 5)  size 3  lifted 1  nisurp -0.069  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001446 tierB-001515
(And (Member $x0 $v0) (Patient $e0 $x0) (Theme $e0 $e1))

;; p202185  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.089  tiers tierB  dominated
;;   e.g. tierB-000400 tierB-001325 tierB-001540
(And (Member $x0 $v0) (Source $e0 $x0) (Theme $e0 $x1))

;; p202186  cross  support 4 (occ 5)  size 3  lifted 1  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000400 tierB-001325 tierB-001540
(And (Member $x0 $v0) (Source $e0 $x1) (Theme $e0 $x0))

;; p202187  cross  support 4 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-000252 tierB-000730
(And (Member $x0 $v0) (Theme $e0 $x0) (To $e0 $e1))

;; p202188  cross  support 4 (occ 7)  size 3  lifted 2  nisurp 0.456  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000075 tierB-000947
(And (Agent $e0 $v0) (Agent $e1 $v0) (Manner $e0 $v1))

;; p202189  cross  support 4 (occ 8)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000392 tierB-000444 tierB-000576
(And (Agent $e0 $v0) (Instrument $e0 $x0) (Member $x0 $v1))

;; p202190  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.416  tiers tierB  dominated
;;   e.g. tierB-000148 tierB-000203 tierB-001185
(And (Agent $e0 $v0) (Member $v0 $v1) (Ongoing $e0))

;; p202191  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000128 tierB-000137 tierB-001079
(And (Agent $e0 $v0) (Member $v0 $v1) (Theme $e0 $x0))

;; p202192  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.212  tiers tierB  dominated
;;   e.g. tierB-000138 tierB-000400 tierB-001325
(And (Agent $e0 $v0) (Member $x0 $v1) (Source $e0 $x0))

;; p202193  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.755  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000622
(And (Agent $e0 $v0) (Theme $e0 $e1) (Theme $e1 $v1))

;; p202194  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000238 tierB-000598 tierB-001528
(And (Agent $e0 $x0) (Every $e0 <num> $v0) (Member $x0 $v1))

;; p202195  cross  support 4 (occ 5)  size 3  lifted 2  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-001245 tierB-001433 tierB-001618
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Instrument $e0 $v1))

;; p202196  cross  support 4 (occ 4)  size 3  lifted 2  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000688 tierB-000770 tierB-000783
(And (Agent $e0 $x0) (Member $e0 $v0) (Past (Member $x0 $v1)))

;; p202197  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001134
(And (Before $e0 $e1) (Member $e0 $v0) (Member $e1 $v1))

;; p202198  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-001130 tierB-001222 tierB-001531
(And (Before $x0 $e0) (Member $e0 $v0) (Member $x0 $v1))

;; p202199  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000411 tierB-000844 tierB-001017
(And (During $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p202200  cross  support 4 (occ 5)  size 3  lifted 2  nisurp 0.382  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000114 tierB-000534
(And (Experiencer $e0 $v0) (Member $e1 $v1) (Theme $e0 $e1))

;; p202201  cross  support 4 (occ 5)  size 3  lifted 2  nisurp -0.486  tiers tierB  dominated
;;   e.g. tierB-000654 tierB-000808 tierB-001625
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Past (Member $x0 $v1)))

;; p202202  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000002 tierB-000239 tierB-000938
(And (For $e0 $e1) (Member $e0 $v0) (Member $e1 $v1))

;; p202203  cross  support 4 (occ 5)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000308 tierB-000555 tierB-001455
(And (For $x0 $e0) (Member $e0 $v0) (Member $x0 $v1))

;; p202204  cross  support 4 (occ 4)  size 3  lifted 2  nisurp -0.473  tiers tierB
;;   e.g. tierB-000834 tierB-000909 tierB-000958
(And (Goal $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1))

;; p202205  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000370 tierB-000797 tierB-001485
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Only $x0 $e0))

;; p202206  cross  support 4 (occ 5)  size 3  lifted 2  nisurp 0.275  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000769 tierB-001046
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Recipient $e0 $x0))

;; p202207  cross  support 4 (occ 6)  size 3  lifted 2  nisurp -0.379  tiers tierB
;;   e.g. tierB-000246 tierB-000975 tierB-001667
(And (GroupOf $x0 $v0) (Member $x1 $v1) (Possession $x0 $x1))

;; p202208  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.068  tiers tierB  dominated
;;   e.g. tierB-000832 tierB-000964 tierB-001814
(And (GroupOf $x0 $v0) (Patient $e0 $x0) (Time $e0 $v1))

;; p202209  cross  support 4 (occ 6)  size 3  lifted 2  nisurp 0.689  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000769 tierB-001046
(And (GroupOf $x0 $v0) (Recipient $e0 $x0) (Theme $e0 $v1))

;; p202210  cross  support 4 (occ 4)  size 3  lifted 2  nisurp -0.286  tiers tierB  dominated
;;   e.g. tierB-001276 tierB-001519 tierB-001716
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Possession $x0 $x1))

;; p202211  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000096 tierB-000906 tierB-001283
(And (Location $e0 $x0) (Member $x0 $v0) (Patient $e0 $v1))

;; p202212  cross  support 4 (occ 6)  size 3  lifted 2  nisurp 0.074  tiers tierB  dominated
;;   e.g. tierB-000292 tierB-000706 tierB-001257
(And (Location $e0 $x0) (Member $x0 $v0) (Theme $e0 $v1))

;; p202213  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.205  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-001446 tierB-001496
(And (Manner $e0 $v0) (Member $e1 $v1) (Theme $e1 $e0))

;; p202214  cross  support 4 (occ 4)  size 3  lifted 2  nisurp -0.585  tiers tierB  dominated
;;   e.g. tierB-000880 tierB-000904 tierB-000917
(And (Member $e0 $v0) (Member $x0 $v0) (Time $e0 $v1))

;; p202215  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.069  tiers tierB
;;   e.g. tierB-000201 tierB-001589 tierB-001605
(And (Member $e0 $v0) (Member $x0 $v1) (On $e0 $x0))

;; p202216  cross  support 4 (occ 4)  size 3  lifted 2  nisurp 0.213  tiers tierB  dominated
;;   e.g. tierB-000139 tierB-001677 tierB-001803
(And (Member $e0 $v0) (Patient $e0 $x0) (Possession $x0 $v1))

;; p202217  cross  support 4 (occ 12)  size 3  lifted 2  nisurp 0.240  tiers tierB
;;   e.g. tierB-000012 tierB-001275 tierB-001773
(And (Member $e0 $v0) (Time $e0 $v1) (Time $e1 $v1))

;; p202218  cross  support 4 (occ 5)  size 3  lifted 2  nisurp 2.416  tiers tierB
;;   e.g. tierB-000024 tierB-000376 tierB-001738
(And (Member $x0 $v0) (Member $x0 $v1) (Member $x1 $v1))

;; p202219  cross  support 4 (occ 5)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-001070 tierB-001262 tierB-001423
(And (Member $x0 $v0) (Member $x1 $v1) (Of $x0 $x1))

;; p202220  cross  support 4 (occ 6)  size 3  lifted 3  nisurp 0.298  tiers tierB  dominated
;;   e.g. tierB-000539 tierB-000840 tierB-001858
(And (Agent $e0 $v0) (Inheritance $v1 $v2) (Patient $e0 $v1))

;; p202221  cross  support 4 (occ 4)  size 3  lifted 3  nisurp 0.558  tiers tierB
;;   e.g. tierB-001504 tierB-001627 tierB-001683
(And (Experiencer $e0 $v0) (Member $v0 $v1) (Member $v0 $v2))

;; p202222  cross  support 4 (occ 6)  size 3  lifted 3  nisurp 1.572  tiers tierB
;;   e.g. tierB-000975 tierB-001120 tierB-001357
(And (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Member $x0 $v2))

;; p202223  cross  support 4 (occ 4)  size 3  lifted 3  nisurp 1.329  tiers tierB  dominated
;;   e.g. tierB-000627 tierB-001605 tierB-001670
(And (Inheritance $v0 $v1) (Inheritance $v2 $v1) (Member $x0 $v0))

;; p202224  cross  support 4 (occ 4)  size 3  lifted 3  nisurp 1.329  tiers tierB  dominated
;;   e.g. tierB-000627 tierB-001605 tierB-001670
(And (Inheritance $v0 $v1) (Inheritance $v2 $v1) (Member $x0 $v2))

;; p202225  cross  support 4 (occ 9)  size 3  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000831 tierB-001627 tierB-001854
(And (Member $v0 $v1) (Member $x0 $v2) (Possession $x0 $v0))

;; p202226  cross  support 4 (occ 4)  size 3  lifted 4  nisurp 0.517  tiers tierB
;;   e.g. tierB-000008 tierB-001500 tierB-001847
(And (Degree $x0 $v0 $v1) (Inheritance $v2 $v3) (Member $x0 $v2))

;; p202227  cross  support 4 (occ 6)  size 2  lifted 1  nisurp 0.240  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-001275 tierB-001773
(And (Time $e0 $v0) (Time $e1 $v0))

;; p202228  cross  support 4 (occ 4)  size 2  lifted 2  nisurp 59.099  tiers tierB
;;   e.g. tierB-000791 tierB-001015 tierB-001866
(And (Inheritance $v0 $v1) (Member $e0 $v0))

;; p202229  cross  support 4 (occ 6)  size 2  lifted 2  nisurp 0.593  tiers tierB  dominated
;;   e.g. tierB-000831 tierB-001627 tierB-001854
(And (Member $v0 $v1) (Possession $x0 $v0))

;; p202230  kindlevel  support 4 (occ 7)  size 4  lifted 5  nisurp 0.591  tiers tierB
;;   e.g. tierB-000197 tierB-001585 tierB-001608
(And (Inheritance $v0 $v1) (Inheritance $v2 $v3) (Inheritance $v2 (can $v0)) (Patient $v0 $v4))

;; p202231  kindlevel  support 4 (occ 4)  size 3  lifted 4  nisurp 0.752  tiers tierB
;;   e.g. tierB-000266 tierB-001368 tierB-001672
(And (Degree $v0 $v1 $v2) (Member $v0 $v1) (Member $v0 $v3))

;; p202232  kindlevel  support 4 (occ 6)  size 3  lifted 4  nisurp 0.431  tiers tierB
;;   e.g. tierB-000276 tierB-000442 tierB-001075
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Past (Member $v3 $v0)))

;; p202233  kindlevel  support 4 (occ 4)  size 3  lifted 4  nisurp 0.478  tiers tierB
;;   e.g. tierB-000467 tierB-001564 tierB-001608
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Patient $v3 $v0))

;; p202234  kindlevel  support 4 (occ 7)  size 3  lifted 4  nisurp 0.532  tiers tierB  dominated
;;   e.g. tierB-000197 tierB-001585 tierB-001608
(And (Inheritance $v0 $v1) (Inheritance $v0 (can $v2)) (Patient $v2 $v3))

;; p202235  kindlevel  support 4 (occ 9)  size 3  lifted 4  nisurp -0.298  tiers tierB
;;   e.g. tierB-000428 tierB-001338 tierB-001590
(And (Inheritance $v0 $v1) (Inheritance $v2 $v0) (Inheritance $v2 $v3))

;; p202236  kindlevel  support 4 (occ 7)  size 3  lifted 4  nisurp 0.532  tiers tierB  dominated
;;   e.g. tierB-000197 tierB-001585 tierB-001608
(And (Inheritance $v0 $v1) (Inheritance $v2 $v3) (Inheritance $v2 (can $v0)))

;; p202237  kindlevel  support 4 (occ 5)  size 3  lifted 4  nisurp 0.859  tiers tierB
;;   e.g. tierB-000486 tierB-000800 tierB-001328
(And (LocatedIn $v0 $v1) (Member $v0 $v3) (Member $v1 $v2))

;; p202238  kindlevel  support 4 (occ 4)  size 2  lifted 2  nisurp 0.894  tiers tierB
;;   e.g. tierB-000898 tierB-001368 tierB-001683
(And (Degree $v0 $v1 very) (Member $v0 $v1))

;; p202239  kindlevel  support 4 (occ 4)  size 2  lifted 2  nisurp 0.766  tiers tierB
;;   e.g. tierB-000477 tierB-000780 tierB-000851
(And (Inheritance $v0 $v1) (Inheritance $v0 human))

;; p202240  kindlevel  support 4 (occ 4)  size 2  lifted 2  nisurp 0.989  tiers tierB
;;   e.g. tierB-000099 tierB-000540 tierB-000847
(And (Inheritance $v0 make) (Patient $v0 $v1))

;; p202241  kindlevel  support 4 (occ 4)  size 2  lifted 2  nisurp 0.911  tiers tierB
;;   e.g. tierB-000266 tierB-001504 tierB-001725
(And (Member $v0 $v1) (Member $v0 country))

;; p202242  kindlevel  support 4 (occ 5)  size 2  lifted 3  nisurp 0.766  tiers tierB
;;   e.g. tierB-000395 tierB-000488 tierB-001015
(And (Inheritance $v0 $v1) (KindProperty $v0 $v2))

;; p202243  kindlevel  support 4 (occ 8)  size 2  lifted 3  nisurp 0.286  tiers tierB  dominated
;;   e.g. tierB-000467 tierB-001564 tierB-001608
(And (Inheritance $v0 $v1) (Patient $v2 $v0))

;; p202244  kindlevel  support 4 (occ 4)  size 2  lifted 3  nisurp 0.169  tiers tierB
;;   e.g. tierB-000396 tierB-000821 tierB-000933
(And (Inheritance $v0 $v1) (Possession $v0 $v2))

;; p202245  kindlevel  support 4 (occ 6)  size 2  lifted 3  nisurp 0.823  tiers tierB  dominated
;;   e.g. tierB-000486 tierB-000800 tierB-001328
(And (LocatedIn $v0 $v1) (Member $v1 $v2))

;; p202246  kindlevel  support 4 (occ 4)  size 2  lifted 3  nisurp 0.988  tiers tierB
;;   e.g. tierB-000011 tierB-000542 tierB-001155
(And (Past (Degree $v0 $v1 $v2)) (Past (Member $v0 $v1)))

;; p202247  kindlevel  support 4 (occ 4)  size 2  lifted 4  nisurp 0.505  tiers tierB  dominated
;;   e.g. tierB-000266 tierB-001368 tierB-001672
(And (Degree $v0 $v1 $v2) (Member $v0 $v3))

;; p202248  kindlevel  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000992 tierB-001007 tierB-001865
(Inheritance $v0 game)

;; p202249  kindlevel  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000195 tierB-000660 tierB-000999
(Inheritance $v0 good)

;; p202250  kindlevel  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000477 tierB-000780 tierB-000851
(Inheritance $v0 human)

;; p202251  kindlevel  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000467 tierB-000800 tierB-001370
(Inheritance $v0 language)

;; p202252  kindlevel  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000175 tierB-000932 tierB-001325
(Inheritance $v0 machine)

;; p202253  kindlevel  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000099 tierB-000540 tierB-000847
(Inheritance $v0 make)

;; p202254  kindlevel  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000395 tierB-000632 tierB-001524
(Inheritance $v0 person)

;; p202255  kindlevel  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000581 tierB-000636 tierB-001164
(Inheritance $v0 ship)

;; p202256  kindlevel  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-001368 tierB-001443 tierB-001481
(Member $v0 language)

;; p202257  kindlevel  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000227 tierB-000544 tierB-001550
(Member $v0 river)

;; p202258  kindlevel  support 4 (occ 4)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000072 tierB-000603 tierB-000711
(Degree $v0 $v1 really)

;; p202259  kindlevel  support 4 (occ 4)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000123 tierB-000578 tierB-000661
(Inheritance $v0 (obligated $v1))

;; p202260  kindlevel  support 4 (occ 5)  size 1  lifted 2  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000395 tierB-000488 tierB-001015
(KindProperty $v0 $v1)

;; p202261  kindlevel  support 4 (occ 4)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-001095 tierB-001559 tierB-001657
(Member $v0 $v1) ~NEG

;; p202262  kindlevel  support 4 (occ 4)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000110 tierB-000638 tierB-001131
(Most good $v0 $v1)

;; p202263  kindlevel  support 4 (occ 5)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000754 tierB-001099 tierB-001192
(Probably (Member $v0 $v1))

;; p202264  kindlevel  support 4 (occ 4)  size 1  lifted 3  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000011 tierB-000542 tierB-001155
(Past (Degree $v0 $v1 $v2))

;; p202265  star  support 4 (occ 4)  size 4  lifted 0  nisurp 0.634  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Member $e0 start) (Past $e0) (Theme $e0 $e1))

;; p202266  star  support 4 (occ 4)  size 4  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001504 tierB-001594
(And (Agent $e0 $v0) (Member $e0 make) (Past $e0) (Result $e0 $e1))

;; p202267  star  support 4 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000034 tierB-000616 tierB-001000
(And (Already $e0) (Member $e0 $v0) (Past $e0) (Patient $e0 $x0))

;; p202268  star  support 4 (occ 6)  size 4  lifted 1  nisurp -0.094  tiers tierB  dominated
;;   e.g. tierB-001041 tierB-001078 tierB-001397
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Ongoing $e0) (Past $e0))

;; p202269  star  support 4 (occ 4)  size 4  lifted 1  nisurp -0.267  tiers tierB  dominated
;;   e.g. tierB-000482 tierB-001453 tierB-001579
(And (Goal $e0 $x0) (Member $e0 $v0) (Past $e0) (Patient $e0 $x1))

;; p202270  star  support 4 (occ 4)  size 4  lifted 1  nisurp 0.344  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000162 tierB-000730 tierB-000855
(And (Holder $e0 $v0) (Member $e0 have) (Past $e0) (Theme $e0 $x0))

;; p202271  star  support 4 (occ 4)  size 4  lifted 1  nisurp 0.416  tiers tierB
;;   e.g. tierB-000392 tierB-001143 tierB-001429
(And (Instrument $e0 $x0) (Member $e0 $v0) (Past $e0) (Patient $e0 $x1))

;; p202272  star  support 4 (occ 4)  size 4  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-001068 tierB-001120 tierB-001221
(And (Member $e0 $v0) (Ongoing $e0) (Past $e0) (Theme $e0 $x0))

;; p202273  star  support 4 (occ 4)  size 4  lifted 1  nisurp -0.472  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Member $e0 $v0) (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1))

;; p202274  star  support 4 (occ 4)  size 4  lifted 1  nisurp 0.403  tiers tierB
;;   e.g. tierB-000781 tierB-001325 tierB-001540
(And (Member $e0 $v0) (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))

;; p202275  star  support 4 (occ 5)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000215 tierB-000799 tierB-001629
(And (Member $e0 $v0) (Past $e0) (TimeAtLeast $e0 (Year <num>)) (TimeAtMost $e0 (Year <num>)))

;; p202276  star  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000392 tierB-000444 tierB-000576
(And (Agent $e0 $v0) (Instrument $e0 $x0) (Member $e0 $v1) (Past $e0))

;; p202277  star  support 4 (occ 4)  size 4  lifted 2  nisurp 0.602  tiers tierB
;;   e.g. tierB-000128 tierB-000163 tierB-000328
(And (Agent $e0 $v0) (Manner $e0 $v1) (Past $e0) (Theme $e0 $x0))

;; p202278  star  support 4 (occ 5)  size 4  lifted 2  nisurp 0.402  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Agent $e0 $v0) (Member $e0 $v1) (Ongoing $e0) (Theme $e1 $e0))

;; p202279  star  support 4 (occ 4)  size 4  lifted 2  nisurp 0.416  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e0) (To $e0 $e1))

;; p202280  star  support 4 (occ 4)  size 4  lifted 2  nisurp 0.402  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Member $e0 $v1) (Patient $e0 $x0) (Result $e0 $e1))

;; p202281  star  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000091 tierB-000605 tierB-001133
(And (Agent $e0 $x0) (For $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p202282  star  support 4 (occ 5)  size 4  lifted 2  nisurp 0.390  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-000688 tierB-001086
(And (Agent $e0 $x0) (Goal $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p202283  star  support 4 (occ 4)  size 4  lifted 2  nisurp -0.073  tiers tierB  dominated
;;   e.g. tierB-000520 tierB-000555 tierB-001800
(And (Agent $e0 $x0) (Manner $e0 $v0) (Member $e0 $v1) (Theme $e0 $x1))

;; p202284  star  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000098 tierB-001004 tierB-001754
(And (Agent $e0 $x0) (Member $e0 $v0) (Ongoing $e0) (Patient $e0 $v1))

;; p202285  star  support 4 (occ 5)  size 4  lifted 2  nisurp 0.397  tiers tierB
;;   e.g. tierB-000231 tierB-000236 tierB-000485
(And (Agent $e0 $x0) (Member $e0 $v0) (Ongoing $e0) (Theme $e0 $v1))

;; p202286  star  support 4 (occ 5)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000485 tierB-000715 tierB-000769
(And (Agent $e0 $x0) (Member $e0 $v0) (Recipient $e0 $x1) (Theme $e0 $v1))

;; p202287  star  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000344 tierB-001563 tierB-001579
(And (Goal $e0 $x0) (Manner $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p202288  star  support 4 (occ 5)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000757 tierB-001582 tierB-001692
(And (Instrument $e0 $v0) (Member $e0 $v1) (Past $e0) (Patient $e0 $x0))

;; p202289  star  support 4 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000087 tierB-000717 tierB-001515
(And (Manner $e0 $v0) (Member $e0 $v1) (Past $e0) (Theme $e0 $e1))

;; p202290  star  support 4 (occ 5)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000001 tierB-000075 tierB-000212
(And (Agent $e0 $v0) (Manner $e0 $v1) (Member $e0 $v2) (Ongoing $e0))

;; p202291  star  support 4 (occ 4)  size 4  lifted 3  nisurp 0.239  tiers tierB  dominated
;;   e.g. tierB-000389 tierB-000466 tierB-000883
(And (Agent $e0 $v0) (Manner $e0 $v1) (Member $e0 $v2) (Patient $e0 $x0))

;; p202292  star  support 4 (occ 4)  size 4  lifted 3  nisurp 0.372  tiers tierB  dominated
;;   e.g. tierB-000128 tierB-000163 tierB-000328
(And (Agent $e0 $v0) (Manner $e0 $v1) (Member $e0 $v2) (Theme $e0 $x0))

;; p202293  star  support 4 (occ 6)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000354 tierB-000598 tierB-001275
(And (Agent $e0 $x0) (Member $e0 $v0) (Theme $e0 $v1) (Time $e0 $v2))

;; p202294  star  support 4 (occ 5)  size 4  lifted 3  nisurp -0.701  tiers tierB
;;   e.g. tierB-000085 tierB-000352 tierB-001476
(And (Degree $x0 $v0 $v1) (Member $x0 $v0) (Member $x0 $v2) (Patient $e0 $x0))

;; p202295  star  support 4 (occ 4)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000345 tierB-001217 tierB-001793
(And (Manner $e0 $v0) (Member $e0 $v1) (Past $e0) (Patient $e0 $v2))

;; p202296  star  support 4 (occ 6)  size 3  lifted 0  nisurp 0.797  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000768 tierB-001254
(And (Agent $e0 $x0) (Member $e0 contain) (Theme $e0 $x1))

;; p202297  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000871 tierB-000889 tierB-001530
(And (Agent $e0 $x0) (Member $e0 jump) (Past $e0))

;; p202298  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.431  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Member $e0 start) (Past $e0))

;; p202299  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.512  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Member $e0 start) (Theme $e0 $e1))

;; p202300  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.837  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000782 tierB-001008 tierB-001268
(And (Agent $e0 $x0) (Member $e0 swim) (Ongoing $e0))

;; p202301  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.635  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000616 tierB-001000
(And (Already $e0) (Past $e0) (Patient $e0 $x0))

;; p202302  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.907  tiers tierB  signal subtree-collapse
;;   e.g. tierB-001334 tierB-001753 tierB-001891
(And (Experiencer $e0 $x0) (Member $e0 sleep) (Ongoing $e0))

;; p202303  star  support 4 (occ 6)  size 3  lifted 0  nisurp -0.094  tiers tierB  dominated
;;   e.g. tierB-001041 tierB-001078 tierB-001397
(And (Experiencer $e0 $x0) (Ongoing $e0) (Past $e0))

;; p202304  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000324 tierB-000929 tierB-001044
(And (Goal $e0 $x0) (Member $e0 walk) (Past $e0))

;; p202305  star  support 4 (occ 4)  size 3  lifted 0  nisurp -0.267  tiers tierB  dominated
;;   e.g. tierB-000482 tierB-001453 tierB-001579
(And (Goal $e0 $x0) (Past $e0) (Patient $e0 $x1))

;; p202306  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.416  tiers tierB  dominated
;;   e.g. tierB-000392 tierB-001143 tierB-001429
(And (Instrument $e0 $x0) (Past $e0) (Patient $e0 $x1))

;; p202307  star  support 4 (occ 5)  size 3  lifted 0  nisurp 0.829  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0))

;; p202308  star  support 4 (occ 5)  size 3  lifted 0  nisurp 0.907  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001185
(And (Member $e0 get) (Ongoing $e0) (Result $e0 $e1))

;; p202309  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.489  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001504 tierB-001594
(And (Member $e0 make) (Past $e0) (Result $e0 $e1))

;; p202310  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.589  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001446 tierB-001816
(And (Member $e0 start) (Patient $e0 $x0) (Theme $e0 $e1))

;; p202311  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.562  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000942 tierB-000987
(And (Member $e0 take) (Past $e0) (Theme $e0 $x0))

;; p202312  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.562  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000018 tierB-000476 tierB-000654
(And (Member $e0 turn) (Past $e0) (Patient $e0 $x0))

;; p202313  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.021  tiers tierB  dominated
;;   e.g. tierB-001068 tierB-001120 tierB-001221
(And (Ongoing $e0) (Past $e0) (Theme $e0 $x0))

;; p202314  star  support 4 (occ 4)  size 3  lifted 0  nisurp -0.472  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1))

;; p202315  star  support 4 (occ 4)  size 3  lifted 0  nisurp 0.403  tiers tierB  dominated
;;   e.g. tierB-000781 tierB-001325 tierB-001540
(And (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))

;; p202316  star  support 4 (occ 5)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000799 tierB-001629
(And (Past $e0) (TimeAtLeast $e0 (Year <num>)) (TimeAtMost $e0 (Year <num>)))

;; p202317  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000392 tierB-000444 tierB-000576
(And (Agent $e0 $v0) (Instrument $e0 $x0) (Past $e0))

;; p202318  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000048 tierB-000524 tierB-000707
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $e0 live))

;; p202319  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000401 tierB-000563 tierB-001544
(And (Agent $e0 $v0) (Member $e0 decide) (Past $e0))

;; p202320  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000577 tierB-000672 tierB-001185
(And (Agent $e0 $v0) (Member $e0 get) (Past $e0))

;; p202321  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.810  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000173 tierB-000325 tierB-000951
(And (Agent $e0 $v0) (Member $e0 make) (Ongoing $e0))

;; p202322  star  support 4 (occ 5)  size 3  lifted 1  nisurp 0.592  tiers tierB  dominated
;;   e.g. tierB-000025 tierB-000371 tierB-000951
(And (Agent $e0 $v0) (Member $e0 make) (Patient $e0 $x0))

;; p202323  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.810  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001504 tierB-001594
(And (Agent $e0 $v0) (Member $e0 make) (Result $e0 $e1))

;; p202324  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000252 tierB-000309 tierB-000987
(And (Agent $e0 $v0) (Member $e0 take) (Past $e0))

;; p202325  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000400 tierB-000547
(And (Agent $e0 $v0) (Member $e0 try) (Theme $e0 $e1))

;; p202326  star  support 4 (occ 5)  size 3  lifted 1  nisurp 0.402  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000199
(And (Agent $e0 $v0) (Ongoing $e0) (Theme $e1 $e0))

;; p202327  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.416  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000115 tierB-000147
(And (Agent $e0 $v0) (Past $e0) (To $e0 $e1))

;; p202328  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.402  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000392 tierB-000425
(And (Agent $e0 $v0) (Patient $e0 $x0) (Result $e0 $e1))

;; p202329  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.562  tiers tierB  dominated
;;   e.g. tierB-000091 tierB-000605 tierB-001133
(And (Agent $e0 $x0) (For $e0 $v0) (Past $e0))

;; p202330  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-000712 tierB-001663
(And (Agent $e0 $x0) (For $e0 $x1) (Member $e0 $v0))

;; p202331  star  support 4 (occ 5)  size 3  lifted 1  nisurp 0.390  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-000688 tierB-001086
(And (Agent $e0 $x0) (Goal $e0 $v0) (Past $e0))

;; p202332  star  support 4 (occ 4)  size 3  lifted 1  nisurp -0.073  tiers tierB  dominated
;;   e.g. tierB-000520 tierB-000555 tierB-001800
(And (Agent $e0 $x0) (Manner $e0 $v0) (Theme $e0 $x1))

;; p202333  star  support 4 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(And (Agent $e0 $x0) (Member $e0 $v0) (Over $e0 $x1))

;; p202334  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.512  tiers tierB  dominated
;;   e.g. tierB-000098 tierB-001004 tierB-001754
(And (Agent $e0 $x0) (Ongoing $e0) (Patient $e0 $v0))

;; p202335  star  support 4 (occ 5)  size 3  lifted 1  nisurp 0.397  tiers tierB  dominated
;;   e.g. tierB-000231 tierB-000236 tierB-000485
(And (Agent $e0 $x0) (Ongoing $e0) (Theme $e0 $v0))

;; p202336  star  support 4 (occ 5)  size 3  lifted 1  nisurp 0.756  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000715 tierB-000769
(And (Agent $e0 $x0) (Recipient $e0 $x1) (Theme $e0 $v0))

;; p202337  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000616 tierB-001000
(And (Already $e0) (Member $e0 $v0) (Past $e0))

;; p202338  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001134
(And (Before $e0 $e1) (Member $e1 $v0) (Past $e1))

;; p202339  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.350  tiers tierB
;;   e.g. tierB-000025 tierB-001047 tierB-001246
(And (Can $e0) (Member $e0 $v0) (Patient $e0 $x0))

;; p202340  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.403  tiers tierB
;;   e.g. tierB-000299 tierB-000319 tierB-000745
(And (Can $e0) (Member $e0 $v0) (Theme $e0 $x0))

;; p202341  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.648  tiers tierB  dominated
;;   e.g. tierB-000372 tierB-000794 tierB-000814
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (LocatedIn $x0 $x1))

;; p202342  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000411 tierB-000844 tierB-001017
(And (During $e0 $x0) (Member $e0 $v0) (Past $e0))

;; p202343  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001517
(And (Experiencer $e0 $x0) (Like $e0 $x1) (Member $e0 $v0))

;; p202344  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000495 tierB-001521 tierB-001891
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Probably $e0))

;; p202345  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000744 tierB-000880
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Time $e0 now))

;; p202346  star  support 4 (occ 6)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000919 tierB-001384 tierB-001519
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Possession $x0 $x1))

;; p202347  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.554  tiers tierB  dominated
;;   e.g. tierB-000344 tierB-001563 tierB-001579
(And (Goal $e0 $x0) (Manner $e0 $v0) (Past $e0))

;; p202348  star  support 4 (occ 4)  size 3  lifted 1  nisurp -0.482  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-001394 tierB-001816
(And (GroupOf $x0 $v0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p202349  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.452  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (GroupOf $x0 $v0) (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p202350  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000799 tierB-001111 tierB-001628
(And (GroupOf $x0 $v0) (ProportionOf $x0 $x1 most) (SubsetOf $x0 $x1))

;; p202351  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000799 tierB-001111 tierB-001628
(And (GroupOf $x0 $v0) (ProportionOf $x1 $x0 most) (SubsetOf $x1 $x0))

;; p202352  star  support 4 (occ 5)  size 3  lifted 1  nisurp 0.489  tiers tierB  dominated
;;   e.g. tierB-000757 tierB-001582 tierB-001692
(And (Instrument $e0 $v0) (Past $e0) (Patient $e0 $x0))

;; p202353  star  support 4 (occ 5)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000202 tierB-000208 tierB-000524
(And (LocatedIn $x0 $x1) (Member $x1 $v0) (PartOf $x1 $x2))

;; p202354  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.213  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001257 tierB-001283
(And (Location $e0 $x0) (Member $e0 $v0) (Theme $e1 $e0))

;; p202355  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.482  tiers tierB  dominated
;;   e.g. tierB-000087 tierB-000717 tierB-001515
(And (Manner $e0 $v0) (Past $e0) (Theme $e0 $e1))

;; p202356  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000517 tierB-001891 tierB-001910
(And (Member $e0 $v0) (Ongoing $e0) (Probably $e0))

;; p202357  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.424  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000485 tierB-000677
(And (Member $e0 $v0) (Ongoing $e0) (Source $e0 $x0))

;; p202358  star  support 4 (occ 4)  size 3  lifted 1  nisurp -0.227  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-001130 tierB-001557
(And (Member $e0 $v0) (Ongoing $e0) (Theme $e0 $e1))

;; p202359  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(And (Member $e0 $v0) (Over $e0 $x0) (Past $e0))

;; p202360  star  support 4 (occ 5)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000087 tierB-001515
(And (Member $e0 $v0) (Past $e0) (Theme $e1 $e0))

;; p202361  star  support 4 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000799 tierB-001629
(And (Member $e0 $v0) (Past $e0) (TimeAtLeast $e0 (Year <num>)))

;; p202362  star  support 4 (occ 4)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(And (Member $e0 $v0) (Theme $e0 $x0) (Theme $e1 $e0))

;; p202363  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.435  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-000252 tierB-000730
(And (Member $e0 $v0) (Theme $e0 $x0) (To $e0 $e1))

;; p202364  star  support 4 (occ 5)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000799 tierB-001629
(And (Member $e0 $v0) (TimeAtLeast $e0 (Year <num>)) (TimeAtMost $e0 (Year <num>)))

;; p202365  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.562  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000325 tierB-000539 tierB-001504
(And (Member $e0 make) (Past $e0) (Patient $e0 $v0))

;; p202366  star  support 4 (occ 4)  size 3  lifted 1  nisurp 0.026  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-001243 tierB-001586
(And (Member $x0 $v0) (PartOf $x0 $x1) (Theme $e0 $x0))

;; p202367  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000392 tierB-000444 tierB-000576
(And (Agent $e0 $v0) (Instrument $e0 $x0) (Member $e0 $v1))

;; p202368  star  support 4 (occ 5)  size 3  lifted 2  nisurp 0.538  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000075 tierB-000212
(And (Agent $e0 $v0) (Manner $e0 $v1) (Ongoing $e0))

;; p202369  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.239  tiers tierB  dominated
;;   e.g. tierB-000389 tierB-000466 tierB-000883
(And (Agent $e0 $v0) (Manner $e0 $v1) (Patient $e0 $x0))

;; p202370  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.372  tiers tierB  dominated
;;   e.g. tierB-000128 tierB-000163 tierB-000328
(And (Agent $e0 $v0) (Manner $e0 $v1) (Theme $e0 $x0))

;; p202371  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.157  tiers tierB  dominated
;;   e.g. tierB-000138 tierB-000400 tierB-001325
(And (Agent $e0 $v0) (Member $e0 $v1) (Source $e0 $x0))

;; p202372  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000238 tierB-000598 tierB-001528
(And (Agent $e0 $x0) (Every $e0 <num> $v0) (Member $e0 $v1))

;; p202373  star  support 4 (occ 5)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001245 tierB-001433 tierB-001618
(And (Agent $e0 $x0) (Instrument $e0 $v0) (Member $e0 $v1))

;; p202374  star  support 4 (occ 5)  size 3  lifted 2  nisurp -0.379  tiers tierB  dominated
;;   e.g. tierB-000688 tierB-000770 tierB-000783
(And (Agent $e0 $x0) (Member $x0 $v0) (Past (Member $x0 $v1)))

;; p202375  star  support 4 (occ 6)  size 3  lifted 2  nisurp 0.763  tiers tierB  dominated
;;   e.g. tierB-000354 tierB-000598 tierB-001275
(And (Agent $e0 $x0) (Theme $e0 $v0) (Time $e0 $v1))

;; p202376  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000299 tierB-000686 tierB-001270
(And (Can $e0) (Member $e0 $v0) (Time $e0 $v1))

;; p202377  star  support 4 (occ 4)  size 3  lifted 2  nisurp -0.069  tiers tierB  dominated
;;   e.g. tierB-000085 tierB-000352 tierB-001476
(And (Degree $x0 $v0 $v1) (Member $x0 $v0) (Patient $e0 $x0))

;; p202378  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.069  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000235 tierB-000509 tierB-001103
(And (Degree $x0 $v0 really) (Member $x0 $v0) (Member $x0 $v1))

;; p202379  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.382  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000114 tierB-000534
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Theme $e0 $e1))

;; p202380  star  support 4 (occ 4)  size 3  lifted 2  nisurp -0.473  tiers tierB
;;   e.g. tierB-000040 tierB-000144 tierB-000419
(And (Experiencer $e0 $x0) (Manner $e0 $v0) (Member $e0 $v1))

;; p202381  star  support 4 (occ 4)  size 3  lifted 2  nisurp -0.553  tiers tierB  dominated
;;   e.g. tierB-000602 tierB-000808 tierB-001573
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e0 $v1))

;; p202382  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-001180 tierB-001330 tierB-001424
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Stimulus $e0 $v1))

;; p202383  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000111 tierB-000427 tierB-000470
(And (Goal $e0 $x0) (Member $e0 $v0) (Theme $e0 $v1))

;; p202384  star  support 4 (occ 4)  size 3  lifted 2  nisurp 1.049  tiers tierB  dominated
;;   e.g. tierB-000040 tierB-001453 tierB-001534
(And (Goal $e0 $x0) (Member $x0 $v0) (Member $x0 $v1))

;; p202385  star  support 4 (occ 6)  size 3  lifted 2  nisurp -0.002  tiers tierB  dominated
;;   e.g. tierB-000292 tierB-000706 tierB-001257
(And (Location $e0 $x0) (Member $e0 $v0) (Theme $e0 $v1))

;; p202386  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.205  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-001446 tierB-001496
(And (Manner $e0 $v0) (Member $e0 $v1) (Theme $e1 $e0))

;; p202387  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.562  tiers tierB  dominated
;;   e.g. tierB-000345 tierB-001217 tierB-001793
(And (Manner $e0 $v0) (Past $e0) (Patient $e0 $v1))

;; p202388  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000144 tierB-000303 tierB-001520
(And (Member $e0 $v0) (Obligated $e0) (Time $e0 $v1))

;; p202389  star  support 4 (occ 4)  size 3  lifted 2  nisurp 0.198  tiers tierB
;;   e.g. tierB-000079 tierB-000603 tierB-001424
(And (Member $e0 $v0) (Past $e0) (Stimulus $e0 $v1))

;; p202390  star  support 4 (occ 4)  size 3  lifted 2  nisurp -0.232  tiers tierB  dominated
;;   e.g. tierB-000681 tierB-000695 tierB-001141
(And (Member $x0 $v0) (Member $x0 $v1) (Stimulus $e0 $x0))

;; p202391  star  support 4 (occ 4)  size 3  lifted 2  nisurp -0.242  tiers tierB
;;   e.g. tierB-000093 tierB-000734 tierB-000827
(And (Member $x0 $v0) (Member $x0 $v1) (To $e0 $x0))

;; p202392  star  support 4 (occ 5)  size 3  lifted 2  nisurp 0.315  tiers tierB  dominated
;;   e.g. tierB-000139 tierB-001677 tierB-001803
(And (Member $x0 $v0) (Patient $e0 $x0) (Possession $x0 $v1))

;; p202393  star  support 4 (occ 6)  size 3  lifted 3  nisurp -0.473  tiers tierB
;;   e.g. tierB-000075 tierB-000371 tierB-000478
(And (Agent $e0 $v0) (Agent $e0 $v1) (Member $e0 $v2))

;; p202394  star  support 4 (occ 5)  size 3  lifted 3  nisurp 0.076  tiers tierB
;;   e.g. tierB-000601 tierB-000910 tierB-001084
(And (Agent $e0 $v0) (Location $e0 $v1) (Member $e0 $v2))

;; p202395  star  support 4 (occ 4)  size 3  lifted 3  nisurp -0.025  tiers tierB
;;   e.g. tierB-000261 tierB-000842 tierB-000960
(And (Degree $x0 $v0 $v1) (Experiencer $e0 $x0) (Member $x0 $v2))

;; p202396  star  support 4 (occ 4)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000079 tierB-000115 tierB-000603
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Stimulus $e0 $v2))

;; p202397  star  support 4 (occ 4)  size 3  lifted 3  nisurp 0.279  tiers tierB
;;   e.g. tierB-000051 tierB-000514 tierB-000542
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Time $e0 $v2))

;; p202398  star  support 4 (occ 5)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000012 tierB-000688 tierB-001496
(And (Goal $e0 $v0) (Manner $e0 $v1) (Member $e0 $v2))

;; p202399  star  support 4 (occ 5)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000373 tierB-000970 tierB-001691
(And (Location $e0 $v0) (Member $e0 $v1) (Patient $e0 $v2))

;; p202400  star  support 4 (occ 4)  size 3  lifted 3  nisurp 2.558  tiers tierB
;;   e.g. tierB-000538 tierB-001257 tierB-001619
(And (Member $e0 $v0) (Member $e0 $v1) (Member $e0 $v2))

;; p202401  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.553  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-000712 tierB-001663
(And (Agent $e0 $x0) (For $e0 $x1))

;; p202402  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.797  tiers tierB  dominated
;;   e.g. tierB-001316 tierB-001457 tierB-001530
(And (Agent $e0 $x0) (GroupOf $x0 boy))

;; p202403  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.756  tiers tierB  dominated
;;   e.g. tierB-000387 tierB-000656 tierB-000712
(And (Agent $e0 $x0) (GroupOf $x0 student))

;; p202404  star  support 4 (occ 6)  size 2  lifted 0  nisurp 0.797  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000768 tierB-001254
(And (Agent $e0 $x0) (Member $e0 contain))

;; p202405  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.797  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000338 tierB-000410 tierB-001551
(And (Agent $e0 $x0) (Member $e0 eat))

;; p202406  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.837  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000045 tierB-000121 tierB-000801
(And (Agent $e0 $x0) (Member $e0 fly))

;; p202407  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001530
(And (Agent $e0 $x0) (Member $e0 jump))

;; p202408  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.797  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000769 tierB-001260 tierB-001262
(And (Agent $e0 $x0) (Member $e0 provide))

;; p202409  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.228  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000942 tierB-001169
(And (Agent $e0 $x0) (Member $e0 start))

;; p202410  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.797  tiers tierB  dominated
;;   e.g. tierB-000782 tierB-001008 tierB-001268
(And (Agent $e0 $x0) (Member $e0 swim))

;; p202411  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.553  tiers tierB  dominated
;;   e.g. tierB-000469 tierB-000470 tierB-001130
(And (Agent $e0 $x0) (Member $e0 try))

;; p202412  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.309  tiers tierB  dominated
;;   e.g. tierB-000268 tierB-000850 tierB-001098
(And (Agent $e0 $x0) (Member $e0 use))

;; p202413  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.594  tiers tierB  dominated
;;   e.g. tierB-000073 tierB-000381 tierB-001183
(And (Agent $e0 $x0) (Member $x0 cat))

;; p202414  star  support 4 (occ 5)  size 2  lifted 0  nisurp 0.716  tiers tierB  dominated
;;   e.g. tierB-000762 tierB-000853 tierB-001130
(And (Agent $e0 $x0) (Member $x0 company))

;; p202415  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.797  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(And (Agent $e0 $x0) (Over $e0 $x1))

;; p202416  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.562  tiers tierB  dominated
;;   e.g. tierB-000034 tierB-000616 tierB-001000
(And (Already $e0) (Past $e0))

;; p202417  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001134
(And (Before $e0 $e1) (Past $e1))

;; p202418  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.350  tiers tierB  dominated
;;   e.g. tierB-000025 tierB-001047 tierB-001246
(And (Can $e0) (Patient $e0 $x0))

;; p202419  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.403  tiers tierB  dominated
;;   e.g. tierB-000299 tierB-000319 tierB-000745
(And (Can $e0) (Theme $e0 $x0))

;; p202420  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.648  tiers tierB  dominated
;;   e.g. tierB-000372 tierB-000794 tierB-000814
(And (Cardinality $x0 <num>) (LocatedIn $x0 $x1))

;; p202421  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000411 tierB-000844 tierB-001017
(And (During $e0 $x0) (Past $e0))

;; p202422  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.901  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001517
(And (Experiencer $e0 $x0) (Like $e0 $x1))

;; p202423  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.851  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000174 tierB-000339 tierB-000455
(And (Experiencer $e0 $x0) (Member $e0 need))

;; p202424  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.471  tiers tierB  dominated
;;   e.g. tierB-000919 tierB-001384 tierB-001519
(And (Experiencer $e0 $x0) (Possession $x0 $x1))

;; p202425  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.851  tiers tierB  dominated
;;   e.g. tierB-000495 tierB-001521 tierB-001891
(And (Experiencer $e0 $x0) (Probably $e0))

;; p202426  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.801  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000744 tierB-000880
(And (Experiencer $e0 $x0) (Time $e0 now))

;; p202427  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.951  tiers tierB  dominated
;;   e.g. tierB-000324 tierB-000929 tierB-001044
(And (Goal $e0 $x0) (Member $e0 walk))

;; p202428  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.937  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000615 tierB-000760 tierB-001208
(And (LocatedIn $x0 $x1) (Member $x1 garden))

;; p202429  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.703  tiers tierB  dominated
;;   e.g. tierB-000202 tierB-000208 tierB-000524
(And (LocatedIn $x0 $x1) (PartOf $x1 $x2))

;; p202430  star  support 4 (occ 5)  size 2  lifted 0  nisurp 1.088  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000680 tierB-001295
(And (LocatedIn $x0 $x1) (Patient $e0 $x0))

;; p202431  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.905  tiers tierB  dominated
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(And (Location $e0 $x0) (Member $e0 walk))

;; p202432  star  support 4 (occ 6)  size 2  lifted 0  nisurp 0.869  tiers tierB  dominated
;;   e.g. tierB-000047 tierB-000502 tierB-001041
(And (Location $e0 $x0) (Member $x0 table))

;; p202433  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.213  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001257 tierB-001283
(And (Location $e0 $x0) (Theme $e1 $e0))

;; p202434  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.829  tiers tierB  dominated
;;   e.g. tierB-000352 tierB-000740 tierB-001582
(And (Member $e0 become) (Patient $e0 $x0))

;; p202435  star  support 4 (occ 5)  size 2  lifted 0  nisurp 0.874  tiers tierB  dominated
;;   e.g. tierB-000367 tierB-000368 tierB-000849
(And (Member $e0 buy) (Theme $e0 $x0))

;; p202436  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.562  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000775 tierB-000805 tierB-001649
(And (Member $e0 cause) (Past $e0))

;; p202437  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000401 tierB-000563 tierB-001544
(And (Member $e0 decide) (Past $e0))

;; p202438  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.795  tiers tierB  signal subtree-collapse
;;   e.g. tierB-001520 tierB-001721 tierB-001735
(And (Member $e0 do) (Patient $e0 $x0))

;; p202439  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000579 tierB-000585 tierB-000706
(And (Member $e0 find) (Past $e0))

;; p202440  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001530
(And (Member $e0 jump) (Past $e0))

;; p202441  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000649 tierB-001008 tierB-001762
(And (Member $e0 pass) (Past $e0))

;; p202442  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000962 tierB-001035 tierB-001595
(And (Member $e0 receive) (Past $e0))

;; p202443  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.874  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000607 tierB-001436 tierB-001566
(And (Member $e0 require) (Theme $e0 $x0))

;; p202444  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.635  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000080 tierB-000865 tierB-001441
(And (Member $e0 say) (Past $e0))

;; p202445  star  support 4 (occ 5)  size 2  lifted 0  nisurp 0.635  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000030 tierB-000125 tierB-001515
(And (Member $e0 stop) (Past $e0))

;; p202446  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.907  tiers tierB  dominated
;;   e.g. tierB-000782 tierB-001008 tierB-001268
(And (Member $e0 swim) (Ongoing $e0))

;; p202447  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.795  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000117 tierB-000469 tierB-000487
(And (Member $e0 try) (Ongoing $e0))

;; p202448  star  support 4 (occ 5)  size 2  lifted 0  nisurp 0.968  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Member $e0 turn) (Result $e0 $e1))

;; p202449  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.961  tiers tierB  dominated
;;   e.g. tierB-000282 tierB-000404 tierB-001304
(And (Member $e0 use) (To $e0 $e1))

;; p202450  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.851  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(And (Member $e0 walk) (Ongoing $e0))

;; p202451  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.466  tiers tierB  dominated
;;   e.g. tierB-000441 tierB-001005 tierB-001687
(And (Member $x0 house) (Theme $e0 $x0))

;; p202452  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.658  tiers tierB  dominated
;;   e.g. tierB-000176 tierB-000277 tierB-001476
(And (Member $x0 tree) (Patient $e0 $x0))

;; p202453  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.843  tiers tierB  dominated
;;   e.g. tierB-000409 tierB-001070 tierB-001262
(And (Of $x0 $x1) (Theme $e0 $x0))

;; p202454  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.833  tiers tierB  dominated
;;   e.g. tierB-000517 tierB-001891 tierB-001910
(And (Ongoing $e0) (Probably $e0))

;; p202455  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.424  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000485 tierB-000677
(And (Ongoing $e0) (Source $e0 $x0))

;; p202456  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.227  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-001130 tierB-001557
(And (Ongoing $e0) (Theme $e0 $e1))

;; p202457  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.635  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(And (Over $e0 $x0) (Past $e0))

;; p202458  star  support 4 (occ 5)  size 2  lifted 0  nisurp 3.815  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-000087 tierB-001515
(And (Past $e0) (Theme $e1 $e0))

;; p202459  star  support 4 (occ 5)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000799 tierB-001629
(And (Past $e0) (TimeAtLeast $e0 (Year <num>)))

;; p202460  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.452  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000320 tierB-000779
(And (Patient $e0 $x0) (SubsetOf $x0 $x1))

;; p202461  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.992  tiers tierB  dominated
;;   e.g. tierB-000799 tierB-001111 tierB-001628
(And (ProportionOf $x0 $x1 most) (SubsetOf $x0 $x1))

;; p202462  star  support 4 (occ 4)  size 2  lifted 0  nisurp 1.073  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(And (Theme $e0 $e1) (Theme $e1 $x0))

;; p202463  star  support 4 (occ 4)  size 2  lifted 0  nisurp 6.696  tiers tierB  dominated
;;   e.g. tierB-000162 tierB-000636 tierB-001149
(And (Theme $e0 $x0) (Theme $e1 $x0))

;; p202464  star  support 4 (occ 4)  size 2  lifted 0  nisurp 0.435  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-000252 tierB-000730
(And (Theme $e0 $x0) (To $e0 $e1))

;; p202465  star  support 4 (occ 5)  size 2  lifted 0  nisurp 0.997  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000799 tierB-001629
(And (TimeAtLeast $e0 (Year <num>)) (TimeAtMost $e0 (Year <num>)))

;; p202466  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.620  tiers tierB  dominated
;;   e.g. tierB-000392 tierB-000444 tierB-000576
(And (Agent $e0 $v0) (Instrument $e0 $x0))

;; p202467  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.891  tiers tierB  dominated
;;   e.g. tierB-000401 tierB-000563 tierB-001544
(And (Agent $e0 $v0) (Member $e0 decide))

;; p202468  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.647  tiers tierB  dominated
;;   e.g. tierB-000577 tierB-000672 tierB-001185
(And (Agent $e0 $v0) (Member $e0 get))

;; p202469  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.755  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000089 tierB-000816 tierB-000939
(And (Agent $e0 $v0) (Member $e0 play))

;; p202470  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.728  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000309 tierB-000987
(And (Agent $e0 $v0) (Member $e0 take))

;; p202471  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.157  tiers tierB  dominated
;;   e.g. tierB-000138 tierB-000400 tierB-001325
(And (Agent $e0 $v0) (Source $e0 $x0))

;; p202472  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.512  tiers tierB  dominated
;;   e.g. tierB-000238 tierB-000598 tierB-001528
(And (Agent $e0 $x0) (Every $e0 <num> $v0))

;; p202473  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.512  tiers tierB  dominated
;;   e.g. tierB-001245 tierB-001433 tierB-001618
(And (Agent $e0 $x0) (Instrument $e0 $v0))

;; p202474  star  support 4 (occ 4)  size 2  lifted 1  nisurp 1.398  tiers tierB  dominated
;;   e.g. tierB-000688 tierB-000770 tierB-000783
(And (Agent $e0 $x0) (Past (Member $x0 $v0)))

;; p202475  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001134
(And (Before $e0 $e1) (Member $e0 $v0))

;; p202476  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001134
(And (Before $e0 $e1) (Member $e1 $v0))

;; p202477  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001130 tierB-001222 tierB-001531
(And (Before $x0 $e0) (Member $e0 $v0))

;; p202478  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-001130 tierB-001222 tierB-001531
(And (Before $x0 $e0) (Member $x0 $v0))

;; p202479  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.812  tiers tierB  dominated
;;   e.g. tierB-000299 tierB-000686 tierB-001270
(And (Can $e0) (Time $e0 $v0))

;; p202480  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.087  tiers tierB  dominated
;;   e.g. tierB-000235 tierB-000509 tierB-001103
(And (Degree $x0 $v0 really) (Member $x0 $v0))

;; p202481  star  support 4 (occ 7)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000937 tierB-001124 tierB-001307
(And (Directive (And (At $x0 $x1) (Member $x0 look))) (Member $x1 $v0))

;; p202482  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000411 tierB-000844 tierB-001017
(And (During $e0 $x0) (Member $e0 $v0))

;; p202483  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000411 tierB-000844 tierB-001017
(And (During $e0 $x0) (Member $x0 $v0))

;; p202484  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000206 tierB-000238 tierB-000313
(And (Every $e0 <num> day) (Member $e0 $v0))

;; p202485  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.916  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000061 tierB-000086 tierB-000107
(And (Experiencer $e0 $v0) (Member $e0 need))

;; p202486  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.953  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000626 tierB-000846 tierB-001390
(And (Experiencer $e0 $v0) (Member $e0 want))

;; p202487  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.382  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000114 tierB-000534
(And (Experiencer $e0 $v0) (Theme $e0 $e1))

;; p202488  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.555  tiers tierB  dominated
;;   e.g. tierB-000040 tierB-000144 tierB-000419
(And (Experiencer $e0 $x0) (Manner $e0 $v0))

;; p202489  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.818  tiers tierB  dominated
;;   e.g. tierB-001180 tierB-001330 tierB-001424
(And (Experiencer $e0 $x0) (Stimulus $e0 $v0))

;; p202490  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000938
(And (For $e0 $e1) (Member $e0 $v0))

;; p202491  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000938
(And (For $e0 $e1) (Member $e1 $v0))

;; p202492  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000308 tierB-000555 tierB-001455
(And (For $x0 $e0) (Member $e0 $v0))

;; p202493  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000308 tierB-000555 tierB-001455
(And (For $x0 $e0) (Member $x0 $v0))

;; p202494  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.957  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000012 tierB-001418 tierB-001496
(And (Goal $e0 $v0) (Member $e0 go))

;; p202495  star  support 4 (occ 4)  size 2  lifted 1  nisurp 1.486  tiers tierB  dominated
;;   e.g. tierB-000834 tierB-000909 tierB-000958
(And (Goal $e0 $x0) (GroupOf $x0 $v0))

;; p202496  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.483  tiers tierB  dominated
;;   e.g. tierB-000111 tierB-000427 tierB-000470
(And (Goal $e0 $x0) (Theme $e0 $v0))

;; p202497  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.534  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000797 tierB-001485
(And (GroupOf $x0 $v0) (Only $x0 $e0))

;; p202498  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.657  tiers tierB  dominated
;;   e.g. tierB-000246 tierB-000975 tierB-001667
(And (GroupOf $x0 $v0) (Possession $x0 $x1))

;; p202499  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000799 tierB-001111 tierB-001628
(And (GroupOf $x0 $v0) (ProportionOf $x0 $x1 most))

;; p202500  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000799 tierB-001111 tierB-001628
(And (GroupOf $x0 $v0) (ProportionOf $x1 $x0 most))

;; p202501  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.275  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000769 tierB-001046
(And (GroupOf $x0 $v0) (Recipient $e0 $x0))

;; p202502  star  support 4 (occ 6)  size 2  lifted 1  nisurp 0.002  tiers tierB  dominated
;;   e.g. tierB-000292 tierB-000706 tierB-001257
(And (Location $e0 $x0) (Theme $e0 $v0))

;; p202503  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.205  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-001446 tierB-001496
(And (Manner $e0 $v0) (Theme $e1 $e0))

;; p202504  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000666 tierB-001496 tierB-001572
(And (Manner $e0 immediately) (Member $e0 $v0))

;; p202505  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000075 tierB-000407 tierB-000947
(And (Manner $e0 often) (Member $e0 $v0))

;; p202506  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000049 tierB-000921 tierB-001766
(And (Manner $e0 well) (Member $e0 $v0))

;; p202507  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000218 tierB-000969 tierB-000978
(And (Member $e0 $v0) (Might $e0))

;; p202508  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000450 tierB-000971 tierB-001687
(And (Member $e0 $v0) (Permitted $e0))

;; p202509  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000012 tierB-000264 tierB-000917
(And (Member $e0 $v0) (Time $e0 night))

;; p202510  star  support 4 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-001171 tierB-001275 tierB-001387
(And (Member $e0 $v0) (Time $e0 this_year))

;; p202511  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000212 tierB-000686 tierB-001588
(And (Member $e0 $v0) (Time $e0 tonight))

;; p202512  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000799 tierB-001629
(And (Member $e0 $v0) (TimeAtLeast $e0 (Year <num>)))

;; p202513  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.224  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000476 tierB-000541 tierB-001652
(And (Member $x0 $v0) (Member $x0 black))

;; p202514  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.397  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000447 tierB-001248 tierB-001458
(And (Member $x0 $v0) (Member $x0 car))

;; p202515  star  support 4 (occ 4)  size 2  lifted 1  nisurp 1.174  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(And (Member $x0 $v0) (Member $x0 door))

;; p202516  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000036 tierB-000783 tierB-001280
(And (Member $x0 $v0) (Member $x0 little))

;; p202517  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000019 tierB-000832 tierB-001268
(And (Member $x0 $v0) (Member $x0 red))

;; p202518  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.069  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000805 tierB-000951 tierB-001384
(And (Member $x0 $v0) (Member $x0 sound))

;; p202519  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.087  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000618 tierB-000650 tierB-000782
(And (Member $x0 $v0) (Member $x0 water))

;; p202520  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-001070 tierB-001262 tierB-001423
(And (Member $x0 $v0) (Of $x0 $x1))

;; p202521  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-001070 tierB-001262 tierB-001423
(And (Member $x0 $v0) (Of $x1 $x0))

;; p202522  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.069  tiers tierB  dominated
;;   e.g. tierB-000201 tierB-001589 tierB-001605
(And (Member $x0 $v0) (On $e0 $x0))

;; p202523  star  support 4 (occ 5)  size 2  lifted 1  nisurp 0.087  tiers tierB
;;   e.g. tierB-000172 tierB-000421 tierB-000452
(And (Member $x0 $v0) (Ordinal $x0 <num> $v0))

;; p202524  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000081 tierB-000913 tierB-001673
(And (Member $x0 $v0) (To $x1 $x0))

;; p202525  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.743  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000303 tierB-001520
(And (Obligated $e0) (Time $e0 $v0))

;; p202526  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.489  tiers tierB
;;   e.g. tierB-000210 tierB-000504 tierB-000762
(And (Only $v0 $e0) (Past $e0))

;; p202527  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.198  tiers tierB  dominated
;;   e.g. tierB-000079 tierB-000603 tierB-001424
(And (Past $e0) (Stimulus $e0 $v0))

;; p202528  star  support 4 (occ 4)  size 2  lifted 1  nisurp 0.213  tiers tierB  dominated
;;   e.g. tierB-000139 tierB-001677 tierB-001803
(And (Patient $e0 $x0) (Possession $x0 $v0))

;; p202529  star  support 4 (occ 6)  size 2  lifted 2  nisurp 4.762  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000371 tierB-000478
(And (Agent $e0 $v0) (Agent $e0 $v1))

;; p202530  star  support 4 (occ 5)  size 2  lifted 2  nisurp 0.076  tiers tierB  dominated
;;   e.g. tierB-000601 tierB-000910 tierB-001084
(And (Agent $e0 $v0) (Location $e0 $v1))

;; p202531  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.344  tiers tierB
;;   e.g. tierB-000426 tierB-000481 tierB-000946
(And (Degree $e0 $v0 $v1) (Past $e0))

;; p202532  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.341  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000053 tierB-001295 tierB-001708
(And (Degree $e0 $v0 very) (Member $e0 $v1))

;; p202533  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.125  tiers tierB  dominated
;;   e.g. tierB-000261 tierB-000842 tierB-000960
(And (Degree $x0 $v0 $v1) (Experiencer $e0 $x0))

;; p202534  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.486  tiers tierB
;;   e.g. tierB-000365 tierB-000960 tierB-001558
(And (Degree $x0 $v0 $v1) (Past (Member $x0 $v0)))

;; p202535  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000174 tierB-000352 tierB-000365
(And (Degree $x0 $v0 more) (Member $x0 $v1))

;; p202536  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.327  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000518 tierB-000604 tierB-000683
(And (Degree $x0 quantity $v0) (GroupOf $x0 $v1))

;; p202537  star  support 4 (occ 7)  size 2  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000937 tierB-001124 tierB-001307
(And (Directive (And (At $x0 $x1) (Member $x0 $v0))) (Member $x1 $v1))

;; p202538  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.897  tiers tierB  dominated
;;   e.g. tierB-000079 tierB-000115 tierB-000603
(And (Experiencer $e0 $v0) (Stimulus $e0 $v1))

;; p202539  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.279  tiers tierB  dominated
;;   e.g. tierB-000051 tierB-000514 tierB-000542
(And (Experiencer $e0 $v0) (Time $e0 $v1))

;; p202540  star  support 4 (occ 5)  size 2  lifted 2  nisurp 0.711  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000688 tierB-001496
(And (Goal $e0 $v0) (Manner $e0 $v1))

;; p202541  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.793  tiers tierB
;;   e.g. tierB-000384 tierB-000723 tierB-001575
(And (GroupOf $x0 $v0) (Inheritance $x0 $v1))

;; p202542  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.191  tiers tierB
;;   e.g. tierB-000040 tierB-000968 tierB-001769
(And (GroupOf $x0 $v0) (Possession $x0 $v1))

;; p202543  star  support 4 (occ 5)  size 2  lifted 2  nisurp 0.721  tiers tierB  dominated
;;   e.g. tierB-000373 tierB-000970 tierB-001691
(And (Location $e0 $v0) (Patient $e0 $v1))

;; p202544  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.077  tiers tierB
;;   e.g. tierB-000629 tierB-000836 tierB-000866
(And (Member $e0 $v0) (Only $v1 $e0))

;; p202545  star  support 4 (occ 5)  size 2  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000957 tierB-001630 tierB-001778
(And (Member $x0 $v0) (Only $v1 $x0))

;; p202546  star  support 4 (occ 9)  size 2  lifted 2  nisurp 0.553  tiers tierB
;;   e.g. tierB-000187 tierB-000989 tierB-001447
(And (Member $x0 $v0) (PartOf $v1 $x0))

;; p202547  star  support 4 (occ 5)  size 2  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000830 tierB-000992 tierB-001166
(And (Member $x0 $v0) (PartOf $x0 $v1))

;; p202548  star  support 4 (occ 5)  size 2  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000674 tierB-000902 tierB-001383
(And (Member $x0 $v0) (To $x0 $v1))

;; p202549  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.987  tiers tierB
;;   e.g. tierB-000187 tierB-000989 tierB-001020
(And (PartOf $v0 $x0) (PartOf $v1 $x0))

;; p202550  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.995  tiers tierB
;;   e.g. tierB-000065 tierB-000984 tierB-001170
(And (Probably (Degree $x0 $v0 $v1)) (Probably (Member $x0 $v0)))

;; p202551  star  support 4 (occ 4)  size 2  lifted 2  nisurp 0.990  tiers tierB
;;   e.g. tierB-000763 tierB-000812 tierB-001170
(And (Probably (Member $x0 $v0)) (Probably (Member $x0 $v1)))

;; p202552  star  support 4 (occ 4)  size 2  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000846 tierB-001090 tierB-001216
(And (Member $e0 $v0) (Theme $e0 (And (Agent $x0 $v1) (Member $x0 $v2) (Theme $x0 $x1))))

;; p202553  star  support 4 (occ 4)  size 2  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000640 tierB-000914 tierB-001053
(And (Member $x0 $v0) (Past (Measure $x0 $v1 <num> $v2)))

;; p202554  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001134
(Before $e0 $e1)

;; p202555  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-001130 tierB-001222 tierB-001531
(Before $x0 $e0)

;; p202556  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000407 tierB-000518 tierB-000604
(Degree $x0 quantity excessive)

;; p202557  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000937 tierB-001124 tierB-001307
(Directive (And (At $x0 $x1) (Member $x0 look)))

;; p202558  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000411 tierB-000844 tierB-001017
(During $e0 $x0)

;; p202559  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000238 tierB-000313
(Every $e0 <num> day)

;; p202560  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000938
(For $e0 $e1)

;; p202561  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000308 tierB-000555 tierB-001455
(For $x0 $e0)

;; p202562  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000463 tierB-000513 tierB-001553
(GroupOf $x0 day)

;; p202563  star  support 4 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000133 tierB-000738 tierB-000814
(GroupOf $x0 girl)

;; p202564  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000098 tierB-000832 tierB-001246
(GroupOf $x0 leaf)

;; p202565  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000243 tierB-000277 tierB-001068
(GroupOf $x0 man)

;; p202566  star  support 4 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000194 tierB-000794 tierB-001080
(GroupOf $x0 pupil)

;; p202567  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000225 tierB-000533 tierB-001251
(GroupOf $x0 scientist)

;; p202568  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000274 tierB-001058 tierB-001695
(GroupOf $x0 soldier)

;; p202569  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000518 tierB-000972 tierB-001495
(LocatedIn $x0 here)

;; p202570  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000666 tierB-001496 tierB-001572
(Manner $e0 immediately)

;; p202571  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000407 tierB-000947
(Manner $e0 often)

;; p202572  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-000921 tierB-001766
(Manner $e0 well)

;; p202573  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000237 tierB-000444 tierB-001440
(Member $e0 arrive)

;; p202574  star  support 4 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000367 tierB-000368 tierB-000849
(Member $e0 buy)

;; p202575  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000702 tierB-000809 tierB-001166
(Member $e0 cover)

;; p202576  star  support 4 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000030 tierB-000502 tierB-000738
(Member $e0 cry)

;; p202577  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000401 tierB-000563 tierB-001544
(Member $e0 decide)

;; p202578  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000163 tierB-000450 tierB-000556
(Member $e0 enter)

;; p202579  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000579 tierB-000585 tierB-000706
(Member $e0 find)

;; p202580  star  support 4 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000045 tierB-000121 tierB-000801
(Member $e0 fly)

;; p202581  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000026 tierB-000231 tierB-000584
(Member $e0 follow)

;; p202582  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000495 tierB-000999 tierB-001238
(Member $e0 good)

;; p202583  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000087 tierB-001363 tierB-001708
(Member $e0 happen)

;; p202584  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000680 tierB-000690 tierB-000965
(Member $e0 increase)

;; p202585  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001530
(Member $e0 jump)

;; p202586  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000040 tierB-000105 tierB-001086
(Member $e0 lead)

;; p202587  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000649 tierB-001008 tierB-001762
(Member $e0 pass)

;; p202588  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000876 tierB-001486 tierB-001683
(Member $e0 present)

;; p202589  star  support 4 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000044 tierB-000168 tierB-000916
(Member $e0 ready)

;; p202590  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000962 tierB-001035 tierB-001595
(Member $e0 receive)

;; p202591  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000607 tierB-001436 tierB-001566
(Member $e0 require)

;; p202592  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000178 tierB-000339 tierB-001153
(Member $e0 run)

;; p202593  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000864 tierB-000910 tierB-000915
(Member $e0 serve)

;; p202594  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000624 tierB-001536 tierB-001621
(Member $e0 war)

;; p202595  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000971 tierB-001004 tierB-001601
(Member $e0 write)

;; p202596  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000376 tierB-000678 tierB-001503
(Member $x0 beauty)

;; p202597  star  support 4 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000712 tierB-001430 tierB-001528
(Member $x0 bus)

;; p202598  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000794 tierB-000814 tierB-001612
(Member $x0 class)

;; p202599  star  support 4 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000504 tierB-000849 tierB-001177
(Member $x0 computer)

;; p202600  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001052 tierB-001108 tierB-001169
(Member $x0 crowd)

;; p202601  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000049 tierB-000339 tierB-000666
(Member $x0 doctor)

;; p202602  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000319 tierB-000783 tierB-001280
(Member $x0 girl)

;; p202603  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000176 tierB-000474 tierB-001308
(Member $x0 ground)

;; p202604  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000149 tierB-000767 tierB-000836
(Member $x0 hotel)

;; p202605  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000394 tierB-001234 tierB-001246
(Member $x0 ivy)

;; p202606  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001114 tierB-001208 tierB-001480
(Member $x0 lady)

;; p202607  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000036 tierB-000783 tierB-001280
(Member $x0 little)

;; p202608  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000119 tierB-000244 tierB-000574
(Member $x0 matter)

;; p202609  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000141 tierB-000524 tierB-001257
(Member $x0 middle)

;; p202610  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000520 tierB-001253 tierB-001555
(Member $x0 movie)

;; p202611  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000567 tierB-000932 tierB-000992
(Member $x0 original)

;; p202612  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000646 tierB-001152 tierB-001381
(Member $x0 party)

;; p202613  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000876 tierB-001070 tierB-001077
(Member $x0 picture)

;; p202614  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000045 tierB-000132 tierB-000298
(Member $x0 plane)

;; p202615  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000019 tierB-000832 tierB-001268
(Member $x0 red)

;; p202616  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000416 tierB-000468 tierB-000470
(Member $x0 river)

;; p202617  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000134 tierB-000767 tierB-001296
(Member $x0 sea)

;; p202618  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000100 tierB-000605 tierB-000835
(Member $x0 ship)

;; p202619  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000154 tierB-000383 tierB-000445
(Member $x0 snow)

;; p202620  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000768 tierB-001156 tierB-001556
(Member $x0 song)

;; p202621  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000218 tierB-000324 tierB-001044
(Member $x0 store)

;; p202622  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000825 tierB-001218 tierB-001838
(Member $x0 sun)

;; p202623  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000932 tierB-001134 tierB-001447
(Member $x0 system)

;; p202624  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000116 tierB-001317 tierB-001706
(Member $x0 village)

;; p202625  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001204 tierB-001324 tierB-001444
(Member $x0 war)

;; p202626  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000265 tierB-000984 tierB-001161
(Member $x0 windshield)

;; p202627  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000218 tierB-000969 tierB-000978
(Might $e0)

;; p202628  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000450 tierB-000971 tierB-001687
(Permitted $e0)

;; p202629  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000799 tierB-001111 tierB-001628
(ProportionOf $x0 $x1 most)

;; p202630  star  support 4 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000264 tierB-000917
(Time $e0 night)

;; p202631  star  support 4 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-001171 tierB-001275 tierB-001387
(Time $e0 this_year)

;; p202632  star  support 4 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000212 tierB-000686 tierB-001588
(Time $e0 tonight)

;; p202633  star  support 4 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000799 tierB-001629
(TimeAtLeast $e0 (Year <num>))

;; p202634  star  support 4 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000081 tierB-000913 tierB-001673
(To $x0 $x1)

;; p202635  star  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000174 tierB-000352 tierB-000365
(Degree $x0 $v0 more)

;; p202636  star  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000937 tierB-001124 tierB-001307
(Directive (And (At $x0 $x1) (Member $x0 $v0)))

;; p202637  star  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001575
(Inheritance $x0 $v0)

;; p202638  star  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000758 tierB-001236 tierB-001679
(Member $e0 $v0) ~NEG

;; p202639  star  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000957 tierB-001630 tierB-001778
(Only $v0 $x0)

;; p202640  star  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000830 tierB-000992 tierB-001166
(PartOf $x0 $v0)

;; p202641  star  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000664 tierB-001207 tierB-001292
(Past (LocatedIn $x0 $v0))

;; p202642  star  support 4 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000674 tierB-000902 tierB-001383
(To $x0 $v0)

;; p202643  star  support 4 (occ 4)  size 1  lifted 2  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000640 tierB-000914 tierB-001053
(Past (Measure $x0 $v0 <num> $v1))

;; p202644  star  support 4 (occ 4)  size 1  lifted 2  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000065 tierB-000984 tierB-001170
(Probably (Degree $x0 $v0 $v1))

;; p202645  star  support 4 (occ 4)  size 1  lifted 2  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000846 tierB-001090 tierB-001216
(Theme $e0 (And (Agent $x0 $v0) (Member $x0 $v1) (Theme $x0 $x1)))

;; p202646  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.350  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Agent $e2 $x0) (Theme $e0 $e1))

;; p202647  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.480  tiers tierB
;;   e.g. tierB-000470 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Goal $e0 $x1) (Past $e1))

;; p202648  cross  support 3 (occ 9)  size 4  lifted 0  nisurp 0.123  tiers tierB
;;   e.g. tierB-000942 tierB-001275 tierB-001735
(And (Agent $e0 $x0) (Agent $e1 $x0) (Location $e0 $x1) (Past $e1))

;; p202649  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.926  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 begin) (Ongoing $e1))

;; p202650  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 begin) (Past $e0))

;; p202651  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 begin) (Theme $e0 $e1))

;; p202652  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.837  tiers tierB  signal conj-pattern
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 try) (Theme $e0 $e1))

;; p202653  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e2))

;; p202654  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.221  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e1 $e2))

;; p202655  cross  support 3 (occ 4)  size 4  lifted 0  nisurp -0.670  tiers tierB
;;   e.g. tierB-000258 tierB-000942 tierB-001801
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e1 $x1))

;; p202656  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.350  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e2 $e1))

;; p202657  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.708  tiers tierB
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (To $e0 $e1))

;; p202658  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.133  tiers tierB
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e2) (Theme $e2 $e0))

;; p202659  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.452  tiers tierB
;;   e.g. tierB-000942 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Patient $e0 $x1) (Theme $e1 $e0))

;; p202660  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.361  tiers tierB
;;   e.g. tierB-000339 tierB-000783 tierB-001782
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Past $e1) (Theme $e0 $x1))

;; p202661  cross  support 3 (occ 3)  size 4  lifted 0  nisurp -0.192  tiers tierB
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Experiencer $e1 $x1) (Patient $e0 $x1) (Result $e0 $e1))

;; p202662  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.621  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))

;; p202663  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.621  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))

;; p202664  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.621  tiers tierB  signal conj-pattern
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))

;; p202665  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.611  tiers tierB  signal conj-pattern
;;   e.g. tierB-001251 tierB-001693 tierB-001762
(And (Agent $e0 $x0) (Member $x1 new) (Past $e0) (Theme $e0 $x1))

;; p202666  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.823  tiers tierB  signal conj-pattern
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 have) (Theme $e0 $x0))

;; p202667  cross  support 3 (occ 4)  size 4  lifted 0  nisurp 0.912  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Patient $e1 $x0))

;; p202668  cross  support 3 (occ 4)  size 4  lifted 0  nisurp 0.912  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e1 get) (Ongoing $e1) (Result $e1 $e0))

;; p202669  cross  support 3 (occ 4)  size 4  lifted 0  nisurp 0.863  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e1 get) (Patient $e1 $x0) (Result $e1 $e0))

;; p202670  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.863  tiers tierB  signal conj-pattern
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Experiencer $e0 $x0) (Member $e1 leave) (Patient $e1 $x0) (Result $e1 $e0))

;; p202671  cross  support 3 (occ 4)  size 4  lifted 0  nisurp 0.863  tiers tierB  signal conj-pattern
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Experiencer $e0 $x0) (Member $e1 turn) (Patient $e1 $x0) (Result $e1 $e0))

;; p202672  cross  support 3 (occ 4)  size 4  lifted 0  nisurp 0.455  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Ongoing $e1) (Patient $e1 $x0) (Result $e1 $e0))

;; p202673  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.514  tiers tierB  signal conj-pattern
;;   e.g. tierB-000265 tierB-000654 tierB-001446
(And (Member $e0 start) (Past $e0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p202674  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.514  tiers tierB  signal conj-pattern
;;   e.g. tierB-000265 tierB-000942 tierB-001446
(And (Member $e0 start) (Past $e0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p202675  cross  support 3 (occ 4)  size 4  lifted 0  nisurp 0.708  tiers tierB  signal conj-pattern
;;   e.g. tierB-000030 tierB-001515 tierB-001873
(And (Member $e0 stop) (Past $e0) (Past $e1) (Theme $e0 $e1))

;; p202676  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.097  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Ongoing $e0) (Past $e1) (Patient $e0 $x0) (Patient $e1 $x0))

;; p202677  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Ongoing $e0) (Past $e1) (Patient $e1 $x0) (Theme $e1 $e0))

;; p202678  cross  support 3 (occ 3)  size 4  lifted 0  nisurp 0.514  tiers tierB
;;   e.g. tierB-000265 tierB-001394 tierB-001446
(And (Past $e0) (Patient $e0 $x0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p202679  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.384  tiers tierB
;;   e.g. tierB-000502 tierB-000951 tierB-000962
(And (Agent $e0 $v0) (Agent $e1 $v0) (Location $e0 $x0) (Past $e0))

;; p202680  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.926  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 begin) (Ongoing $e1))

;; p202681  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 begin) (Past $e0))

;; p202682  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.891  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 begin) (Theme $e0 $e1))

;; p202683  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.855  tiers tierB  signal conj-pattern
;;   e.g. tierB-000173 tierB-000951 tierB-001809
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 make) (Ongoing $e0))

;; p202684  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000400 tierB-000547
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 try) (Past $e0))

;; p202685  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.324  tiers tierB
;;   e.g. tierB-000139 tierB-000412 tierB-000951
(And (Agent $e0 $v0) (Agent $e1 $v0) (Past $e0) (Patient $e1 $x0))

;; p202686  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.416  tiers tierB
;;   e.g. tierB-000078 tierB-000147 tierB-000252
(And (Agent $e0 $v0) (Agent $e1 $v0) (Past $e0) (To $e0 $e1))

;; p202687  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.079  tiers tierB
;;   e.g. tierB-000166 tierB-000410 tierB-000622
(And (Agent $e0 $v0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $e1))

;; p202688  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.691  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Past $e0) (Patient $e2 $v0))

;; p202689  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.638  tiers tierB
;;   e.g. tierB-001185 tierB-001538 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Past $e0) (Result $e0 $e1))

;; p202690  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.691  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Past $e0) (Result $e2 $e1))

;; p202691  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.674  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Past $e2) (Patient $e2 $v0))

;; p202692  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.638  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Past $e2) (Result $e2 $e1))

;; p202693  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.565  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Patient $e2 $v0) (Result $e2 $e1))

;; p202694  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.382  tiers tierB  dominated
;;   e.g. tierB-000392 tierB-000425 tierB-001594
(And (Agent $e0 $v0) (Experiencer $e1 $x0) (Past $e0) (Patient $e0 $x0))

;; p202695  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.454  tiers tierB  dominated
;;   e.g. tierB-000392 tierB-000425 tierB-001594
(And (Agent $e0 $v0) (Experiencer $e1 $x0) (Past $e0) (Result $e0 $e1))

;; p202696  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.746  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Member $e0 begin) (Ongoing $e1) (Theme $e0 $e1))

;; p202697  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.746  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Member $e1 begin) (Ongoing $e0) (Theme $e1 $e0))

;; p202698  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.708  tiers tierB  signal conj-pattern
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Member $e1 begin) (Past $e1) (Theme $e1 $e0))

;; p202699  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.611  tiers tierB  signal conj-pattern
;;   e.g. tierB-000117 tierB-000400 tierB-000547
(And (Agent $e0 $v0) (Member $e1 try) (Past $e1) (Theme $e1 $e0))

;; p202700  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.263  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Past $e0) (Past $e1) (Patient $e1 $v0))

;; p202701  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Past $e0) (Patient $e1 $v0) (Result $e1 $e2))

;; p202702  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.639  tiers tierB
;;   e.g. tierB-000252 tierB-001079 tierB-001809
(And (Agent $e0 $v0) (Past $e0) (Patient $e1 $v0) (Theme $e0 $x0))

;; p202703  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.674  tiers tierB
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Past $e1) (Patient $e1 $v0) (Result $e1 $e2))

;; p202704  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Goal $e0 $x1) (Member $e0 $v0))

;; p202705  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Goal $e0 $x1) (Member $e1 $v0))

;; p202706  cross  support 3 (occ 7)  size 4  lifted 1  nisurp 0.371  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Goal $e0 $x1) (Member $x0 $v0))

;; p202707  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Goal $e0 $x1) (Member $x1 $v0))

;; p202708  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.171  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000738 tierB-001138
(And (Agent $e0 $x0) (Agent $e1 $x0) (GroupOf $x0 $v0) (Theme $e0 $e1))

;; p202709  cross  support 3 (occ 9)  size 4  lifted 1  nisurp -0.061  tiers tierB
;;   e.g. tierB-000942 tierB-001275 tierB-001933
(And (Agent $e0 $x0) (Agent $e1 $x0) (Location $e0 $x1) (Member $x0 $v0))

;; p202710  cross  support 3 (occ 9)  size 4  lifted 1  nisurp -0.355  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001275 tierB-001735
(And (Agent $e0 $x0) (Agent $e1 $x0) (Location $e0 $x1) (Member $x1 $v0))

;; p202711  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.079  tiers tierB
;;   e.g. tierB-000782 tierB-001629 tierB-001873
(And (Agent $e0 $x0) (Agent $e1 $x0) (Manner $e0 $v0) (Past $e0))

;; p202712  cross  support 3 (occ 7)  size 4  lifted 1  nisurp -0.894  tiers tierB
;;   e.g. tierB-000101 tierB-001275 tierB-001629
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Member $e1 $v0))

;; p202713  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Member $e1 begin))

;; p202714  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Member $e1 try))

;; p202715  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.300  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Theme $e0 $e2))

;; p202716  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.300  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Theme $e1 $e2))

;; p202717  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.084  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Theme $e2 $e0))

;; p202718  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.084  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (Theme $e2 $e1))

;; p202719  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (To $e0 $e1))

;; p202720  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 $v0) (To $e1 $e0))

;; p202721  cross  support 3 (occ 6)  size 4  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001169 tierB-001219
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 start) (Member $x0 $v0))

;; p202722  cross  support 3 (occ 6)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 try) (Member $x0 $v0))

;; p202723  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.300  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e2 $v0) (Theme $e0 $e2))

;; p202724  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.084  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e2 $v0) (Theme $e2 $e0))

;; p202725  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.056  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 $v0) (Theme $e0 $e2))

;; p202726  cross  support 3 (occ 10)  size 4  lifted 1  nisurp -0.298  tiers tierB
;;   e.g. tierB-000101 tierB-000942 tierB-001801
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 $v0) (Theme $e0 $x1))

;; p202727  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.214  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 $v0) (Theme $e2 $e0))

;; p202728  cross  support 3 (occ 5)  size 4  lifted 1  nisurp -0.298  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-000942 tierB-001801
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x1 $v0) (Theme $e0 $x1))

;; p202729  cross  support 3 (occ 9)  size 4  lifted 1  nisurp 0.416  tiers tierB
;;   e.g. tierB-001035 tierB-001275 tierB-001629
(And (Agent $e0 $x0) (Agent $e1 $x0) (Past $e0) (Theme $e0 $v0))

;; p202730  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.797  tiers tierB
;;   e.g. tierB-000575 tierB-001430 tierB-001618
(And (Agent $e0 $x0) (Agent $e1 $x1) (Member $e0 $v0) (Member $e1 $v0))

;; p202731  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.462  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000772 tierB-001534
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Past $e0))

;; p202732  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.462  tiers tierB
;;   e.g. tierB-000738 tierB-000772 tierB-001534
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Member $e0 $v0) (Past $e0))

;; p202733  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.315  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000379 tierB-001266
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (GroupOf $x1 $v0) (Theme $e0 $x1))

;; p202734  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.315  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000379 tierB-001266
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $e0 $v0) (Theme $e0 $x1))

;; p202735  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000101 tierB-000379 tierB-001266
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Member $x0 $v0) (Theme $e0 $x1))

;; p202736  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.846  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000783 tierB-001782
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0) (Theme $e0 $x1))

;; p202737  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-001496
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0) (Theme $e1 $e0))

;; p202738  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.846  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000783 tierB-001782
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e1 $v0) (Theme $e0 $x1))

;; p202739  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000160 tierB-000339 tierB-001496
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e1 $v0) (Theme $e1 $e0))

;; p202740  cross  support 3 (occ 4)  size 4  lifted 1  nisurp -0.658  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000783 tierB-001782
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $x0 $v0) (Theme $e0 $x1))

;; p202741  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.079  tiers tierB
;;   e.g. tierB-000688 tierB-000783 tierB-001782
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Past $e1) (Past (Member $x0 $v0)))

;; p202742  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.409  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Experiencer $e1 $x1) (Member $e0 $v0) (Patient $e0 $x1))

;; p202743  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.246  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Experiencer $e1 $x1) (Member $e0 $v0) (Result $e0 $e1))

;; p202744  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.409  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Experiencer $e1 $x1) (Member $e1 $v0) (Patient $e0 $x1))

;; p202745  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.246  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Experiencer $e1 $x1) (Member $e1 $v0) (Result $e0 $e1))

;; p202746  cross  support 3 (occ 5)  size 4  lifted 1  nisurp -0.406  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Experiencer $e1 $x1) (Member $x1 $v0) (Patient $e0 $x1))

;; p202747  cross  support 3 (occ 5)  size 4  lifted 1  nisurp -0.246  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Experiencer $e1 $x1) (Member $x1 $v0) (Result $e0 $e1))

;; p202748  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000453 tierB-001266 tierB-001626
(And (Agent $e0 $x0) (Future $e0) (Member $x0 $v0) (Theme $e0 $x1))

;; p202749  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000387 tierB-001534 tierB-001963
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Member $x1 $v0))

;; p202750  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.315  tiers tierB
;;   e.g. tierB-000462 tierB-001132 tierB-001860
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $x1 $v0) (Theme $e0 $x2))

;; p202751  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(And (Agent $e0 $x0) (Goal $e0 home) (Member $x0 $v0) (Past $e0))

;; p202752  cross  support 3 (occ 4)  size 4  lifted 1  nisurp -0.684  tiers tierB
;;   e.g. tierB-000772 tierB-001035 tierB-001618
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (GroupOf $x1 $v0) (Past $e0))

;; p202753  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.133  tiers tierB
;;   e.g. tierB-000772 tierB-001035 tierB-001628
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (GroupOf $x1 $v0) (SubsetOf $x0 $x1))

;; p202754  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.655  tiers tierB  signal conj-pattern
;;   e.g. tierB-000277 tierB-000387 tierB-001534
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 come) (Past $e0))

;; p202755  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.793  tiers tierB  signal conj-pattern
;;   e.g. tierB-001125 tierB-001433 tierB-001840
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 play) (Ongoing $e0))

;; p202756  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.724  tiers tierB  signal conj-pattern
;;   e.g. tierB-000782 tierB-001008 tierB-001511
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 swim) (Ongoing $e0))

;; p202757  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.585  tiers tierB
;;   e.g. tierB-000801 tierB-001068 tierB-001530
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Ongoing $e0) (Past $e0))

;; p202758  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.448  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000738 tierB-001138
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Ongoing $e0) (Theme $e1 $e0))

;; p202759  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000485 tierB-000738 tierB-001138
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Ongoing $e1) (Theme $e0 $e1))

;; p202760  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-001457 tierB-001530 tierB-001840
(And (Agent $e0 $x0) (GroupOf $x0 boy) (Member $e0 $v0) (Ongoing $e0))

;; p202761  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001125 tierB-001245 tierB-001511
(And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1) (Member $e0 $v0))

;; p202762  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-001125 tierB-001245 tierB-001511
(And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1) (Member $x1 $v0))

;; p202763  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000291 tierB-000942 tierB-001649
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x0 $v0) (Patient $e0 $x2))

;; p202764  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.141  tiers tierB
;;   e.g. tierB-000291 tierB-000942 tierB-001649
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $x1 $v0) (Patient $e0 $x2))

;; p202765  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001283 tierB-001933
(And (Agent $e0 $x0) (Location $e1 $x1) (Member $e0 $v0) (Theme $e0 $e1))

;; p202766  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000942 tierB-001283 tierB-001933
(And (Agent $e0 $x0) (Location $e1 $x1) (Member $e1 $v0) (Theme $e0 $e1))

;; p202767  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 begin) (Theme $e1 $e0))

;; p202768  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 try) (Theme $e1 $e0))

;; p202769  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000762 tierB-000853 tierB-001932
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 company) (Past $e0))

;; p202770  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.416  tiers tierB  signal conj-pattern
;;   e.g. tierB-001773 tierB-001801 tierB-001803
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 man) (Past $e0))

;; p202771  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000045 tierB-000132 tierB-000298
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 plane) (Past $e0))

;; p202772  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.141  tiers tierB  signal conj-pattern
;;   e.g. tierB-000978 tierB-001661 tierB-001881
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 thing) (Theme $e0 $x1))

;; p202773  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.458  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-000950 tierB-001926
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x1 door) (Patient $e0 $x1))

;; p202774  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.422  tiers tierB
;;   e.g. tierB-001066 tierB-001243 tierB-001586
(And (Agent $e0 $x0) (Member $e0 $v0) (PartOf $x1 $x2) (Theme $e0 $x1))

;; p202775  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000316 tierB-001720 tierB-001911
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e1) (Stimulus $e1 $e0))

;; p202776  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e1) (To $e1 $e0))

;; p202777  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000423 tierB-000975 tierB-001836
(And (Agent $e0 $x0) (Member $e0 $v0) (Possession $x1 $x0) (Theme $e0 $x1))

;; p202778  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Member $e0 begin) (Member $e1 $v0) (Theme $e0 $e1))

;; p202779  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000852 tierB-001342 tierB-001990
(And (Agent $e0 $x0) (Member $e0 capture) (Member $x1 $v0) (Theme $e0 $x1))

;; p202780  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000775 tierB-001649 tierB-001875
(And (Agent $e0 $x0) (Member $e0 cause) (Member $x0 $v0) (Past $e0))

;; p202781  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000871 tierB-000889 tierB-001983
(And (Agent $e0 $x0) (Member $e0 jump) (Member $x0 $v0) (Past $e0))

;; p202782  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001169 tierB-001219
(And (Agent $e0 $x0) (Member $e0 start) (Member $x0 $v0) (Past $e0))

;; p202783  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001169 tierB-001219
(And (Agent $e0 $x0) (Member $e0 start) (Member $x0 $v0) (Theme $e0 $e1))

;; p202784  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000782 tierB-001008 tierB-001268
(And (Agent $e0 $x0) (Member $e0 swim) (Member $x0 $v0) (Ongoing $e0))

;; p202785  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Member $e0 try) (Member $e1 $v0) (Theme $e0 $e1))

;; p202786  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000469 tierB-000470 tierB-001773
(And (Agent $e0 $x0) (Member $e0 try) (Member $x0 $v0) (Past $e0))

;; p202787  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Member $e0 try) (Member $x0 $v0) (Theme $e0 $e1))

;; p202788  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.688  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Member $e1 $v0) (Member $x1 $v0) (Patient $e0 $x1))

;; p202789  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.246  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Member $e1 $v0) (Member $x1 $v0) (Result $e0 $e1))

;; p202790  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.415  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Member $e1 $v0) (Past $e0) (To $e0 $e1))

;; p202791  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000316 tierB-001720 tierB-001911
(And (Agent $e0 $x0) (Member $e1 $v0) (Past $e1) (Stimulus $e1 $e0))

;; p202792  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Member $e1 $v0) (Past $e1) (To $e1 $e0))

;; p202793  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.192  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Member $e1 $v0) (Patient $e0 $x1) (Result $e0 $e1))

;; p202794  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.087  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Member $e1 $v0) (Patient $e0 $x1) (Theme $e1 $e0))

;; p202795  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000942 tierB-001169 tierB-001219
(And (Agent $e0 $x0) (Member $e1 start) (Member $x0 $v0) (Theme $e1 $e0))

;; p202796  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Member $e1 try) (Member $x0 $v0) (Theme $e1 $e0))

;; p202797  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000747 tierB-000950 tierB-001926
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x1 door) (Patient $e0 $x1))

;; p202798  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Member $x0 $v0) (Patient $e0 $x1) (Theme $e1 $e0))

;; p202799  cross  support 3 (occ 4)  size 4  lifted 1  nisurp -0.035  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Member $x0 $v0) (Patient $e1 $x1) (Theme $e0 $e1))

;; p202800  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000423 tierB-000975 tierB-001836
(And (Agent $e0 $x0) (Member $x0 $v0) (Possession $x1 $x0) (Theme $e0 $x1))

;; p202801  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-001182 tierB-001773 tierB-001803
(And (Agent $e0 $x0) (Member $x0 man) (Member $x1 $v0) (Patient $e0 $x1))

;; p202802  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(And (Agent $e0 $x0) (Member $x1 $v0) (Over $e0 $x1) (Past $e0))

;; p202803  cross  support 3 (occ 5)  size 4  lifted 1  nisurp -0.192  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Member $x1 $v0) (Patient $e0 $x1) (Result $e0 $e1))

;; p202804  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.268  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Member $x1 $v0) (Patient $e0 $x1) (Theme $e1 $e0))

;; p202805  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000423 tierB-000975 tierB-001836
(And (Agent $e0 $x0) (Member $x1 $v0) (Possession $x1 $x0) (Theme $e0 $x1))

;; p202806  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.675  tiers tierB
;;   e.g. tierB-000470 tierB-000485 tierB-000622
(And (Agent $e0 $x0) (Past $e1) (Theme $e0 $v0) (Theme $e1 $e0))

;; p202807  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(And (Agent $e0 mark) (Agent $e1 mark) (Member $e0 $v0) (Past $e0))

;; p202808  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(And (Agent $e0 mark) (Agent $e1 mark) (Member $e0 $v0) (Past $e1))

;; p202809  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.172  tiers tierB
;;   e.g. tierB-000616 tierB-001000 tierB-001757
(And (Already $e0) (Member $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p202810  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001302
(And (Before $e0 $e1) (Member $e0 $v0) (Past $e0) (Past $e1))

;; p202811  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000412 tierB-000688 tierB-001302
(And (Before $e0 $e1) (Member $e1 $v0) (Past $e0) (Past $e1))

;; p202812  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Holder $e0 $x1) (Theme $e0 $x0))

;; p202813  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $e0 $v0) (Theme $e0 $x0))

;; p202814  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Member $x1 $v0) (Theme $e0 $x0))

;; p202815  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.876  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Experiencer $e0 $v0) (Member $e1 make) (Ongoing $e1) (Patient $e1 $v0))

;; p202816  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.876  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Experiencer $e0 $v0) (Member $e1 make) (Ongoing $e1) (Result $e1 $e0))

;; p202817  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001504 tierB-001809
(And (Experiencer $e0 $v0) (Member $e1 make) (Past $e1) (Patient $e1 $v0))

;; p202818  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001504 tierB-001809
(And (Experiencer $e0 $v0) (Member $e1 make) (Past $e1) (Result $e1 $e0))

;; p202819  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001185 tierB-001809
(And (Experiencer $e0 $v0) (Ongoing $e1) (Past $e1) (Result $e1 $e0))

;; p202820  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.703  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Experiencer $e0 $v0) (Ongoing $e1) (Patient $e1 $v0) (Result $e1 $e0))

;; p202821  cross  support 3 (occ 5)  size 4  lifted 1  nisurp -0.964  tiers tierB
;;   e.g. tierB-000596 tierB-000786 tierB-000832
(And (Experiencer $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0) (Member $x0 $v0))

;; p202822  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e1 get) (Patient $e1 $x0))

;; p202823  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e1 get) (Result $e1 $e0))

;; p202824  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e1 leave) (Patient $e1 $x0))

;; p202825  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e1 leave) (Result $e1 $e0))

;; p202826  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e1 turn) (Patient $e1 $x0))

;; p202827  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e1 turn) (Result $e1 $e0))

;; p202828  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000425 tierB-000747 tierB-000880
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v0) (Member $x0 door))

;; p202829  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.228  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Ongoing $e1) (Patient $e1 $x0))

;; p202830  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.430  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Ongoing $e1) (Result $e1 $e0))

;; p202831  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000339 tierB-000455 tierB-001496
(And (Experiencer $e0 $x0) (Member $e0 need) (Member $e1 $v0) (Theme $e0 $e1))

;; p202832  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-001334 tierB-001753 tierB-001891
(And (Experiencer $e0 $x0) (Member $e0 sleep) (Member $x0 $v0) (Ongoing $e0))

;; p202833  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.228  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Ongoing $e1) (Patient $e1 $x0))

;; p202834  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.430  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Ongoing $e1) (Result $e1 $e0))

;; p202835  cross  support 3 (occ 6)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e1 get) (Member $x0 $v0) (Patient $e1 $x0))

;; p202836  cross  support 3 (occ 6)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e1 get) (Member $x0 $v0) (Result $e1 $e0))

;; p202837  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Experiencer $e0 $x0) (Member $e1 leave) (Member $x0 $v0) (Patient $e1 $x0))

;; p202838  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Experiencer $e0 $x0) (Member $e1 leave) (Member $x0 $v0) (Result $e1 $e0))

;; p202839  cross  support 3 (occ 8)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Experiencer $e0 $x0) (Member $e1 turn) (Member $x0 $v0) (Patient $e1 $x0))

;; p202840  cross  support 3 (occ 8)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Experiencer $e0 $x0) (Member $e1 turn) (Member $x0 $v0) (Result $e1 $e0))

;; p202841  cross  support 3 (occ 6)  size 4  lifted 1  nisurp 0.348  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Ongoing $e1) (Patient $e1 $x0))

;; p202842  cross  support 3 (occ 6)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Ongoing $e1) (Result $e1 $e0))

;; p202843  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-001563 tierB-001579 tierB-001902
(And (Goal $e0 $x0) (Manner $e0 quickly) (Member $x0 $v0) (Past $e0))

;; p202844  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000387 tierB-001534 tierB-001963
(And (Goal $e0 $x0) (Member $e0 come) (Member $x0 $v0) (Past $e0))

;; p202845  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.353  tiers tierB
;;   e.g. tierB-000482 tierB-001453 tierB-001579
(And (Goal $e0 $x0) (Member $x1 $v0) (Past $e0) (Patient $e0 $x1))

;; p202846  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.189  tiers tierB
;;   e.g. tierB-000834 tierB-001037 tierB-001860
(And (Goal $e0 $x0) (Member $x1 $v0) (Past $e0) (Theme $e0 $x1))

;; p202847  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.793  tiers tierB  signal conj-pattern
;;   e.g. tierB-000124 tierB-000196 tierB-000723
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (ProportionOf $x0 $x1 some) (SubsetOf $x0 $x1))

;; p202848  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.125  tiers tierB
;;   e.g. tierB-000797 tierB-001412 tierB-001467
(And (GroupOf $x0 $v0) (Holder $e0 $x1) (Past $e0) (Theme $e0 $x0))

;; p202849  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.375  tiers tierB
;;   e.g. tierB-000034 tierB-000838 tierB-001649
(And (GroupOf $x0 $v0) (Location $e0 $x1) (Past $e0) (Patient $e0 $x0))

;; p202850  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.498  tiers tierB  dominated
;;   e.g. tierB-001394 tierB-001816 tierB-001940
(And (GroupOf $x0 $v0) (Ongoing $e0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p202851  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.517  tiers tierB  dominated
;;   e.g. tierB-001394 tierB-001816 tierB-001940
(And (GroupOf $x0 $v0) (Ongoing $e0) (Patient $e0 $x0) (Theme $e1 $e0))

;; p202852  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.655  tiers tierB  dominated
;;   e.g. tierB-001394 tierB-001816 tierB-001940
(And (GroupOf $x0 $v0) (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))

;; p202853  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.586  tiers tierB
;;   e.g. tierB-000338 tierB-000779 tierB-001364
(And (GroupOf $x0 $v0) (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))

;; p202854  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.655  tiers tierB
;;   e.g. tierB-001394 tierB-001816 tierB-001940
(And (GroupOf $x0 $v0) (Patient $e0 $x0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p202855  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.226  tiers tierB  signal conj-pattern
;;   e.g. tierB-000196 tierB-000412 tierB-000771
(And (GroupOf $x0 person) (Member $e0 $v0) (Past $e0) (Patient $e0 $x0))

;; p202856  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.172  tiers tierB
;;   e.g. tierB-000392 tierB-001143 tierB-001541
(And (Instrument $e0 $x0) (Member $x1 $v0) (Past $e0) (Patient $e0 $x1))

;; p202857  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.575  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000680 tierB-001359
(And (LocatedIn $x0 $x1) (Member $e0 $v0) (Past $e0) (Patient $e0 $x0))

;; p202858  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.575  tiers tierB
;;   e.g. tierB-000265 tierB-000680 tierB-001359
(And (LocatedIn $x0 $x1) (Member $x1 $v0) (Past $e0) (Patient $e0 $x0))

;; p202859  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(And (Location $e0 $x0) (Member $e0 live) (Member $x0 $v0) (Member $x0 house))

;; p202860  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(And (Location $e0 $x0) (Member $e0 walk) (Member $x0 $v0) (Ongoing $e0))

;; p202861  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000148 tierB-000805 tierB-000951
(And (Location $e0 $x0) (Member $e0 walk) (Member $x0 $v0) (Past $e0))

;; p202862  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.087  tiers tierB
;;   e.g. tierB-000217 tierB-000942 tierB-001893
(And (Location $e0 $x0) (Member $x0 $v0) (Ongoing $e0) (Patient $e0 $x1))

;; p202863  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.611  tiers tierB
;;   e.g. tierB-000087 tierB-001515 tierB-001873
(And (Manner $e0 $v0) (Past $e0) (Past $e1) (Theme $e0 $e1))

;; p202864  cross  support 3 (occ 5)  size 4  lifted 1  nisurp -0.879  tiers tierB
;;   e.g. tierB-000101 tierB-000198 tierB-000367
(And (Member $e0 $v0) (Member $e1 $v0) (Theme $e0 $x0) (Theme $e1 $x1))

;; p202865  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.121  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 $v0) (Member $e1 get) (Member $x0 $v0) (Patient $e1 $x0))

;; p202866  cross  support 3 (occ 4)  size 4  lifted 1  nisurp -0.035  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 $v0) (Member $e1 get) (Member $x0 $v0) (Result $e1 $e0))

;; p202867  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 $v0) (Member $e1 get) (Patient $e1 $x0) (Result $e1 $e0))

;; p202868  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Member $e0 $v0) (Member $e1 leave) (Member $x0 $v0) (Patient $e1 $x0))

;; p202869  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Member $e0 $v0) (Member $e1 leave) (Member $x0 $v0) (Result $e1 $e0))

;; p202870  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Member $e0 $v0) (Member $e1 leave) (Patient $e1 $x0) (Result $e1 $e0))

;; p202871  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Member $e0 $v0) (Member $e1 make) (Ongoing $e1) (Result $e1 $e0))

;; p202872  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-001515 tierB-001873
(And (Member $e0 $v0) (Member $e1 stop) (Past $e0) (Theme $e1 $e0))

;; p202873  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-001515 tierB-001873
(And (Member $e0 $v0) (Member $e1 stop) (Past $e1) (Theme $e1 $e0))

;; p202874  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.121  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Member $e0 $v0) (Member $e1 turn) (Member $x0 $v0) (Patient $e1 $x0))

;; p202875  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Member $e0 $v0) (Member $e1 turn) (Member $x0 $v0) (Result $e1 $e0))

;; p202876  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000476 tierB-000654 tierB-001675
(And (Member $e0 $v0) (Member $e1 turn) (Past $e1) (Result $e1 $e0))

;; p202877  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Member $e0 $v0) (Member $e1 turn) (Patient $e1 $x0) (Result $e1 $e0))

;; p202878  cross  support 3 (occ 4)  size 4  lifted 1  nisurp -0.858  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 $v0) (Member $x0 $v0) (Ongoing $e1) (Patient $e1 $x0))

;; p202879  cross  support 3 (occ 4)  size 4  lifted 1  nisurp -0.449  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 $v0) (Member $x0 $v0) (Ongoing $e1) (Result $e1 $e0))

;; p202880  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000890 tierB-001163 tierB-001302
(And (Member $e0 $v0) (Member $x0 fire) (Past $e0) (Patient $e0 $x0))

;; p202881  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000876 tierB-001070 tierB-001423
(And (Member $e0 $v0) (Member $x0 picture) (Past $e0) (Theme $e0 $x0))

;; p202882  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-001520 tierB-001622 tierB-001761
(And (Member $e0 $v0) (Member $x0 thing) (Obligated $e0) (Patient $e0 $x0))

;; p202883  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001130 tierB-001557 tierB-001940
(And (Member $e0 $v0) (Ongoing $e0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p202884  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.319  tiers tierB
;;   e.g. tierB-000325 tierB-001185 tierB-001809
(And (Member $e0 $v0) (Ongoing $e1) (Past $e1) (Result $e1 $e0))

;; p202885  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001130 tierB-001557 tierB-001940
(And (Member $e0 $v0) (Ongoing $e1) (Patient $e0 $x0) (Theme $e1 $e0))

;; p202886  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.455  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 $v0) (Ongoing $e1) (Patient $e1 $x0) (Result $e1 $e0))

;; p202887  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000547 tierB-001219
(And (Member $e0 $v0) (Past $e0) (Recipient $e1 $x0) (Theme $e0 $e1))

;; p202888  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.795  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(And (Member $e0 $v0) (Past $e0) (Theme $e0 $e1) (Theme $e1 $x0))

;; p202889  cross  support 3 (occ 5)  size 4  lifted 1  nisurp -0.795  tiers tierB  dominated
;;   e.g. tierB-000162 tierB-000636 tierB-001526
(And (Member $e0 $v0) (Past $e0) (Theme $e0 $x0) (Theme $e1 $x0))

;; p202890  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000485 tierB-000547 tierB-001219
(And (Member $e0 $v0) (Past $e1) (Recipient $e0 $x0) (Theme $e1 $e0))

;; p202891  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.795  tiers tierB
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(And (Member $e0 $v0) (Past $e1) (Theme $e0 $x0) (Theme $e1 $e0))

;; p202892  cross  support 3 (occ 5)  size 4  lifted 1  nisurp -0.795  tiers tierB
;;   e.g. tierB-000162 tierB-000636 tierB-001526
(And (Member $e0 $v0) (Past $e1) (Theme $e0 $x0) (Theme $e1 $x0))

;; p202893  cross  support 3 (occ 6)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000367 tierB-000368 tierB-001690
(And (Member $e0 buy) (Member $x0 $v0) (Past $e0) (Theme $e0 $x0))

;; p202894  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000089 tierB-000728 tierB-000863
(And (Member $e0 create) (Member $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p202895  cross  support 3 (occ 4)  size 4  lifted 1  nisurp -0.035  tiers tierB  signal conj-pattern
;;   e.g. tierB-000609 tierB-001306 tierB-001975
(And (Member $e0 fall) (Member $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p202896  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000456 tierB-000779 tierB-001364
(And (Member $e0 fall) (Member $x0 $v0) (Past $e0) (Source $e0 $x0))

;; p202897  cross  support 3 (occ 6)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 get) (Member $x0 $v0) (Patient $e0 $x0) (Result $e0 $e1))

;; p202898  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.035  tiers tierB  signal conj-pattern
;;   e.g. tierB-000067 tierB-001197 tierB-001399
(And (Member $e0 kill) (Member $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p202899  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Member $e0 leave) (Member $x0 $v0) (Patient $e0 $x0) (Result $e0 $e1))

;; p202900  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000951 tierB-001182 tierB-001457
(And (Member $e0 make) (Member $x0 $v0) (Ongoing $e0) (Patient $e0 $x0))

;; p202901  cross  support 3 (occ 5)  size 4  lifted 1  nisurp -0.264  tiers tierB  signal conj-pattern
;;   e.g. tierB-000073 tierB-001339 tierB-001594
(And (Member $e0 make) (Member $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p202902  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000876 tierB-001486 tierB-001932
(And (Member $e0 present) (Member $x0 $v0) (Past $e0) (Theme $e0 $x0))

;; p202903  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000962 tierB-001595 tierB-001693
(And (Member $e0 receive) (Member $x0 $v0) (Past $e0) (Theme $e0 $x0))

;; p202904  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001446 tierB-001940
(And (Member $e0 start) (Member $x0 $v0) (Patient $e0 $x0) (Theme $e0 $e1))

;; p202905  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000383 tierB-000482 tierB-001027
(And (Member $e0 stick) (Member $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p202906  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000476 tierB-000654 tierB-001579
(And (Member $e0 turn) (Member $x0 $v0) (Past $e0) (Patient $e0 $x0))

;; p202907  cross  support 3 (occ 8)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Member $e0 turn) (Member $x0 $v0) (Patient $e0 $x0) (Result $e0 $e1))

;; p202908  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.242  tiers tierB  signal conj-pattern
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(And (Member $x0 $v0) (Member $x0 door) (Past $e0) (Patient $e0 $x0))

;; p202909  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-001070 tierB-001262 tierB-001423
(And (Member $x0 $v0) (Of $x0 $x1) (Past $e0) (Theme $e0 $x0))

;; p202910  cross  support 3 (occ 3)  size 4  lifted 1  nisurp 0.172  tiers tierB
;;   e.g. tierB-001070 tierB-001262 tierB-001423
(And (Member $x0 $v0) (Of $x1 $x0) (Past $e0) (Theme $e0 $x1))

;; p202911  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.379  tiers tierB
;;   e.g. tierB-001110 tierB-001359 tierB-001765
(And (Member $x0 $v0) (Ongoing $e0) (Past $e0) (Patient $e0 $x0))

;; p202912  cross  support 3 (occ 6)  size 4  lifted 1  nisurp -0.280  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001446 tierB-001940
(And (Member $x0 $v0) (Ongoing $e0) (Patient $e0 $x0) (Patient $e1 $x0))

;; p202913  cross  support 3 (occ 6)  size 4  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $x0 $v0) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p202914  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-001130 tierB-001557 tierB-001940
(And (Member $x0 $v0) (Ongoing $e0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p202915  cross  support 3 (occ 4)  size 4  lifted 1  nisurp -0.035  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-001446 tierB-001940
(And (Member $x0 $v0) (Ongoing $e0) (Patient $e1 $x0) (Theme $e1 $e0))

;; p202916  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.242  tiers tierB
;;   e.g. tierB-000103 tierB-000725 tierB-001949
(And (Member $x0 $v0) (Past $e0) (Patient $e0 $x0) (Source $e0 $x1))

;; p202917  cross  support 3 (occ 3)  size 4  lifted 1  nisurp -0.573  tiers tierB
;;   e.g. tierB-000265 tierB-001446 tierB-001515
(And (Member $x0 $v0) (Past $e0) (Patient $e0 $x0) (Theme $e0 $e1))

;; p202918  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-001325 tierB-001540 tierB-001693
(And (Member $x0 $v0) (Past $e0) (Source $e0 $x0) (Theme $e0 $x1))

;; p202919  cross  support 3 (occ 4)  size 4  lifted 1  nisurp 0.172  tiers tierB
;;   e.g. tierB-001325 tierB-001540 tierB-001693
(And (Member $x0 $v0) (Past $e0) (Source $e0 $x1) (Theme $e0 $x0))

;; p202920  cross  support 3 (occ 4)  size 4  lifted 1  nisurp -0.035  tiers tierB
;;   e.g. tierB-000265 tierB-001446 tierB-001940
(And (Member $x0 $v0) (Patient $e0 $x0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p202921  cross  support 3 (occ 5)  size 4  lifted 1  nisurp 0.708  tiers tierB
;;   e.g. tierB-000012 tierB-001275 tierB-001773
(And (Past $e0) (Past $e1) (Time $e0 $v0) (Time $e1 $v0))

;; p202922  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000969 tierB-001589 tierB-001980
(And (Agent $e0 $e1) (Member $e0 $v0) (Member $e1 $v1) (Theme $e1 $x0))

;; p202923  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.167  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-000951 tierB-000962
(And (Agent $e0 $v0) (Agent $e1 $v0) (Location $e0 $x0) (Member $e0 $v1))

;; p202924  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.167  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-000951 tierB-000962
(And (Agent $e0 $v0) (Agent $e1 $v0) (Location $e0 $x0) (Member $e1 $v1))

;; p202925  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.167  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-000951 tierB-000962
(And (Agent $e0 $v0) (Agent $e1 $v0) (Location $e0 $x0) (Member $x0 $v1))

;; p202926  cross  support 3 (occ 5)  size 4  lifted 2  nisurp 0.525  tiers tierB
;;   e.g. tierB-000012 tierB-000075 tierB-001809
(And (Agent $e0 $v0) (Agent $e1 $v0) (Manner $e0 $v1) (Past $e1))

;; p202927  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Member $e1 begin))

;; p202928  cross  support 3 (occ 10)  size 4  lifted 2  nisurp -0.909  tiers tierB
;;   e.g. tierB-000012 tierB-000030 tierB-000166
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 $v1) (Member $e2 $v1))

;; p202929  cross  support 3 (occ 5)  size 4  lifted 2  nisurp 0.125  tiers tierB
;;   e.g. tierB-000139 tierB-000309 tierB-001046
(And (Agent $e0 $v0) (Agent $e1 $v0) (Past $e0) (Theme $e0 $v1))

;; p202930  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.799  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-001544
(And (Agent $e0 $v0) (Agent $e1 $v0) (Theme $e0 $e1) (Theme $e1 $v1))

;; p202931  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.663  tiers tierB  dominated
;;   e.g. tierB-000166 tierB-000410 tierB-000622
(And (Agent $e0 $v0) (Agent $e1 $x0) (GroupOf $x0 $v1) (Theme $e0 $e1))

;; p202932  cross  support 3 (occ 4)  size 4  lifted 2  nisurp -0.138  tiers tierB  dominated
;;   e.g. tierB-000166 tierB-000410 tierB-000622
(And (Agent $e0 $v0) (Agent $e1 $x0) (Member $e0 $v1) (Theme $e0 $e1))

;; p202933  cross  support 3 (occ 4)  size 4  lifted 2  nisurp -0.138  tiers tierB  dominated
;;   e.g. tierB-000166 tierB-000410 tierB-000622
(And (Agent $e0 $v0) (Agent $e1 $x0) (Member $e1 $v1) (Theme $e0 $e1))

;; p202934  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000203 tierB-001185 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Ongoing $e0))

;; p202935  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Patient $e2 $v0))

;; p202936  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001185 tierB-001538 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Result $e0 $e1))

;; p202937  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Result $e2 $e1))

;; p202938  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.389  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001449 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Theme $e0 $x0))

;; p202939  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000203 tierB-001185 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e1 $v1) (Ongoing $e0))

;; p202940  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e1 $v1) (Patient $e2 $v0))

;; p202941  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001185 tierB-001538 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e1 $v1) (Result $e0 $e1))

;; p202942  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e1 $v1) (Result $e2 $e1))

;; p202943  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.397  tiers tierB
;;   e.g. tierB-001079 tierB-001449 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e1 $v1) (Theme $e0 $x0))

;; p202944  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e2 $v1) (Patient $e2 $v0))

;; p202945  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $e2 $v1) (Result $e2 $e1))

;; p202946  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.851  tiers tierB  dominated
;;   e.g. tierB-000203 tierB-001185 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $v0 $v1) (Ongoing $e0))

;; p202947  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.565  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $v0 $v1) (Patient $e2 $v0))

;; p202948  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.529  tiers tierB  dominated
;;   e.g. tierB-001185 tierB-001538 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $v0 $v1) (Result $e0 $e1))

;; p202949  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.529  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Member $v0 $v1) (Result $e2 $e1))

;; p202950  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e0 $e1) (Member $e1 $v1) (Past $e0))

;; p202951  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e1 $e0) (Member $e0 $v1) (Past $e1))

;; p202952  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e1 $e0) (Member $e1 $v1) (Past $e1))

;; p202953  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.793  tiers tierB  signal conj-pattern
;;   e.g. tierB-000393 tierB-000412 tierB-001047
(And (Agent $e0 $v0) (GroupOf $x0 $v1) (Member $e0 kill) (Patient $e0 $x0))

;; p202954  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000148 tierB-000805 tierB-000951
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $e0 walk) (Member $x0 $v1))

;; p202955  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.037  tiers tierB  dominated
;;   e.g. tierB-000047 tierB-000704 tierB-000962
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $x0 $v1) (Theme $e0 $x1))

;; p202956  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.261  tiers tierB  dominated
;;   e.g. tierB-000047 tierB-000704 tierB-000962
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $x1 $v1) (Theme $e0 $x1))

;; p202957  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 begin) (Theme $e1 $e0))

;; p202958  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.123  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e1) (Patient $e1 $v0))

;; p202959  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $e0 $v1) (Patient $e1 $v0) (Result $e1 $e2))

;; p202960  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.464  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-001079 tierB-001809
(And (Agent $e0 $v0) (Member $e0 $v1) (Patient $e1 $v0) (Theme $e0 $x0))

;; p202961  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.120  tiers tierB  dominated
;;   e.g. tierB-000400 tierB-000401 tierB-001149
(And (Agent $e0 $v0) (Member $e0 $v1) (Theme $e0 $e1) (Theme $e1 $x0))

;; p202962  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Member $e0 begin) (Member $e1 $v1) (Theme $e0 $e1))

;; p202963  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.297  tiers tierB
;;   e.g. tierB-000203 tierB-001185 tierB-001809
(And (Agent $e0 $v0) (Member $e1 $v1) (Member $v0 $v1) (Ongoing $e0))

;; p202964  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $e1 $v1) (Member $v0 $v1) (Patient $e2 $v0))

;; p202965  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001185 tierB-001538 tierB-001809
(And (Agent $e0 $v0) (Member $e1 $v1) (Member $v0 $v1) (Result $e0 $e1))

;; p202966  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.529  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $e1 $v1) (Member $v0 $v1) (Result $e2 $e1))

;; p202967  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001185 tierB-001809
(And (Agent $e0 $v0) (Member $e1 $v1) (Ongoing $e0) (Result $e0 $e1))

;; p202968  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.123  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $e1 $v1) (Past $e1) (Patient $e1 $v0))

;; p202969  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $e1 $v1) (Patient $e1 $v0) (Result $e1 $e2))

;; p202970  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.464  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-001079 tierB-001809
(And (Agent $e0 $v0) (Member $e1 $v1) (Patient $e1 $v0) (Theme $e0 $x0))

;; p202971  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $e1 $v1) (Patient $e2 $v0) (Result $e2 $e1))

;; p202972  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.120  tiers tierB  dominated
;;   e.g. tierB-000400 tierB-000401 tierB-001149
(And (Agent $e0 $v0) (Member $e1 $v1) (Theme $e0 $e1) (Theme $e1 $x0))

;; p202973  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.611  tiers tierB
;;   e.g. tierB-000148 tierB-001185 tierB-001809
(And (Agent $e0 $v0) (Member $v0 $v1) (Ongoing $e0) (Past $e0))

;; p202974  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.596  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $v0 $v1) (Past $e0) (Patient $e1 $v0))

;; p202975  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-001185 tierB-001538 tierB-001809
(And (Agent $e0 $v0) (Member $v0 $v1) (Past $e0) (Result $e0 $e1))

;; p202976  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.222  tiers tierB
;;   e.g. tierB-000128 tierB-001079 tierB-001809
(And (Agent $e0 $v0) (Member $v0 $v1) (Past $e0) (Theme $e0 $x0))

;; p202977  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.601  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $v0 $v1) (Past $e1) (Patient $e1 $v0))

;; p202978  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.565  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $v0 $v1) (Patient $e1 $v0) (Result $e1 $e2))

;; p202979  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.060  tiers tierB
;;   e.g. tierB-001221 tierB-001355 tierB-001637
(And (Agent $e0 $v0) (Member $x0 $v1) (Ongoing $e0) (Theme $e0 $x0))

;; p202980  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.311  tiers tierB
;;   e.g. tierB-000138 tierB-001325 tierB-001612
(And (Agent $e0 $v0) (Member $x0 $v1) (Past $e0) (Source $e0 $x0))

;; p202981  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.325  tiers tierB  dominated
;;   e.g. tierB-000400 tierB-000401 tierB-001149
(And (Agent $e0 $v0) (Member $x0 $v1) (Theme $e0 $e1) (Theme $e1 $x0))

;; p202982  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.708  tiers tierB
;;   e.g. tierB-000117 tierB-000173 tierB-001544
(And (Agent $e0 $v0) (Past $e1) (Theme $e0 $v1) (Theme $e1 $e0))

;; p202983  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.582  tiers tierB
;;   e.g. tierB-000782 tierB-001008 tierB-001629
(And (Agent $e0 $x0) (Agent $e1 $x0) (GroupOf $x0 $v0) (Manner $e0 $v1))

;; p202984  cross  support 3 (occ 5)  size 4  lifted 2  nisurp 0.586  tiers tierB
;;   e.g. tierB-000485 tierB-001035 tierB-001629
(And (Agent $e0 $x0) (Agent $e1 $x0) (GroupOf $x0 $v0) (Theme $e0 $v1))

;; p202985  cross  support 3 (occ 8)  size 4  lifted 2  nisurp -0.242  tiers tierB
;;   e.g. tierB-000470 tierB-000628 tierB-001275
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 $v0) (Theme $e0 $v1))

;; p202986  cross  support 3 (occ 4)  size 4  lifted 2  nisurp -0.035  tiers tierB
;;   e.g. tierB-000156 tierB-000745 tierB-001888
(And (Agent $e0 $x0) (Can $e0) (Member $e0 $v0) (Member $x0 $v1))

;; p202987  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.025  tiers tierB  dominated
;;   e.g. tierB-000688 tierB-000783 tierB-001782
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $e0 $v0) (Past (Member $x0 $v1)))

;; p202988  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000091 tierB-000605 tierB-001133
(And (Agent $e0 $x0) (For $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p202989  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-001663 tierB-001786
(And (Agent $e0 $x0) (For $e0 $x1) (Member $e0 $v0) (Member $x0 $v1))

;; p202990  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000049 tierB-001663 tierB-001786
(And (Agent $e0 $x0) (For $e0 $x1) (Member $x0 $v0) (Member $x1 $v1))

;; p202991  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000100 tierB-001440 tierB-001726
(And (Agent $e0 $x0) (Future $e0) (Member $x0 $v0) (Time $e0 $v1))

;; p202992  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(And (Agent $e0 $x0) (Goal $e0 home) (Member $e0 $v0) (Member $x0 $v1))

;; p202993  cross  support 3 (occ 4)  size 4  lifted 2  nisurp -0.036  tiers tierB
;;   e.g. tierB-000063 tierB-000799 tierB-001501
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (GroupOf $x1 $v1) (Patient $e0 $x1))

;; p202994  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.298  tiers tierB
;;   e.g. tierB-000830 tierB-000858 tierB-001445
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Theme $e0 $e1))

;; p202995  cross  support 3 (occ 10)  size 4  lifted 2  nisurp -0.742  tiers tierB
;;   e.g. tierB-000101 tierB-001618 tierB-001629
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Member $e1 $v1))

;; p202996  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000772 tierB-001035 tierB-001628
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (SubsetOf $x0 $x1))

;; p202997  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.876  tiers tierB
;;   e.g. tierB-000782 tierB-001008 tierB-001754
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $x0 $v1) (Ongoing $e0))

;; p202998  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.514  tiers tierB
;;   e.g. tierB-000782 tierB-001008 tierB-001357
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $x0 $v1) (Past $e0))

;; p202999  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.724  tiers tierB
;;   e.g. tierB-000098 tierB-001754 tierB-001973
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Ongoing $e0) (Patient $e0 $v1))

;; p203000  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.210  tiers tierB
;;   e.g. tierB-001035 tierB-001550 tierB-001629
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Past $e0) (Theme $e0 $v1))

;; p203001  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000769 tierB-001260
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Member $e0 $v1) (Recipient $e0 $x1))

;; p203002  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000772 tierB-001035 tierB-001628
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Member $e0 $v1) (SubsetOf $x0 $x1))

;; p203003  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.724  tiers tierB
;;   e.g. tierB-000485 tierB-000769 tierB-001260
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Recipient $e0 $x1) (Theme $e0 $v1))

;; p203004  cross  support 3 (occ 6)  size 4  lifted 2  nisurp 0.688  tiers tierB  signal conj-pattern
;;   e.g. tierB-000268 tierB-001098 tierB-001243
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $e0 use) (Member $x0 $v0))

;; p203005  cross  support 3 (occ 4)  size 4  lifted 2  nisurp -0.405  tiers tierB
;;   e.g. tierB-000888 tierB-001219 tierB-001345
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0) (Ongoing $e0))

;; p203006  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.376  tiers tierB
;;   e.g. tierB-000715 tierB-001219 tierB-001260
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0) (Recipient $e0 $x1))

;; p203007  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000316 tierB-001720 tierB-001911
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 $v1) (Stimulus $e1 $e0))

;; p203008  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.025  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 $v1) (To $e0 $e1))

;; p203009  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.025  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e1 $v1) (To $e1 $e0))

;; p203010  cross  support 3 (occ 4)  size 4  lifted 2  nisurp -0.473  tiers tierB
;;   e.g. tierB-000871 tierB-001294 tierB-001430
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Member $x1 $v1))

;; p203011  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.022  tiers tierB
;;   e.g. tierB-000268 tierB-001507 tierB-001976
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Obligated $e0))

;; p203012  cross  support 3 (occ 8)  size 4  lifted 2  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Over $e0 $x1))

;; p203013  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000673 tierB-000770 tierB-001283
(And (Agent $e0 $x0) (Member $e0 $v0) (Patient $e1 $v1) (Theme $e0 $e1))

;; p203014  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000268 tierB-000850 tierB-001098
(And (Agent $e0 $x0) (Member $e0 use) (Member $x0 $v0) (Theme $e0 $v1))

;; p203015  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000673 tierB-000770 tierB-001283
(And (Agent $e0 $x0) (Member $e1 $v0) (Patient $e1 $v1) (Theme $e0 $e1))

;; p203016  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-000485 tierB-000622
(And (Agent $e0 $x0) (Member $e1 $v0) (Theme $e0 $v1) (Theme $e1 $e0))

;; p203017  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.718  tiers tierB
;;   e.g. tierB-001169 tierB-001773 tierB-001873
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Theme $e1 $e0))

;; p203018  cross  support 3 (occ 11)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Over $e0 $x1))

;; p203019  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000231 tierB-000236 tierB-000888
(And (Agent $e0 $x0) (Member $x0 $v0) (Ongoing $e0) (Theme $e0 $v1))

;; p203020  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000715 tierB-000769 tierB-001260
(And (Agent $e0 $x0) (Member $x0 $v0) (Recipient $e0 $x1) (Theme $e0 $v1))

;; p203021  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000288 tierB-000470 tierB-001222
(And (Agent $e0 $x0) (Member $x0 $v0) (Theme $e0 $e1) (Theme $e1 $v1))

;; p203022  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(And (Agent $e0 mark) (Agent $e1 mark) (Member $e0 $v0) (Member $e1 $v1))

;; p203023  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000340 tierB-001316 tierB-001572
(And (At $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p203024  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001302
(And (Before $e0 $e1) (Member $e0 $v0) (Member $e1 $v1) (Past $e0))

;; p203025  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-001222 tierB-001531 tierB-001544
(And (Before $x0 $e0) (Member $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p203026  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-001047 tierB-001246 tierB-001721
(And (Can $e0) (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p203027  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000319 tierB-000745 tierB-001888
(And (Can $e0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0))

;; p203028  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000867 tierB-001782 tierB-001809
(And (During $e0 $e1) (Member $e0 $v0) (Member $e1 $v1) (Past $e0))

;; p203029  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000502 tierB-001782 tierB-001809
(And (During $e0 $e1) (Member $e0 $v0) (Member $e1 $v1) (Past $e1))

;; p203030  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000496 tierB-000534 tierB-001479
(And (Experiencer $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Past $e0))

;; p203031  cross  support 3 (occ 5)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000496 tierB-000534 tierB-001479
(And (Experiencer $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Past $e1))

;; p203032  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000114 tierB-000534 tierB-001479
(And (Experiencer $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Theme $e0 $e1))

;; p203033  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000114 tierB-000534 tierB-001479
(And (Experiencer $e0 $v0) (Experiencer $e1 $v0) (Member $e0 $v1) (Theme $e1 $e0))

;; p203034  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000044 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (For $e0 $x0) (Member $e0 $v1) (Member $v0 $v1))

;; p203035  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000589 tierB-000836 tierB-001091
(And (Experiencer $e0 $v0) (Location $e0 $x0) (Member $e0 $v1) (Past (Member $v0 $v1)))

;; p203036  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000589 tierB-000836 tierB-001091
(And (Experiencer $e0 $v0) (Location $e0 $x0) (Past $e0) (Past (Member $v0 $v1)))

;; p203037  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000756 tierB-000759 tierB-000865
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $x0 thing) (Stimulus $e0 $x0))

;; p203038  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Ongoing $e1) (Patient $e1 $v0))

;; p203039  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Experiencer $e0 $v0) (Member $e1 $v1) (Ongoing $e1) (Patient $e1 $v0))

;; p203040  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.703  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Experiencer $e0 $v0) (Member $v0 $v1) (Ongoing $e1) (Patient $e1 $v0))

;; p203041  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000168 tierB-000916 tierB-001320
(And (Experiencer $e0 $x0) (Future $e0) (Member $e0 $v0) (Member $x0 $v1))

;; p203042  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000230 tierB-000831 tierB-001977
(And (Experiencer $e0 $x0) (Like $e0 $x1) (Member $x1 $v0) (Member $x1 $v1))

;; p203043  cross  support 3 (occ 5)  size 4  lifted 2  nisurp -0.512  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-000832
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $e1 $v1) (Member $x0 $v1))

;; p203044  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000495 tierB-001521 tierB-001891
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Probably $e0))

;; p203045  cross  support 3 (occ 6)  size 4  lifted 2  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000495 tierB-000631 tierB-000808
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Time $e0 today))

;; p203046  cross  support 3 (occ 4)  size 4  lifted 2  nisurp -0.800  tiers tierB
;;   e.g. tierB-000808 tierB-001625 tierB-001782
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Past $e0) (Past (Member $x0 $v1)))

;; p203047  cross  support 3 (occ 8)  size 4  lifted 2  nisurp -0.425  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-000832
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Member $x0 $v0) (Member $x0 $v1))

;; p203048  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (For $e0 $e1) (Member $e0 $v0) (Member $e1 $v1) (Past $e0))

;; p203049  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000712 tierB-001786 tierB-001879
(And (For $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Ongoing $e0))

;; p203050  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.027  tiers tierB
;;   e.g. tierB-000049 tierB-001603 tierB-001786
(And (For $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p203051  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.240  tiers tierB
;;   e.g. tierB-001513 tierB-001816 tierB-001924
(And (Future $e0) (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p203052  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.448  tiers tierB
;;   e.g. tierB-001266 tierB-001591 tierB-001797
(And (Future $e0) (GroupOf $x0 $v0) (Member $e0 $v1) (Theme $e0 $x0))

;; p203053  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.454  tiers tierB
;;   e.g. tierB-000281 tierB-001007 tierB-001626
(And (Future $e0) (Inheritance $v0 $v1) (Member $x0 $v0) (Theme $e0 $x0))

;; p203054  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.795  tiers tierB
;;   e.g. tierB-000834 tierB-000909 tierB-001728
(And (Goal $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Past $e0))

;; p203055  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.708  tiers tierB
;;   e.g. tierB-000482 tierB-000588 tierB-001857
(And (Goal $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0) (Past $e0))

;; p203056  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-001563 tierB-001579 tierB-001902
(And (Goal $e0 $x0) (Manner $e0 quickly) (Member $e0 $v0) (Member $x0 $v1))

;; p203057  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.611  tiers tierB
;;   e.g. tierB-001453 tierB-001534 tierB-001543
(And (Goal $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Past $e0))

;; p203058  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.229  tiers tierB
;;   e.g. tierB-001037 tierB-001132 tierB-001860
(And (Goal $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Theme $e0 $x1))

;; p203059  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.793  tiers tierB
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (Inheritance $x0 $v1) (SubsetOf $x0 $x1))

;; p203060  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000162 tierB-000333 tierB-001553
(And (GroupOf $x0 $v0) (Holder $e0 $v1) (Member $e0 have) (Theme $e0 $x0))

;; p203061  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.172  tiers tierB
;;   e.g. tierB-000016 tierB-001132 tierB-001541
(And (GroupOf $x0 $v0) (Instrument $e0 $x0) (Member $x1 $v1) (Patient $e0 $x1))

;; p203062  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000796 tierB-001196 tierB-001760
(And (GroupOf $x0 $v0) (LocatedIn $x0 $x1) (Member $x1 $v1) (Member $x1 full))

;; p203063  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.586  tiers tierB
;;   e.g. tierB-000063 tierB-001694 tierB-001705
(And (GroupOf $x0 $v0) (Location $e0 $v1) (Past $e0) (Patient $e0 $x0))

;; p203064  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.439  tiers tierB
;;   e.g. tierB-001426 tierB-001800 tierB-001868
(And (GroupOf $x0 $v0) (Manner $e0 $v1) (Past $e0) (Theme $e0 $x0))

;; p203065  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000246 tierB-000398 tierB-001591
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Obligated $e0) (Theme $e0 $x0))

;; p203066  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.490  tiers tierB
;;   e.g. tierB-000416 tierB-000784 tierB-001120
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Ongoing $e0) (Theme $e0 $x0))

;; p203067  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.289  tiers tierB  dominated
;;   e.g. tierB-001394 tierB-001816 tierB-001940
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0) (Theme $e0 $e1))

;; p203068  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.289  tiers tierB  dominated
;;   e.g. tierB-001394 tierB-001816 tierB-001940
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Patient $e1 $x0) (Theme $e1 $e0))

;; p203069  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000246 tierB-000975 tierB-001928
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Possession $x0 $x1) (Theme $e0 $x0))

;; p203070  cross  support 3 (occ 6)  size 4  lifted 2  nisurp -0.851  tiers tierB
;;   e.g. tierB-000370 tierB-001658 tierB-001940
(And (GroupOf $x0 $v0) (Member $x0 $v1) (Ongoing $e0) (Patient $e0 $x0))

;; p203071  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.414  tiers tierB
;;   e.g. tierB-000063 tierB-000089 tierB-000392
(And (GroupOf $x0 $v0) (Member $x0 $v1) (Past $e0) (Patient $e0 $x0))

;; p203072  cross  support 3 (occ 5)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000246 tierB-000975 tierB-001928
(And (GroupOf $x0 $v0) (Member $x1 $v1) (Possession $x0 $x1) (Theme $e0 $x0))

;; p203073  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.035  tiers tierB
;;   e.g. tierB-000774 tierB-001033 tierB-001600
(And (In $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past $e0))

;; p203074  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.454  tiers tierB
;;   e.g. tierB-000016 tierB-001143 tierB-001541
(And (Inheritance $v0 $v1) (Instrument $e0 $x0) (Member $x1 $v0) (Patient $e0 $x1))

;; p203075  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.559  tiers tierB
;;   e.g. tierB-000008 tierB-000217 tierB-000805
(And (Inheritance $v0 $v1) (Location $e0 $x0) (Member $x0 $v0) (Ongoing $e0))

;; p203076  cross  support 3 (occ 4)  size 4  lifted 2  nisurp -0.091  tiers tierB
;;   e.g. tierB-000217 tierB-000291 tierB-001027
(And (Inheritance $v0 $v1) (Location $e0 $x0) (Member $x0 $v0) (Patient $e0 $x1))

;; p203077  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.688  tiers tierB
;;   e.g. tierB-000400 tierB-001325 tierB-001693
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Source $e0 $x0) (Theme $e0 $x1))

;; p203078  cross  support 3 (occ 5)  size 4  lifted 2  nisurp -0.656  tiers tierB  dominated
;;   e.g. tierB-000392 tierB-000733 tierB-001143
(And (Instrument $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x1))

;; p203079  cross  support 3 (occ 5)  size 4  lifted 2  nisurp -0.242  tiers tierB
;;   e.g. tierB-000444 tierB-000576 tierB-001143
(And (Instrument $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Past $e0))

;; p203080  cross  support 3 (occ 5)  size 4  lifted 2  nisurp -0.449  tiers tierB
;;   e.g. tierB-000392 tierB-000733 tierB-001143
(And (Instrument $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (Patient $e0 $x1))

;; p203081  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.103  tiers tierB  dominated
;;   e.g. tierB-000305 tierB-000524 tierB-001257
(And (LocatedIn $x0 $x1) (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p203082  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.030  tiers tierB  dominated
;;   e.g. tierB-000305 tierB-000524 tierB-001257
(And (LocatedIn $x0 $x1) (Location $e0 $x0) (Member $e0 $v0) (Member $x1 $v1))

;; p203083  cross  support 3 (occ 5)  size 4  lifted 2  nisurp 0.103  tiers tierB
;;   e.g. tierB-000305 tierB-000524 tierB-001257
(And (LocatedIn $x0 $x1) (Location $e0 $x0) (Member $x0 $v0) (Member $x1 $v1))

;; p203084  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.673  tiers tierB  dominated
;;   e.g. tierB-000975 tierB-001416 tierB-001638
(And (LocatedIn $x0 $x1) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0))

;; p203085  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.673  tiers tierB  dominated
;;   e.g. tierB-000975 tierB-001416 tierB-001638
(And (LocatedIn $x0 $x1) (Member $e0 $v0) (Member $x1 $v1) (Theme $e0 $x0))

;; p203086  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.614  tiers tierB
;;   e.g. tierB-000975 tierB-001416 tierB-001638
(And (LocatedIn $x0 $x1) (Member $x0 $v0) (Member $x1 $v1) (Theme $e0 $x0))

;; p203087  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000830 tierB-000910 tierB-001621
(And (Location $e0 $v0) (Member $e0 $v1) (Past $e1) (Theme $e1 $e0))

;; p203088  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000830 tierB-000910 tierB-001621
(And (Location $e0 $v0) (Member $e1 $v1) (Past $e1) (Theme $e1 $e0))

;; p203089  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Member $x0 house))

;; p203090  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000618 tierB-001125 tierB-001925
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (PartOf $x0 $x1))

;; p203091  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.030  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001257 tierB-001283
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e1 $e0))

;; p203092  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000618 tierB-001125 tierB-001925
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x1 $v1) (PartOf $x0 $x1))

;; p203093  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.708  tiers tierB
;;   e.g. tierB-000589 tierB-000836 tierB-001091
(And (Location $e0 $x0) (Member $e0 $v0) (Past $e0) (Past (Member $v1 $v0)))

;; p203094  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.242  tiers tierB  dominated
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(And (Location $e0 $x0) (Member $e0 live) (Member $x0 $v0) (Member $x0 $v1))

;; p203095  cross  support 3 (occ 5)  size 4  lifted 2  nisurp 0.030  tiers tierB
;;   e.g. tierB-000942 tierB-001257 tierB-001283
(And (Location $e0 $x0) (Member $e1 $v0) (Member $x0 $v1) (Theme $e1 $e0))

;; p203096  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000618 tierB-001125 tierB-001925
(And (Location $e0 $x0) (Member $x0 $v0) (Member $x1 $v1) (PartOf $x0 $x1))

;; p203097  cross  support 3 (occ 5)  size 4  lifted 2  nisurp 0.210  tiers tierB
;;   e.g. tierB-000292 tierB-000706 tierB-001275
(And (Location $e0 $x0) (Member $x0 $v0) (Past $e0) (Theme $e0 $v1))

;; p203098  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.319  tiers tierB  dominated
;;   e.g. tierB-000087 tierB-001515 tierB-001873
(And (Manner $e0 $v0) (Member $e0 $v1) (Past $e1) (Theme $e0 $e1))

;; p203099  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.309  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-001446 tierB-001773
(And (Manner $e0 $v0) (Member $e0 $v1) (Past $e1) (Theme $e1 $e0))

;; p203100  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.319  tiers tierB  dominated
;;   e.g. tierB-000087 tierB-001515 tierB-001873
(And (Manner $e0 $v0) (Member $e1 $v1) (Past $e1) (Theme $e0 $e1))

;; p203101  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.309  tiers tierB
;;   e.g. tierB-000075 tierB-001446 tierB-001773
(And (Manner $e0 $v0) (Member $e1 $v1) (Past $e1) (Theme $e1 $e0))

;; p203102  cross  support 3 (occ 10)  size 4  lifted 2  nisurp -0.904  tiers tierB  dominated
;;   e.g. tierB-001046 tierB-001275 tierB-001629
(And (Member $e0 $v0) (Member $e1 $v0) (Past $e0) (Theme $e0 $v1))

;; p203103  cross  support 3 (occ 10)  size 4  lifted 2  nisurp -0.904  tiers tierB
;;   e.g. tierB-001046 tierB-001275 tierB-001629
(And (Member $e0 $v0) (Member $e1 $v0) (Past $e0) (Theme $e1 $v1))

;; p203104  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.178  tiers tierB  dominated
;;   e.g. tierB-000371 tierB-001304 tierB-001867
(And (Member $e0 $v0) (Member $e1 $v1) (Patient $e0 $x0) (To $e1 $e0))

;; p203105  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000547 tierB-001219
(And (Member $e0 $v0) (Member $e1 $v1) (Recipient $e0 $x0) (Theme $e1 $e0))

;; p203106  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.246  tiers tierB  dominated
;;   e.g. tierB-000147 tierB-000258 tierB-001396
(And (Member $e0 $v0) (Member $e1 $v1) (Theme $e0 $x0) (To $e1 $e0))

;; p203107  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000117 tierB-000470 tierB-001257
(And (Member $e0 $v0) (Member $e1 try) (Theme $e0 $v1) (Theme $e1 $e0))

;; p203108  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000282 tierB-000404 tierB-001304
(And (Member $e0 $v0) (Member $e1 use) (Theme $e1 $v1) (To $e1 $e0))

;; p203109  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000748 tierB-001594 tierB-001910
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x0 bad) (Patient $e0 $x0))

;; p203110  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000890 tierB-001457 tierB-001831
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x0 big) (Patient $e0 $x0))

;; p203111  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.904  tiers tierB  dominated
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x0 door) (Patient $e0 $x0))

;; p203112  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.035  tiers tierB  signal conj-pattern
;;   e.g. tierB-000805 tierB-000951 tierB-001384
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x0 sound) (Patient $e0 $x0))

;; p203113  cross  support 3 (occ 5)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000218 tierB-000969 tierB-001476
(And (Member $e0 $v0) (Member $x0 $v1) (Might $e0) (Patient $e0 $x0))

;; p203114  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-001070 tierB-001262 tierB-001423
(And (Member $e0 $v0) (Member $x0 $v1) (Of $x0 $x1) (Theme $e0 $x0))

;; p203115  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-001070 tierB-001262 tierB-001423
(And (Member $e0 $v0) (Member $x0 $v1) (Of $x1 $x0) (Theme $e0 $x1))

;; p203116  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.461  tiers tierB
;;   e.g. tierB-001246 tierB-001926 tierB-001964
(And (Member $e0 $v0) (Member $x0 $v1) (PartOf $x1 $x0) (Patient $e0 $x1))

;; p203117  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000517 tierB-001588 tierB-001910
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Probably $e0))

;; p203118  cross  support 3 (occ 5)  size 4  lifted 2  nisurp 0.342  tiers tierB  dominated
;;   e.g. tierB-000371 tierB-001304 tierB-001867
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (To $e1 $e0))

;; p203119  cross  support 3 (occ 5)  size 4  lifted 2  nisurp 0.342  tiers tierB
;;   e.g. tierB-000371 tierB-001304 tierB-001867
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e1 $x0) (To $e0 $e1))

;; p203120  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.564  tiers tierB  dominated
;;   e.g. tierB-000400 tierB-000401 tierB-001149
(And (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $e1) (Theme $e1 $x0))

;; p203121  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.564  tiers tierB
;;   e.g. tierB-000400 tierB-000401 tierB-001149
(And (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0) (Theme $e1 $e0))

;; p203122  cross  support 3 (occ 6)  size 4  lifted 2  nisurp -0.564  tiers tierB
;;   e.g. tierB-000636 tierB-001149 tierB-001526
(And (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0) (Theme $e1 $x0))

;; p203123  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000147 tierB-000258 tierB-001396
(And (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $x0) (To $e1 $e0))

;; p203124  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000147 tierB-000258 tierB-001396
(And (Member $e0 $v0) (Member $x0 $v1) (Theme $e1 $x0) (To $e0 $e1))

;; p203125  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Member $e0 $v0) (Ongoing $e1) (Patient $e1 $v1) (Result $e1 $e0))

;; p203126  cross  support 3 (occ 10)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-001275 tierB-001773
(And (Member $e0 $v0) (Past $e0) (Time $e0 $v1) (Time $e1 $v1))

;; p203127  cross  support 3 (occ 10)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-001275 tierB-001773
(And (Member $e0 $v0) (Past $e1) (Time $e0 $v1) (Time $e1 $v1))

;; p203128  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Member $e0 $v1) (Member $v0 $v1) (Ongoing $e1) (Patient $e1 $v0))

;; p203129  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000352 tierB-001582 tierB-001817
(And (Member $e0 become) (Member $x0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p203130  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.449  tiers tierB  signal conj-pattern
;;   e.g. tierB-000681 tierB-000695 tierB-001479
(And (Member $e0 hear) (Member $x0 $v0) (Member $x0 $v1) (Stimulus $e0 $x0))

;; p203131  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.876  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Member $e0 make) (Member $v0 $v1) (Ongoing $e0) (Patient $e0 $v0))

;; p203132  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001504 tierB-001809
(And (Member $e0 make) (Member $v0 $v1) (Past $e0) (Patient $e0 $v0))

;; p203133  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.035  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Member $e0 turn) (Member $x0 $v0) (Member $x0 $v1) (Patient $e0 $x0))

;; p203134  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.703  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Member $v0 $v1) (Ongoing $e0) (Patient $e0 $v0) (Result $e0 $e1))

;; p203135  cross  support 3 (occ 3)  size 4  lifted 2  nisurp -0.203  tiers tierB
;;   e.g. tierB-001068 tierB-001120 tierB-001984
(And (Member $x0 $v0) (Member $x0 $v1) (Ongoing $e0) (Theme $e0 $x0))

;; p203136  cross  support 3 (occ 3)  size 4  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-001070 tierB-001262 tierB-001423
(And (Member $x0 $v0) (Member $x1 $v1) (Of $x0 $x1) (Theme $e0 $x0))

;; p203137  cross  support 3 (occ 4)  size 4  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000456 tierB-000955 tierB-001287
(And (Member $x0 $v0) (Past $e0) (Patient $e0 $v1) (Source $e0 $x0))

;; p203138  cross  support 3 (occ 5)  size 4  lifted 3  nisurp 0.298  tiers tierB
;;   e.g. tierB-000309 tierB-001046 tierB-001544
(And (Agent $e0 $v0) (Agent $e1 $v0) (Inheritance $v1 $v2) (Theme $e0 $v1))

;; p203139  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.866  tiers tierB
;;   e.g. tierB-000271 tierB-000309 tierB-001046
(And (Agent $e0 $v0) (Agent $e1 $v0) (Theme $e0 $v1) (Theme $e1 $v2))

;; p203140  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000502 tierB-000867 tierB-001809
(And (Agent $e0 $v0) (During $e0 $e1) (Member $e0 $v1) (Member $e1 $v2))

;; p203141  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e0 $e1) (Member $e0 $v1) (Member $e1 $v2))

;; p203142  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e1 $e0) (Member $e0 $v1) (Member $e1 $v2))

;; p203143  cross  support 3 (occ 7)  size 4  lifted 3  nisurp -0.880  tiers tierB
;;   e.g. tierB-000371 tierB-001202 tierB-001246
(And (Agent $e0 $v0) (Inheritance $v0 $v1) (Member $e0 $v2) (Patient $e0 $x0))

;; p203144  cross  support 3 (occ 5)  size 4  lifted 3  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000444 tierB-000576 tierB-001143
(And (Agent $e0 $v0) (Instrument $e0 $x0) (Member $x0 $v1) (Member $x0 $v2))

;; p203145  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.172  tiers tierB
;;   e.g. tierB-000128 tierB-000163 tierB-000328
(And (Agent $e0 $v0) (Manner $e0 $v1) (Member $x0 $v2) (Theme $e0 $x0))

;; p203146  cross  support 3 (occ 6)  size 4  lifted 3  nisurp -0.964  tiers tierB
;;   e.g. tierB-000271 tierB-000516 tierB-001046
(And (Agent $e0 $v0) (Member $e0 $v1) (Member $e1 $v1) (Theme $e0 $v2))

;; p203147  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.384  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $e0 $v2) (Member $v0 $v1) (Patient $e1 $v0))

;; p203148  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001185 tierB-001538 tierB-001809
(And (Agent $e0 $v0) (Member $e0 $v2) (Member $v0 $v1) (Result $e0 $e1))

;; p203149  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-001544
(And (Agent $e0 $v0) (Member $e1 $v1) (Theme $e0 $v2) (Theme $e1 $e0))

;; p203150  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.384  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $e1 $v2) (Member $v0 $v1) (Patient $e1 $v0))

;; p203151  cross  support 3 (occ 4)  size 4  lifted 3  nisurp 0.080  tiers tierB
;;   e.g. tierB-000128 tierB-000137 tierB-001809
(And (Agent $e0 $v0) (Member $v0 $v1) (Member $x0 $v2) (Theme $e0 $x0))

;; p203152  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000274 tierB-000556 tierB-001530
(And (Agent $e0 $x0) (For $e0 $v0) (GroupOf $x0 $v1) (Member $e0 $v2))

;; p203153  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.242  tiers tierB  dominated
;;   e.g. tierB-000091 tierB-000605 tierB-001133
(And (Agent $e0 $x0) (For $e0 $v0) (Member $e0 $v1) (Member $x0 $v2))

;; p203154  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.241  tiers tierB
;;   e.g. tierB-000268 tierB-001098 tierB-001629
(And (Agent $e0 $x0) (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Theme $e0 $v0))

;; p203155  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.337  tiers tierB
;;   e.g. tierB-000237 tierB-000830 tierB-001440
(And (Agent $e0 $x0) (Location $e0 $v0) (Member $e0 $v1) (Member $x0 $v2))

;; p203156  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.598  tiers tierB
;;   e.g. tierB-001268 tierB-001773 tierB-001873
(And (Agent $e0 $x0) (Manner $e0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p203157  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Member $e0 $v1) (Patient $e1 $v0))

;; p203158  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Member $e0 $v1) (Result $e1 $e0))

;; p203159  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.923  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Member $v0 $v1) (Patient $e1 $v0))

;; p203160  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.929  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Member $v0 $v1) (Result $e1 $e0))

;; p203161  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.943  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Patient $e1 $v0) (Result $e1 $e0))

;; p203162  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $e0 $v1) (Member $v0 $v1) (Patient $e1 $v0))

;; p203163  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.914  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $e0 $v1) (Member $v0 $v1) (Result $e1 $e0))

;; p203164  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $e0 $v1) (Patient $e1 $v0) (Result $e1 $e0))

;; p203165  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.929  tiers tierB
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $v0 $v1) (Patient $e0 $v0) (Result $e0 $e1))

;; p203166  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.367  tiers tierB
;;   e.g. tierB-000842 tierB-000960 tierB-001594
(And (Degree $x0 $v0 $v1) (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v2))

;; p203167  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.673  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-001103 tierB-001847
(And (Degree $x0 $v0 $v1) (Member $e0 $v2) (Member $x0 $v0) (Theme $e0 $x0))

;; p203168  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.692  tiers tierB  dominated
;;   e.g. tierB-000352 tierB-000775 tierB-001594
(And (Degree $x0 $v0 $v1) (Member $e0 $v2) (Past $e0) (Patient $e0 $x0))

;; p203169  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.600  tiers tierB
;;   e.g. tierB-000352 tierB-000775 tierB-001594
(And (Degree $x0 $v0 $v1) (Member $x0 $v2) (Past $e0) (Patient $e0 $x0))

;; p203170  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.325  tiers tierB  signal conj-pattern
;;   e.g. tierB-000008 tierB-001500 tierB-001847
(And (Degree $x0 $v0 very) (Inheritance $v1 $v2) (Member $x0 $v0) (Member $x0 $v1))

;; p203171  cross  support 3 (occ 7)  size 4  lifted 3  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (For $e0 $x0) (Member $e0 $v1) (Member $x0 $v2))

;; p203172  cross  support 3 (occ 10)  size 4  lifted 3  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (For $e0 $x0) (Member $v0 $v1) (Member $x0 $v2))

;; p203173  cross  support 3 (occ 4)  size 4  lifted 3  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000589 tierB-000836 tierB-001091
(And (Experiencer $e0 $v0) (Location $e0 $x0) (Member $x0 $v1) (Past (Member $v0 $v2)))

;; p203174  cross  support 3 (occ 4)  size 4  lifted 3  nisurp 0.176  tiers tierB  dominated
;;   e.g. tierB-000114 tierB-000534 tierB-001479
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Theme $e1 $e0))

;; p203175  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000115 tierB-000203 tierB-000759
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (To $e1 $e0))

;; p203176  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.297  tiers tierB
;;   e.g. tierB-001504 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $v0 $v1) (Member $v0 $v2))

;; p203177  cross  support 3 (occ 4)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000086 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Possession $x0 $v0))

;; p203178  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.962  tiers tierB  dominated
;;   e.g. tierB-000681 tierB-000695 tierB-001479
(And (Experiencer $e0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Stimulus $e0 $x0))

;; p203179  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.105  tiers tierB
;;   e.g. tierB-001784 tierB-001851 tierB-001937
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Member $e0 $v1) (Time $e0 $v2))

;; p203180  cross  support 3 (occ 4)  size 4  lifted 3  nisurp -0.228  tiers tierB  dominated
;;   e.g. tierB-000654 tierB-001573 tierB-001906
(And (Experiencer $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0) (Member $x0 $v2))

;; p203181  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000227 tierB-000419 tierB-001334
(And (Experiencer $e0 $x0) (Location $e0 $v0) (Member $e0 $v1) (Member $x0 $v2))

;; p203182  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.564  tiers tierB
;;   e.g. tierB-000144 tierB-000419 tierB-000826
(And (Experiencer $e0 $x0) (Manner $e0 $v0) (Member $e0 $v1) (Member $x0 $v2))

;; p203183  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000831 tierB-001774 tierB-001896
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Possession $x0 $v2))

;; p203184  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000152 tierB-001521 tierB-001625
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Source $e0 $v2))

;; p203185  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.172  tiers tierB
;;   e.g. tierB-001180 tierB-001330 tierB-001424
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Stimulus $e0 $v2))

;; p203186  cross  support 3 (occ 4)  size 4  lifted 3  nisurp -0.670  tiers tierB
;;   e.g. tierB-000044 tierB-001603 tierB-001627
(And (For $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p203187  cross  support 3 (occ 11)  size 4  lifted 3  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-001627 tierB-001898
(And (For $e0 $x0) (Member $e0 $v1) (Member $v0 $v1) (Member $x0 $v2))

;; p203188  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000482 tierB-000588 tierB-001857
(And (Goal $e0 $x0) (Inheritance $v0 $v1) (Member $e0 $v2) (Member $x0 $v0))

;; p203189  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.172  tiers tierB
;;   e.g. tierB-000111 tierB-000427 tierB-000470
(And (Goal $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Theme $e0 $v2))

;; p203190  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (Inheritance $x0 $v1) (ProportionOf $x0 $x1 $v2))

;; p203191  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.102  tiers tierB  dominated
;;   e.g. tierB-000162 tierB-000333 tierB-001553
(And (GroupOf $x0 $v0) (Holder $e0 $v1) (Member $e0 $v2) (Theme $e0 $x0))

;; p203192  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.562  tiers tierB
;;   e.g. tierB-000799 tierB-000858 tierB-000965
(And (GroupOf $x0 $v0) (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Patient $e0 $x0))

;; p203193  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (GroupOf $x0 $v0) (Inheritance $x1 $v1) (ProportionOf $x1 $x0 $v2) (SubsetOf $x1 $x0))

;; p203194  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.715  tiers tierB
;;   e.g. tierB-000615 tierB-000975 tierB-001509
(And (GroupOf $x0 $v0) (LocatedIn $x0 $x1) (Member $x0 $v1) (Member $x1 $v2))

;; p203195  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-001694 tierB-001705
(And (GroupOf $x0 $v0) (Location $e0 $v1) (Member $e0 $v2) (Patient $e0 $x0))

;; p203196  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.118  tiers tierB
;;   e.g. tierB-000299 tierB-001591 tierB-001864
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Theme $e0 $x0) (Time $e0 $v2))

;; p203197  cross  support 3 (occ 4)  size 4  lifted 3  nisurp 0.221  tiers tierB
;;   e.g. tierB-000510 tierB-000819 tierB-001171
(And (Holder $e0 $v0) (Inheritance $v1 $v2) (Member $x0 $v1) (Theme $e0 $x0))

;; p203198  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.051  tiers tierB
;;   e.g. tierB-000309 tierB-001629 tierB-001728
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Past $e0) (Theme $e0 $v0))

;; p203199  cross  support 3 (occ 4)  size 4  lifted 3  nisurp 0.249  tiers tierB
;;   e.g. tierB-000654 tierB-001573 tierB-001906
(And (Inheritance $v0 $v1) (Member $e0 $v2) (Member $x0 $v0) (Member $x0 $v2))

;; p203200  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.524  tiers tierB
;;   e.g. tierB-000688 tierB-001332 tierB-001387
(And (Inheritance $v0 $v1) (Member $e0 $v2) (Member $x0 $v0) (Past (Member $x0 $v2)))

;; p203201  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000715 tierB-001046 tierB-001101
(And (Inheritance $v0 $v1) (Member $e0 $v2) (Recipient $e0 $x0) (Theme $e0 $v0))

;; p203202  cross  support 3 (occ 5)  size 4  lifted 3  nisurp 0.597  tiers tierB
;;   e.g. tierB-000654 tierB-000932 tierB-001573
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Member $x0 $v2) (Patient $e0 $x0))

;; p203203  cross  support 3 (occ 5)  size 4  lifted 3  nisurp -0.379  tiers tierB
;;   e.g. tierB-000330 tierB-000802 tierB-001313
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Member $x1 $v2) (PartOf $x0 $x1))

;; p203204  cross  support 3 (occ 9)  size 4  lifted 3  nisurp -0.379  tiers tierB
;;   e.g. tierB-001125 tierB-001586 tierB-001652
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Member $x1 $v2) (PartOf $x1 $x0))

;; p203205  cross  support 3 (occ 4)  size 4  lifted 3  nisurp -0.247  tiers tierB
;;   e.g. tierB-000699 tierB-000932 tierB-001864
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Patient $e0 $x0) (Time $e0 $v2))

;; p203206  cross  support 3 (occ 5)  size 4  lifted 3  nisurp -0.580  tiers tierB  dominated
;;   e.g. tierB-000444 tierB-000576 tierB-001143
(And (Instrument $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p203207  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.242  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001977
(And (Like $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p203208  cross  support 3 (occ 4)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000489 tierB-000707 tierB-001049
(And (LocatedIn $x0 $v0) (Location $e0 $x0) (Member $e0 $v1) (Member $x0 $v2))

;; p203209  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000830 tierB-000910 tierB-001621
(And (Location $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Theme $e1 $e0))

;; p203210  cross  support 3 (occ 4)  size 4  lifted 3  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000589 tierB-000836 tierB-001091
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 $v1) (Past (Member $v2 $v0)))

;; p203211  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.267  tiers tierB
;;   e.g. tierB-000005 tierB-000685 tierB-001062
(And (Manner $e0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p203212  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.912  tiers tierB
;;   e.g. tierB-001504 tierB-001573 tierB-001966
(And (Member $e0 $v0) (Member $e0 $v1) (Member $e1 $v2) (Result $e1 $e0))

;; p203213  cross  support 3 (occ 5)  size 4  lifted 3  nisurp -0.379  tiers tierB
;;   e.g. tierB-001339 tierB-001648 tierB-001688
(And (Member $e0 $v0) (Member $e0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p203214  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000252 tierB-000404 tierB-001431
(And (Member $e0 $v0) (Member $e1 $v1) (Patient $e0 $v2) (To $e1 $e0))

;; p203215  cross  support 3 (occ 4)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000171 tierB-000229 tierB-000282
(And (Member $e0 $v0) (Member $e1 $v1) (Theme $e0 $v2) (To $e1 $e0))

;; p203216  cross  support 3 (occ 5)  size 4  lifted 3  nisurp 1.391  tiers tierB
;;   e.g. tierB-000596 tierB-000786 tierB-001573
(And (Member $e0 $v0) (Member $x0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p203217  cross  support 3 (occ 3)  size 4  lifted 3  nisurp -0.449  tiers tierB
;;   e.g. tierB-000093 tierB-000734 tierB-000827
(And (Member $e0 $v0) (Member $x0 $v1) (Member $x0 $v2) (To $e0 $x0))

;; p203218  cross  support 3 (occ 4)  size 4  lifted 3  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000955 tierB-001287
(And (Member $e0 $v0) (Member $x0 $v1) (Patient $e0 $v2) (Source $e0 $x0))

;; p203219  cross  support 3 (occ 4)  size 4  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000438 tierB-000485 tierB-001386
(And (Member $e0 $v0) (Member $x0 $v1) (Source $e0 $x0) (Theme $e0 $v2))

;; p203220  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Member $e0 $v2) (Member $v0 $v1) (Ongoing $e0) (Patient $e0 $v0))

;; p203221  cross  support 3 (occ 3)  size 4  lifted 3  nisurp 0.929  tiers tierB
;;   e.g. tierB-000187 tierB-001020 tierB-001728
(And (Member $v0 $v1) (Member $v2 $v1) (PartOf $v0 $x0) (PartOf $v2 $x0))

;; p203222  cross  support 3 (occ 5)  size 4  lifted 3  nisurp -0.400  tiers tierB
;;   e.g. tierB-000832 tierB-000932 tierB-001476
(And (Member $x0 $v0) (Member $x0 $v1) (Patient $e0 $x0) (Time $e0 $v2))

;; p203223  cross  support 3 (occ 6)  size 4  lifted 4  nisurp -0.794  tiers tierB
;;   e.g. tierB-000371 tierB-001246 tierB-001912
(And (Agent $e0 $v0) (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Member $e0 $v3))

;; p203224  cross  support 3 (occ 3)  size 4  lifted 4  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Member $e1 $v3) (Patient $e1 $v0))

;; p203225  cross  support 3 (occ 3)  size 4  lifted 4  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Member $e1 $v3) (Result $e1 $e0))

;; p203226  cross  support 3 (occ 3)  size 4  lifted 4  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $e0 $v1) (Member $e1 $v3) (Patient $e1 $v0))

;; p203227  cross  support 3 (occ 3)  size 4  lifted 4  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $e0 $v1) (Member $e1 $v3) (Result $e1 $e0))

;; p203228  cross  support 3 (occ 3)  size 4  lifted 4  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $e0 $v3) (Member $v0 $v1) (Patient $e0 $v0))

;; p203229  cross  support 3 (occ 3)  size 4  lifted 4  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $e0 $v3) (Patient $e0 $v0) (Result $e0 $e1))

;; p203230  cross  support 3 (occ 3)  size 4  lifted 4  nisurp -0.593  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-001500 tierB-001847
(And (Degree $x0 $v0 $v1) (Inheritance $v2 $v3) (Member $x0 $v0) (Member $x0 $v2))

;; p203231  cross  support 3 (occ 3)  size 4  lifted 4  nisurp -0.673  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-001103 tierB-001847
(And (Degree $x0 $v0 $v1) (Member $e0 $v2) (Member $x0 $v3) (Theme $e0 $x0))

;; p203232  cross  support 3 (occ 3)  size 4  lifted 4  nisurp 0.766  tiers tierB  dominated
;;   e.g. tierB-000268 tierB-000915 tierB-001629
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Manner $e0 $v3) (Theme $e0 $v0))

;; p203233  cross  support 3 (occ 6)  size 4  lifted 4  nisurp 0.473  tiers tierB
;;   e.g. tierB-000268 tierB-000915 tierB-001629
(And (Inheritance $v0 $v1) (Manner $e0 $v2) (Member $e0 $v3) (Theme $e0 $v0))

;; p203234  cross  support 3 (occ 5)  size 4  lifted 4  nisurp 0.949  tiers tierB
;;   e.g. tierB-001385 tierB-001573 tierB-001647
(And (Inheritance $v0 $v1) (Member $x0 $v0) (Member $x0 $v2) (Member $x0 $v3))

;; p203235  cross  support 3 (occ 4)  size 4  lifted 4  nisurp 0.473  tiers tierB
;;   e.g. tierB-000373 tierB-000970 tierB-001691
(And (Location $e0 $v0) (Member $e0 $v3) (Member $v1 $v2) (Patient $e0 $v1))

;; p203236  cross  support 3 (occ 5)  size 3  lifted 0  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Goal $e0 $x1))

;; p203237  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 begin))

;; p203238  cross  support 3 (occ 4)  size 3  lifted 0  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $e0 try))

;; p203239  cross  support 3 (occ 3)  size 3  lifted 0  nisurp -0.300  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e0 $e2))

;; p203240  cross  support 3 (occ 3)  size 3  lifted 0  nisurp -0.084  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001219 tierB-001773
(And (Agent $e0 $x0) (Agent $e1 $x0) (Theme $e2 $e0))

;; p203241  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Agent $e1 $x0) (To $e0 $e1))

;; p203242  cross  support 3 (occ 3)  size 3  lifted 0  nisurp -0.462  tiers tierB  dominated
;;   e.g. tierB-000738 tierB-000772 tierB-001534
(And (Agent $e0 $x0) (Cardinality $x0 <num>) (Past $e0))

;; p203243  cross  support 3 (occ 5)  size 3  lifted 0  nisurp 0.315  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000379 tierB-001266
(And (Agent $e0 $x0) (Cardinality $x1 <num>) (Theme $e0 $x1))

;; p203244  cross  support 3 (occ 3)  size 3  lifted 0  nisurp -0.707  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000783 tierB-001782
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Theme $e0 $x1))

;; p203245  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.559  tiers tierB  dominated
;;   e.g. tierB-000160 tierB-000339 tierB-001496
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Theme $e1 $e0))

;; p203246  cross  support 3 (occ 3)  size 3  lifted 0  nisurp -0.043  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Experiencer $e1 $x1) (Patient $e0 $x1))

;; p203247  cross  support 3 (occ 3)  size 3  lifted 0  nisurp -0.246  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Experiencer $e1 $x1) (Result $e0 $e1))

;; p203248  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.901  tiers tierB  dominated
;;   e.g. tierB-001457 tierB-001530 tierB-001840
(And (Agent $e0 $x0) (GroupOf $x0 boy) (Ongoing $e0))

;; p203249  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.873  tiers tierB  dominated
;;   e.g. tierB-001125 tierB-001245 tierB-001511
(And (Agent $e0 $x0) (GroupOf $x0 child) (Location $e0 $x1))

;; p203250  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.988  tiers tierB  signal conj-pattern
;;   e.g. tierB-000648 tierB-001125 tierB-001433
(And (Agent $e0 $x0) (GroupOf $x0 child) (Member $e0 play))

;; p203251  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.619  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001283 tierB-001933
(And (Agent $e0 $x0) (Location $e1 $x1) (Theme $e0 $e1))

;; p203252  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.621  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Member $e1 begin) (Theme $e1 $e0))

;; p203253  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.567  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Member $e1 try) (Theme $e1 $e0))

;; p203254  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000762 tierB-000853 tierB-001932
(And (Agent $e0 $x0) (Member $x0 company) (Past $e0))

;; p203255  cross  support 3 (occ 5)  size 3  lifted 0  nisurp 0.416  tiers tierB  dominated
;;   e.g. tierB-001773 tierB-001801 tierB-001803
(And (Agent $e0 $x0) (Member $x0 man) (Past $e0))

;; p203256  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000045 tierB-000132 tierB-000298
(And (Agent $e0 $x0) (Member $x0 plane) (Past $e0))

;; p203257  cross  support 3 (occ 3)  size 3  lifted 0  nisurp -0.141  tiers tierB  dominated
;;   e.g. tierB-000978 tierB-001661 tierB-001881
(And (Agent $e0 $x0) (Member $x0 thing) (Theme $e0 $x1))

;; p203258  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.458  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-000950 tierB-001926
(And (Agent $e0 $x0) (Member $x1 door) (Patient $e0 $x1))

;; p203259  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.422  tiers tierB  dominated
;;   e.g. tierB-001066 tierB-001243 tierB-001586
(And (Agent $e0 $x0) (PartOf $x1 $x2) (Theme $e0 $x1))

;; p203260  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000316 tierB-001720 tierB-001911
(And (Agent $e0 $x0) (Past $e1) (Stimulus $e1 $e0))

;; p203261  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.567  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Past $e1) (To $e1 $e0))

;; p203262  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.513  tiers tierB  dominated
;;   e.g. tierB-000423 tierB-000975 tierB-001836
(And (Agent $e0 $x0) (Possession $x1 $x0) (Theme $e0 $x1))

;; p203263  cross  support 3 (occ 4)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(And (Agent $e0 mark) (Agent $e1 mark) (Past $e0))

;; p203264  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001302
(And (Before $e0 $e1) (Past $e0) (Past $e1))

;; p203265  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.823  tiers tierB  dominated
;;   e.g. tierB-000797 tierB-001348 tierB-001412
(And (Cardinality $x0 <num>) (Holder $e0 $x1) (Theme $e0 $x0))

;; p203266  cross  support 3 (occ 4)  size 3  lifted 0  nisurp 0.890  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e1 get) (Patient $e1 $x0))

;; p203267  cross  support 3 (occ 4)  size 3  lifted 0  nisurp 0.890  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Member $e1 get) (Result $e1 $e0))

;; p203268  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.934  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Experiencer $e0 $x0) (Member $e1 leave) (Patient $e1 $x0))

;; p203269  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.934  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Experiencer $e0 $x0) (Member $e1 leave) (Result $e1 $e0))

;; p203270  cross  support 3 (occ 4)  size 3  lifted 0  nisurp 0.868  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Experiencer $e0 $x0) (Member $e1 turn) (Patient $e1 $x0))

;; p203271  cross  support 3 (occ 4)  size 3  lifted 0  nisurp 0.912  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Experiencer $e0 $x0) (Member $e1 turn) (Result $e1 $e0))

;; p203272  cross  support 3 (occ 4)  size 3  lifted 0  nisurp 0.228  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Ongoing $e1) (Patient $e1 $x0))

;; p203273  cross  support 3 (occ 4)  size 3  lifted 0  nisurp 0.430  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Experiencer $e0 $x0) (Ongoing $e1) (Result $e1 $e0))

;; p203274  cross  support 3 (occ 4)  size 3  lifted 0  nisurp 0.226  tiers tierB  dominated
;;   e.g. tierB-000196 tierB-000412 tierB-000771
(And (GroupOf $x0 person) (Past $e0) (Patient $e0 $x0))

;; p203275  cross  support 3 (occ 3)  size 3  lifted 0  nisurp -0.575  tiers tierB  dominated
;;   e.g. tierB-000265 tierB-000680 tierB-001359
(And (LocatedIn $x0 $x1) (Past $e0) (Patient $e0 $x0))

;; p203276  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.983  tiers tierB  dominated
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(And (Location $e0 $x0) (Member $e0 live) (Member $x0 house))

;; p203277  cross  support 3 (occ 4)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-001515 tierB-001873
(And (Member $e0 stop) (Past $e1) (Theme $e0 $e1))

;; p203278  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000890 tierB-001163 tierB-001302
(And (Member $x0 fire) (Past $e0) (Patient $e0 $x0))

;; p203279  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000876 tierB-001070 tierB-001423
(And (Member $x0 picture) (Past $e0) (Theme $e0 $x0))

;; p203280  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.897  tiers tierB  dominated
;;   e.g. tierB-001520 tierB-001622 tierB-001761
(And (Member $x0 thing) (Obligated $e0) (Patient $e0 $x0))

;; p203281  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.653  tiers tierB  dominated
;;   e.g. tierB-001130 tierB-001557 tierB-001940
(And (Ongoing $e0) (Patient $e1 $x0) (Theme $e0 $e1))

;; p203282  cross  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000547 tierB-001219
(And (Past $e0) (Recipient $e1 $x0) (Theme $e0 $e1))

;; p203283  cross  support 3 (occ 3)  size 3  lifted 0  nisurp -0.611  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000400 tierB-000401
(And (Past $e0) (Theme $e0 $e1) (Theme $e1 $x0))

;; p203284  cross  support 3 (occ 5)  size 3  lifted 0  nisurp -0.611  tiers tierB  dominated
;;   e.g. tierB-000162 tierB-000636 tierB-001526
(And (Past $e0) (Theme $e0 $x0) (Theme $e1 $x0))

;; p203285  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000969 tierB-001589 tierB-001980
(And (Agent $e0 $e1) (Member $e0 $v0) (Theme $e1 $x0))

;; p203286  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.167  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-000951 tierB-000962
(And (Agent $e0 $v0) (Agent $e1 $v0) (Location $e0 $x0))

;; p203287  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.891  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Agent $e1 $v0) (Member $e0 begin))

;; p203288  cross  support 3 (occ 4)  size 3  lifted 1  nisurp -0.138  tiers tierB  dominated
;;   e.g. tierB-000166 tierB-000410 tierB-000622
(And (Agent $e0 $v0) (Agent $e1 $x0) (Theme $e0 $e1))

;; p203289  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.588  tiers tierB  dominated
;;   e.g. tierB-000203 tierB-001185 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Ongoing $e0))

;; p203290  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.529  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Patient $e2 $v0))

;; p203291  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.529  tiers tierB  dominated
;;   e.g. tierB-001185 tierB-001538 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Result $e0 $e1))

;; p203292  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.529  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Result $e2 $e1))

;; p203293  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.389  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001449 tierB-001809
(And (Agent $e0 $v0) (Experiencer $e1 $v0) (Theme $e0 $x0))

;; p203294  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e1 $e0) (Past $e1))

;; p203295  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.746  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Member $e1 begin) (Theme $e1 $e0))

;; p203296  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.123  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Past $e1) (Patient $e1 $v0))

;; p203297  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.565  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Patient $e1 $v0) (Result $e1 $e2))

;; p203298  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.464  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-001079 tierB-001809
(And (Agent $e0 $v0) (Patient $e1 $v0) (Theme $e0 $x0))

;; p203299  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.120  tiers tierB  dominated
;;   e.g. tierB-000400 tierB-000401 tierB-001149
(And (Agent $e0 $v0) (Theme $e0 $e1) (Theme $e1 $x0))

;; p203300  cross  support 3 (occ 4)  size 3  lifted 1  nisurp -0.035  tiers tierB  dominated
;;   e.g. tierB-000156 tierB-000745 tierB-001888
(And (Agent $e0 $x0) (Can $e0) (Member $x0 $v0))

;; p203301  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-001663 tierB-001786
(And (Agent $e0 $x0) (For $e0 $x1) (Member $x0 $v0))

;; p203302  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(And (Agent $e0 $x0) (Goal $e0 home) (Member $x0 $v0))

;; p203303  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.586  tiers tierB  dominated
;;   e.g. tierB-000277 tierB-000387 tierB-001534
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 come))

;; p203304  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.448  tiers tierB  signal conj-pattern
;;   e.g. tierB-001457 tierB-001754 tierB-001920
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 make))

;; p203305  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.793  tiers tierB  signal conj-pattern
;;   e.g. tierB-000225 tierB-000710 tierB-001984
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 study))

;; p203306  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.724  tiers tierB  dominated
;;   e.g. tierB-000782 tierB-001008 tierB-001511
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (Member $e0 swim))

;; p203307  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000225 tierB-001251 tierB-001984
(And (Agent $e0 $x0) (GroupOf $x0 scientist) (Member $e0 $v0))

;; p203308  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000274 tierB-001058 tierB-001695
(And (Agent $e0 $x0) (GroupOf $x0 soldier) (Member $e0 $v0))

;; p203309  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000769 tierB-001260
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (Recipient $e0 $x1))

;; p203310  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000772 tierB-001035 tierB-001628
(And (Agent $e0 $x0) (GroupOf $x1 $v0) (SubsetOf $x0 $x1))

;; p203311  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-001430 tierB-001528 tierB-001739
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 bus))

;; p203312  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000049 tierB-000339 tierB-000793
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 doctor))

;; p203313  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-001086 tierB-001551 tierB-001892
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 dog))

;; p203314  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000045 tierB-000132 tierB-000298
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $x0 plane))

;; p203315  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000772 tierB-001035 tierB-001628
(And (Agent $e0 $x0) (Member $e0 $v0) (SubsetOf $x0 $x1))

;; p203316  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000237 tierB-001440 tierB-001992
(And (Agent $e0 $x0) (Member $e0 arrive) (Member $x0 $v0))

;; p203317  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.035  tiers tierB  dominated
;;   e.g. tierB-000775 tierB-001649 tierB-001875
(And (Agent $e0 $x0) (Member $e0 cause) (Member $x0 $v0))

;; p203318  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000950 tierB-001205 tierB-001926
(And (Agent $e0 $x0) (Member $e0 close) (Member $x0 $v0))

;; p203319  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.242  tiers tierB  signal conj-pattern
;;   e.g. tierB-000238 tierB-001528 tierB-001963
(And (Agent $e0 $x0) (Member $e0 come) (Member $x0 $v0))

;; p203320  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000045 tierB-000121 tierB-001789
(And (Agent $e0 $x0) (Member $e0 fly) (Member $x0 $v0))

;; p203321  cross  support 3 (occ 5)  size 3  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001983
(And (Agent $e0 $x0) (Member $e0 jump) (Member $x0 $v0))

;; p203322  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000769 tierB-001260 tierB-001663
(And (Agent $e0 $x0) (Member $e0 provide) (Member $x0 $v0))

;; p203323  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000339 tierB-001153 tierB-001563
(And (Agent $e0 $x0) (Member $e0 run) (Member $x0 $v0))

;; p203324  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001169 tierB-001219
(And (Agent $e0 $x0) (Member $e0 start) (Member $x0 $v0))

;; p203325  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000782 tierB-001008 tierB-001268
(And (Agent $e0 $x0) (Member $e0 swim) (Member $x0 $v0))

;; p203326  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000942 tierB-000978 tierB-001726
(And (Agent $e0 $x0) (Member $e0 take) (Member $x0 $v0))

;; p203327  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000316 tierB-001720 tierB-001911
(And (Agent $e0 $x0) (Member $e1 $v0) (Stimulus $e1 $e0))

;; p203328  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.025  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Member $e1 $v0) (To $e0 $e1))

;; p203329  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.025  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Member $e1 $v0) (To $e1 $e0))

;; p203330  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.192  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-001294 tierB-001430
(And (Agent $e0 $x0) (Member $x0 $v0) (Member $x1 $v0))

;; p203331  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.022  tiers tierB  dominated
;;   e.g. tierB-000268 tierB-001507 tierB-001976
(And (Agent $e0 $x0) (Member $x0 $v0) (Obligated $e0))

;; p203332  cross  support 3 (occ 6)  size 3  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001205
(And (Agent $e0 $x0) (Member $x0 $v0) (Over $e0 $x1))

;; p203333  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.675  tiers tierB  dominated
;;   e.g. tierB-000673 tierB-000770 tierB-001283
(And (Agent $e0 $x0) (Patient $e1 $v0) (Theme $e0 $e1))

;; p203334  cross  support 3 (occ 6)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(And (Agent $e0 mark) (Agent $e1 mark) (Member $e0 $v0))

;; p203335  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000340 tierB-001316 tierB-001572
(And (At $e0 $x0) (Member $x0 $v0) (Past $e0))

;; p203336  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001302
(And (Before $e0 $e1) (Member $e1 $v0) (Past $e0))

;; p203337  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-001222 tierB-001531 tierB-001544
(And (Before $x0 $e0) (Member $x0 $v0) (Past $e0))

;; p203338  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.724  tiers tierB  dominated
;;   e.g. tierB-001047 tierB-001246 tierB-001721
(And (Can $e0) (GroupOf $x0 $v0) (Patient $e0 $x0))

;; p203339  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000319 tierB-000745 tierB-001888
(And (Can $e0) (Member $x0 $v0) (Theme $e0 $x0))

;; p203340  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-001782 tierB-001809
(And (During $e0 $e1) (Member $e0 $v0) (Past $e1))

;; p203341  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000867 tierB-001782 tierB-001809
(And (During $e0 $e1) (Member $e1 $v0) (Past $e0))

;; p203342  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000496 tierB-000534 tierB-001479
(And (Experiencer $e0 $v0) (Experiencer $e1 $v0) (Past $e0))

;; p203343  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.944  tiers tierB  dominated
;;   e.g. tierB-000114 tierB-000534 tierB-001479
(And (Experiencer $e0 $v0) (Experiencer $e1 $v0) (Theme $e0 $e1))

;; p203344  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.846  tiers tierB  dominated
;;   e.g. tierB-000756 tierB-000759 tierB-000865
(And (Experiencer $e0 $v0) (Member $x0 thing) (Stimulus $e0 $x0))

;; p203345  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.678  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Experiencer $e0 $v0) (Ongoing $e1) (Patient $e1 $v0))

;; p203346  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.984  tiers tierB  dominated
;;   e.g. tierB-000168 tierB-000916 tierB-001320
(And (Experiencer $e0 $x0) (Future $e0) (Future (Member $x0 $v0)))

;; p203347  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000168 tierB-000916 tierB-001320
(And (Experiencer $e0 $x0) (Future $e0) (Member $x0 $v0))

;; p203348  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-001496 tierB-001685 tierB-001945
(And (Experiencer $e0 $x0) (GroupOf $x0 child) (Member $e0 $v0))

;; p203349  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000250 tierB-001003 tierB-001334
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 cat))

;; p203350  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000425 tierB-000747 tierB-000880
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 door))

;; p203351  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000370 tierB-000842 tierB-000960
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 thing))

;; p203352  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000495 tierB-000565 tierB-000748
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Member $x0 weather))

;; p203353  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000565 tierB-000904 tierB-001920
(And (Experiencer $e0 $x0) (Member $e0 beautiful) (Member $x0 $v0))

;; p203354  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000230 tierB-000297 tierB-000831
(And (Experiencer $e0 $x0) (Member $e0 look) (Member $x0 $v0))

;; p203355  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000174 tierB-000339 tierB-000455
(And (Experiencer $e0 $x0) (Member $e0 need) (Member $x0 $v0))

;; p203356  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000144 tierB-000419 tierB-001515
(And (Experiencer $e0 $x0) (Member $e0 work) (Member $x0 $v0))

;; p203357  cross  support 3 (occ 5)  size 3  lifted 1  nisurp -0.074  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-000832
(And (Experiencer $e0 $x0) (Member $e1 $v0) (Member $x0 $v0))

;; p203358  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000495 tierB-001521 tierB-001891
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Probably $e0))

;; p203359  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000495 tierB-000631 tierB-000808
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Time $e0 today))

;; p203360  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (For $e0 $e1) (Member $e1 $v0) (Past $e0))

;; p203361  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000712 tierB-001786 tierB-001879
(And (For $e0 $x0) (Member $x0 $v0) (Ongoing $e0))

;; p203362  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.027  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-001603 tierB-001786
(And (For $e0 $x0) (Member $x0 $v0) (Past $e0))

;; p203363  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.240  tiers tierB  dominated
;;   e.g. tierB-001513 tierB-001816 tierB-001924
(And (Future $e0) (GroupOf $x0 $v0) (Patient $e0 $x0))

;; p203364  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.448  tiers tierB  dominated
;;   e.g. tierB-001266 tierB-001591 tierB-001797
(And (Future $e0) (GroupOf $x0 $v0) (Theme $e0 $x0))

;; p203365  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.611  tiers tierB  dominated
;;   e.g. tierB-000834 tierB-000909 tierB-001728
(And (Goal $e0 $x0) (GroupOf $x0 $v0) (Past $e0))

;; p203366  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-001563 tierB-001579 tierB-001902
(And (Goal $e0 $x0) (Manner $e0 quickly) (Member $x0 $v0))

;; p203367  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000387 tierB-001534 tierB-001963
(And (Goal $e0 $x0) (Member $e0 come) (Member $x0 $v0))

;; p203368  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000723
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (ProportionOf $x0 $x1 some))

;; p203369  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000796 tierB-001196 tierB-001760
(And (GroupOf $x0 $v0) (LocatedIn $x0 $x1) (Member $x1 full))

;; p203370  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.724  tiers tierB  signal conj-pattern
;;   e.g. tierB-000615 tierB-000760 tierB-001935
(And (GroupOf $x0 $v0) (LocatedIn $x0 $x1) (Member $x1 garden))

;; p203371  cross  support 3 (occ 5)  size 3  lifted 1  nisurp 0.655  tiers tierB  signal conj-pattern
;;   e.g. tierB-000101 tierB-000454 tierB-001650
(And (GroupOf $x0 $v0) (Member $e0 contain) (Theme $e0 $x0))

;; p203372  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.517  tiers tierB  signal conj-pattern
;;   e.g. tierB-000194 tierB-000779 tierB-001364
(And (GroupOf $x0 $v0) (Member $e0 fall) (Patient $e0 $x0))

;; p203373  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.948  tiers tierB
;;   e.g. tierB-000697 tierB-001362 tierB-001575
(And (GroupOf $x0 $v0) (Member $x1 $v0) (PartOf $x1 $x0))

;; p203374  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000246 tierB-000398 tierB-001591
(And (GroupOf $x0 $v0) (Obligated $e0) (Theme $e0 $x0))

;; p203375  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.033  tiers tierB  dominated
;;   e.g. tierB-000416 tierB-000784 tierB-001120
(And (GroupOf $x0 $v0) (Ongoing $e0) (Theme $e0 $x0))

;; p203376  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.289  tiers tierB  dominated
;;   e.g. tierB-001394 tierB-001816 tierB-001940
(And (GroupOf $x0 $v0) (Patient $e0 $x0) (Theme $e0 $e1))

;; p203377  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000126 tierB-001108 tierB-001286
(And (GroupOf $x0 person) (Member $x1 $v0) (Past (LocatedIn $x0 $x1)))

;; p203378  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-001721 tierB-001816 tierB-001893
(And (GroupOf $x0 thing) (Member $e0 $v0) (Patient $e0 $x0))

;; p203379  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.035  tiers tierB  dominated
;;   e.g. tierB-000774 tierB-001033 tierB-001600
(And (In $e0 $x0) (Member $x0 $v0) (Past $e0))

;; p203380  cross  support 3 (occ 5)  size 3  lifted 1  nisurp -0.635  tiers tierB  dominated
;;   e.g. tierB-000392 tierB-000733 tierB-001143
(And (Instrument $e0 $x0) (Member $x0 $v0) (Patient $e0 $x1))

;; p203381  cross  support 3 (occ 5)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000230 tierB-000831 tierB-001135
(And (Like $e0 $x0) (Member $e0 look) (Member $x0 $v0))

;; p203382  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.030  tiers tierB  dominated
;;   e.g. tierB-000305 tierB-000524 tierB-001257
(And (LocatedIn $x0 $x1) (Location $e0 $x0) (Member $e0 $v0))

;; p203383  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.030  tiers tierB  dominated
;;   e.g. tierB-000305 tierB-000524 tierB-001257
(And (LocatedIn $x0 $x1) (Location $e0 $x0) (Member $x1 $v0))

;; p203384  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000975 tierB-001416 tierB-001638
(And (LocatedIn $x0 $x1) (Member $e0 $v0) (Theme $e0 $x0))

;; p203385  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.379  tiers tierB  dominated
;;   e.g. tierB-000975 tierB-001416 tierB-001638
(And (LocatedIn $x0 $x1) (Member $x1 $v0) (Theme $e0 $x0))

;; p203386  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000830 tierB-000910 tierB-001621
(And (Location $e0 $v0) (Past $e1) (Theme $e1 $e0))

;; p203387  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(And (Location $e0 $x0) (Member $e0 $v0) (Member $x0 house))

;; p203388  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.396  tiers tierB  dominated
;;   e.g. tierB-000618 tierB-001125 tierB-001925
(And (Location $e0 $x0) (Member $e0 $v0) (PartOf $x0 $x1))

;; p203389  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.030  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001257 tierB-001283
(And (Location $e0 $x0) (Member $x0 $v0) (Theme $e1 $e0))

;; p203390  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000618 tierB-001125 tierB-001925
(And (Location $e0 $x0) (Member $x1 $v0) (PartOf $x0 $x1))

;; p203391  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.319  tiers tierB  dominated
;;   e.g. tierB-000087 tierB-001515 tierB-001873
(And (Manner $e0 $v0) (Past $e1) (Theme $e0 $e1))

;; p203392  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.309  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-001446 tierB-001773
(And (Manner $e0 $v0) (Past $e1) (Theme $e1 $e0))

;; p203393  cross  support 3 (occ 10)  size 3  lifted 1  nisurp -0.037  tiers tierB  dominated
;;   e.g. tierB-000101 tierB-000198 tierB-000367
(And (Member $e0 $v0) (Member $e1 $v0) (Theme $e0 $x0))

;; p203394  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-001079 tierB-001582 tierB-001817
(And (Member $e0 $v0) (Member $e1 become) (Result $e1 $e0))

;; p203395  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Member $e0 $v0) (Member $e1 leave) (Result $e1 $e0))

;; p203396  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-001515 tierB-001873
(And (Member $e0 $v0) (Member $e1 stop) (Theme $e1 $e0))

;; p203397  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.528  tiers tierB  dominated
;;   e.g. tierB-000425 tierB-000747 tierB-000880
(And (Member $e0 $v0) (Member $x0 $v0) (Member $x0 door))

;; p203398  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000748 tierB-001594 tierB-001910
(And (Member $e0 $v0) (Member $x0 bad) (Patient $e0 $x0))

;; p203399  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000890 tierB-001457 tierB-001831
(And (Member $e0 $v0) (Member $x0 big) (Patient $e0 $x0))

;; p203400  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000890 tierB-001163 tierB-001302
(And (Member $e0 $v0) (Member $x0 fire) (Patient $e0 $x0))

;; p203401  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.224  tiers tierB  signal conj-pattern
;;   e.g. tierB-000371 tierB-000471 tierB-001887
(And (Member $e0 $v0) (Member $x0 house) (Patient $e0 $x0))

;; p203402  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal conj-pattern
;;   e.g. tierB-000685 tierB-001106 tierB-001756
(And (Member $e0 $v0) (Member $x0 light) (Patient $e0 $x0))

;; p203403  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000876 tierB-001070 tierB-001423
(And (Member $e0 $v0) (Member $x0 picture) (Theme $e0 $x0))

;; p203404  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.452  tiers tierB  signal conj-pattern
;;   e.g. tierB-000935 tierB-001202 tierB-001910
(And (Member $e0 $v0) (Member $x0 problem) (Patient $e0 $x0))

;; p203405  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.315  tiers tierB  signal conj-pattern
;;   e.g. tierB-001642 tierB-001920 tierB-001997
(And (Member $e0 $v0) (Member $x0 room) (Patient $e0 $x0))

;; p203406  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000756 tierB-000759 tierB-000865
(And (Member $e0 $v0) (Member $x0 thing) (Stimulus $e0 $x0))

;; p203407  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.452  tiers tierB  signal conj-pattern
;;   e.g. tierB-000517 tierB-000748 tierB-001491
(And (Member $e0 $v0) (Member $x0 weather) (Patient $e0 $x0))

;; p203408  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-001246 tierB-001926 tierB-001964
(And (Member $e0 $v0) (PartOf $x0 $x1) (Patient $e0 $x0))

;; p203409  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.178  tiers tierB  dominated
;;   e.g. tierB-000371 tierB-001304 tierB-001867
(And (Member $e0 $v0) (Patient $e1 $x0) (To $e0 $e1))

;; p203410  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000547 tierB-001219
(And (Member $e0 $v0) (Recipient $e1 $x0) (Theme $e0 $e1))

;; p203411  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.246  tiers tierB  dominated
;;   e.g. tierB-000147 tierB-000258 tierB-001396
(And (Member $e0 $v0) (Theme $e1 $x0) (To $e0 $e1))

;; p203412  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000037 tierB-000128 tierB-000974
(And (Member $e0 approve) (Member $x0 $v0) (Theme $e0 $x0))

;; p203413  cross  support 3 (occ 5)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000063 tierB-000932 tierB-001867
(And (Member $e0 build) (Member $x0 $v0) (Patient $e0 $x0))

;; p203414  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000218 tierB-000950 tierB-001926
(And (Member $e0 close) (Member $x0 $v0) (Patient $e0 $x0))

;; p203415  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000809 tierB-001166 tierB-001541
(And (Member $e0 cover) (Member $x0 $v0) (Patient $e0 $x0))

;; p203416  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-000728 tierB-000863
(And (Member $e0 create) (Member $x0 $v0) (Patient $e0 $x0))

;; p203417  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000779 tierB-001364
(And (Member $e0 fall) (Member $x0 $v0) (Source $e0 $x0))

;; p203418  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000418 tierB-000672 tierB-001325
(And (Member $e0 get) (Member $x0 $v0) (Theme $e0 $x0))

;; p203419  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.449  tiers tierB  dominated
;;   e.g. tierB-000067 tierB-001197 tierB-001399
(And (Member $e0 kill) (Member $x0 $v0) (Patient $e0 $x0))

;; p203420  cross  support 3 (occ 5)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Member $e0 leave) (Member $x0 $v0) (Patient $e0 $x0))

;; p203421  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000704 tierB-000713 tierB-001350
(And (Member $e0 leave) (Member $x0 $v0) (Theme $e0 $x0))

;; p203422  cross  support 3 (occ 5)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000089 tierB-000648 tierB-000816
(And (Member $e0 play) (Member $x0 $v0) (Theme $e0 $x0))

;; p203423  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000876 tierB-001486 tierB-001932
(And (Member $e0 present) (Member $x0 $v0) (Theme $e0 $x0))

;; p203424  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000783 tierB-001221 tierB-001637
(And (Member $e0 read) (Member $x0 $v0) (Theme $e0 $x0))

;; p203425  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000962 tierB-001595 tierB-001693
(And (Member $e0 receive) (Member $x0 $v0) (Theme $e0 $x0))

;; p203426  cross  support 3 (occ 5)  size 3  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000607 tierB-001566 tierB-001980
(And (Member $e0 require) (Member $x0 $v0) (Theme $e0 $x0))

;; p203427  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000080 tierB-000865 tierB-001626
(And (Member $e0 say) (Member $x0 $v0) (Theme $e0 $x0))

;; p203428  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000383 tierB-000482 tierB-001027
(And (Member $e0 stick) (Member $x0 $v0) (Patient $e0 $x0))

;; p203429  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.885  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000470 tierB-001257
(And (Member $e0 try) (Theme $e0 $e1) (Theme $e1 $v0))

;; p203430  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.857  tiers tierB
;;   e.g. tierB-000229 tierB-001243 tierB-001745
(And (Member $x0 $v0) (Member $x1 $v0) (PartOf $x0 $x1))

;; p203431  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000172 tierB-001586 tierB-001638
(And (Member $x0 $v0) (Member $x1 bottom) (PartOf $x1 $x0))

;; p203432  cross  support 3 (occ 5)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000218 tierB-000969 tierB-001476
(And (Member $x0 $v0) (Might $e0) (Patient $e0 $x0))

;; p203433  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-001070 tierB-001262 tierB-001423
(And (Member $x0 $v0) (Of $x1 $x0) (Theme $e0 $x1))

;; p203434  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.379  tiers tierB  dominated
;;   e.g. tierB-001246 tierB-001926 tierB-001964
(And (Member $x0 $v0) (PartOf $x1 $x0) (Patient $e0 $x1))

;; p203435  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000517 tierB-001588 tierB-001910
(And (Member $x0 $v0) (Patient $e0 $x0) (Probably $e0))

;; p203436  cross  support 3 (occ 5)  size 3  lifted 1  nisurp 0.342  tiers tierB  dominated
;;   e.g. tierB-000371 tierB-001304 tierB-001867
(And (Member $x0 $v0) (Patient $e0 $x0) (To $e1 $e0))

;; p203437  cross  support 3 (occ 3)  size 3  lifted 1  nisurp -0.172  tiers tierB  dominated
;;   e.g. tierB-000400 tierB-000401 tierB-001149
(And (Member $x0 $v0) (Theme $e0 $e1) (Theme $e1 $x0))

;; p203438  cross  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000147 tierB-000258 tierB-001396
(And (Member $x0 $v0) (Theme $e0 $x0) (To $e1 $e0))

;; p203439  cross  support 3 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-001177 tierB-001566 tierB-001922
(And (Member $x0 $v0) (Theme $e0 $x1) (To $e0 $x0))

;; p203440  cross  support 3 (occ 10)  size 3  lifted 1  nisurp 0.513  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-001275 tierB-001773
(And (Past $e0) (Time $e0 $v0) (Time $e1 $v0))

;; p203441  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000248 tierB-000343 tierB-000786
(And (Against $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p203442  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-000867 tierB-001809
(And (Agent $e0 $v0) (During $e0 $e1) (Member $e1 $v1))

;; p203443  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e0 $e1) (Member $e1 $v1))

;; p203444  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e1 $e0) (Member $e1 $v1))

;; p203445  cross  support 3 (occ 7)  size 3  lifted 2  nisurp -0.772  tiers tierB  dominated
;;   e.g. tierB-000371 tierB-001202 tierB-001246
(And (Agent $e0 $v0) (Inheritance $v0 $v1) (Patient $e0 $x0))

;; p203446  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.384  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001675 tierB-001809
(And (Agent $e0 $v0) (Member $v0 $v1) (Patient $e1 $v0))

;; p203447  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.788  tiers tierB  dominated
;;   e.g. tierB-001185 tierB-001538 tierB-001809
(And (Agent $e0 $v0) (Member $v0 $v1) (Result $e0 $e1))

;; p203448  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.586  tiers tierB  dominated
;;   e.g. tierB-000274 tierB-000556 tierB-001530
(And (Agent $e0 $x0) (For $e0 $v0) (GroupOf $x0 $v1))

;; p203449  cross  support 3 (occ 3)  size 3  lifted 2  nisurp -0.242  tiers tierB  dominated
;;   e.g. tierB-000091 tierB-000605 tierB-001133
(And (Agent $e0 $x0) (For $e0 $v0) (Member $x0 $v1))

;; p203450  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.035  tiers tierB  dominated
;;   e.g. tierB-000237 tierB-000830 tierB-001440
(And (Agent $e0 $x0) (Location $e0 $v0) (Member $x0 $v1))

;; p203451  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000340 tierB-001316 tierB-001572
(And (At $e0 $x0) (Member $e0 $v0) (Member $x0 $v1))

;; p203452  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000463 tierB-001314 tierB-001337
(And (But $e0 $e1) (Member $e0 $v0) (Member $e1 $v1))

;; p203453  cross  support 3 (occ 4)  size 3  lifted 2  nisurp -0.685  tiers tierB
;;   e.g. tierB-000379 tierB-000655 tierB-000797
(And (Cardinality $x0 <num>) (GroupOf $x0 $v0) (Inheritance $v0 $v1))

;; p203454  cross  support 3 (occ 3)  size 3  lifted 2  nisurp -0.499  tiers tierB  dominated
;;   e.g. tierB-000842 tierB-000960 tierB-001594
(And (Degree $x0 $v0 $v1) (Experiencer $e0 $x0) (Member $e0 $v0))

;; p203455  cross  support 3 (occ 3)  size 3  lifted 2  nisurp -0.416  tiers tierB  dominated
;;   e.g. tierB-000352 tierB-000775 tierB-001594
(And (Degree $x0 $v0 $v1) (Past $e0) (Patient $e0 $x0))

;; p203456  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-001016 tierB-001523 tierB-001966
(And (Experiencer $e0 $e1) (Member $e0 $v0) (Member $e1 $v1))

;; p203457  cross  support 3 (occ 6)  size 3  lifted 2  nisurp 0.929  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (For $e0 $x0) (Member $v0 $v1))

;; p203458  cross  support 3 (occ 7)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (For $e0 $x0) (Member $x0 $v1))

;; p203459  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.889  tiers tierB  dominated
;;   e.g. tierB-000589 tierB-000836 tierB-001091
(And (Experiencer $e0 $v0) (Location $e0 $x0) (Past (Member $v0 $v1)))

;; p203460  cross  support 3 (occ 10)  size 3  lifted 2  nisurp -0.713  tiers tierB
;;   e.g. tierB-000044 tierB-000188 tierB-001988
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $e1 $v1))

;; p203461  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000086 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Possession $x0 $v0))

;; p203462  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.176  tiers tierB  dominated
;;   e.g. tierB-000114 tierB-000534 tierB-001479
(And (Experiencer $e0 $v0) (Member $e1 $v1) (Theme $e1 $e0))

;; p203463  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000115 tierB-000203 tierB-000759
(And (Experiencer $e0 $v0) (Member $e1 $v1) (To $e1 $e0))

;; p203464  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000086 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (Member $x0 $v1) (Possession $x0 $v0))

;; p203465  cross  support 3 (occ 3)  size 3  lifted 2  nisurp -0.105  tiers tierB  dominated
;;   e.g. tierB-001784 tierB-001851 tierB-001937
(And (Experiencer $e0 $x0) (GroupOf $x0 $v0) (Time $e0 $v1))

;; p203466  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.366  tiers tierB  dominated
;;   e.g. tierB-000227 tierB-000419 tierB-001334
(And (Experiencer $e0 $x0) (Location $e0 $v0) (Member $x0 $v1))

;; p203467  cross  support 3 (occ 3)  size 3  lifted 2  nisurp -0.172  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000419 tierB-000826
(And (Experiencer $e0 $x0) (Manner $e0 $v0) (Member $x0 $v1))

;; p203468  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000831 tierB-001774 tierB-001896
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Possession $x0 $v1))

;; p203469  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000152 tierB-001521 tierB-001625
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Source $e0 $v1))

;; p203470  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-001180 tierB-001330 tierB-001424
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Stimulus $e0 $v1))

;; p203471  cross  support 3 (occ 6)  size 3  lifted 2  nisurp 0.741  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-001627 tierB-001898
(And (For $e0 $x0) (Member $e0 $v1) (Member $v0 $v1))

;; p203472  cross  support 3 (occ 10)  size 3  lifted 2  nisurp -0.906  tiers tierB
;;   e.g. tierB-000012 tierB-000188 tierB-000575
(And (Goal $e0 $v0) (Member $e0 $v1) (Member $e1 $v1))

;; p203473  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.428  tiers tierB  dominated
;;   e.g. tierB-000482 tierB-000588 tierB-001857
(And (Goal $e0 $x0) (Inheritance $v0 $v1) (Member $x0 $v0))

;; p203474  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000111 tierB-000427 tierB-000470
(And (Goal $e0 $x0) (Member $x0 $v0) (Theme $e0 $v1))

;; p203475  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.724  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (Inheritance $x0 $v1))

;; p203476  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.102  tiers tierB
;;   e.g. tierB-000467 tierB-000519 tierB-001628
(And (GroupOf $x0 $v0) (GroupOf $x1 $v0) (LocatedIn $x0 $v1))

;; p203477  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.102  tiers tierB  dominated
;;   e.g. tierB-000162 tierB-000333 tierB-001553
(And (GroupOf $x0 $v0) (Holder $e0 $v1) (Theme $e0 $x0))

;; p203478  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (GroupOf $x0 $v0) (Inheritance $x1 $v1) (SubsetOf $x1 $x0))

;; p203479  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.517  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-001694 tierB-001705
(And (GroupOf $x0 $v0) (Location $e0 $v1) (Patient $e0 $x0))

;; p203480  cross  support 3 (occ 3)  size 3  lifted 2  nisurp -0.243  tiers tierB
;;   e.g. tierB-000980 tierB-001449 tierB-001479
(And (GroupOf $x0 $v0) (Member $e0 $v1) (Stimulus $e0 $x0))

;; p203481  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.118  tiers tierB  dominated
;;   e.g. tierB-000299 tierB-001591 tierB-001864
(And (GroupOf $x0 $v0) (Theme $e0 $x0) (Time $e0 $v1))

;; p203482  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000783 tierB-000816 tierB-001909
(And (In $e0 $e1) (Member $e0 $v0) (Member $e1 $v1))

;; p203483  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000477 tierB-000780 tierB-001243
(And (Inheritance $v0 $v1) (Inheritance $v0 human) (Member $x0 $v0))

;; p203484  cross  support 3 (occ 5)  size 3  lifted 2  nisurp 0.221  tiers tierB  signal conj-pattern
;;   e.g. tierB-000268 tierB-000282 tierB-001098
(And (Inheritance $v0 $v1) (Member $e0 use) (Theme $e0 $v0))

;; p203485  cross  support 3 (occ 5)  size 3  lifted 2  nisurp 0.130  tiers tierB  dominated
;;   e.g. tierB-000330 tierB-000802 tierB-001313
(And (Inheritance $v0 $v1) (Member $x0 $v0) (PartOf $x0 $x1))

;; p203486  cross  support 3 (occ 5)  size 3  lifted 2  nisurp 0.130  tiers tierB  dominated
;;   e.g. tierB-001125 tierB-001586 tierB-001652
(And (Inheritance $v0 $v1) (Member $x0 $v0) (PartOf $x1 $x0))

;; p203487  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.532  tiers tierB  dominated
;;   e.g. tierB-000715 tierB-001046 tierB-001101
(And (Inheritance $v0 $v1) (Recipient $e0 $x0) (Theme $e0 $v0))

;; p203488  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000489 tierB-000707 tierB-001049
(And (LocatedIn $x0 $v0) (Location $e0 $x0) (Member $e0 $v1))

;; p203489  cross  support 3 (occ 3)  size 3  lifted 2  nisurp -0.324  tiers tierB
;;   e.g. tierB-000262 tierB-001491 tierB-001567
(And (LocatedIn $x0 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p203490  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000830 tierB-000910 tierB-001621
(And (Location $e0 $v0) (Member $e1 $v1) (Theme $e1 $e0))

;; p203491  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.619  tiers tierB  dominated
;;   e.g. tierB-000589 tierB-000836 tierB-001091
(And (Location $e0 $x0) (Member $e0 $v0) (Past (Member $v1 $v0)))

;; p203492  cross  support 3 (occ 5)  size 3  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000251 tierB-000828 tierB-000903
(And (Member $e0 $v0) (Member $x0 $v1) (Time $e0 $x0))

;; p203493  cross  support 3 (occ 6)  size 3  lifted 2  nisurp 0.300  tiers tierB
;;   e.g. tierB-000209 tierB-000465 tierB-000970
(And (Member $e0 $v0) (Patient $e0 $v1) (Patient $e1 $v1))

;; p203494  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000404 tierB-001431
(And (Member $e0 $v0) (Patient $e1 $v1) (To $e0 $e1))

;; p203495  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000171 tierB-000229 tierB-000282
(And (Member $e0 $v0) (Theme $e1 $v1) (To $e0 $e1))

;; p203496  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.764  tiers tierB  signal conj-pattern
;;   e.g. tierB-000404 tierB-000908 tierB-001314
(And (Member $e0 use) (Member $v0 $v1) (Theme $e0 $v0))

;; p203497  cross  support 3 (occ 3)  size 3  lifted 2  nisurp 0.579  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Member $v0 $v1) (Ongoing $e0) (Patient $e0 $v0))

;; p203498  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000955 tierB-001287
(And (Member $x0 $v0) (Patient $e0 $v1) (Source $e0 $x0))

;; p203499  cross  support 3 (occ 4)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000438 tierB-000485 tierB-001386
(And (Member $x0 $v0) (Source $e0 $x0) (Theme $e0 $v1))

;; p203500  cross  support 3 (occ 6)  size 3  lifted 3  nisurp -0.610  tiers tierB  dominated
;;   e.g. tierB-000371 tierB-001246 tierB-001912
(And (Agent $e0 $v0) (Inheritance $v0 $v1) (Inheritance $v0 $v2))

;; p203501  cross  support 3 (occ 3)  size 3  lifted 3  nisurp 0.912  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Patient $e1 $v0))

;; p203502  cross  support 3 (occ 3)  size 3  lifted 3  nisurp 0.938  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Experiencer $e0 $v0) (Result $e1 $e0))

;; p203503  cross  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $e0 $v1) (Patient $e1 $v0))

;; p203504  cross  support 3 (occ 3)  size 3  lifted 3  nisurp 0.828  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $e0 $v1) (Result $e1 $e0))

;; p203505  cross  support 3 (occ 3)  size 3  lifted 3  nisurp 0.847  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $v0 $v1) (Patient $e0 $v0))

;; p203506  cross  support 3 (occ 3)  size 3  lifted 3  nisurp 0.943  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Patient $e0 $v0) (Result $e0 $e1))

;; p203507  cross  support 3 (occ 4)  size 3  lifted 3  nisurp 0.291  tiers tierB
;;   e.g. tierB-000263 tierB-000546 tierB-001546
(And (Degree $x0 $v0 $v1) (LocatedIn $x0 $x1) (Member $x1 $v2))

;; p203508  cross  support 3 (occ 3)  size 3  lifted 3  nisurp -0.379  tiers tierB  dominated
;;   e.g. tierB-000842 tierB-000960 tierB-001594
(And (Degree $x0 $v0 $v1) (Member $e0 $v0) (Member $x0 $v2))

;; p203509  cross  support 3 (occ 3)  size 3  lifted 3  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-001103 tierB-001847
(And (Degree $x0 $v0 $v1) (Member $e0 $v2) (Theme $e0 $x0))

;; p203510  cross  support 3 (occ 3)  size 3  lifted 3  nisurp -0.325  tiers tierB  dominated
;;   e.g. tierB-000008 tierB-001500 tierB-001847
(And (Degree $x0 $v0 very) (Inheritance $v1 $v2) (Member $x0 $v1))

;; p203511  cross  support 3 (occ 5)  size 3  lifted 3  nisurp 0.065  tiers tierB
;;   e.g. tierB-001164 tierB-001378 tierB-001754
(And (For $e0 $v0) (Inheritance $v0 $v1) (Member $e0 $v2))

;; p203512  cross  support 3 (occ 3)  size 3  lifted 3  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (GroupOf $x0 $v0) (Inheritance $x1 $v1) (ProportionOf $x1 $x0 $v2))

;; p203513  cross  support 3 (occ 5)  size 3  lifted 3  nisurp 0.273  tiers tierB
;;   e.g. tierB-001774 tierB-001800 tierB-001846
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Possession $x0 $v0))

;; p203514  cross  support 3 (occ 4)  size 3  lifted 3  nisurp -0.137  tiers tierB
;;   e.g. tierB-001049 tierB-001567 tierB-001707
(And (Inheritance $v0 $v1) (LocatedIn $x0 $v2) (Member $x0 $v0))

;; p203515  cross  support 3 (occ 6)  size 3  lifted 3  nisurp 0.532  tiers tierB  dominated
;;   e.g. tierB-000268 tierB-000915 tierB-001629
(And (Inheritance $v0 $v1) (Manner $e0 $v2) (Theme $e0 $v0))

;; p203516  cross  support 3 (occ 4)  size 3  lifted 3  nisurp 0.143  tiers tierB
;;   e.g. tierB-000603 tierB-000816 tierB-001909
(And (Inheritance $v0 $v1) (Member $e0 $v2) (Stimulus $e0 $v0))

;; p203517  cross  support 3 (occ 4)  size 3  lifted 3  nisurp 0.901  tiers tierB  dominated
;;   e.g. tierB-000373 tierB-000970 tierB-001691
(And (Location $e0 $v0) (Member $v1 $v2) (Patient $e0 $v1))

;; p203518  cross  support 3 (occ 3)  size 3  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000004 tierB-000690 tierB-001381
(And (Measure $e0 $v0 <num> $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p203519  cross  support 3 (occ 3)  size 3  lifted 3  nisurp -0.434  tiers tierB  dominated
;;   e.g. tierB-001504 tierB-001627 tierB-001898
(And (Member $e0 $v1) (Member $v0 $v1) (Member $v0 $v2))

;; p203520  cross  support 3 (occ 3)  size 3  lifted 3  nisurp 0.835  tiers tierB  dominated
;;   e.g. tierB-000187 tierB-001020 tierB-001728
(And (Member $v0 $v1) (Member $v2 $v1) (PartOf $v0 $x0))

;; p203521  cross  support 3 (occ 3)  size 3  lifted 3  nisurp 0.835  tiers tierB  dominated
;;   e.g. tierB-000187 tierB-001020 tierB-001728
(And (Member $v0 $v1) (Member $v2 $v1) (PartOf $v2 $x0))

;; p203522  cross  support 3 (occ 6)  size 3  lifted 3  nisurp 0.906  tiers tierB  dominated
;;   e.g. tierB-000187 tierB-001020 tierB-001728
(And (Member $v0 $v1) (PartOf $v0 $x0) (PartOf $v2 $x0))

;; p203523  cross  support 3 (occ 8)  size 3  lifted 3  nisurp 0.286  tiers tierB
;;   e.g. tierB-000269 tierB-001454 tierB-001890
(And (Member $x0 $v0) (Member $x1 $v1) (More $v2 $x0 $x1))

;; p203524  cross  support 3 (occ 3)  size 3  lifted 4  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Member $e0 $v3) (Patient $e0 $v0))

;; p203525  cross  support 3 (occ 3)  size 2  lifted 0  nisurp 0.999  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(And (Agent $e0 mark) (Agent $e1 mark))

;; p203526  cross  support 3 (occ 3)  size 2  lifted 0  nisurp 0.846  tiers tierB  signal conj-pattern
;;   e.g. tierB-000196 tierB-000467 tierB-001618
(And (GroupOf $x0 person) (GroupOf $x1 person))

;; p203527  cross  support 3 (occ 3)  size 2  lifted 0  nisurp 0.999  tiers tierB  signal conj-pattern
;;   e.g. tierB-001573 tierB-001670 tierB-001938
(And (Inheritance living_room room) (Member $x0 living_room))

;; p203528  cross  support 3 (occ 3)  size 2  lifted 1  nisurp 0.713  tiers tierB  dominated
;;   e.g. tierB-000086 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (Possession $x0 $v0))

;; p203529  cross  support 3 (occ 3)  size 2  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000477 tierB-000780 tierB-001243
(And (Inheritance $v0 human) (Member $x0 $v0))

;; p203530  cross  support 3 (occ 3)  size 2  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000932 tierB-001325 tierB-001354
(And (Inheritance $v0 machine) (Member $x0 $v0))

;; p203531  cross  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal conj-pattern
;;   e.g. tierB-000438 tierB-000654 tierB-001549
(And (Inheritance $v0 movement) (Member $x0 $v0))

;; p203532  cross  support 3 (occ 3)  size 2  lifted 1  nisurp 0.172  tiers tierB  signal conj-pattern
;;   e.g. tierB-000581 tierB-000636 tierB-001990
(And (Inheritance $v0 ship) (Member $x0 $v0))

;; p203533  cross  support 3 (occ 3)  size 2  lifted 1  nisurp 0.999  tiers tierB  dominated
;;   e.g. tierB-001573 tierB-001670 tierB-001938
(And (Inheritance living_room $v0) (Member $x0 living_room))

;; p203534  cross  support 3 (occ 3)  size 2  lifted 1  nisurp 0.300  tiers tierB  dominated
;;   e.g. tierB-000209 tierB-000465 tierB-000970
(And (Patient $e0 $v0) (Patient $e1 $v0))

;; p203535  cross  support 3 (occ 3)  size 2  lifted 2  nisurp 10.949  tiers tierB  dominated
;;   e.g. tierB-000842 tierB-000960 tierB-001594
(And (Degree $x0 $v0 $v1) (Member $e0 $v0))

;; p203536  cross  support 3 (occ 5)  size 2  lifted 2  nisurp 0.065  tiers tierB  dominated
;;   e.g. tierB-001164 tierB-001378 tierB-001754
(And (For $e0 $v0) (Inheritance $v0 $v1))

;; p203537  cross  support 3 (occ 3)  size 2  lifted 2  nisurp 93.396  tiers tierB
;;   e.g. tierB-000269 tierB-000388 tierB-000831
(And (Inheritance $v0 $v1) (Member $x0 $v1))

;; p203538  cross  support 3 (occ 7)  size 2  lifted 2  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-001774 tierB-001800 tierB-001846
(And (Inheritance $v0 $v1) (Possession $x0 $v0))

;; p203539  cross  support 3 (occ 4)  size 2  lifted 2  nisurp 0.143  tiers tierB  dominated
;;   e.g. tierB-000603 tierB-000816 tierB-001909
(And (Inheritance $v0 $v1) (Stimulus $e0 $v0))

;; p203540  cross  support 3 (occ 5)  size 2  lifted 2  nisurp 0.316  tiers tierB
;;   e.g. tierB-000519 tierB-001042 tierB-001550
(And (LocatedIn $x0 $v0) (Member $v0 $v1))

;; p203541  cross  support 3 (occ 4)  size 2  lifted 2  nisurp 0.988  tiers tierB
;;   e.g. tierB-000994 tierB-001549 tierB-001850
(And (Past (Member $v0 $v1)) (Past (Possession $v0 $x0)))

;; p203542  cross  support 3 (occ 3)  size 2  lifted 3  nisurp 0.694  tiers tierB  dominated
;;   e.g. tierB-000206 tierB-000325 tierB-001079
(And (Degree $v0 $v1 $v2) (Patient $e0 $v0))

;; p203543  kindlevel  support 3 (occ 3)  size 4  lifted 5  nisurp 0.610  tiers tierB
;;   e.g. tierB-000843 tierB-001472 tierB-001846
(And (Degree $v0 $v1 $v2) (Inheritance $v0 $v1) (Inheritance $v0 $v3) (Inheritance $v0 $v4))

;; p203544  kindlevel  support 3 (occ 3)  size 4  lifted 5  nisurp -0.766  tiers tierB
;;   e.g. tierB-000454 tierB-000627 tierB-001605
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Inheritance $v3 $v1) (Inheritance $v3 $v4))

;; p203545  kindlevel  support 3 (occ 3)  size 4  lifted 5  nisurp 0.304  tiers tierB
;;   e.g. tierB-000467 tierB-001564 tierB-001999
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Inheritance $v3 $v4) (Patient $v3 $v0))

;; p203546  kindlevel  support 3 (occ 5)  size 3  lifted 4  nisurp 0.336  tiers tierB
;;   e.g. tierB-000276 tierB-000432 tierB-001608
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Inheritance $v0 (can $v3)))

;; p203547  kindlevel  support 3 (occ 3)  size 3  lifted 4  nisurp 0.169  tiers tierB  dominated
;;   e.g. tierB-000454 tierB-000627 tierB-001605
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Inheritance $v3 $v1))

;; p203548  kindlevel  support 3 (occ 3)  size 3  lifted 4  nisurp -0.599  tiers tierB
;;   e.g. tierB-000540 tierB-000553 tierB-001592
(And (Inheritance $v0 $v1) (Inheritance $v0 $v2) (Patient $v0 $v3))

;; p203549  kindlevel  support 3 (occ 5)  size 3  lifted 4  nisurp 0.610  tiers tierB
;;   e.g. tierB-000431 tierB-000432 tierB-001876
(And (Inheritance $v0 $v1) (Inheritance $v0 (can $v2)) (Member $v3 $v0))

;; p203550  kindlevel  support 3 (occ 3)  size 3  lifted 4  nisurp 0.169  tiers tierB
;;   e.g. tierB-000039 tierB-001656 tierB-001858
(And (Inheritance $v0 $v1) (Inheritance $v2 $v1) (Inheritance $v3 $v1))

;; p203551  kindlevel  support 3 (occ 6)  size 3  lifted 4  nisurp -0.688  tiers tierB  dominated
;;   e.g. tierB-000467 tierB-001564 tierB-001999
(And (Inheritance $v0 $v1) (Inheritance $v2 $v3) (Patient $v2 $v0))

;; p203552  kindlevel  support 3 (occ 3)  size 3  lifted 4  nisurp 0.376  tiers tierB
;;   e.g. tierB-000110 tierB-000800 tierB-001131
(And (Inheritance $v0 $v1) (Member $v2 $v0) (Most $v3 $v2 $v0))

;; p203553  kindlevel  support 3 (occ 3)  size 3  lifted 4  nisurp 0.245  tiers tierB
;;   e.g. tierB-000822 tierB-000874 tierB-001527
(And (Member $v0 $v1) (Member $v0 $v2) (Member $v0 $v3))

;; p203554  kindlevel  support 3 (occ 3)  size 3  lifted 5  nisurp 0.610  tiers tierB
;;   e.g. tierB-001414 tierB-001506 tierB-001842
(And (ConditionalProperty $v0 $v1 $v2) (Inheritance $v2 $v3) (Inheritance $v2 $v4))

;; p203555  kindlevel  support 3 (occ 3)  size 3  lifted 5  nisurp 0.115  tiers tierB  dominated
;;   e.g. tierB-000843 tierB-001472 tierB-001846
(And (Degree $v0 $v1 $v2) (Inheritance $v0 $v3) (Inheritance $v0 $v4))

;; p203556  kindlevel  support 3 (occ 3)  size 2  lifted 2  nisurp 0.906  tiers tierB
;;   e.g. tierB-000072 tierB-000711 tierB-001672
(And (Degree $v0 $v1 really) (Member $v0 $v1))

;; p203557  kindlevel  support 3 (occ 4)  size 2  lifted 2  nisurp 0.766  tiers tierB
;;   e.g. tierB-000215 tierB-000268 tierB-000442
(And (Inheritance $v0 $v1) (Inheritance $v0 algerian))

;; p203558  kindlevel  support 3 (occ 4)  size 2  lifted 2  nisurp 0.766  tiers tierB
;;   e.g. tierB-000068 tierB-000380 tierB-000428
(And (Inheritance $v0 $v1) (Inheritance $v0 big))

;; p203559  kindlevel  support 3 (occ 3)  size 2  lifted 2  nisurp 0.766  tiers tierB
;;   e.g. tierB-000177 tierB-000636 tierB-001748
(And (Inheritance $v0 $v1) (Inheritance $v0 british))

;; p203560  kindlevel  support 3 (occ 4)  size 2  lifted 2  nisurp 0.766  tiers tierB
;;   e.g. tierB-000386 tierB-000493 tierB-001865
(And (Inheritance $v0 $v1) (Inheritance $v0 easy))

;; p203561  kindlevel  support 3 (occ 3)  size 2  lifted 2  nisurp 0.766  tiers tierB
;;   e.g. tierB-000686 tierB-000804 tierB-001109
(And (Inheritance $v0 $v1) (Inheritance $v0 full))

;; p203562  kindlevel  support 3 (occ 3)  size 2  lifted 2  nisurp 0.688  tiers tierB
;;   e.g. tierB-000195 tierB-000999 tierB-001514
(And (Inheritance $v0 $v1) (Inheritance $v0 good))

;; p203563  kindlevel  support 3 (occ 3)  size 2  lifted 2  nisurp 0.766  tiers tierB
;;   e.g. tierB-001098 tierB-001414 tierB-001800
(And (Inheritance $v0 $v1) (Inheritance $v0 group))

;; p203564  kindlevel  support 3 (occ 3)  size 2  lifted 2  nisurp 0.688  tiers tierB
;;   e.g. tierB-000467 tierB-001370 tierB-001980
(And (Inheritance $v0 $v1) (Inheritance $v0 language))

;; p203565  kindlevel  support 3 (occ 4)  size 2  lifted 2  nisurp 0.766  tiers tierB
;;   e.g. tierB-000151 tierB-000309 tierB-000442
(And (Inheritance $v0 $v1) (Inheritance $v0 party))

;; p203566  kindlevel  support 3 (occ 4)  size 2  lifted 2  nisurp 0.688  tiers tierB
;;   e.g. tierB-000632 tierB-001524 tierB-001629
(And (Inheritance $v0 $v1) (Inheritance $v0 person))

;; p203567  kindlevel  support 3 (occ 3)  size 2  lifted 2  nisurp 0.766  tiers tierB
;;   e.g. tierB-000318 tierB-001125 tierB-001405
(And (Inheritance $v0 $v1) (Inheritance $v0 place))

;; p203568  kindlevel  support 3 (occ 4)  size 2  lifted 2  nisurp 0.688  tiers tierB
;;   e.g. tierB-000581 tierB-000636 tierB-001164
(And (Inheritance $v0 $v1) (Inheritance $v0 ship))

;; p203569  kindlevel  support 3 (occ 3)  size 2  lifted 2  nisurp 0.766  tiers tierB
;;   e.g. tierB-000038 tierB-000314 tierB-001714
(And (Inheritance $v0 $v1) (Patient $v0 person))

;; p203570  kindlevel  support 3 (occ 3)  size 2  lifted 2  nisurp 0.989  tiers tierB
;;   e.g. tierB-000161 tierB-001592 tierB-001608
(And (Inheritance $v0 have) (Patient $v0 $v1))

;; p203571  kindlevel  support 3 (occ 3)  size 2  lifted 2  nisurp 0.906  tiers tierB
;;   e.g. tierB-001368 tierB-001481 tierB-001627
(And (Member $v0 $v1) (Member $v0 language))

;; p203572  kindlevel  support 3 (occ 3)  size 2  lifted 3  nisurp 0.143  tiers tierB
;;   e.g. tierB-000614 tierB-000638 tierB-001456
(And (Inheritance $v0 $v1) (Most $v2 $v0 $v1))

;; p203573  kindlevel  support 3 (occ 4)  size 2  lifted 4  nisurp 0.610  tiers tierB
;;   e.g. tierB-000161 tierB-001057 tierB-001592
(And (ConditionalProperty $v0 (can $v1) $v2) (Inheritance $v1 $v3))

;; p203574  kindlevel  support 3 (occ 3)  size 2  lifted 4  nisurp 0.143  tiers tierB  dominated
;;   e.g. tierB-000110 tierB-000800 tierB-001131
(And (Inheritance $v0 $v1) (Most $v2 $v3 $v0))

;; p203575  kindlevel  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000059 tierB-001735 tierB-001833
(Inheritance dung_beetle beetle)

;; p203576  kindlevel  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-001573 tierB-001670 tierB-001938
(Inheritance living_room room)

;; p203577  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000215 tierB-000268 tierB-000442
(Inheritance $v0 algerian)

;; p203578  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000607 tierB-000969 tierB-001357
(Inheritance $v0 american)

;; p203579  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000125 tierB-001313 tierB-001842
(Inheritance $v0 area)

;; p203580  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000249 tierB-001148 tierB-001620
(Inheritance $v0 bar)

;; p203581  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000059 tierB-001735 tierB-001833
(Inheritance $v0 beetle)

;; p203582  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000068 tierB-000380 tierB-000428
(Inheritance $v0 big)

;; p203583  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000068 tierB-000217 tierB-001088
(Inheritance $v0 bird)

;; p203584  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000177 tierB-000636 tierB-001748
(Inheritance $v0 british)

;; p203585  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000060 tierB-000197 tierB-001120
(Inheritance $v0 car)

;; p203586  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-001810 tierB-001852 tierB-001858
(Inheritance $v0 crime)

;; p203587  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000386 tierB-000493 tierB-001865
(Inheritance $v0 easy)

;; p203588  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-001402 tierB-001434 tierB-001846
(Inheritance $v0 fruit)

;; p203589  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000686 tierB-000804 tierB-001109
(Inheritance $v0 full)

;; p203590  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-001098 tierB-001414 tierB-001800
(Inheritance $v0 group)

;; p203591  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000161 tierB-001592 tierB-001608
(Inheritance $v0 have)

;; p203592  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000438 tierB-000654 tierB-001549
(Inheritance $v0 movement)

;; p203593  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000388 tierB-000607 tierB-001979
(Inheritance $v0 number)

;; p203594  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000151 tierB-000309 tierB-000442
(Inheritance $v0 party)

;; p203595  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000318 tierB-001125 tierB-001405
(Inheritance $v0 place)

;; p203596  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000550 tierB-000612 tierB-001665
(Inheritance $v0 problem)

;; p203597  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000179 tierB-000329 tierB-001992
(Inheritance $v0 train)

;; p203598  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000059 tierB-001735 tierB-001833
(Inheritance dung_beetle $v0)

;; p203599  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-001573 tierB-001670 tierB-001938
(Inheritance living_room $v0)

;; p203600  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000140 tierB-001328 tierB-001730
(Member $v0 city)

;; p203601  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000480 tierB-001191 tierB-001516
(Member $v0 girl)

;; p203602  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-000273 tierB-000836 tierB-001828
(Member $v0 person)

;; p203603  kindlevel  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000038 tierB-000314 tierB-001714
(Patient $v0 person)

;; p203604  kindlevel  support 3 (occ 3)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000071 tierB-001343 tierB-001615
(For $v0 $v1)

;; p203605  kindlevel  support 3 (occ 3)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000071 tierB-001109 tierB-001744
(Of $v0 $v1)

;; p203606  kindlevel  support 3 (occ 3)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000046 tierB-001581 tierB-001645
(PartOf $v0 $v1)

;; p203607  kindlevel  support 3 (occ 4)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000430 tierB-000591 tierB-001407
(With $v0 $v1)

;; p203608  star  support 3 (occ 3)  size 4  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000387 tierB-001534 tierB-001963
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come) (Past $e0))

;; p203609  star  support 3 (occ 3)  size 4  lifted 0  nisurp 0.621  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))

;; p203610  star  support 3 (occ 3)  size 4  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000852 tierB-001342 tierB-001990
(And (Agent $e0 $x0) (Member $e0 capture) (Past $e0) (Theme $e0 $x1))

;; p203611  star  support 3 (occ 3)  size 4  lifted 0  nisurp -0.140  tiers tierB
;;   e.g. tierB-001068 tierB-001120 tierB-001961
(And (Agent $e0 $x0) (Ongoing $e0) (Past $e0) (Theme $e0 $x1))

;; p203612  star  support 3 (occ 5)  size 4  lifted 0  nisurp 0.416  tiers tierB
;;   e.g. tierB-001041 tierB-001078 tierB-001753
(And (Experiencer $e0 $x0) (Location $e0 $x1) (Ongoing $e0) (Past $e0))

;; p203613  star  support 3 (occ 4)  size 4  lifted 0  nisurp 0.817  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 get) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p203614  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000148 tierB-000805 tierB-000951
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $e0 walk) (Past $e0))

;; p203615  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.406  tiers tierB
;;   e.g. tierB-000008 tierB-000148 tierB-000805
(And (Agent $e0 $v0) (Location $e0 $x0) (Ongoing $e0) (Past $e0))

;; p203616  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.288  tiers tierB
;;   e.g. tierB-000047 tierB-000704 tierB-000962
(And (Agent $e0 $v0) (Location $e0 $x0) (Past $e0) (Theme $e0 $x1))

;; p203617  star  support 3 (occ 4)  size 4  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Member $e0 begin) (Past $e0) (Theme $e0 $e1))

;; p203618  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000400 tierB-000547
(And (Agent $e0 $v0) (Member $e0 try) (Past $e0) (Theme $e0 $e1))

;; p203619  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000148 tierB-000805 tierB-000929
(And (Agent $e0 $v0) (Member $e0 walk) (Ongoing $e0) (Past $e0))

;; p203620  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001185 tierB-001809
(And (Agent $e0 $v0) (Ongoing $e0) (Past $e0) (Result $e0 $e1))

;; p203621  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.477  tiers tierB
;;   e.g. tierB-000392 tierB-000425 tierB-001594
(And (Agent $e0 $v0) (Past $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p203622  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000453 tierB-001266 tierB-001626
(And (Agent $e0 $x0) (Future $e0) (Member $e0 $v0) (Theme $e0 $x1))

;; p203623  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.270  tiers tierB  dominated
;;   e.g. tierB-000462 tierB-001132 tierB-001860
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 $v0) (Theme $e0 $x2))

;; p203624  star  support 3 (occ 4)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(And (Agent $e0 $x0) (Goal $e0 home) (Member $e0 $v0) (Past $e0))

;; p203625  star  support 3 (occ 3)  size 4  lifted 1  nisurp -0.232  tiers tierB  dominated
;;   e.g. tierB-000291 tierB-000942 tierB-001649
(And (Agent $e0 $x0) (Location $e0 $x1) (Member $e0 $v0) (Patient $e0 $x2))

;; p203626  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.416  tiers tierB
;;   e.g. tierB-000426 tierB-000801 tierB-001983
(And (Agent $e0 $x0) (Manner $e0 $v0) (Ongoing $e0) (Past $e0))

;; p203627  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(And (Agent $e0 $x0) (Member $e0 $v0) (Over $e0 $x1) (Past $e0))

;; p203628  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.415  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Member $e0 $v0) (Past $e0) (To $e0 $e1))

;; p203629  star  support 3 (occ 3)  size 4  lifted 1  nisurp -0.192  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Member $e0 $v0) (Patient $e0 $x1) (Result $e0 $e1))

;; p203630  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.087  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Member $e0 $v0) (Patient $e0 $x1) (Theme $e1 $e0))

;; p203631  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000676 tierB-001299 tierB-001604
(And (Experiencer $e0 $v0) (Member $e0 stand) (Ongoing $e0) (Past $e0))

;; p203632  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001563 tierB-001579 tierB-001902
(And (Goal $e0 $x0) (Manner $e0 quickly) (Member $e0 $v0) (Past $e0))

;; p203633  star  support 3 (occ 3)  size 4  lifted 1  nisurp -0.141  tiers tierB  dominated
;;   e.g. tierB-000217 tierB-000942 tierB-001893
(And (Location $e0 $x0) (Member $e0 $v0) (Ongoing $e0) (Patient $e0 $x1))

;; p203634  star  support 3 (occ 3)  size 4  lifted 1  nisurp -0.473  tiers tierB  dominated
;;   e.g. tierB-001110 tierB-001359 tierB-001765
(And (Member $e0 $v0) (Ongoing $e0) (Past $e0) (Patient $e0 $x0))

;; p203635  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.319  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001185 tierB-001809
(And (Member $e0 $v0) (Ongoing $e0) (Past $e0) (Result $e0 $e1))

;; p203636  star  support 3 (occ 4)  size 4  lifted 1  nisurp 0.455  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 $v0) (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p203637  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.876  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Member $e0 make) (Ongoing $e0) (Patient $e0 $v0) (Result $e0 $e1))

;; p203638  star  support 3 (occ 3)  size 4  lifted 1  nisurp 0.514  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000325 tierB-001504 tierB-001809
(And (Member $e0 make) (Past $e0) (Patient $e0 $v0) (Result $e0 $e1))

;; p203639  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000025 tierB-001047 tierB-001246
(And (Agent $e0 $v0) (Can $e0) (Member $e0 $v1) (Patient $e0 $x0))

;; p203640  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e0 $e1) (Member $e0 $v1) (Past $e0))

;; p203641  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.037  tiers tierB  dominated
;;   e.g. tierB-000047 tierB-000704 tierB-000962
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $e0 $v1) (Theme $e0 $x1))

;; p203642  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.382  tiers tierB
;;   e.g. tierB-000147 tierB-001143 tierB-001145
(And (Agent $e0 $v0) (Member $e0 $v1) (Obligated $e0) (Past $e0))

;; p203643  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001185 tierB-001809
(And (Agent $e0 $v0) (Member $e0 $v1) (Ongoing $e0) (Result $e0 $e1))

;; p203644  star  support 3 (occ 3)  size 4  lifted 2  nisurp -0.382  tiers tierB  dominated
;;   e.g. tierB-001221 tierB-001355 tierB-001637
(And (Agent $e0 $v0) (Member $e0 $v1) (Ongoing $e0) (Theme $e0 $x0))

;; p203645  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.263  tiers tierB  dominated
;;   e.g. tierB-000138 tierB-001325 tierB-001612
(And (Agent $e0 $v0) (Member $e0 $v1) (Past $e0) (Source $e0 $x0))

;; p203646  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000325 tierB-000539 tierB-001504
(And (Agent $e0 $v0) (Member $e0 make) (Past $e0) (Patient $e0 $v1))

;; p203647  star  support 3 (occ 5)  size 4  lifted 2  nisurp -0.797  tiers tierB
;;   e.g. tierB-000101 tierB-000782 tierB-001008
(And (Agent $e0 $x0) (Agent $e1 $x0) (GroupOf $x0 $v0) (Member $x0 $v1))

;; p203648  star  support 3 (occ 5)  size 4  lifted 2  nisurp 0.355  tiers tierB  dominated
;;   e.g. tierB-001169 tierB-001773 tierB-001873
(And (Agent $e0 $x0) (Agent $e1 $x0) (Member $x0 $v0) (Member $x0 $v1))

;; p203649  star  support 3 (occ 4)  size 4  lifted 2  nisurp 0.025  tiers tierB  dominated
;;   e.g. tierB-000688 tierB-000783 tierB-001782
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Member $x0 $v0) (Past (Member $x0 $v1)))

;; p203650  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-001440 tierB-001726
(And (Agent $e0 $x0) (Future $e0) (Member $e0 $v0) (Time $e0 $v1))

;; p203651  star  support 3 (occ 4)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-000485 tierB-000622
(And (Agent $e0 $x0) (Member $e0 $v0) (Theme $e0 $v1) (Theme $e1 $e0))

;; p203652  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.232  tiers tierB  dominated
;;   e.g. tierB-000676 tierB-001299 tierB-001604
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Ongoing $e0) (Past $e0))

;; p203653  star  support 3 (occ 7)  size 4  lifted 2  nisurp -0.715  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-000832
(And (Experiencer $e0 $x0) (Experiencer $e1 $x0) (Member $x0 $v0) (Member $x0 $v1))

;; p203654  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.469  tiers tierB
;;   e.g. tierB-000111 tierB-000427 tierB-001728
(And (Goal $e0 $x0) (Member $e0 $v0) (Past $e0) (Theme $e0 $v1))

;; p203655  star  support 3 (occ 5)  size 4  lifted 2  nisurp 0.167  tiers tierB  dominated
;;   e.g. tierB-000292 tierB-000706 tierB-001275
(And (Location $e0 $x0) (Member $e0 $v0) (Past $e0) (Theme $e0 $v1))

;; p203656  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000398 tierB-000866 tierB-001300
(And (Manner $e0 $v0) (Member $e0 $v1) (Obligated $e0) (Theme $e0 $x0))

;; p203657  star  support 3 (occ 3)  size 4  lifted 2  nisurp -0.167  tiers tierB
;;   e.g. tierB-000325 tierB-000456 tierB-001809
(And (Member $e0 $v0) (Ongoing $e0) (Past $e0) (Patient $e0 $v1))

;; p203658  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Member $e0 $v0) (Ongoing $e0) (Patient $e0 $v1) (Result $e0 $e1))

;; p203659  star  support 3 (occ 3)  size 4  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000955 tierB-001287
(And (Member $e0 $v0) (Past $e0) (Patient $e0 $v1) (Source $e0 $x0))

;; p203660  star  support 3 (occ 4)  size 4  lifted 2  nisurp 0.416  tiers tierB
;;   e.g. tierB-000769 tierB-001046 tierB-001101
(And (Member $e0 $v0) (Past $e0) (Recipient $e0 $x0) (Theme $e0 $v1))

;; p203661  star  support 3 (occ 3)  size 4  lifted 3  nisurp 0.306  tiers tierB
;;   e.g. tierB-000013 tierB-000026 tierB-000173
(And (Agent $e0 $v0) (Member $e0 $v1) (Ongoing $e0) (Theme $e0 $v2))

;; p203662  star  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-001544
(And (Agent $e0 $v0) (Member $e0 $v1) (Theme $e0 $v2) (Theme $e1 $e0))

;; p203663  star  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000688 tierB-001496 tierB-001743
(And (Agent $e0 $x0) (Goal $e0 $v0) (Manner $e0 $v1) (Member $e0 $v2))

;; p203664  star  support 3 (occ 3)  size 4  lifted 3  nisurp -0.155  tiers tierB
;;   e.g. tierB-000261 tierB-000842 tierB-001594
(And (Degree $x0 $v0 $v1) (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x0 $v2))

;; p203665  star  support 3 (occ 3)  size 4  lifted 3  nisurp -0.829  tiers tierB
;;   e.g. tierB-000089 tierB-001103 tierB-001847
(And (Degree $x0 $v0 $v1) (Member $x0 $v0) (Member $x0 $v2) (Theme $e0 $x0))

;; p203666  star  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000079 tierB-000603 tierB-001815
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Past $e0) (Stimulus $e0 $v2))

;; p203667  star  support 3 (occ 5)  size 4  lifted 3  nisurp -0.449  tiers tierB  dominated
;;   e.g. tierB-000596 tierB-000786 tierB-001573
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p203668  star  support 3 (occ 4)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000012 tierB-000688 tierB-001743
(And (Goal $e0 $v0) (Manner $e0 $v1) (Member $e0 $v2) (Past $e0))

;; p203669  star  support 3 (occ 3)  size 4  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000029 tierB-000427 tierB-000554
(And (Goal $e0 $v0) (Member $e0 $v1) (Past $e0) (Theme $e0 $v2))

;; p203670  star  support 3 (occ 3)  size 4  lifted 3  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (GroupOf $x0 $v0) (Inheritance $x0 $v1) (ProportionOf $x0 $x1 $v2) (SubsetOf $x0 $x1))

;; p203671  star  support 3 (occ 3)  size 4  lifted 3  nisurp -0.665  tiers tierB
;;   e.g. tierB-000931 tierB-001120 tierB-001797
(And (GroupOf $x0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Theme $e0 $x0))

;; p203672  star  support 3 (occ 3)  size 4  lifted 3  nisurp 0.355  tiers tierB
;;   e.g. tierB-000238 tierB-000389 tierB-001217
(And (Manner $e0 $v0) (Member $e0 $v1) (Past $e0) (Time $e0 $v2))

;; p203673  star  support 3 (occ 5)  size 4  lifted 3  nisurp 0.469  tiers tierB
;;   e.g. tierB-000311 tierB-000354 tierB-001275
(And (Member $e0 $v0) (Past $e0) (Theme $e0 $v1) (Time $e0 $v2))

;; p203674  star  support 3 (occ 3)  size 4  lifted 3  nisurp 0.141  tiers tierB
;;   e.g. tierB-001476 tierB-001573 tierB-001995
(And (Member $x0 $v0) (Member $x0 $v1) (Member $x0 $v2) (Patient $e0 $x0))

;; p203675  star  support 3 (occ 3)  size 4  lifted 4  nisurp 0.473  tiers tierB
;;   e.g. tierB-000212 tierB-000389 tierB-000883
(And (Agent $e0 $v0) (Manner $e0 $v1) (Member $e0 $v2) (Time $e0 $v3))

;; p203676  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.513  tiers tierB  dominated
;;   e.g. tierB-000453 tierB-001266 tierB-001626
(And (Agent $e0 $x0) (Future $e0) (Theme $e0 $x1))

;; p203677  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000387 tierB-001534 tierB-001963
(And (Agent $e0 $x0) (Goal $e0 $x1) (Member $e0 come))

;; p203678  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.270  tiers tierB  dominated
;;   e.g. tierB-000462 tierB-001132 tierB-001860
(And (Agent $e0 $x0) (Goal $e0 $x1) (Theme $e0 $x2))

;; p203679  star  support 3 (occ 4)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(And (Agent $e0 $x0) (Goal $e0 home) (Past $e0))

;; p203680  star  support 3 (occ 3)  size 3  lifted 0  nisurp -0.232  tiers tierB  dominated
;;   e.g. tierB-000291 tierB-000942 tierB-001649
(And (Agent $e0 $x0) (Location $e0 $x1) (Patient $e0 $x2))

;; p203681  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.567  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Member $e0 begin) (Past $e0))

;; p203682  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.621  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Member $e0 begin) (Theme $e0 $e1))

;; p203683  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.675  tiers tierB  dominated
;;   e.g. tierB-000852 tierB-001342 tierB-001990
(And (Agent $e0 $x0) (Member $e0 capture) (Past $e0))

;; p203684  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.729  tiers tierB  dominated
;;   e.g. tierB-000852 tierB-001342 tierB-001990
(And (Agent $e0 $x0) (Member $e0 capture) (Theme $e0 $x1))

;; p203685  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000775 tierB-001649 tierB-001875
(And (Agent $e0 $x0) (Member $e0 cause) (Past $e0))

;; p203686  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000781 tierB-001245 tierB-001250
(And (Agent $e0 $x0) (Member $e0 draw) (Past $e0))

;; p203687  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.621  tiers tierB  signal subtree-collapse
;;   e.g. tierB-001182 tierB-001457 tierB-001754
(And (Agent $e0 $x0) (Member $e0 make) (Ongoing $e0))

;; p203688  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-001125 tierB-001433 tierB-001840
(And (Agent $e0 $x0) (Member $e0 play) (Ongoing $e0))

;; p203689  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.567  tiers tierB  dominated
;;   e.g. tierB-000469 tierB-000470 tierB-001773
(And (Agent $e0 $x0) (Member $e0 try) (Past $e0))

;; p203690  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.567  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Member $e0 try) (Theme $e0 $e1))

;; p203691  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.791  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000258 tierB-000520 tierB-001800
(And (Agent $e0 $x0) (Member $e0 watch) (Theme $e0 $x1))

;; p203692  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000871 tierB-000889 tierB-001534
(And (Agent $e0 $x0) (Over $e0 $x1) (Past $e0))

;; p203693  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.415  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Past $e0) (To $e0 $e1))

;; p203694  star  support 3 (occ 3)  size 3  lifted 0  nisurp -0.192  tiers tierB  dominated
;;   e.g. tierB-000747 tierB-001920 tierB-001976
(And (Agent $e0 $x0) (Patient $e0 $x1) (Result $e0 $e1))

;; p203695  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.087  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-001130 tierB-001773
(And (Agent $e0 $x0) (Patient $e0 $x1) (Theme $e1 $e0))

;; p203696  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.890  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-000455 tierB-001496
(And (Experiencer $e0 $x0) (Member $e0 need) (Theme $e0 $e1))

;; p203697  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-001563 tierB-001579 tierB-001902
(And (Goal $e0 $x0) (Manner $e0 quickly) (Past $e0))

;; p203698  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000387 tierB-001534 tierB-001963
(And (Goal $e0 $x0) (Member $e0 come) (Past $e0))

;; p203699  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.901  tiers tierB  dominated
;;   e.g. tierB-000036 tierB-000148 tierB-000805
(And (Location $e0 $x0) (Member $e0 walk) (Ongoing $e0))

;; p203700  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000148 tierB-000805 tierB-000951
(And (Location $e0 $x0) (Member $e0 walk) (Past $e0))

;; p203701  star  support 3 (occ 3)  size 3  lifted 0  nisurp -0.141  tiers tierB  dominated
;;   e.g. tierB-000217 tierB-000942 tierB-001893
(And (Location $e0 $x0) (Ongoing $e0) (Patient $e0 $x1))

;; p203702  star  support 3 (occ 4)  size 3  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000367 tierB-000368 tierB-001690
(And (Member $e0 buy) (Past $e0) (Theme $e0 $x0))

;; p203703  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000775 tierB-000805 tierB-001649
(And (Member $e0 cause) (Past $e0) (Patient $e0 $x0))

;; p203704  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-000728 tierB-000863
(And (Member $e0 create) (Past $e0) (Patient $e0 $x0))

;; p203705  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000338 tierB-000616 tierB-001551
(And (Member $e0 eat) (Past $e0) (Patient $e0 $x0))

;; p203706  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000779 tierB-001364
(And (Member $e0 fall) (Past $e0) (Source $e0 $x0))

;; p203707  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000579 tierB-000585 tierB-001139
(And (Member $e0 find) (Past $e0) (Theme $e0 $x0))

;; p203708  star  support 3 (occ 4)  size 3  lifted 0  nisurp 0.772  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Member $e0 get) (Patient $e0 $x0) (Result $e0 $e1))

;; p203709  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000680 tierB-000690 tierB-000965
(And (Member $e0 increase) (Past $e0) (Patient $e0 $x0))

;; p203710  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.863  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Member $e0 leave) (Patient $e0 $x0) (Result $e0 $e1))

;; p203711  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.628  tiers tierB  dominated
;;   e.g. tierB-000951 tierB-001182 tierB-001457
(And (Member $e0 make) (Ongoing $e0) (Patient $e0 $x0))

;; p203712  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.827  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Member $e0 make) (Ongoing $e0) (Result $e0 $e1))

;; p203713  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000876 tierB-001486 tierB-001932
(And (Member $e0 present) (Past $e0) (Theme $e0 $x0))

;; p203714  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000962 tierB-001595 tierB-001693
(And (Member $e0 receive) (Past $e0) (Theme $e0 $x0))

;; p203715  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000676 tierB-001299 tierB-001604
(And (Member $e0 stand) (Ongoing $e0) (Past $e0))

;; p203716  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000383 tierB-000482 tierB-001027
(And (Member $e0 stick) (Past $e0) (Patient $e0 $x0))

;; p203717  star  support 3 (occ 4)  size 3  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-001515 tierB-001873
(And (Member $e0 stop) (Past $e0) (Theme $e0 $e1))

;; p203718  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.611  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000117 tierB-000469 tierB-000487
(And (Member $e0 try) (Ongoing $e0) (Past $e0))

;; p203719  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-001675
(And (Member $e0 turn) (Past $e0) (Result $e0 $e1))

;; p203720  star  support 3 (occ 4)  size 3  lifted 0  nisurp 0.817  tiers tierB  dominated
;;   e.g. tierB-000476 tierB-000654 tierB-000832
(And (Member $e0 turn) (Patient $e0 $x0) (Result $e0 $e1))

;; p203721  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000148 tierB-000805 tierB-000929
(And (Member $e0 walk) (Ongoing $e0) (Past $e0))

;; p203722  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.689  tiers tierB  dominated
;;   e.g. tierB-001110 tierB-001359 tierB-001765
(And (Ongoing $e0) (Past $e0) (Patient $e0 $x0))

;; p203723  star  support 3 (occ 3)  size 3  lifted 0  nisurp 0.319  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001185 tierB-001809
(And (Ongoing $e0) (Past $e0) (Result $e0 $e1))

;; p203724  star  support 3 (occ 4)  size 3  lifted 0  nisurp 0.455  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000748 tierB-001658
(And (Ongoing $e0) (Patient $e0 $x0) (Result $e0 $e1))

;; p203725  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000969 tierB-001589 tierB-001980
(And (Agent $e0 $e1) (Member $e1 $v0) (Theme $e1 $x0))

;; p203726  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.544  tiers tierB  dominated
;;   e.g. tierB-000025 tierB-001047 tierB-001246
(And (Agent $e0 $v0) (Can $e0) (Patient $e0 $x0))

;; p203727  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e0 $e1) (Past $e0))

;; p203728  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.855  tiers tierB  dominated
;;   e.g. tierB-000148 tierB-000805 tierB-000951
(And (Agent $e0 $v0) (Location $e0 $x0) (Member $e0 walk))

;; p203729  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.037  tiers tierB  dominated
;;   e.g. tierB-000047 tierB-000704 tierB-000962
(And (Agent $e0 $v0) (Location $e0 $x0) (Theme $e0 $x1))

;; p203730  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Member $e0 begin) (Past $e0))

;; p203731  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.746  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Member $e0 begin) (Theme $e0 $e1))

;; p203732  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.746  tiers tierB  dominated
;;   e.g. tierB-000393 tierB-000412 tierB-001047
(And (Agent $e0 $v0) (Member $e0 kill) (Patient $e0 $x0))

;; p203733  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.514  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000425 tierB-000704 tierB-001350
(And (Agent $e0 $v0) (Member $e0 leave) (Past $e0))

;; p203734  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.819  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000203 tierB-001084 tierB-001879
(And (Agent $e0 $v0) (Member $e0 study) (Ongoing $e0))

;; p203735  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.855  tiers tierB  dominated
;;   e.g. tierB-000148 tierB-000805 tierB-000929
(And (Agent $e0 $v0) (Member $e0 walk) (Ongoing $e0))

;; p203736  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.382  tiers tierB  dominated
;;   e.g. tierB-000147 tierB-001143 tierB-001145
(And (Agent $e0 $v0) (Obligated $e0) (Past $e0))

;; p203737  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.746  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001185 tierB-001809
(And (Agent $e0 $v0) (Ongoing $e0) (Result $e0 $e1))

;; p203738  star  support 3 (occ 3)  size 3  lifted 1  nisurp -0.382  tiers tierB  dominated
;;   e.g. tierB-001221 tierB-001355 tierB-001637
(And (Agent $e0 $v0) (Ongoing $e0) (Theme $e0 $x0))

;; p203739  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.263  tiers tierB  dominated
;;   e.g. tierB-000138 tierB-001325 tierB-001612
(And (Agent $e0 $v0) (Past $e0) (Source $e0 $x0))

;; p203740  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.025  tiers tierB  dominated
;;   e.g. tierB-000688 tierB-000783 tierB-001782
(And (Agent $e0 $x0) (Experiencer $e1 $x0) (Past (Member $x0 $v0)))

;; p203741  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.567  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-001440 tierB-001726
(And (Agent $e0 $x0) (Future $e0) (Time $e0 $v0))

;; p203742  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(And (Agent $e0 $x0) (Goal $e0 home) (Member $e0 $v0))

;; p203743  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000772 tierB-001035 tierB-001628
(And (Agent $e0 $x0) (GroupOf $x0 $v0) (SubsetOf $x0 $x1))

;; p203744  star  support 3 (occ 3)  size 3  lifted 1  nisurp -0.409  tiers tierB  dominated
;;   e.g. tierB-000268 tierB-001507 tierB-001976
(And (Agent $e0 $x0) (Member $e0 $v0) (Obligated $e0))

;; p203745  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000316 tierB-001720 tierB-001911
(And (Agent $e0 $x0) (Member $e0 $v0) (Stimulus $e1 $e0))

;; p203746  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.025  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Member $e0 $v0) (To $e0 $e1))

;; p203747  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.025  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (Member $e0 $v0) (To $e1 $e0))

;; p203748  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.458  tiers tierB  dominated
;;   e.g. tierB-000268 tierB-000850 tierB-001098
(And (Agent $e0 $x0) (Member $e0 use) (Theme $e0 $v0))

;; p203749  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.512  tiers tierB  dominated
;;   e.g. tierB-000470 tierB-000485 tierB-000622
(And (Agent $e0 $x0) (Theme $e0 $v0) (Theme $e1 $e0))

;; p203750  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000209 tierB-000651 tierB-001538
(And (Agent $e0 baya) (Member $e0 $v0) (Past $e0))

;; p203751  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000078 tierB-000201 tierB-000576
(And (Agent $e0 daniel) (Member $e0 $v0) (Past $e0))

;; p203752  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(And (Agent $e0 david) (Member $e0 $v0) (Ongoing $e0))

;; p203753  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(And (Agent $e0 david) (Member $e0 $v0) (Past $e0))

;; p203754  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000148 tierB-000389 tierB-000487
(And (Agent $e0 felix) (Member $e0 $v0) (Past $e0))

;; p203755  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(And (Agent $e0 mark) (Member $e0 $v0) (Past $e0))

;; p203756  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000667 tierB-001023 tierB-001418
(And (Agent $e0 matthew) (Member $e0 $v0) (Past $e0))

;; p203757  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000252 tierB-000929 tierB-001094
(And (Agent $e0 michael) (Member $e0 $v0) (Past $e0))

;; p203758  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000138 tierB-000706 tierB-001172
(And (Agent $e0 pietro) (Member $e0 $v0) (Past $e0))

;; p203759  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000001 tierB-000008 tierB-000013
(And (Agent $e0 ziri) (Member $e0 $v0) (Ongoing $e0))

;; p203760  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000340 tierB-001316 tierB-001572
(And (At $e0 $x0) (Member $e0 $v0) (Past $e0))

;; p203761  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001302
(And (Before $e0 $e1) (Member $e0 $v0) (Past $e0))

;; p203762  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001222 tierB-001531 tierB-001544
(And (Before $x0 $e0) (Member $e0 $v0) (Past $e0))

;; p203763  star  support 3 (occ 3)  size 3  lifted 1  nisurp -0.473  tiers tierB
;;   e.g. tierB-000299 tierB-001094 tierB-001767
(And (Can $e0) (Member $e0 $v0) (Past $e0))

;; p203764  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000867 tierB-001782 tierB-001809
(And (During $e0 $e1) (Member $e0 $v0) (Past $e0))

;; p203765  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-001782 tierB-001809
(And (During $e0 $e1) (Member $e1 $v0) (Past $e1))

;; p203766  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.926  tiers tierB  dominated
;;   e.g. tierB-000676 tierB-001299 tierB-001604
(And (Experiencer $e0 $v0) (Member $e0 stand) (Ongoing $e0))

;; p203767  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000676 tierB-001299 tierB-001604
(And (Experiencer $e0 $v0) (Member $e0 stand) (Past $e0))

;; p203768  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.232  tiers tierB  dominated
;;   e.g. tierB-000676 tierB-001299 tierB-001604
(And (Experiencer $e0 $v0) (Ongoing $e0) (Past $e0))

;; p203769  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.294  tiers tierB  dominated
;;   e.g. tierB-000168 tierB-000916 tierB-001320
(And (Experiencer $e0 $x0) (Future $e0) (Member $e0 $v0))

;; p203770  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000495 tierB-000631 tierB-000808
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Time $e0 today))

;; p203771  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000425 tierB-000747 tierB-000880
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Member $x0 door))

;; p203772  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (For $e0 $e1) (Member $e0 $v0) (Past $e0))

;; p203773  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000712 tierB-001786 tierB-001879
(And (For $e0 $x0) (Member $e0 $v0) (Ongoing $e0))

;; p203774  star  support 3 (occ 3)  size 3  lifted 1  nisurp -0.070  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-001603 tierB-001786
(And (For $e0 $x0) (Member $e0 $v0) (Past $e0))

;; p203775  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000100 tierB-000378 tierB-001726
(And (Future $e0) (Member $e0 $v0) (Time $e0 tomorrow))

;; p203776  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001563 tierB-001579 tierB-001902
(And (Goal $e0 $x0) (Manner $e0 quickly) (Member $e0 $v0))

;; p203777  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.469  tiers tierB  dominated
;;   e.g. tierB-000111 tierB-000427 tierB-001728
(And (Goal $e0 $x0) (Past $e0) (Theme $e0 $v0))

;; p203778  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(And (Goal $e0 home) (Member $e0 $v0) (Past $e0))

;; p203779  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.517  tiers tierB  dominated
;;   e.g. tierB-000246 tierB-000975 tierB-001928
(And (GroupOf $x0 $v0) (Possession $x0 $x1) (Theme $e0 $x0))

;; p203780  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000723
(And (GroupOf $x0 $v0) (ProportionOf $x0 $x1 some) (SubsetOf $x0 $x1))

;; p203781  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000723
(And (GroupOf $x0 $v0) (ProportionOf $x1 $x0 some) (SubsetOf $x1 $x0))

;; p203782  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.103  tiers tierB  dominated
;;   e.g. tierB-000305 tierB-000524 tierB-001257
(And (LocatedIn $x0 $x1) (Location $e0 $x0) (Member $x0 $v0))

;; p203783  star  support 3 (occ 3)  size 3  lifted 1  nisurp -0.379  tiers tierB  dominated
;;   e.g. tierB-000975 tierB-001416 tierB-001638
(And (LocatedIn $x0 $x1) (Member $x0 $v0) (Theme $e0 $x0))

;; p203784  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000796 tierB-001196 tierB-001760
(And (LocatedIn $x0 $x1) (Member $x1 $v0) (Member $x1 full))

;; p203785  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(And (Location $e0 $x0) (Member $x0 $v0) (Member $x0 house))

;; p203786  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000618 tierB-001125 tierB-001925
(And (Location $e0 $x0) (Member $x0 $v0) (PartOf $x0 $x1))

;; p203787  star  support 3 (occ 5)  size 3  lifted 1  nisurp 0.167  tiers tierB  dominated
;;   e.g. tierB-000292 tierB-000706 tierB-001275
(And (Location $e0 $x0) (Past $e0) (Theme $e0 $v0))

;; p203788  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000237 tierB-000653 tierB-001705
(And (Location $e0 here) (Member $e0 $v0) (Past $e0))

;; p203789  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000378 tierB-000653 tierB-001705
(And (Location $e0 here) (Member $e0 $v0) (Patient $e0 $x0))

;; p203790  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.749  tiers tierB  dominated
;;   e.g. tierB-000398 tierB-000866 tierB-001300
(And (Manner $e0 $v0) (Obligated $e0) (Theme $e0 $x0))

;; p203791  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000666 tierB-001572 tierB-001743
(And (Manner $e0 immediately) (Member $e0 $v0) (Past $e0))

;; p203792  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000253 tierB-000778 tierB-001536
(And (Measure $e0 duration <num> year) (Member $e0 $v0) (Past $e0))

;; p203793  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000218 tierB-000969 tierB-001476
(And (Member $e0 $v0) (Might $e0) (Patient $e0 $x0))

;; p203794  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.297  tiers tierB
;;   e.g. tierB-000210 tierB-000504 tierB-000762
(And (Member $e0 $v0) (Only $v0 $e0) (Past $e0))

;; p203795  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.125  tiers tierB
;;   e.g. tierB-000797 tierB-001452 tierB-001809
(And (Member $e0 $v0) (Only $x0 $e0) (Past $e0))

;; p203796  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000797 tierB-001553 tierB-001809
(And (Member $e0 $v0) (Only $x0 $e0) (Theme $e0 $x0))

;; p203797  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000012 tierB-000264 tierB-001894
(And (Member $e0 $v0) (Past $e0) (Time $e0 night))

;; p203798  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000631 tierB-000808 tierB-001762
(And (Member $e0 $v0) (Past $e0) (Time $e0 today))

;; p203799  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000193 tierB-001094 tierB-001397
(And (Member $e0 $v0) (Past $e0) (With $e0 $x0))

;; p203800  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000517 tierB-001588 tierB-001910
(And (Member $e0 $v0) (Patient $e0 $x0) (Probably $e0))

;; p203801  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.178  tiers tierB  dominated
;;   e.g. tierB-000371 tierB-001304 tierB-001867
(And (Member $e0 $v0) (Patient $e0 $x0) (To $e1 $e0))

;; p203802  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000547 tierB-001219
(And (Member $e0 $v0) (Recipient $e0 $x0) (Theme $e1 $e0))

;; p203803  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.246  tiers tierB  dominated
;;   e.g. tierB-000147 tierB-000258 tierB-001396
(And (Member $e0 $v0) (Theme $e0 $x0) (To $e1 $e0))

;; p203804  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.851  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Member $e0 make) (Ongoing $e0) (Patient $e0 $v0))

;; p203805  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.943  tiers tierB  dominated
;;   e.g. tierB-000282 tierB-000404 tierB-001304
(And (Member $e0 use) (Theme $e0 $v0) (To $e0 $e1))

;; p203806  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000748 tierB-001594 tierB-001910
(And (Member $x0 $v0) (Member $x0 bad) (Patient $e0 $x0))

;; p203807  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000890 tierB-001457 tierB-001831
(And (Member $x0 $v0) (Member $x0 big) (Patient $e0 $x0))

;; p203808  star  support 3 (occ 3)  size 3  lifted 1  nisurp -0.817  tiers tierB  dominated
;;   e.g. tierB-000056 tierB-000425 tierB-000747
(And (Member $x0 $v0) (Member $x0 door) (Patient $e0 $x0))

;; p203809  star  support 3 (occ 3)  size 3  lifted 1  nisurp -0.035  tiers tierB  dominated
;;   e.g. tierB-000805 tierB-000951 tierB-001384
(And (Member $x0 $v0) (Member $x0 sound) (Patient $e0 $x0))

;; p203810  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-001070 tierB-001262 tierB-001423
(And (Member $x0 $v0) (Of $x0 $x1) (Theme $e0 $x0))

;; p203811  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.379  tiers tierB
;;   e.g. tierB-000229 tierB-001518 tierB-001745
(And (Member $x0 $v0) (PartOf $x1 $x0) (RestOf $x1 $x0))

;; p203812  star  support 3 (occ 3)  size 3  lifted 1  nisurp -0.172  tiers tierB  dominated
;;   e.g. tierB-000636 tierB-001149 tierB-001526
(And (Member $x0 $v0) (Theme $e0 $x0) (Theme $e1 $x0))

;; p203813  star  support 3 (occ 3)  size 3  lifted 1  nisurp -0.167  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-000456 tierB-001809
(And (Ongoing $e0) (Past $e0) (Patient $e0 $v0))

;; p203814  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.703  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-001754 tierB-001809
(And (Ongoing $e0) (Patient $e0 $v0) (Result $e0 $e1))

;; p203815  star  support 3 (occ 3)  size 3  lifted 1  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000955 tierB-001287
(And (Past $e0) (Patient $e0 $v0) (Source $e0 $x0))

;; p203816  star  support 3 (occ 4)  size 3  lifted 1  nisurp 0.416  tiers tierB  dominated
;;   e.g. tierB-000769 tierB-001046 tierB-001101
(And (Past $e0) (Recipient $e0 $x0) (Theme $e0 $v0))

;; p203817  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-000867 tierB-001809
(And (Agent $e0 $v0) (During $e0 $e1) (Member $e0 $v1))

;; p203818  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e0 $e1) (Member $e0 $v1))

;; p203819  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e1 $e0) (Member $e0 $v1))

;; p203820  star  support 3 (occ 4)  size 3  lifted 2  nisurp -0.160  tiers tierB
;;   e.g. tierB-000281 tierB-000478 tierB-000647
(And (Agent $e0 $v0) (Future $e0) (Member $e0 $v1))

;; p203821  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000253 tierB-000778 tierB-001084
(And (Agent $e0 $v0) (Measure $e0 duration <num> year) (Member $e0 $v1))

;; p203822  star  support 3 (occ 3)  size 3  lifted 2  nisurp -0.473  tiers tierB
;;   e.g. tierB-000252 tierB-001538 tierB-001809
(And (Agent $e0 $v0) (Member $e0 $v1) (Patient $e0 $v0))

;; p203823  star  support 3 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000547 tierB-001046 tierB-001612
(And (Agent $e0 $v0) (Member $e0 $v1) (Recipient $e0 $x0))

;; p203824  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000325 tierB-000539 tierB-001504
(And (Agent $e0 $v0) (Member $e0 make) (Patient $e0 $v1))

;; p203825  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.891  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000253 tierB-000292 tierB-001544
(And (Agent $e0 $v0) (Member $e0 study) (Theme $e0 $v1))

;; p203826  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.306  tiers tierB  dominated
;;   e.g. tierB-000013 tierB-000026 tierB-000173
(And (Agent $e0 $v0) (Ongoing $e0) (Theme $e0 $v1))

;; p203827  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.674  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-001544
(And (Agent $e0 $v0) (Theme $e0 $v1) (Theme $e1 $e0))

;; p203828  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000688 tierB-001496 tierB-001743
(And (Agent $e0 $x0) (Goal $e0 $v0) (Manner $e0 $v1))

;; p203829  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.463  tiers tierB
;;   e.g. tierB-000587 tierB-001205 tierB-001688
(And (Agent $e0 $x0) (Member $e0 $v0) (Member $e0 $v1))

;; p203830  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.416  tiers tierB
;;   e.g. tierB-000672 tierB-000908 tierB-001813
(And (Beneficiary $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p203831  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000053 tierB-001295 tierB-001766
(And (Degree $e0 $v0 very) (Manner $e0 $v0) (Member $e0 $v1))

;; p203832  star  support 3 (occ 3)  size 3  lifted 2  nisurp -0.172  tiers tierB  dominated
;;   e.g. tierB-000261 tierB-000842 tierB-001594
(And (Degree $x0 $v0 $v1) (Experiencer $e0 $x0) (Member $x0 $v0))

;; p203833  star  support 3 (occ 3)  size 3  lifted 2  nisurp -0.379  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-001103 tierB-001847
(And (Degree $x0 $v0 $v1) (Member $x0 $v0) (Theme $e0 $x0))

;; p203834  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000872 tierB-001466 tierB-001500
(And (Degree $x0 beautiful $v0) (Member $x0 $v1) (Member $x0 beautiful))

;; p203835  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.172  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000937 tierB-001124 tierB-001307
(And (Directive (And (At $x0 $x1) (Member $x0 look))) (Member $x1 $v0) (Member $x1 $v1))

;; p203836  star  support 3 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (For $e0 $x0) (Member $e0 $v1))

;; p203837  star  support 3 (occ 4)  size 3  lifted 2  nisurp 0.176  tiers tierB  dominated
;;   e.g. tierB-000114 tierB-000534 tierB-001479
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Theme $e1 $e0))

;; p203838  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000115 tierB-000203 tierB-000759
(And (Experiencer $e0 $v0) (Member $e0 $v1) (To $e1 $e0))

;; p203839  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000079 tierB-000603 tierB-001815
(And (Experiencer $e0 $v0) (Past $e0) (Stimulus $e0 $v1))

;; p203840  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.250  tiers tierB  dominated
;;   e.g. tierB-000227 tierB-000419 tierB-001334
(And (Experiencer $e0 $x0) (Location $e0 $v0) (Member $e0 $v1))

;; p203841  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000152 tierB-001521 tierB-001625
(And (Experiencer $e0 $x0) (Member $e0 $v0) (Source $e0 $v1))

;; p203842  star  support 3 (occ 4)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000831 tierB-001774 tierB-001896
(And (Experiencer $e0 $x0) (Member $x0 $v0) (Possession $x0 $v1))

;; p203843  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000274 tierB-001185 tierB-001530
(And (For $e0 $v0) (Member $e0 $v1) (Ongoing $e0))

;; p203844  star  support 3 (occ 4)  size 3  lifted 2  nisurp -0.374  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-001603 tierB-001627
(And (For $e0 $x0) (Member $x0 $v0) (Member $x0 $v1))

;; p203845  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000709 tierB-001013 tierB-001726
(And (Future $e0) (Member $e0 $v0) (Theme $e0 $v1))

;; p203846  star  support 3 (occ 4)  size 3  lifted 2  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000688 tierB-001743
(And (Goal $e0 $v0) (Manner $e0 $v1) (Past $e0))

;; p203847  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000029 tierB-000427 tierB-000554
(And (Goal $e0 $v0) (Past $e0) (Theme $e0 $v1))

;; p203848  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (GroupOf $x0 $v0) (Inheritance $x0 $v1) (SubsetOf $x0 $x1))

;; p203849  star  support 3 (occ 3)  size 3  lifted 2  nisurp -0.541  tiers tierB  dominated
;;   e.g. tierB-000615 tierB-000975 tierB-001509
(And (GroupOf $x0 $v0) (LocatedIn $x0 $x1) (Member $x0 $v1))

;; p203850  star  support 3 (occ 3)  size 3  lifted 2  nisurp -0.167  tiers tierB
;;   e.g. tierB-000067 tierB-001061 tierB-001994
(And (In $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p203851  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000326 tierB-000742 tierB-001069
(And (In $e0 $v0) (Member $e0 $v1) (Theme $e0 $x0))

;; p203852  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.992  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (Inheritance $x0 $v0) (ProportionOf $x0 $x1 $v1) (SubsetOf $x0 $x1))

;; p203853  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000369 tierB-001433 tierB-001765
(And (Instrument $e0 $v0) (Member $e0 $v1) (Ongoing $e0))

;; p203854  star  support 3 (occ 5)  size 3  lifted 2  nisurp -0.203  tiers tierB  dominated
;;   e.g. tierB-000444 tierB-000576 tierB-001143
(And (Instrument $e0 $x0) (Member $x0 $v0) (Member $x0 $v1))

;; p203855  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.416  tiers tierB
;;   e.g. tierB-000561 tierB-001168 tierB-001218
(And (Like $e0 $v0) (Member $e0 $v1) (Past $e0))

;; p203856  star  support 3 (occ 3)  size 3  lifted 2  nisurp -0.242  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001977
(And (Like $e0 $x0) (Member $x0 $v0) (Member $x0 $v1))

;; p203857  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000489 tierB-000707 tierB-001049
(And (LocatedIn $x0 $v0) (Location $e0 $x0) (Member $x0 $v1))

;; p203858  star  support 3 (occ 4)  size 3  lifted 2  nisurp 0.157  tiers tierB
;;   e.g. tierB-001084 tierB-001334 tierB-001708
(And (Location $e0 $v0) (Member $e0 $v1) (Ongoing $e0))

;; p203859  star  support 3 (occ 3)  size 3  lifted 2  nisurp -0.418  tiers tierB
;;   e.g. tierB-000483 tierB-000585 tierB-001956
(And (Location $e0 $v0) (Member $e0 $v1) (Theme $e0 $x0))

;; p203860  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000830 tierB-000910 tierB-001621
(And (Location $e0 $v0) (Member $e0 $v1) (Theme $e1 $e0))

;; p203861  star  support 3 (occ 5)  size 3  lifted 2  nisurp -0.571  tiers tierB
;;   e.g. tierB-000489 tierB-000602 tierB-001619
(And (Location $e0 $x0) (Member $e0 $v0) (Member $e0 $v1))

;; p203862  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.355  tiers tierB  dominated
;;   e.g. tierB-000238 tierB-000389 tierB-001217
(And (Manner $e0 $v0) (Past $e0) (Time $e0 $v1))

;; p203863  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000778 tierB-001536
(And (Measure $e0 $v0 <num> year) (Member $e0 $v1) (Past $e0))

;; p203864  star  support 3 (occ 3)  size 3  lifted 2  nisurp -0.331  tiers tierB
;;   e.g. tierB-000534 tierB-000587 tierB-001708
(And (Member $e0 $v0) (Member $e0 $v1) (Ongoing $e0))

;; p203865  star  support 3 (occ 5)  size 3  lifted 2  nisurp 0.232  tiers tierB  dominated
;;   e.g. tierB-001339 tierB-001648 tierB-001688
(And (Member $e0 $v0) (Member $e0 $v1) (Patient $e0 $x0))

;; p203866  star  support 3 (occ 3)  size 3  lifted 2  nisurp -0.834  tiers tierB  dominated
;;   e.g. tierB-001504 tierB-001573 tierB-001966
(And (Member $e0 $v0) (Member $e0 $v1) (Result $e1 $e0))

;; p203867  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.131  tiers tierB
;;   e.g. tierB-000674 tierB-000849 tierB-001535
(And (Member $e0 $v0) (Member $e0 $v1) (Theme $e0 $x0))

;; p203868  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000268 tierB-000366 tierB-001396
(And (Member $e0 $v0) (Obligated $e0) (Theme $e0 $v1))

;; p203869  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000955 tierB-001287
(And (Member $e0 $v0) (Patient $e0 $v1) (Source $e0 $x0))

;; p203870  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000404 tierB-001431
(And (Member $e0 $v0) (Patient $e0 $v1) (To $e1 $e0))

;; p203871  star  support 3 (occ 4)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000438 tierB-000485 tierB-001386
(And (Member $e0 $v0) (Source $e0 $x0) (Theme $e0 $v1))

;; p203872  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000171 tierB-000229 tierB-000282
(And (Member $e0 $v0) (Theme $e0 $v1) (To $e1 $e0))

;; p203873  star  support 3 (occ 3)  size 3  lifted 2  nisurp 0.962  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000957 tierB-001014 tierB-001895
(And (Member $x0 thing) (Might (Member $x0 $v0)) (Might (Member $x0 $v1)))

;; p203874  star  support 3 (occ 5)  size 3  lifted 2  nisurp 0.469  tiers tierB  dominated
;;   e.g. tierB-000311 tierB-000354 tierB-001275
(And (Past $e0) (Theme $e0 $v0) (Time $e0 $v1))

;; p203875  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000313 tierB-000393 tierB-000791
(And (Agent $e0 $v0) (Every $e0 <num> $v1) (Member $e0 $v2))

;; p203876  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000199 tierB-001270 tierB-001677
(And (Agent $e0 $v0) (In $e0 $v1) (Member $e0 $v2))

;; p203877  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.737  tiers tierB  dominated
;;   e.g. tierB-000212 tierB-000389 tierB-000883
(And (Agent $e0 $v0) (Manner $e0 $v1) (Time $e0 $v2))

;; p203878  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000778 tierB-001084
(And (Agent $e0 $v0) (Measure $e0 $v1 <num> year) (Member $e0 $v2))

;; p203879  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.350  tiers tierB
;;   e.g. tierB-000584 tierB-001134 tierB-001345
(And (Agent $e0 $x0) (Measure $e0 $v0 <num> $v1) (Member $e0 $v2))

;; p203880  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000426 tierB-001446 tierB-001708
(And (Degree $e0 $v0 $v1) (Member $e0 $v2) (Ongoing $e0))

;; p203881  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.125  tiers tierB
;;   e.g. tierB-000426 tierB-000481 tierB-000946
(And (Degree $e0 $v0 $v1) (Member $e0 $v2) (Past $e0))

;; p203882  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.172  tiers tierB
;;   e.g. tierB-000365 tierB-000960 tierB-001558
(And (Degree $x0 $v0 $v1) (Member $x0 $v2) (Past (Member $x0 $v0)))

;; p203883  star  support 3 (occ 3)  size 3  lifted 3  nisurp -0.379  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-001103 tierB-001847
(And (Degree $x0 $v0 $v1) (Member $x0 $v2) (Theme $e0 $x0))

;; p203884  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000937 tierB-001124 tierB-001307
(And (Directive (And (At $x0 $x1) (Member $x0 $v0))) (Member $x1 $v1) (Member $x1 $v2))

;; p203885  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000238 tierB-000598 tierB-000917
(And (Every $e0 <num> $v0) (Member $e0 $v1) (Time $e0 $v2))

;; p203886  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000559 tierB-000791 tierB-000917
(And (Every $e0 <num> $v0) (Member $e0 $v1) (Time $e0 (Weekday $v2)))

;; p203887  star  support 3 (occ 3)  size 3  lifted 3  nisurp -0.663  tiers tierB
;;   e.g. tierB-000534 tierB-000568 tierB-001504
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Member $e0 $v2))

;; p203888  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000846 tierB-001090 tierB-001390
(And (Experiencer $e0 $v0) (Member $e0 $v1) (Theme $e0 (And (Agent $x0 $v0) (Member $x0 $v2) (Theme $x0 $x1))))

;; p203889  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-000522 tierB-001264 tierB-001578
(And (For $x0 $v0) (Member $x0 $v1) (Member $x0 $v2))

;; p203890  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000029 tierB-000427 tierB-000554
(And (Goal $e0 $v0) (Member $e0 $v1) (Theme $e0 $v2))

;; p203891  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000100 tierB-001570 tierB-001588
(And (Goal $e0 $v0) (Member $e0 $v1) (Time $e0 $v2))

;; p203892  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (GroupOf $x0 $v0) (Inheritance $x0 $v1) (ProportionOf $x0 $x1 $v2))

;; p203893  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000237 tierB-000378 tierB-001440
(And (Location $e0 $v0) (Member $e0 $v1) (Time $e0 $v2))

;; p203894  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000329 tierB-001302 tierB-001487
(And (Measure $e0 $v0 (ParticleFromNormal <num> <num>) $v1) (Member $e0 $v2) (Past $e0))

;; p203895  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-000647 tierB-001084 tierB-001345
(And (Measure $e0 $v0 <num> $v1) (Member $e0 $v2) (Ongoing $e0))

;; p203896  star  support 3 (occ 3)  size 3  lifted 3  nisurp -0.431  tiers tierB
;;   e.g. tierB-000267 tierB-001454 tierB-001890
(And (Member $x0 $v0) (Member $x0 $v1) (More $v2 $x0 $x1))

;; p203897  star  support 3 (occ 3)  size 3  lifted 3  nisurp -0.431  tiers tierB
;;   e.g. tierB-001196 tierB-001454 tierB-001890
(And (Member $x0 $v0) (Member $x0 $v1) (More $v2 $x1 $x0))

;; p203898  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000957 tierB-001014 tierB-001895
(And (Member $x0 $v0) (Might (Member $x0 $v1)) (Might (Member $x0 $v2)))

;; p203899  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.172  tiers tierB
;;   e.g. tierB-000065 tierB-000984 tierB-001521
(And (Member $x0 $v0) (Probably (Degree $x0 $v1 $v2)) (Probably (Member $x0 $v1)))

;; p203900  star  support 3 (occ 3)  size 3  lifted 3  nisurp 0.899  tiers tierB
;;   e.g. tierB-000646 tierB-000820 tierB-001522
(And (Past (Degree $x0 $v0 $v1)) (Past (Member $x0 $v0)) (Past (Member $x0 $v2)))

;; p203901  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.749  tiers tierB  dominated
;;   e.g. tierB-000969 tierB-001589 tierB-001980
(And (Agent $e0 $e1) (Theme $e1 $x0))

;; p203902  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(And (Agent $e0 $x0) (Goal $e0 home))

;; p203903  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000225 tierB-001251 tierB-001984
(And (Agent $e0 $x0) (GroupOf $x0 scientist))

;; p203904  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000274 tierB-001058 tierB-001695
(And (Agent $e0 $x0) (GroupOf $x0 soldier))

;; p203905  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000237 tierB-001440 tierB-001992
(And (Agent $e0 $x0) (Member $e0 arrive))

;; p203906  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.458  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-001052 tierB-001138
(And (Agent $e0 $x0) (Member $e0 begin))

;; p203907  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.675  tiers tierB  dominated
;;   e.g. tierB-000852 tierB-001342 tierB-001990
(And (Agent $e0 $x0) (Member $e0 capture))

;; p203908  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.675  tiers tierB  dominated
;;   e.g. tierB-000950 tierB-001205 tierB-001926
(And (Agent $e0 $x0) (Member $e0 close))

;; p203909  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.837  tiers tierB  dominated
;;   e.g. tierB-000781 tierB-001245 tierB-001250
(And (Agent $e0 $x0) (Member $e0 draw))

;; p203910  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.241  tiers tierB  signal subtree-collapse
;;   e.g. tierB-001183 tierB-001496 tierB-001628
(And (Agent $e0 $x0) (Member $e0 go))

;; p203911  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000339 tierB-001153 tierB-001563
(And (Agent $e0 $x0) (Member $e0 run))

;; p203912  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.512  tiers tierB  dominated
;;   e.g. tierB-000225 tierB-000710 tierB-001984
(And (Agent $e0 $x0) (Member $e0 study))

;; p203913  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.458  tiers tierB  dominated
;;   e.g. tierB-000942 tierB-000978 tierB-001726
(And (Agent $e0 $x0) (Member $e0 take))

;; p203914  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.675  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000550 tierB-001219 tierB-001666
(And (Agent $e0 $x0) (Member $e0 talk))

;; p203915  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.567  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000036 tierB-000324 tierB-001219
(And (Agent $e0 $x0) (Member $e0 walk))

;; p203916  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.512  tiers tierB  signal subtree-collapse
;;   e.g. tierB-001134 tierB-001813 tierB-001873
(And (Agent $e0 $x0) (Member $e0 work))

;; p203917  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-001430 tierB-001528 tierB-001739
(And (Agent $e0 $x0) (Member $x0 bus))

;; p203918  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-000339 tierB-000793
(And (Agent $e0 $x0) (Member $x0 doctor))

;; p203919  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.512  tiers tierB  dominated
;;   e.g. tierB-001086 tierB-001551 tierB-001892
(And (Agent $e0 $x0) (Member $x0 dog))

;; p203920  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.783  tiers tierB  dominated
;;   e.g. tierB-000045 tierB-000132 tierB-000298
(And (Agent $e0 $x0) (Member $x0 plane))

;; p203921  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.409  tiers tierB  dominated
;;   e.g. tierB-000268 tierB-001507 tierB-001976
(And (Agent $e0 $x0) (Obligated $e0))

;; p203922  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.729  tiers tierB  dominated
;;   e.g. tierB-000316 tierB-001720 tierB-001911
(And (Agent $e0 $x0) (Stimulus $e1 $e0))

;; p203923  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.133  tiers tierB  dominated
;;   e.g. tierB-000772 tierB-001035 tierB-001628
(And (Agent $e0 $x0) (SubsetOf $x0 $x1))

;; p203924  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.025  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (To $e0 $e1))

;; p203925  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.025  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-001035 tierB-001867
(And (Agent $e0 $x0) (To $e1 $e0))

;; p203926  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000209 tierB-000651 tierB-001538
(And (Agent $e0 baya) (Past $e0))

;; p203927  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000201 tierB-000576
(And (Agent $e0 daniel) (Past $e0))

;; p203928  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.926  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(And (Agent $e0 david) (Ongoing $e0))

;; p203929  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(And (Agent $e0 david) (Past $e0))

;; p203930  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000148 tierB-000389 tierB-000487
(And (Agent $e0 felix) (Past $e0))

;; p203931  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(And (Agent $e0 mark) (Past $e0))

;; p203932  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000667 tierB-001023 tierB-001418
(And (Agent $e0 matthew) (Past $e0))

;; p203933  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000929 tierB-001094
(And (Agent $e0 michael) (Past $e0))

;; p203934  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000138 tierB-000706 tierB-001172
(And (Agent $e0 pietro) (Past $e0))

;; p203935  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.926  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000008 tierB-000013
(And (Agent $e0 ziri) (Ongoing $e0))

;; p203936  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000340 tierB-001316 tierB-001572
(And (At $e0 $x0) (Past $e0))

;; p203937  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000412 tierB-000688 tierB-001302
(And (Before $e0 $e1) (Past $e0))

;; p203938  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-001222 tierB-001531 tierB-001544
(And (Before $x0 $e0) (Past $e0))

;; p203939  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.981  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000299 tierB-000319 tierB-001094
(And (Can $e0) (Member $e0 help))

;; p203940  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.848  tiers tierB  dominated
;;   e.g. tierB-000299 tierB-001094 tierB-001767
(And (Can $e0) (Past $e0))

;; p203941  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.969  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000133 tierB-000738 tierB-000814
(And (Cardinality $x0 <num>) (GroupOf $x0 girl))

;; p203942  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000867 tierB-001782 tierB-001809
(And (During $e0 $e1) (Past $e0))

;; p203943  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-001782 tierB-001809
(And (During $e0 $e1) (Past $e1))

;; p203944  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.294  tiers tierB  dominated
;;   e.g. tierB-000168 tierB-000916 tierB-001320
(And (Experiencer $e0 $x0) (Future $e0))

;; p203945  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.735  tiers tierB  dominated
;;   e.g. tierB-001496 tierB-001685 tierB-001945
(And (Experiencer $e0 $x0) (GroupOf $x0 child))

;; p203946  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.934  tiers tierB  dominated
;;   e.g. tierB-000565 tierB-000904 tierB-001920
(And (Experiencer $e0 $x0) (Member $e0 beautiful))

;; p203947  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.890  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000297 tierB-000831
(And (Experiencer $e0 $x0) (Member $e0 look))

;; p203948  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.801  tiers tierB  dominated
;;   e.g. tierB-000144 tierB-000419 tierB-001515
(And (Experiencer $e0 $x0) (Member $e0 work))

;; p203949  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.779  tiers tierB  dominated
;;   e.g. tierB-000250 tierB-001003 tierB-001334
(And (Experiencer $e0 $x0) (Member $x0 cat))

;; p203950  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.691  tiers tierB  dominated
;;   e.g. tierB-000425 tierB-000747 tierB-000880
(And (Experiencer $e0 $x0) (Member $x0 door))

;; p203951  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.654  tiers tierB  dominated
;;   e.g. tierB-000370 tierB-000842 tierB-000960
(And (Experiencer $e0 $x0) (Member $x0 thing))

;; p203952  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.735  tiers tierB  dominated
;;   e.g. tierB-000495 tierB-000565 tierB-000748
(And (Experiencer $e0 $x0) (Member $x0 weather))

;; p203953  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.890  tiers tierB  dominated
;;   e.g. tierB-000495 tierB-000631 tierB-000808
(And (Experiencer $e0 $x0) (Time $e0 today))

;; p203954  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (For $e0 $e1) (Past $e0))

;; p203955  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.727  tiers tierB  dominated
;;   e.g. tierB-000712 tierB-001786 tierB-001879
(And (For $e0 $x0) (Ongoing $e0))

;; p203956  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.070  tiers tierB  dominated
;;   e.g. tierB-000049 tierB-001603 tierB-001786
(And (For $e0 $x0) (Past $e0))

;; p203957  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.984  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000378 tierB-001726
(And (Future $e0) (Time $e0 tomorrow))

;; p203958  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.910  tiers tierB  dominated
;;   e.g. tierB-001563 tierB-001579 tierB-001902
(And (Goal $e0 $x0) (Manner $e0 quickly))

;; p203959  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.901  tiers tierB  dominated
;;   e.g. tierB-000387 tierB-001534 tierB-001963
(And (Goal $e0 $x0) (Member $e0 come))

;; p203960  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.993  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000012 tierB-001418 tierB-001496
(And (Goal $e0 bed) (Member $e0 go))

;; p203961  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(And (Goal $e0 home) (Past $e0))

;; p203962  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.939  tiers tierB  dominated
;;   e.g. tierB-000126 tierB-001108 tierB-001286
(And (GroupOf $x0 person) (Past (LocatedIn $x0 $x1)))

;; p203963  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.498  tiers tierB  dominated
;;   e.g. tierB-001721 tierB-001816 tierB-001893
(And (GroupOf $x0 thing) (Patient $e0 $x0))

;; p203964  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.995  tiers tierB  dominated
;;   e.g. tierB-000230 tierB-000831 tierB-001135
(And (Like $e0 $x0) (Member $e0 look))

;; p203965  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.030  tiers tierB  dominated
;;   e.g. tierB-000305 tierB-000524 tierB-001257
(And (LocatedIn $x0 $x1) (Location $e0 $x0))

;; p203966  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.906  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000153 tierB-000546 tierB-000680
(And (LocatedIn $x0 $x1) (Member $x1 city))

;; p203967  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.948  tiers tierB  dominated
;;   e.g. tierB-000796 tierB-001196 tierB-001760
(And (LocatedIn $x0 $x1) (Member $x1 full))

;; p203968  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.885  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000619 tierB-001410 tierB-001492
(And (LocatedIn $x0 $x1) (Member $x1 table))

;; p203969  star  support 3 (occ 3)  size 2  lifted 0  nisurp 1.555  tiers tierB  dominated
;;   e.g. tierB-000975 tierB-001416 tierB-001638
(And (LocatedIn $x0 $x1) (Theme $e0 $x0))

;; p203970  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.730  tiers tierB  dominated
;;   e.g. tierB-000048 tierB-000371 tierB-000524
(And (Location $e0 $x0) (Member $x0 house))

;; p203971  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.396  tiers tierB  dominated
;;   e.g. tierB-000618 tierB-001125 tierB-001925
(And (Location $e0 $x0) (PartOf $x0 $x1))

;; p203972  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000237 tierB-000653 tierB-001705
(And (Location $e0 here) (Past $e0))

;; p203973  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.772  tiers tierB  dominated
;;   e.g. tierB-000378 tierB-000653 tierB-001705
(And (Location $e0 here) (Patient $e0 $x0))

;; p203974  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000666 tierB-001572 tierB-001743
(And (Manner $e0 immediately) (Past $e0))

;; p203975  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000778 tierB-001536
(And (Measure $e0 duration <num> year) (Past $e0))

;; p203976  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.874  tiers tierB  dominated
;;   e.g. tierB-000037 tierB-000128 tierB-000974
(And (Member $e0 approve) (Theme $e0 $x0))

;; p203977  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.611  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000237 tierB-000444 tierB-001992
(And (Member $e0 arrive) (Past $e0))

;; p203978  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000906 tierB-001568 tierB-001812
(And (Member $e0 bear) (Past $e0))

;; p203979  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.514  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000352 tierB-001079 tierB-001582
(And (Member $e0 become) (Past $e0))

;; p203980  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.969  tiers tierB  dominated
;;   e.g. tierB-001079 tierB-001582 tierB-001817
(And (Member $e0 become) (Result $e0 $e1))

;; p203981  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.544  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000182 tierB-001048 tierB-001394
(And (Member $e0 begin) (Patient $e0 $x0))

;; p203982  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-001302 tierB-001641 tierB-001694
(And (Member $e0 break_out) (Past $e0))

;; p203983  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.863  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000932 tierB-001867
(And (Member $e0 build) (Patient $e0 $x0))

;; p203984  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000367 tierB-000368 tierB-001690
(And (Member $e0 buy) (Past $e0))

;; p203985  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.726  tiers tierB  dominated
;;   e.g. tierB-000775 tierB-000805 tierB-001649
(And (Member $e0 cause) (Patient $e0 $x0))

;; p203986  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.319  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000139 tierB-001217 tierB-001803
(And (Member $e0 change) (Past $e0))

;; p203987  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.726  tiers tierB  dominated
;;   e.g. tierB-000218 tierB-000950 tierB-001926
(And (Member $e0 close) (Patient $e0 $x0))

;; p203988  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.452  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000677 tierB-001697 tierB-001949
(And (Member $e0 come) (Patient $e0 $x0))

;; p203989  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.936  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000677 tierB-001774 tierB-001949
(And (Member $e0 come) (Source $e0 $x0))

;; p203990  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.817  tiers tierB  dominated
;;   e.g. tierB-000809 tierB-001166 tierB-001541
(And (Member $e0 cover) (Patient $e0 $x0))

;; p203991  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-000728 tierB-000863
(And (Member $e0 create) (Past $e0))

;; p203992  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.863  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-000728 tierB-000863
(And (Member $e0 create) (Patient $e0 $x0))

;; p203993  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000781 tierB-001245 tierB-001250
(And (Member $e0 draw) (Past $e0))

;; p203994  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000616 tierB-001551
(And (Member $e0 eat) (Past $e0))

;; p203995  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.772  tiers tierB  dominated
;;   e.g. tierB-000338 tierB-000616 tierB-001551
(And (Member $e0 eat) (Patient $e0 $x0))

;; p203996  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.777  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000194 tierB-000456 tierB-001905
(And (Member $e0 fall) (Ongoing $e0))

;; p203997  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.952  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000779 tierB-001364
(And (Member $e0 fall) (Source $e0 $x0))

;; p203998  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.833  tiers tierB  dominated
;;   e.g. tierB-000579 tierB-000585 tierB-001139
(And (Member $e0 find) (Theme $e0 $x0))

;; p203999  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.456  tiers tierB  dominated
;;   e.g. tierB-000418 tierB-000672 tierB-001325
(And (Member $e0 get) (Theme $e0 $x0))

;; p204000  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.416  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000299 tierB-000858 tierB-001094
(And (Member $e0 help) (Past $e0))

;; p204001  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000329 tierB-000692 tierB-001801
(And (Member $e0 hold_up) (Past $e0))

;; p204002  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000680 tierB-000690 tierB-000965
(And (Member $e0 increase) (Past $e0))

;; p204003  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.817  tiers tierB  dominated
;;   e.g. tierB-000680 tierB-000690 tierB-000965
(And (Member $e0 increase) (Patient $e0 $x0))

;; p204004  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.544  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Member $e0 leave) (Patient $e0 $x0))

;; p204005  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.939  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000425 tierB-000747
(And (Member $e0 leave) (Result $e0 $e1))

;; p204006  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.581  tiers tierB  dominated
;;   e.g. tierB-000704 tierB-000713 tierB-001350
(And (Member $e0 leave) (Theme $e0 $x0))

;; p204007  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000334 tierB-001040 tierB-001072
(And (Member $e0 pick_up) (Past $e0))

;; p204008  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.777  tiers tierB  dominated
;;   e.g. tierB-001125 tierB-001433 tierB-001840
(And (Member $e0 play) (Ongoing $e0))

;; p204009  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.623  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-000648 tierB-000816
(And (Member $e0 play) (Theme $e0 $x0))

;; p204010  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000876 tierB-001486 tierB-001932
(And (Member $e0 present) (Past $e0))

;; p204011  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.833  tiers tierB  dominated
;;   e.g. tierB-000876 tierB-001486 tierB-001932
(And (Member $e0 present) (Theme $e0 $x0))

;; p204012  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.874  tiers tierB  dominated
;;   e.g. tierB-000783 tierB-001221 tierB-001637
(And (Member $e0 read) (Theme $e0 $x0))

;; p204013  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.833  tiers tierB  dominated
;;   e.g. tierB-000962 tierB-001595 tierB-001693
(And (Member $e0 receive) (Theme $e0 $x0))

;; p204014  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.611  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000178 tierB-001153 tierB-001563
(And (Member $e0 run) (Past $e0))

;; p204015  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.791  tiers tierB  dominated
;;   e.g. tierB-000080 tierB-000865 tierB-001626
(And (Member $e0 say) (Theme $e0 $x0))

;; p204016  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000827 tierB-001156 tierB-001901
(And (Member $e0 sing) (Past $e0))

;; p204017  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.863  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000935 tierB-001202 tierB-001970
(And (Member $e0 solve) (Patient $e0 $x0))

;; p204018  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.876  tiers tierB  dominated
;;   e.g. tierB-000676 tierB-001299 tierB-001604
(And (Member $e0 stand) (Ongoing $e0))

;; p204019  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000383 tierB-000482 tierB-001027
(And (Member $e0 stick) (Past $e0))

;; p204020  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.863  tiers tierB  dominated
;;   e.g. tierB-000383 tierB-000482 tierB-001027
(And (Member $e0 stick) (Patient $e0 $x0))

;; p204021  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.944  tiers tierB  dominated
;;   e.g. tierB-000030 tierB-001515 tierB-001873
(And (Member $e0 stop) (Theme $e0 $e1))

;; p204022  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.416  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000327 tierB-000550 tierB-001666
(And (Member $e0 talk) (Past $e0))

;; p204023  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.514  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000667 tierB-000995 tierB-001618
(And (Member $e0 travel) (Past $e0))

;; p204024  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.416  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000651 tierB-001720 tierB-001800
(And (Member $e0 watch) (Past $e0))

;; p204025  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.749  tiers tierB  dominated
;;   e.g. tierB-000258 tierB-000520 tierB-001800
(And (Member $e0 watch) (Theme $e0 $x0))

;; p204026  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.772  tiers tierB  dominated
;;   e.g. tierB-000748 tierB-001594 tierB-001910
(And (Member $x0 bad) (Patient $e0 $x0))

;; p204027  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.680  tiers tierB  dominated
;;   e.g. tierB-000890 tierB-001457 tierB-001831
(And (Member $x0 big) (Patient $e0 $x0))

;; p204028  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.993  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000937 tierB-001124 tierB-001940
(And (Member $x0 blue) (Member $x0 sky))

;; p204029  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.981  tiers tierB  dominated
;;   e.g. tierB-000172 tierB-001586 tierB-001638
(And (Member $x0 bottom) (PartOf $x0 $x1))

;; p204030  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.772  tiers tierB  dominated
;;   e.g. tierB-000890 tierB-001163 tierB-001302
(And (Member $x0 fire) (Patient $e0 $x0))

;; p204031  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.224  tiers tierB  dominated
;;   e.g. tierB-000371 tierB-000471 tierB-001887
(And (Member $x0 house) (Patient $e0 $x0))

;; p204032  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.726  tiers tierB  dominated
;;   e.g. tierB-000685 tierB-001106 tierB-001756
(And (Member $x0 light) (Patient $e0 $x0))

;; p204033  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.833  tiers tierB  dominated
;;   e.g. tierB-000876 tierB-001070 tierB-001423
(And (Member $x0 picture) (Theme $e0 $x0))

;; p204034  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.452  tiers tierB  dominated
;;   e.g. tierB-000935 tierB-001202 tierB-001910
(And (Member $x0 problem) (Patient $e0 $x0))

;; p204035  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.315  tiers tierB  dominated
;;   e.g. tierB-001642 tierB-001920 tierB-001997
(And (Member $x0 room) (Patient $e0 $x0))

;; p204036  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.769  tiers tierB  dominated
;;   e.g. tierB-000756 tierB-000759 tierB-000865
(And (Member $x0 thing) (Stimulus $e0 $x0))

;; p204037  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.452  tiers tierB  dominated
;;   e.g. tierB-000517 tierB-000748 tierB-001491
(And (Member $x0 weather) (Patient $e0 $x0))

;; p204038  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.817  tiers tierB  dominated
;;   e.g. tierB-000218 tierB-000969 tierB-001476
(And (Might $e0) (Patient $e0 $x0))

;; p204039  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.125  tiers tierB  dominated
;;   e.g. tierB-000797 tierB-001452 tierB-001809
(And (Only $x0 $e0) (Past $e0))

;; p204040  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.623  tiers tierB  dominated
;;   e.g. tierB-000797 tierB-001553 tierB-001809
(And (Only $x0 $e0) (Theme $e0 $x0))

;; p204041  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.734  tiers tierB  dominated
;;   e.g. tierB-001246 tierB-001926 tierB-001964
(And (PartOf $x0 $x1) (Patient $e0 $x0))

;; p204042  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.981  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-001518 tierB-001745
(And (PartOf $x0 $x1) (RestOf $x0 $x1))

;; p204043  star  support 3 (occ 4)  size 2  lifted 0  nisurp 0.611  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-000264 tierB-001894
(And (Past $e0) (Time $e0 night))

;; p204044  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000631 tierB-000808 tierB-001762
(And (Past $e0) (Time $e0 today))

;; p204045  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000193 tierB-001094 tierB-001397
(And (Past $e0) (With $e0 $x0))

;; p204046  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.589  tiers tierB  dominated
;;   e.g. tierB-000517 tierB-001588 tierB-001910
(And (Patient $e0 $x0) (Probably $e0))

;; p204047  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.178  tiers tierB  dominated
;;   e.g. tierB-000371 tierB-001304 tierB-001867
(And (Patient $e0 $x0) (To $e1 $e0))

;; p204048  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.992  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000723
(And (ProportionOf $x0 $x1 some) (SubsetOf $x0 $x1))

;; p204049  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.842  tiers tierB  dominated
;;   e.g. tierB-000485 tierB-000547 tierB-001219
(And (Recipient $e0 $x0) (Theme $e1 $e0))

;; p204050  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.665  tiers tierB  dominated
;;   e.g. tierB-001177 tierB-001566 tierB-001922
(And (Theme $e0 $x0) (To $e0 $x1))

;; p204051  star  support 3 (occ 3)  size 2  lifted 0  nisurp 0.246  tiers tierB  dominated
;;   e.g. tierB-000147 tierB-000258 tierB-001396
(And (Theme $e0 $x0) (To $e1 $e0))

;; p204052  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000248 tierB-000343 tierB-000786
(And (Against $e0 $x0) (Member $e0 $v0))

;; p204053  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000248 tierB-000343 tierB-000786
(And (Against $e0 $x0) (Member $x0 $v0))

;; p204054  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.819  tiers tierB  dominated
;;   e.g. tierB-000502 tierB-000867 tierB-001809
(And (Agent $e0 $v0) (During $e0 $e1))

;; p204055  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.855  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e0 $e1))

;; p204056  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.855  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000239 tierB-000962
(And (Agent $e0 $v0) (For $e1 $e0))

;; p204057  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.160  tiers tierB  dominated
;;   e.g. tierB-000281 tierB-000478 tierB-000647
(And (Agent $e0 $v0) (Future $e0))

;; p204058  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.819  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000778 tierB-001084
(And (Agent $e0 $v0) (Measure $e0 duration <num> year))

;; p204059  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.638  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000173 tierB-000240
(And (Agent $e0 $v0) (Member $e0 begin))

;; p204060  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.855  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000030 tierB-000502 tierB-001538
(And (Agent $e0 $v0) (Member $e0 cry))

;; p204061  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.783  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000319 tierB-001094 tierB-001149
(And (Agent $e0 $v0) (Member $e0 help))

;; p204062  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.746  tiers tierB  dominated
;;   e.g. tierB-000393 tierB-000412 tierB-001047
(And (Agent $e0 $v0) (Member $e0 kill))

;; p204063  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.783  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000078 tierB-000327 tierB-001968
(And (Agent $e0 $v0) (Member $e0 talk))

;; p204064  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.674  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000212 tierB-000867 tierB-001187
(And (Agent $e0 $v0) (Member $e0 work))

;; p204065  star  support 3 (occ 3)  size 2  lifted 1  nisurp 1.319  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-001538 tierB-001809
(And (Agent $e0 $v0) (Patient $e0 $v0))

;; p204066  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.493  tiers tierB  dominated
;;   e.g. tierB-000547 tierB-001046 tierB-001612
(And (Agent $e0 $v0) (Recipient $e0 $x0))

;; p204067  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-001044 tierB-001117 tierB-001767
(And (Agent $e0 adriano) (Member $e0 $v0))

;; p204068  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000209 tierB-000651 tierB-001538
(And (Agent $e0 baya) (Member $e0 $v0))

;; p204069  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000201 tierB-000576
(And (Agent $e0 daniel) (Member $e0 $v0))

;; p204070  star  support 3 (occ 5)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(And (Agent $e0 david) (Member $e0 $v0))

;; p204071  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000025 tierB-000524 tierB-000563
(And (Agent $e0 elias) (Member $e0 $v0))

;; p204072  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000148 tierB-000389 tierB-000487
(And (Agent $e0 felix) (Member $e0 $v0))

;; p204073  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000791 tierB-000987 tierB-001675
(And (Agent $e0 gustavo) (Member $e0 $v0))

;; p204074  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000406 tierB-000412 tierB-000564
(And (Agent $e0 ivan) (Member $e0 $v0))

;; p204075  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000313 tierB-000327 tierB-001449
(And (Agent $e0 linda) (Member $e0 $v0))

;; p204076  star  support 3 (occ 6)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(And (Agent $e0 mark) (Member $e0 $v0))

;; p204077  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000107 tierB-000450 tierB-000588
(And (Agent $e0 martino) (Member $e0 $v0))

;; p204078  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000002 tierB-000021 tierB-000048
(And (Agent $e0 mary) (Member $e0 $v0))

;; p204079  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000667 tierB-001023 tierB-001418
(And (Agent $e0 matthew) (Member $e0 $v0))

;; p204080  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000209 tierB-000219 tierB-000257
(And (Agent $e0 mennad) (Member $e0 $v0))

;; p204081  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000929 tierB-001094
(And (Agent $e0 michael) (Member $e0 $v0))

;; p204082  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000138 tierB-000706 tierB-001172
(And (Agent $e0 pietro) (Member $e0 $v0))

;; p204083  star  support 3 (occ 5)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000137 tierB-000240 tierB-000273
(And (Agent $e0 william) (Member $e0 $v0))

;; p204084  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000008 tierB-000013
(And (Agent $e0 ziri) (Member $e0 $v0))

;; p204085  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000340 tierB-001316 tierB-001572
(And (At $e0 $x0) (Member $e0 $v0))

;; p204086  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000340 tierB-001316 tierB-001572
(And (At $e0 $x0) (Member $x0 $v0))

;; p204087  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.416  tiers tierB  dominated
;;   e.g. tierB-000672 tierB-000908 tierB-001813
(And (Beneficiary $e0 $v0) (Past $e0))

;; p204088  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000374 tierB-001696 tierB-001867
(And (Beneficiary $e0 $x0) (Member $e0 $v0))

;; p204089  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000463 tierB-001314 tierB-001337
(And (But $e0 $e1) (Member $e0 $v0))

;; p204090  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000463 tierB-001314 tierB-001337
(And (But $e0 $e1) (Member $e1 $v0))

;; p204091  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000925 tierB-000964 tierB-001832
(And (But $e0 $x0) (Member $e0 $v0))

;; p204092  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.920  tiers tierB  dominated
;;   e.g. tierB-000053 tierB-001295 tierB-001766
(And (Degree $e0 $v0 very) (Manner $e0 $v0))

;; p204093  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.929  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000960 tierB-001558 tierB-001839
(And (Degree $x0 $v0 really) (Past (Member $x0 $v0)))

;; p204094  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.995  tiers tierB  dominated
;;   e.g. tierB-000872 tierB-001466 tierB-001500
(And (Degree $x0 beautiful $v0) (Member $x0 beautiful))

;; p204095  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.724  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000518 tierB-000604 tierB-001546
(And (Degree $x0 quantity excessive) (GroupOf $x0 $v0))

;; p204096  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000791 tierB-000917 tierB-001051
(And (Every $e0 <num> week) (Member $e0 $v0))

;; p204097  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000393 tierB-000559 tierB-001967
(And (Every $e0 <num> year) (Member $e0 $v0))

;; p204098  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001016 tierB-001523 tierB-001966
(And (Experiencer $e0 $e1) (Member $e0 $v0))

;; p204099  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-001016 tierB-001523 tierB-001966
(And (Experiencer $e0 $e1) (Member $e1 $v0))

;; p204100  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.863  tiers tierB  dominated
;;   e.g. tierB-000044 tierB-001627 tierB-001898
(And (Experiencer $e0 $v0) (For $e0 $x0))

;; p204101  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.938  tiers tierB  dominated
;;   e.g. tierB-000676 tierB-001299 tierB-001604
(And (Experiencer $e0 $v0) (Member $e0 stand))

;; p204102  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.176  tiers tierB  dominated
;;   e.g. tierB-000114 tierB-000534 tierB-001479
(And (Experiencer $e0 $v0) (Theme $e1 $e0))

;; p204103  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.775  tiers tierB  dominated
;;   e.g. tierB-000115 tierB-000203 tierB-000759
(And (Experiencer $e0 $v0) (To $e1 $e0))

;; p204104  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.779  tiers tierB  dominated
;;   e.g. tierB-000168 tierB-000916 tierB-001320
(And (Experiencer $e0 $x0) (Future (Member $x0 $v0)))

;; p204105  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.250  tiers tierB  dominated
;;   e.g. tierB-000227 tierB-000419 tierB-001334
(And (Experiencer $e0 $x0) (Location $e0 $v0))

;; p204106  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.493  tiers tierB  dominated
;;   e.g. tierB-000831 tierB-001774 tierB-001896
(And (Experiencer $e0 $x0) (Possession $x0 $v0))

;; p204107  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.757  tiers tierB  dominated
;;   e.g. tierB-000152 tierB-001521 tierB-001625
(And (Experiencer $e0 $x0) (Source $e0 $v0))

;; p204108  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.703  tiers tierB  dominated
;;   e.g. tierB-000274 tierB-001185 tierB-001530
(And (For $e0 $v0) (Ongoing $e0))

;; p204109  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.540  tiers tierB  dominated
;;   e.g. tierB-000709 tierB-001013 tierB-001726
(And (Future $e0) (Theme $e0 $v0))

;; p204110  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.872  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000104 tierB-000740 tierB-000895
(And (Future (Member $x0 $v0)) (Member $x0 thing))

;; p204111  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-001418 tierB-001496
(And (Goal $e0 bed) (Member $e0 $v0))

;; p204112  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(And (Goal $e0 home) (Member $e0 $v0))

;; p204113  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.724  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000518 tierB-000972 tierB-001628
(And (GroupOf $x0 $v0) (LocatedIn $x0 here))

;; p204114  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000723
(And (GroupOf $x0 $v0) (ProportionOf $x0 $x1 some))

;; p204115  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.793  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000723
(And (GroupOf $x0 $v0) (ProportionOf $x1 $x0 some))

;; p204116  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.243  tiers tierB  dominated
;;   e.g. tierB-000980 tierB-001449 tierB-001479
(And (GroupOf $x0 $v0) (Stimulus $e0 $x0))

;; p204117  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000783 tierB-000816 tierB-001909
(And (In $e0 $e1) (Member $e0 $v0))

;; p204118  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000783 tierB-000816 tierB-001909
(And (In $e0 $e1) (Member $e1 $v0))

;; p204119  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.167  tiers tierB  dominated
;;   e.g. tierB-000067 tierB-001061 tierB-001994
(And (In $e0 $v0) (Past $e0))

;; p204120  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.497  tiers tierB  dominated
;;   e.g. tierB-000326 tierB-000742 tierB-001069
(And (In $e0 $v0) (Theme $e0 $x0))

;; p204121  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.989  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (Inheritance $x0 $v0) (SubsetOf $x0 $x1))

;; p204122  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.703  tiers tierB  dominated
;;   e.g. tierB-000369 tierB-001433 tierB-001765
(And (Instrument $e0 $v0) (Ongoing $e0))

;; p204123  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.416  tiers tierB  dominated
;;   e.g. tierB-000561 tierB-001168 tierB-001218
(And (Like $e0 $v0) (Past $e0))

;; p204124  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.539  tiers tierB  dominated
;;   e.g. tierB-000489 tierB-000707 tierB-001049
(And (LocatedIn $x0 $v0) (Location $e0 $x0))

;; p204125  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.324  tiers tierB  dominated
;;   e.g. tierB-000262 tierB-001491 tierB-001567
(And (LocatedIn $x0 $v0) (Patient $e0 $x0))

;; p204126  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.157  tiers tierB  dominated
;;   e.g. tierB-001084 tierB-001334 tierB-001708
(And (Location $e0 $v0) (Ongoing $e0))

;; p204127  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.424  tiers tierB  dominated
;;   e.g. tierB-000483 tierB-000585 tierB-001956
(And (Location $e0 $v0) (Theme $e0 $x0))

;; p204128  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.616  tiers tierB  dominated
;;   e.g. tierB-000830 tierB-000910 tierB-001621
(And (Location $e0 $v0) (Theme $e1 $e0))

;; p204129  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.855  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000144 tierB-000212 tierB-000419
(And (Manner $e0 $v0) (Member $e0 work))

;; p204130  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000374 tierB-000398 tierB-001800
(And (Manner $e0 carefully) (Member $e0 $v0))

;; p204131  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000465 tierB-000466 tierB-001149
(And (Manner $e0 really) (Member $e0 $v0))

;; p204132  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.514  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000778 tierB-001536
(And (Measure $e0 $v0 <num> year) (Past $e0))

;; p204133  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000004 tierB-000593 tierB-000647
(And (Measure $e0 duration <num> day) (Member $e0 $v0))

;; p204134  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.230  tiers tierB  dominated
;;   e.g. tierB-000210 tierB-000504 tierB-000762
(And (Member $e0 $v0) (Only $v0 $e0))

;; p204135  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB
;;   e.g. tierB-000908 tierB-000997 tierB-001031
(And (Member $e0 $v0) (Start $e0 (Year <num>)))

;; p204136  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000251 tierB-000828 tierB-000903
(And (Member $e0 $v0) (Time $e0 $x0))

;; p204137  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000559 tierB-000917 tierB-000939
(And (Member $e0 $v0) (Time $e0 (Weekday sunday)))

;; p204138  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000238 tierB-000303 tierB-000598
(And (Member $e0 $v0) (Time $e0 morning))

;; p204139  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000168 tierB-000699 tierB-001440
(And (Member $e0 $v0) (Time $e0 soon))

;; p204140  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000378 tierB-001726
(And (Member $e0 $v0) (Time $e0 tomorrow))

;; p204141  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000193 tierB-001094 tierB-001397
(And (Member $e0 $v0) (With $e0 $x0))

;; p204142  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.928  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000769 tierB-001260 tierB-001482
(And (Member $e0 provide) (Theme $e0 $v0))

;; p204143  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.871  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000292 tierB-001544
(And (Member $e0 study) (Theme $e0 $v0))

;; p204144  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.172  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000376 tierB-000678 tierB-001503
(And (Member $x0 $v0) (Member $x0 beauty))

;; p204145  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.035  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000083 tierB-000541 tierB-000956
(And (Member $x0 $v0) (Member $x0 box))

;; p204146  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000205 tierB-000261 tierB-000362
(And (Member $x0 $v0) (Member $x0 cold))

;; p204147  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000246 tierB-001432 tierB-001488
(And (Member $x0 $v0) (Member $x0 easy))

;; p204148  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.172  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000783 tierB-001280 tierB-001822
(And (Member $x0 $v0) (Member $x0 girl))

;; p204149  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000522 tierB-001329 tierB-001470
(And (Member $x0 $v0) (Member $x0 great))

;; p204150  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.035  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000608 tierB-000728 tierB-001068
(And (Member $x0 $v0) (Member $x0 language))

;; p204151  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000048 tierB-001666 tierB-001925
(And (Member $x0 $v0) (Member $x0 large))

;; p204152  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000288 tierB-001762 tierB-001848
(And (Member $x0 $v0) (Member $x0 law))

;; p204153  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000073 tierB-000352 tierB-000695
(And (Member $x0 $v0) (Member $x0 noise))

;; p204154  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.172  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000567 tierB-000932 tierB-001845
(And (Member $x0 $v0) (Member $x0 original))

;; p204155  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000202 tierB-000792 tierB-001738
(And (Member $x0 $v0) (Member $x0 other))

;; p204156  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000005 tierB-000617 tierB-001716
(And (Member $x0 $v0) (Member $x0 population))

;; p204157  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.863  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000983 tierB-001958 tierB-001966
(And (Member $x0 $v0) (Member $x0 road))

;; p204158  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.656  tiers tierB  dominated
;;   e.g. tierB-000937 tierB-001124 tierB-001940
(And (Member $x0 $v0) (Member $x0 sky))

;; p204159  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000156 tierB-001223 tierB-001453
(And (Member $x0 $v0) (Member $x0 strong))

;; p204160  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000510 tierB-000931 tierB-001569
(And (Member $x0 $v0) (Member $x0 valuable))

;; p204161  star  support 3 (occ 3)  size 2  lifted 1  nisurp 1.484  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000205 tierB-000748 tierB-000790
(And (Member $x0 $v0) (Member $x0 weather))

;; p204162  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000367 tierB-000832 tierB-001890
(And (Member $x0 $v0) (Member $x0 yellow))

;; p204163  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000602 tierB-001773 tierB-001870
(And (Member $x0 $v0) (Member $x0 young))

;; p204164  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000730 tierB-000998 tierB-001707
(And (Member $x0 $v0) (Most good $x0 $v0))

;; p204165  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-001518 tierB-001745
(And (Member $x0 $v0) (RestOf $x1 $x0))

;; p204166  star  support 3 (occ 5)  size 2  lifted 1  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000251 tierB-000828 tierB-000903
(And (Member $x0 $v0) (Time $e0 $x0))

;; p204167  star  support 3 (occ 6)  size 2  lifted 1  nisurp 0.923  tiers tierB  dominated
;;   e.g. tierB-000957 tierB-001014 tierB-001895
(And (Member $x0 thing) (Might (Member $x0 $v0)))

;; p204168  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.244  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000716 tierB-000770 tierB-000960
(And (Member $x0 thing) (Past (Member $x0 $v0)))

;; p204169  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.627  tiers tierB  dominated
;;   e.g. tierB-000268 tierB-000366 tierB-001396
(And (Obligated $e0) (Theme $e0 $v0))

;; p204170  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.661  tiers tierB  dominated
;;   e.g. tierB-000456 tierB-000955 tierB-001287
(And (Patient $e0 $v0) (Source $e0 $x0))

;; p204171  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.803  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000404 tierB-001431
(And (Patient $e0 $v0) (To $e1 $e0))

;; p204172  star  support 3 (occ 4)  size 2  lifted 1  nisurp 0.555  tiers tierB  dominated
;;   e.g. tierB-000438 tierB-000485 tierB-001386
(And (Source $e0 $x0) (Theme $e0 $v0))

;; p204173  star  support 3 (occ 3)  size 2  lifted 1  nisurp 0.742  tiers tierB  dominated
;;   e.g. tierB-000171 tierB-000229 tierB-000282
(And (Theme $e0 $v0) (To $e1 $e0))

;; p204174  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.565  tiers tierB  dominated
;;   e.g. tierB-000313 tierB-000393 tierB-000791
(And (Agent $e0 $v0) (Every $e0 <num> $v1))

;; p204175  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.565  tiers tierB  dominated
;;   e.g. tierB-000199 tierB-001270 tierB-001677
(And (Agent $e0 $v0) (In $e0 $v1))

;; p204176  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.819  tiers tierB  dominated
;;   e.g. tierB-000253 tierB-000778 tierB-001084
(And (Agent $e0 $v0) (Measure $e0 $v1 <num> year))

;; p204177  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.350  tiers tierB  dominated
;;   e.g. tierB-000584 tierB-001134 tierB-001345
(And (Agent $e0 $x0) (Measure $e0 $v0 <num> $v1))

;; p204178  star  support 3 (occ 4)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000281 tierB-000539 tierB-001966
(And (CoAgent $e0 $v0) (Member $e0 $v1))

;; p204179  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.777  tiers tierB  dominated
;;   e.g. tierB-000426 tierB-001446 tierB-001708
(And (Degree $e0 $v0 $v1) (Ongoing $e0))

;; p204180  star  support 3 (occ 4)  size 2  lifted 2  nisurp 0.291  tiers tierB  dominated
;;   e.g. tierB-000263 tierB-000546 tierB-001546
(And (Degree $x0 $v0 $v1) (LocatedIn $x0 $x1))

;; p204181  star  support 3 (occ 3)  size 2  lifted 2  nisurp 1.848  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-001103 tierB-001847
(And (Degree $x0 $v0 $v1) (Theme $e0 $x0))

;; p204182  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.240  tiers tierB  dominated
;;   e.g. tierB-000518 tierB-000604 tierB-001546
(And (Degree $x0 $v0 excessive) (GroupOf $x0 $v1))

;; p204183  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000263 tierB-000775 tierB-001594
(And (Degree $x0 $v0 much) (Member $x0 $v1))

;; p204184  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000107 tierB-000156 tierB-000745
(And (Degree $x0 $v0 sufficient) (Member $x0 $v1))

;; p204185  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000872 tierB-001466 tierB-001500
(And (Degree $x0 beautiful $v0) (Member $x0 $v1))

;; p204186  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.842  tiers tierB  dominated
;;   e.g. tierB-000238 tierB-000598 tierB-000917
(And (Every $e0 <num> $v0) (Time $e0 $v1))

;; p204187  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.988  tiers tierB  dominated
;;   e.g. tierB-000559 tierB-000791 tierB-000917
(And (Every $e0 <num> $v0) (Time $e0 (Weekday $v1)))

;; p204188  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.576  tiers tierB
;;   e.g. tierB-000681 tierB-000758 tierB-001683
(And (Experiencer $e0 $v0) (Location $e0 $v1))

;; p204189  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.950  tiers tierB  dominated
;;   e.g. tierB-000846 tierB-001090 tierB-001390
(And (Experiencer $e0 $v0) (Theme $e0 (And (Agent $x0 $v0) (Member $x0 $v1) (Theme $x0 $x1))))

;; p204190  star  support 3 (occ 6)  size 2  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000522 tierB-001264 tierB-001578
(And (For $x0 $v0) (Member $x0 $v1))

;; p204191  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.655  tiers tierB  dominated
;;   e.g. tierB-000029 tierB-000427 tierB-000554
(And (Goal $e0 $v0) (Theme $e0 $v1))

;; p204192  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.684  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-001570 tierB-001588
(And (Goal $e0 $v0) (Time $e0 $v1))

;; p204193  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.995  tiers tierB  dominated
;;   e.g. tierB-000384 tierB-000723 tierB-001941
(And (Inheritance $x0 $v0) (ProportionOf $x0 $x1 $v1))

;; p204194  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.552  tiers tierB  dominated
;;   e.g. tierB-000237 tierB-000378 tierB-001440
(And (Location $e0 $v0) (Time $e0 $v1))

;; p204195  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.708  tiers tierB  dominated
;;   e.g. tierB-000329 tierB-001302 tierB-001487
(And (Measure $e0 $v0 (ParticleFromNormal <num> <num>) $v1) (Past $e0))

;; p204196  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.703  tiers tierB  dominated
;;   e.g. tierB-000647 tierB-001084 tierB-001345
(And (Measure $e0 $v0 <num> $v1) (Ongoing $e0))

;; p204197  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.452  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000690 tierB-001381
(And (Measure $e0 $v0 <num> $v1) (Patient $e0 $x0))

;; p204198  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000593 tierB-000647
(And (Measure $e0 $v0 <num> day) (Member $e0 $v1))

;; p204199  star  support 3 (occ 4)  size 2  lifted 2  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000037 tierB-000394 tierB-000405
(And (Measure $x0 $v0 <num> year) (Member $x0 $v1))

;; p204200  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.379  tiers tierB  signal subtree-collapse
;;   e.g. tierB-000149 tierB-001554 tierB-001986
(And (Measure $x0 distance <num> $v0) (Member $x0 $v1))

;; p204201  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000177 tierB-000297 tierB-001928
(And (Member $e0 $v0) (On $e0 $v1))

;; p204202  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000288 tierB-000940 tierB-001603
(And (Member $e0 $v0) (Recipient $e0 $v1))

;; p204203  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.473  tiers tierB
;;   e.g. tierB-000191 tierB-001172 tierB-001686
(And (Member $e0 $v0) (Theme $e0 (Member $x0 $v1)))

;; p204204  star  support 3 (occ 7)  size 2  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000918 tierB-001042 tierB-001651
(And (Member $x0 $v0) (Of $x0 $v1))

;; p204205  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.379  tiers tierB  dominated
;;   e.g. tierB-000508 tierB-000703 tierB-001347
(And (Member $x0 $v0) (SameDegree $v1 $x0 $x1))

;; p204206  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.379  tiers tierB
;;   e.g. tierB-000508 tierB-000703 tierB-001347
(And (Member $x0 $v0) (SameDegree $v1 $x1 $x0))

;; p204207  star  support 3 (occ 3)  size 2  lifted 2  nisurp 0.994  tiers tierB  dominated
;;   e.g. tierB-000957 tierB-001014 tierB-001895
(And (Might (Member $x0 $v0)) (Might (Member $x0 $v1)))

;; p204208  star  support 3 (occ 3)  size 2  lifted 3  nisurp 0.663  tiers tierB
;;   e.g. tierB-000146 tierB-000205 tierB-000518
(And (Degree $x0 $v0 $v1) (LocatedIn $x0 $v2))

;; p204209  star  support 3 (occ 3)  size 2  lifted 3  nisurp 0.379  tiers tierB
;;   e.g. tierB-001039 tierB-001104 tierB-001871
(And (Directive (And (Agent $x0 $v0) (Member $x0 $v1) (Theme $x0 $x1))) (Member $x1 $v2))

;; p204210  star  support 3 (occ 3)  size 2  lifted 3  nisurp 0.473  tiers tierB  dominated
;;   e.g. tierB-000329 tierB-001302 tierB-001487
(And (Measure $e0 $v0 (ParticleFromNormal <num> <num>) $v1) (Member $e0 $v2))

;; p204211  star  support 3 (occ 3)  size 2  lifted 3  nisurp 0.473  tiers tierB
;;   e.g. tierB-001102 tierB-001452 tierB-001879
(And (MeasureAtLeast $e0 $v0 <num> $v1) (Member $e0 $v2))

;; p204212  star  support 3 (occ 3)  size 2  lifted 3  nisurp 1.484  tiers tierB
;;   e.g. tierB-000650 tierB-001458 tierB-001817
(And (Member $x0 $v0) (Most $v1 $x0 $v2))

;; p204213  star  support 3 (occ 3)  size 2  lifted 3  nisurp 0.172  tiers tierB  dominated
;;   e.g. tierB-000065 tierB-000984 tierB-001521
(And (Member $x0 $v0) (Probably (Degree $x0 $v1 $v2)))

;; p204214  star  support 3 (occ 3)  size 2  lifted 3  nisurp 0.879  tiers tierB  dominated
;;   e.g. tierB-000646 tierB-000820 tierB-001522
(And (Past (Degree $x0 $v0 $v1)) (Past (Member $x0 $v2)))

;; p204215  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000248 tierB-000343 tierB-000786
(Against $e0 $x0)

;; p204216  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-001044 tierB-001117 tierB-001767
(Agent $e0 adriano)

;; p204217  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000209 tierB-000651 tierB-001538
(Agent $e0 baya)

;; p204218  star  support 3 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000078 tierB-000201 tierB-000576
(Agent $e0 daniel)

;; p204219  star  support 3 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000117 tierB-000173 tierB-000827
(Agent $e0 david)

;; p204220  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000025 tierB-000524 tierB-000563
(Agent $e0 elias)

;; p204221  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000148 tierB-000389 tierB-000487
(Agent $e0 felix)

;; p204222  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000791 tierB-000987 tierB-001675
(Agent $e0 gustavo)

;; p204223  star  support 3 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000406 tierB-000412 tierB-000564
(Agent $e0 ivan)

;; p204224  star  support 3 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000313 tierB-000327 tierB-001449
(Agent $e0 linda)

;; p204225  star  support 3 (occ 6)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000075 tierB-000239 tierB-000400
(Agent $e0 mark)

;; p204226  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000450 tierB-000588
(Agent $e0 martino)

;; p204227  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000002 tierB-000021 tierB-000048
(Agent $e0 mary)

;; p204228  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000667 tierB-001023 tierB-001418
(Agent $e0 matthew)

;; p204229  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000209 tierB-000219 tierB-000257
(Agent $e0 mennad)

;; p204230  star  support 3 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000252 tierB-000929 tierB-001094
(Agent $e0 michael)

;; p204231  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000138 tierB-000706 tierB-001172
(Agent $e0 pietro)

;; p204232  star  support 3 (occ 5)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000137 tierB-000240 tierB-000273
(Agent $e0 william)

;; p204233  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000001 tierB-000008 tierB-000013
(Agent $e0 ziri)

;; p204234  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000340 tierB-001316 tierB-001572
(At $e0 $x0)

;; p204235  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000374 tierB-001696 tierB-001867
(Beneficiary $e0 $x0)

;; p204236  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000463 tierB-001314 tierB-001337
(But $e0 $e1)

;; p204237  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000925 tierB-000964 tierB-001832
(But $e0 $x0)

;; p204238  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000791 tierB-000917 tierB-001051
(Every $e0 <num> week)

;; p204239  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000393 tierB-000559 tierB-001967
(Every $e0 <num> year)

;; p204240  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-001016 tierB-001523 tierB-001966
(Experiencer $e0 $e1)

;; p204241  star  support 3 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000012 tierB-001418 tierB-001496
(Goal $e0 bed)

;; p204242  star  support 3 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000575 tierB-001086 tierB-001743
(Goal $e0 home)

;; p204243  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000207 tierB-001260 tierB-001730
(GroupOf $x0 city)

;; p204244  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000335 tierB-000338 tierB-000815
(GroupOf $x0 cookie)

;; p204245  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000796 tierB-001519 tierB-001955
(GroupOf $x0 dish)

;; p204246  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000066 tierB-000267 tierB-000550
(GroupOf $x0 friend)

;; p204247  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000120 tierB-000409 tierB-001591
(GroupOf $x0 measure)

;; p204248  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000193 tierB-000414 tierB-001479
(GroupOf $x0 noise)

;; p204249  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001351 tierB-001426 tierB-001449
(GroupOf $x0 question)

;; p204250  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000018 tierB-000913 tierB-001699
(GroupOf $x0 road)

;; p204251  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001394 tierB-001632 tierB-001886
(GroupOf $x0 tree)

;; p204252  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000864 tierB-001295 tierB-001760
(GroupOf $x0 woman)

;; p204253  star  support 3 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000783 tierB-000816 tierB-001909
(In $e0 $e1)

;; p204254  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000374 tierB-000398 tierB-001800
(Manner $e0 carefully)

;; p204255  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000465 tierB-000466 tierB-001149
(Manner $e0 really)

;; p204256  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000593 tierB-000647
(Measure $e0 duration <num> day)

;; p204257  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000037 tierB-000128 tierB-000974
(Member $e0 approve)

;; p204258  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000345 tierB-000673 tierB-001688
(Member $e0 attack)

;; p204259  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000171 tierB-000246 tierB-000674
(Member $e0 avoid)

;; p204260  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001605 tierB-001610 tierB-001928
(Member $e0 base)

;; p204261  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000906 tierB-001568 tierB-001812
(Member $e0 bear)

;; p204262  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000565 tierB-000904 tierB-001920
(Member $e0 beautiful)

;; p204263  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-001302 tierB-001641 tierB-001694
(Member $e0 break_out)

;; p204264  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000427 tierB-000636 tierB-001013
(Member $e0 bring)

;; p204265  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000063 tierB-000932 tierB-001867
(Member $e0 build)

;; p204266  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000344 tierB-000930 tierB-001735
(Member $e0 climb)

;; p204267  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000089 tierB-000728 tierB-000863
(Member $e0 create)

;; p204268  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000925 tierB-001535 tierB-001648
(Member $e0 difficult)

;; p204269  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000781 tierB-001245 tierB-001250
(Member $e0 draw)

;; p204270  star  support 3 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000209 tierB-000946 tierB-000993
(Member $e0 drink)

;; p204271  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000228 tierB-001384 tierB-001512
(Member $e0 grow)

;; p204272  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000329 tierB-000692 tierB-001801
(Member $e0 hold_up)

;; p204273  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000689 tierB-001449 tierB-001843
(Member $e0 know)

;; p204274  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000229 tierB-000282 tierB-000608
(Member $e0 learn)

;; p204275  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000759 tierB-001149 tierB-001989
(Member $e0 mean)

;; p204276  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000334 tierB-001040 tierB-001072
(Member $e0 pick_up)

;; p204277  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000208 tierB-001358 tierB-001995
(Member $e0 produce)

;; p204278  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000470 tierB-001120 tierB-001386
(Member $e0 pull)

;; p204279  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000117 tierB-001082 tierB-001488
(Member $e0 reach)

;; p204280  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000783 tierB-001221 tierB-001637
(Member $e0 read)

;; p204281  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000115 tierB-000686 tierB-000980
(Member $e0 see)

;; p204282  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001218 tierB-001933 tierB-001977
(Member $e0 shine)

;; p204283  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000256 tierB-000813 tierB-001813
(Member $e0 shoot)

;; p204284  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000827 tierB-001156 tierB-001901
(Member $e0 sing)

;; p204285  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000935 tierB-001202 tierB-001970
(Member $e0 solve)

;; p204286  star  support 3 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000053 tierB-000271 tierB-001068
(Member $e0 speak)

;; p204287  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000383 tierB-000482 tierB-001027
(Member $e0 stick)

;; p204288  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000132 tierB-000147 tierB-001471
(Member $e0 take_off)

;; p204289  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000114 tierB-000816 tierB-001909
(Member $e0 understand)

;; p204290  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000002 tierB-000712 tierB-001557
(Member $e0 wait)

;; p204291  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001318 tierB-001396 tierB-001801
(Member $e0 wear)

;; p204292  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000145 tierB-000730 tierB-001345
(Member $e0 win)

;; p204293  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000033 tierB-000692 tierB-001806
(Member $x0 accident)

;; p204294  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000285 tierB-000360 tierB-001043
(Member $x0 atmosphere)

;; p204295  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000170 tierB-001843 tierB-001964
(Member $x0 author)

;; p204296  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000103 tierB-000343 tierB-001092
(Member $x0 ball)

;; p204297  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000221 tierB-001081 tierB-001775
(Member $x0 beach)

;; p204298  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000172 tierB-001586 tierB-001638
(Member $x0 bottom)

;; p204299  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000676 tierB-001385 tierB-001688
(Member $x0 building)

;; p204300  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000330 tierB-000619 tierB-001040
(Member $x0 camera)

;; p204301  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000476 tierB-000687 tierB-001925
(Member $x0 ceiling)

;; p204302  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000143 tierB-000202 tierB-000739
(Member $x0 church)

;; p204303  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000205 tierB-000261 tierB-000362
(Member $x0 cold)

;; p204304  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000387 tierB-000781 tierB-001000
(Member $x0 concert)

;; p204305  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000462 tierB-000942 tierB-001663
(Member $x0 cook)

;; p204306  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000207 tierB-001546 tierB-001928
(Member $x0 country)

;; p204307  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000251 tierB-001146 tierB-001519
(Member $x0 day)

;; p204308  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001002 tierB-001053 tierB-001186
(Member $x0 desk)

;; p204309  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000025 tierB-001455 tierB-001831
(Member $x0 difference)

;; p204310  star  support 3 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000285 tierB-001022 tierB-001529
(Member $x0 different)

;; p204311  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000021 tierB-001587 tierB-001634
(Member $x0 dress)

;; p204312  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001259 tierB-001322 tierB-001582
(Member $x0 earth)

;; p204313  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000246 tierB-001432 tierB-001488
(Member $x0 easy)

;; p204314  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000949 tierB-001232 tierB-001336
(Member $x0 fact)

;; p204315  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000774 tierB-001153 tierB-001490
(Member $x0 field)

;; p204316  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000505 tierB-001017 tierB-001295
(Member $x0 film)

;; p204317  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000872 tierB-000923 tierB-000977
(Member $x0 flower)

;; p204318  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000141 tierB-000609 tierB-000929
(Member $x0 forest)

;; p204319  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000423 tierB-000871 tierB-001399
(Member $x0 fox)

;; p204320  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000498 tierB-001610 tierB-001845
(Member $x0 game)

;; p204321  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000548 tierB-001800 tierB-001885
(Member $x0 government)

;; p204322  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000522 tierB-001329 tierB-001470
(Member $x0 great)

;; p204323  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000248 tierB-000551 tierB-000664
(Member $x0 king)

;; p204324  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000604 tierB-001291 tierB-001403
(Member $x0 kitchen)

;; p204325  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000048 tierB-001666 tierB-001925
(Member $x0 large)

;; p204326  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000288 tierB-001762 tierB-001848
(Member $x0 law)

;; p204327  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000172 tierB-001120 tierB-001383
(Member $x0 line)

;; p204328  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-001573 tierB-001670 tierB-001938
(Member $x0 living_room)

;; p204329  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001423 tierB-001647 tierB-001653
(Member $x0 museum)

;; p204330  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000073 tierB-000352 tierB-000695
(Member $x0 noise)

;; p204331  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000573 tierB-000722 tierB-001257
(Member $x0 ocean)

;; p204332  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000252 tierB-000332 tierB-001572
(Member $x0 opportunity)

;; p204333  star  support 3 (occ 4)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000202 tierB-000792 tierB-001738
(Member $x0 other)

;; p204334  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000172 tierB-001250 tierB-001638
(Member $x0 page)

;; p204335  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000569 tierB-001239 tierB-001331
(Member $x0 park)

;; p204336  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000049 tierB-001263 tierB-001498
(Member $x0 patient)

;; p204337  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000394 tierB-000535 tierB-000714
(Member $x0 plant)

;; p204338  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000150 tierB-000256 tierB-000547
(Member $x0 police)

;; p204339  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000005 tierB-000617 tierB-001716
(Member $x0 population)

;; p204340  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000224 tierB-000306 tierB-000777
(Member $x0 report)

;; p204341  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000521 tierB-000902 tierB-001180
(Member $x0 right)

;; p204342  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000633 tierB-001110 tierB-001919
(Member $x0 roof)

;; p204343  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000647 tierB-000975 tierB-001651
(Member $x0 small)

;; p204344  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000230 tierB-000503 tierB-000734
(Member $x0 spider)

;; p204345  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000081 tierB-000706 tierB-001699
(Member $x0 station)

;; p204346  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000134 tierB-000775 tierB-001531
(Member $x0 storm)

;; p204347  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000156 tierB-001223 tierB-001453
(Member $x0 strong)

;; p204348  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000700 tierB-000749 tierB-001219
(Member $x0 teacher)

;; p204349  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-001108 tierB-001266 tierB-001573
(Member $x0 theater)

;; p204350  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000208 tierB-000356 tierB-001166
(Member $x0 top)

;; p204351  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000128 tierB-000437 tierB-001878
(Member $x0 treaty)

;; p204352  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000694 tierB-000745 tierB-001223
(Member $x0 truth)

;; p204353  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000510 tierB-000931 tierB-001569
(Member $x0 valuable)

;; p204354  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000039 tierB-001055 tierB-001752
(Member $x0 wood)

;; p204355  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000879 tierB-001389 tierB-001980
(Member $x0 work)

;; p204356  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000367 tierB-000832 tierB-001890
(Member $x0 yellow)

;; p204357  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000602 tierB-001773 tierB-001870
(Member $x0 young)

;; p204358  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000664 tierB-001207 tierB-001292
(Past (LocatedIn $x0 there))

;; p204359  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB
;;   e.g. tierB-000495 tierB-001170 tierB-001521
(Probably (Member $x0 good))

;; p204360  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000124 tierB-000196 tierB-000723
(ProportionOf $x0 $x1 some)

;; p204361  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000229 tierB-001518 tierB-001745
(RestOf $x0 $x1)

;; p204362  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000908 tierB-000997 tierB-001031
(Start $e0 (Year <num>))

;; p204363  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000251 tierB-000828 tierB-000903
(Time $e0 $x0)

;; p204364  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000559 tierB-000917 tierB-000939
(Time $e0 (Weekday sunday))

;; p204365  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000238 tierB-000303 tierB-000598
(Time $e0 morning)

;; p204366  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000168 tierB-000699 tierB-001440
(Time $e0 soon)

;; p204367  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000100 tierB-000378 tierB-001726
(Time $e0 tomorrow)

;; p204368  star  support 3 (occ 3)  size 1  lifted 0  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000193 tierB-001094 tierB-001397
(With $e0 $x0)

;; p204369  star  support 3 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000281 tierB-000539 tierB-001966
(CoAgent $e0 $v0)

;; p204370  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000263 tierB-000775 tierB-001594
(Degree $x0 $v0 much)

;; p204371  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000107 tierB-000156 tierB-000745
(Degree $x0 $v0 sufficient)

;; p204372  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000872 tierB-001466 tierB-001500
(Degree $x0 beautiful $v0)

;; p204373  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000522 tierB-001264 tierB-001578
(For $x0 $v0)

;; p204374  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000004 tierB-000593 tierB-000647
(Measure $e0 $v0 <num> day)

;; p204375  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000037 tierB-000394 tierB-000405
(Measure $x0 $v0 <num> year)

;; p204376  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000149 tierB-001554 tierB-001986
(Measure $x0 distance <num> $v0)

;; p204377  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000730 tierB-000998 tierB-001707
(Most good $x0 $v0)

;; p204378  star  support 3 (occ 4)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000918 tierB-001042 tierB-001651
(Of $x0 $v0)

;; p204379  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000177 tierB-000297 tierB-001928
(On $e0 $v0)

;; p204380  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB
;;   e.g. tierB-001066 tierB-001379 tierB-001444
(On $x0 $v0)

;; p204381  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000994 tierB-001549 tierB-001850
(Past (Possession $v0 $x0))

;; p204382  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000288 tierB-000940 tierB-001603
(Recipient $e0 $v0)

;; p204383  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000508 tierB-000703 tierB-001347
(SameDegree $v0 $x0 $x1)

;; p204384  star  support 3 (occ 3)  size 1  lifted 1  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000191 tierB-001172 tierB-001686
(Theme $e0 (Member $x0 $v0))

;; p204385  star  support 3 (occ 3)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000127 tierB-000595 tierB-001146
(And (Agent $x0 $x1) (Member $x0 $v0) (Theme $x0 $v1)) ~NEG

;; p204386  star  support 3 (occ 3)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000604 tierB-001100 tierB-001830
(And (For $x0 $v0) (Member $x0 $v1)) ~NEG

;; p204387  star  support 3 (occ 3)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000736 tierB-001121 tierB-001475
(And (Member $x0 $v0) (Member $x0 $v1)) ~NEG

;; p204388  star  support 3 (occ 3)  size 1  lifted 2  nisurp —  tiers tierB  dominated
;;   e.g. tierB-001039 tierB-001104 tierB-001871
(Directive (And (Agent $x0 $v0) (Member $x0 $v1) (Theme $x0 $x1)))

;; p204389  star  support 3 (occ 3)  size 1  lifted 2  nisurp —  tiers tierB
;;   e.g. tierB-000331 tierB-000443 tierB-001242
(Directive (And (Member $x0 $v0) (Member $x1 $v1) (Theme $x0 $x1)))

;; p204390  star  support 3 (occ 3)  size 1  lifted 2  nisurp —  tiers tierB  dominated
;;   e.g. tierB-000329 tierB-001302 tierB-001487
(Measure $e0 $v0 (ParticleFromNormal <num> <num>) $v1)

;; p204391  star  support 3 (occ 3)  size 1  lifted 2  nisurp —  tiers tierB  dominated
;;   e.g. tierB-001102 tierB-001452 tierB-001879
(MeasureAtLeast $e0 $v0 <num> $v1)

