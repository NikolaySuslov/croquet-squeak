stepping
spin: x
	spin := x.
	spin ifNotNil:[stepping ifFalse:[self step]].

