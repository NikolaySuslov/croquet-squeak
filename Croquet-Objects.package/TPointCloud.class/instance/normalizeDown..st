initialize
normalizeDown: aFloatArray

	"assumes values >= 0.
     scales the array s.t. the largest value is 1.0"

	| biggest targ |

	targ := 0.0.

	aFloatArray size < 1 ifTrue: [^nil].

	biggest := 1.0.

	aFloatArray do: [:n|
		n < biggest ifTrue: [
			biggest := n.
			].
		].

   biggest = 0.0 ifTrue: [
		1 to: aFloatArray size do: [:n|
			aFloatArray at: n put: 0.0.
			].		
		]
	ifFalse: [
		1 to: aFloatArray size do: [:n|
			aFloatArray at: n put: ((aFloatArray at: n) + (targ-biggest)).
			].
"		aFloatArray *= (1.0 / biggest)."
		].


	