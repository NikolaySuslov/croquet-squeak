searching
searchInSystem
	"Search for a reference path to the goals"
	| todo |
	self countObjects.
	log ifNil:[log := WriteStream on: String new].
	parents := IdentityDictionary new: objCount.
	parents at: roots put: nil.
	roots do:[:each| parents at: each put: nil].
	parents at: self put: nil. "avoid tracing me"
	todo := OrderedCollection new.

	"Prepare a number of good roots"
	context ifNotNil:[
		parents at: context put: nil.
		todo add: context.
	].
	Smalltalk allClassesDo:[:cls| 
		parents at: cls put: nil.
		todo add: cls.
	].
	parents at: Smalltalk specialObjectsArray put: nil.
	todo add: Smalltalk specialObjectsArray.

	"GC mark all objects outside"
	self gcTrace: todo label: 'Checkpoint failure - searching image references...'.
	"Print reference paths to the goals"
	log cr; cr; nextPutAll: 'Outside references:'.
	goals do:[:each| self printPath: each].

	^log contents