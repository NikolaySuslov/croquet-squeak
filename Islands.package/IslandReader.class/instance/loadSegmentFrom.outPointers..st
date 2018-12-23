private
loadSegmentFrom: segmentWordArray outPointers: outPointerArray
	"This primitive will install a binary image segment and return as its value the array of roots of the tree of objects represented.  Upon successful completion, the wordArray will have been transmuted into an object of zero length.  If this primitive should fail, it will have destroyed the contents of the segment wordArray."

	| obj roots lastObject |
	obj := segmentWordArray.
	lastObject := segment nextObject.
	lastObject == 0 ifTrue:[lastObject := Object new].
	roots := self primitiveLoadSegmentFrom: segmentWordArray outPointers: outPointerArray.
	"in Spur object order is not guaranteed, but segmentWordArray is become'd into an array holding all objects"
	segmentWordArray class == Array
		ifTrue: [self startUpAll: segmentWordArray]
		ifFalse: [self startUpFrom: obj to: lastObject].
	^roots