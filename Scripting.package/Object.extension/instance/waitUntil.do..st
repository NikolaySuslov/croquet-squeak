*Scripting-Extensions
waitUntil: eventName do: aBlock
	"Repeatedly evaluate aBlock until the given event is signaled."
	^self waitUntil: eventName forAnyOf: #() do: aBlock