registry
unregister: anObject
	"exports is a weak dictionary, but nameMap is forever.
	Until we have garbage collection, we need a way to manually remove stuff.
	One example is #makePointer, which is just used in the dynamic extent of an event handler.
	"
	nameMap removeKey: (self asFarRef: anObject) myName ifAbsent: ["@@@@supicious"].
