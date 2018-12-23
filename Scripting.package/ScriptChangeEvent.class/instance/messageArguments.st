accessing
messageArguments
	"Answer the arguments to be provided for an 'inline' message dispatch."
	^Array 
		with: (self arguments at: 1) "the current value"
		with: (self firstEvent arguments at: 2) "the oldest value"