testing
isJunction: aBool
	flags := aBool ifTrue:[flags bitOr: 2] ifFalse:[flags bitClear: 2].