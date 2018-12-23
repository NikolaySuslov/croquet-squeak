ambient sound
stopAmbientSound
	ambientSound ifNotNil:[
		ambientSound isLoaded ifFalse:[^self].
		ambientSound pause].