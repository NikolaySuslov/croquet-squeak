*Scripting-Extensions
forEach: eventName do: aBlock
	"Evaluate aBlock whenever the event is triggered."
	^self forEach: eventName do: aBlock until: [false] queueSize: nil