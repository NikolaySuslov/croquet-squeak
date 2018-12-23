private events
on: eventName notify: observer
	"Allow transparent forwarding of events from the replica for a simpler programming model"
	(replica isFarRef and:[replica isResolved]) ifTrue:[
		replica on: eventName notify: self.
	].
	^super on: eventName notify: observer.