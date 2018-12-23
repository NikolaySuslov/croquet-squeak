ambient sound
switchToAmbientSoundFrom: prevSpace
	(self future: 1000.0) resumeAmbientSound.
	prevSpace pauseAmbientSound.