testing
isTerminal: aBool
	flags := aBool ifTrue:[flags bitOr: 8] ifFalse:[flags bitClear: 8].