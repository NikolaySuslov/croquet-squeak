driving
controlPitch: cp

	controlPitch ~= cp ifTrue:[
		controlPitch := cp.
		replica future controlPitch: controlPitch.
	].
