initialize
initialize

	super initialize.
	mutex := TMutex new.
	contactsByName := Dictionary new.
	contactsByID := Dictionary new.
	broadcastContacts := OrderedCollection new.
	
	self hostName: 'http://localhost:8080/broadcast'
	