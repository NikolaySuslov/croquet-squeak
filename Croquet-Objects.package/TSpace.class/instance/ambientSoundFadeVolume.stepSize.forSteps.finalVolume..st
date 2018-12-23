ambient sound
ambientSoundFadeVolume: startVolume stepSize: stepSize forSteps: steps finalVolume: endVolume
	steps = 0 ifTrue: [ ambientSound volume: endVolume. ^self ].

	ambientSound volume: startVolume.

	self future: 20.0 deferRelative: 20.0
		perform: #ambientSoundFadeVolume:stepSize:forSteps:finalVolume:
		withArguments: { startVolume + stepSize . stepSize . steps - 1 . endVolume }.
