accessing
terminateScript
	eventSpec ifNotNil:[
		1 to: eventSpec size by: 2 do:[:i|
			(eventSpec at: i) on: (eventSpec at: i+1) unNotify: self.
		].
		eventSpec := nil].
	receiver privateRemoveScript: self.
	receiver signal: #scriptStatusChanged with: selector.