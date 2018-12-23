properties
removeProperty: propName
	| value |
	properties == nil ifTrue: [^ nil].
	value := properties removeKey: propName ifAbsent: [].
	properties size == 0 ifTrue: [properties := nil].
	^value