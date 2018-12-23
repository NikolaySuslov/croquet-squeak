scripts
signalEvent: anEvent
	"Signal the occurance of anEvent"
	| sndr |
	super signalEvent: anEvent.
	myProperties ifNotNil:[
		sndr := myProperties player ifNil:[^nil].
		anEvent setSender: sndr.
		sndr signalEvent: anEvent.
	].