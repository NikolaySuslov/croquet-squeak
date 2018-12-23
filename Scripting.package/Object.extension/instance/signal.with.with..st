*Scripting-Extensions
signal: eventName with: arg1 with: arg2
"Signal the occurance of anEvent. Run any handlers for the event in the context of the island they were created in. The handlers created with #runScript: will run in the current process, and are guaranteed to have completed once this method returns. The handlers created with #startScript: will be run in a new process controlled by the ScriptScheduler that created them, and wll run eventually"
	^self signalEvent: (ScriptEvent new setSender: self selector: eventName arguments: (Array with: arg1 with: arg2))