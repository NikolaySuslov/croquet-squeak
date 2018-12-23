initialize
setupHandle: aTForm

	| holder handle newMem |

	aTForm invalidate: aTForm boundingBox.
	holder := WordArray new: 1.
	ogl glGenTextures: 1 with: holder.
	handle := OGLTextureHandle new.
	handle objectID: aTForm objectID.
	handle glID: (holder at: 1).
	handle scaledSize: aTForm trueExtent.
	handle timeStamp: ogl timeStamp.
	newMem := handle scaledSize area * 4.
	aTForm bMipmap ifTrue:[newMem := newMem + (newMem // 3)].
	handle bytesUsed: newMem.
	memUsed := memUsed + newMem.
	memFrame := memFrame + newMem.
	^handle.
