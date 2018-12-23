initialize
swapBuffers
	"Swap the receiver's buffers. Return true if successful, false otherwise"
	noSwap ifTrue:[noSwap := false. ^ self.].
	^(self primSwapBuffers: handle) notNil