*Scripting-Extensions
forEach: eventName do: aBlock until: stopName
	^self waitUntil: stopName forEach: eventName do: aBlock