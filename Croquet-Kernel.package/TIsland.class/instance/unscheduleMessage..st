event loop
unscheduleMessage: aMessage
	"Unschedule the given message, e.g., remove it from the message queue."
	^(self unscheduleMessageMatching:[:msg| msg == aMessage]) notNil