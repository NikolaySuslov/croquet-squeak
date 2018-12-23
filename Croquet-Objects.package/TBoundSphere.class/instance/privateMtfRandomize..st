mini ball
privateMtfRandomize: idxList
	"Randomize input"
	| max rnd j tmp |
	max := idxList size.
	rnd := Random new" seed: 16r2134567".
	1 to: max do:[:i|
		j := (rnd next * i) truncated +1.
		tmp := idxList at: i.
		idxList at: i put: (idxList at: j).
		idxList at: j put: tmp.
	].