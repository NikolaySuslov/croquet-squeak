*Scripting-Extensions
forEach: eventName until: stopCondition do: aBlock
	"Evaluate the given block whenever eventName is triggered"
	^self forEach: eventName do: aBlock until: stopCondition queueSize: nil