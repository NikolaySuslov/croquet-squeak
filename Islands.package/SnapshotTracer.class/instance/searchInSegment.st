searching
searchInSegment
	"Setup next round for gc tracing"
	| todo |
	self countSegment.
	log ifNil:[log := WriteStream on: String new].
	roots := ImageSegment basicNew
		loadSegmentFrom: segment copy
		outPointers: outPointers.
	parents := IdentityDictionary new: objCount.
	roots do:[:each| parents at: each put: nil].
	outPointers do:[:each| parents at: each put: nil].
	todo := OrderedCollection new.
	todo addAll: roots.
	self gcTrace: todo label: 'Checkpoint failure - searching segment references...'.
	"Print reference paths to the goals"
	log cr; cr; nextPutAll: 'Inside references:'.
	goals do:[:each| self printPath: each].
	^log contents