events
on: eventName unNotify: aClient
	"Overridden to update the eventMask as needed"
	| maskBit newMask |
	super on: eventName unNotify: aClient.
	maskBit := EventMaskBits at: eventName ifAbsent:[0].
	maskBit = 0 ifFalse:["Reconstruct eventMask"
		newMask := 0.
		self myEventMap ifNotNilDo:[:map| map keysDo:[:evtName|
			newMask := newMask bitOr: (EventMaskBits at: evtName ifAbsent:[0])]].
		self eventMask: newMask.
	].