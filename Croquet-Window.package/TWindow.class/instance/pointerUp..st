events
pointerUp: pointer

	windowFrame material: matNorm.
	windowFrame hiliteSection: nil.
	rectFront material: matRectNorm.
	rectBack material: matRectNorm.
	tinyCube visible: false.
	self now asFloat - lastTime > 20.0 ifTrue:[spinTime := self now asFloat - lastTime].
	(spinTime<300.0 and:[spinTime> 10.0])ifTrue:[
		self spin: lastSpin.
	].
	lastSpin := nil.
	selectedFrame = rectFront ifTrue:[
		contentsOn ifFalse:[ self openContents. ].].
