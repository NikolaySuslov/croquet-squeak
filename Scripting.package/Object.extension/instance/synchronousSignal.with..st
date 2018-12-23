*Scripting-Extensions
synchronousSignal: eventName with: arg1
"Signal the occurance of anEvent. Run any handlers for the event in the context of the island they were created in. The handlers will run in the current process, and are guaranteed to have completed once this method returns, regardless of whether they were created with #startScript: or #runScript:"
	^self signalSynchronousEvent: 
		(ScriptEvent new 
			setSender: self 
			selector: eventName
			arguments: (Array with: arg1))