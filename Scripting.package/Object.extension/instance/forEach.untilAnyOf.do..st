*Scripting-Extensions
forEach: loopEvents untilAnyOf: stopEvents do: aBlock
	^self waitUntilAnyOf: stopEvents forEach: loopEvents do: aBlock