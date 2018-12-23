ambient sound
ambientSoundPlaying
	ambientSound ifNotNil:[^ambientSound isPlaying.].
	^ false.
