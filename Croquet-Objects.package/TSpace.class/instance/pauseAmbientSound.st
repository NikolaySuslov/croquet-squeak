ambient sound
pauseAmbientSound
	"this is really a fade and pause"
	ambientSound ifNil:[^self].
	self ambientSoundFadeFrom: ambientSound volume to: 0.0 duration: 1000.0.
	(self future: 1000.0) ambientSoundPauseComplete.