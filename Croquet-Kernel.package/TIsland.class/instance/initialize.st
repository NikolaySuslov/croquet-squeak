initialize
initialize

	super initialize.
	mutex := TMutex new.
	messageQueue := TMessageQueue new.
	time := 0.0.
	sequence := 0.
	nameMap := Dictionary new.
	self initializeRandomGenerators.
	"Setup a temporary ID for the Island so that we can process messages.
	Also, required for local islands."
	self id: (TObjectID for: self).
	"Register myself under the known NULL object ID for messages from the router"
	nameMap at: TObjectID nilObjectID put: (self asFarRef: self).