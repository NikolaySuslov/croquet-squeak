initialize
initialize
	super initialize.
	status := #invalid. "default - subclasses should change status if appropriate"
	senderID := TObjectID for: self.
	AccessProtect critical:[Registry at: senderID put: self].
	mutex := TMutex new.
	eventQueue := SharedQueue new.
	networkQueue := SharedQueue new.
	facets := Dictionary new.
	self startEventLoop.
