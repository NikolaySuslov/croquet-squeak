ambient sound
resumeAmbientSound
	| volume |
	ambientSound ifNil:[^self].
	volume := 0.8.
	ambientSound reset.
	ambientSound volume: 0.
	ambientSound resumePlaying.
	self ambientSoundFadeFrom: 0.0 to: volume duration: 1000.0.
