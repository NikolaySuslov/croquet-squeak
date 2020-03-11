*Croquet-Kernel-Objects
asTObjectID
	^(TObjectID new: self size)
		replaceFrom: 1 to: self size with: self startingAt: 1;
		yourself