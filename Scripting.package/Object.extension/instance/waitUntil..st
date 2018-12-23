*Scripting-Extensions
waitUntil: eventName
	"Wait until an event with the given name is signaled.
	[ar 3/14/2004] Something is wrong with the semantics here. While it is perfectly fine for a player to wait until something happens inside himself, e.g., 'self waitUntil: #mouseDown', it seems Very Wrong Indeed to ask another player to 'container waitUntil: #mouseDown' since it isn't the container who is waiting but rather the sender of the request. 
	So what might be a good representation for this? We know it's always the sender who is waiting and never the guy initiating the event... maybe self waitUntil: #mouseDown in: container? Or even 'self waitUntil: container's mouseDown'? Grrrrr... so how do we distinguish the name of some event from the name of a method???"
	| script |
	^(script := Processor activeProcess)
		observe: {self. eventName}
		semaphore: nil 
		buffer: nil
		during:[:handler|
			script waitProcessOn: handler semaphore.
			handler nextEvent
		]