accessing
contents: cont
	
	contents ifNotNil:[ " put window into a known state "
		contents = rectFront ifTrue:[
		self removeChild: rectFront.
		rectFront := saveContents.
		self addChild: rectFront.]].
	
	contents := cont.
	contents3D ifFalse:[
		contents translation: (contents translation + (Vector3 x:0 y:0 z:windowFrame radius)).].
	contentsOn := true.
	self removeChild: rectFront.
	saveContents := rectFront.
	rectFront := contents.
	contents material: matRectNorm.
	rectFront extent: windowFrame extent.
	self extent: rectFront extent asPoint.
	rectBack extent: rectFront extent asPoint.
	windowFrame extent: rectFront extent asPoint.
	self addChild: rectFront.
	windowButtons showCloseButton.
