accessing
do: aBlock
	| obj |
	tally = 0 ifTrue:[^self].
	1 to: array size do:[:i|
		((obj := array at: i) == nil or:[obj == flag]) ifFalse:[aBlock value: obj].
	].