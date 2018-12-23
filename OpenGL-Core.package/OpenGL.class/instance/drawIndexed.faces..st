rendering
drawIndexed: mode faces: faces 

	| realMode |

	realMode := forceWire ifTrue: [GLLineStrip] ifFalse: [mode].

	numVtx := numVtx + faces size.
	numPrims := numPrims + (self primCount: faces size forMode: realMode).

	self 
		glDrawElements: realMode
		with: faces basicSize
		with: GLUnsignedInt 
		with: faces.

