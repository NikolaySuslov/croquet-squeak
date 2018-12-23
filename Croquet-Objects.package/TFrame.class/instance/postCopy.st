copying
postCopy
	
	super postCopy.
	localTransform := localTransform copy.
	" Only make copies ofthe frame heirarchy. Everything else stays as-is."
	frameChildren ifNotNil:[
		frameChildren := frameChildren collect:[:fc|
			fc isTexture ifTrue:[fc] ifFalse: [fc copy]
		].
	].
	^self