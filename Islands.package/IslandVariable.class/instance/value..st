accessing
value: newValue
	"Assign a new value to this variable. Conceptually, we always store a far ref here but optimize this for #passByIdentity: (clients cannot distinguish this; try it)"
	| v |
	(IslandArgumentCopier isPassByIdentity: newValue)
		ifTrue:[v := newValue]
		ifFalse:[
			"Uncomment this to gather statistics"
			"WriteStatistics ifNotNil:[WriteStatistics add: key]."
			v := newValue island asFarRef: newValue.
		].
	value := v. "Write value atomically"
	^newValue
