initialize
newRemoteControllerConnection

	| newConnection |
	newConnection := self connectionClass new.
	newConnection controller: self.
	newConnection eventQueue: eventQueue.
	^ newConnection