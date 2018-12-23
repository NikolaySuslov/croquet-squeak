accessing
isCarrying: aFrame

	"Query: is the avatar currently carrying the given frame?"
	
	^ carrying notNil and: [carrying frameChildren includes:aFrame].
