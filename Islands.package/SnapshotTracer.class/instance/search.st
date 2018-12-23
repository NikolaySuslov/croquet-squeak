searching
search
	"Search for a reference path to the goals"
	| todo |
	self countObjects.
	log := WriteStream on: String new.
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

	"Remove goals from marked objects again so we can find them from the internal references"
	goals do:[:each| parents removeKey: each ifAbsent:[]].

	"Setup next round for gc tracing"
	roots := ImageSegment basicNew
		loadSegmentFrom: segment copy
		outPointers: outPointers.
	roots do:[:each| parents at: each put: nil].
	todo := OrderedCollection new.
	todo addAll: roots.
	self countSegment.
	self gcTrace: todo label: 'Checkpoint failure - searching segment references...'.
	"Print reference paths to the goals"
	log cr; cr; nextPutAll: 'Inside references:'.
	goals do:[:each| self printPath: each].

false ifTrue:[
	"Check for eventual unmarked objects"
	todo := self unmarkedObjects.
	todo inspect.
].
	^log contents