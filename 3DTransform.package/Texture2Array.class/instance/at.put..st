accessing
at: index put: value
	value isPoint
		ifTrue:[super at: index put: (Vector2 u: value x v: value y)]
		ifFalse:[super at: index put: value].
	^value