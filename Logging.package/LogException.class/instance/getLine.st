accessing
getLine
	| ctx oc |
	oc  := OrderedCollection new..
	ctx := self privGetContext.

	"Note: The following is an open-coded version of ContextPart>>stackOfSize: 
	since this method may be called during a low space condition and we  
	might run out of space for allocating the full stack."
	[ctx == nil]
		whileFalse: 
			[oc add:  (ctx asString).
			ctx := ctx sender].
	^ oc