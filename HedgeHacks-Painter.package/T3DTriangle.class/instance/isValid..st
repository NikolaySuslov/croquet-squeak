testing
isValid: aBool
	flags := aBool ifFalse:[flags bitOr: 1] ifTrue:[flags bitClear: 1].