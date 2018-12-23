ambient sound
startAmbientSound
	ambientSound ifNotNil:[
		ambientSound isLoaded ifFalse:[^self].
		ambientSound resumePlaying].