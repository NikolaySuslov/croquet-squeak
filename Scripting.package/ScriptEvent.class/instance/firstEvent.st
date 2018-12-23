accessing
firstEvent
	"Answer the first (oldest) event in the chain of events"
	| evt |
	evt := self.
	[evt priorEvent == nil] whileFalse:[evt := evt priorEvent].
	^evt