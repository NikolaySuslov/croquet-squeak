events
pointerDown: event

	selectedPoint := event selection point.
	tinyCube translation: selectedPoint.
	tinyCube visible: true.

	matDown ifNotNil:[
		contents material: matDown.
		].
	cameraNorm := self inverseGlobalOrientation localPointToGlobal: 
		event selection cameraTransform lookAt negated.
	selectedRadiusSquared := selectedPoint dot: selectedPoint.
	self spin: nil.
