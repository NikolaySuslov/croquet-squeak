private events
on: eventName unNotify: observer
	"Allow transparent forwarding of events from the replica for a simpler programming model"
	(replica isFarRef and:[replica isResolved]) ifTrue:[
		replica on: eventName unNotify: self.
	].
	^super on: eventName unNotify: observer