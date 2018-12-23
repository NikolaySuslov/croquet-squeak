private
proxyDebuggerMessages
	"Answer whether we should proxy messages sent via the debugger and/or inspector. Generally this should be the case as ANY messages should be passed to the island but that makes it very hard to debug the messaging level. This hook allows us to either disable all of the messages sent during debugging or alternatively, just those for specific objects."
	^true