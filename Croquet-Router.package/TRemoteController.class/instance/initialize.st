initialize
initialize
	super initialize.
	sentCounter := 0.
	sentMessages := Dictionary new.
	latencyStats := Bag new.
	messageStats := Bag new.
	connection := self newRemoteControllerConnection. 
	connection networkQueue: networkQueue.
	connection facets: facets.
	connections := OrderedCollection with: connection.
	status := #closed. "Need to connect"