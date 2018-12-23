solving
inplaceDecomposeLU
	"Decompose the receiver in place by using gaussian elimination w/o pivot search"
	| x |
	1 to: 4 do:[:j|
		"i-th equation (row)"
		j+1 to: 4 do:[:i|
			x := (self at: i at: j) / (self at: j at: j).
			j to: 4 do:[:k|
				self at: i at: k put: (self at: i at: k) - ((self at: j at: k) * x)].
			self at: i at: j put: x]].
