accessing
trianglesDo: aBlock
	"Evaluate aBlock with triangular faces"
	| face |
	vertices size = 3 ifTrue:[^aBlock value: self].
	3 to: vertices size do:[:i|
		face := self class with: (vertices at: 1) with: (vertices at: i-1) with: (vertices at: i).
		face isDegenerate ifFalse:[aBlock value: face].
	].