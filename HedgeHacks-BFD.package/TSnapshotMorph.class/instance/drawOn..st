drawing
drawOn: aCanvas
	| size max scale width height form sketchForm |
	(thumbnail == snapshot form) ifFalse:[
		thumbnail := snapshot form ifNil:[^self].
		size := owner owner largeExtent.
		max := thumbnail width max: thumbnail height.
		scale := size x / max.
		width := (thumbnail width * scale) truncated.
		height := (thumbnail height * scale) truncated.
		form := Form extent: width@height depth: 16.
		thumbnail displayScaledOn: form.
		sketchForm := Form extent: size depth: form depth.
		form displayOn: sketchForm at: sketchForm extent - form extent // (2@1) rule: Form paint.
		self form: sketchForm.
	].
	super drawOn: aCanvas.
	self framesToDwell <= 0 ifTrue:[snapshot update: true].