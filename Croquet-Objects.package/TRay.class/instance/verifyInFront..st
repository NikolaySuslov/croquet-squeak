picking
verifyInFront: sp

	^((framePosition - sp) dot: framePointer row3)> 0.0.
