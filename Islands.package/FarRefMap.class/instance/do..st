accessing
do: aBlock

	tally = 0 ifTrue:[^self].
	mutex critical: [| obj |
		1 to: array size do:[:i|
			((obj := array at: i) == nil or:[obj == flag]) ifFalse:[aBlock value: obj].
		].
	].