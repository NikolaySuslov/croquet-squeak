ambient sound
ambientSoundFadeFrom: startVolume to: endVolume duration: msec
	| steps stepSize |
	steps := (msec / 20.0) asInteger.
	steps <= 0 ifTrue: [^self].
	stepSize := (endVolume - startVolume) / steps.
	stepSize = 0.0 ifTrue: [^self].

	self ambientSoundFadeVolume: startVolume stepSize: stepSize forSteps: steps finalVolume: endVolume.
