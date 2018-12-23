*Scripting-Extensions
waitUntil: stopEvent forEach: loopEvent do: aBlock
	^self waitUntil: stopEvent forEach: loopEvent in: self do: aBlock