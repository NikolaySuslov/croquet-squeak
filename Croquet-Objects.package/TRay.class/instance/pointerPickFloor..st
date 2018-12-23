picking
pointerPickFloor: frame
	
	self currentFrame: frame.
	(frame pickFloor: self) ifTrue:[
		self selectedFrame: frame.
		self selectedParent: frame parent.
		self selectedFramePosition:  self framePosition.
		self selectedTarget: frame objectOwner.
		^ true.
		].
	^ false.