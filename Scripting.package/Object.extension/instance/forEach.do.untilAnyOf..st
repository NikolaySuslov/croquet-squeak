*Scripting-Extensions
forEach: eventName do: aBlock untilAnyOf: stopEvents
	^self waitUntilAnyOf: stopEvents forEach: eventName do: aBlock