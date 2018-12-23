painting
repaint: aForm
	paintingForm ifNil:[
		paintingForm := Form extent: bounds extent depth: 32.
	] ifNotNil:[
		paintingForm fillColor: Color transparent.
	].
	aForm displayOn: paintingForm at: (paintingForm extent - aForm extent // 2).
	self changed.