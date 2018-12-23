testing
isTerminated
	"Answer whether the receiver is terminated. Also include regular finishing via #isDone"
	^self isDone or:[super isTerminated]