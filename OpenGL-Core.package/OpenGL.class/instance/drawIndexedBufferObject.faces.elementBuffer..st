rendering
drawIndexedBufferObject: mode faces: faces elementBuffer: elementBufferObject 

	| realMode |

	realMode := forceWire ifTrue: [GLLineStrip] ifFalse: [mode].

	numVtx := numVtx + faces size.
	numPrims := numPrims + (self primCount: faces size forMode: realMode).

	self glBindBufferARB: GLElementArrayBufferARB with: elementBufferObject.

	self glDrawElements: realMode
		       with: faces byteSize
		       with: GLUnsignedInt 
		       with: nil.

	self glBindBufferARB: GLElementArrayBufferARB with: 0.

