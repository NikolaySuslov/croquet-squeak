*Croquet-Copier
swapEndianness
	(self class isBytes or:[self class isPointers])
		ifFalse:[Bitmap swapBytesIn: self from: 1 to: self basicSize]