accessing
commandKeyPressed: aBool

	buttons := aBool ifTrue:[buttons bitOr: 64] ifFalse:[buttons bitClear: 64]