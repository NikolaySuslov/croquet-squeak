properties
hasProperty: propName
	"Answer whether the receiver has the given property.  Deemed to have it only if I have a property dictionary entry for it and that entry is neither nil nor false"
	| prop |
	properties == nil ifTrue: [^ false].
	prop := properties at: propName ifAbsent: [nil].
	prop == nil ifTrue: [^ false].
	prop == false ifTrue: [^ false].
	^ true