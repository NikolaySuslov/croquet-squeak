private
primitiveLoadSegmentFrom: segmentWordArray outPointers: outPointerArray
	"This primitive will install a binary image segment and return as its value the array
	 of roots of the tree of objects represented.  Upon successful completion, the
	 wordArray will have been becomed into anArray of the loaded objects.  If this
	 primitive should fail, it will have destroyed the contents of the segment wordArray."

	<primitive: 99 error: ec>	"successful completion returns the array of roots"
	^nil								"failure returns nil"