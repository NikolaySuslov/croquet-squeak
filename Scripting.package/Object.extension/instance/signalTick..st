*Scripting-Extensions
signalTick: eventName
	"Signal the occurance of anEvent"
	^self signalEvent: (ScriptTickEvent new setSender: self selector: eventName arguments: #())
