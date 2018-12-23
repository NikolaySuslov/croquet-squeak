accessing
rectBack: rect
	self removeChild: rectBack.
	rectBack := rect. 		
	rectBack extent: windowFrame extent asPoint.
	rectBack location: (Vector3 x:0.0 y:0.0 z: windowFrame radius negated).
	rectBack flip: true.
	rectBack material: matRectNorm.
	rectBack objectName: 'rectBack'.
	self addChild: rectBack.

