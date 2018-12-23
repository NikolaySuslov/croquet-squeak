testing
isSleeve: aBool
	flags := aBool ifTrue:[flags bitOr: 4] ifFalse:[flags bitClear: 4].