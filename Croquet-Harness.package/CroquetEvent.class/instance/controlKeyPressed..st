accessing
controlKeyPressed: cp

	buttons := cp ifTrue:[buttons bitOr: 16] ifFalse:[buttons bitClear: 16].