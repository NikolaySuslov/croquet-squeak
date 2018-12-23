private
lockRefsDuring: aBlock
	"Probably want to do this better some time down the road but we need to lock 
	(e.g., strongly hold onto) all far refs in order to force them being outPointers.
	If we don't, then a far ref might be traced by the IS mechanism below and we
	find the value of the far ref in the outPointers (or not even anything!).
	LATER: Consider whether IS mechanism is really what we want here. Might be
	much easier to markAndTrace island explicitly given the known boundaries of
	#passByIdentity:, method literal, and far ref. Might even be faster..."
	| farRefLock symbolLock |
	farRefLock := FarRef allInstances.
	farRefLock. "fake usage"

	"Same for symbols"
	symbolLock := Symbol allSymbols.
	symbolLock. "fake usage"

	^aBlock value.