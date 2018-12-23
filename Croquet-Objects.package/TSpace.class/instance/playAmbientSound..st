ambient sound
playAmbientSound: aBool
	aBool 
		ifTrue:[self startAmbientSound] 
		ifFalse:[self stopAmbientSound].
