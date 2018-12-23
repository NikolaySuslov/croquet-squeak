properties
valueOfProperty: propName ifAbsent: aBlock
	properties == nil ifTrue: [^ aBlock value].
	^ properties at: propName ifAbsent: [^ aBlock value]