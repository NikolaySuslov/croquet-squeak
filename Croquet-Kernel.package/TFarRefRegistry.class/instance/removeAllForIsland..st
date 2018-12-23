accessing
removeAllForIsland: island
	"I'm not sure if I should use flag or nil to force remove the elements."

	| obj |
	tally = 0
		ifTrue:[^self].
	1
		to: array size
		do:[ :i |
			((obj := array at: i) == nil or:[obj == flag])
				ifFalse:[
					(obj sameIslandAs: island)
						ifTrue: [
							array at: i put: flag .
							tally := tally - 1.
						 ]
				].
		].