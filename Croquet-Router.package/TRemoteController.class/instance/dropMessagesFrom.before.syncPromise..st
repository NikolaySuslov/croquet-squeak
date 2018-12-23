actions
dropMessagesFrom: newIsland before: newTime syncPromise: syncPromise
	"Drop incoming network messages from newIsland appearing before newTime"
	| nextMsg |
	[nextMsg := networkQueue nextOrNil.
	nextMsg == nil] whileFalse:[
		nextMsg time > newTime ifTrue:[
			"This is the first 'real' message arriving."
			newIsland send:[:obj| obj decodeScheduleAndExecute: nextMsg]. "execute it"
			self island: newIsland. "install island"
			syncPromise resolve: island. "signal success"
			^nil]. "done"
		"otherwise, silently skip the message"
	].
	"This is ugly but it prevents executing #dropMessages needlessly with 100% load"
	(Delay forMilliseconds: 100) wait.
	"Note: We cannot just pull the early messages out of the queue since this method is run via the controller's event loop and the same event loop will deliver the incoming messages. Therefore, sitting in an infinite loop here will deadlock so we must post the message to be processed later."
	eventQueue nextPut: (MessageSend 
		receiver: self 
		selector: #dropMessagesFrom:before:syncPromise:
		arguments: (Array with: newIsland with: newTime with: syncPromise)).
