accessing
squaredDistanceFrom: aMatrix
	| sum |
	sum := 0.0.
	1 to: 4 do:[:i|
		1 to: 4 do:[:j|
			sum := sum + ((self at: i at: j) - (aMatrix at: i at: j)) squared]].
	^sum