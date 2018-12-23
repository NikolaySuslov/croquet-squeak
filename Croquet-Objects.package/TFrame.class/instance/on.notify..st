events
on: eventName notify: aClient
	"Overridden to update the eventMask as needed"
	| maskBit |
	maskBit := EventMaskBits at: eventName ifAbsent:[0].
	maskBit = 0 ifFalse:[self eventMask: (eventMask bitOr: maskBit)].
	^super on: eventName notify: aClient