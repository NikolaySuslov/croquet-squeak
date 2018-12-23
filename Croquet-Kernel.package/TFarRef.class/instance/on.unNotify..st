scripting
on: eventName unNotify: anObserver
	"Relay events from my target to any observers"
	^self syncSend: #on:unNotify: withArguments: {eventName. anObserver}