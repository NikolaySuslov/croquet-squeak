scripting
on: eventName notify: anObserver
	"Relay events from my target to any observers"
	^self syncSend: #on:notify: withArguments: {eventName. anObserver}