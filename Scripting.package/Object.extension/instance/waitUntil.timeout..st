*Scripting-Extensions
waitUntil: event timeout: milliseconds
	"Wait until event was triggered, but return after the specified amount of milliseconds even if no event happened"
	^self waitUntilAnyOf: {self. event} timeout: milliseconds