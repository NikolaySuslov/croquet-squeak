float tests
copysign: x from: y
	"Answer a float with the magnitude of x and the sign of y"
	| copy word1 |
	copy := x clone.
	word1 := ((x basicAt: 1) bitAnd: 16r7FFFFFFF) bitOr: ((y asFloat basicAt: 1) bitAnd: 16r80000000).
	copy basicAt: 1 put: word1.
	^copy