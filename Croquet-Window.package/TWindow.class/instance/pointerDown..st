events
pointerDown: event

	selectedFrame := event selection frame.
	selectedPoint := event selection point.
	selectedFrame = windowFrame ifTrue:[ 
		cameraNorm := self inverseGlobalOrientation localPointToGlobal: 
			event selection cameraTransform lookAt negated.
		eventNum := event selection index.
		selectedRadiusSquared := 
			(selectedPoint x * selectedPoint x) + (selectedPoint z * selectedPoint z).
		selectedRadius := selectedRadiusSquared sqrt.
		tinyCube translation: selectedPoint.
		tinyCube visible: true.
		cameraLookUp := event selection cameraTransform lookUp.
	] ifFalse:[ self resetEventNum.].
	windowFrame material: matDown.
	rectFront material: matRectDown.
	rectBack material: matRectDown.	

	selectedNorm := event selection normal.

	self localTransform: self localTransform.
	self spin: nil.
	lastSpin := nil.
	lastTime := self now.
	spinTime := 0.
