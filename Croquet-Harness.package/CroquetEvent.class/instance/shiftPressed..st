accessing
shiftPressed: sp
	buttons := sp ifTrue:[buttons bitOr: 8] ifFalse:[buttons bitClear: 8].