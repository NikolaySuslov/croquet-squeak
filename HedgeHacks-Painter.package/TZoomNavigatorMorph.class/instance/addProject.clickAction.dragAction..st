project items
addProject: project clickAction: clickAction dragAction: dragAction
	| size thumb max scale width height form sketchForm sketch |
	size := self largeExtent.
	thumb := project thumbnail.
	thumb ifNil:[thumb := (Form extent: 128@96 depth: 16) fillWhite].
	max := thumb width max: thumb height.
	scale := size x / max.
	width := (thumb width * scale) truncated.
	height := (thumb height * scale) truncated.
	form := Form extent: width@height depth: 16.
	thumb displayScaledOn: form.
	sketchForm := Form extent: size depth: form depth.
	form displayOn: sketchForm at: sketchForm extent - form extent // (2@1) rule: Form paint.
	self drawName: project name on: sketchForm.
	sketch := SketchMorph withForm: sketchForm.
	self addItem: sketch dragAction: dragAction clickAction: clickAction.