accessing
frameBox

	| r |
	r := baseRadius> topRadius ifTrue:[baseRadius] ifFalse:[topRadius].
	^ TBox min:(r negated@0.0@r negated) max:(r@height@r).