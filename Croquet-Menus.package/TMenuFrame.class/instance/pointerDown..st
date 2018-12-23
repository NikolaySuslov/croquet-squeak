events
pointerDown: event
	event selection frame == labelFrame ifTrue:[
		selectedPoint := event selection point.
		cameraNorm := self inverseGlobalOrientation localPointToGlobal: 
			event selection cameraTransform lookAt negated.
	].