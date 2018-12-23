private
storeSegmentFor: rootsArray into: segmentWordArray outPointers: outPointerArray
	"This primitive will store a binary image segment (in the same format as the Squeak image file) of the receiver and every object in its proper tree of subParts (ie, that is not refered to from anywhere else outside the tree).  Note: all elements of the reciever are treated as roots indetermining the extent of the tree.  All pointers from within the tree to objects outside the tree will be copied into the array of outpointers.  In their place in the image segment will be an oop equal to the offset in the outpointer array (the first would be 4). but with the high bit set."

	"The primitive expects the array and wordArray to be more than adequately long.  In this case it returns normally, and truncates the two arrays to exactly the right size.  If either array is too small, the primitive will fail, but in no other case."

	<primitive: 98 error: ec>	"successful completion returns self"
	^nil							"failure returns nil"